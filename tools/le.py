"""Encode EPB's Linear Executable loader and ordered page relocations."""

from dataclasses import dataclass
from hashlib import sha256
from struct import pack, pack_into

PAGE = 4096
STUB_SIZE = 0x2C90
STUB_HASH = "85b7aced897b9709164c3083ee68b9d164a643a452647d6ed615f54b93fe2fd2"


@dataclass(frozen=True)
class Span:
    name: str
    offset: int
    payload: bytes
    fixups: tuple = ()


def order_page(records, permutation, page_index):
    records.sort(key=lambda record: record[2])
    if permutation is not None:
        indices = [i for first, count in permutation for i in range(first, first + count)]
        if sorted(indices) != list(range(len(records))):
            raise ValueError(f"Invalid relocation permutation on page {page_index + 1}")
        return [records[i] for i in indices]

    # Watcom writes the most recently allocated relocation block first.
    blocks = [[]]
    used = 0
    for record in records:
        size = 9 if record[1] == 16 else 7
        if used + size > 512:
            blocks.append([])
            used = 0
        blocks[-1].append(record)
        used += size
    return [record for block in reversed(blocks) for record in block]


def pack_relocation_pages(layout, spans, order):
    objects = layout["objects"]
    page_count = sum(obj[4] for obj in objects)
    payload_end = (page_count - 1) * PAGE + layout["lastPage"]
    object_starts = {obj[3] - 1 for obj in objects}
    pages = [[] for _ in range(page_count)]
    for span in spans:
        for site, kind, flags, obj, target in span.fixups:
            # The final initialized page can end inside a zero-extended operand.
            at_end = span.offset + len(span.payload) == payload_end
            width = 3 if at_end and kind == 7 and target < 0x1000000 else 4
            if not isinstance(site, int) or site < 0 or site + width > len(span.payload):
                raise ValueError(f"{span.name} relocation lies outside its section")
            page, source = divmod(span.offset + site, PAGE)
            pages[page].append((kind, flags, source, obj, target))
            if source > PAGE - 4:
                if page + 1 >= page_count or page + 1 in object_starts:
                    raise ValueError(f"{span.name} relocation crosses an object boundary")
                pages[page + 1].append((kind, flags, source - PAGE, obj, target))
    return [order_page(records, order.get(str(i)), i) for i, records in enumerate(pages)]


def loader(stub, layout, pages):
    if len(stub) != STUB_SIZE or sha256(stub).hexdigest() != STUB_HASH:
        raise ValueError("Expected the shared EPB DOS stub")
    objects = layout["objects"]
    page_count = sum(obj[4] for obj in objects)
    if len(pages) != page_count:
        raise ValueError("Incorrect relocation page count")

    header = bytearray(0xC4)
    object_table = b"".join(pack("<6I", *obj) for obj in objects)
    page_map = b"".join(pack(">I", page << 8) for page in range(1, page_count + 1))
    names = b"\x04game\0\0\0\0"
    names_at = len(header) + len(object_table) + len(page_map)
    offsets_at = names_at + len(names)

    offsets = bytearray(4)
    records = bytearray()
    for i, page in enumerate(pages, 1):
        for kind, flags, source, obj, target in page:
            if kind not in (7, 8) or flags not in (0, 16) or not (
                -3 <= source < PAGE and 1 <= obj <= len(objects)
            ):
                raise ValueError(f"Unsupported relocation on page {i}")
            fmt = "<BBhBI" if flags == 16 else "<BBhBH"
            records.extend(pack(fmt, kind, flags, source, obj, target))
        offsets.extend(pack("<I", len(records)))

    records_at = offsets_at + len(offsets)
    imports_at = records_at + len(records)
    end = imports_at + 1
    payload_at = (len(stub) + end + 511) // 512 * 512
    fields = {
        0x00: 0x454C, 0x08: 0x10002, 0x10: 0x200,
        0x14: page_count, 0x18: 1, 0x1C: layout["entry"], 0x20: 3, 0x24: objects[2][0],
        0x28: PAGE, 0x2C: layout["lastPage"], 0x30: end - offsets_at, 0x38: end - len(header),
        0x40: len(header), 0x44: len(objects), 0x48: len(header) + len(object_table),
        0x50: names_at, 0x58: names_at, 0x5C: offsets_at - 1, 0x68: offsets_at,
        0x6C: records_at, 0x70: imports_at, 0x78: imports_at, 0x80: payload_at, 0x94: 3,
    }
    for offset, value in fields.items():
        pack_into("<I", header, offset, value)
    padding = bytes(payload_at - len(stub) - imports_at)
    return b"".join((stub, header, object_table, page_map, names, offsets, records, padding))

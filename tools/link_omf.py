"""Link pinned OMF sections into payload spans and LE relocation sites."""
import hashlib
from pathlib import Path
import struct

from le import PAGE, Span

from omf_fixups import read_externals, read_fixups
from omf_sections import read_object

INPUTS = Path(__file__).resolve().parent / "inputs"
STARTUP_HASH = "9ca09fa62ddd3ecaa4975e24bd529020f970ed84312692061c95edc9afec4ffb"


def load_module(path, digest):
    blob = path.read_bytes()
    if hashlib.sha256(blob).hexdigest() != digest:
        raise ValueError(f"Unexpected OMF input {path.name}")
    sections, publics = read_object(blob)
    return sections, publics, read_externals(blob), read_fixups(blob)


def link_section(row, module, objects):
    sections, publics, externals, operands = module
    section = row["section"]
    address = row["address"]
    owner = row["object"]
    base = objects[owner - 1][1]
    bindings = row["bindings"]
    payload = bytearray(sections[section]["data"])
    if len(payload) != row["size"]:
        raise ValueError("Unexpected section size")
    for index, offset, symbol in publics:
        if index == section and symbol in bindings and bindings[symbol] != [owner, address + offset - base]:
            raise ValueError(f"Unexpected public binding for {symbol}")
    linked = {}
    for fixup in operands:
        if fixup.segment != section:
            continue
        if fixup.location != 9 or fixup.width != 4 or fixup.target[0] not in (0, 2):
            raise ValueError("Unsupported OMF operand")
        method, index = fixup.target
        symbol = externals[index] if method == 2 else "@segment:" + sections[index]["name"]
        target_object, target_base = bindings[symbol]
        offset = fixup.offset
        addend = struct.unpack_from("<i", payload, offset)[0] + fixup.displacement
        target = (target_base + addend) & 0xFFFFFFFF
        site = address + offset
        if fixup.relative and target_object == owner:
            value = base + target - (site + 4)
        else:
            kind = 8 if fixup.relative else 7
            linked[site] = (kind, 16 if target > 0xFFFF else 0, target_object, target)
            value = 0 if fixup.relative else target
        struct.pack_into("<I", payload, offset, value & 0xFFFFFFFF)
    return payload, linked


def link_inputs(manifest, objects, target):
    modules = {}
    for row in manifest["targets"][target]:
        digest = row["sha256"]
        entry = manifest["inputs"][digest]
        if digest not in modules:
            modules[digest] = load_module(INPUTS / "omf" / entry["file"], digest)
        payload, linked = link_section(row, modules[digest], objects)
        address = row["address"]
        end = address + len(payload)
        size, base, _, first, count, _ = objects[row["object"] - 1]
        offset = (first - 1) * PAGE + address - base
        if not base <= address < end <= base + min(size, count * PAGE):
            raise ValueError(f"Section outside object at {address:#x}")
        records = tuple((site - address, *record) for site, record in linked.items())
        yield Span(f"{entry['member']} section {row['section']}", offset, bytes(payload), records)


def link_startup(version):
    sections, _, externals, operands = load_module(INPUTS / "watcom-startup.obj", STARTUP_HASH)
    code = sections[1]["data"]
    entry = version["entry"]
    bindings = version["bindings"]
    fixups = {}
    for fixup in operands:
        method, index = fixup.target
        if fixup.segment != 1 or fixup.location != 9 or fixup.width != 4 or method not in (0, 2):
            raise ValueError("Unsupported startup OMF operand")
        symbol = externals[index] if method == 2 else f"@segment:{index}"
        if symbol not in bindings:
            raise ValueError(f"Missing startup symbol {symbol}")
        obj, base = bindings[symbol]
        site = fixup.offset
        addend = struct.unpack_from("<i", code, site)[0] + fixup.displacement
        target = base + addend
        if fixup.relative:
            if obj != 1:
                raise ValueError("Expected an internal startup call")
            struct.pack_into("<i", code, site, target - (entry + site + 4))
        else:
            struct.pack_into("<I", code, site, target)
            fixups[site] = (site, 7, 16 if target > 0xFFFF else 0, obj, target)
    yield Span("null code", 0, bytes(sections[3]["data"]))
    yield Span("startup", entry, bytes(code), tuple(fixups.values()))

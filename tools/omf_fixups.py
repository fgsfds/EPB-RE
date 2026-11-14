"""Decode OMF FIXUPP fields for discovery, without performing linkage.

Absolute frames/targets and fixups into iterated data are unsupported.
Thread definitions persist across records within one object module.
"""
from dataclasses import dataclass


METAWARE_386 = b"\x80\xaa80386"


class Reader:
    def __init__(self, data):
        self.data, self.pos = data, 0

    def number(self, width=1):
        if self.pos + width > len(self.data):
            raise ValueError('Truncated OMF field')
        value = int.from_bytes(self.data[self.pos:self.pos+width], 'little')
        self.pos += width
        return value

    def index(self):
        value = self.number()
        return ((value & 127) << 8) | self.number() if value & 128 else value

    def name(self):
        size = self.number()
        if self.pos + size > len(self.data):
            raise ValueError('Truncated OMF name')
        value = self.data[self.pos:self.pos+size].decode('ascii')
        self.pos += size
        return value


@dataclass(frozen=True)
class Fixup:
    segment: int
    offset: int
    width: int
    location: int
    relative: bool
    frame: tuple
    target: tuple
    displacement: int


WIDTHS = {0: 1, 1: 2, 2: 2, 3: 4, 4: 1, 5: 2, 9: 4, 11: 6, 13: 4}


def datum(reader, method, frame):
    if method in (0, 1, 2):
        return method, reader.index()
    if frame and method in (4, 5):
        return method, None
    raise ValueError(f'Unsupported OMF {"frame" if frame else "target"} method {method}')


def decode(data, big, context, threads, metaware_386=False):
    reader = Reader(data)
    result = []
    while reader.pos < len(data):
        op = reader.number()
        if not op & 128:
            if op & 32:
                raise ValueError('Reserved THREAD bit')
            frame = bool(op & 64)
            method = (op >> 2) & (7 if frame else 3)
            threads[frame, op & 3] = datum(reader, method, frame)
            continue
        location = (op >> 2) & 15
        if metaware_386 and location == 5:
            # MetaWare uses location 5 for a 32-bit offset.
            location = 9
        if location not in WIDTHS:
            raise ValueError('Unsupported fixup location')
        offset = ((op & 3) << 8) | reader.number()
        flags = reader.number()
        try:
            if flags & 128:
                if flags & 64:
                    raise ValueError('Reserved frame thread bit')
                frame = threads[True, (flags >> 4) & 3]
            else:
                frame = datum(reader, (flags >> 4) & 7, True)
            target = (threads[False, flags & 3] if flags & 8
                      else datum(reader, flags & 3, False))
        except KeyError as error:
            raise ValueError('Undefined OMF thread') from error
        displacement = 0 if flags & 4 else reader.number(4 if big else 2)
        if context is None:
            raise ValueError('FIXUP without LEDATA')
        seg, start, size = context
        if offset + WIDTHS[location] > size:
            raise ValueError('FIXUP exceeds LEDATA')
        result.append(Fixup(seg, start+offset, WIDTHS[location], location,
                            not bool(op & 64), frame, target, displacement))
    return result


def read_fixups(blob):
    offset, context = 0, None
    threads, result = {}, []
    iterated = False
    metaware_386 = False
    while offset < len(blob):
        header = Reader(blob[offset:offset+3])
        kind, size = header.number(), header.number(2)
        end = offset + 3 + size
        if size < 1 or end > len(blob):
            raise ValueError('Truncated OMF record')
        if blob[end-1] and sum(blob[offset:end]) & 255:
            raise ValueError('Invalid OMF checksum')
        data = blob[offset+3:end-1]
        if kind == 0x88 and data == METAWARE_386:
            metaware_386 = True
        elif kind in (0xa0, 0xa1):
            iterated = False
            reader = Reader(data)
            seg = reader.index()
            start = reader.number(4 if metaware_386 or kind & 1 else 2)
            context = seg, start, len(data)-reader.pos
        elif kind in (0x9c, 0x9d):
            if iterated:
                raise ValueError('Fixups into LIDATA are unsupported')
            result.extend(decode(data, metaware_386 or bool(kind & 1), context, threads, metaware_386))
        elif kind in (0xa2, 0xa3):
            iterated = True
            context = None
        elif kind in (0x8a, 0x8b):
            iterated = False
            context = None
            threads.clear()
        offset = end
    return result


def read_externals(blob):
    """Read shared EXTDEF/LEXTDEF index space for a single ordinary object."""
    offset, names = 0, [None]
    while offset < len(blob):
        header = Reader(blob[offset:offset+3])
        kind, size = header.number(), header.number(2)
        end = offset+3+size
        if size < 1 or end > len(blob):
            raise ValueError('Truncated OMF record')
        if blob[end-1] and sum(blob[offset:end]) & 255:
            raise ValueError('Invalid OMF checksum')
        if kind in (0x8c, 0xb4, 0xb5):
            reader = Reader(blob[offset+3:end-1])
            while reader.pos < len(reader.data):
                names.append(reader.name())
                reader.index()  # type index
        elif kind in (0x8e, 0xb0, 0xb8, 0xbc):
            raise ValueError('Unsupported external-index record')
        offset = end
    return names

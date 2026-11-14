"""Read OMF sections and public symbols from ordinary object modules."""

from omf_fixups import METAWARE_386, Reader


def iterated_data(data, width, limit):
    reader = Reader(data)

    def block(available, depth):
        if depth == 32:
            raise ValueError("OMF LIDATA nesting exceeds supported depth")
        repeats, children = reader.number(width), reader.number(2)
        if children:
            parts = bytearray()
            for _ in range(children):
                parts.extend(block(available - len(parts), depth + 1))
        else:
            size = reader.number()
            parts = reader.data[reader.pos:reader.pos + size]
            if len(parts) != size:
                raise ValueError("Truncated OMF LIDATA literal")
            reader.pos += size
        if len(parts) * repeats > available:
            raise ValueError("LIDATA exceeds segment")
        return parts * repeats

    payload = bytearray()
    while reader.pos < len(data):
        payload.extend(block(limit - len(payload), 0))
    return payload


def index(data, offset):
    value = data[offset]
    if value & 128:
        return ((value & 127) << 8) | data[offset+1], offset+2
    return value, offset+1


def read_object(blob):
    names = ['']
    segments = [None]
    publics = []
    offset = 0
    metaware_386 = False
    while offset < len(blob):
        kind = blob[offset]
        length = int.from_bytes(blob[offset+1:offset+3], 'little')
        end = offset+3+length
        if length < 1 or end > len(blob):
            raise ValueError('Truncated OMF record')
        if blob[end-1] and sum(blob[offset:end]) & 255:
            raise ValueError('Invalid OMF checksum')
        data = blob[offset+3:end-1]
        if kind == 0x88 and data == METAWARE_386:
            # MetaWare 386 OMF retains the even record types with 32-bit offsets.
            metaware_386 = True
        elif kind == 0x96:
            cursor = 0
            while cursor < len(data):
                size = data[cursor]
                names.append(data[cursor+1:cursor+1+size].decode('ascii'))
                cursor += size+1
        elif kind in (0x98, 0x99):
            cursor = 1
            if data[0] >> 5 == 0:
                cursor += 3
            width = 4 if metaware_386 or kind & 1 else 2
            size = int.from_bytes(data[cursor:cursor+width], 'little')
            cursor += width
            name, cursor = index(data, cursor)
            cls, cursor = index(data, cursor)
            segments.append(dict(name=names[name], cls=names[cls], data=bytearray(size)))
        elif kind in (0xa0, 0xa1, 0xa2, 0xa3):
            seg, cursor = index(data, 0)
            width = 4 if metaware_386 or kind & 1 else 2
            start = int.from_bytes(data[cursor:cursor+width], 'little')
            payload = data[cursor+width:]
            if kind in (0xa2, 0xa3):
                payload = iterated_data(payload, width, len(segments[seg]['data']) - start)
            if start+len(payload) > len(segments[seg]['data']):
                raise ValueError('LEDATA exceeds segment')
            segments[seg]['data'][start:start+len(payload)] = payload
        elif kind in (0x90, 0x91):
            group, cursor = index(data, 0)
            seg, cursor = index(data, cursor)
            if seg == 0:
                cursor += 2
            width = 4 if metaware_386 or kind & 1 else 2
            while cursor < len(data):
                size = data[cursor]
                name = data[cursor+1:cursor+1+size].decode('ascii')
                cursor += size+1
                address = int.from_bytes(data[cursor:cursor+width], 'little')
                cursor += width
                type_index, cursor = index(data, cursor)
                publics.append((seg, address, name))
        offset = end
    return segments, publics

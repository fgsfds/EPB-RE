"""Build and verify both pinned DOS releases of Extreme Paintbrawl."""

import argparse
from hashlib import sha256
import json
from pathlib import Path
import re
from struct import iter_unpack
import subprocess
import sys
from tempfile import TemporaryDirectory

from le import PAGE, Span, loader, pack_relocation_pages
from link_omf import INPUTS, link_inputs, link_startup

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"


def assemble(nasm, scratch, source, defines):
    output = scratch / f"{source}.bin"
    subprocess.run(
        [nasm, "-f", "bin", *(f"-D{name}={value}" for name, value in defines.items()),
         SRC / f"{source}.asm", "-o", output],
        check=True,
    )
    return output.read_bytes()


def game_data_spans(nasm, scratch, data_offset, update):
    defines = {"UPDATE": int(update)}
    strings = assemble(nasm, scratch, "game_strings", defines)
    if len(strings) != (0x3D70 if update else 0x3D4C):
        raise ValueError("Game string size differs")
    yield Span("game strings", data_offset, strings)

    tables = assemble(nasm, scratch, "game_tables", defines)
    table_size = 9916 if update else 9800
    if len(tables) < table_size or (len(tables) - table_size) % 8:
        raise ValueError("Game table output size differs")
    fixups = tuple((site, 7, 0, 3, target) for site, target in iter_unpack("<II", tables[table_size:]))
    table_offset = 0x7BEC if update else 0x7BC8
    yield Span("game tables", data_offset + table_offset, tables[:table_size], fixups)

    literals = assemble(nasm, scratch, "library_literals", {})
    if len(literals) != 178:
        raise ValueError("Library literal size differs")
    # Offsets in object 3 (retail and update), length, and source offset.
    for retail, patched, size, start in (
        (0x4023, 0x4047, 133, 0),
        (0x76F0, 0x7714, 128, 5),
        (0x7A12, 0x7A36, 18, 133),
        (0x7B3D, 0x7B61, 27, 151),
    ):
        yield Span("library literals", data_offset + (patched if update else retail),
                   literals[start:start + size])


def hardware_span(nasm, scratch, version):
    size, _, _, first, _, _ = version["objects"][1]
    data_base, fpu_offset = version["hardwareBase"], version["fpuOffset"]
    payload = assemble(nasm, scratch, "hardware", {"DATA_BASE": data_base, "FPU_OFFSET": fpu_offset})
    if len(payload) != size:
        raise ValueError("Hardware size differs")
    operands = [
        (10, 0), (15, 4), (32, 4), (38, 0), (44, 8), (49, 12),
        *((site, fpu_offset) for site in (70, 77, 86, 94, 105, 112, 120)),
        (135, fpu_offset + 18), (195, fpu_offset + 2), (201, fpu_offset + 6),
        (207, fpu_offset + 10), (213, fpu_offset + 14),
    ]
    fixups = tuple((site, 7, 16, 3, data_base + offset) for site, offset in operands)
    return Span("hardware", (first - 1) * PAGE, payload, fixups)


def runtime_spans(nasm, scratch, objects, sections):
    for section in sections:
        _, base, _, first, _, _ = objects[section.get("object", 1) - 1]
        offset = (first - 1) * PAGE + section["address"] - base
        source = section["source"]
        payload = assemble(nasm, scratch, source, section["bindings"])
        if len(payload) != section["size"]:
            raise ValueError(f"{source} size differs")
        obj = section.get("pointerTable")
        if obj is None:
            fixups = tuple(section["relocations"])
        else:
            if len(payload) % 4 or not 1 <= obj <= len(objects):
                raise ValueError(f"Invalid pointer table in {source}")
            fixups = tuple(
                (i * 4, 7, 16 if target > 0xFFFF else 0, obj, target)
                for i, (target,) in enumerate(iter_unpack("<I", payload))
            )
        yield Span(source, offset, payload, fixups)


def build(nasm, scratch, target, version, sections, zero_fill, order, manifest):
    objects = version["objects"]
    update = target == "update"
    data_offset = (objects[2][3] - 1) * PAGE
    spans = sorted([
        *link_startup(version),
        hardware_span(nasm, scratch, version),
        *game_data_spans(nasm, scratch, data_offset, update),
        *(Span("zero fill", offset, bytes(size)) for offset, size in zero_fill),
        *runtime_spans(nasm, scratch, objects, sections),
        *(Span("inter-object padding", (first - 1) * PAGE + size, bytes(count * PAGE - size))
          for size, _, _, first, count, _ in objects[:-1]),
        *link_inputs(manifest, objects, target),
    ], key=lambda span: span.offset)

    payload_size = (sum(obj[4] for obj in objects) - 1) * PAGE + version["lastPage"]
    end = 0
    for span in spans:
        if span.offset != end or end + len(span.payload) > payload_size:
            raise ValueError(f"Discontinuous or out-of-bounds payload at {span.name}")
        end += len(span.payload)
    if end != payload_size:
        raise ValueError("Payload is incomplete")

    pages = pack_relocation_pages(version, spans, order)
    prefix = loader((INPUTS / "dos-stub.bin").read_bytes(), version, pages)
    binary = b"".join([prefix, *(span.payload for span in spans)])
    if len(binary) != version["size"]:
        raise ValueError(f"Size mismatch: expected {version['size']}, got {len(binary)}")
    digest = sha256(binary).hexdigest()
    if digest != version["sha256"]:
        raise ValueError(f"SHA-256 mismatch: expected {version['sha256']}, got {digest}")
    return binary


def bundled_nasm():
    for entry in (INPUTS.parent / "inputs.sha256").read_text(encoding="ascii").splitlines():
        match = re.fullmatch(r"([0-9a-f]{64})  (.+)", entry)
        if match is None:
            raise ValueError(f"Invalid checksum entry: {entry}")
        expected, relative_path = match.groups()
        if sha256((INPUTS / relative_path).read_bytes()).hexdigest() != expected:
            raise ValueError(f"SHA-256 mismatch: {relative_path}")
    return INPUTS / "nasm" / "nasm.exe"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--nasm", type=Path, help="path to an alternative NASM executable")
    args = parser.parse_args()
    if args.nasm:
        nasm = args.nasm.resolve()
    else:
        nasm = bundled_nasm() if sys.platform == "win32" else "nasm"

    versions = json.loads((INPUTS / "versions.json").read_text(encoding="utf-8"))
    runtime = json.loads((INPUTS / "runtime-layout.json").read_text(encoding="utf-8"))
    zero_fill = json.loads((INPUTS / "zero-fill.json").read_text(encoding="utf-8"))
    order = json.loads((INPUTS / "relocation-order.json").read_text(encoding="utf-8"))
    manifest = json.loads((INPUTS / "omf" / "layout.json").read_text(encoding="utf-8"))

    outputs = {}
    with TemporaryDirectory(prefix="epb-re-") as directory:
        for target, version in versions.items():
            try:
                outputs[target] = build(
                    nasm, Path(directory), target, version, runtime[target],
                    zero_fill[target], order[target], manifest,
                )
            except (OSError, ValueError, subprocess.CalledProcessError) as error:
                parser.exit(1, f"{target}: {error}\n")

    for target, binary in outputs.items():
        output = ROOT / "out" / target / "GAME.EXE"
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_bytes(binary)
        print(f"{target}: verified {len(binary)} bytes, SHA-256 {versions[target]['sha256']}")


if __name__ == "__main__":
    main()

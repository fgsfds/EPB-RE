# Reconstruction

## Reference builds

| Version | CRC32 | File size | LE payload offset | LE relocation records |
| --- | --- | ---: | ---: | ---: |
| Retail 1.0 | `D6CC00A8` | 1,008,031 | `0x40800` | 28,620 |
| 1.01 / 1.1 / 1.91 | `4228EC31` | 993,855 | `0x40000` | 28,383 |

The pinned sizes and hashes were measured from `engine/game.exe` in
the archive folders `retail-1.0` and `patched-1.91`. The latter contains
the executable shared by the 1.01, 1.1, and 1.91 releases.
[Binary archive](https://github.com/fgsfds/dos-build-exe-archive/tree/0b485f334a592f2db66b2eec7520f0751278e1cb/binaries/extreme-paintbrawl)

## Build inputs

The build uses NASM sources under [src/](../src) and the Python linker and
manifests under [tools/](../tools).

- [versions.json](../tools/inputs/versions.json) pins executable hashes, object layouts,
  entry points, and startup bindings.
- [runtime-layout.json](../tools/inputs/runtime-layout.json) places assembled game and
  runtime sections and supplies their version-specific bindings and
  relocations. The linker derives jump-table relocations from the entries.
- [The OMF layout](../tools/inputs/omf/layout.json) records member hashes, provenance,
  placement, and bindings for historical Build Engine, audio, input, and
  Watcom objects. Audio and input members come from the Redneck Rampage
  archives. `tools/inputs/watcom-startup.obj` is the Watcom C/C++ 10.5 DOS
  `CLIB3R.LIB` member `cstrt386`.
- `tools/inputs/dos-stub.bin` matches the first `0x2c90` bytes of Watcom C/C++
  11.0c `BINW/WLINK.EXE`. These matches establish the provenance of the
  supplied objects and stub. The original toolchain version for every
  game object remains unknown.
- [zero-fill.json](../tools/inputs/zero-fill.json) gives payload offsets and sizes for
  zero-filled ranges. [relocation-order.json](../tools/inputs/relocation-order.json)
  gives zero-based page indices and source-order permutations.
- [tools/inputs/nasm](../tools/inputs/nasm) contains the Windows NASM 3.02 binary
  and its [BSD 2-Clause license](../tools/inputs/nasm/LICENSE).
- [tools/inputs.sha256](../tools/inputs.sha256) pins the vendored NASM files.
  CI checks it from `tools/inputs`.

## LE layout

Both executables use 4 KiB pages and three LE objects. The first object
contains game and engine code. The first Build Engine section starts at
object-relative offset `0x4cc0e` in retail and `0x4a0ce` in the update.
The 221-byte second object contains RDTSC timing, x87 precision setup,
and gameport polling code. The third object contains initialized data,
including game strings, lookup tables, and runtime startup entries.

A relocation operand spanning pages gets a record on each page, with a
signed negative offset on the second. The final initialized page ends
three bytes into a four-byte operand whose high byte is zero. Most pages
match when source-ordered records are packed into blocks of up to 512
bytes and the blocks are written in reverse order. Four retail pages and
five update pages use the explicit permutations in the relocation-order
manifest.

# Exact build and verification

Install Python 3.10 or later. The build uses the Python standard library
and NASM. Windows uses the bundled NASM 3.02. On other platforms, install
NASM and put it on your PATH.

Run this command from the repository root:

```sh
python tools/build_epb.py
```

The verifier checks both the size and SHA-256 of each build against
the [pinned values](../tools/inputs/versions.json) measured from the originals.
It writes the verified executables to `out/retail-1.0/GAME.EXE` and
`out/update/GAME.EXE`. The build requires no original executable.

To select a different NASM executable, run
`python tools/build_epb.py --nasm /path/to/nasm`.

On Windows, the script checks the bundled [NASM files](../tools/inputs.sha256)
before using them. [GitHub Actions](../.github/workflows/build.yml) runs the
same command with Python 3.12 on pushes.
The OMF linker checks each object member against its pinned SHA-256 before
linking it. See the [reconstruction notes](reconstruction.md#build-inputs)
for the input layouts and provenance.

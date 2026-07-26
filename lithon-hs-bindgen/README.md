# lithon-hs-bindgen

The single entrypoint to the vendored [hs-bindgen](https://github.com/well-typed/hs-bindgen).

## Rules

- **Only this package may build-depend on `hs-bindgen`.** Everything else goes
  through `Lithon.HsBindgen`. The seam is cabal-enforced: importing
  `HsBindgen.*` elsewhere fails to compile.
- Widening the surface has two ledgers: this package's exports, and the
  `reexported-modules` vendor patch carried on the fork's
  `lithon/vendor-patches` branch (jtnuttall/hs-bindgen), one commit atop the
  upstream pin.

## Vendored sources

`vendor/` holds git submodules pinned to exact revisions:

- `hs-bindgen` — jtnuttall fork, branch `lithon/vendor-patches` (upstream
  `well-typed/hs-bindgen` main + the re-export patch)
- `libclang-bindings`, `c-expr` — upstream well-typed repos at the SHAs
  hs-bindgen's own `cabal.project.base` pins
- `doxygen-parser` — jtnuttall fork, branch `lithon/vendor-patches`,
  carrying the vendor patches atop the SHA hs-bindgen pins

Building `libclang-bindings` requires `LLVM_PATH` pointing at a prefix with
`lib/libclang.so` and `include/clang-c/`; the flake devshell exports it.

## aeson note

hs-bindgen pins `aeson <2.3` while lithon requires `^>=2.3` (the CVE-fix
line); the root `cabal.project` carries a scoped `allow-newer:
hs-bindgen:aeson` until the bound is widened on the vendor branch.

# lithon-hs-bindgen

The single entrypoint to the vendored [hs-bindgen](https://github.com/well-typed/hs-bindgen).

## Rules

- **Only this package may build-depend on `hs-bindgen`.** Everything else goes
  through `Lithon.HsBindgen`. The seam is cabal-enforced: importing
  `HsBindgen.*` elsewhere fails to compile.
- Widening the surface has two ledgers: this package's exports, and the
  `reexported-modules` vendor patch set carried on the fork's
  `lithon/vendor-patches-2` branch (jtnuttall/hs-bindgen).

## Vendored sources

`vendor/` holds git submodules pinned to exact revisions:

- `hs-bindgen` — jtnuttall fork, branch `lithon/vendor-patches-2` (upstream
  `well-typed/hs-bindgen` `release-1.0.0.0` + the lithon patch set)
- `c-expr` — upstream well-typed repo, pinned to its `release-0.2.0.0` tag
- `doxygen-parser` — jtnuttall fork, branch `lithon/vendor-patches`: upstream
  `well-typed/doxygen-parser` `main` at `6c12988` (not yet released; the latest
  release is 0.1.2), which already has the Doxyfile `ALIASES` support, plus one
  patch, `de2f7e0` (parameter-name extraction from all descendant text);
  hs-bindgen 1.0 itself depends on the Hackage `doxygen-parser >=0.1 && <0.2`

`libclang-bindings` is no longer a submodule: it is a
`source-repository-package` pin in the root `cabal.project`, at tag
`release-0.2.0.0`.

Building `libclang-bindings` requires `LLVM_PATH` pointing at a prefix with
`lib/libclang.so` and `include/clang-c/`; the flake devshell exports it.

## aeson note

hs-bindgen pins `aeson <2.3` while lithon requires `^>=2.3` (the CVE-fix
line); the root `cabal.project` carries a scoped `allow-newer:
hs-bindgen:aeson` until the bound is widened on the vendor branch.

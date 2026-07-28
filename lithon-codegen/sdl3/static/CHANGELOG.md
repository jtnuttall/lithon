# Changelog — sdl3-bindgen-sys

## 0.0.0.2 - 2026-07-26

Documentation-only patch.

### Changed

- README: per-platform install list in Quick start and a
  `Windows set up` section.
- Add @oddron as a contributor.

Thanks to @oddron in the Haskell GameDev Discord for giving the library
a try on Windows!

## 0.0.0.1 - 2026-07-26

Initial release.

- Raw bindings (`SDL3.Sys.Bindgen.*`) and the curated alias layer
  (`SDL3.Sys.*`) for the SDL 3.4 API, generated from the SDL 3.4.2
  headers by a modified `hs-bindgen`.
- Builds and runs against any SDL >= 3.2.0. Newer declarations are gated
  by SDL3's version macros and error with `SDL_GetError` when not
  available.
- Per-function safe/unsafe curation with rationales.
- Curated module docs lead with each header's SDL category overview.
- Build flags:
  - `strict-data` (default on) - apply `StrictData` to generated modules
    unconditionally.
  - `strict` (default off) - **experimental** - apply `Strict` to generated
    modules unconditionally. Caveat emptor: I have not yet verified that
    this does not break correctness guarantees for the bindgen runtime.
  - `optimize` (default on) - compile the library with -O2. Meaningful
    improvement in interface file quality.
  - `optimize-aggressively` (default off) - release-mode; forces GHC to apply
    very expensive optimizations to the library.
- Supported platforms:
  - 64-bit Linux - hand-verified, my host dev machine is NixOS
  - macOS aarch64 - CI-verified, I do not develop on macOS in my free time
  - Windows MSYS2/UCRT64 - CI-verified, I do not develop on Windows in my
    free time either
- ABI static assertions (`cbits/abi_assertions.c`, cabal flag
  `abi-assertions`, default on): enforce that the building system's SDL
  headers match the layouts `hs-bindgen` built in.

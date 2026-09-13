# Changelog — sdl3-bindgen-sys

## Unreleased

### Added

- Cabal flag `abi-assertions-exact` (default off): asserts every `sizeof`
  exactly, including the union-member structs the default checks as a
  prefix. For maintainers checking the bindings against a newer SDL;
  consumers should leave it off.

### Fixed

- Builds against SDL 3.4.16, where `SDL_PenProximityEvent` gained a
  `pen_state` member, and against every SDL back to 3.2.0: the member is
  gated on SDL's version macros in the ABI assertions (below 3.4.16 it
  reads bytes SDL never wrote; see the README's semantic deltas).

### Changed

- ABI assertions: structs that are read only inside a named union
  (e.g. `SDL_Event` or `SDL_HapticEffect`) are now checked as a prefix
  of the total layout instead of an exact check. Field offsets and
  alignments are enforced, but `sizeof` is allowed to increase. The union's
  size renders this safe, since Haskell must allocate enough room for the whole
  union, and we still enforce that it is sized equivalently.
- ABI assertions: below SDL 3.2.12, `SDL_MouseWheelEvent`'s pre-growth
  layout (48 bytes, 8-aligned) is asserted instead of nothing.
- ABI assertion messages state the SDL version the bindings were
  generated from and how to report or fix a mismatch.
- README: `ABI verification` section (every assertion message pointed
  at it; it did not exist).
- README: a native Windows `cabal` recipe (Git Bash against MSYS2
  UCRT64) next to the Stack one, as reported working by a user.
- README: correct the function-like macro caveat. hs-bindgen translates
  macro bodies to Haskell functions on a best-effort basis; 31 of SDL's
  function-like macros already ship in the raw `SDL3.Sys.Bindgen.*`
  layer (the curated layer does not alias them yet, and pending
  hs-bindgen#2184 they take C integer types rather than SDL newtypes),
  and the rest are unbound rather than unbindable.
- README: attribute the variadic gap to Haskell's FFI rather than to
  hs-bindgen.

Thanks to the hs-bindgen team for the correction on [r/haskell](https://www.reddit.com/r/haskell/comments/1v960p9/ann_sdl3bindgensys_machinegenerated_lowlevel/)
and for their [survey of SDL's macros](https://github.com/dschrempf/hs-bindgen-sdl-survey).

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

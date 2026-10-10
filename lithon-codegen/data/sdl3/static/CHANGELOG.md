# Changelog — sdl3-bindgen-sys

## Unreleased

Breaking (PVP major; release as 0.0.1.0): `SDL3.Sys.Stdinc` drops the 151
function aliases released in 0.0.0.3 (the libc clones; the raw bindings are
unchanged), and `log` is now `SDL_Log`'s shim, not the math function.

### Added

- `sDL_memcpy`, `sDL_memmove` and `sDL_memset` in
  `SDL3.Sys.Bindgen.Stdinc.*` (raw-only, like the rest of the C library
  clones: see Changed). `SDL_stdinc.h` `#define`s `SDL_memcpy` as
  libc's `memcpy` (likewise the other two) unless `SDL_SLOW_MEMCPY` is set,
  and hs-bindgen drops a function that a same-name macro shadows. The
  generator now sets `SDL_SLOW_MEMCPY`, `SDL_SLOW_MEMMOVE` and
  `SDL_SLOW_MEMSET`, so the declarations stay and bind to SDL's own
  functions.
- Typed constants for 29 macros hs-bindgen cannot translate, each typed at
  its C type (its newtype, or `Word64` for `size_t`) and exported from the
  curated module of that type:
  - `SDL3.Sys.Stdinc`: the sixteen `SDL_MAX_*` and `SDL_MIN_*` limits of
    `Sint8` through `Uint64` (`SDL_MIN_SINT8`, `SDL_MAX_UINT64`, ...),
    `SDL_MAX_TIME` and `SDL_MIN_TIME` (`SDL_Time`), and `SDL_SIZE_MAX`,
    `SDL_ICONV_ERROR`, `SDL_ICONV_E2BIG`, `SDL_ICONV_EILSEQ` and
    `SDL_ICONV_EINVAL`, which are `Word64` (the `size_t` constants).
  - `SDL3.Sys.Audio`: `SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK` and
    `SDL_AUDIO_DEVICE_DEFAULT_RECORDING`.
  - `SDL3.Sys.Mouse`: `SDL_TOUCH_MOUSEID` and `SDL_PEN_MOUSEID`.
  - `SDL3.Sys.Touch`: `SDL_MOUSE_TOUCHID` and `SDL_PEN_TOUCHID`.
- ABI assertions for the 29 constants.
- C shims: 57 fixed-arity C functions over what the FFI cannot call, in
  `include/sdl3-bindgen-sys/SDL_*_shims.h` (one header per SDL header,
  raw bindings in `SDL3.Sys.Bindgen.*Shims`), exported from the module of
  the header they extend under a new `C shims` section and named like what
  they wrap. See the README's `C shims` section.
  - Variadic functions, taking the message verbatim, never as a format
    string: `log` (`SDL_Log`), `logTrace`, `logVerbose`,
    `logDebug`, `logInfo`, `logWarn`, `logError`, `logCritical`,
    `logMessage` in `SDL3.Sys.Log`; `setError` in `SDL3.Sys.Error`;
    `ioPrintf` in `SDL3.Sys.Iostream`.
  - Function-like macros: `unsupported`, `invalidParamError`
    (`SDL3.Sys.Error`); `fourCC` (`SDL3.Sys.Stdinc`); `secondsToNs`,
    `msToNs`, `usToNs` (`SDL3.Sys.Timer`); `swap16`, `swap32`, `swap64` and
    the `LE`/`BE` swaps of 16, 32 and 64 bits and of floats
    (`SDL3.Sys.Endian`); `createThread`, `createThreadWithProperties`
    (`SDL3.Sys.Thread`), which pass the C runtime's thread entry and exit
    functions on Windows like SDL's macros do; `mustLock`
    (`SDL3.Sys.Surface`); `atomicIncRef`, `atomicDecRef`
    (`SDL3.Sys.Atomic`); `audioFrameSize`, `defineAudioFormat`
    (`SDL3.Sys.Audio`); and in `SDL3.Sys.Pixels`, `definePixelFourCC`,
    `bitsPerPixel`, `bytesPerPixel`, the seven `isPixelFormat*` predicates,
    `defineColorspace`, the six `colorspace*` accessors and the five
    `isColorspace*` predicates.
- The package ships the shims' headers (`extra-source-files`) and compiles
  its wrapper C with `include-dirs: include`.

### Changed

- `SDL3.Sys.Stdinc` aliases 22 functions of `SDL_stdinc.h`: SDL's own API
  there (environments, memory-function hooks, UTF-8 stepping) and the
  allocator family (`malloc`, `calloc`, `realloc`, `free`, `alignedAlloc`,
  `alignedFree`, `strdup`, `strndup`). Its other 131 functions, the C
  library clones (`strlen`, `abs`, `qsort`, `rand`, `crc32`, `iconv`, ...),
  are raw-only: the aliases 0.0.0.3 had for 128 of them are gone, and the
  `memcpy` family is new and raw-only. Their raw imports stay in
  `SDL3.Sys.Bindgen.Stdinc.*` (`sDL_strlen`). Its types and typed constants
  are unchanged.
- `log` is `SDL_Log`'s C shim. It was the math `SDL_log`, now raw-only
  (`sDL_log`).
- README: `SDL3.Sys.Stdinc`'s allowlist.
- README: the `C shims` section, and the variadic functions and
  function-like macros it binds are no longer listed as unbound.
- README: "What is not bound" is shorter: it points at the hs-bindgen
  team's survey of SDL's macros, says what differs here, lists the rest in
  one paragraph, and links the skip ledger.
- Regenerated with hs-bindgen 1.0.0.0.
- Raw modules (`SDL3.Sys.Bindgen.*`): each foreign import sits behind a
  wrapper that converts argument by argument through `HasFFIType` and keeps
  the original C signature; structs gain `IsStruct` instances; every module
  is `NoImplicitPrelude` with an explicit `Prelude` import list.
- Writing a union member through `setField` of its
  `GHC.Records.Compat.HasField` instance (`SDL_Event`, `SDL_HapticEffect`, ...)
  now has `payload -> union -> union` semantics: it copies the existing bytes,
  then pokes the member. It used to write into a fresh uninitialised byte
  array.
- The vendored runtime is updated to hs-bindgen-runtime 1.0.0.0, with
  matching `SDL3.Sys.Bindgen.Runtime.*` facades. New modules: `HasFFIType`,
  `Macro`, `Overloading`, `Struct`. Removed: `Support.FFIType`,
  `Support.HasFFIType`. They were private (no facade), so no consumer could
  import them.
- `template-haskell >= 2.19` for the vendored runtime.
- `SDL3.Sys.Stdinc` and `log` break, as above. Every other pre-existing
  module keeps its exported names, signatures and export list, apart from
  the additions above and names added to the runtime facades; the raw
  foreign imports changed only internally.

## 0.0.0.3 - 2026-09-13

### Added

- Cabal flag `abi-assertions-exact` (default off): asserts every `sizeof`
  exactly, including the union-member structs the default checks as a
  prefix. For maintainers checking the bindings against a newer SDL;
  consumers should leave it off.

### Fixed

- ABI check fixed for every SDL from 3.2.0 to 3.4.16. In 3.4.16,
  `SDL_PenProximityEvent` gained a new `pen_state` member, which caused
  the previous (stricter) ABI check to fail on the new version.

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

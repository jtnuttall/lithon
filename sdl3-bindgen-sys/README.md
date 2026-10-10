# sdl3-bindgen-sys

Fully automated, luxury low-level Haskell bindings to [SDL3](https://libsdl.org):
the whole SDL 3.4 API, machine-generated from the headers using an
ever-so-slightly hacked version of `hs-bindgen`.

This package gets you SDL3 in full — windowing, input, audio, and the
newfangled [GPU API](https://wiki.libsdl.org/SDL3/CategoryGPU) — today,
if you dare.

CI runs against **64-bit Linux, macOS, and Windows**, which is what
this package aims to support.

This library aims to be:

- **Complete by construction:** Generated from all 58 headers of the
  SDL 3.4 API (328 modules, 33 of them the C shims'), so a gap is either a
  code generation bug or a [deliberate omission](#what-is-not-bound) rather
  than a binding waiting to be hand-written.
- **Curated:** The `SDL3.Sys.*` layer wraps `hs-bindgen`'s output
  with best-effort Haskell casing, native scalar types, and FFI safety
  decisions and recommendations.
- **First-class SDL docs:** Every binding carries SDL's header documentation,
  and notes from the code generator's curation layer.
- **ABI-verified:** A generated translation unit of C `_Static_assert`s
  verifies the library's baked layouts against _your_ SDL at every
  build. Divergence is a compile error naming the declaration, not
  memory corruption. See [ABI verification](#abi-verification) for more.

## Quick start

### Install build requirements

Install SDL **>= 3.2** development files where `pkg-config` can find
them. The development headers must be present, not just the shared
library.

Common setups:

- **Debian/Ubuntu**: `apt install libsdl3-dev`
- **macOS**: `brew install sdl3`
- **Arch**: `pacman -S sdl3`
- **Fedora**: `dnf install SDL3-devel`
- **Windows**: WSL2 with the Linux instructions, or native MSYS2.
  See [Windows set up](#windows-set-up)

### Set up your project

1. Add `sdl3-bindgen-sys` to `build-depends`
2. Replace the contents of `Main.hs` with:

```haskell
{-# LANGUAGE GHC2021 #-}
{-# LANGUAGE BlockArguments #-}

import Control.Monad (unless)
import Foreign.C.ConstPtr (ConstPtr (..))
import Foreign.C.String (peekCString, withCString)
import SDL3.Sys qualified as SDL3

main :: IO ()
main = do
  ok <- SDL3.init SDL3.SDL_INIT_VIDEO
  unless ok do
    err <- peekCString . unConstPtr =<< SDL3.getError
    fail ("SDL_Init: " <> err)
  window <- withCString "hello" \title ->
    SDL3.createWindow (ConstPtr title) 640 480 0
  SDL3.delaySafe 2000
  SDL3.destroyWindow window
  SDL3.quit
```

For more examples and templates, see
[`lithon-examples`](https://github.com/jtnuttall/lithon/tree/main/lithon-examples)
in the repository:

- `sdl3-raw` is a minimal triangle with an event loop
- `shmup` is a playable `apecs` game running on and rendering through
  these bindings

### Windows set up

There are two ways to set this up that I am aware of. In order of
convenience:

#### WSL2

The Linux instructions apply unchanged. Under WSLg an SDL window
displays like any Linux app.

#### Native (MSYS2)

Install build dependencies:

```sh
pacman -Syyu # repeat/restart terminal if pacman asks you to
pacman -S mingw-w64-ucrt-x86_64-sdl3 mingw-w64-ucrt-x86_64-pkgconf
```

> [!NOTE]
> The UCRT64 pkgconf is required. MSYS2 `pkg-config` reports POSIX-style
> paths that GHC can't use on Windows.

##### Stack users

> [!IMPORTANT]
> Stack users need some additional setup.
>
> Adjust the library version in `extra-deps` to your desired target.

1. Run the `pacman` commands above through `stack exec -- pacman ...` so
   that the packages are installed in `stack`'s MSYS2.
2. Add `msys-environment: UCRT64` to your `stack.yaml`.
3. Add `sdl3-bindgen-sys-0.0.0.3` to `extra-deps` in your `stack.yaml`. Running
   `stack build` should print out a helpful, pasteable entry for
   this purpose.

Your `stack.yaml` should look something like this:

```yaml
snapshot: lts-24.51
packages:
  - .
extra-deps:
  - sdl3-bindgen-sys-0.0.0.3 # hash may be here if you copy from stack build
msys-environment: UCRT64 # important: build will not work without this
```

##### Direct cabal build using an MSYS2 Bash session (e.g., Git Bash)

This can additionally be used with Git bash. You can point `cabal` at the
UCRT64 toolchain and your ghcup GHC:

```sh
export PKG_CONFIG_PATH="/c/msys64/ucrt64/lib/pkgconfig"
export PATH="/c/msys64/ucrt64/bin:$PATH"
cabal build \
  --with-compiler=/c/ghcup/ghc/9.12.2/bin/ghc.exe \
  --extra-lib-dirs=/c/msys64/ucrt64/lib \
  --extra-include-dirs=/c/msys64/ucrt64/include
```

Adjust the GHC path to match your install. This provides a simple way to build
and run the examples.

## Library structure

For most uses, you will `import SDL3.Sys qualified as SDL3`.
`SDL3.Sys` re-exports one module per SDL header.

The raw hs-bindgen output lives underneath as `SDL3.Sys.Bindgen.*`, if
you need to drop down to C types.

`SDL3.Sys.Stdinc` is the one curated module that leaves functions out.
It aliases SDL's own API in `SDL_stdinc.h` (environments, memory-function
hooks, UTF-8 stepping) and the allocator family (`malloc`, `free`,
`strdup`, ...), for memory SDL frees or hands you to free. The rest of
the header is a C library for C programs: strings, character classes,
math, sorting, random numbers, checksums, `iconv`, and `memcpy`,
`memmove` and `memset`. Haskell has its own, so those are raw-only:
`SDL3.Sys.Bindgen.Stdinc.Unsafe.sDL_strlen` and friends. The module's
typed constants all stay, `SDL_ICONV_ERROR` and the other `iconv`
results included. The registry records the header's function count, so
an SDL release that adds functions fails generation until the list is
reviewed.

### Safe and unsafe FFI

Most functions come in both FFI flavors: `createWindow` is an `unsafe`
foreign import; `createWindowSafe` is the `safe` one.

General rules for safe vs. unsafe FFI:

- You _must_ use a `safe` call if C will call back into Haskell.
- You _should_ use a `safe` call if the C call could take a while (e.g.,
  waiting on some OS event, or a locking mechanism, etc.).
- You _should_ use an `unsafe` call if the C call is fast; `unsafe`
  calls block the current GHC thread (capability) and the garbage
  collector, but their overhead is very low compared to `safe` calls.

### Typed constants

SDL declares its flag and constant vocabularies as `typedef UintN`
plus `#define`s, an association C never states, so binding generators
cannot recover it.

The curated layer restores this information from an explicit
registry maintained alongside the generator.

Similar to the `vulkan` library, every group member is a pattern synonym
typed at its newtype, e.g. `SDL_INIT_VIDEO :: SDL_InitFlags`.

A constant lives with its type, wherever SDL declares the macro:
`SDL_TOUCH_MOUSEID` is an `SDL_MouseID`, so it is in `SDL3.Sys.Mouse`,
not with `SDL_touch.h`'s other names. This includes macros hs-bindgen
cannot translate (casts to typedef names, token pasting, or libc
macros), which exist only here: the limits (`SDL_MIN_SINT8`,
`SDL_MAX_TIME`, ...), the default audio devices, and the mouse and
touch ids. The `size_t` constants (`SDL_SIZE_MAX`, `SDL_ICONV_ERROR`,
...) are `Word64`.

You can combine bitmask groups with `.|.` from `Data.Bits`:

```haskell
SDL3.init (SDL3.SDL_INIT_VIDEO .|. SDL3.SDL_INIT_AUDIO)
```

### C shims

Haskell's FFI cannot call a variadic C function, and a function-like
macro has no symbol to call at all. For the useful ones, this package
ships small C functions of its own, in
`include/sdl3-bindgen-sys/SDL_*_shims.h`, which are bound like any SDL
header. Each module exports its shims in a **C shims** section, named
like what they wrap: `SDL_LogMessage` is `logMessage`, and `SDL_MUSTLOCK`
is `mustLock`.

- **Messages are verbatim.** The logging, error, and stream-printing
  shims take a finished string, never a printf-style format string:
  format in Haskell, and a `%` needs no escaping. After `setError` with
  `100% done`, `getError` returns `100% done`.
- **Call `createThread`, not `createThreadRuntime`.** Like SDL's
  `SDL_CreateThread` macro, the shim passes the C runtime's thread entry
  and exit functions on Windows (`_beginthreadex` and `_endthreadex`;
  `NULL` elsewhere).
- **Cost:** each shim is a `static inline` C function, so the compiler
  folds it into the wrapper the foreign import calls: one FFI call, like
  any binding. That is still a call, and an `IO` action, for what C
  computes inline (`bitsPerPixel`, `fourCC`, the byte swaps); hoist it out
  of hot loops.
- **Byte order:** use the `swap16LE` … `swapFloatBE` shims, not the raw
  layer's `sDL_Swap16LE` … `sDL_SwapFloatLE`, which hs-bindgen translated
  on the little-endian generation host as the identity.
- The raw imports are `lithon_SDL_*` in `SDL3.Sys.Bindgen.*Shims`
  (`SDL3.Sys.Bindgen.LogShims.Unsafe.lithon_SDL_LogMessage`).

The shims, by module:

- `SDL3.Sys.Atomic`: `SDL_AtomicIncRef` → `atomicIncRef`,
  `SDL_AtomicDecRef` → `atomicDecRef`
- `SDL3.Sys.Audio`: `SDL_AUDIO_FRAMESIZE` → `audioFrameSize` (takes a
  pointer to the spec), `SDL_DEFINE_AUDIO_FORMAT` → `defineAudioFormat`
- `SDL3.Sys.Endian`: `SDL_Swap16`, `SDL_Swap32`, `SDL_Swap64` → `swap16`,
  `swap32`, `swap64`; `SDL_Swap16LE` … `SDL_SwapFloatBE` → `swap16LE` …
  `swapFloatBE`
- `SDL3.Sys.Error`: `SDL_SetError` → `setError`, `SDL_Unsupported` →
  `unsupported`, `SDL_InvalidParamError` → `invalidParamError`
- `SDL3.Sys.Iostream`: `SDL_IOprintf` → `ioPrintf`
- `SDL3.Sys.Log`: `SDL_Log` → `log`, `SDL_LogTrace` … `SDL_LogCritical`
  → `logTrace` … `logCritical`, `SDL_LogMessage` → `logMessage`
- `SDL3.Sys.Pixels`: `SDL_DEFINE_PIXELFOURCC` → `definePixelFourCC`,
  `SDL_BITSPERPIXEL` → `bitsPerPixel`, `SDL_BYTESPERPIXEL` →
  `bytesPerPixel`, `SDL_ISPIXELFORMAT_INDEXED` … `SDL_ISPIXELFORMAT_FOURCC`
  → `isPixelFormatIndexed` … `isPixelFormatFourCC`,
  `SDL_DEFINE_COLORSPACE` → `defineColorspace`, `SDL_COLORSPACETYPE` …
  `SDL_COLORSPACEMATRIX` → `colorspaceType` … `colorspaceMatrix`,
  `SDL_ISCOLORSPACE_MATRIX_BT601` … `SDL_ISCOLORSPACE_FULL_RANGE` →
  `isColorspaceMatrixBT601` … `isColorspaceFullRange`
- `SDL3.Sys.Stdinc`: `SDL_FOURCC` → `fourCC`
- `SDL3.Sys.Surface`: `SDL_MUSTLOCK` → `mustLock`
- `SDL3.Sys.Thread`: `SDL_CreateThread` → `createThread`,
  `SDL_CreateThreadWithProperties` → `createThreadWithProperties`
- `SDL3.Sys.Timer`: `SDL_SECONDS_TO_NS` → `secondsToNs`, `SDL_MS_TO_NS` →
  `msToNs`, `SDL_US_TO_NS` → `usToNs`

### Conversion to and from C types

`SDL3.Sys` re-exports `SDL3.Sys.Runtime`, the conversion vocabulary
you'll actually reach for: `toBool`/`fromBool` for C-typed struct
fields (e.g. a keyboard event's `repeat`), and the `CEnum` classes for
moving between enum newtypes and their integral representations.

## Platform support

**64-bit platforms only.** Linux, macOS (aarch64, Homebrew `sdl3`), and
Windows (MSYS2 UCRT64, including the LLP64 layouts) are all targets,
and CI builds the released package on all three. 32-bit targets are
rejected by the ABI assertions — 64-bit layouts are baked in.

## Common issues

- **Blank screen or crash on macOS** — SDL's Cocoa backend requires
  video and event calls on the **process main thread**. Keep the SDL
  loop on `main` (don't `forkIO` it); `runOnMainThreadSafe` is bound for
  marshalling work onto it.
- **`init` fails on Windows** — the bindings are generated with
  `SDL_MAIN_HANDLED`: call `setMainReady` before `init`.
- **`foo` or `fooSafe`?** — every function's haddock states its flavor
  choice, and the rationale, under its **`sdl3-bindgen-sys` notes**
  section.
- **Branching on `SDL3.Sys.PlatformDefines`** — don't: its two
  constants (`sDL_PLATFORM_LINUX`, `sDL_PLATFORM_UNIX`) are baked to
  the generation host's value of `1` on every platform.
- **`setLinuxThreadPriority(AndPolicy)` off-Linux** — both exist
  everywhere but fail with an `SDL_GetError` message.

## What is not bound

The hs-bindgen team's
[survey of SDL's macros](https://github.com/dschrempf/hs-bindgen-sdl-survey)
is the reference for what hs-bindgen can and cannot translate: measured
against hs-bindgen `cf56afb3` and SDL 3.4.0-1231, it binds 1099 of SDL's
1980 macros, 31 of the 160 function-like ones. This package is generated
with hs-bindgen 1.0.0.0 against SDL 3.4.18, and the raw layer binds the
same 31. What differs here:

- Integer macro constants spelled with casts to typedef names,
  `SDL_UINT64_C`, or `SIZE_MAX`, which hs-bindgen cannot translate, reach
  you as [typed constants](#typed-constants).
- The variadic `SDL_Log` family, `SDL_SetError` and `SDL_IOprintf`, and
  the most useful function-like macros (`SDL_MUSTLOCK`, the byte swaps,
  the pixel-format and colorspace macros, `SDL_CreateThread`, ...) are
  bound through [C shims](#c-shims).
- `SDL_memcpy`, `SDL_memmove` and `SDL_memset` are bound: the generator
  sets `SDL_SLOW_MEMCPY` and friends so SDL's macros do not shadow them.

Still unbound: `SDL_RenderDebugTextFormat` (format in Haskell and use
`renderDebugText`); the printf/scanf clones and every `va_list` function;
the `SDL_assert` family and the other statement macros;
`SDL_size_mul_check_overflow` and `SDL_size_add_check_overflow`
([hs-bindgen#2097](https://github.com/well-typed/hs-bindgen/issues/2097);
the `_builtin` twins are bound); `SDL_BYTEORDER` and `SDL_FLOATWORDORDER`
(use `GHC.ByteOrder.targetByteOrder`); the `SDL_PROP_GAMEPAD_CAP_*`
aliases (use the joystick keys); the seven `long`-typed `SDL_stdinc.h`
libc clones (their FFI types cannot be right on both LP64 and LLP64);
three Windows-only interop functions (`SDL_SetWindowsMessageHook`,
`SDL_GetDirect3D9AdapterIndex`, `SDL_GetDXGIOutputInfo`). The
function-like macros hs-bindgen does bind accept only C integer types,
not SDL's newtypes, pending
[hs-bindgen#2184](https://github.com/well-typed/hs-bindgen/issues/2184)
(unwrap first).

Everything hs-bindgen skips on the generation host is in the
[skip ledger](https://github.com/jtnuttall/lithon/blob/main/lithon-codegen/data/sdl3/unbound.md),
with a disposition for each.

## Versioning

The 0.0.x series is experimental: pin to the minor
(e.g., `>=0.0.0.1 && <0.0.1`) and expect surface-shaping changes.

SDL **>= 3.2.0** is required; the surface is generated from 3.4.18.
Declarations newer than your SDL still compile and link — their wrapper
C is gated on SDL's own version macros, so calling one on an older SDL
fails at the call site via `SDL_GetError` (exactly like the Linux-only
functions off Linux). The wrapper gates and the ABI assertion layer are
driven by empirically verified availability annotations rather than
SDL's (occasionally wrong) `\since` annotations; a handful of haddock
`@since` lines therefore repeat an upstream floor that the annotations
correct — where they disagree, the annotations win, and a gated call's
`SDL_GetError` message states the true floor.

Four semantic deltas to know when running against an older SDL:

- `SDL_COLORSPACE_YUV_DEFAULT` is baked at its 3.4 value
  (`BT601_LIMITED`); 3.2 defined it as `JPEG`.
- Below SDL 3.2.12, `SDL_MouseWheelEvent.integer_x`/`integer_y` read
  bytes SDL never wrote — memory-safe (`SDL_Event` is 128 bytes), but
  meaningless.
- Below SDL 3.4.16, `SDL_PenProximityEvent.pen_state` likewise reads
  bytes SDL never wrote.
- Below SDL 3.4.18, the pen events' `device_type` (`SDL_PenProximityEvent`,
  `SDL_PenMotionEvent`, `SDL_PenAxisEvent`, `SDL_PenTouchEvent`,
  `SDL_PenButtonEvent`) likewise reads bytes SDL never wrote.

## ABI verification

The cabal flag `abi-assertions` (default) turns on ABI verification,
which guards against unexpected layout divergence between SDL3 header
versions and varying operating systems.

When ABI assertions are on, `cbits/abi_assertions.c` statically checks
every layout the Haskell side expects against your SDL headers.

### Layouts

- Most structs are asserted at their exact size. A future SDL that expects
  a bigger allocation for the struct would be an out-of-bounds memory write.
- Structs the bindings associated _solely_ with a union (like the event structs),
  are asserted as a prefix. The union's size provides the exact ceiling, so
  upstream can and will add fields in minors.

Maintainers can build with `-f abi-assertions-exact` to assert every
`sizeof` exactly. That is how a CI job against a newer SDL flags that
the bindings need regenerating; consumers should leave it off.

### What to do when you get "static assertion failed"

1. Check your SDL: `pkg-config --modversion sdl3`. SDL >= 3.2.0 is
   required
2. Make sure you are on a supported architecture. 32-bit targets are not
   presently supported (see [Platform support](#platform-support)).
3. Report it at the [issue tracker](https://github.com/jtnuttall/lithon/issues)
   with the failing lines, your SDL version, and your platform.
4. If you are comfortable doing so, open a PR regenerating the bindings
   from the newer SDL. The
   [`lithon-codegen` README](https://github.com/jtnuttall/lithon/tree/main/lithon-codegen#sdl3)
   describes the pipeline.

Building with `-f-abi-assertions` turns off the check, not the
mismatch: the bindings would then read and write the baked layout
against headers that disagree with it.

## Known documentation issues

- A few module overviews absorb the opening of the first declaration's
  documentation. Seems to be upstream — Doxygen fuses SDL's file-level
  category comments before any other tool sees them in these cases.
- Cross-header references in the raw `SDL3.Sys.Bindgen.*` docs may
  appear as plain text; the curated `SDL3.Sys.*` modules should contain
  repaired links.

## Provenance and licensing

Generated by [hs-bindgen](https://github.com/well-typed/hs-bindgen)
driven by the repository's `lithon-codegen`, from the SDL 3.4.18
headers. The generated tree is never hand-edited, but bugs are mine, not
SDL's or hs-bindgen's: report them at the
[issue tracker](https://github.com/jtnuttall/lithon/issues).

- `sdl3-bindgen-sys` is BSD-3-Clause (see `LICENSE`).
- The SDL header documentation embedded in the haddocks is covered by SDL's
  zlib license (`LICENSE_SDL`).
- The vendored hs-bindgen and c-expr runtimes are BSD-3-Clause, (c) Well-Typed LLP
  and Anduril Industries (`LICENSE_hs-bindgen-runtime`, `LICENSE_c-expr-runtime`).

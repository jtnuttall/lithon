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
  SDL 3.4 API (291 modules), so a gap is either a code generation
  bug or a [deliberate omission](#what-is-not-bound) rather than a
  binding waiting to be hand-written.
- **Curated:** The `SDL3.Sys.*` layer wraps `hs-bindgen`'s output
  with best-effort Haskell casing, native scalar types, and FFI safety
  decisions and recommendations.
- **First-class SDL docs:** Every binding carries SDL's header documentation,
  and notes from the code generator's curation layer.
- **ABI-verified:** A generated translation unit of C `_Static_assert`s
  verifies the library's baked layouts against _your_ SDL at every
  build — divergence is a compile error naming the declaration, not
  memory corruption.

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
3. Add `sdl3-bindgen-sys-0.0.0.2` to `extra-deps` in your `stack.yaml`. Running
   `stack build` should print out a helpful, pasteable entry for
   this purpose.

Your `stack.yaml` should look something like this:

```yaml
snapshot: lts-24.51
packages:
  - .
extra-deps:
  - sdl3-bindgen-sys-0.0.0.2 # hash may be here if you copy from stack build
msys-environment: UCRT64 # important: build will not work without this
```

## Library structure

For most uses, you will `import SDL3.Sys qualified as SDL3`.
`SDL3.Sys` re-exports one module per SDL header.

The raw hs-bindgen output lives underneath as `SDL3.Sys.Bindgen.*`, if
you need to drop down to C types.

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

You can combine bitmask groups with `.|.` from `Data.Bits`:

```haskell
SDL3.init (SDL3.SDL_INIT_VIDEO .|. SDL3.SDL_INIT_AUDIO)
```

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

Known gaps, so you can discover them here instead of mid-build:

- **Variadic functions**: hs-bindgen skips them, meaning the `SDL_Log`
  family, `SDL_SetError`, and `SDL_RenderDebugTextFormat` are currently
  unbound. In a future version, these will be bound via a fixed-arity
  C shim.
- **Function-like macros**: no linkable symbol exists. Macro
  _constants_ are bound; see [Typed constants](#typed-constants).
- The seven `long`-typed `SDL_stdinc.h` libc clones (`strtol`/`ltoa`
  families, `lround`/`lroundf`): their FFI types cannot be correct on
  both LP64 and LLP64, so they are omitted.
- Three Windows-only interop functions (`SDL_SetWindowsMessageHook`,
  `SDL_GetDirect3D9AdapterIndex`, `SDL_GetDXGIOutputInfo`) — niche;
  native window handles are reached through the bound
  `SDL_GetWindowProperties` keys instead.

## Versioning

The 0.0.x series is experimental: pin to the minor
(e.g., `>=0.0.0.1 && <0.0.1`) and expect surface-shaping changes.

SDL **>= 3.2.0** is required; the surface is generated from 3.4.2.
Declarations newer than your SDL still compile and link — their wrapper
C is gated on SDL's own version macros, so calling one on an older SDL
fails at the call site via `SDL_GetError` (exactly like the Linux-only
functions off Linux). The wrapper gates and the ABI assertion layer are
driven by an empirically verified availability registry rather than
SDL's (occasionally wrong) `\since` annotations; a handful of haddock
`@since` lines therefore repeat an upstream floor the registry
corrects — where they disagree, the registry wins, and a gated call's
`SDL_GetError` message states the true floor.

Two semantic deltas to know when running against a 3.2-series SDL:

- `SDL_COLORSPACE_YUV_DEFAULT` is baked at its 3.4 value
  (`BT601_LIMITED`); 3.2 defined it as `JPEG`.
- Below SDL 3.2.12, `SDL_MouseWheelEvent.integer_x`/`integer_y` read
  bytes SDL never wrote — memory-safe (`SDL_Event` is 128 bytes), but
  meaningless.

## Known documentation issues

- A few module overviews absorb the opening of the first declaration's
  documentation. Seems to be upstream — Doxygen fuses SDL's file-level
  category comments before any other tool sees them in these cases.
- Cross-header references in the raw `SDL3.Sys.Bindgen.*` docs may
  appear as plain text; the curated `SDL3.Sys.*` modules should contain
  repaired links.

## Provenance and licensing

Generated by [hs-bindgen](https://github.com/well-typed/hs-bindgen)
driven by the repository's `lithon-codegen`, from the SDL 3.4.2
headers. The generated tree is never hand-edited, but bugs are mine, not
SDL's: report them at the
[issue tracker](https://github.com/jtnuttall/lithon/issues).

- `sdl3-bindgen-sys` is BSD-3-Clause (see `LICENSE`).
- The SDL header documentation embedded in the haddocks is covered by SDL's
  zlib license (`LICENSE_SDL`).
- The vendored hs-bindgen and c-expr runtimes are BSD-3-Clause, (c) Well-Typed LLP
  and Anduril Industries (`LICENSE_hs-bindgen-runtime`, `LICENSE_c-expr-runtime`).

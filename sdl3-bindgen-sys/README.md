# sdl3-bindgen-sys

Fully automated, luxury low-level Haskell bindings to [SDL3](https://libsdl.org):
the whole SDL 3.4 API, machine-generated using `hs-bindgen`.

This package gets you SDL3 in full — windowing, input, audio, and the
newfangled [GPU API](https://wiki.libsdl.org/SDL3/CategoryGPU) — today,
if you dare.

CI runs against **64-bit Linux, MacOS, and Windows**, which is what
this package aims to support.

This library aims to be:

- **Complete by construction:** Generated from all 58 headers of the
  SDL 3.4 API, so a gap is either a code generation bug or a
  [deliberate omission](#unbound-sdl-functions-macros-and-types).
- **Haskell-native:** `SDL3.Sys` wraps `hs-bindgen`'s output with best-effort
  Haskell naming, native scalar types, and safety/usage notes.
- **First-class SDL docs:** Every binding includes SDL's header documentation.
- **ABI-verified:** A generated C file containing `_Static_assert`s verifies
  the library's layouts against your SDL at compile-time.
  See [ABI verification](#abi-verification) for more.

The 0.0.x series is experimental: **pin to the minor
(e.g., `>=0.0.1.0 && <0.0.2`)** and expect that the library will
experience minor-version breaking changes until **0.1.0.0**.

System requirements:

- **SDL >= 3.2.0**
- This version of the library was generated against **SDL 3.4.18**, so any
  version **3.2.0-3.4.18** will link and run successfully.
- The library includes `@since` annotations in Haddock. These are derived
  from SDL3's own docs.
  - If the runtime SDL is **below `@since`** for the function you are calling,
    an error will be emitted via `SDL_GetError`.
  - If the runtime SDL is **below `@since`** for a struct field in a union (e.g.,
    an SDL event), your application will read bytes SDL doesn't write at that
    location. This is memory-safe since the change stays within the union's size.
  - At this time, it's up to you to handle this. There are a few routes I
    am aware of. See [Handling runtime SDL deviation](#handling-runtime-sdl-deviation).

## Quick start

### Install build requirements

Install SDL **>= 3.2** development files where `pkg-config` can find
them. The development headers must be present, not just the shared
library.

Common setups:

- **Debian/Ubuntu**: `apt install libsdl3-dev`
- **MacOS**: `brew install sdl3`
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
3. Add `sdl3-bindgen-sys-x.x.x.x` to `extra-deps` in your `stack.yaml`. Running
   `stack build` should print out a helpful, pasteable entry for
   this purpose. (Replace `x.x.x.x` with the latest version on Hackage
   or the version you need.)

Your `stack.yaml` should look something like this:

```yaml
snapshot: lts-24.51
packages:
  - .
extra-deps:
  # replace with version you need; hash may be here if you copy from stack build
  - sdl3-bindgen-sys-x.x.x.x
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

## Common issues and use-cases

### Handling runtime SDL deviation

At this time, you can do one of the following:

- Statically link your application to SDL3 so that you ship exactly the version
  needed. This should prevent these issues structurally.
- For function calls that may not be in the runtime SDL version, check the SDL
  error and respond accordingly.
- For struct fields (in unions), check `SDL3.Sys.Version.getVersion` before deciding
  whether the bytes you read have meaning.

#### Differences on older SDLs

##### Defaults

- `SDL_COLORSPACE_YUV_DEFAULT` is `BT601_LIMITED` regardless of SDL version.
  It was `JPEG` in SDL 3.2.

##### Events

The `SDL_Event` union has size 128. None of these exceed that size, so this
read/write cycle should be memory-safe on older SDL versions, just meaningless.

- Below SDL 3.2.12, the following don't exist:
  - `SDL_MouseWheelEvent.integer_x`
  - `SDL_MouseWheelEvent.integer_y`
- Below SDL 3.4.16, the following don't exist:
  - `SDL_PenProximityEvent.pen_state`
- Below SDL 3.4.18, the following don't exist:
  - `SDL_PenProximityEvent.device_type`
  - `SDL_PenMotionEvent.device_type`
  - `SDL_PenAxisEvent.device_type`
  - `SDL_PenTouchEvent.device_type`
  - `SDL_PenButtonEvent.device_type`

### Platform support

64-bit architecture only for now. Windows, MacOS, and Linux are all tested
in CI. Linux is tested against the most recent ~3 GHC versions.

32-bit support is planned, but the implementation is still undecided.
Short-term, I may support local runs of `lithon-codegen` inside a container or VM
for this purpose, but the tool will need a bit of alteration before that's possible.

### ABI verification

The cabal flag `abi-assertions` (default) turns on ABI verification,
which guards against unexpected layout divergence between SDL3 header
versions and varying operating systems.

When ABI assertions are on, `cbits/abi_assertions.c` statically checks
every layout the Haskell side expects against your SDL headers.

### Common issues

- **Blank screen or crash on MacOS** — SDL's Cocoa backend requires
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

### Unbound SDL functions, macros, and types

The hs-bindgen team's
[survey of SDL's macros](https://github.com/dschrempf/hs-bindgen-sdl-survey)
provides a reference on what hs-bindgen couldn't translate at this library's
release. The situation has changed somewhat with the release of `1.0.0.0`.
I'll try to keep this section updated regarding the current situation.

Still unbound:

- `SDL_RenderDebugTextFormat` - format in Haskell instead.
- printf/scanf clones.
- Every `va_list` function.
- All `SDL_assert` functions and the other statement macros.
- `SDL_size_mul_check_overflow` and `SDL_size_add_check_overflow`
  ([hs-bindgen#2097](https://github.com/well-typed/hs-bindgen/issues/2097)).
- `SDL_BYTEORDER` and `SDL_FLOATWORDORDER` - use `GHC.ByteOrder.targetByteOrder`
- `SDL_PROP_GAMEPAD_CAP_*` aliases - use the joystick keys
- The `long`-typed `SDL_stdinc.h` libc clones - their FFI types cannot be right
  on both LP64 and LLP64.
- `SDL_SetWindowsMessageHook`, `SDL_GetDirect3D9AdapterIndex`, and
  `SDL_GetDXGIOutputInfo`.
- Function-like macros accept only C integer types, rather than newtypes
  ([hs-bindgen#2184](https://github.com/well-typed/hs-bindgen/issues/2184)).
  You'll have to unwrap the newtype manually.

Everything hs-bindgen skips on the generation host should be recorded in the
[skip ledger](https://github.com/jtnuttall/lithon/blob/main/lithon-codegen/data/sdl3/unbound.md),
with a disposition for each.

## Library structure

For most uses, you will `import SDL3.Sys qualified as SDL3`.
`SDL3.Sys` re-exports one module per SDL header.

The raw hs-bindgen output lives underneath as `SDL3.Sys.Bindgen.*`, if
you need to drop down to C types.

`SDL3.Sys.Stdinc` leaves functions out by design. It selects a subset of
SDL's API without including utilities meant generally for C programs.
If you require these, you can access them through `SDL3.Sys.Bindgen.Stdinc.*`.
If there are glaring omissions, please open an issue.

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

Constants exist alongside their types.

You can combine bitmask groups with `.|.` from `Data.Bits`:

```haskell
SDL3.init (SDL3.SDL_INIT_VIDEO .|. SDL3.SDL_INIT_AUDIO)
```

### C shims

The library provides a series of wrappers for variadic SDL functions
and function-like macros.

Each module exports its shims in a **C shims** section, named after what
the function wraps: `SDL_LogMessage` is `logMessage`, and `SDL_MUSTLOCK`
is `mustLock`.

Notes:

- Messages are verbatim. `printf`-style format strings aren't supported.
- Call `createThread`, not `createThreadRuntime`. The former handles
  cross-platform threading appropriately.
- Each shim is a `static inline` C function.
- Byte order: use the `swap16LE` … `swapFloatBE` shims instead of the raw layer's
  `sDL_Swap16LE` ... `sDL_SwapFloatLE`, which hs-bindgen translated
  on the little-endian generation host as the identity.
- The raw imports are `lithon_SDL_*` in `SDL3.Sys.Bindgen.*Shims`
  (`SDL3.Sys.Bindgen.LogShims.Unsafe.lithon_SDL_LogMessage`).

### Conversion to and from C types

`SDL3.Sys` re-exports `SDL3.Sys.Runtime`, the conversion vocabulary
you'll actually reach for: `toBool`/`fromBool` for C-typed struct
fields (e.g. a keyboard event's `repeat`), and the `CEnum` classes for
moving between enum newtypes and their integral representations.

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
driven by the repository's `lithon-codegen`, from the SDL3 headers.
Be keen on treating bugs as mine, not SDL's or hs-bindgen's, and report them to
the project's [issue tracker](https://github.com/jtnuttall/lithon/issues).

- `sdl3-bindgen-sys` is BSD-3-Clause (see `LICENSE`).
- The SDL header documentation embedded in the haddocks is covered by SDL's
  zlib license (`LICENSE_SDL`).
- The vendored hs-bindgen and c-expr runtimes are BSD-3-Clause, (c) Well-Typed LLP
  and Anduril Industries (`LICENSE_hs-bindgen-runtime`, `LICENSE_c-expr-runtime`).

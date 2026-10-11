# mpv-bindgen-sys

Low-level, machine-generated Haskell bindings to [libmpv](https://mpv.io), the
library behind the mpv media player.

libmpv makes it relatively easy to add video playback support to your
application without implementing it from scratch.

This package aims to support **64-bit Linux, MacOS, and Windows**.

Most of what you do with libmpv goes through options, commands, and
properties, which the [mpv manual](https://mpv.io/manual/stable/)
documents.

## Quick start

### Install build requirements

Install libmpv development files for **client API >= 2.0** (i.e., mpv 0.35 or
newer). `pkg-config --modversion mpv` prints the client API version.

The development headers must be present.

Common setups:

- **Debian/Ubuntu**: `apt install libmpv-dev`
- **MacOS**: `brew install mpv`
- **Arch**: `pacman -S mpv`
- **Fedora**: `dnf install mpv-devel`
- **Windows**: WSL2 with the Linux instructions, or native MSYS2.
  See [Windows set up](#windows-set-up)

### Set up your project

1. Add `mpv-bindgen-sys` to `build-depends`
2. Replace the contents of `Main.hs` with:

```haskell
{-# LANGUAGE GHC2021 #-}
{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE OverloadedRecordDot #-}

import Control.Monad (unless, when)
import Foreign.C.ConstPtr (ConstPtr (..))
import Foreign.C.String (peekCString, withCString)
import Foreign.Ptr (nullPtr)
import Foreign.Storable (peek)
import Mpv.Sys.Client qualified as Mpv

main :: IO ()
main = do
  mpv <- Mpv.create
  when (mpv == nullPtr) (fail "mpv_create failed")
  check "vo" =<< withCString "vo" \name -> withCString "null" \value ->
    Mpv.setOptionString mpv (ConstPtr name) (ConstPtr value)
  check "initialize" =<< Mpv.initializeSafe mpv
  check "loadfile" =<< withCString "loadfile video.mkv" \cmd ->
    Mpv.commandString mpv (ConstPtr cmd)
  let loop = do
        event <- Mpv.waitEventSafe mpv (-1)
        eventId <- peek event.event_id
        case eventId of
          Mpv.MPV_EVENT_END_FILE -> pure ()
          Mpv.MPV_EVENT_SHUTDOWN -> pure ()
          _ -> loop
  loop
  Mpv.terminateDestroySafe mpv
 where
  check what rc = unless (rc >= 0) do
    msg <- peekCString . unConstPtr =<< Mpv.errorString rc
    fail (what <> ": " <> msg)
```

This plays `video.mkv` with the video output disabled until the file ends.
`initialize`, `waitEvent`, and `terminateDestroy` can block for a long time,
so the example uses the `Safe` binding. See [Safe and unsafe FFI](#safe-and-unsafe-ffi).

For a fuller example, see `mpv-headless` in
[`lithon-examples`](https://github.com/jtnuttall/lithon/tree/main/lithon-examples).

### Windows set up

There are two ways to set this up that I am aware of. In order of
convenience:

#### WSL2

The Linux instructions apply unchanged.

#### Native (MSYS2)

Install build dependencies:

```sh
pacman -Syyu # repeat/restart terminal if pacman asks you to
pacman -S mingw-w64-ucrt-x86_64-mpv mingw-w64-ucrt-x86_64-pkgconf
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
3. Add `mpv-bindgen-sys-x.x.x.x` to `extra-deps` in your `stack.yaml`. Running
   `stack build` should print out a helpful, pasteable entry for
   this purpose.

Your `stack.yaml` should look something like this:

```yaml
snapshot: lts-24.51
packages:
  - .
extra-deps:
  - mpv-bindgen-sys-x.x.x.x # hash may be here if you copy from stack build
msys-environment: UCRT64 # important: build will not work without this
```

##### Direct cabal build using an MSYS2 Bash session (e.g., Git Bash)

You can point `cabal` at the UCRT64 toolchain and your ghcup GHC:

```sh
export PKG_CONFIG_PATH="/c/msys64/ucrt64/lib/pkgconfig"
export PATH="/c/msys64/ucrt64/bin:$PATH"
cabal build \
  --with-compiler=/c/ghcup/ghc/9.12.2/bin/ghc.exe \
  --extra-lib-dirs=/c/msys64/ucrt64/lib \
  --extra-include-dirs=/c/msys64/ucrt64/include
```

Adjust the GHC path to match your install. Keep `ucrt64/bin` on `PATH`
when running the program, so Windows finds the libmpv DLL.

## Library structure

For most uses, you will `import Mpv.Sys qualified as Mpv`.

The raw hs-bindgen output exists in  `Mpv.Sys.Bindgen.*`, if you need to drop
down to C types.

### Safe and unsafe FFI

Most functions come in both FFI flavors: `command` is an `unsafe`
foreign import; `commandSafe` is the `safe` one.

General rules for safe vs. unsafe FFI:

- You _must_ use a `safe` call if C will call back into Haskell.
- You _should_ use a `safe` call if the C call could take a while (e.g.,
  waiting on some OS event, or a locking mechanism, etc.).
- You _should_ use an `unsafe` call if the C call is fast; `unsafe`
  calls block the current GHC thread (capability) and the garbage
  collector, but their overhead is very low compared to `safe` calls.

With libmpv, the first rule will apply more often than not. It runs your
callbacks on its own threads, and sometimes on your own. If any callback
you give mpv is a Haskell function, you'll need the `Safe` variants for
nearly everything.

Notable exceptions:  `clientId`, `clientName`, `errorString`, `eventName`,
`eventToNode`, `free`, `freeNodeContents`, `getTimeNs`, and `getTimeUs`,
none of which can block or call back.

## Platform support

**64-bit platforms only.** Linux, MacOS (Homebrew `mpv`), and Windows
(MSYS2 UCRT64, including the LLP64 layouts) are all targets. 32-bit
targets are rejected at compile time.

## Common issues

- **`create` returns `nullPtr`**: libmpv refuses to start unless the
  `LC_NUMERIC` locale category is `"C"` (see "Basic environment
  requirements" in `client.h`). If your program or a GUI toolkit calls
  `setlocale(LC_ALL, "")`, reset `LC_NUMERIC` to `"C"` before `create`.
- **Don't call mpv from a callback**: the headers forbid calling
  the API from the wakeup and update callbacks, and a stream callback
  that does can deadlock. Have the callback signal a different thread.
- **OpenGL**: `renderContext*` calls need your OpenGL context current
  on the calling OS thread. Make those calls from a **bound thread** (`main`,
  or a thread started with `forkOS`).

## What is not bound

- **`mpv_client_api_version`**: it returns `unsigned long`, whose width cannot
  be right on both LP64 and LLP64.
- **The `MPV_CPLUGIN_DYNAMIC_SYM` symbol table**.
- **`MPV_RENDER_PARAM_DRM_OSD_SIZE`**: use
  `MPV_RENDER_PARAM_DRM_DRAW_SURFACE_SIZE`, the value it names.

## Versioning

The 0.0.x series is experimental: pin to the minor
(e.g., `>=0.0.0.1 && <0.0.1`) and expect surface-shaping changes.

## ABI verification

The cabal flag `abi-assertions` (default) turns on ABI verification,
which guards against unexpected layout divergence between libmpv
versions and varying operating systems.

When ABI assertions are on, `cbits/abi_assertions.c` statically checks
every size, alignment, field offset, and enum value the Haskell side
expects against your libmpv headers.

Maintainers can build with `-f abi-assertions-exact` to assert every
`sizeof` exactly, including structs the default checks only as a
prefix (libmpv has none today). Consumers should leave it off.

### What to do when you get "static assertion failed"

1. Check your libmpv: `pkg-config --modversion mpv`. Client API >= 2.0
   is required
2. Make sure you are on a supported architecture. 32-bit targets are not
   presently supported (see [Platform support](#platform-support)).
3. Report it at the [issue tracker](https://github.com/jtnuttall/lithon/issues)
   with the failing lines, your libmpv version, and your platform.
4. If you are comfortable doing so, open a PR regenerating the bindings
   from the newer libmpv. The
   [`lithon-codegen` README](https://github.com/jtnuttall/lithon/tree/main/lithon-codegen)
   describes the pipeline.

Building with `-f-abi-assertions` turns off the check, not the
mismatch: the bindings would then read and write the baked layout
against headers that disagree with it.

## Known documentation warts for `0.0.0.1`

- libmpv documents some struct members and enum constants with a comment
  _after_ the declaration (`char *string; /** valid if … */` in
  `mpv_node`, the `///` level names in `mpv_log_level`). In the
  generated haddocks those comments attach to the _following_ member.
- Each header's opening overview comment appears in its first
  declaration's haddock.

## Provenance and licensing

Generated by [hs-bindgen](https://github.com/well-typed/hs-bindgen) from the
libmpv client API 2.5 headers (mpv 0.41.0). Treat bugs as mine, not mpv's or
hs-bindgen's, and report them at my [issue tracker](https://github.com/jtnuttall/lithon/issues).

- `mpv-bindgen-sys` is BSD-3-Clause (see `LICENSE`).
- The libmpv client API headers, and the header documentation embedded
  in the haddocks, are ISC-licensed (`LICENSE_libmpv`).
- The vendored hs-bindgen and c-expr runtimes are BSD-3-Clause, (c) Well-Typed LLP
  and Anduril Industries (`LICENSE_hs-bindgen-runtime`, `LICENSE_c-expr-runtime`).

### libmpv's license applies to your program

The dev headers are ISC, but libmpv itself is **GPLv2 or later by default**
and **LGPLv2.1 or later** only when built with `-Dgpl=false`.

A program that bundles or statically links libmpv is subject to libmpv's license
regardless of the licensing of these bindings.

In practice, shipping a Haskell program built on this package means
shipping alongside it, statically linked or bundled, so plan for the
GPL obligations.

This package only declares the `pkg-config` dependency; how libmpv is
linked is up to your build. For a static link, use the flags
`pkg-config --static --libs mpv` reports.

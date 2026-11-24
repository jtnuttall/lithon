# lithon

[![ci](https://github.com/jtnuttall/lithon/actions/workflows/ci.yml/badge.svg)](https://github.com/jtnuttall/lithon/actions/workflows/ci.yml)

**lithon** (λίθον — _stone_ / λῐ́θων — _of stones_; LEE-tawn[^1]) is a set of
bedrock packages for rendering tasks in Haskell.

Contributions and suggestions are welcome.

## Why?

These packages are built to support newer APIs than the existing
equivalents on Hackage. The code generator is net-new and the approach
taken is a bit different.

### SDL3

The SDL3 bindings are intended to serve as a complete, automatically
generated binding that is easier to maintain than the incumbent, manual
`sdl2` binding. The bindings are built atop a (modified fork of) Well-Typed's
`hs-bindgen` 1.0.0.0, without which they wouldn't have been possible.

### libmpv

The libmpv bindings are a complete, automatically generated binding of the
client API of libmpv, the library behind the mpv media player. They come out
of the same generator as the SDL3 bindings.

## Where to start?

Take a look at any of the [published packages](#packages), each of which has a
getting-started guide.

`lithon-examples` directory contains a variety of examples, which you may use
as templates if you'd like.

## Packages

### Published, stable

These packages follow the [PVP](https://pvp.haskell.org/) and are stable;
pin to the major (e.g., `^>= 0.1`).

| Package                               | Description                                                                                                 |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| [`rapidhash`](rapidhash/)             | Zero-copy bindings to [rapidhash v3](https://github.com/Nicoshev/rapidhash), a very fast, high-quality hash |
| [`rapidhash-aeson`](rapidhash-aeson/) | aeson instances for `rapidhash` digests                                                                     |

### Published, experimental

The following packages are published and external use is supported; they
follow the [PVP](https://pvp.haskell.org/). While they are below `0.1`,
treat them as experimental and pin to the minor (e.g.,
`>=0.0.0.1 && <0.0.1`):

| Package                                 | Description                                                          | Currently supported systems                                           |
| --------------------------------------- | -------------------------------------------------------------------- | --------------------------------------------------------------------- |
| [`sdl3-bindgen-sys`](sdl3-bindgen-sys/) | raw + curated SDL3 bindings, generated from the headers              | 64-bit Linux, macOS, Windows (CI checks against all three); SDL ≥ 3.2 |
| [`mpv-bindgen-sys`](mpv-bindgen-sys/)   | raw + curated libmpv client API bindings, generated from the headers | 64-bit Linux, macOS, Windows; libmpv client API ≥ 2.0 (mpv ≥ 0.35)    |

There are almost certainly bugs in this initial release; I have not validated
the whole generated API surface by hand. If you run into anything, please open
an issue (or a PR)!

### Internal

Everything else in the tree is internal. APIs change without notice, and nothing
is published. If something here would be useful to you, open an issue; I may be
willing to publish earlier than planned if there's enough interest.

| Package                 | What?                                                       |
| ----------------------- | ----------------------------------------------------------- |
| `lithon-vk`             | A modern Vulkan (1.3+) binding with a curated feature set   |
| `lithon-core`           | The hand-written runtime for the Vulkan binding             |
| `lithon-codegen`        | Codegen for vulkan/sdl/mpv bindings                         |
| `lithon-hs-bindgen`     | Vendored `hs-bindgen` fork with a curated re-export surface |
| `lithon-prelude`        | Shared internal prelude used across the lithon packages     |
| `lithon-examples`       | Examples                                                    |
| `typed-product-builder` | A type-level product/record-builder experiment              |

## Development

Development without Nix is not supported at this time. You'll need to install the system
dependencies yourself if you wish to develop without Nix.

I currently use [`nix direnv`](https://github.com/nix-community/nix-direnv/). You can use
whichever dev env management tool you prefer, or direct nix commands.

### Caching

If you haven't already, [set up the haskell.nix cache(s)](https://github.com/ican-group/haskell.nix/blob/master/README.md).
**If you don't do this, you'll rebuild GHC and a bunch of other stuff and it will take a
long time.**

As of writing, you'll want the equivalent of this in your user, system, or flake config.

```nix
nix.settings = {
  substituters = [
    "https://cache.iog.io"
    "https://cache.zw3rk.com"
  ];
  trusted-public-keys = [
    "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    "loony-tools:pr9m4BkM/5/eSTZlkQyRt57Jz7OMBxNSUiMC4FkcNfk="
  ];
};
```

### Setup

Here's how I set up for dev:

```sh
# 1. clone repository
git clone --recursive git@github.com:jtnuttall/lithon.git
cd lithon
# 2. set up direnv (https://github.com/nix-community/nix-direnv/)
cp .envrc.example .envrc
# 3. set up the environment. This will take a few minutes.
direnv allow
# 4. try building everything (optional)
cabal build all
```

If everything above went well, you should now be set up to develop.

### Common dev tasks

Consult the `justfile` for common tasks and useful documentation on their application.

## Licensing

- lithon itself is BSD-3-Clause (see `LICENSE`)
- SDL3 is licensed under `zlib`, a copy of which is embedded in `sdl3-bindgen-sys`
- libmpv's client API headers are ISC, a copy of which is embedded in
  `mpv-bindgen-sys`; libmpv itself is GPLv2+ (see that package's README)
- `hs-bindgen` and its attendant libraries are BSD-3-Clause (c) Well-Typed and
  Anduril.
- The upstream `rapidhash.h` vendored in `rapidhash` is MIT (c) Nicolas De
  Carli, shipped alongside the binding's BSD-3-Clause as `LICENSE_rapidhash`.

See the per-package license files for further detail.

[^1]:
    Very rough approximation of reconstructed Attic. Closer would be
    /i/ as in the French v/i/te with /t/ as in /t/op. Declension intentionally
    left ambiguous between accusative and genitive; the why is left as an
    exercise for the (very bored, classics/LXX-inclined) reader.

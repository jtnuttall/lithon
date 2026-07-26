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
pre-release `hs-bindgen`, without which they wouldn't have been possible.

## Where to start?

Take a look at any of the [published packages](#packages), each of which has a
getting-started guide. The `lithon-examples` directory also contains a
variety of examples, which double as smoke and compile tests, which
you can use as templates if you want — including `sdl3-raw` (a minimal
SDL3 triangle through the generated bindings) and `shmup` (a playable
port of the apecs Shmup example running on _and_ rendering through `SDL3`).

These are low-level; higher-level bindings are planned if you want a
batteries-included path. If you want to build your own higher-level bindings
atop these packages, feel free; just mind the versioning/stability information
here.

## Packages

### Published, stable

These packages follow the [PVP](https://pvp.haskell.org/) and are stable;
pin to the major (e.g., `^>= 0.1`).

| Package                   | Description                                                                                                 |
| ------------------------- | ----------------------------------------------------------------------------------------------------------- |
| [`rapidhash`](rapidhash/) | Zero-copy bindings to [rapidhash v3](https://github.com/Nicoshev/rapidhash), a very fast, high-quality hash |

### Published, experimental

The following packages are published and external use is supported; they
follow the [PVP](https://pvp.haskell.org/). While they are below `0.1`,
treat them as experimental and pin to the minor (e.g.,
`>=0.0.0.1 && <0.0.1`):

| Package                                 | Description                                             | Currently supported systems                                           |
| --------------------------------------- | ------------------------------------------------------- | --------------------------------------------------------------------- |
| [`sdl3-bindgen-sys`](sdl3-bindgen-sys/) | raw + curated SDL3 bindings, generated from the headers | 64-bit Linux, macOS, Windows (CI checks against all three); SDL ≥ 3.2 |

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
| `lithon-codegen`        | Codegen for vulkan/sdl bindings                             |
| `lithon-hs-bindgen`     | Vendored `hs-bindgen` fork with a curated re-export surface |
| `lithon-prelude`        | Shared internal prelude used across the lithon packages     |
| `lithon-examples`       | Examples                                                    |
| `typed-product-builder` | A type-level product/record-builder experiment              |

## Development

- Clone with `git clone --recursive` — the vendored `hs-bindgen` stack
  lives in git submodules that the build requires.
- The devshell (`nix develop`, or direnv) provides GHC, libclang for
  hs-bindgen, SDL3, and lavapipe.
- `scripts/check.sh` encapsulates all release checks for now.
- Codegen requires GHC 9.12+ (multiline string literals, etc.)

### Regenerating the bindings

```sh
cabal run lithon-codegen -- vulkan generate lithon-codegen/Vulkan-Docs/xml/vk.xml \
  --profile lithon-codegen/profiles/lithon-core.json
cabal run lithon-codegen -- sdl3 generate
```

## Licensing

- lithon itself is BSD-3-Clause (see `LICENSE`)
- SDL3 is licensed under `zlib`, a copy of which is embedded in `sdl3-bindgen-sys`
- `hs-bindgen` and its attendant libraries are BSD-3-Clause (c) Well-Typed and
  Anduril.
- The upstream `rapidhash.h` vendored in `rapidhash` is MIT (c) Nicolas De
  Carli, shipped alongside the binding's BSD-3-Clause as `LICENSE_rapidhash`.

See the per-package license files for further detail.

[^1]: Very rough approximation of reconstructed Attic. Closer would be
    /i/ as in the French v/i/te with /t/ as in /t/op. Declension intentionally
    left ambiguous between accusative and genitive; the why is left as an
    exercise for the (very bored, classics/LXX-inclined) reader.

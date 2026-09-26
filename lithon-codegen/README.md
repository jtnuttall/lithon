# lithon-codegen

Code generation tool for `lithon-vk`, `sdl3-bindgen-sys`, and `mpv-bindgen-sys`.

- Parses the Vulkan XML registry to generate `lithon-vk`.
- Drives `hs-bindgen` as a library to emit the bindgen-sys packages from C
  headers: `sdl3-bindgen-sys` from SDL3's, `mpv-bindgen-sys` from libmpv's.

Not published to Hackage, but public and BSD-3-Clause — you're welcome to copy it
or build your own bindings with it; see [Reuse](#reuse).

## CLI

Three subcommand trees: `vulkan`, `sdl3`, and `mpv`. Run `--help` on any
command for the authoritative option list — the blocks below are that help.

```
$ lithon-codegen --help
lithon-codegen - binding generators for lithon

Usage: lithon-codegen COMMAND

  Code generation tooling for lithon

Available options:
  -h,--help                Show this help text

Available commands:
  vulkan                   Vulkan registry pipeline: parse / check / resolve /
                           curate / generate
  sdl3                     SDL3 binding generation via hs-bindgen: spec /
                           generate
  mpv                      libmpv binding generation via hs-bindgen: spec /
                           generate
```

## Vulkan

The Vulkan pipeline runs in three phases:

1. **Parse**: `vk.xml` → a lossless, position-annotated typed IR. Any unmodeled
   attribute, element, or text anywhere in the registry is an error.
   `lithon-codegen vulkan check` is the CI gate.
2. **Resolve + curate**: the phase-1 IR → a resolved registry (canonical names,
   materialized enum values, classified availability, inverted alias/pNext
   topologies, dispatch levels, enum flow) → pruned to a declarative curation
   [profile](#profiles).
3. **Generate**: emit `lithon-vk` from the curated metadata.

```
$ lithon-codegen vulkan --help
Usage: lithon-codegen vulkan COMMAND

  Vulkan registry pipeline: parse / check / resolve / curate / generate

Available options:
  -h,--help                Show this help text

Available commands:
  parse                    Parse and dump IR / summary / slices
  check                    Parse strictly and report all diagnostics (CI gate)
  resolve                  Specialize to vulkan and run the resolve passes
                           (phase 2)
  curate                   Resolve, then curate to a profile (closure + prune +
                           report)
  generate                 Curate, then emit the lithon package sources (phase
                           3)
```

<details>
<summary><code>parse</code> · <code>check</code> · <code>resolve</code> · <code>curate</code> · <code>generate</code> — full options</summary>

```
$ lithon-codegen vulkan parse --help
Usage: lithon-codegen vulkan parse [--json FILE] [--summary] [--slice NAME]

  Parse and dump IR / summary / slices

Available options:
  --json FILE              Write the full IR as canonical JSON
  --summary                Print section counts and digests
  --slice NAME             Dump one named entity's IR as canonical JSON
  -h,--help                Show this help text

$ lithon-codegen vulkan check --help
Usage: lithon-codegen vulkan check [--profile FILE]

  Parse strictly and report all diagnostics (CI gate)

Available options:
  --profile FILE           Also gate resolve + curation for FILE
  -h,--help                Show this help text

$ lithon-codegen vulkan resolve --help
Usage: lithon-codegen vulkan resolve [--json FILE] [--summary] [--slice NAME]

  Specialize to vulkan and run the resolve passes (phase 2)

Available options:
  --json FILE              Write the resolved registry as canonical JSON
  --summary                Print resolved table counts and digests
  --slice NAME             Dump one named resolved entity as canonical JSON
  -h,--help                Show this help text

$ lithon-codegen vulkan curate --help
Usage: lithon-codegen vulkan curate
         --profile FILE [--json FILE] [--report FILE] [--summary] [--slice NAME]
         [--explain NAME]

  Resolve, then curate to a profile (closure + prune + report)

Available options:
  --profile FILE           Curation profile (JSON)
  --json FILE              Write the curated registry as canonical JSON
  --report FILE            Write the curation report as canonical JSON ("-" =
                           text on stdout)
  --summary                Print curated table counts and digests
  --slice NAME             Dump one curated entity as canonical JSON
  --explain NAME           Print why NAME is in the curated set
  -h,--help                Show this help text

$ lithon-codegen vulkan generate --help
Usage: lithon-codegen vulkan generate
         --profile FILE [--out DIR] [--check] [--yes] [--report FILE]

  Curate, then emit the lithon package sources (phase 3)

Available options:
  --profile FILE           Curation profile (JSON)
  --out DIR                Target package directory (default: "lithon-vk")
  --check                  Diff fresh output against the tree; write nothing
  --yes                    Skip the output-directory confirmation
  --report FILE            Write the planning report (census, unpaired creates,
                           retained counts) as canonical JSON
  -h,--help                Show this help text
```

</details>

### Profiles

`vulkan curate` and `vulkan generate` take a `--profile FILE`: the path to a
self-describing JSON curation profile. A profile declares a `name`/`description`,
the core-version window (`baseline` … `max`), target `platforms`, the
`extensions` to include (each with a rationale) or `exclude`, and a `policy`
block (dependency-closure mode, promoted-to-core handling, provisional/deprecated
toggles, legacy-core categories, registry-drift warning).

## bindgen-sys targets

`sdl3` and `mpv` are two instances of one pipeline (`Lithon.Codegen.Sys`).
It drives `hs-bindgen` (through `lithon-hs-bindgen`) over a C library's
headers and emits the complete `*-bindgen-sys` package: the generated
modules, the curated alias layer, the ABI-assertion translation unit, the
version gates, and the vendored hs-bindgen and c-expr runtimes. Each
library is one `SysTarget` value in `Lithon.Codegen.Sys.Target.*` (names,
header universe, version spelling, gated-stub policy, prose), registered
in `Lithon.Codegen.Sys.Targets`; the generic code never branches on which
target it runs.

Everything else a target needs lives in `lithon-codegen/data/<key>/`:

- `aliases.json`: the curated layer's naming rule and FFI flavor
  classifications, with rationales. Every callback-taking function must be
  classified; an unlisted non-callback function defaults to `both`.
- `constants.json`: typed-constant groups (macro ↔ newtype membership);
  `{"groups": {}}` when there are none.
- `versions.json`: the availability registry. Versions have the target's
  number of parts (SDL: 3, libmpv: 2). `decls` corrects a declaration's
  availability, and a gated function's `stub-return` is the C expression
  its wrapper returns below the gate (default `0`; the parameters are
  `arg1`…`argN`). `prologue-typedefs` declares stand-ins for type names
  older headers lack, each with the `since` release that declares it and
  a `shape` (`opaque-struct`, `void-ptr`, or the aliased C type).
  `structs`, `enum-constants`, `value-gates`, and `macro-constants` gate
  the ABI assertions.
- `overrides.yaml` (optional): hs-bindgen's prescriptive binding spec
  (renames, representations, omissions).
- `static/`: the package's `package.yaml`, `README.md`, and `CHANGELOG.md`,
  plus the library's license as `LICENSE_<name>`, staged verbatim at the
  package root.
- `spec/` and `.lithon-manifest.json`: machine-owned; `spec` and
  `generate` rewrite them.

Binding another C library takes four steps:

1. A target module, `Lithon.Codegen.Sys.Target.<Name>`, defining its
   `SysTarget`.
2. Its data directory, `lithon-codegen/data/<key>/`, as above.
3. An entry in `sysTargets` (`Lithon.Codegen.Sys.Targets`), which adds the
   `lithon-codegen <key>` subcommand and the target's census golden,
   `lithon-codegen/test/golden/<key>/census.golden`: `CensusTest` creates
   it on the first test run after generating; review it before committing.
4. Repo wiring: the package in `cabal.project`; the library in the flake
   (the devshell, `libHook`, and the pkg-config mapping haskell.nix plans
   with; see libmpv's `pc-version`); the package in every per-package step
   of `scripts/check.sh` (generated-tree freshness, hpack parity, the
   rendered-doc regression grep, haddock, and an example gate); and a CI
   consumer job.

Regenerate the bindings with:

```sh
cabal run lithon-codegen -- sdl3 generate
cabal run lithon-codegen -- mpv generate
```

`--check` (on any `generate` or `spec`) diffs fresh output against the tree and
writes nothing — the CI freshness gate.

### sdl3

`data/sdl3/versions.json` tracks per-SDL-version availability, including:

- Corrections for `\since` declarations that SDL seems to document wrongly,
- Member and constant existence/value conditions (the binding needs a
  higher granularity than SDL seems to provide). The `(added in X.Y.Z)` line
  in the member's comment serves as a the default floor, although the registry
  can override it.
- Stand-ins for type names that 3.4 signatures use but 3.2 headers do not
  declare (`prologue-typedefs`; all twelve have `since` 3.4.0).

The SDL version the bindings are generated from is the devshell's
`pkg-config --modversion sdl3`; it is recorded in the package manifest and
in ABI assertion messages.

```
$ lithon-codegen sdl3 --help
Usage: lithon-codegen sdl3 COMMAND

  SDL3 binding generation via hs-bindgen: spec / generate

Available options:
  -h,--help                Show this help text

Available commands:
  spec                     Run the per-header chain and sync the binding-spec
                           artifacts (steps 1-2)
  generate                 Run the chain and emit the sdl3-bindgen-sys package +
                           spec artifacts (step 3)
```

<details>
<summary><code>spec</code> · <code>generate</code> — full options</summary>

```
$ lithon-codegen sdl3 spec --help
Usage: lithon-codegen sdl3 spec [--check] [--yes]

  Run the per-header chain and sync the binding-spec artifacts (steps 1-2)

Available options:
  --check                  Diff fresh output against the tree; write nothing
  --yes                    Skip the output-directory confirmation
  -h,--help                Show this help text

$ lithon-codegen sdl3 generate --help
Usage: lithon-codegen sdl3 generate [--out DIR] [--check] [--yes]

  Run the chain and emit the sdl3-bindgen-sys package + spec artifacts (step 3)

Available options:
  --out DIR                Target package directory
                           (default: "sdl3-bindgen-sys")
  --check                  Diff fresh output against the tree; write nothing
  --yes                    Skip the output-directory confirmation
  -h,--help                Show this help text
```

</details>

### mpv

`mpv-bindgen-sys` binds the libmpv client API down to its floor, client API
2.0 (mpv 0.35). libmpv states availability only in prose, so
`data/mpv/versions.json` is the only source, and it gates two functions:
`mpv_del_property` (2.1; below it, the stub returns
`MPV_ERROR_UNSUPPORTED`) and `mpv_get_time_ns` (2.2; below it, the stub
returns `mpv_get_time_us(arg1) * 1000`).

The client API version the bindings are generated from is the devshell's
`pkg-config --modversion mpv` (`mpv.pc` reports the client API version,
not mpv's); it is recorded in the package manifest and in ABI assertion
messages.

```
$ lithon-codegen mpv --help
Usage: lithon-codegen mpv COMMAND

  libmpv binding generation via hs-bindgen: spec / generate

Available options:
  -h,--help                Show this help text

Available commands:
  spec                     Run the per-header chain and sync the binding-spec
                           artifacts (steps 1-2)
  generate                 Run the chain and emit the mpv-bindgen-sys package +
                           spec artifacts (step 3)
```

<details>
<summary><code>spec</code> · <code>generate</code> — full options</summary>

```
$ lithon-codegen mpv spec --help
Usage: lithon-codegen mpv spec [--check] [--yes]

  Run the per-header chain and sync the binding-spec artifacts (steps 1-2)

Available options:
  --check                  Diff fresh output against the tree; write nothing
  --yes                    Skip the output-directory confirmation
  -h,--help                Show this help text

$ lithon-codegen mpv generate --help
Usage: lithon-codegen mpv generate [--out DIR] [--check] [--yes]

  Run the chain and emit the mpv-bindgen-sys package + spec artifacts (step 3)

Available options:
  --out DIR                Target package directory (default: "mpv-bindgen-sys")
  --check                  Diff fresh output against the tree; write nothing
  --yes                    Skip the output-directory confirmation
  -h,--help                Show this help text
```

</details>

## Running lithon-codegen

Run the tool from the repository, via cabal:

```sh
cabal run lithon-codegen -- <target> <command> ...
```

- **Data directory.** Inputs (specs, registries, statics, the Vulkan-Docs
  registry) resolve through the cabal data directory, which `cabal run`
  points at `lithon-codegen/data/`. The package deliberately declares no
  `data-files:`.
- **Output-directory guard.** Write runs confirm the output directory
  unless it already carries a `.lithon-manifest.json` and sits inside the
  enclosing `cabal.project` root.

## Development

Golden tests pin the parse, resolve, and curate outputs against the pinned
`Vulkan-Docs` submodule; regenerate after intended changes with
`cabal test lithon-codegen --test-options=--accept`. `hpack` must be re-run
whenever a module file is added.

## Reuse

`lithon-codegen` is BSD-3-Clause (the repo-root `LICENSE`). You are welcome to:

- copy the tool, in whole or in part, with attribution; and
- use it — and the [profile](#profiles) mechanism — to generate your own curated
  binding set: a different Vulkan surface, or (through a bindgen-sys target's
  registries) a reshaped SDL3 or libmpv layer.

If you build something with it, I'd be glad to hear about it — open an issue.

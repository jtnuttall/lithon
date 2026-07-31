# lithon-codegen

Code generation tool for `lithon-vk` and `sdl3-bindgen-sys`.

- Parses the Vulkan XML registry to generate `lithon-vk`.
- Drives `hs-bindgen` as a library to emit `sdl3-bindgen-sys` from the SDL3 headers.

Not published to Hackage, but public and BSD-3-Clause — you're welcome to copy it
or build your own bindings with it; see [Reuse](#reuse).

## CLI

Two subcommand trees, `vulkan` and `sdl3`. Run `--help` on any command for the
authoritative option list — the blocks below are that help.

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

## SDL3

The SDL3 pipeline drives `hs-bindgen` (through `lithon-hs-bindgen`) over the SDL
headers and emits the complete `sdl3-bindgen-sys` package: the generated modules,
the curated `SDL3.Sys.*` alias layer, the ABI-assertion translation unit, and the
static README/CHANGELOG/package.yaml under `data/sdl3/static/`. Curation
decisions — FFI flavors, typed-constant membership, documentation overrides —
live in the checked-in registries (`data/sdl3/aliases.json`,
`data/sdl3/constants.json`, `data/sdl3/overrides.yaml`); the binding-spec
artifacts sync into `data/sdl3/spec/`, resolved through the tool's data
directory rather than a flag.

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

Regenerate the bindings with:

```sh
cabal run lithon-codegen -- sdl3 generate
```

`--check` (on any `generate` or `spec`) diffs fresh output against the tree and
writes nothing — the CI freshness gate.

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
  binding set: a different Vulkan surface, or (through the SDL3 pipeline's
  registries) a reshaped SDL3 layer.

If you build something with it, I'd be glad to hear about it — open an issue.

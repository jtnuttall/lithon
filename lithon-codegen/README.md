# lithon-codegen

`lithon-codegen` generates `lithon-vk` from the Vulkan XML registry. It also
generates the `*-bindgen-sys` packages, `sdl3-bindgen-sys` and
`mpv-bindgen-sys`, from C headers by driving hs-bindgen as a library through
`lithon-hs-bindgen`.

It is not published to Hackage, but it is public and BSD-3-Clause. See
[Reuse](#reuse).

## Quick reference

Regenerate every package from the repository root, inside the devshell:

```sh
cabal run lithon-codegen -- vulkan generate \
  --profile lithon-codegen/data/vulkan/profiles/lithon-core.json
cabal run lithon-codegen -- sdl3 generate
cabal run lithon-codegen -- mpv generate
```

- Add `--check` to diff fresh output against the tree and write nothing. CI
  runs all three this way through `scripts/check.sh`.
- Inputs live in `lithon-codegen/data/<target>/`, where `<target>` is
  `vulkan`, `sdl3`, or `mpv`.

## Vulkan

The Vulkan pipeline turns `vk.xml` into `lithon-vk` in three phases:

1. **Parse** (`parse`, `check`): `vk.xml` becomes a lossless,
   position-annotated typed IR.
2. **Resolve and curate** (`resolve`, `curate`): the IR becomes a resolved
   registry, pruned to a [profile](#profiles).
3. **Generate** (`generate`): the curated registry becomes the `lithon-vk`
   sources.

- `vk.xml` comes from the `Vulkan-Docs` submodule in
  `lithon-codegen/data/vulkan/`.
- Parsing is strict: any unmodeled attribute, element, or text is an error.
- `vulkan check` parses and reports every diagnostic. With `--profile FILE`,
  it also gates resolve and curation.

<details>
<summary><code>--help</code> output: <code>vulkan</code> and its subcommands</summary>

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

`vulkan curate` and `vulkan generate` require `--profile FILE`, a JSON
curation profile. It declares a `name`, the core-version window (`core`), the
target `platforms`, the `extensions` to include or `exclude`, and a `policy`
block. lithon's own profile is
`lithon-codegen/data/vulkan/profiles/lithon-core.json`; copy it to start.

## bindgen-sys targets

A target binds one C library through hs-bindgen. There are two: `sdl3` and
`mpv`.

### How it works

- Each target is one `BindgenTarget` value in
  `Lithon.Codegen.Bindgen.Target.<Name>`. The generic pipeline only reads its
  fields.
- The driver, `Lithon.Codegen.Bindgen.Driver`, runs hs-bindgen once per public
  header it binds, in dependency order. Each run reads the binding specs of the
  headers before it.
- Raw modules land under `<namespace>.Bindgen`, such as
  `SDL3.Sys.Bindgen.Video`. `aliases.json` and `constants.json` plan the
  curated layer, such as `SDL3.Sys.Video`.
- Anything newer than the target's floor, its oldest supported release, gets
  a version gate. Availability comes from the library's docs and from
  `versions.json`, which wins.
- The package holds the generated modules, the statics, copies of the
  hs-bindgen and c-expr runtimes, and `cbits/abi_assertions.c`. That ABI
  assertion TU re-checks every baked layout at build time.
- A `.lithon-manifest.json` records every emitted file. `--check` diffs a
  fresh run against the tree and writes nothing.

### Data directory

Every target uses the same layout in `lithon-codegen/data/<key>/`:

| Path                    | Written by    | Holds                                                                        |
| ----------------------- | ------------- | ---------------------------------------------------------------------------- |
| `aliases.json`          | You           | The naming rule and each function's FFI flavor, with rationales.             |
| `constants.json`        | You           | Typed-constant groups: which macros belong to which newtype.                 |
| `versions.json`         | You           | The availability registry. See [`versions.json`](#versionsjson).             |
| `overrides.yaml`        | You, optional | hs-bindgen's prescriptive binding spec: renames, representations, omissions. |
| `static/`               | You           | The statics, copied to the package root.                                     |
| `spec/`                 | Generator     | The spec artifacts: one binding spec per header, committed for review.       |
| `.lithon-manifest.json` | Generator     | Digests of the spec artifacts.                                               |

The generator enforces three rules:

- `aliases.json` must classify every callback-taking function as `both` or
  `safe-only`. Other functions default to `both`.
- `constants.json` needs `groups`, even when empty: `{"groups": {}}`.
- `static/` needs `package.yaml`, `README.md`, and `CHANGELOG.md`. Any other
  file is a license and must be named `LICENSE_<name>`.

#### `versions.json`

Keys are bare C names. Any entry may add a `note` for reviewers.

| Key                 | Entry fields                                  | Affects                  | Use it to                                               |
| ------------------- | --------------------------------------------- | ------------------------ | ------------------------------------------------------- |
| `decls`             | `since`, `stub-return`                        | Wrappers, ABI assertions | Correct a declaration's availability.                   |
| `enum-constants`    | `since`                                       | ABI assertions           | Gate a constant added to an existing enum.              |
| `value-gates`       | `since`                                       | ABI assertions           | Gate a constant whose value changed.                    |
| `macro-constants`   | `since`                                       | ABI assertions           | Gate a typed-constant macro added after the floor.      |
| `structs`           | `members`, `sizeof-since`, `before`, `layout` | ABI assertions           | Gate late members, a size change, or the layout policy. |
| `prologue-typedefs` | `since`, `shape`, `headers`                   | Wrappers                 | Declare stand-ins for type names older headers lack.    |

- Versions have the target's number of parts: `3.2.0` for sdl3, `2.1` for
  mpv. Any other count is an error.
- Below its gate, a function's wrapper returns `stub-return`: a C expression
  over `arg1` … `argN`, default `0`. An unused `stub-return` is an error.
- In `prologue-typedefs`, `shape` is `opaque-struct`, `void-ptr`, or the
  aliased C type.

### Commands

Every target has two commands. `<key>` is `sdl3` or `mpv`.

| Command                         | What it does                                                     |
| ------------------------------- | ---------------------------------------------------------------- |
| `lithon-codegen <key> spec`     | Runs the header chain and syncs the spec artifacts into `spec/`. |
| `lithon-codegen <key> generate` | Does the same, then emits the package.                           |

| Flag        | Commands           | Effect                                                       |
| ----------- | ------------------ | ------------------------------------------------------------ |
| `--check`   | `spec`, `generate` | Diff fresh output against the tree; write nothing.           |
| `--yes`     | `spec`, `generate` | Skip the output-directory confirmation.                      |
| `--out DIR` | `generate`         | Write the package to `DIR`. The default is the package name. |

Both commands check the ABI layouts and `stub-return` entries before writing.
On a failure they write nothing and name the `versions.json` fix.

<details>
<summary><code>--help</code> output: <code>sdl3</code> and its subcommands</summary>

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

<details>
<summary><code>--help</code> output: <code>mpv</code> and its subcommands</summary>

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

### Add a library

1. Create `lithon-codegen/data/<key>/` with `static/` and the three
   registries. Start `aliases.json`, `constants.json`, and `versions.json` as
   `{"naming": "camel-segments"}`, `{"groups": {}}`, and `{}`.
2. Add `lithon-codegen/src/Lithon/Codegen/Bindgen/Target/<Name>.hs` with one
   `BindgenTarget` value. Copy `Target/Mpv.hs`, the smallest target, and fill
   every field:
   - names: `key`, `packageName`, `displayName`, `versionLabel`,
     `namespace`, `functionPrefix`
   - headers: `pkgConfig`, `headers`, `parse`
   - versions: `versioning`, `gateStubs`
   - output: `shims`, `widthTypedefs`, `docs`, `prose`
3. Run `hpack lithon-codegen` so the `.cabal` file lists the new module.
4. Add the value to `bindgenTargets` in `Lithon.Codegen.Bindgen.Targets`. This
   adds the `lithon-codegen <key>` command and the target's tests.
5. Run `cabal run lithon-codegen -- <key> generate --yes`. Fix what each error
   names, then rerun.
6. Add the package to `cabal.project`, then run `cabal build <package>`.
7. Run `cabal test lithon-codegen`. Review the
   `lithon-codegen/test/golden/<key>/census.golden` it creates, then commit.
8. Wire the package into the repository:
   - `scripts/check.sh`: the freshness, hpack parity, doc-regression grep, and
     haddock steps, plus an example run.
   - `flake.nix`: the library in the devshell and the `libHook` calls, its
     `extraPkgconfigMappings` entry, and a `<package>-docs` output. If the `.pc`
     version is not the nixpkgs version, set `pc-version` like `libmpv`.
   - `.github/workflows/ci.yml`: a consumer job that runs
     `.github/scripts/consumer-bindgen-sys.sh <package> <pkg-config name>`.

### sdl3

`sdl3` generates `sdl3-bindgen-sys`. Its floor is SDL 3.2.0, the oldest SDL
with a stable ABI.

`lithon-codegen/data/sdl3/versions.json` covers what SDL's docs get wrong or
leave out:

- **Wrong `\since`.** `decls` corrects releases SDL documents wrongly.
  `SDL_ProgressState` claims 3.2.8 but first exists in 3.4.0.
- **Members and constants.** The bindings need availability per member and
  per constant, finer than SDL documents it. A member's `(added in X.Y.Z)`
  note is the default; the registry can override it.
- **Missing type names.** `prologue-typedefs` declares twelve names that 3.4
  signatures use and 3.2 headers lack. All twelve have `since` 3.4.0.

Below its gate, a wrapper reports the failure through `SDL_SetError`.

The SDL version comes from the devshell's `pkg-config --modversion sdl3`. The
package manifest and the ABI assertion messages record it.

### mpv

`mpv` generates `mpv-bindgen-sys`. Its floor is client API 2.0 (mpv 0.35),
and its versions have two parts.

libmpv states availability only in prose, so
`lithon-codegen/data/mpv/versions.json` is the only source. It gates two
functions:

| Function           | Since | Below the gate, the wrapper returns |
| ------------------ | ----- | ----------------------------------- |
| `mpv_del_property` | 2.1   | `MPV_ERROR_UNSUPPORTED`             |
| `mpv_get_time_ns`  | 2.2   | `mpv_get_time_us(arg1) * 1000`      |

libmpv has no error channel, so the return value is the only report.

The version comes from the devshell's `pkg-config --modversion mpv`, which
reports the client API version, not mpv's. The package manifest and the ABI
assertion messages record it.

## Running lithon-codegen

Run the tool from the repository through cabal:

```sh
cabal run lithon-codegen -- <target> <command> ...
```

Every command takes `--help`. The collapsed blocks in this README are that
output.

- **Data directory.** `cabal run` points the cabal data directory at
  `lithon-codegen/data/`. The package declares no `data-files:`, so any other
  invocation needs `lithon_codegen_datadir` set to `lithon-codegen/data`.
- **Output-directory guard.** Writes overwrite the output directory and
  delete stale files, so the tool confirms first. It skips that when the
  directory has a `.lithon-manifest.json` and sits inside the enclosing
  `cabal.project` root. Without a terminal it refuses; `--yes` answers yes in
  advance.

<details>
<summary><code>--help</code> output: <code>lithon-codegen</code></summary>

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

</details>

## Development

- Golden files in `lithon-codegen/test/golden/` pin the Vulkan outputs against
  the `Vulkan-Docs` submodule. They also pin each bindgen-sys target's census.
- Accept intended changes with
  `cabal test lithon-codegen --test-options=--accept`.
- Run `hpack lithon-codegen` after adding a module file.

## Reuse

`lithon-codegen` is BSD-3-Clause, under the repo-root `LICENSE`. You are
welcome to:

- copy the tool, in whole or in part, with attribution;
- use it and its [profiles](#profiles) to generate your own curated bindings:
  a different Vulkan surface, or a reshaped SDL3 or libmpv layer through a
  target's registries.

If you build something with it, I'd be glad to hear about it. Open an issue.

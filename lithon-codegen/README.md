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
- The driver runs hs-bindgen per bound header, in dependency order. Each run
  reads its predecessors' binding specs.
- `aliases.json` and `constants.json` plan the curated layer
  (`<namespace>.*`, e.g. `SDL3.Sys.*`) over the raw one
  (`<namespace>.Bindgen.*`).
- Every declaration hs-bindgen skips needs a disposition in `unbound.json`.
  The skip ledger, `unbound.md`, lists them all, with hs-bindgen's reasons.
- Anything newer than the floor, the oldest supported release, gets a version
  gate. Availability comes from the library's docs and the availability
  annotations; the annotations win.
- `cbits/abi_assertions.c` re-checks every baked layout at build time.
- `generate` writes the package with a `.lithon-manifest.json`. Manifests and
  ABI messages record the library version, from
  `pkg-config --modversion <pkgConfig>`.

### Data directory

Every target uses the same layout in `lithon-codegen/data/<key>/`:

| Path                    | Written by    | Holds                                                                                         |
| ----------------------- | ------------- | --------------------------------------------------------------------------------------------- |
| `aliases.json`          | You           | The naming rule and each function's FFI flavor, with rationales.                              |
| `constants.json`        | You           | Typed-constant groups: which macros belong to which newtype.                                  |
| `versions.json`         | You           | The availability annotations. See [`versions.json`](#versionsjson).                           |
| `unbound.json`          | You           | Each skipped declaration's disposition. See [`unbound.json`](#unboundjson).                   |
| `overrides/`            | You, optional | hs-bindgen's prescriptive binding specs, one per header: renames, representations, omissions. |
| `static/`               | You           | The statics, copied to the package root.                                                      |
| `spec/`                 | Generator     | The spec artifacts: one binding spec per header, committed for review.                        |
| `unbound.md`            | Generator     | The skip ledger: every declaration hs-bindgen skips, by disposition.                          |
| `.lithon-manifest.json` | Generator     | Digests of the spec artifacts and the skip ledger.                                            |

The generator enforces five rules:

- `aliases.json` must classify every callback-taking function as `both` or
  `safe-only`. Other functions default to `both`.
- `constants.json` needs `groups`, even when empty: `{"groups": {}}`.
- `unbound.json` gives every declaration hs-bindgen skips exactly one
  disposition, and names nothing it binds. See [`unbound.json`](#unboundjson).
- `static/` needs `package.yaml`, `README.md`, and `CHANGELOG.md`. Any other
  file is a license and must be named `LICENSE_<name>`.
- `overrides/` holds `<header stem>.yaml` files and nothing else, each named
  like the spec artifact of the header it applies to: `overrides/SDL_main.yaml`
  pairs with `spec/SDL_main.yaml`, reaches that header's hs-bindgen run
  alone, and holds only that header's entries. A file that pairs with no
  bound header is an error, and so is a single-file `overrides.yaml`. So is
  an entry hs-bindgen rejects, such as one its header's run does not use.

#### `unbound.json`

hs-bindgen skips what it cannot translate: variadic functions, unsupported
types, most function-like macros, same-name conflicts, and everything that
depends on those. It reports most macro failures below its default
verbosity; the generator collects them all anyway. `unbound.json` triages
each one:

```json
{
  "groups": [
    {
      "disposition": "upstream",
      "note": "hs-bindgen drops both halves of a function and macro name clash.",
      "issue": "https://github.com/well-typed/hs-bindgen/issues/2097",
      "names": ["SDL_memcpy", "macro SDL_memcpy"]
    }
  ]
}
```

| Disposition | Means                                          |
| ----------- | ---------------------------------------------- |
| `shim`      | A lithon-authored C shim binds it instead.     |
| `constant`  | `constants.json` binds it as a typed constant. |
| `wontfix`   | It stays unbound on purpose.                   |
| `upstream`  | It waits on an hs-bindgen fix.                 |

- Names are spelled as hs-bindgen spells them: `SDL_Log`, `struct SDL_Foo`,
  `macro SDL_FOURCC`.
- Every group needs a one-line `note` saying why. `issue` is optional.
- A skipped name without a disposition is an error, and so is a listed name
  that is no longer skipped. A name listed twice and a group without names
  are errors too.
- To start one, write `{"groups": []}` and run `spec`. The error lists every
  skip, then prints one group per reason to paste in.
- The generator writes the joined result to `unbound.md`: one section per
  group, the dependencies outside the bound headers that block skips, what
  the overrides omit, and the headers the target excludes.

#### `versions.json`

The library's availability annotations, kept by hand. Corrections where the
headers carry their own (SDL's `\since`); the whole set where they don't
(libmpv). Keys are bare C names. Any entry may add a `note` for reviewers.

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

| Command                         | What it does                                              |
| ------------------------------- | --------------------------------------------------------- |
| `lithon-codegen <key> spec`     | Runs the header chain and syncs `spec/` and `unbound.md`. |
| `lithon-codegen <key> generate` | Does the same, then emits the package.                    |

| Flag        | Commands           | Effect                                                       |
| ----------- | ------------------ | ------------------------------------------------------------ |
| `--check`   | `spec`, `generate` | Diff fresh output against the tree; write nothing.           |
| `--yes`     | `spec`, `generate` | Skip the output-directory confirmation.                      |
| `--out DIR` | `generate`         | Write the package to `DIR`. The default is the package name. |

Both commands check the annotations and the skip ledger before writing. A
failure writes nothing and names the fix.

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

1. Create `lithon-codegen/data/<key>/` with `static/`. Seed `aliases.json`,
   `constants.json`, `unbound.json`, and `versions.json` with
   `{"naming": "camel-segments"}`, `{"groups": {}}`, `{"groups": []}`, and
   `{}`.
2. In `lithon-codegen/src/Lithon/Codegen/Bindgen/`, copy `Target/Mpv.hs` to
   `Target/<Name>.hs`. Fill every field:
   - names: `key`, `packageName`, `displayName`, `versionLabel`,
     `namespace`, `functionPrefix`
   - headers: `pkgConfig`, `headers`, `parse`
   - versions: `versioning`, `gateStubs`
   - output: `shims`, `widthTypedefs`, `docs`, `prose`
3. Run `hpack lithon-codegen` to add the module to the `.cabal` file.
4. Register the value in `bindgenTargets` (`Lithon.Codegen.Bindgen.Targets`)
   for the `<key>` command and tests.
5. Run `cabal run lithon-codegen -- <key> generate --yes`. Fix each error it
   names, then rerun.
6. Add the package to `cabal.project`, then run `cabal build <package>`.
7. Run `cabal test lithon-codegen`. Review and commit the
   `lithon-codegen/test/golden/<key>/census.golden` it creates.
8. Wire the package into the repository:
   - `scripts/check.sh`: freshness, hpack parity, the doc-regression grep,
     haddock, and an example run.
   - `flake.nix`: the devshell library, `libHook` calls, an
     `extraPkgconfigMappings` entry, and a `<package>-docs` output. Set
     `pc-version`, like `libmpv`, when the `.pc` version differs from nixpkgs.
   - `.github/workflows/ci.yml`: a consumer job running
     `.github/scripts/consumer-bindgen-sys.sh <package> <pkg-config-name>`.
   - `lithon-examples`: an example executable needs a default-on cabal flag
     like `mpv` (`buildable: false` when off), and the `sdl3-shmup-smoke`
     job's `cabal.project.shmup` must pass `-<flag>`.

### sdl3

`sdl3` generates `sdl3-bindgen-sys`. Its floor is SDL 3.2.0, the oldest SDL
with a stable ABI. Its annotations cover SDL's doc errors and gaps:

- **Wrong `\since`.** `decls` corrects them: `SDL_ProgressState` claims 3.2.8
  but first exists in 3.4.0.
- **Members and constants.** The annotations date them, falling back to a
  member's `(added in X.Y.Z)` note.
- **Missing type names.** `prologue-typedefs` declares twelve names 3.4
  signatures use but 3.2 headers lack.

Below its gate, a wrapper reports the failure through `SDL_SetError`.

### mpv

`mpv` generates `mpv-bindgen-sys`. Its floor is client API 2.0 (mpv 0.35).
Versions are two-part client API versions, not mpv releases.

libmpv states availability only in prose, so its annotations are the whole
set:

| Function           | Since | Below the gate, the wrapper returns |
| ------------------ | ----- | ----------------------------------- |
| `mpv_del_property` | 2.1   | `MPV_ERROR_UNSUPPORTED`             |
| `mpv_get_time_ns`  | 2.2   | `mpv_get_time_us(arg1) * 1000`      |

libmpv has no error channel, so the return value is the only report.

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
  target's data directory.

If you build something with it, I'd be glad to hear about it. Open an issue.

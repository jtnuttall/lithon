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
- What the FFI cannot call (variadic functions, function-like macros) can
  get a C shim: a function in a C header the target authors, bound like the
  library's own. See [Authored headers](#authored-headers-c-shims).
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
| `aliases.json`          | You           | The naming rule, FFI flavors, and allowlists. See [`aliases.json`](#aliasesjson).             |
| `constants.json`        | You           | Typed-constant groups: which macros are constants of which type.                              |
| `versions.json`         | You           | The availability annotations. See [`versions.json`](#versionsjson).                           |
| `unbound.json`          | You           | Each skipped declaration's disposition. See [`unbound.json`](#unboundjson).                   |
| `overrides/`            | You, optional | hs-bindgen's prescriptive binding specs, one per header: renames, representations, omissions. |
| `include/<root>/`       | You, optional | The target's authored C headers. See [Authored headers](#authored-headers-c-shims).           |
| `static/`               | You           | The statics, copied to the package root.                                                      |
| `spec/`                 | Generator     | The spec artifacts: one binding spec per header, committed for review.                        |
| `unbound.md`            | Generator     | The skip ledger: every declaration hs-bindgen skips, by disposition.                          |
| `.lithon-manifest.json` | Generator     | Digests of the spec artifacts and the skip ledger.                                            |

The generator enforces six rules:

- `aliases.json` must classify every aliased callback-taking function as
  `both` or `safe-only`. Other functions default to `both`. See
  [`aliases.json`](#aliasesjson).
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
- `include/` holds exactly the headers the target's `authored` field lists,
  in its root directory, and nothing else. A target that authors none has no
  `include/`.

#### `aliases.json`

The curated layer's decisions, by C name:

```json
{
  "naming": "camel-segments",
  "functions": {
    "SDL_AddHintCallback": {
      "safety": "safe-only",
      "rationale": "invokes the callback once immediately with the current hint value"
    }
  },
  "renames": { "lithon_SDL_BITSPERPIXEL": "bitsPerPixel" },
  "skip": [],
  "allow": {
    "SDL_stdinc.h": { "bound": 153, "names": ["SDL_malloc", "SDL_free"] }
  }
}
```

| Field       | Meaning                                                                                        |
| ----------- | ---------------------------------------------------------------------------------------------- |
| `naming`    | Required. The alias naming rule: `camel-segments`.                                             |
| `functions` | A function's flavors: `both` (the default), `safe-only`, or `unsafe-only`, with a `rationale`. |
| `renames`   | A function's alias, where the naming rule's collides or reads badly.                           |
| `skip`      | Functions the curated layer leaves out.                                                        |
| `allow`     | Per header (basename), the only functions its curated module aliases (`names`), and `bound`.   |

- `safe-only` and `unsafe-only` need a `rationale`. So does `both` on a
  function without a callback, since that is the default.
- A header in `allow` aliases its listed functions and nothing else. Its
  other functions stay raw-only, in the raw family's `.Unsafe` and `.Safe`
  modules, and the curated module's haddock says so. A header not in
  `allow` aliases every function. `sdl3` lists `SDL_stdinc.h`: SDL's own API
  there and the allocator family, not the C library clones.
- `bound` is how many functions the header bound when its list was curated.
  When the header's count changes, generation fails until you review the
  list and set `bound` to the new count. The error names the unlisted
  functions in the library's own style (the function prefix, then an
  uppercase letter: SDL's convention, so the ones to review) and counts the
  libc-style rest. The package manifest records each list's `allowed` and
  `bound` counts (`aliasAllow`).
- An allowed function must be bound, declared in that header, listed once,
  and not skipped. A `functions`, `renames`, or `skip` entry for a function
  an allowlist leaves out is an error, since nothing aliases it. So is an
  allowlist for a header the target does not bind.
- Curating is not skipping: the raw layer binds every function either way,
  and `unbound.json` never lists one.
- A doc mention of a bound function without an alias links to its raw
  import.

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
      "names": [
        "SDL_size_add_check_overflow",
        "macro SDL_size_add_check_overflow"
      ]
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
- `generate` also checks every `constant` name against `constants.json`: a
  name no group binds is an error. `constants.json` may bind more, such as
  macros hs-bindgen binds itself (`SDL_INIT_*`).
- `spec` and `generate` check every `shim` name against the authored
  headers: the function named the target's name prefix and the name's C
  identifier must be bound (`macro SDL_FOURCC` needs `lithon_SDL_FOURCC`). A
  shim may also wrap a name hs-bindgen binds (`SDL_Swap16LE`).
- To start one, write `{"groups": []}` and run `spec`. The error lists every
  skip, then prints one group per reason to paste in.
- The generator writes the joined result to `unbound.md`: one section per
  group, the dependencies outside the bound headers that block skips, what
  the overrides omit, and the headers the target excludes.

#### Authored headers (C shims)

Haskell's FFI cannot call a variadic function, and a function-like macro
has no symbol. A target can author C headers of fixed-arity functions over
them, which the chain binds like the library's own. The target lists them:

```haskell
authored =
  Just
    AuthoredHeaders
      { includeRoot = "sdl3-bindgen-sys"
      , namePrefix = "lithon_"
      , headers =
          [AuthoredHeader{file = "SDL_log_shims.h", extends = Just "SDL_log.h"}]
      }
```

- The headers live in `data/<key>/include/<includeRoot>/`. The package ships
  them verbatim in `include/<includeRoot>/`; its `static/package.yaml` lists
  them in `extra-source-files` and sets `include-dirs: include` for the
  wrapper C. Generation refuses a `package.yaml` without either: without the
  first, `cabal sdist` drops the headers silently.
- Each header is one more unit of the chain. It includes the library header
  it builds on, so the include graph orders it after that header, and its
  run reads that header's spec. Its raw family is named by the target's
  mangle (`SDL_log_shims.h` is `SDL3.Sys.Bindgen.LogShims`). The ABI
  assertion unit and the constants probe never include it.
- Each function is `namePrefix` and the exact name it wraps:
  `lithon_SDL_LogMessage`. Its alias drops the prefix and follows the
  naming rule (`logMessage`). `aliases.json` classifies and renames it like
  any function, by its C name. A collision with an aliased function needs a
  rename (`lithon_SDL_Log` mints `log`, which is free only because
  `SDL_stdinc.h`'s allowlist leaves the math `SDL_log` raw-only), and
  SCREAMING macros read better with one (`lithon_SDL_MS_TO_NS` would mint
  `msTONS`; it is `msToNs`).
- With `extends`, the functions join the curated module of that header,
  under a `C shims` export section. Without it, the header gets a module of
  its own. The library's own mentions of a wrapped name (`SDL_CreateThread()`)
  link to the shim.
- A header declares functions only: no types, no macros but its include
  guard. Write them `static` and inline (SDL's `static SDL_INLINE`). Copy the
  wrapped API's `\since`; anything newer than the floor guards its
  definition with the target's version macro, since a gate only guards the
  wrapper's call.
- Doc comments are doxygen, like the library's: a plain `/*` banner, so it
  does not attach to the first function, and never a literal `%s`: doxygen
  drops a `%` before a word.
- A header that declares types, a function not named
  `namePrefix<functionPrefix>…`, and an `extends` no bound header matches are
  errors.

#### `constants.json`

The typed constants of the curated layer: which `#define`s are constants of
which C type. SDL ties a macro to its type by naming convention only, so the
grouping is a judgment kept here. The values never are: `generate` compiles
and runs a probe against the same headers for each group's `sizeof` and
signedness and for each member's value, and the assertion TU re-checks every
baked value on the consumer's platform.

`{"groups": {"<type>": {…}}}`, keyed by the C type name.

| Field     | Meaning                                                                                   |
| --------- | ----------------------------------------------------------------------------------------- |
| `combine` | Required. `bitmask` (members OR-combine) or `value` (a plain value space).                |
| `prefix`  | The members are the type's header's object-like macros that start with this.              |
| `suffix`  | Also require this suffix. Needs `prefix`.                                                 |
| `exclude` | Macros the `prefix` rule must not sweep in. Needs `prefix`.                               |
| `members` | An explicit list, for prefixes that collide or macros declared outside the type's header. |
| `native`  | `Word8` … `Int64`: the scalar for a C type with no newtype (`size_t`). Needs `members`.   |

- A group has exactly one of `prefix` or `members`.
- A constant lives with its type. A newtype group is hosted in the family that
  declares the newtype. `members` may name the macros of any bound header
  (`SDL_TOUCH_MOUSEID` is declared in `SDL_touch.h` but is an `SDL_MouseID`,
  so it lives in `SDL3.Sys.Mouse`), and its haddock says where the macro came
  from. `prefix` only scans the type's own header.
- A `native` group has no newtype to follow. Its host is the family declaring
  its members, which must all come from one header. The patterns are plain
  scalars (`pattern SDL_SIZE_MAX :: BG.Word64`), and the scalar must agree with
  the probed width and signedness.
- Negative constants need a signed type (`SDL_MIN_SINT8`, `SDL_MIN_TIME`);
  `bitmask` needs an unsigned one. A value that does not fit its type is an
  error.
- A macro belongs to at most one group, and a pattern may not reuse a name any
  family already exports.

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
   - C shims: `authored` (`Nothing`, or see
     [Authored headers](#authored-headers-c-shims))
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

Its C shims, in `data/sdl3/include/sdl3-bindgen-sys/`, cover SDL's
variadic logging, error, and stream-printing functions and 46 function-like
macros: 57 functions in 11 headers, one per SDL header they extend.

Its `aliases.json` allowlists 22 functions of `SDL_stdinc.h`: SDL's own API
there (environments, memory-function hooks, UTF-8 stepping) and the
allocator family. The other 131 are raw-only.

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

# Changelog

## Unreleased

### Added

- The libmpv target: `lithon-codegen mpv spec|generate` emits
  `mpv-bindgen-sys` from the libmpv client API headers
  (`Lithon.Codegen.Bindgen.Target.Mpv`, `data/mpv/`), down to client API 2.0,
  with `mpv_del_property` (2.1) and `mpv_get_time_ns` (2.2) version-gated.
- SDL3 ABI assertions: a member's availability defaults to the
  `(added in X.Y.Z)` note in its doxygen comment.
- `sdl3 generate`/`spec` validate the distilled layouts before writing:
  a struct whose gated trailing members imply it grew, with no
  `sizeof-since`/`before` recorded (or a recorded pair that contradicts the
  offsets), is a hard error that prints the `versions.json` entry to add.
- SDL3 ABI assertions: a per-struct layout policy (`exact` | `prefix`).
  `prefix` keeps every field offset and the alignment exact and asserts
  `sizeof >=`; it is derived for every member type of a named union and
  overridable either way from `versions.json` (`structs.<name>.layout`).
- `versions.json`: `before: { sizeof, alignment }` is required alongside
  `sizeof-since`; the emitter asserts the baked layout at or above the gate
  and the pre-growth layout in an `#else` branch below it.
- The assertion TU defines `LITHON_ABI_HELP` (generation SDL version, README
  pointer, issue tracker, PR suggestion), appended to every message by
  literal concatenation.
- The assertion TU routes prefix `sizeof` lines through
  `LITHON_ABI_PREFIX_OP`/`LITHON_ABI_PREFIX_MSG`, selected by
  `LITHON_ABI_EXACT` (the `sdl3-bindgen-sys` cabal flag
  `abi-assertions-exact`), so a maintainer build asserts every `sizeof`
  exactly.
- Tests: `Bindgen.VersionsTest` (the `versions.json` codec) and an extended
  `abi-toy-assertions` golden covering both policies, both override
  directions, and the pre-growth branch.
- `versions.json`: `decls.<fn>.stub-return`, the C expression a gated
  wrapper returns below its gate (default `0`; the parameters are
  `arg1`…`argN`). A `stub-return` on a decl no header gates, or on a void
  function, is an error.
- Runtime facades (`<namespace>.Bindgen.Runtime.*`) for the four modules
  hs-bindgen-runtime 1.0 adds: `HasFFIType`, `Macro`, `Overloading`, `Struct`.
- The skip ledger: `data/<key>/unbound.json` (a required registry) gives
  every declaration hs-bindgen skips a disposition (`shim`, `constant`,
  `wontfix`, or `upstream`, with a note and an optional issue), and `spec` and
  `generate` write the joined ledger to the machine-owned
  `data/<key>/unbound.md` (`Lithon.Codegen.Bindgen.Unbound`). A skip without
  a disposition, or a disposition for a name that is no longer skipped, fails
  the run before anything is written (`UnboundFailed`), and the error prints
  a group per reason to paste. The skips come from the seam's report, so the
  macro failures hs-bindgen logs at `Info` are on the ledger too.
- A prescriptive override hs-bindgen rejects in its header's run (an entry
  that applies to nothing, a module mismatch, an enum spec for a type that
  is not an enum, or an opaque request for a kind that cannot be opaque)
  fails the header (`OverrideRejected`).
- The driver logs each header's skip count (`header bound`) and the chain's
  total (`chain complete`).
- Tests: `Bindgen.SkipsTest` (the seam's capture under `Quiet`, attribution
  to units, and the `unbound-toy` golden, which also pins that no absolute
  path reaches the ledger), `Bindgen.UnboundTest` (the registry codec and
  triage), and `DriverTest.unit_unusedOverrideFails`.
- `constants.json`: constants of signed types (a negative value such as
  `SDL_MIN_SINT8` is read back from the probe's 64-bit image and checked
  against the type's range), constants declared in another header than
  their type (`members` may name the macros of any bound header; the
  pattern is hosted with the type and its haddock says where the macro
  came from), and `native` groups for a C type with no newtype (`size_t`:
  plain `BG.Word64` patterns). The probe also prints each type's
  signedness. A `bitmask` group on a signed type, a `native` group with
  `prefix` or with members from two headers, and a `native` that disagrees
  with the probed width or signedness are errors. A negative constant is an
  explicitly bidirectional pattern: the implicit form makes GHC warn
  (`-Woverflowed-literals`) at the type's minimum.
- Tests: `Bindgen.ConstantsTest`; the toy goldens `alias-toy-module`,
  `alias-toy-bindgen-base` and `abi-toy2-assertions` pin a signed, a
  cross-header and a `native` group, and negative assertions.
- `generate` checks every `constant` disposition against the planned
  constants: a name no `constants.json` group binds fails the run before
  anything is written (`UnboundConstantMissing`, through `UnboundFailed`).
  `constants.json` may bind more, such as macros hs-bindgen binds itself.
  Tested in `Bindgen.UnboundTest`.
- The ledger files a conflict under the unit whose run reports it even
  when the conflict's smallest location is another header's (a function
  clashing with a same-name macro of a header it includes): both halves,
  at the line in the unit's header, since the locations do not say which
  is whose, so the other header's half appears there even when its own
  header's unit binds it. Such a conflict used to vanish from the ledger.
  `SkipsTest.unit_crossHeaderConflictAttributed`.

### Changed

- The SDL3 layer is a generic bindgen-sys pipeline (`Lithon.Codegen.Bindgen.*`)
  driven by a plain `BindgenTarget` record: a target is one module, one
  `data/<key>/` directory, and an entry in `Lithon.Codegen.Bindgen.Targets`.
- Versions have the target's number of parts (SDL: 3); `versions.json`
  rejects any other count.
- `versions.json`: every `prologue-typedefs` entry needs a `since` (one
  guard block per release); `shape` is `opaque-struct`, `void-ptr`, or the
  aliased C type as C spells it (`uint32` is now `Uint32`).
- Package statics are read from `data/<key>/static/` at run time:
  `package.yaml`, `README.md`, `CHANGELOG.md`, and every other file as a
  license under its own name, which must be `LICENSE_<name>` (a non-empty
  `<name>` of ASCII letters, digits, `_`, and `-`) and not one the
  generator stages itself (`LICENSE_SDL3` moved to
  `data/sdl3/static/LICENSE_SDL`).
- Manifests record the library version as `libraryVersion` (was
  `sdlVersion`).
- hs-bindgen is upgraded to 1.0.0.0 (fork branch `lithon/vendor-patches-2`),
  and `sdl3-bindgen-sys` and `mpv-bindgen-sys` are regenerated with it. The
  vendored runtime's `template-haskell` bound is `>=2.19`.
- Target defines are root directives, emitted ahead of the includes, instead
  of `-D` flags. 1.0 renders them at the top of every wrapper translation
  unit, so `SDL_MAIN_HANDLED` already precedes `<SDL3/SDL_main.h>`; this
  retires the `SDL_main.h` text shim.
- The include graph's paths are canonical real paths, not source paths.
- lithon-codegen no longer depends on doxygen-parser directly; doxygen
  sections are read through `Lithon.HsBindgen.C`.
- The prescriptive binding spec is one file per header,
  `data/<key>/overrides/<header stem>.yaml`, named like the header's spec
  artifact and passed to that header's hs-bindgen run alone; the preflight
  gets none. The single `overrides.yaml` is an error (`OverridesLegacy`), as
  is anything but `.yaml` files in `overrides/` (`OverrideUnexpected`), and a
  file that pairs with no bound header (`OrphanOverrides`). This retires the
  78 `Binding specification for type not used` warnings the other headers'
  runs raised for an entry whose declaration they did not reach, and the omit
  entries copied into the specs of those that did reach it. `sdl3` and `mpv`
  are migrated (`overrides/SDL_main.yaml`, `overrides/SDL_stdinc.yaml`,
  `overrides/client.yaml`); the generated packages are unchanged.
- The sdl3 target defines `SDL_SLOW_MEMCPY`, `SDL_SLOW_MEMMOVE` and
  `SDL_SLOW_MEMSET` (after `SDL_MAIN_HANDLED`). `SDL_stdinc.h` otherwise
  `#define`s `SDL_memcpy memcpy` (and the other two), and hs-bindgen drops a
  function that a same-name macro shadows, so `memcpy`, `memmove` and
  `memset` bind now. They reach the wrapper C, the ABI assertion unit and
  the constants probe, where they only make SDL's inline helpers call SDL's
  own functions. hs-bindgen's conflict warnings fall from 10 to 4; the
  remaining four are `SDL_size_mul_check_overflow` and
  `SDL_size_add_check_overflow` and their macros, on the ledger as
  `upstream`.
- The typed-constant ABI assertion compares `(NAME) == (<value mod 2^64>ull)`:
  the usual arithmetic conversions take the C operand to `unsigned long long`
  modulo 2^64 as well, so a negative constant compares exactly at every width.
  Existing assertions are unchanged.

## 0.1.1.0 - 2026-07-30

### Changed

- Internal refactor of codegen tool to standardize effect handling, prepare
  for more bindings.
- Changelog now in keep-a-changelog format
- Tests now use Data.FileEmbed to prevent drift and difficult-to-track failures
- Per-API specifications now live in a data directory
- All codegen-time dependencies now live in the codegen tool, either in the
  data directory or embedded directly into the executable. Solves a class of
  pathing issues.
- New combined Haskell module abstraction `Module.Meta` semantics unifies module
  management.
- New `FileTree` domain concept unifies bespoke file handling.

## 0.1.0.0 - 2026-07-27

### Added

Vulkan generator:

- Per-command VkResult policy (`ResultPolicy`): payload peeks are gated on
  codes the driver actually writes — `acquireNextImageKHR`/`2KHR` and
  `getQueryPoolResults` now return `Outcome (Maybe …)`, `Nothing` on
  `VK_TIMEOUT`/`VK_NOT_READY` (previously: uninitialized memory as `Ok`).
  Registry-derived positive error codes join the `Err` test —
  `acquireProfilingLockKHR`'s `VK_TIMEOUT` now classifies as `Err`. A
  watch-set closure rule forces classification of any future command in
  this class (fail-loud on registry bumps); `VK_INCOMPLETE` literals are
  looked up from the materialized enum, not hardcoded.
- Non-extensible sType'd out-structs are nil-poked before the call
  (correct `sType`, null `pNext`) instead of passed as raw arena bytes.
- Every generated call site guards its dispatch-table read with
  `checkCommandPtr` (named `MissingCommand` throw instead of SIGSEGV).
- Zero-marshal wrappers (95 of 382, every hot `vkCmd*`) skip the arena
  checkout entirely; `planNeedsArena` pins the partition.
- `safeList` covers long-running driver work: pipeline/shader compilation
  and swapchain creation are now `safe` imports. The effective partition
  lands in the gen report (`safeCommands`); dead `CommandPlan.safe` removed.

Emission protocol:

- The generated `.cabal` is a tracked entry (hpack stdout capture in
  staging) — `--check` now gates cabal freshness; the post-sync hpack run
  is gone. Staleness is judged against emitted entries.
- Path confinement: absolute/dot-segment paths from the frontend or a
  mangled committed manifest are refused before anything touches disk.
- A present-but-undecodable manifest is a hard error (stale tracking no
  longer silently disarms); the manifest write is atomic (temp + rename);
  `.lithon-staging` is cleaned up on failure and gitignored.
- The sdl3 chain scratch dir is unique per run (`temporary`), removed on
  exit.

SDL3 alias layer:

- Unclassified non-callback functions now default to **both** flavors
  (`foo` + `fooSafe`) per the layer's spec — ~2,300 new `fooSafe` aliases.
  `unsafe-only` remains as an explicit opt-out; the dead-config rule now
  flags rationale-less `both` entries instead.
- `SDL_main` is omitted at the bindgen level (prescriptive
  `overrides.yaml`): no C shim, no `&SDL_main` accessor, no alias — the
  symbol belongs to the application.

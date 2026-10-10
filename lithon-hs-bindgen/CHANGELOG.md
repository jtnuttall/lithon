# Changelog for `lithon-hs-bindgen`

All notable changes to this project will be documented in this file.

## Unreleased

- Initial skeleton: adapter module `Lithon.HsBindgen` re-exporting
  `HsBindgen.BindingSpec` and `HsBindgen.Config` from the vendored
  hs-bindgen (fork branch `lithon/vendor-patches`); vendored submodules for
  hs-bindgen and its git dependencies under `vendor/`.
- Adapted to hs-bindgen 1.0.0.0 (fork branch `lithon/vendor-patches-2`):
  root directives replace `-D` defines (`defineMacros` is `#define` syntax,
  emitted ahead of the includes); `BindgenM` carries the invocation
  environment; include-graph paths are canonical real paths;
  `Lithon.HsBindgen.C` exports `TranslatedTypes` and `Type` and renames
  `ExplicitField` to `RegularField` (upstream rename).
- Seam surface: `AuthoredModule` and `authoredModule` in
  `Lithon.HsBindgen.HsModule` (alias-authored modules; `HsModule` is now
  abstract); `sinceSections` (every `\since` section, one text each) and
  `commentProse` in `Lithon.HsBindgen.C` (`Comment` is now abstract;
  lithon-codegen no longer depends on doxygen-parser); `Verbosity` and
  `InvocationEnv.verbosity` (lithon-owned, mapped to both hs-bindgen
  tracers; the field is new and required). `Normal` keeps the previous
  thresholds (frontend `Warning`, the safe tracer at hs-bindgen's default
  `Notice`); `Quiet` raises both (frontend `Error`, safe tracer `Warning`).
- Skip report: `runBindgen` returns `(a, InvocationReport)`, and
  `Lithon.HsBindgen.Skip` (re-exported from `Lithon.HsBindgen`) holds the
  report's lithon-owned types: every selection root the run skipped
  (`Skip`, with `SkipFailure`, conflicts, and missing dependencies), what its
  prescriptive spec omitted, and the spec entries hs-bindgen rejected. It is
  collected from the frontend traces at `Info` and above whatever the
  `Verbosity`; the printed output is unchanged. The fork commit `977d2d596`
  re-exports `HsBindgen.TraceMsg` (which `53376b013` had dropped),
  `HsBindgen.Frontend.Pass.Select.IsPass`, and
  `HsBindgen.Frontend.Analysis.DeclIndex` for it. New dependencies:
  `ansi-terminal`, `containers`.
- Skip report text: a failure's text says a line that repeats the one
  before it (or its end) once (the macro typechecker reports an unbound name
  once per use: `SDL_FOURCC`'s `Unbound variable: 'SDL_static_cast'` came
  eight times). Everything else stays hs-bindgen's wording.

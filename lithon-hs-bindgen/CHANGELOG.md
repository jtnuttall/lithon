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

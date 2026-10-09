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
  `Lithon.HsBindgen.C` exports `TranslatedTypes` and `Type` and drops
  `HashDefine`.

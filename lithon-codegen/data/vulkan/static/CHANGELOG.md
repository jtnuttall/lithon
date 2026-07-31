# Changelog — lithon-vk

## Unreleased

- Full curated surface from Vulkan-Docs v1.4.356 under the lithon-core
  profile: enums (open decoding), flag sets, rich dispatchable handles
  carrying their command tables, POD + marshalled structs, unions, the
  `structextends` topology as `Extends` instances, and the `Outcome`
  result vocabulary.
- Commands: `Lithon.Dispatch` (C-shape synonyms, dynamic invokers with a
  curated safe-list, Global/Instance/Device tables with alias-fallback
  init), ~380 `MonadIO`-polymorphic wrappers (dual-call enumeration
  loops, es-polymorphic chain outs, derived counts with runtime length
  checks), 39 `withX` brackets, and hand-planned protocols for
  `vkGetDeviceFaultInfoEXT` / `vkCreatePipelineBinariesKHR`.
- Funcpointers: `FN_`/`PFN_` pairs with `ccall wrapper` makers; struct
  callback members are alias-typed.
- Haddock throughout: registry prose, spec man links, availability,
  alias/deprecation/platform notes, and per-struct marshalling notes.

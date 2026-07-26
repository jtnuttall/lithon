# lithon-core

The hand-written runtime core grounding [lithon](https://github.com/jtnuttall/lithon)'s
generated Vulkan binding.

What lives here (and why it is hand-written rather than generated):

- **`Lithon.Core.Alloc`** — an arena (bump) allocator and the `Alloc` marshalling
  monad. All nested pointer structure produced while marshalling a call lives in
  one arena scoped to that call; peeks always copy, so no user-visible value ever
  aliases arena or driver memory.
- **`Lithon.Core.CStruct`** — the `CStruct` / `FromCStruct` / `Nil` / `Chainable`
  classes that generated struct code targets.
- **`Lithon.Core.Chain`** — sType/pNext chain machinery over `sop-core`'s `NP`.
- **`Lithon.Core.Open`** — open enums: `Open a` keeps unknown driver values
  representable while the inner ADT stays clean for type-level use.
- **`Lithon.Core.Flags`** — phantom-typed flag sets; unknown bits ride in the word.
- **`Lithon.Core.BaseTypes`** — `Bool32`, `DeviceSize`, `DeviceAddress`,
  `ApiVersion`, and friends.
- **`Lithon.Core.Platform`** — opaque window-system/platform handle types
  (emitted unconditionally; no CPP anywhere).
- **`Lithon.Core.Loader`** — the single static link seam
  (`vkGetInstanceProcAddr`) everything else is loaded through.

This package is deliberately light: `base`, `bytestring`, `vector`, `primitive`,
`sop-core`, `transformers`, `unliftio-core`, `witch`. It links `libvulkan`
(`vulkan-1` on Windows) — the only lithon package that does.

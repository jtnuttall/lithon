# Changelog

## Unreleased

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

## 0.1.0.0

- Initial scaffolding.

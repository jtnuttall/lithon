# Changelog for lithon-core

## Unreleased

- Arena pooling: `withArena` now checks out of a bounded global pool
  (`ArenaPool`, `newArenaPool`, `withPooledArena`) — steady-state wrapper
  calls perform no malloc/free, only a pointer bump.
- `arenaBytes` returns zero-filled memory (deterministic padding; unwritten
  out-params read as zeros, never a previous call's bytes).
- Misuse guards: `freeArena` is idempotent; `resetArena` on a freed arena
  throws instead of resurrecting freed memory.
- `Lithon.Core.Loader`: `MissingCommand` exception + `checkCommandPtr` — the
  dispatch-table null guard generated wrappers call through (a named throw
  instead of a jump to null).
- Initial package: arena allocator + `Alloc` monad, `CStruct`/`FromCStruct`/
  `Nil`/`Chainable` classes, NP-based sType/pNext chains, `Open` enums,
  `Flags` sets, base types, platform opaque types, loader bootstrap.

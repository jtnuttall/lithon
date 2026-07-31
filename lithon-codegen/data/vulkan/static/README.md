# lithon-vk

Generated Vulkan 1.3+ binding. **Do not edit** — regenerate via
`lithon-codegen` (see the repo README).

## Reading the API

- **Results never throw.** Every `VkResult`-returning command gives
  `m (Outcome a)`: match `Ok code a` / `Err code`, read `o.result`
  totally, lift with `toEither` into your own error stack — or opt into
  exceptions with `expect` (throws the precise `VulkanError`).
- **Enums** are ADTs. Enums the driver can hand back are `Open e`
  (`Known ctor` | `Unknown wire`), so total matches survive future
  registry values. Bitmasks are `Flags bits`: build with
  `flag Bit <> flag Bit`, test with `hasFlag`; unknown driver bits ride
  along.
- **pNext chains** are typed lists: `next = vk13Features :& Nil` on any
  `X (es :: [Type])` struct. Query readbacks are es-polymorphic — pick
  the chain at the call site
  (`getPhysicalDeviceFeatures2 @_ @'[PhysicalDeviceVulkan13Features]`)
  and annotate `@'[]` when you want none. Arrays of extensible structs
  take `SomeStruct`.
- **Construction** starts at `nil` (all-zero/empty) and record-updates
  what you need; multi-field updates disambiguate under
  `DuplicateRecordFields`, single shared fields may need the full
  constructor or your optics flavor.
- **Dispatchable handles** are rich: `device.handle` is the raw
  `Ptr Device_T`, `device.cmds` the resolved table. Struct members hold
  the raw pointer (`CommandBufferSubmitInfo{commandBuffer = cb.handle}`).
- **Brackets**: every paired create/destroy has a
  `withX … (\outcome -> …)` — the continuation always runs and receives
  the `Outcome`; cleanup happens only on `Ok`.
- **Counts are derived.** Array-length members are gone from records;
  each struct's Haddock lists what is written for you. A few commands
  keep a genuine input count (the `dataSize` family) — their docs say so.
- **No Haskell debug-utils messengers.** Commands import `unsafe` (by
  design); a callback firing during one deadlocks the RTS. Use the
  validation layer's stdout sink, or a C-side trampoline.

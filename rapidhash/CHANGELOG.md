# Changelog — rapidhash

## Unreleaed

### Added

- `rapidhash` now depends on `deepseq`, and provides `NFData` instances
  for both `RapidHash` and `RapidSeed`.

## 0.1.0.0 - 2026-07-26

Initial release.

- FFI bindings to rapidhash v3, vendored at upstream commit `5c62c4b` and
  shipped in the sdist (`cbits/rapidhash.h`, `cbits/rapidhash_ext.h`).
- `RapidHashable` with zero-copy instances for strict `ByteString`,
  `ShortByteString`, `Text`, `ByteArray`, `PrimArray`, and
  primitive/storable `Vector`.
- Self-describing tagged textual digests (`rhv3:` followed by 16 hex digits)
  with parsers, a `text-builder-linear` builder, and `Show`/`Read`/`Binary`
  instances.
- Optional `ToJSON`/`FromJSON` and `ToJSONKey`/`FromJSONKey` instances behind
  flag `aeson` (keys use the same tagged hex form as values).
- A `Hashable` instance for `RapidHash` itself, so a digest works directly as a
  `HashMap`/`HashSet` key.
- `HashViaRapidHash` for deriving `Hashable` via rapidhash.

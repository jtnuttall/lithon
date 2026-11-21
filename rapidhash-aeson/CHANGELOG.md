# Changelog — rapidhash-aeson

## Unreleased

Initial release.

- `ToJSON`/`FromJSON` and `ToJSONKey`/`FromJSONKey` instances for `RapidHash`
  and `RapidHashMicro`, moved here from `rapidhash`'s former `aeson` flag.
  Digests encode as strings in the tagged hex form (`rhv3:` / `rhmv3:` followed
  by 16 hex digits); map keys use the same form as values.

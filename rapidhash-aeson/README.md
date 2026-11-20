# rapidhash-aeson

aeson instances for [rapidhash](https://hackage.haskell.org/package/rapidhash):
`ToJSON`/`FromJSON` and `ToJSONKey`/`FromJSONKey` for `RapidHash` and
`RapidHashMicro`. They follow rapidhash's own textual convention: digests are
JSON strings in the self-describing tagged hex form (`rhv3:` or `rhmv3:`
followed by 16 hex digits), and map keys use the same form as values.

The module exports nothing; import it for its instances:

```haskell
import Data.Hash.RapidHash.Aeson ()
```

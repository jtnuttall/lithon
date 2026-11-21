# rapidhash-aeson

`ToJSON`/`FromJSON` and `ToJSONKey`/`FromJSONKey` instances for `RapidHash`
and `RapidHashMicro` from [rapidhash](https://hackage.haskell.org/package/rapidhash).
Digests encode as JSON strings in rapidhash's tagged hex form (`rhv3:` or
`rhmv3:` followed by 16 hex digits), and map keys use the same form as values.

The module exports nothing; import it for its instances:

```haskell
import Data.Hash.RapidHash.Aeson ()
```

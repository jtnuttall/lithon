-- | The one canonical JSON form used for dumps and goldens: sorted keys,
-- two-space indent, trailing newline, LF bytes. Everything golden-related
-- flows through 'canonicalJsonBytes' so there is exactly one shape to pin.
module Lithon.Codegen.Backend.Json (
  canonicalJsonBytes,
) where

import Data.Aeson (ToJSON)
import Data.Aeson.Encode.Pretty (
  Config (confCompare, confIndent, confTrailingNewline),
  Indent (Spaces),
  defConfig,
  encodePretty',
 )
import Data.ByteString.Lazy qualified as LBS
import Lithon.Prelude

canonicalJsonBytes :: (ToJSON a) => a -> LBS.ByteString
canonicalJsonBytes =
  encodePretty'
    defConfig
      { confCompare = compare
      , confIndent = Spaces 2
      , confTrailingNewline = True
      }

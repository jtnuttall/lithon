{-# LANGUAGE OverloadedStrings #-}

-- | The one canonical JSON form used for dumps and goldens: sorted keys,
-- two-space indent, trailing newline, LF bytes. Everything golden-related
-- flows through 'canonicalJsonBytes' so there is exactly one shape to pin.
module Lithon.Codegen.Backend.Json (
  canonicalJsonBytes,
  digestText,
) where

import Data.Aeson (ToJSON)
import Data.Aeson.Encode.Pretty (
  Config (confCompare, confIndent, confTrailingNewline),
  Indent (Spaces),
  defConfig,
  encodePretty',
 )
import Data.ByteString.Lazy qualified as LBS
import Data.Hash.RapidHash.Class (rapidhash)

import Lithon.Codegen.Prelude

canonicalJsonBytes :: (ToJSON a) => a -> LBS.ByteString
canonicalJsonBytes =
  encodePretty'
    defConfig
      { confCompare = compare
      , confIndent = Spaces 2
      , confTrailingNewline = True
      }

-- | A stable change-detection digest (rapidhash v3, tagged hex — the
-- 'Data.Hash.RapidHash.Types.RapidHash' textual form). A tripwire, not
-- cryptography: it answers "did this section's canonical JSON change", and
-- unlike hashable it is stable across library versions and platforms.
digestText :: LBS.ByteString -> Text
digestText = show . rapidhash . LBS.toStrict

{-# OPTIONS_GHC -Wno-orphans #-}

-- | Orphan aeson instances for 'RapidHash' and 'RapidHashMicro', encoding to
-- and from the tagged hex form the rest of rapidhash uses
-- (e.g. @"rhv3:0123456789abcdef"@, @"rhmv3:0123456789abcdef"@).
--
-- The module exports nothing; import it for its instances:
--
-- > import Data.Hash.RapidHash.Aeson ()
module Data.Hash.RapidHash.Aeson () where

import Data.Aeson qualified as A
import Data.Aeson.Types qualified as A
import Data.Hash.RapidHash.Types

instance A.ToJSON RapidHash where
  toJSON = A.String . showRapidHashText
  {-# INLINEABLE toJSON #-}

instance A.FromJSON RapidHash where
  parseJSON = A.withText "rapidhashv3" \t -> case parseRapidHashText t of
    Right h -> pure h
    Left err -> fail err
  {-# INLINEABLE parseJSON #-}

-- | Keys use the same tagged hex form as the value instances, so a map
-- keyed by @RapidHash@ serializes to a JSON object with @rhv3:@-prefixed keys.
instance A.ToJSONKey RapidHash where
  toJSONKey = A.toJSONKeyText showRapidHashText
  {-# INLINEABLE toJSONKey #-}

instance A.FromJSONKey RapidHash where
  fromJSONKey = A.FromJSONKeyTextParser \t -> either fail pure (parseRapidHashText t)
  {-# INLINEABLE fromJSONKey #-}

instance A.ToJSON RapidHashMicro where
  toJSON = A.String . showRapidHashMicroText
  {-# INLINEABLE toJSON #-}

instance A.FromJSON RapidHashMicro where
  parseJSON = A.withText "rapidhashMicrov3" \t -> case parseRapidHashMicroText t of
    Right h -> pure h
    Left err -> fail err
  {-# INLINEABLE parseJSON #-}

-- | Keys use the same tagged hex form as the value instances, so a map
-- keyed by @RapidHashMicro@ serializes to a JSON object with @rhmv3:@-prefixed keys.
instance A.ToJSONKey RapidHashMicro where
  toJSONKey = A.toJSONKeyText showRapidHashMicroText
  {-# INLINEABLE toJSONKey #-}

instance A.FromJSONKey RapidHashMicro where
  fromJSONKey = A.FromJSONKeyTextParser \t -> either fail pure (parseRapidHashMicroText t)
  {-# INLINEABLE fromJSONKey #-}

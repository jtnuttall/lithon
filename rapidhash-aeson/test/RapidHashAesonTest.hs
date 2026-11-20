{-# LANGUAGE OverloadedStrings #-}

module RapidHashAesonTest where

import Data.Aeson qualified as A
import Data.Aeson.Key qualified as Key
import Data.Hash.RapidHash (RapidHash (RapidHash), RapidHashMicro (RapidHashMicro))
import Data.Map.Strict qualified as Map
import Hedgehog (Property, forAll, property, (===))
import Hedgehog.Gen qualified as Gen
import Hedgehog.Range qualified as Range
import Test.Tasty.HUnit (Assertion, (@?=))

import Data.Hash.RapidHash.Aeson ()

unit_encodesAsTaggedPaddedHexString :: Assertion
unit_encodesAsTaggedPaddedHexString = do
  A.encode (RapidHash 0xabc) @?= "\"rhv3:0000000000000abc\""
  A.encode (RapidHashMicro 0xabc) @?= "\"rhmv3:0000000000000abc\""

unit_rejectsForeignAndMalformedTags :: Assertion
unit_rejectsForeignAndMalformedTags = do
  A.decode @RapidHash "\"rhv4:0000000000000abc\"" @?= Nothing -- future
  A.decode @RapidHash "\"fnv1a64:0000000000000abc\"" @?= Nothing -- other hash
  A.decode @RapidHash "\"rhv3:abc\"" @?= Nothing -- invalid hash length
  A.decode @RapidHash "123" @?= Nothing -- not a string at all
  A.decode @RapidHashMicro "\"rhmv4:0000000000000abc\"" @?= Nothing
  A.decode @RapidHashMicro "\"fnv1a64:0000000000000abc\"" @?= Nothing
  A.decode @RapidHashMicro "\"rhmv3:abc\"" @?= Nothing

-- | The two variants disagree above 80 bytes, so a digest of one must never
-- decode as the other — the distinct tags exist for exactly this.
unit_variantTagsDoNotCrossDecode :: Assertion
unit_variantTagsDoNotCrossDecode = do
  A.decode @RapidHash (A.encode (RapidHashMicro 0xabc)) @?= Nothing
  A.decode @RapidHashMicro (A.encode (RapidHash 0xabc)) @?= Nothing

-- | Keys render through 'Data.Aeson.Types.toJSONKeyText', so a keyed map is a
-- JSON object (not an array of pairs) and its keys carry the same tag as values.
unit_keysAreObjectKeysInTaggedForm :: Assertion
unit_keysAreObjectKeysInTaggedForm = do
  A.toJSON (Map.singleton (RapidHash 0xabc) (1 :: Int))
    @?= A.object [(Key.fromString "rhv3:0000000000000abc", A.Number 1)]
  A.toJSON (Map.singleton (RapidHashMicro 0xabc) (1 :: Int))
    @?= A.object [(Key.fromString "rhmv3:0000000000000abc", A.Number 1)]

hprop_valueRoundtrip :: Property
hprop_valueRoundtrip = property do
  w <- forAll (Gen.word64 Range.linearBounded)
  A.decode (A.encode (RapidHash w)) === Just (RapidHash w)
  A.decode (A.encode (RapidHashMicro w)) === Just (RapidHashMicro w)

hprop_keyRoundtrip :: Property
hprop_keyRoundtrip = property do
  kvs <-
    forAll
      ( Gen.list
          (Range.linear 0 32)
          ((,) <$> Gen.word64 Range.linearBounded <*> Gen.int Range.linearBounded)
      )
  let m = Map.fromList [(RapidHash k, v) | (k, v) <- kvs]
      mm = Map.fromList [(RapidHashMicro k, v) | (k, v) <- kvs]
  A.decode (A.encode m) === Just m
  A.decode (A.encode mm) === Just mm

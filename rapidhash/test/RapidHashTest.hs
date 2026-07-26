module RapidHashTest where

import Control.Monad (forM_)
import Data.ByteString qualified as BS
import Data.ByteString.Short qualified as SBS
import Data.Primitive.PrimArray (primArrayFromList)
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Data.Vector.Primitive qualified as PV
import Data.Vector.Storable qualified as SV
import Data.Word (Word64, Word8)
import Hedgehog (Property, forAll, property, (===))
import Hedgehog.Gen qualified as Gen
import Hedgehog.Range qualified as Range
import Numeric (readHex)
import Test.Tasty.HUnit (Assertion, assertBool, assertEqual, assertFailure, (@?=))

import Data.Hash.RapidHash (
  RapidHash (RapidHash),
  RapidSeed (RapidSeed),
  rapidhash,
  rapidhashWithSeed,
 )

unit_showIsTaggedPaddedHex :: Assertion
unit_showIsTaggedPaddedHex =
  show (RapidHash 0xabc) @?= "rhv3:0000000000000abc"

unit_readRejectsForeignTags :: Assertion
unit_readRejectsForeignTags = do
  reads @RapidHash "rhv4:0000000000000abc" @?= [] -- future
  reads @RapidHash "fnv1a64:0000000000000abc" @?= [] -- other hash
  reads @RapidHash "rhv3:abc" @?= [] -- invalid hash length

hprop_showReadRoundtrip :: Property
hprop_showReadRoundtrip = property do
  w <- forAll (Gen.word64 Range.linearBounded)
  let h = RapidHash w
  read (show h) === h

-- | The Text entry hashes the UTF-8 payload in place; it must agree with
-- hashing the encoded bytes (and the ShortByteString copy of them) — at
-- the default seed, at a random seed (pinning the seed plumbing of the
-- ByteArray# entry points), and for a Text with a nonzero internal offset.
hprop_representationsAgree :: Property
hprop_representationsAgree = property do
  t <- forAll (Gen.text (Range.linear 0 300) Gen.unicode)
  s <- forAll (Gen.word64 Range.linearBounded)
  let bytes = TE.encodeUtf8 t
      seed = RapidSeed s
  rapidhash t === rapidhash bytes
  rapidhash (SBS.toShort bytes) === rapidhash bytes
  rapidhash (BS.copy bytes) === rapidhash bytes
  rapidhashWithSeed seed t === rapidhashWithSeed seed bytes
  rapidhashWithSeed seed (SBS.toShort bytes) === rapidhashWithSeed seed bytes
  let t' = T.drop 1 t
  rapidhash t' === rapidhash (TE.encodeUtf8 t')

hprop_vectorInstancesAgreeWithBytes :: Property
hprop_vectorInstancesAgreeWithBytes = property do
  ws <- forAll (Gen.list (Range.linear 0 64) (Gen.word64 Range.linearBounded))
  k <- forAll (Gen.int (Range.linear 0 (length ws)))
  let sv = SV.fromList ws
      pv = PV.fromList ws
      pvSlice = PV.drop k pv
      pvBytes (PV.Vector off len ba) = PV.Vector (8 * off) (8 * len) ba :: PV.Vector Word8
  rapidhash sv === rapidhash (SV.unsafeCast sv :: SV.Vector Word8)
  rapidhash pv === rapidhash (pvBytes pv)
  rapidhash sv === rapidhash pv
  rapidhash (primArrayFromList ws) === rapidhash pv
  rapidhash pvSlice === rapidhash (pvBytes pvSlice)

-- | Known-answer vectors generated from the vendored upstream header by
-- @test/pin/pin.c@ (verify or regenerate with @scripts/rapidhash-pin.sh@
-- in the project repository).
unit_matchesUpstreamCReference :: Assertion
unit_matchesUpstreamCReference = do
  golden <- lines <$> readFile "test/pin/rapidhash-v3-pin.txt"
  assertBool "golden file contains vectors" (not (null golden))
  forM_ golden \line -> case words line of
    ["default", lenS, hashS] ->
      assertEqual line (RapidHash (hex hashS)) $
        rapidhash (bufBS (read lenS))
    ["withSeed", lenS, seedS, hashS] ->
      assertEqual line (RapidHash (hex hashS)) $
        rapidhashWithSeed (RapidSeed (hex seedS)) (bufBS (read lenS))
    ["offset", offS, lenS, seedS, hashS] -> do
      let off = read offS
          len = read lenS
          slice = PV.drop off (PV.fromList (bufBytes (off + len)) :: PV.Vector Word8)
      assertEqual line (RapidHash (hex hashS)) $
        rapidhashWithSeed (RapidSeed (hex seedS)) slice
    _ -> assertFailure ("unparseable golden line: " <> line)
 where
  hex :: String -> Word64
  hex s = case readHex s of
    [(v, "")] -> v
    _ -> error ("bad hex field in golden file: " <> s)

  -- Deterministic filler; mirrors byte_at in test/pin/pin.c.
  bufBytes :: Int -> [Word8]
  bufBytes n = [fromIntegral (i * 167 + 13) | i <- [0 .. n - 1]]

  bufBS :: Int -> BS.ByteString
  bufBS = BS.pack . bufBytes

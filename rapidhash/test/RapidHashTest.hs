module RapidHashTest where

import Control.Monad (forM_)
import Data.Binary qualified as Binary
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
  RapidHashMicro (RapidHashMicro),
  RapidSeed (RapidSeed),
  rapidhash,
  rapidhashMicro,
  rapidhashMicroWithSeed,
  rapidhashWithSeed,
 )

unit_showIsTaggedPaddedHex :: Assertion
unit_showIsTaggedPaddedHex = do
  show (RapidHash 0xabc) @?= "rhv3:0000000000000abc"
  show (RapidHashMicro 0xabc) @?= "rhmv3:0000000000000abc"

unit_readRejectsForeignTags :: Assertion
unit_readRejectsForeignTags = do
  reads @RapidHash "rhv4:0000000000000abc" @?= [] -- future
  reads @RapidHash "fnv1a64:0000000000000abc" @?= [] -- other hash
  reads @RapidHash "rhv3:abc" @?= [] -- invalid hash length
  reads @RapidHashMicro "rhmv4:0000000000000abc" @?= []
  reads @RapidHashMicro "fnv1a64:0000000000000abc" @?= []
  reads @RapidHashMicro "rhmv3:abc" @?= []

-- | The two variants disagree above 80 bytes, so a digest of one must never
-- read back as the other — that is the whole point of the distinct tags.
unit_variantTagsDoNotCrossParse :: Assertion
unit_variantTagsDoNotCrossParse = do
  reads @RapidHash (show (RapidHashMicro 0xabc)) @?= []
  reads @RapidHashMicro (show (RapidHash 0xabc)) @?= []

-- | Same, for the compact 9-byte @Binary@ encoding: the leading magic tag must
-- keep the two variants apart.
unit_binaryTagsDoNotCrossDecode :: Assertion
unit_binaryTagsDoNotCrossDecode = do
  let encoded = Binary.encode (RapidHash 0x1234)
      encodedMicro = Binary.encode (RapidHashMicro 0x1234)
  assertBool "micro bytes rejected as RapidHash" $
    isLeft (Binary.decodeOrFail @RapidHash encodedMicro)
  assertBool "rapidhash bytes rejected as RapidHashMicro" $
    isLeft (Binary.decodeOrFail @RapidHashMicro encoded)
  Binary.decode encoded @?= RapidHash 0x1234
  Binary.decode encodedMicro @?= RapidHashMicro 0x1234
 where
  isLeft = either (const True) (const False)

hprop_showReadRoundtrip :: Property
hprop_showReadRoundtrip = property do
  w <- forAll (Gen.word64 Range.linearBounded)
  let h = RapidHash w
  read (show h) === h

-- | Rendering goes through the @Addr#@ prefix literal while parsing goes through
-- the prefix pattern synonym, so this property is what keeps the two definitions
-- of @rhmv3:@ in agreement.
hprop_microShowReadRoundtrip :: Property
hprop_microShowReadRoundtrip = property do
  w <- forAll (Gen.word64 Range.linearBounded)
  let h = RapidHashMicro w
  read (show h) === h

-- | rapidhashMicro's block loop only kicks in above 80 bytes, so up to and
-- including 80 it must agree with rapidhash exactly, at any seed. This pins the
-- boundary the haddocks document.
hprop_microAgreesWithRapidhashThrough80 :: Property
hprop_microAgreesWithRapidhashThrough80 = property do
  len <- forAll (Gen.int (Range.linear 0 80))
  s <- forAll (Gen.word64 Range.linearBounded)
  let bs = bufBS len
      seed = RapidSeed s
      RapidHash expected = rapidhashWithSeed seed bs
      RapidHashMicro actual = rapidhashMicroWithSeed seed bs
  actual === expected
  let RapidHash expected' = rapidhash bs
      RapidHashMicro actual' = rapidhashMicro bs
  actual' === expected'

-- | The other side of the boundary: from 81 bytes on the variants must diverge,
-- otherwise the separate type and tag would be pointless.
unit_microDivergesFrom81 :: Assertion
unit_microDivergesFrom81 =
  forM_ [81, 82, 112, 113, 256, 1024] \len -> do
    let bs = bufBS len
        RapidHash expected = rapidhash bs
        RapidHashMicro actual = rapidhashMicro bs
    assertBool ("variants diverge at length " <> show len) (actual /= expected)

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
  -- Same again for the micro variant, which has its own set of FFI wrappers and
  -- its own offset shim.
  rapidhashMicro t === rapidhashMicro bytes
  rapidhashMicro (SBS.toShort bytes) === rapidhashMicro bytes
  rapidhashMicro (BS.copy bytes) === rapidhashMicro bytes
  rapidhashMicroWithSeed seed t === rapidhashMicroWithSeed seed bytes
  rapidhashMicroWithSeed seed (SBS.toShort bytes) === rapidhashMicroWithSeed seed bytes
  rapidhashMicro t' === rapidhashMicro (TE.encodeUtf8 t')

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
  rapidhashMicro sv === rapidhashMicro (SV.unsafeCast sv :: SV.Vector Word8)
  rapidhashMicro pv === rapidhashMicro (pvBytes pv)
  rapidhashMicro sv === rapidhashMicro pv
  rapidhashMicro (primArrayFromList ws) === rapidhashMicro pv
  rapidhashMicro pvSlice === rapidhashMicro (pvBytes pvSlice)

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
    ["offset", offS, lenS, seedS, hashS] ->
      assertEqual line (RapidHash (hex hashS)) $
        rapidhashWithSeed (RapidSeed (hex seedS)) (sliceOf (read offS) (read lenS))
    ["micro", lenS, hashS] ->
      assertEqual line (RapidHashMicro (hex hashS)) $
        rapidhashMicro (bufBS (read lenS))
    ["microWithSeed", lenS, seedS, hashS] ->
      assertEqual line (RapidHashMicro (hex hashS)) $
        rapidhashMicroWithSeed (RapidSeed (hex seedS)) (bufBS (read lenS))
    ["microOffset", offS, lenS, seedS, hashS] ->
      assertEqual line (RapidHashMicro (hex hashS)) $
        rapidhashMicroWithSeed (RapidSeed (hex seedS)) (sliceOf (read offS) (read lenS))
    _ -> assertFailure ("unparseable golden line: " <> line)
 where
  hex :: String -> Word64
  hex s = case readHex s of
    [(v, "")] -> v
    _ -> error ("bad hex field in golden file: " <> s)

  -- A sliced Vector, to drive the offset shim rather than a pre-cut buffer.
  sliceOf :: Int -> Int -> PV.Vector Word8
  sliceOf off len = PV.drop off (PV.fromList (bufBytes (off + len)))

-- | Deterministic filler; mirrors byte_at in test/pin/pin.c.
bufBytes :: Int -> [Word8]
bufBytes n = [fromIntegral (i * 167 + 13) | i <- [0 .. n - 1]]

bufBS :: Int -> BS.ByteString
bufBS = BS.pack . bufBytes

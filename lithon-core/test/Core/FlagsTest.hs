-- | Flag-set laws and unknown-bit preservation.
module Core.FlagsTest (
  hprop_monoidLaws,
  hprop_knownUnknownPartition,
  hprop_flagsFromArbitraryWire,
  unit_unknownBitsRideAlong,
  unit_setOps,
) where

import Data.Foldable (foldMap')
import Data.Word (Word32)
import Hedgehog (Gen, Property, forAll, property, (===))
import Hedgehog.Gen qualified as Gen
import Hedgehog.Range qualified as Range
import Test.Tasty.HUnit (Assertion, assertBool, assertEqual)

import Lithon.Core.Flags

-- A mock generated bits ADT with a gap (no bit 2), like real Vulkan masks.
data Cap = CapA | CapB | CapC
  deriving stock (Bounded, Enum, Eq, Ord, Show)

type instance FlagsWire Cap = Word32

instance BitPos Cap where
  bitOf = \case
    CapA -> Flags 0x1
    CapB -> Flags 0x2
    CapC -> Flags 0x8
  allBits = [CapA, CapB, CapC]

genFlags :: Gen (Flags Cap)
genFlags = do
  known' <- Gen.subsequence allBits
  unknown' <- Gen.element [Flags 0, Flags 0x80000000, Flags 0x100]
  pure (foldMap' bitOf known' <> unknown')

-- The whole point is exercising the laws, so silence hlint's law rewrites.
{- HLINT ignore hprop_monoidLaws "Monoid law, left identity" -}
{- HLINT ignore hprop_monoidLaws "Monoid law, right identity" -}
hprop_monoidLaws :: Property
hprop_monoidLaws = property do
  x <- forAll genFlags
  y <- forAll genFlags
  z <- forAll genFlags
  (x <> y) <> z === x <> (y <> z)
  mempty <> x === x
  x <> mempty === x
  x <> x === x -- union is idempotent

hprop_knownUnknownPartition :: Property
hprop_knownUnknownPartition = property do
  x <- forAll genFlags
  foldMap' bitOf (knownBits x) <> unknownBits x === x

unit_unknownBitsRideAlong :: Assertion
unit_unknownBitsRideAlong = do
  let fromDriver = Flags 0x80000001 :: Flags Cap -- CapA + a future bit
  assertEqual "known" [CapA] (knownBits fromDriver)
  assertEqual "unknown residue" (Flags 0x80000000) (unknownBits fromDriver)

unit_setOps :: Assertion
unit_setOps = do
  let ab = flag CapA <> flag CapB
  assertBool "hasFlag subset" (hasFlag ab (flag CapA))
  assertBool "hasFlag whole" (hasFlag ab ab)
  assertBool "not hasFlag superset" (not (hasFlag (flag CapA) ab))
  assertBool "hasAny" (hasAny ab (flag CapB <> flag CapC))
  assertBool "not hasAny disjoint" (not (hasAny (flag CapA) (flag CapC)))
  assertEqual "intersect" (flag CapB) (ab `intersect` (flag CapB <> flag CapC))
  assertEqual "diff" (flag CapA) (diff ab (flag CapB))

{- HLINT ignore hprop_flagsFromArbitraryWire "Monoid law, right identity" -}
hprop_flagsFromArbitraryWire :: Property
hprop_flagsFromArbitraryWire = property do
  -- exercise the derived-through-family Eq/Semigroup on arbitrary words
  w <- forAll (Gen.word32 Range.linearBounded)
  let f = Flags w :: Flags Cap
  f <> mempty === f
  f <> f === f

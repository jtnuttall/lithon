{-# LANGUAGE UndecidableInstances #-}

-- | Primlike round-trips, representation checks, and the via-Enum carrier.
module Core.PrimlikeTest (
  hprop_enumRoundtrip,
  hprop_boolRoundtrip,
  hprop_boolDecodeTotal,
  unit_boolRep,
  unit_enumRep,
  unit_identityRep,
) where

import Data.Word (Word32, Word8)
import Hedgehog (Property, forAll, property, (===))
import Hedgehog.Gen qualified as Gen
import Hedgehog.Range qualified as Range
import Test.Tasty.HUnit (Assertion, assertEqual)

import Lithon.Core.Primlike

-- A mock generated enum, stored by its 'fromEnum' index.
data Key = KeyA | KeyB | KeyC | KeyD
  deriving stock (Bounded, Enum, Eq, Show)
  deriving (Primlike) via (PrimViaEnum Key)

hprop_enumRoundtrip :: Property
hprop_enumRoundtrip = property do
  k <- forAll Gen.enumBounded
  fromPrim (toPrim (k :: Key)) === k

hprop_boolRoundtrip :: Property
hprop_boolRoundtrip = property do
  b <- forAll Gen.bool
  fromPrim (toPrim b) === b

hprop_boolDecodeTotal :: Property
hprop_boolDecodeTotal = property do
  w <- forAll (Gen.word8 Range.linearBounded)
  fromPrim @Bool w === (w /= 0)

unit_boolRep :: Assertion
unit_boolRep = do
  assertEqual "True is 1" (1 :: Word8) (toPrim True)
  assertEqual "False is 0" (0 :: Word8) (toPrim False)

unit_enumRep :: Assertion
unit_enumRep = do
  assertEqual "index of KeyA" (0 :: Int) (toPrim KeyA)
  assertEqual "index of KeyD" (3 :: Int) (toPrim KeyD)

unit_identityRep :: Assertion
unit_identityRep = do
  assertEqual "Word32 is itself" (42 :: Word32) (toPrim (42 :: Word32))
  assertEqual "Float is itself" (3.5 :: Float) (toPrim (3.5 :: Float))

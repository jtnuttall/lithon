{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE DataKinds #-}

-- | Chain machinery over mock chainable structs: poke links pNext in order,
-- planted chains peek back verbatim, sType mismatches throw.
module Core.ChainTest (
  unit_pokeLinksInOrder,
  unit_peekRoundtrip,
  unit_nilChainSkeleton,
  unit_mismatchThrows,
  unit_emptyChain,
) where

import Control.Exception (try)
import Control.Monad.IO.Class (liftIO)
import Data.Int (Int32)
import Foreign.Ptr (Ptr, castPtr, nullPtr, plusPtr)
import Foreign.Storable (peek, peekByteOff, pokeByteOff)
import Test.Tasty.HUnit (Assertion, assertBool, assertEqual, assertFailure)

import Lithon.Core.Alloc (arenaBytes, runAlloc, withArena)
import Lithon.Core.CStruct (CStruct (..), Chainable (..), FromCStruct (..), Nil (..))
import Lithon.Core.Chain

-- Mock "feature" structs with the standard sType/pNext prologue.
newtype FeatA = FeatA {enableA :: Int32}
  deriving stock (Eq, Show)

data FeatB = FeatB {enableB :: Int32, extraB :: Int32}
  deriving stock (Eq, Show)

instance CStruct FeatA where
  cSize = 24
  cAlign = 8
  pokeCStruct p x = liftIO do
    pokeByteOff p 0 (sTypeWire @FeatA)
    pokeByteOff p 8 (nullPtr :: Ptr ())
    pokeByteOff p 16 x.enableA

instance Chainable FeatA where
  sTypeWire = 1001
  chainOffset = 8

instance FromCStruct FeatA where
  peekCStruct p = FeatA <$> peekByteOff p 16

instance Nil FeatA where
  nil = FeatA 0

instance CStruct FeatB where
  cSize = 24
  cAlign = 8
  pokeCStruct p x = liftIO do
    pokeByteOff p 0 (sTypeWire @FeatB)
    pokeByteOff p 8 (nullPtr :: Ptr ())
    pokeByteOff p 16 x.enableB
    pokeByteOff p 20 x.extraB

instance Chainable FeatB where
  sTypeWire = 1002
  chainOffset = 8

instance FromCStruct FeatB where
  peekCStruct p = FeatB <$> peekByteOff p 16 <*> peekByteOff p 20

instance Nil FeatB where
  nil = FeatB 0 0

-- | Poke a two-element chain into a slot, then walk the raw pointers.
unit_pokeLinksInOrder :: Assertion
unit_pokeLinksInOrder = withArena \a -> do
  (p1, p2) <- runAlloc a do
    slot <- castPtr <$> arenaBytes 8 8
    pokeChain slot (FeatA 7 :& FeatB 3 9 :& Nil)
    liftIO do
      p1 <- peek (slot :: Ptr (Ptr ()))
      p2 <- peekByteOff p1 8
      pure (p1, p2)
  sty1 <- peek (castPtr p1 :: Ptr Int32)
  assertEqual "first node sType" 1001 sty1
  en1 <- peekByteOff p1 16
  assertEqual "first node payload" (7 :: Int32) en1
  sty2 <- peek (castPtr p2 :: Ptr Int32)
  assertEqual "second node sType" 1002 sty2
  end <- peekByteOff p2 8
  assertEqual "chain terminated" (nullPtr :: Ptr ()) end

-- | Planted chains peek back exactly.
unit_peekRoundtrip :: Assertion
unit_peekRoundtrip = withArena \a -> do
  chain <- runAlloc a do
    slot <- castPtr <$> arenaBytes 8 8
    pokeChain slot (FeatA 7 :& FeatB 3 9 :& Nil)
    liftIO do
      p1 <- peek (slot :: Ptr (Ptr ()))
      peekChain @'[FeatA, FeatB] p1
  case chain of
    a' :& b :& Nil -> do
      assertEqual "FeatA" (FeatA 7) a'
      assertEqual "FeatB" (FeatB 3 9) b

-- | The nil chain plants a correctly typed all-zeros skeleton.
unit_nilChainSkeleton :: Assertion
unit_nilChainSkeleton = withArena \a -> do
  p1 <- runAlloc a do
    slot <- castPtr <$> arenaBytes 8 8
    pokeChain slot (nilChain @'[FeatA])
    liftIO (peek (slot :: Ptr (Ptr ())))
  sty <- peek (castPtr p1 :: Ptr Int32)
  assertEqual "skeleton sType" 1001 sty
  en <- peekByteOff p1 16
  assertEqual "skeleton zeroed" (0 :: Int32) en

-- | Peeking a chain whose node has the wrong sType throws 'ChainMismatch'.
unit_mismatchThrows :: Assertion
unit_mismatchThrows = withArena \a -> do
  r <- runAlloc a do
    slot <- castPtr <$> arenaBytes 8 8
    pokeChain slot (FeatB 1 2 :& Nil)
    liftIO do
      p1 <- peek (slot :: Ptr (Ptr ()))
      try @ChainError (peekChain @'[FeatA] p1)
  case r of
    Left e -> assertEqual "mismatch reported" ChainMismatch{expected = 1001, actual = 1002} e
    Right _ -> assertFailure "expected ChainMismatch to be thrown"

-- | Empty chains: poke writes null; peek accepts null and rejects junk.
unit_emptyChain :: Assertion
unit_emptyChain = withArena \a -> do
  end <- runAlloc a do
    slot <- castPtr <$> arenaBytes 8 8
    pokeChain slot (Nil :: Chain '[])
    liftIO (peek (slot :: Ptr (Ptr ())))
  assertEqual "empty chain pokes null" (nullPtr :: Ptr ()) end
  Nil <- peekChain @'[] nullPtr
  r <- try @ChainError (peekChain @'[] (nullPtr `plusPtr` 64))
  assertBool "unexpected tail rejected" (either (const True) (const False) r)

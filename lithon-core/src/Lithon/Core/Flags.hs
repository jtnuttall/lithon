{-# LANGUAGE RoleAnnotations #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE UndecidableInstances #-}

-- | Phantom-typed Vulkan flag sets.
--
-- A @'Flags' f@ is a bitmask whose known bit positions are enumerated by the
-- generated ADT @f@ (e.g. @Flags MemoryPropertyFlagBits@). The wire width
-- (32- or 64-bit — synchronization2's stage/access masks are 64) is carried
-- by the 'FlagsWire' family, instantiated per generated bits type.
--
-- Unlike enums, flags need no 'Lithon.Core.Open.Open' wrapper: bits the
-- binding doesn't know simply ride along in the word ('knownBits' shows what
-- was recognized; 'unknownBits' the residue). Compound named values (e.g.
-- @CULL_MODE_FRONT_AND_BACK@) are generated as @Flags f@ pattern synonyms
-- rather than ADT constructors.
module Lithon.Core.Flags (
  Flags (..),
  FlagsWire,
  BitPos (..),
  flag,
  hasFlag,
  hasAny,
  intersect,
  diff,
  knownBits,
  unknownBits,
) where

import Data.Bits (Bits (..))
import Data.Kind (Type)
import Foreign.Storable (Storable)
import Numeric (showHex)

-- | The wire representation of a bits type: 'Data.Word.Word32' or
-- 'Data.Word.Word64'. Instantiated by generated code.
type family FlagsWire (f :: Type) :: Type

-- | A set of flags drawn from the bit positions of @f@.
newtype Flags f = Flags (FlagsWire f)

type role Flags nominal

deriving newtype instance (Eq (FlagsWire f)) => Eq (Flags f)

deriving newtype instance (Ord (FlagsWire f)) => Ord (Flags f)

deriving newtype instance (Bits (FlagsWire f)) => Bits (Flags f)

deriving newtype instance (Storable (FlagsWire f)) => Storable (Flags f)

instance (Integral (FlagsWire f), Show (FlagsWire f)) => Show (Flags f) where
  showsPrec d (Flags w) =
    showParen (d > 10) $ showString "Flags 0x" . showHex (toInteger w)

-- | Union.
instance (Bits (FlagsWire f)) => Semigroup (Flags f) where
  Flags a <> Flags b = Flags (a .|. b)
  {-# INLINE (<>) #-}

-- | Empty set.
instance (Bits (FlagsWire f)) => Monoid (Flags f) where
  mempty = Flags zeroBits
  {-# INLINE mempty #-}

-- | Implemented by generated bits ADTs: the single-bit mask of each
-- position, and the enumeration of all known positions (a flat generated
-- table — no 'Bounded'\/'Enum' involved).
class BitPos f where
  bitOf :: f -> Flags f
  allBits :: [f]

-- | Alias for 'bitOf' that reads well at call sites:
-- @flag SampleCount4 <> flag SampleCount8@.
flag :: (BitPos f) => f -> Flags f
flag = bitOf
{-# INLINE flag #-}

-- | @hasFlag whole want@: is every bit of @want@ set in @whole@?
hasFlag :: (Bits (FlagsWire f)) => Flags f -> Flags f -> Bool
hasFlag (Flags whole) (Flags want) = whole .&. want == want
{-# INLINEABLE hasFlag #-}

-- | Is any bit of the second set present in the first?
hasAny :: (Bits (FlagsWire f)) => Flags f -> Flags f -> Bool
hasAny (Flags whole) (Flags want) = whole .&. want /= zeroBits
{-# INLINEABLE hasAny #-}

-- | Set intersection.
intersect :: (Bits (FlagsWire f)) => Flags f -> Flags f -> Flags f
intersect (Flags a) (Flags b) = Flags (a .&. b)
{-# INLINEABLE intersect #-}

-- | Set difference.
diff :: (Bits (FlagsWire f)) => Flags f -> Flags f -> Flags f
diff (Flags a) (Flags b) = Flags (a .&. complement b)
{-# INLINEABLE diff #-}

-- | The recognized bit positions present in a set.
knownBits
  :: (BitPos f, Bits (FlagsWire f))
  => Flags f
  -> [f]
knownBits fl = [b | b <- allBits, hasFlag fl (bitOf b)]
{-# INLINEABLE knownBits #-}

-- | The residue after removing every recognized bit — nonempty when a newer
-- driver handed back bits this binding predates.
unknownBits
  :: (BitPos f, Bits (FlagsWire f))
  => Flags f
  -> Flags f
unknownBits fl = foldl diff fl (map bitOf allBits)
{-# INLINEABLE unknownBits #-}

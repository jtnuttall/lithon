-- | Vulkan's scalar base types, hand-written.
--
-- These are stable, decades-old definitions; lithon-codegen /validates/ that
-- the registry still matches them (loud error on drift) rather than
-- re-deriving them from C macro bodies.
module Lithon.Core.BaseTypes (
  -- * Booleans
  Bool32 (.., TRUE, FALSE),
  toBool,

  -- * Sizes and addresses
  DeviceSize (..),
  DeviceAddress (..),
  SampleMask (..),

  -- * API versions
  ApiVersion (..),
  makeApiVersion,
  apiVersionVariant,
  apiVersionMajor,
  apiVersionMinor,
  apiVersionPatch,
) where

import Data.Bits (Bits, FiniteBits, shiftL, shiftR, (.&.), (.|.))
import Data.Primitive.Types (Prim)
import Data.Word (Word32, Word64)
import Foreign.Storable (Storable)
import Witch (From (..))

-- | Vulkan's 32-bit boolean. Any nonzero value reads as true (drivers only
-- ever produce 0 or 1, but decoding is total either way).
newtype Bool32 = Bool32 Word32
  deriving newtype (Eq, Ord, Prim, Storable)

pattern TRUE :: Bool32
pattern TRUE = Bool32 1

pattern FALSE :: Bool32
pattern FALSE = Bool32 0

instance Show Bool32 where
  show = \case
    FALSE -> "FALSE"
    TRUE -> "TRUE"
    Bool32 n -> "Bool32 " <> show n

-- | Total: nonzero is true.
toBool :: Bool32 -> Bool
toBool (Bool32 w) = w /= 0
{-# INLINE toBool #-}

instance From Bool Bool32 where
  from b = if b then TRUE else FALSE

instance From Bool32 Bool where
  from = toBool

-- | @VkDeviceSize@: byte sizes and offsets in device memory.
newtype DeviceSize = DeviceSize Word64
  deriving stock (Show)
  deriving newtype (Bits, Bounded, Enum, Eq, FiniteBits, Integral, Num, Ord, Prim, Real, Storable)

-- | @VkDeviceAddress@: raw device addresses (buffer device address, ray
-- tracing).
newtype DeviceAddress = DeviceAddress Word64
  deriving stock (Show)
  deriving newtype (Bits, Bounded, Enum, Eq, FiniteBits, Integral, Num, Ord, Prim, Real, Storable)

-- | @VkSampleMask@.
newtype SampleMask = SampleMask Word32
  deriving stock (Show)
  deriving newtype (Bits, Bounded, Enum, Eq, FiniteBits, Integral, Num, Ord, Prim, Real, Storable)

-- | A packed Vulkan API version (@VK_MAKE_API_VERSION@ encoding:
-- 3 bits variant, 7 major, 10 minor, 12 patch).
newtype ApiVersion = ApiVersion Word32
  deriving newtype (Eq, Ord, Prim, Storable)

instance Show ApiVersion where
  showsPrec d v =
    showParen (d > 10) $
      showString "ApiVersion "
        . shows (apiVersionMajor v)
        . showChar '.'
        . shows (apiVersionMinor v)
        . showChar '.'
        . shows (apiVersionPatch v)
        . variantSuffix
   where
    variantSuffix
      | apiVersionVariant v == 0 = id
      | otherwise = showString " variant " . shows (apiVersionVariant v)

-- | @makeApiVersion variant major minor patch@.
makeApiVersion :: Word32 -> Word32 -> Word32 -> Word32 -> ApiVersion
makeApiVersion variant major minor patch =
  ApiVersion $
    (variant `shiftL` 29)
      .|. (major `shiftL` 22)
      .|. (minor `shiftL` 12)
      .|. patch
{-# INLINEABLE makeApiVersion #-}

apiVersionVariant :: ApiVersion -> Word32
apiVersionVariant (ApiVersion w) = w `shiftR` 29
{-# INLINE apiVersionVariant #-}

apiVersionMajor :: ApiVersion -> Word32
apiVersionMajor (ApiVersion w) = (w `shiftR` 22) .&. 0x7f
{-# INLINE apiVersionMajor #-}

apiVersionMinor :: ApiVersion -> Word32
apiVersionMinor (ApiVersion w) = (w `shiftR` 12) .&. 0x3ff
{-# INLINE apiVersionMinor #-}

apiVersionPatch :: ApiVersion -> Word32
apiVersionPatch (ApiVersion w) = w .&. 0xfff
{-# INLINE apiVersionPatch #-}

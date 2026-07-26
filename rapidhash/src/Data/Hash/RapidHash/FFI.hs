{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE CApiFFI #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE Strict #-}
{-# LANGUAGE UnliftedFFITypes #-}

{- HLINT ignore "Use camelCase" -}

-- |
-- Low-level FFI for RapidHash. You probably want to use 'Data.Hash.RapidHash.RapidHashable'
-- instead. These may be useful if you have a very specific need or performance requirement.
--
-- For all functions, you must maintain the invariant that the data to be hashed is not
-- mutated during the call. Type tetris won't work here.
--
-- All foreign calls in this module are @unsafe@, so they will briefly pause the capability and
-- garbage collector.
module Data.Hash.RapidHash.FFI (
  COffset,
  CSeed,

  -- * Monomorphic wrappers around FFI
  rapidhashWithSeed_Text,
  rapidhashWithSeed_ShortByteString,
  rapidhashWithSeed_ByteString,
  rapidhashWithSeed_PrimArray,
  rapidhashWithSeed_PrimitiveVector,
  rapidhashWithSeed_StorableVector,

  -- * Bare 'unsafeDupablePerformIO' wrappers around FFI
  rapidhashWithSeed_ByteArray,

  -- ** Unlifted
  rapidhashOffsetWithSeed_ByteArray#,
  rapidhashWithSeed_ByteArray#,

  -- ** Raw FFI
  rapidhashOffsetWithSeedFFI_ByteArray#,
  rapidhashWithSeedFFI_ByteArray#,
  rapidhashWithSeedFFI_Ptr,
) where

import Data.Array.Byte (ByteArray (ByteArray))
import Data.ByteString qualified as BS
import Data.ByteString.Short qualified as SBS
import Data.ByteString.Unsafe qualified as BSUnsafe
import Data.Primitive (Prim (sizeOf#))
import Data.Primitive.PrimArray (PrimArray (PrimArray))
import Data.Text.Internal qualified as TI
import Data.Vector.Primitive qualified as PrimitiveVector
import Data.Vector.Storable qualified as StorableVector
import Data.Void (Void)
import Foreign (Ptr, Storable (sizeOf), castPtr)
import Foreign.C.Types (CSize (CSize))
import GHC.Exts (
  ByteArray#,
  sizeofByteArray#,
 )
import GHC.Int (Int (I#))
import GHC.Word (Word64)
import System.IO.Unsafe (unsafeDupablePerformIO)
import Prelude (IO, Num ((*)), error, fromIntegral, ($), (.))

type CSeed = Word64
type COffset = CSize

----------------------------------------------------------------------------------------------------
-- FFI
----------------------------------------------------------------------------------------------------

foreign import capi unsafe "rapidhash_ext.h rapidhash_offset_withSeed"
  rapidhashOffsetWithSeedFFI_ByteArray#
    :: ByteArray#
    -- ^ The buffer
    -> COffset
    -- ^ Offset into buffer, in bytes
    -> CSize
    -- ^ Length of buffer after offset, in bytes
    -> CSeed
    -> IO Word64

-- |
-- Binding to @rapidhash_ext.h rapidhash_offset_withSeed@.
--
-- This is a small custom shim local to this library, which allows zero-copy hashing of
-- anything wrapping a 'ByteArray#' with an offset, by offloading the offset math to C.
rapidhashOffsetWithSeed_ByteArray# :: CSeed -> ByteArray# -> COffset -> CSize -> Word64
rapidhashOffsetWithSeed_ByteArray# seed ba# off len =
  unsafeDupablePerformIO $
    rapidhashOffsetWithSeedFFI_ByteArray# ba# off len seed
{-# INLINE rapidhashOffsetWithSeed_ByteArray# #-}

foreign import capi unsafe "rapidhash.h rapidhash_withSeed"
  rapidhashWithSeedFFI_ByteArray# :: ByteArray# -> CSize -> CSeed -> IO Word64

-- |
-- Direct binding to @rapidhash.h rapidhash_withSeed@, for anything wrapping a 'ByteArray#'
-- without an offset.
rapidhashWithSeed_ByteArray# :: CSeed -> ByteArray# -> Word64
rapidhashWithSeed_ByteArray# seed arr =
  unsafeDupablePerformIO $
    rapidhashWithSeedFFI_ByteArray# arr (csizeofByteArray# arr) seed
{-# INLINE rapidhashWithSeed_ByteArray# #-}

foreign import capi unsafe "rapidhash.h rapidhash_withSeed"
  rapidhashWithSeedFFI_Ptr :: Ptr Void -> CSize -> CSeed -> IO Word64

----------------------------------------------------------------------------------------------------
-- Data.Array.Byte
----------------------------------------------------------------------------------------------------

-- |
-- Lifted 'rapidhashWithSeed_ByteArray#' for 'ByteArray'.
rapidhashWithSeed_ByteArray :: CSeed -> ByteArray -> Word64
rapidhashWithSeed_ByteArray seed (ByteArray ba#) = rapidhashWithSeed_ByteArray# seed ba#
{-# INLINE rapidhashWithSeed_ByteArray #-}

----------------------------------------------------------------------------------------------------
-- Data.Text
----------------------------------------------------------------------------------------------------

-- |
-- Lifted 'rapidhashOffsetWithSeed_ByteArray#' for 'T.Text'.
--
-- This function reaches into 'T.Text'\'s internals to grab the offset and length into the underlying
-- 'ByteArray#', which lets us do a zero-copy hash.
rapidhashWithSeed_Text :: CSeed -> TI.Text -> Word64
rapidhashWithSeed_Text seed (TI.Text (ByteArray ba#) off len) =
  rapidhashOffsetWithSeed_ByteArray# seed ba# (CSize (fromIntegral off)) (CSize (fromIntegral len))
{-# INLINE rapidhashWithSeed_Text #-}

----------------------------------------------------------------------------------------------------
-- Data.ByteString
----------------------------------------------------------------------------------------------------

-- |
-- Applied 'rapidhashWithSeed_ByteArray' for 'SBS.ShortByteString'.
rapidhashWithSeed_ShortByteString :: CSeed -> SBS.ShortByteString -> Word64
rapidhashWithSeed_ShortByteString seed (SBS.ShortByteString ba) = rapidhashWithSeed_ByteArray seed ba
{-# INLINE rapidhashWithSeed_ShortByteString #-}

-- |
-- Applied 'rapidhashWithSeedFFI_Ptr' for 'BS.ByteString'
rapidhashWithSeed_ByteString :: CSeed -> BS.ByteString -> Word64
rapidhashWithSeed_ByteString seed bs = unsafeDupablePerformIO $
  BSUnsafe.unsafeUseAsCStringLen bs \(cstr, len) ->
    rapidhashWithSeedFFI_Ptr (castPtr cstr) (CSize (fromIntegral len)) seed
{-# INLINE rapidhashWithSeed_ByteString #-}

----------------------------------------------------------------------------------------------------
-- Data.Primitive
----------------------------------------------------------------------------------------------------

rapidhashWithSeed_PrimArray :: CSeed -> PrimArray a -> Word64
rapidhashWithSeed_PrimArray seed (PrimArray ba#) = rapidhashWithSeed_ByteArray# seed ba#
{-# INLINE rapidhashWithSeed_PrimArray #-}

----------------------------------------------------------------------------------------------------
-- Data.Vector
----------------------------------------------------------------------------------------------------

rapidhashWithSeed_PrimitiveVector
  :: forall a. (Prim a) => CSeed -> PrimitiveVector.Vector a -> Word64
rapidhashWithSeed_PrimitiveVector seed (PrimitiveVector.Vector off len (ByteArray ba#)) =
  rapidhashOffsetWithSeed_ByteArray#
    seed
    ba#
    (int2CSize (sizeOfType @a * off))
    (int2CSize (sizeOfType @a * len))
{-# INLINE rapidhashWithSeed_PrimitiveVector #-}

rapidhashWithSeed_StorableVector
  :: forall a. (Storable a) => CSeed -> StorableVector.Vector a -> Word64
rapidhashWithSeed_StorableVector seed v = unsafeDupablePerformIO $
  StorableVector.unsafeWith v \ptr ->
    let len = CSize $ fromIntegral (StorableVector.length v * sizeOf @a (error "sizeOf evaluated"))
     in rapidhashWithSeedFFI_Ptr (castPtr ptr) len seed
{-# INLINE rapidhashWithSeed_StorableVector #-}

----------------------------------------------------------------------------------------------------
-- Utilities
----------------------------------------------------------------------------------------------------

sizeOfType :: forall a. (Prim a) => Int
sizeOfType = I# (sizeOf# (error "sizeOf# evaluated" :: a))
{-# INLINE sizeOfType #-}

csizeofByteArray# :: ByteArray# -> CSize
csizeofByteArray# arr = CSize (fromIntegral (I# (sizeofByteArray# arr)))
{-# INLINE csizeofByteArray# #-}

int2CSize :: Int -> CSize
int2CSize = CSize . fromIntegral
{-# INLINE int2CSize #-}

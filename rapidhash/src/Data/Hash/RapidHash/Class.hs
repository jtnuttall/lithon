-- |
-- The polymorphic implementation of 'RapidHash'. If needed, 'RapidHashable'
-- can be extended at-will.
--
-- Be aware, however, that rapidhash is a block hasher, and this library does not
-- yet implement streaming, so you must process the whole block you want to target at
-- once.
--
-- See 'Data.Hash.RapidHash' and the README for more details.
module Data.Hash.RapidHash.Class (
  -- * rapidhash
  RapidHashable (..),
  rapidhash,

  -- ** File hashing helpers
  rapidhashFileWithSeed,
  rapidhashFile,

  -- * rapidhashMicro
  rapidhashMicro,

  -- * DerivingVia helpers
  HashViaRapidHash (..),
  HashViaRapidHashMicro (..),
) where

import Control.Monad.IO.Class (MonadIO (liftIO))
import Data.Array.Byte (ByteArray)
import Data.ByteString qualified as BS
import Data.ByteString.Short (ShortByteString)
import Data.Coerce (coerce)
import Data.Hashable (Hashable (hashWithSalt))
import Data.Primitive (Prim)
import Data.Primitive.PrimArray (PrimArray)
import Data.Text qualified as T
import Data.Vector.Primitive qualified as PrimitiveVector
import Data.Vector.Storable qualified as StorableVector
import Foreign.Storable (Storable)
import Prelude (Eq, FilePath, fromIntegral, (<$>))

import Data.Hash.RapidHash.FFI
import Data.Hash.RapidHash.Types (
  RapidHash (RapidHash),
  RapidHashMicro (..),
  RapidSeed (RapidSeed),
  defaultSeed,
 )

-- $setup
-- >>> :set -XOverloadedStrings
-- >>> import Data.Hashable (Hashable, hashWithSalt)
-- >>> import Data.Text (Text)

-- | A class for things that can be efficiently passed to rapidhash.
--
-- If you implement your own instance of this class, keep in mind that
-- rapidhash is a block hasher that works over a chunk of information.
--
-- === __Cross-platform stability__
--
-- Instances for types that hold byte representations underneath are
-- cross-platform stable. Instances for types that contain elements reinterpret
-- the underlying memory to get zero-cost copies, and so are __NOT__ stable
-- across platforms.
--
-- There are two ways that these instances break portability:
--
-- 1. Machine word width - this is trivially solvable by using fixed-width
--    types (e.g., Int64 instead of Int)
-- 2. Endianness - no real solution, although for common application development
--    tasks you'll almost certainly know if this applies to you.
class RapidHashable a where
  -- | Run rapidhash with the given seed. This is usually what you want.
  rapidhashWithSeed :: RapidSeed -> a -> RapidHash

  -- | Run rapidhashMicro with the given seed.
  --
  -- rapidhashMicro is tuned for small keys: upstream reports it faster than
  -- rapidhash for inputs up to 512 bytes, and 15-20% slower above 1kb.
  --
  -- It has identical results to 'rapidhashWithSeed' for inputs of 80 bytes or
  -- fewer; from 81 bytes on results diverge.
  rapidhashMicroWithSeed :: RapidSeed -> a -> RapidHashMicro

-- | This instance is stable across platforms.
instance RapidHashable ByteArray where
  rapidhashWithSeed = coerce rapidhashWithSeed_ByteArray
  {-# INLINE rapidhashWithSeed #-}
  rapidhashMicroWithSeed = coerce rapidhashMicroWithSeed_ByteArray
  {-# INLINE rapidhashMicroWithSeed #-}

-- | This instance is stable across platforms.
instance RapidHashable BS.ByteString where
  rapidhashWithSeed = coerce rapidhashWithSeed_ByteString
  {-# INLINE rapidhashWithSeed #-}
  rapidhashMicroWithSeed = coerce rapidhashMicroWithSeed_ByteString
  {-# INLINE rapidhashMicroWithSeed #-}

-- | This instance is stable across platforms.
instance RapidHashable T.Text where
  rapidhashWithSeed = coerce rapidhashWithSeed_Text
  {-# INLINE rapidhashWithSeed #-}
  rapidhashMicroWithSeed = coerce rapidhashMicroWithSeed_Text
  {-# INLINE rapidhashMicroWithSeed #-}

-- | This instance is stable across platforms.
instance RapidHashable ShortByteString where
  rapidhashWithSeed = coerce rapidhashWithSeed_ShortByteString
  {-# INLINE rapidhashWithSeed #-}
  rapidhashMicroWithSeed = coerce rapidhashMicroWithSeed_ShortByteString
  {-# INLINE rapidhashMicroWithSeed #-}

-- | This instance is __NOT__ stable across platforms.
instance RapidHashable (PrimArray a) where
  rapidhashWithSeed = coerce rapidhashWithSeed_PrimArray
  {-# INLINE rapidhashWithSeed #-}
  rapidhashMicroWithSeed = coerce rapidhashMicroWithSeed_PrimArray
  {-# INLINE rapidhashMicroWithSeed #-}

-- | This instance is __NOT__ stable across platforms.
instance (Prim a) => RapidHashable (PrimitiveVector.Vector a) where
  rapidhashWithSeed = coerce rapidhashWithSeed_PrimitiveVector
  {-# INLINE rapidhashWithSeed #-}
  rapidhashMicroWithSeed = coerce rapidhashMicroWithSeed_PrimitiveVector
  {-# INLINE rapidhashMicroWithSeed #-}

-- | This instance is __NOT__ stable across platforms.
--
-- __Warning__: element memory is hashed raw, so the element type's
-- 'Foreign.Storable.Storable' layout must have no uninitialized bytes (padding or
-- otherwise).
instance (Storable a) => RapidHashable (StorableVector.Vector a) where
  rapidhashWithSeed = coerce rapidhashWithSeed_StorableVector
  {-# INLINE rapidhashWithSeed #-}
  rapidhashMicroWithSeed = coerce rapidhashMicroWithSeed_StorableVector
  {-# INLINE rapidhashMicroWithSeed #-}

-- | Run rapidhash with its default seed
rapidhash :: (RapidHashable a) => a -> RapidHash
rapidhash = rapidhashWithSeed defaultSeed
{-# INLINE rapidhash #-}

-- | Read a file into memory strictly, and immediately hash it.
rapidhashFileWithSeed :: (MonadIO m) => RapidSeed -> FilePath -> m RapidHash
rapidhashFileWithSeed seed path = rapidhashWithSeed seed <$> liftIO (BS.readFile path)
{-# INLINE rapidhashFileWithSeed #-}

-- | Read a file into memory strictly, and immediately hash it, with
-- rapidhash's default seed.
rapidhashFile :: (MonadIO m) => FilePath -> m RapidHash
rapidhashFile = rapidhashFileWithSeed defaultSeed
{-# INLINE rapidhashFile #-}

-- | Run rapidhashMicro with its default seed
rapidhashMicro :: (RapidHashable a) => a -> RapidHashMicro
rapidhashMicro = rapidhashMicroWithSeed defaultSeed
{-# INLINE rapidhashMicro #-}

-- |
-- Newtype wrapper implementing 'Hashable' via 'RapidHashable' - works only for
-- types that already implement 'RapidHashable'. All such types should be efficiently
-- block-hashable.
newtype HashViaRapidHash a = HashViaRapidHash a
  deriving newtype (Eq)

instance (RapidHashable a, Eq a) => Hashable (HashViaRapidHash a) where
  hashWithSalt salt (HashViaRapidHash a) =
    let RapidHash h = rapidhashWithSeed (RapidSeed (fromIntegral salt)) a
     in fromIntegral h
  {-# INLINE hashWithSalt #-}

-- |
-- Like 'HashViaRapidHash', but uses 'rapidhashMicroWithSeed'
newtype HashViaRapidHashMicro a = HashViaRapidHashMicro a
  deriving newtype (Eq)

instance (RapidHashable a, Eq a) => Hashable (HashViaRapidHashMicro a) where
  hashWithSalt salt (HashViaRapidHashMicro a) =
    let RapidHashMicro h = rapidhashMicroWithSeed (RapidSeed (fromIntegral salt)) a
     in fromIntegral h
  {-# INLINE hashWithSalt #-}

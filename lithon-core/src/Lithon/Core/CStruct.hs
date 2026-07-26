{-# LANGUAGE AllowAmbiguousTypes #-}

-- | The classes generated struct code targets.
--
-- Every curated Vulkan struct gets a 'CStruct' instance (poke direction).
-- Structs whose members can all be read back without external context also
-- get 'FromCStruct' (peek direction, always a deep copy). 'Nil' provides the
-- all-zeros default that record-update construction and chain-query
-- skeletons start from. Chain-extensible structs additionally implement
-- 'Chainable' so the pNext machinery in "Lithon.Core.Chain" can link them.
module Lithon.Core.CStruct (
  -- * Classes
  CStruct (..),
  FromCStruct (..),
  Nil (..),
  Chainable (..),

  -- * Arena helpers
  new,
  newArray,
  newVector,
  pokeElems,
  peekElems,

  -- * Fixed-size byte-array fields
  peekFixedString,
  pokeFixedString,
  peekFixedBytes,
  pokeFixedBytes,
) where

import Data.ByteString (ByteString)
import Data.ByteString qualified as BS
import Data.ByteString.Unsafe qualified as BSU
import Data.Int (Int32)
import Data.Vector qualified as V
import Data.Word (Word8)
import Foreign.Marshal.Utils (copyBytes, fillBytes)
import Foreign.Ptr (Ptr, castPtr, plusPtr)

import Lithon.Core.Alloc (Alloc, arenaBytes)

-- | A type with an exact C representation that can be written into raw
-- memory. @pokeCStruct@ runs in 'Alloc' so members that are themselves
-- pointers (arrays, strings, nested structs, pNext chains) can allocate
-- their pointees in the ambient arena.
--
-- 'cSize' and 'cAlign' are the C @sizeof@/@alignof@ under the LP64 64-bit
-- ABI lithon targets; generated values are verified against real Vulkan
-- headers by lithon-codegen's ABI gate.
class CStruct a where
  cSize :: Int
  cAlign :: Int
  pokeCStruct :: Ptr a -> a -> Alloc ()

-- | Structs that can be read back out of C memory with no external context.
-- @peekCStruct@ is a deep copy: the result never retains the source pointer
-- or anything reachable from it.
class (CStruct a) => FromCStruct a where
  peekCStruct :: Ptr a -> IO a

-- | The all-zeros (\"not present\") value: numeric fields zero, pointers
-- null, vectors empty, optionals 'Nothing', chains empty. Vulkan's structs
-- are designed so this is always meaningful. The idiom for construction is a
-- multi-field record update of 'nil'.
class Nil a where
  nil :: a

-- | Structs that participate in sType/pNext chains. @sTypeWire@ is the
-- struct's @VkStructureType@ value; @chainOffset@ is the byte offset of its
-- @pNext@ member. Both are generated constants.
class (CStruct a) => Chainable a where
  sTypeWire :: Int32
  chainOffset :: Int

-- | Allocate and poke one value in the arena.
new :: forall a. (CStruct a) => a -> Alloc (Ptr a)
new x = do
  p <- newArray @a 1
  pokeCStruct p x
  pure p
{-# INLINEABLE new #-}

-- | Allocate @n@ uninitialized, correctly aligned slots in the arena.
newArray :: forall a. (CStruct a) => Int -> Alloc (Ptr a)
newArray n = castPtr <$> arenaBytes (cSize @a * max 0 n) (cAlign @a)
{-# INLINEABLE newArray #-}

-- | Poke a vector's elements contiguously starting at the given pointer
-- (which must have room for @length v@ elements).
pokeElems :: forall a. (CStruct a) => Ptr a -> V.Vector a -> Alloc ()
pokeElems p = V.imapM_ \i x -> pokeCStruct (p `plusPtr` (i * cSize @a)) x
{-# INLINEABLE pokeElems #-}

-- | Allocate and poke a whole vector as a contiguous C array.
newVector :: forall a. (CStruct a) => V.Vector a -> Alloc (Ptr a)
newVector v = do
  p <- newArray @a (V.length v)
  pokeElems p v
  pure p
{-# INLINEABLE newVector #-}

-- | Deep-copy @n@ contiguous elements out of C memory.
peekElems :: forall a. (FromCStruct a) => Int -> Ptr a -> IO (V.Vector a)
peekElems n p = V.generateM n \i -> peekCStruct (p `plusPtr` (i * cSize @a))
{-# INLINEABLE peekElems #-}

-- | Read a fixed @char[n]@ field (@deviceName[256]@ style): the bytes up to
-- the first NUL, copied out.
peekFixedString :: Int -> Ptr a -> Int -> IO ByteString
peekFixedString n p off =
  BS.takeWhile (/= 0) <$> peekFixedBytes n p off
{-# INLINEABLE peekFixedString #-}

-- | Write a fixed @char[n]@ field: truncate to @n - 1@ bytes and NUL-pad
-- the remainder (the field always ends NUL-terminated).
pokeFixedString :: Int -> Ptr a -> Int -> ByteString -> IO ()
pokeFixedString n p off bs = do
  let dest = castPtr p `plusPtr` off :: Ptr Word8
      len = min (n - 1) (BS.length bs)
  fillBytes dest 0 n
  BSU.unsafeUseAsCStringLen bs \(src, _) -> copyBytes (castPtr dest) src len
{-# INLINEABLE pokeFixedString #-}

-- | Read a fixed byte-array field (@pipelineCacheUUID[16]@ style) verbatim.
peekFixedBytes :: Int -> Ptr a -> Int -> IO ByteString
peekFixedBytes n p off =
  BS.packCStringLen (castPtr p `plusPtr` off, n)
{-# INLINEABLE peekFixedBytes #-}

-- | Write a fixed byte-array field: truncate to @n@ bytes, zero-pad the
-- remainder.
pokeFixedBytes :: Int -> Ptr a -> Int -> ByteString -> IO ()
pokeFixedBytes n p off bs = do
  let dest = castPtr p `plusPtr` off :: Ptr Word8
      len = min n (BS.length bs)
  fillBytes dest 0 n
  BSU.unsafeUseAsCStringLen bs \(src, _) -> copyBytes (castPtr dest) src len
{-# INLINEABLE pokeFixedBytes #-}

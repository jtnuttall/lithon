-- | Arena allocation for Vulkan marshalling.
--
-- Marshalling a Vulkan call typically produces a tree of nested pointers
-- (create-info structs pointing at arrays pointing at strings…) whose
-- lifetimes are all identical: the duration of the call. An 'Arena' is a bump
-- allocator that owns all of that memory at once; the 'Alloc' monad threads
-- one through the generated @pokeCStruct@ code.
--
-- Lifetime contract: nothing arena-backed escapes the wrapper that allocated
-- it. Peeks copy. 'withArena' brackets the common case; long-lived consumers
-- (e.g. a render loop reusing one arena per frame) can manage 'newArena' /
-- 'resetArena' / 'freeArena' themselves.
--
-- 'withArena' draws from a bounded global pool of arenas rather than
-- allocating fresh: at steady state a wrapper call performs no @malloc@ or
-- @free@ at all, only a pointer bump. Released memory is pooled, not freed —
-- use-after-scope reads stale bytes instead of faulting, but remains a bug.
-- 'arenaBytes' returns zero-filled memory.
module Lithon.Core.Alloc (
  -- * Arena
  Arena,
  newArena,
  freeArena,
  resetArena,
  withArena,

  -- * Arena pools
  ArenaPool,
  newArenaPool,
  withPooledArena,

  -- * The marshalling monad
  Alloc (..),
  runAlloc,
  askArena,

  -- * Allocation primitives
  arenaBytes,
  newBytes,
  newCString,
  newCStrings,
) where

import Control.Concurrent (getNumCapabilities)
import Control.Exception (bracket, throwIO)
import Control.Monad (unless, when)
import Control.Monad.IO.Class (MonadIO (..))
import Control.Monad.IO.Unlift (MonadUnliftIO (..))
import Control.Monad.Trans.Reader (ReaderT (..))
import Data.Bits (complement, (.&.))
import Data.ByteString (ByteString)
import Data.ByteString qualified as BS
import Data.ByteString.Unsafe qualified as BSU
import Data.IORef (IORef, atomicModifyIORef', modifyIORef', newIORef, readIORef, writeIORef)
import Data.Vector qualified as V
import Data.Word (Word8)
import Foreign.C.String (CString)
import Foreign.Marshal.Alloc (free, mallocBytes)
import Foreign.Marshal.Utils (copyBytes, fillBytes)
import Foreign.Ptr (Ptr, castPtr, intPtrToPtr, nullPtr, plusPtr, ptrToIntPtr)
import Foreign.Storable (pokeByteOff, pokeElemOff)
import System.IO.Unsafe (unsafePerformIO)

-- | One @malloc@'d block owned by an arena.
data Chunk = Chunk
  { base :: !(Ptr Word8)
  , size :: !Int
  }

-- | A bump allocator over a list of @malloc@'d chunks.
--
-- Alignment up to 'maxAlign' bytes is supported (Vulkan structs never need
-- more than 8). Allocation is O(1); freeing is wholesale via 'freeArena' or
-- 'resetArena'.
--
-- An arena is single-threaded: its state is plain 'IORef's, so exactly one
-- thread may allocate from it at a time. Pool hand-off ('withPooledArena')
-- is the synchronization point between successive holders.
data Arena = Arena
  { cur :: !(IORef (Ptr Word8))
  , limit :: !(IORef (Ptr Word8))
  , overflow :: !(IORef [Chunk])
  -- ^ Growth chunks, newest first. Freed by reset; @home@ is not.
  , home :: !Chunk
  -- ^ The initial chunk, reused across 'resetArena'.
  , lastSize :: !(IORef Int)
  -- ^ Size of the most recently allocated chunk (doubling heuristic).
  }

-- | Largest supported alignment request.
maxAlign :: Int
maxAlign = 4096

-- | Cap on the chunk-doubling heuristic. Oversized single allocations still
-- get a dedicated chunk of their exact size.
growthCap :: Int
growthCap = 1024 * 1024

-- | Allocate a fresh arena whose first chunk is at least the given size.
newArena :: Int -> IO Arena
newArena initial = do
  let sz = max 256 initial
  p <- mallocBytes sz
  Arena
    <$> newIORef p
    <*> newIORef (p `plusPtr` sz)
    <*> newIORef []
    <*> pure Chunk{base = p, size = sz}
    <*> newIORef sz

-- | Free every chunk. All pointers handed out by this arena are dead. The
-- arena itself must not be used afterwards ('arenaBytes' and 'resetArena'
-- fail fast). Idempotent: a second 'freeArena' is a no-op.
freeArena :: Arena -> IO ()
freeArena a = do
  c <- readIORef a.cur
  l <- readIORef a.limit
  unless (c == nullPtr && l == nullPtr) do
    mapM_ (\ch -> free ch.base) =<< readIORef a.overflow
    writeIORef a.overflow []
    free a.home.base
    writeIORef a.cur nullPtr
    writeIORef a.limit nullPtr

-- | Rewind to the initial chunk (its memory is retained) and free the growth
-- chunks. All previously handed-out pointers are invalidated, but the arena
-- remains usable — the steady-state per-frame pattern. Throws on a freed
-- arena: rewinding into freed memory would resurrect it as heap corruption.
resetArena :: Arena -> IO ()
resetArena a = do
  c <- readIORef a.cur
  l <- readIORef a.limit
  when (c == nullPtr && l == nullPtr) $
    throwIO (userError "lithon-core: resetArena on a freed arena")
  mapM_ (\ch -> free ch.base) =<< readIORef a.overflow
  writeIORef a.overflow []
  writeIORef a.cur a.home.base
  writeIORef a.limit (a.home.base `plusPtr` a.home.size)
  writeIORef a.lastSize a.home.size

-- | A bounded pool of reusable arenas. 'withArena' checks out of a global
-- pool; embedders with special needs (isolation, sizing) can run
-- 'withPooledArena' against their own.
--
-- Pooled arenas always hold exactly their home chunk (release resets, which
-- frees all growth chunks), so an idle pool retains at most
-- @capacity * chunk@ bytes.
data ArenaPool = ArenaPool
  { stack :: !(IORef (Int, [Arena]))
  -- ^ Size-counted stack of idle arenas.
  , capacity :: !Int
  -- ^ Max idle arenas retained; over-capacity releases free instead.
  , chunk :: !Int
  -- ^ Home-chunk size for arenas the pool creates.
  }

-- | A pool retaining up to @capacity@ idle arenas, created on demand with
-- @chunk@-byte home chunks.
newArenaPool :: Int -> Int -> IO ArenaPool
newArenaPool capacity chunk = do
  stack <- newIORef (0, [])
  pure ArenaPool{stack, capacity, chunk}

acquireArena :: ArenaPool -> IO Arena
acquireArena pool = do
  popped <- atomicModifyIORef' pool.stack \case
    (n, a : as) -> ((n - 1, as), Just a)
    idle -> (idle, Nothing)
  maybe (newArena pool.chunk) pure popped

-- | Reset first, push second: an arena must be clean before another thread
-- can pop it. Over capacity, degrade to freeing (plain malloc/free churn).
releaseArena :: ArenaPool -> Arena -> IO ()
releaseArena pool a = do
  resetArena a
  pushed <- atomicModifyIORef' pool.stack \(n, as) ->
    if n < pool.capacity then ((n + 1, a : as), True) else ((n, as), False)
  unless pushed (freeArena a)

-- | Bracket an action with an arena checked out of the given pool. The
-- checkout is reset and returned on exit, exceptions included. Exactly one
-- thread may use a checkout at a time; the pool's atomic hand-off publishes
-- one holder's writes to the next.
withPooledArena :: (MonadUnliftIO m) => ArenaPool -> (Arena -> m a) -> m a
withPooledArena pool f =
  withRunInIO \run -> bracket (acquireArena pool) (releaseArena pool) (run . f)

-- | The pool behind 'withArena': up to @max 4 (2 * numCapabilities)@ idle
-- 16 KiB arenas. Blocking @safe@ foreign calls hold their checkout while
-- other threads run on the capability, so live checkouts can exceed the
-- capability count; the 2x bound absorbs that. Never drained at exit; the OS
-- reclaims.
globalArenaPool :: ArenaPool
globalArenaPool = unsafePerformIO do
  caps <- getNumCapabilities
  newArenaPool (max 4 (2 * caps)) 16384
{-# NOINLINE globalArenaPool #-}

-- | Bracket an action with an arena from the global pool; everything
-- allocated within is invalidated when the action returns (memory is pooled
-- for reuse, not freed).
withArena :: (MonadUnliftIO m) => (Arena -> m a) -> m a
withArena = withPooledArena globalArenaPool

-- | The marshalling monad: an 'IO' computation with an 'Arena' in reach.
-- Generated @pokeCStruct@ code runs in 'Alloc' so nested pointer structure
-- can be allocated without threading anything by hand.
newtype Alloc a = Alloc (Arena -> IO a)
  deriving
    (Applicative, Functor, Monad, MonadIO, MonadUnliftIO)
    via ReaderT Arena IO

-- | Run an 'Alloc' computation against an arena.
runAlloc :: Arena -> Alloc a -> IO a
runAlloc a (Alloc f) = f a

-- | The ambient arena.
askArena :: Alloc Arena
askArena = Alloc pure

-- | @arenaBytes size align@: allocate @size@ bytes at an @align@-byte
-- boundary. @align@ must be a power of two @<= 4096@ (always-on assertion —
-- a misaligned Vulkan struct is undefined behavior at the driver boundary).
-- The returned memory is zero-filled: struct padding and driver-unwritten
-- out-params read as deterministic zeros, never as a previous call's bytes.
arenaBytes :: Int -> Int -> Alloc (Ptr Word8)
arenaBytes n align = Alloc \a -> arenaBytesIO a n align

arenaBytesIO :: Arena -> Int -> Int -> IO (Ptr Word8)
arenaBytesIO a n align = do
  unless (align > 0 && align <= maxAlign && align .&. (align - 1) == 0) $
    throwIO (userError ("lithon-core: invalid alignment request: " <> show align))
  unless (n >= 0) $
    throwIO (userError ("lithon-core: negative allocation size: " <> show n))
  c <- readIORef a.cur
  l <- readIORef a.limit
  if c == nullPtr && l == nullPtr then
    throwIO (userError "lithon-core: arena used after freeArena")
  else do
    let p = alignUp c align
    if p `plusPtr` n <= l then do
      writeIORef a.cur (p `plusPtr` n)
      fillBytes p 0 n
      pure p
    else
      grow
 where
  grow = do
    lastSz <- readIORef a.lastSize
    let want = max (min (2 * lastSz) growthCap) (n + align)
    p0 <- mallocBytes want
    modifyIORef' a.overflow (Chunk{base = p0, size = want} :)
    writeIORef a.lastSize want
    let p = alignUp p0 align
    writeIORef a.cur (p `plusPtr` n)
    writeIORef a.limit (p0 `plusPtr` want)
    fillBytes p 0 n
    pure p

alignUp :: Ptr Word8 -> Int -> Ptr Word8
alignUp p align =
  let m = fromIntegral align - 1
   in intPtrToPtr ((ptrToIntPtr p + m) .&. complement m)

-- | Copy a 'ByteString' into the arena verbatim (no terminator) — byte
-- buffers with explicit lengths (@pInitialData@ and friends).
newBytes :: ByteString -> Alloc (Ptr Word8)
newBytes bs = do
  p <- arenaBytes (max 1 (BS.length bs)) 8
  liftIO $ BSU.unsafeUseAsCStringLen bs (uncurry (copyBytes (castPtr p)))
  pure p

-- | Copy a 'ByteString' into the arena with a NUL terminator appended.
newCString :: ByteString -> Alloc CString
newCString bs = do
  p <- arenaBytes (BS.length bs + 1) 1
  liftIO do
    BSU.unsafeUseAsCStringLen bs (uncurry (copyBytes (castPtr p)))
    pokeByteOff p (BS.length bs) (0 :: Word8)
  pure (castPtr p)

-- | Marshal a vector of strings as a C @const char* const*@ array (each
-- element NUL-terminated, all storage in the arena).
newCStrings :: V.Vector ByteString -> Alloc (Ptr CString)
newCStrings v = do
  arr <- arenaBytes (ptrSize * max 1 (V.length v)) ptrSize
  let out = castPtr arr :: Ptr CString
  V.imapM_ (\i bs -> liftIO . pokeElemOff out i =<< newCString bs) v
  pure out
 where
  ptrSize = 8

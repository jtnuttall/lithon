-- | Arena properties: alignment, non-overlap, content integrity across
-- chunk growth, reset/reuse, zeroing, free/reset misuse guards, and pool
-- checkout semantics (reuse, exception-safe release, nesting).
module Core.AllocTest (
  hprop_alignedDisjointIntact,
  unit_resetReusesHomeChunk,
  unit_useAfterFreeFailsFast,
  unit_badAlignmentRejected,
  unit_arenaBytesZeroed,
  unit_freeArenaIdempotent,
  unit_resetAfterFreeThrows,
  unit_poolReusesArena,
  unit_poolReleasesOnException,
  unit_nestedCheckoutsDistinct,
) where

import Control.Exception (bracket, throwIO, try)
import Data.List (sortOn)
import Data.Word (Word8)
import Foreign.Marshal.Array (peekArray)
import Foreign.Marshal.Utils (fillBytes)
import Foreign.Ptr (Ptr, ptrToIntPtr)
import Hedgehog (Property, assert, evalIO, forAll, property, (===))
import Hedgehog.Gen qualified as Gen
import Hedgehog.Range qualified as Range
import Test.Tasty.HUnit (Assertion, assertBool, assertEqual)

import Lithon.Core.Alloc

-- | Random allocation sequences stay aligned, disjoint, and intact — even
-- when a deliberately tiny initial chunk forces repeated growth.
hprop_alignedDisjointIntact :: Property
hprop_alignedDisjointIntact = property do
  reqs <-
    forAll $
      Gen.list (Range.linear 1 120) $
        (,) <$> Gen.int (Range.linear 1 300) <*> Gen.element [1, 2, 4, 8, 16]
  regions <- evalIO $ bracket (newArena 64) freeArena \a -> do
    rs <- traverse (allocOne a) (zip [0 :: Int ..] reqs)
    traverse readBack rs
  -- alignment
  assert $ all (\r -> ptrToIntPtr r.ptr `mod` fromIntegral r.align == 0) regions
  -- pairwise disjoint (sorted by address, end <= next start)
  let sorted = sortOn (\r -> ptrToIntPtr r.ptr) regions
      disjoint (r1 : rest@(r2 : _)) =
        (ptrToIntPtr r1.ptr + fromIntegral r1.len <= ptrToIntPtr r2.ptr) && disjoint rest
      disjoint _ = True
  assert (disjoint sorted)
  -- content integrity: every region still holds its fill byte
  mapM_ (\r -> r.contents === replicate r.len r.fill) regions
 where
  allocOne a (i, (n, align)) = do
    p <- runAlloc a (arenaBytes n align)
    let fill = fromIntegral (i * 37 `mod` 251) :: Word8
    fillBytes p fill n
    pure Region{ptr = p, len = n, align, fill, contents = []}
  readBack r = do
    bytes <- peekArray r.len r.ptr
    pure r{contents = bytes}

data Region = Region
  { ptr :: !(Ptr Word8)
  , len :: !Int
  , align :: !Int
  , fill :: !Word8
  , contents :: ![Word8]
  }
  deriving stock (Show)

-- | Reset rewinds to the initial chunk: the next allocation lands where the
-- first one did, and the memory is reusable.
unit_resetReusesHomeChunk :: Assertion
unit_resetReusesHomeChunk =
  bracket (newArena 256) freeArena \a -> do
    p1 <- runAlloc a (arenaBytes 100 8)
    fillBytes p1 0xAB 100
    resetArena a
    p2 <- runAlloc a (arenaBytes 100 8)
    assertEqual "reset reuses the home chunk" p1 p2

-- | Allocating from a freed arena throws instead of scribbling.
unit_useAfterFreeFailsFast :: Assertion
unit_useAfterFreeFailsFast = do
  a <- newArena 64
  freeArena a
  r <- try @IOError (runAlloc a (arenaBytes 8 8))
  assertBool "use-after-free throws" (either (const True) (const False) r)

-- | Invalid alignment requests are rejected.
unit_badAlignmentRejected :: Assertion
unit_badAlignmentRejected =
  bracket (newArena 64) freeArena \a -> do
    r <- try @IOError (runAlloc a (arenaBytes 8 3))
    assertBool "non-power-of-two alignment throws" (either (const True) (const False) r)

-- | Allocation returns zero-filled memory even when the chunk holds a
-- previous cycle's bytes — the reuse case pooling makes routine.
unit_arenaBytesZeroed :: Assertion
unit_arenaBytesZeroed =
  bracket (newArena 256) freeArena \a -> do
    p1 <- runAlloc a (arenaBytes 64 8)
    fillBytes p1 0xAB 64
    resetArena a
    p2 <- runAlloc a (arenaBytes 64 8)
    assertEqual "reset lands on the same bytes" p1 p2
    bytes <- peekArray 64 p2
    assertEqual "fresh allocation is zeroed" (replicate 64 (0 :: Word8)) bytes

-- | A second 'freeArena' is a no-op, not a glibc double-free.
unit_freeArenaIdempotent :: Assertion
unit_freeArenaIdempotent = do
  a <- newArena 64
  freeArena a
  freeArena a

-- | Rewinding a freed arena would resurrect freed memory; it throws instead.
unit_resetAfterFreeThrows :: Assertion
unit_resetAfterFreeThrows = do
  a <- newArena 64
  freeArena a
  r <- try @IOError (resetArena a)
  assertBool "resetArena after freeArena throws" (either (const True) (const False) r)

-- | A released checkout is reused: the next checkout's first allocation
-- lands on the same home chunk. (Private pool — the global one is shared
-- with concurrently running tests.)
unit_poolReusesArena :: Assertion
unit_poolReusesArena = do
  pool <- newArenaPool 4 256
  p1 <- withPooledArena pool \a -> runAlloc a (arenaBytes 16 8)
  p2 <- withPooledArena pool \a -> runAlloc a (arenaBytes 16 8)
  assertEqual "second checkout reuses the pooled home chunk" p1 p2

-- | The checkout returns to the pool even when the action throws.
unit_poolReleasesOnException :: Assertion
unit_poolReleasesOnException = do
  pool <- newArenaPool 4 256
  p1 <- withPooledArena pool \a -> runAlloc a (arenaBytes 16 8)
  r <- try @IOError $ withPooledArena pool \a -> do
    _ <- runAlloc a (arenaBytes 16 8)
    throwIO (userError "boom")
  assertBool "action threw" (either (const True) (const False) r)
  p3 <- withPooledArena pool \a -> runAlloc a (arenaBytes 16 8)
  assertEqual "arena returned to the pool despite the exception" p1 p3

-- | Nested checkouts from one pool are distinct arenas, not aliases.
unit_nestedCheckoutsDistinct :: Assertion
unit_nestedCheckoutsDistinct = do
  pool <- newArenaPool 4 256
  withPooledArena pool \outer -> do
    po <- runAlloc outer (arenaBytes 16 8)
    withPooledArena pool \inner -> do
      pn <- runAlloc inner (arenaBytes 16 8)
      assertBool "nested checkout is a distinct arena" (po /= pn)

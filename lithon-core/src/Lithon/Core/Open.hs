-- | Open enums.
--
-- Vulkan enums grow over time: a driver newer than your binding can hand you
-- values your ADT has no constructor for. 'Open' absorbs that without
-- brittleness — the inner ADT stays clean (total matches, DataKinds
-- promotion), while the wire side stays total.
--
-- Only enums that can /flow out/ of the driver need this treatment; lithon's
-- generator wraps exactly those (per the registry's flow analysis). Purely
-- input-side enums appear bare.
--
-- Every curated Vulkan enum block is 32-bit signed on the wire, so the wire
-- type is fixed to 'Int32' (lithon-codegen hard-errors if a future registry
-- breaks that invariant; 64-bit masks are 'Lithon.Core.Flags.Flags').
module Lithon.Core.Open (
  Open (.., Is),
  HasWire (..),
  openToWire,
  openFromWire,
  unsafeFromWire,
  known,
) where

import Data.Int (Int32)
import GHC.Stack (HasCallStack)
import Witch (From (..), TryFrom (..), TryFromException (..))

-- | A value of enum @a@, or a raw wire value the binding doesn't recognize.
-- Isomorphic to @'Either' 'Int32' a@, kept nominal for instances and intent.
data Open a
  = Known !a
  | Unknown !Int32
  deriving stock (Eq, Ord, Show)

-- | Terse bidirectional synonym for 'Known': construct with
-- @format = Is FormatB8G8R8A8Srgb@, match with @case f of Is x -> …@.
pattern Is :: a -> Open a
pattern Is x = Known x

{-# COMPLETE Is, Unknown #-}

-- | Wire conversion for a generated enum ADT. @fromWire@ is partial-by-Maybe
-- (gaps and future values yield 'Nothing'); 'openFromWire' is the total
-- decoding everything generated uses.
class HasWire a where
  toWire :: a -> Int32
  fromWire :: Int32 -> Maybe a

-- | Total encoding.
openToWire :: (HasWire a) => Open a -> Int32
openToWire = \case
  Known x -> toWire x
  Unknown w -> w
{-# INLINEABLE openToWire #-}

-- | Total decoding: unrecognized wire values are preserved, not lost.
openFromWire :: (HasWire a) => Int32 -> Open a
openFromWire w = maybe (Unknown w) Known (fromWire w)
{-# INLINEABLE openFromWire #-}

-- | Project the recognized value, if any.
known :: Open a -> Maybe a
known = \case
  Known x -> Just x
  Unknown _ -> Nothing
{-# INLINEABLE known #-}

-- | Decode a wire value __this binding wrote__: input-only (closed) enums
-- round-tripping through memory the driver never touches. Errors on an
-- unrecognized value — that is a lithon bug or memory corruption, not a
-- driver-compatibility event (driver-written enums are 'Open' and decode
-- with 'openFromWire' instead).
unsafeFromWire :: (HasCallStack, HasWire a) => Int32 -> a
unsafeFromWire w = case fromWire w of
  Just x -> x
  Nothing ->
    error ("lithon: unrecognized closed-enum wire value " <> show w)
{-# INLINEABLE unsafeFromWire #-}

-- | Injection is total.
instance From a (Open a) where
  from = Known

-- | Projection can fail (the value may be unrecognized).
instance TryFrom (Open a) a where
  tryFrom = \case
    Known x -> Right x
    o@(Unknown _) -> Left (TryFromException o Nothing)

{-# LANGUAGE DefaultSignatures #-}

-- | Prim-representable values.
--
-- 'Prim' powers packed heap arrays ('Data.Primitive.PrimArray.PrimArray' and
-- friends), but it only derives via @newtype@ — semantic types like 'Bool'
-- or a generated enum have no lawful composite instance. 'Primlike' widens
-- the reach: a type is Primlike when it is one total coercion away from a
-- primitive representation. Dense state tables (input state, per-frame
-- flags) store the representation; call sites read and write the semantic
-- type.
--
-- The wrapper is free. With the 'INLINE' methods here and concrete element
-- types at the use site, GHC specializes the dictionary away and hot loops
-- run on raw @Int#@\/@Word8#@ — boxes exist only at function entry\/exit
-- (verified against the Core on GHC 9.12).
--
-- The law is deliberately one-sided: @'fromPrim' . 'toPrim' = 'id'@, but
-- @'toPrim' . 'fromPrim'@ may normalize (any nonzero byte reads back as
-- 'True' and re-encodes as 1). 'PrimViaEnum'\'s decode inherits 'toEnum'\'s
-- range check — reading a byte no constructor claims errors out rather than
-- fabricating a value, which is the tripwire you want against corrupt or
-- uninitialized table memory.
--
-- Siblings: 'Lithon.Core.Unbox' documents the @UnboxViaPrim@ recipe for
-- types that /are/ @newtype@-'Prim'; 'Lithon.Core.Open.HasWire' is the
-- driver-facing analogue where decoding must be total.
module Lithon.Core.Primlike (
  Primlike (..),
  PrimViaEnum (..),
) where

import Data.Int (Int16, Int32, Int64, Int8)
import Data.Primitive.Types (Prim)
import Data.Word (Word16, Word32, Word64, Word8)

-- | Types one total coercion away from a 'Prim' representation.
class (Prim (PrimRep a)) => Primlike a where
  -- | The primitive representation; defaults to @a@ itself for types that
  -- are already 'Prim'.
  type PrimRep a

  type PrimRep a = a

  toPrim :: a -> PrimRep a
  default toPrim :: (a ~ PrimRep a) => a -> PrimRep a
  toPrim = id
  {-# INLINE toPrim #-}

  fromPrim :: PrimRep a -> a
  default fromPrim :: (a ~ PrimRep a) => PrimRep a -> a
  fromPrim = id
  {-# INLINE fromPrim #-}

-- | Stored as a single byte; any nonzero byte decodes as 'True'.
instance Primlike Bool where
  type PrimRep Bool = Word8
  toPrim b = if b then 1 else 0
  {-# INLINE toPrim #-}
  fromPrim = (/= 0)
  {-# INLINE fromPrim #-}

instance Primlike Word8

instance Primlike Word16

instance Primlike Word32

instance Primlike Word64

instance Primlike Word

instance Primlike Int8

instance Primlike Int16

instance Primlike Int32

instance Primlike Int64

instance Primlike Int

instance Primlike Float

instance Primlike Double

-- | @DerivingVia@ carrier: represent an 'Enum' by its 'fromEnum' 'Int'.
--
-- > data Key = KeyA | KeyB | KeyC
-- >   deriving stock (Bounded, Enum)
-- >   deriving (Primlike) via (PrimViaEnum Key)
--
-- (The deriving site needs @UndecidableInstances@ for the associated-family
-- instance GHC generates.) Decoding uses 'toEnum' and therefore errors on
-- out-of-range values — see the module note on why that is a feature.
--
-- TODO: a width-selecting variant (@Word8@\/@Word16@ chosen from 'Bounded')
-- once a consumer cares about table density.
newtype PrimViaEnum a = PrimViaEnum a

instance (Enum a) => Primlike (PrimViaEnum a) where
  type PrimRep (PrimViaEnum a) = Int
  toPrim (PrimViaEnum a) = fromEnum a
  {-# INLINE toPrim #-}
  fromPrim = PrimViaEnum . toEnum
  {-# INLINE fromPrim #-}

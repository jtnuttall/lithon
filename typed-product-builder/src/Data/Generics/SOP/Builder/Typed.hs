{-# LANGUAGE DerivingVia #-}
{-# OPTIONS_GHC -Wno-orphans #-}
{-# OPTIONS_GHC -Wno-redundant-constraints #-}

module Data.Generics.SOP.Builder.Typed (
  -- * The generic builder
  GBuilder,

  -- ** Create and consumer builders
  buildNP,
  buildTypedNP,
  buildTyped,
  buildWith,

  -- ** Explicitly manipulate 'Generics.SOP' 'NP'
  injectNP,
  replaceNP,

  -- ** Manipulate via 'Generic.SOP.Generic'
  replace,
  injectA,
  injectA_,
  inject,
  inject_,
  injectI,
  injectI_,
  injectIA,
  injectIA_,

  -- ** Fully generic
  ginjectA,
  ginject,
  concatNP,
  pconcatNP,

  -- * Utility

  -- ** Tagging
  Named (..),
  unname,

  -- * Re-exports

  -- ** 'Control.Category'
  module Control.Category,

  -- ** Data.Generics.SOP.Typed
  module Data.Generics.SOP.Typed,

  -- ** 'Generics.SOP'
  I (..),
  NP (..),
  productTypeFrom,
  productTypeTo,

  -- ** 'Data.Profunctor'
  Star (..),
  Profunctor (rmap, lmap, dimap),
  Strong (first', second'),
  strong,

  -- ** 'Data.Generics.Product'
  HasType (..),
) where

import Control.Category ((>>>))
import Control.DeepSeq (NFData)
import Data.Bits (Bits, FiniteBits)
import Data.Functor.Classes (Eq1, Ord1, Read1, Show1)
import Data.Generics.Product (HasType (getTyped, typed))
import Data.Ix (Ix)
import Data.Profunctor (
  Profunctor (dimap, lmap, rmap),
  Star (Star, runStar),
  Strong (first', second'),
 )
import Data.Profunctor.Strong (strong)
import Data.Tagged (Tagged (Tagged))
import Fcf.Class.Monoid (type (<>))
import Foreign (Storable)
import GHC.Generics qualified as GHC
import Generics.SOP (
  All,
  Generic,
  I (..),
  IsProductType,
  NP (..),
  SOP (SOP),
  productTypeFrom,
  productTypeTo,
 )
import Prelude (
  Applicative (pure),
  Bounded,
  Enum,
  Eq,
  Floating,
  Foldable,
  Fractional,
  Functor (fmap),
  Monad,
  Monoid,
  Num,
  Ord,
  Read,
  Semigroup,
  Show,
  Traversable,
  const,
  uncurry,
  (.),
 )

import Data.Generics.SOP.Typed

type GBuilder f i o = Star f (NP I i) (NP I o)

buildNP :: (AllUniqueTyped o) => GBuilder f '[] o -> f (NP I o)
buildNP = (`runStar` Nil)

buildWith :: (AllUniqueTyped o, Functor f) => (NP I o -> b) -> GBuilder f '[] o -> f b
buildWith f = fmap f . buildNP

-- |
-- Consume a generic builder to produce an explicit 'NP'. This injects 'getTyped' pointwise per type, which
-- means that the order of 'o' does not have to match that of 'tys'.
buildTypedNP
  :: (All (TypeIn (NP I o)) o, AllUniqueTyped o, Functor f) => GBuilder f '[] o -> f (NP I o)
buildTypedNP = fmap npFromTyped . buildNP

-- |
-- Consume a generic builder to produce some type 'b'. This injects 'getTyped' pointwise per type, which
-- means that the order of 'o' does not have to match that of 'tys'.
--
-- Helpful notes:
--  - Use 'I' if you need an unary product.
--  - Use newtypes liberally; injections should be monomorphic in the covariant position
--
-- === Examples
--
-- Explicit product:
-- >>> import GHC.Generics qualified as GHC
-- >>> data Simple = Simple String Int Float deriving stock (Show, GHC.Generic) deriving anyclass (Generic)
-- >>> -- Notice: out-of-order, using 'I'
-- >>> buildTyped @Simple $ inject_ (I @Float 7.123) >>> inject_ ("hello world!", 5 :: Int)
-- Simple "hello world!" 5 7.123
--
-- Using tuples:
-- >>> buildTyped @(Int, String, Bool, Float) $ inject_ (1 :: Float, "hi!") >>> inject_ (True, 5 :: Int)
-- (5,"hi!",True,1.0)
--
-- Using 'getTyped':
-- >>> tup = (7, 49) :: (Int, Int)
-- >>> resultStr c t = Named @"result" $ getTyped @String c <> ": " <> show t
-- >>> resultFloat (x, y) = realToFrac x / realToFrac y :: Float
-- >>> sink c = let t = getTyped @(Int, Int) c in (resultStr c t, resultFloat t)
-- >>> buildTyped @(Named "result" String, Float) @I $ inject_ (tup, "hello there!") >>> inject sink
-- I (Named "hello there!: (7,49)",0.14285715)
buildTyped
  :: forall b f tys o
   . (AllUniqueTyped o, All (TypeIn (NP I o)) tys, AllUniqueTyped tys, IsProductType b tys, Functor f)
  => GBuilder f '[] o -> f b
buildTyped = fmap productFromTyped . buildNP

injectNP :: (Functor f) => (NP I i -> f (NP I o)) -> GBuilder f i (i <> o)
injectNP f = pconcatNP (replaceNP f)

replaceNP :: (NP I i -> f (NP I o)) -> GBuilder f i o
replaceNP = Star

replaceA :: (IsProductType b o, Functor f) => (NP I i -> f b) -> GBuilder f i o
replaceA = rmap productTypeFrom . Star

replace :: (IsProductType b o, Applicative f) => (NP I i -> b) -> GBuilder f i o
replace f = replaceA (pure . f)

injectA :: (IsProductType b o, Functor f) => (NP I i -> f b) -> GBuilder f i (i <> o)
injectA f = pconcatNP (replaceA f)

injectA_ :: (IsProductType b o, Functor f) => f b -> GBuilder f i (i <> o)
injectA_ v = injectA (const v)

inject :: (IsProductType b o, Applicative f) => (NP I i -> b) -> GBuilder f i (i <> o)
inject f = injectA (pure . f)

inject_ :: (IsProductType b o, Applicative f) => b -> GBuilder f i (i <> o)
inject_ v = inject (const v)

injectIA :: (IsProductType (I b) o, Functor f) => (NP I i -> f b) -> GBuilder f i (i <> o)
injectIA f = injectA (fmap I . f)

-- injectIA_ :: (IsProductType (I b) o, Applicative f) => b -> GBuilder f i (i <> o)
injectIA_ :: (IsProductType (I b) o, Functor f) => f b -> GBuilder f i (i <> o)
injectIA_ = injectA_ . fmap I

injectI :: (IsProductType (I b) o, Applicative f) => (NP I i -> b) -> GBuilder f i (i <> o)
injectI f = inject (I . f)

injectI_ :: (IsProductType (I b) o, Applicative f) => b -> GBuilder f i (i <> o)
injectI_ = inject_ . I

greplace :: (IsProductType a i, IsProductType b o, Functor f) => (a -> f b) -> GBuilder f i o
greplace = dimap productTypeTo productTypeFrom . Star

ginjectA
  :: (IsProductType a i, IsProductType b o, Functor f) => (a -> f b) -> GBuilder f i (i <> o)
ginjectA f = pconcatNP (greplace f)

ginject
  :: (IsProductType a i, IsProductType b o, Applicative f) => (a -> b) -> GBuilder f i (i <> o)
ginject f = ginjectA (pure . f)

concatNP :: NP f as -> NP f bs -> NP f (as <> bs)
concatNP Nil bs = bs
concatNP (a :* as) bs = a :* concatNP as bs

pconcatNP :: (Strong p) => p (NP f as) (NP f bs) -> p (NP f as) (NP f (as <> bs))
pconcatNP = rmap (uncurry concatNP) . strong (,)

-- |
-- Cheap utility type similar to 'Data.Tagged.Tagged', with a 'Generics.SOP.Generic' instance and
-- a nominal role for the tag.
--
-- Intentionally doesn't derive 'Real'/'RealFrac'/'RealFloat' because shoving those through a newtype
-- causes pretty severe issues (e.g., 'RealFrac' on a newtype causes everything to go through 'Rational').
newtype Named tag a = Named a
  deriving stock (Eq, Foldable, Functor, GHC.Generic, GHC.Generic1, Ord, Read, Show, Traversable)
  deriving (Generic) via (I a)
  deriving
    ( Bits
    , Bounded
    , Enum
    , FiniteBits
    , Floating
    , Fractional
    , Ix
    , Monoid
    , NFData
    , Num
    , Semigroup
    , Storable
    )
    via (Tagged tag a)
  deriving (Applicative, Eq1, Monad, Ord1, Read1, Show1) via (Tagged tag)

type role Named nominal representational

unname :: Named tag a -> a
unname (Named a) = a

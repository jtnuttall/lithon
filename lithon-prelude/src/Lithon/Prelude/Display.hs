{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Lithon.Prelude.Display (
  module Data.Text.Display,
  DisplayFrom,
  DisplayFrom_,
  DisplayFromTagMay (..),
  GDisplayDelim,
  GDisplayNoDelim,
  GDisplaySOP (..),
  gdisplaySOP,
  gdisplayProduct,
) where

import Data.Foldable (fold)
import Data.List qualified as L
import Data.Maybe (Maybe (Just, Nothing), maybe)
import Data.Proxy (Proxy (Proxy))
import Data.Tagged (Tagged (Tagged))
import Data.Text.Builder.Linear (Builder)
import Data.Text.Display
import GHC.TypeLits (KnownSymbol, Symbol, symbolVal)
import Generics.SOP (
  All,
  All2,
  ConstructorInfo,
  DatatypeName,
  Generic (Code),
  HasDatatypeInfo (datatypeInfo),
  I,
  IsProductType,
  K (K),
  NP,
  Shape (ShapeNil),
  constructorInfo,
  constructorName,
  datatypeName,
  hcliftA2,
  hcmap,
  hcollapse,
  mapIK,
  productTypeFrom,
  shape,
  unSOP,
 )
import Generics.SOP qualified as SOP
import Witch (From (from))
import Prelude (id, mempty, null, otherwise, (.), (<>))

instance {-# OVERLAPPABLE #-} (Display a) => From a Builder where
  from = displayBuilder

type family SymOrEmpty (mtag :: Maybe Symbol) where
  SymOrEmpty (Just sym) = sym
  SymOrEmpty Nothing = ""

symOrEmpty :: forall tag. (KnownSymbol (SymOrEmpty tag)) => Builder
symOrEmpty = displayBuilder (symbolVal (Proxy @(SymOrEmpty tag)))

type DisplayFrom tag = DisplayFromTagMay (Just tag)
type DisplayFrom_ = DisplayFromTagMay Nothing
newtype DisplayFromTagMay (tag :: Maybe Symbol) a = DisplayFromTagMay a

instance (KnownSymbol (SymOrEmpty tag), Display a) => Display (DisplayFromTagMay tag a) where
  displayBuilder (DisplayFromTagMay v) = symOrEmpty @tag <> ": " <> displayBuilder v

type GDisplayDelim d = GDisplaySOP (Just d)
type GDisplayNoDelim = GDisplaySOP Nothing
newtype GDisplaySOP (d :: Maybe Symbol) a = GDisplaySOP a

instance (KnownSymbol (SymOrEmpty d), HasDatatypeInfo a, All2 Display (Code a)) => Display (GDisplaySOP d a) where
  displayBuilder (GDisplaySOP a) = gdisplaySOP (Tagged (symOrEmpty @d)) a

gdisplaySOP
  :: forall a. (HasDatatypeInfo a, All2 Display (Code a)) => Tagged "delimiter" Builder -> a -> Builder
gdisplaySOP d =
  hcollapse
    . hcliftA2 (Proxy @(All Display)) (ctorAnn d) (constructorInfo (datatypeInfo (Proxy @a)))
    . unSOP
    . SOP.from

ctorAnn
  :: forall xs
   . (All Display xs) => Tagged "delimiter" Builder -> ConstructorInfo xs -> NP I xs -> K Builder xs
ctorAnn d i = K . (prefix <>) . gdisplayNP d Nothing
 where
  name = constructorName i
  prefix
    | null name = mempty
    | otherwise = displayBuilder case shape :: Shape xs of
        ShapeNil -> name
        _ -> name <> ": "

gdisplayProduct
  :: forall a xs
   . (HasDatatypeInfo a, IsProductType a xs, All Display xs)
  => Tagged "delimiter" Builder -> a -> Builder
gdisplayProduct d = gdisplayNP d (Just (datatypeName (datatypeInfo @a Proxy))) . productTypeFrom

gdisplayNP
  :: forall xs
   . (All Display xs)
  => Tagged "delimiter" Builder
  -> Maybe DatatypeName
  -> NP I xs
  -> Builder
gdisplayNP (Tagged d) mn =
  dtAnn
    . fold
    . L.intersperse d
    . hcollapse
    . hcmap (Proxy @Display) (mapIK displayBuilder)
 where
  dtAnn = maybe id (\n -> (displayBuilder n <>) . (": " <>)) mn

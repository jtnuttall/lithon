module Lithon.Prelude.Generics.SOP (
  module X,

  -- * 'Generics.SOP' helpers / renames
  SOPGeneric,
  sopFrom,
  sopTo,
) where

import Data.Generics.SOP.Typed as X (npFromTyped, productFromTyped)
import Generics.SOP
import Generics.SOP as X (
  HApInjs (hapInjs),
  HasDatatypeInfo,
  I (I),
  K (K),
  NP (..),
  NS (..),
  POP (..),
  SListI,
  SOP (..),
  hapInjs,
  hcfoldMap,
  hcmap,
  hcollapse,
  hcpure,
  hfromI,
  htoI,
  mapII,
  mapIK,
  productTypeFrom,
  productTypeTo,
  unI,
 )

type SOPGeneric = Generic

sopFrom :: (Generic a) => a -> SOP I (Code a)
sopFrom = from

sopTo :: (SOPGeneric a) => SOP I (Code a) -> a
sopTo = to

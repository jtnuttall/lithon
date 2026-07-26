{-# OPTIONS_GHC -Wno-orphans #-}

module Lithon.Prelude.Container (
  module Data.DList,
  module Data.DList.DNonEmpty,
  module Data.Either,
  module Data.HashMap.Strict,
  module Data.HashMap.Monoidal,
  module Data.List,
  module Data.Map.Monoidal.Strict,
  module Data.Map.Ordered,
  module Data.Set.NonEmpty,
  module Data.Set.Ordered,
  module Universum.Container,
  module Universum.List,
  module Witherable,
  partitionWith,
  countsBy,
  counts,
  duplicatesBy,
  duplicates,
) where

import Data.DList (DList)
import Data.DList qualified as DList
import Data.DList.DNonEmpty (DNonEmpty)
import Data.DList.DNonEmpty qualified as DNonEmpty
import Data.Either (partitionEithers)
import Data.HashMap.Monoidal (MonoidalHashMap (MonoidalHashMap))
import Data.HashMap.Strict (HashMap)
import Data.List (partition)
import Data.Map.Monoidal.Strict (MonoidalMap)
import Data.Map.NonEmpty (NEMap)
import Data.Map.Ordered (OMap)
import Data.Map.Strict qualified as Map
import Data.Set.NonEmpty (NESet)
import Data.Set.Ordered (OSet)
import Universum.Container
import Universum.List hiding (filter) -- using Witherable
import Witch (From (..), TryFrom (..), maybeTryFrom)
import Witherable
import Prelude hiding (filter)

----------------------------------------------------------------------------------------------------
-- Convenient orphan instances
----------------------------------------------------------------------------------------------------

instance Container (DList a)

instance From (DList a) [a] where
  from = toList

instance From [a] (DList a) where
  from = DList.fromList

instance Container (DNonEmpty a)

instance From (DNonEmpty a) (NonEmpty a) where
  from = DNonEmpty.toNonEmpty

instance TryFrom [a] (DNonEmpty a) where
  tryFrom = maybeTryFrom (fmap from . nonEmpty)

instance From (NonEmpty a) (DNonEmpty a) where
  from = DNonEmpty.fromNonEmpty

instance Container (NESet a)
instance Container (NEMap k a)

----------------------------------------------------------------------------------------------------
-- Utilities for grouping, deduplication, etc.
----------------------------------------------------------------------------------------------------

-- | Partition by classifying each element.
partitionWith :: (a -> Either e b) -> [a] -> ([e], [b])
partitionWith f = partitionEithers . map f

countsBy :: (Container t, Ord a) => (Element t -> a) -> t -> Map a Int
countsBy f = Map.fromListWith (+) . map ((,1) . f) . toList

counts :: (Container t, Ord (Element t)) => t -> Map (Element t) Int
counts = countsBy id

duplicatesBy :: (Container t, Ord a) => (Element t -> a) -> t -> Set a
duplicatesBy f = Map.keysSet . filter (> 1) . countsBy f

duplicates :: (Container t, Ord (Element t)) => t -> Set (Element t)
duplicates = duplicatesBy id

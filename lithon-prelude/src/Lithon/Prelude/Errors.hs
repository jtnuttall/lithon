{-# LANGUAGE OverloadedStrings #-}

-- | The accumulated-error bundle every fallible pass produces.
--
-- 'Errors' is a non-empty difference list: 'Semigroup' appends in O(1), so
-- applicative 'Validation' composition pays nothing to merge error families.
-- Accumulation happens inside @'Validation' ('Errors' e)@; consumption
-- realizes the chain once at the edge — the 'Display' instance (which owns
-- the bulleted @\"\\n  - \"@ aggregation the CLI renders) and the
-- @'From' ('Errors' e) ('NonEmpty' e)@ view both go through 'toNonEmpty',
-- and nothing appends after the boundary.
--
-- This module is re-exported by "Lithon.Prelude" and therefore
-- cannot import it.
module Lithon.Prelude.Errors (
  Errors,
  errors1,
  failUnlessEmpty,
  validateEither,
  liftValidation,
  (<??>),

  -- * MonadError et al.
  MonadError,
  liftEither,

  -- * 'Data.Validation' and helpers
  module Data.Validation,
  validationEither,
  eitherToValidation,
  validationToEither,
) where

import Control.DeepSeq (NFData)
import Control.Lens (Iso', review, view)
import Control.Monad.Error.Class (MonadError, liftEither)
import Data.Aeson qualified as A
import Data.Bifunctor (first)
import Data.DList.DNonEmpty (DNonEmpty)
import Data.DList.DNonEmpty qualified as DNonEmpty
import Data.List.NonEmpty (NonEmpty, nonEmpty)
import Data.Text.Display (Display (..))
import Data.Validation (ReviewFailure (..), ReviewSuccess (..), Validation (..))
import Data.Validation qualified as Validation
import Universum.Container (Container)
import Witch (From (..))
import Prelude

-- | At least one error, accumulated left-to-right with O(1) '<>'.
newtype Errors e = Errors (DNonEmpty e)
  deriving newtype (A.ToJSON, Eq, Foldable, Functor, NFData, Semigroup, Show)

instance Container (Errors e)

-- | One bullet per error, each preceded by @\"\\n  - \"@ — callers prepend
-- their own heading. Realizes the difference list once.
instance (Display e) => Display (Errors e) where
  displayBuilder (Errors es) =
    foldMap (("\n  - " <>) . displayBuilder) (DNonEmpty.toNonEmpty es)

instance From (NonEmpty e) (Errors e) where
  from = Errors . DNonEmpty.fromNonEmpty

instance From (Errors e) (NonEmpty e) where
  from (Errors es) = DNonEmpty.toNonEmpty es

-- | A single-error bundle.
errors1 :: e -> Errors e
errors1 = Errors . DNonEmpty.singleton

-- | The pass terminal for list-accumulating internals: succeed unless any
-- errors were collected.
failUnlessEmpty :: [e] -> a -> Validation (Errors e) a
failUnlessEmpty es a = maybe (Success a) (Failure . from) (nonEmpty es)

-- | Per-item bridge: admit an 'Either'-returning resolver into an
-- accumulating traversal.
validateEither :: Either e a -> Validation (Errors e) a
validateEither = either (Failure . errors1) Success

liftValidation :: (MonadError e m) => Validation e a -> m a
liftValidation = liftEither . validationToEither

(<??>) :: (MonadError (Errors e') m) => Validation (Errors e) a -> (e -> e') -> m a
v <??> f = liftValidation (first (fmap f) v)

infixl 9 <??>

validationEither :: Iso' (Validation a b) (Either a b)
validationEither = Validation.either

eitherToValidation :: Either a b -> Validation a b
eitherToValidation = review Validation.either

validationToEither :: Validation a b -> Either a b
validationToEither = view Validation.either

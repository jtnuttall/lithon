{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ViewPatterns #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module Lithon.Prelude (
  -- * Re-exporting the universe
  module Control.Category,
  module Control.Lens,
  module Data.Bitraversable,
  module Data.Coerce,
  module Data.Containers.ListUtils,
  module Data.Default,
  module Data.Function,
  module Data.Functor.Contravariant,
  module Data.Generics.Product,
  module Data.Profunctor,
  module Data.Profunctor.Strong,
  module Data.Singletons,
  module Data.Tuple,
  module Data.Traversable,
  module Language.Haskell.TH.Quote,
  module Universum.Applicative,
  module Universum.Base,
  module Universum.Bool,
  module Universum.Debug,
  module Universum.DeepSeq,
  module Universum.Exception,
  module Universum.Function,
  module Universum.Functor,
  module Universum.Lifted,
  module Universum.Monoid,
  module Universum.Nub,
  module Universum.Print,
  module Universum.String,
  module Universum.TypeOps,
  module Universum.VarArg,
  module Witch,

  -- * Internal wrapper / utility / global strategy modules
  module Lithon.Prelude.Container,
  module Lithon.Prelude.Display,
  module Lithon.Prelude.Generics.SOP,
  module Lithon.Prelude.Errors,
  module Lithon.Prelude.Monad,

  -- * 'NeatInterpolation'
  trimmingQQ,

  -- * 'Control.Lens' renames
  fromIso,

  -- * 'Text.Builder.Linear' helpers
  TextBuilder,
  intercalateTB,

  -- * 'System.Process.Typed'
  ProcessStdout (..),
  ProcessStderr (..),
  ProcessFailureCode (..),
  readProcessStdoutOrError,
  readProcessOrError,
  readProcessOrErrorWith,

  -- * Stringy utils
  quoted,

  -- * Coercible
  coercing,

  -- * MonadError
  guardWithError,
  noteErr,
  noteErrM,
) where

import Control.Category ((<<<), (>>>))
import Control.Lens (
  Iso,
  Iso',
  Lens,
  Lens',
  Prism,
  Prism',
  coerced,
  has,
  lens,
  matching,
  matching',
  over,
  preview,
  review,
  view,
  (#),
  (%~),
  (.~),
  (?~),
  (^.),
  (^?),
 )
import Control.Lens qualified as Lens
import Control.Monad.Error.Class (MonadError (throwError))
import Data.Aeson qualified as A
import Data.Bitraversable (Bitraversable, bifor, bisequence, bitraverse, firstA, secondA)
import Data.Coerce (coerce)
import Data.Containers.ListUtils (nubOrd)
import Data.Default (Default (..))
import Data.Function (applyWhen)
import Data.Functor.Contravariant (Contravariant (..))
import Data.Generics.Labels ()
import Data.Generics.Product (HasField' (..), HasType (..), getTyped)
import Data.List qualified as L
import Data.Profunctor (Profunctor (..), Star (..), Strong (..))
import Data.Profunctor.Strong (strong)
import Data.Singletons
import Data.Text.Builder.Linear qualified as TB
import Data.Traversable (for)
import Data.Tuple (Solo (MkSolo))
import Language.Haskell.TH.Quote (QuasiQuoter)
import NeatInterpolation qualified
import System.Process.Typed qualified as P
import Universum.Applicative
import Universum.Base
import Universum.Bool
import Universum.Debug hiding (
  trace,
  traceId,
  traceIdWith,
  traceM,
  traceShow,
  traceShowId,
  traceShowIdWith,
  traceShowM,
 )
import Universum.DeepSeq
import Universum.Exception hiding (try)
import Universum.Function
import Universum.Functor
import Universum.Lifted
import Universum.Monoid
import Universum.Nub hiding (hashNub, ordNub)
import Universum.Print
import Universum.String
import Universum.TypeOps
import Universum.VarArg
import Witch (
  From (from),
  TryFrom (tryFrom),
  eitherTryFrom,
  into,
  maybeTryFrom,
  tryInto,
  tryVia,
  via,
 )

import Lithon.Prelude.Container
import Lithon.Prelude.Display
import Lithon.Prelude.Errors
import Lithon.Prelude.Generics.SOP
import Lithon.Prelude.Monad

fromIso :: Lens.AnIso s t a b -> Iso b a t s
fromIso = Lens.from

type TextBuilder = TB.Builder

trimmingQQ :: QuasiQuoter
trimmingQQ = NeatInterpolation.trimming

intercalateTB :: TB.Builder -> [TB.Builder] -> TB.Builder
intercalateTB sep = fold . L.intersperse sep

instance From TB.Builder Text where
  from = TB.runBuilder

instance A.ToJSON (P.ProcessConfig () () ()) where
  toJSON pc = A.toJSON (show @Text pc)

newtype ProcessStdout = ProcessStdout Text
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

newtype ProcessStderr = ProcessStderr LText
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

newtype ProcessFailureCode = ProcessFailureCode Int
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

readProcessStdoutOrError
  :: (MonadError e m, MonadIO m)
  => (P.ProcessConfig () () () -> ProcessFailureCode -> ProcessStdout -> ProcessStderr -> e)
  -> Text
  -> [Text]
  -> m Text
readProcessStdoutOrError toError cmd args = snd <$> readProcessOrError toError cmd args

readProcessOrError
  :: (MonadError e m, MonadIO m)
  => (P.ProcessConfig () () () -> ProcessFailureCode -> ProcessStdout -> ProcessStderr -> e)
  -> Text
  -> [Text]
  -> m (LText, Text)
readProcessOrError = readProcessOrErrorWith id

readProcessOrErrorWith
  :: (MonadError e m, MonadIO m)
  => (P.ProcessConfig () () () -> P.ProcessConfig () () ())
  -> (P.ProcessConfig () () () -> ProcessFailureCode -> ProcessStdout -> ProcessStderr -> e)
  -> Text
  -> [Text]
  -> m (LText, Text)
readProcessOrErrorWith cfg toError cmd args = do
  let pc = cfg $ P.proc (from cmd) (from <$> args)
  (code, decodeUtf8 -> pout, decodeUtf8 -> perr) <- P.readProcess pc
  case code of
    P.ExitSuccess -> pure (perr, pout)
    P.ExitFailure c -> throwError $ toError pc (ProcessFailureCode c) (ProcessStdout pout) (ProcessStderr perr)

quoted :: (Semigroup c, IsString c) => c -> c
quoted = ("\"" <>) . (<> "\"")

coercing :: forall b a. (Coercible a b) => (b -> b -> b) -> a -> a -> a
coercing = coerce

guardWithError :: (MonadError e m) => e -> Bool -> m ()
guardWithError e = bool (throwError e) (pure ())

noteErr :: (MonadError e m) => e -> Maybe a -> m a
noteErr e = \case
  Just a -> pure a
  Nothing -> throwError e

noteErrM :: (MonadError e m) => m e -> Maybe a -> m a
noteErrM me ma = me >>= (`noteErr` ma)

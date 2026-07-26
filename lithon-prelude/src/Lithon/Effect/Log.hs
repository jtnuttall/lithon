{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# OPTIONS_GHC -Wno-orphans #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Lithon.Effect.Log (
  Log,
  runLog,
  LogLevel (LevelDebug, LevelError, LevelInfo, LevelWarn),
  logDebug,
  logError,
  logInfo,
  logWarn,
  withThreadContext,
  (.=),
  Message ((:#)),
) where

import Blammo.Logging.Internal.Logger (Logger)
import Blammo.Logging.Logger (runLogAction)
import Blammo.Logging.Setup (withLoggerEnv)
import Blammo.Logging.Simple (
  HasLogger (..),
  LogLevel (..),
  Message ((:#)),
  MonadLogger (..),
  logDebug,
  logError,
  logInfo,
  logWarn,
  withThreadContext,
  (.=),
 )
import Effectful (
  Dispatch (Static),
  DispatchOf,
  Eff,
  Effect,
  IOE,
  type (:>),
 )
import Effectful.Dispatch.Static (
  SideEffects (WithSideEffects),
  StaticRep,
  evalStaticRep,
  getStaticRep,
  unsafeEff_,
 )

import Lithon.Prelude

data Log :: Effect

type instance DispatchOf Log = Static WithSideEffects
newtype instance StaticRep Log = Log Logger

instance HasLogger (StaticRep Log) where
  loggerL = lens coerce (\_ y -> Log y) . loggerL

runLog :: (IOE :> es) => Text -> Eff (Log : es) a -> Eff es a
runLog appName act = withLoggerEnv \logger ->
  withThreadContext ["appName" .= appName]
    $ evalStaticRep (Log logger) act

instance (Log :> es) => MonadLogger (Eff es) where
  monadLoggerLog a b c d = do
    logger <- view loggerL <$> getStaticRep @Log
    unsafeEff_ $ runLogAction logger a b c d

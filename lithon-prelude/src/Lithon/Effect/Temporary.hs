{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Lithon.Effect.Temporary (
  T.Temporary,
  T.runTemporary,
  SystemTempDir (..),
  withSystemTempDirectory,
) where

import Data.Aeson qualified as A
import Effectful
import Effectful.Temporary qualified as T

import Lithon.Prelude

newtype SystemTempDir = SystemTempDir FilePath
  deriving newtype (A.FromJSON, A.ToJSON, Show)

withSystemTempDirectory :: (T.Temporary :> es) => String -> (SystemTempDir -> Eff es a) -> Eff es a
withSystemTempDirectory templ f = T.withSystemTempDirectory templ (f . SystemTempDir)

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Lithon.Effect.PrettyPrint (
  LayoutOptions,
  defaultLayoutOptions,
  PrettyPrint,
  supportsANSI,
  pPrint,
  runPrettyPrintH,
) where

import Effectful
import Effectful.Dispatch.Dynamic
import Effectful.FileSystem.IO
import Effectful.TH
import Prettyprinter (Doc, LayoutOptions, defaultLayoutOptions, layoutSmart)
import Prettyprinter.Render.Terminal (AnsiStyle)
import Prettyprinter.Render.Terminal qualified as Terminal
import Prettyprinter.Render.Text qualified as Plain
import System.Console.ANSI (hSupportsANSI)

import Lithon.Prelude

data PrettyPrint :: Effect where
  SupportsANSI :: PrettyPrint m Bool
  PPrint :: Doc AnsiStyle -> PrettyPrint m ()

makeEffect ''PrettyPrint

runPrettyPrintH
  :: (IOE :> es) => LayoutOptions -> Handle -> Eff (PrettyPrint : es) a -> Eff es a
runPrettyPrintH opts h eff = do
  ansi <- liftIO $ hSupportsANSI h

  let renderIO
        | ansi = Terminal.renderIO h
        | otherwise = Plain.renderIO h

      interpreter = interpret \_ -> \case
        SupportsANSI -> pure ansi
        PPrint doc -> liftIO $ renderIO (layoutSmart opts doc)

  interpreter eff

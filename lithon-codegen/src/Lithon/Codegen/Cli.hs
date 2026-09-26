{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

-- | The lithon-codegen command line: a thin dispatcher over per-target
-- subcommand trees.
--
-- @vulkan@ is the registry pipeline (see "Lithon.Codegen.Vulkan"); every
-- hs-bindgen-driven bindgen-sys target ("Lithon.Codegen.Bindgen.Targets", e.g.
-- @sdl3@) contributes its own subcommand.
module Lithon.Codegen.Cli (
  main,
) where

import Data.Text qualified as T
import Effectful (runEff)
import Effectful.Concurrent.Async (runConcurrent)
import Effectful.Console.ByteString.Lazy (runConsole)
import Effectful.Environment (runEnvironment)
import Effectful.Resource (runResource)
import Lithon.Effect.ClangEnv
import Lithon.Effect.Clock (runClock)
import Lithon.Effect.Error
import Lithon.Effect.FileSystem (runFileSystem)
import Lithon.Effect.Log
import Lithon.Effect.PrettyPrint
import Lithon.Effect.Temporary (runTemporary)
import Lithon.Prelude
import Options.Applicative hiding (ParseError, asum)

import Lithon.Codegen.Backend.Package.Emit (findProjectRoot)
import Lithon.Codegen.Bindgen (BindgenCmd, bindgenCommand, runBindgen)
import Lithon.Codegen.Bindgen.Target (BindgenTarget)
import Lithon.Codegen.Bindgen.Targets (bindgenTargets)
import Lithon.Codegen.Vulkan (VulkanCmd, runVulkan, vulkanCmdP)

newtype Opts = Opts
  { cmd :: Cmd
  }

data Cmd
  = CmdVulkan VulkanCmd
  | CmdBindgen BindgenTarget BindgenCmd

main :: IO ()
main = do
  opts <- execParser cliInfo
  runEff $ runLog "lithon-codegen" do
    res <- runError @Text
      . runEnvironment
      . runConcurrent
      . runFileSystem
      . runTemporary
      . runConsole
      . runPrettyPrintH defaultLayoutOptions stdout
      . runClock
      . runResource
      $ do
        root <- findProjectRoot
        case opts.cmd of
          CmdVulkan cmd ->
            runErrorDisplay
              $ runVulkan root cmd
          CmdBindgen target cmd ->
            runErrorDisplay
              . runClangEnv
              . runErrorDisplay
              $ runBindgen target root cmd

    case res of
      Right () -> pure ()
      Left (cs, err) -> do
        logError $ "Execution failed" :# ["err" .= err, "callStack" .= T.pack (prettyCallStack cs)]
        liftIO exitFailure

cliInfo :: ParserInfo Opts
cliInfo =
  info
    (helper <*> optsP)
    ( fullDesc
        <> progDesc "Code generation tooling for lithon"
        <> header "lithon-codegen - binding generators for lithon"
    )

optsP :: Parser Opts
optsP =
  Opts
    <$> hsubparser
      ( command
          "vulkan"
          ( info
              (CmdVulkan <$> vulkanCmdP)
              (progDesc "Vulkan registry pipeline: parse / check / resolve / curate / generate")
          )
          <> foldMap (bindgenCommand CmdBindgen) bindgenTargets
      )

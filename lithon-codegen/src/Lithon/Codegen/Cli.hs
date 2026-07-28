{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

-- | The lithon-codegen command line: a thin dispatcher over per-target
-- subcommand trees.
--
-- @vulkan@ is the registry pipeline (see "Lithon.Codegen.Vulkan"); @sdl3@
-- (the hs-bindgen-driven SDL3 generator) joins it as its milestones land.
module Lithon.Codegen.Cli (
  main,
) where

import Data.Text qualified as T
import Effectful (runEff)
import Effectful.Concurrent.Async (runConcurrent)
import Effectful.Console.ByteString.Lazy (runConsole)
import Effectful.Environment (runEnvironment)
import Effectful.FileSystem (runFileSystem)
import Effectful.Resource (runResource)
import Lithon.Effect.ClangEnv
import Lithon.Effect.Clock (runClock)
import Lithon.Effect.Error
import Lithon.Effect.Log
import Lithon.Effect.PrettyPrint
import Lithon.Effect.Temporary (runTemporary)
import Lithon.Prelude
import Options.Applicative hiding (ParseError, asum)

import Lithon.Codegen.Sdl3 (Sdl3Cmd, runSdl3, sdl3CmdP)
import Lithon.Codegen.Vulkan (VulkanCmd, runVulkan, vulkanCmdP)

newtype Opts = Opts
  { cmd :: Cmd
  }

data Cmd
  = CmdVulkan VulkanCmd
  | CmdSdl3 Sdl3Cmd

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
      $ case opts.cmd of
        CmdVulkan cmd ->
          runErrorDisplay
            $ runVulkan cmd
        CmdSdl3 cmd ->
          runErrorDisplay
            . runClangEnv
            . runErrorDisplay
            $ runSdl3 cmd

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
          <> command
            "sdl3"
            ( info
                (CmdSdl3 <$> sdl3CmdP)
                (progDesc "SDL3 binding generation via hs-bindgen: spec / generate")
            )
      )

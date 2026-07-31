{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Shared package-emission glue: the project-root resolution the
-- wrong-working-directory guard keys on, the option group every generated
-- package's @generate@ subcommand shares (@--out@ \/ @--check@ \/ @--yes@),
-- and the one emit entry point both frontends call.
module Lithon.Codegen.Backend.Package.Emit (
  ProjectRoot (..),
  findProjectRoot,
  PackageOut (..),
  packageOutP,
  assumeYesP,
  guardCtx,
  emitHaskellPackage,
) where

import Data.Aeson qualified as A
import Effectful (Eff, IOE, (:>))
import Effectful.Concurrent.Async (Concurrent)
import Effectful.Console.ByteString (Console)
import Effectful.Error.Dynamic (Error)
import Lithon.Effect.FileSystem (
  FileSystem,
  doesFileExist,
  getCurrentDirectory,
  makeAbsolute,
 )
import Lithon.Effect.Log
import Lithon.Prelude
import Options.Applicative qualified as Opt
import System.FilePath (takeDirectory, (</>))

import Lithon.Codegen.Backend.Emit (
  EmitEffect,
  EmitError,
  EmitGuard (..),
  EmitStrategy (HaskellPackage),
  EmitTarget (..),
  GuardCtx (..),
  emitEffectOptP,
  emitPackage,
 )
import Lithon.Codegen.Backend.FileTree (FileTree, pattern FileTree)

-- | The directory containing the enclosing @cabal.project@, absolute.
newtype ProjectRoot = ProjectRoot FilePath
  deriving stock (Show)

-- | Walk up from the working directory looking for a @cabal.project@;
-- 'Nothing' at the filesystem root. Resolved once at CLI startup.
findProjectRoot :: (FileSystem :> es) => Eff es (Maybe ProjectRoot)
findProjectRoot = go =<< makeAbsolute =<< getCurrentDirectory
 where
  go dir = do
    found <- doesFileExist (dir </> "cabal.project")
    let parent = takeDirectory dir
    if found then
      pure (Just (ProjectRoot dir))
    else if parent == dir then
      pure Nothing
    else
      go parent

-- | The shared output options of a package-emitting subcommand.
data PackageOut = PackageOut
  { outDir :: FilePath
  , emitEffect :: EmitEffect
  , assumeYes :: Bool
  }
  deriving stock (Show)

-- | @--out DIR@ (per-target default) + @--check@ + @--yes@.
packageOutP :: FilePath -> Opt.Parser PackageOut
packageOutP defaultOut = do
  outDir <-
    Opt.strOption
      ( Opt.long "out"
          <> Opt.metavar "DIR"
          <> Opt.value defaultOut
          <> Opt.showDefault
          <> Opt.help "Target package directory"
      )
  emitEffect <- emitEffectOptP
  assumeYes <- assumeYesP
  pure PackageOut{..}

assumeYesP :: Opt.Parser Bool
assumeYesP = Opt.switch (Opt.long "yes" <> Opt.help "Skip the output-directory confirmation")

-- | The guard context a write runs under.
guardCtx :: Maybe ProjectRoot -> Bool -> GuardCtx
guardCtx root assumeYes =
  GuardCtx{projectRoot = (\(ProjectRoot p) -> p) <$> root, assumeYes}

-- | Emit an assembled package tree as a Haskell package under the
-- wrong-working-directory guard.
emitHaskellPackage
  :: ( HasCallStack
     , IOE :> es
     , Log :> es
     , Concurrent :> es
     , FileSystem :> es
     , Console :> es
     , Error EmitError :> es
     )
  => Maybe ProjectRoot -> PackageOut -> Map Text A.Value -> FileTree -> Eff es ()
emitHaskellPackage root out manifestMeta (FileTree files) =
  emitPackage
    HaskellPackage
    EmitTarget
      { outDir = out.outDir
      , manifestMeta
      , effect = out.emitEffect
      , guard = Guarded (guardCtx root out.assumeYes)
      }
    files

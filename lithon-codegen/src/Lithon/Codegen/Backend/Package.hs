{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TemplateHaskell #-}

-- | Shared vocabulary for assembling a generated Haskell package: the
-- per-target 'PackageSpec' (root files, licenses, generated modules, extra
-- trees) and the errors assembly can produce. The code generator owns every
-- file it stages; nothing in a generated package is ever edited by hand.
module Lithon.Codegen.Backend.Package (
  PackageSpec (..),
  RootFiles (..),
  PackageAssemblyError (..),
  lithonLicense,
) where

import Data.FileEmbed (embedFileRelative)
import Data.Text.Encoding qualified as T
import Lithon.Prelude
import Witch (TryFromException)

import Lithon.Codegen.Backend.FileTree (FileTree)
import Lithon.Codegen.Backend.FileTree qualified as FileTree
import Lithon.Codegen.Backend.Hs.Module qualified as Module

-- | Everything a target contributes to its generated package, as data.
data PackageSpec = PackageSpec
  { root :: RootFiles
  , extraLicenses :: [(FilePath, Text)]
  -- ^ Third-party license files staged at the package root
  -- (e.g. @LICENSE_SDL@).
  , srcDir :: FilePath
  -- ^ The source directory the module tree lives under — the only home of
  -- the @src/@ prefix.
  , modules :: [(Module.Meta, Text)]
  -- ^ Every generated Haskell module.
  , extraFiles :: [(FilePath, Text)]
  -- ^ Root-relative extras (e.g. @cbits/abi_assertions.c@).
  , extraTrees :: [FileTree]
  -- ^ Pre-rooted embedded trees (vendored runtimes); never @src@-prefixed.
  }
  deriving stock (Generic, Show)

-- | The four files every generated package's root carries. @license@ is
-- always staged as @LICENSE@: hpack runs against the staged tree, so the
-- generated cabal file declares exactly what ships — the structural fix for
-- cabal-file drift between the generator and ambient hpack runs.
data RootFiles = RootFiles
  { packageYaml :: Text
  , readme :: Text
  , changelog :: Text
  , license :: Text
  }
  deriving stock (Generic, Show)

data PackageAssemblyError
  = MergedTreeInvalid FileTree.DuplicateFiles
  | GeneratorOutputInvalid Text (TryFromException [(FilePath, Text)] FileTree)
  deriving stock (Show)

instance From FileTree.DuplicateFiles PackageAssemblyError where
  from = MergedTreeInvalid

instance Display PackageAssemblyError where
  displayBuilder = \case
    MergedTreeInvalid dupes -> "while trying to assemble package, " <> displayBuilder dupes
    GeneratorOutputInvalid what except -> "[" <> from what <> "]: generator emitted duplicate paths: " <> show except

-- | The lithon license text, shared by every generated package.
lithonLicense :: Text
lithonLicense = T.decodeUtf8 $(embedFileRelative "LICENSE")

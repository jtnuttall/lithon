{-# LANGUAGE OverloadedStrings #-}

-- | Assemble a 'PackageSpec' into the full file tree of a generated package:
-- root files and licenses at the root, the module tree under the spec's
-- source dir, extras and pre-rooted embedded trees merged with cross-tree
-- duplicate detection.
module Lithon.Codegen.Backend.Package.Assemble (
  assemblePackage,
  srcFilePairs,
) where

import Lithon.Prelude
import System.FilePath ((</>))

import Lithon.Codegen.Backend.FileTree (FileTree)
import Lithon.Codegen.Backend.FileTree qualified as FileTree
import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Backend.Package (
  PackageAssemblyError (..),
  PackageSpec (..),
  RootFiles (..),
 )

-- | The on-disk paths of a module set under a source dir — exported so tests
-- and goldens can derive the same keys the assembly stages.
srcFilePairs :: FilePath -> [(Module.Meta, Text)] -> [(FilePath, Text)]
srcFilePairs srcDir ms = [(srcDir </> Module.path meta, contents) | (meta, contents) <- ms]

assemblePackage :: PackageSpec -> Either PackageAssemblyError FileTree
assemblePackage spec = do
  src :: FileTree <-
    first (GeneratorOutputInvalid "modules") $ tryFrom (srcFilePairs spec.srcDir spec.modules)
  extras :: FileTree <-
    first (GeneratorOutputInvalid "extra files") $ tryFrom spec.extraFiles
  let rootFiles =
        FileTree.fromUniqueList
          $ [ ("package.yaml", spec.root.packageYaml)
            , ("README.md", spec.root.readme)
            , ("CHANGELOG.md", spec.root.changelog)
            , ("LICENSE", spec.root.license)
            ]
          <> spec.extraLicenses
  first from $ FileTree.cata (rootFiles :| src : extras : spec.extraTrees)

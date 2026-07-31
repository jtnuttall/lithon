{-# LANGUAGE OverloadedStrings #-}

-- | Pure units over the shared package assembly: the root-file set every
-- generated package stages (the cabal-drift invariant), the src-prefix
-- derivation, duplicate rejection, and extra-tree rooting.
module Backend.PackageTest where

import Data.Map.Strict qualified as Map
import Lithon.Prelude
import Test.Tasty.HUnit (Assertion, assertBool, assertEqual, assertFailure)

import Lithon.Codegen.Backend.FileTree (pattern FileTree)
import Lithon.Codegen.Backend.FileTree qualified as FileTree
import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Backend.Package (PackageSpec (..), RootFiles (..))
import Lithon.Codegen.Backend.Package.Assemble (assemblePackage)

meta :: [Text] -> Module.Meta
meta segs = either (error . display) id (Module.fromSegments segs)

baseSpec :: PackageSpec
baseSpec =
  PackageSpec
    { root =
        RootFiles
          { packageYaml = "name: toy\n"
          , readme = "readme\n"
          , changelog = "log\n"
          , license = "license\n"
          }
    , extraLicenses = []
    , srcDir = "src"
    , modules = []
    , extraFiles = []
    , extraTrees = []
    }

assembled :: PackageSpec -> IO (Map FilePath Text)
assembled spec = case assemblePackage spec of
  Left err -> assertFailure (toString (display err))
  Right (FileTree m) -> pure m

-- | Every generated package's root carries exactly these files — package
-- root files travel WITH the staged tree, so hpack-in-staging and ambient
-- hpack see the same directory facts (the structural cabal-drift fix).
unit_assembleStagesRootFiles :: Assertion
unit_assembleStagesRootFiles = do
  m <- assembled baseSpec{extraLicenses = [("LICENSE_TOY", "t\n")]}
  assertEqual
    "root files staged"
    ["CHANGELOG.md", "LICENSE", "LICENSE_TOY", "README.md", "package.yaml"]
    (Map.keys m)

unit_assembleSrcPrefix :: Assertion
unit_assembleSrcPrefix = do
  m <- assembled baseSpec{modules = [(meta ["Lithon", "Vk"], "module Lithon.Vk where\n")]}
  assertBool "module staged under srcDir" (Map.member "src/Lithon/Vk.hs" m)

unit_assembleRejectsDuplicateModules :: Assertion
unit_assembleRejectsDuplicateModules =
  case assemblePackage baseSpec{modules = [(meta ["A"], "a\n"), (meta ["A"], "b\n")]} of
    Left _ -> pure ()
    Right _ -> assertFailure "expected duplicate-module rejection"

unit_extraTreesNotSrcPrefixed :: Assertion
unit_extraTreesNotSrcPrefixed = do
  m <-
    assembled
      baseSpec
        { extraTrees = [FileTree.prependPath "runtime" (FileTree.fromUniqueList [("R.hs", "r\n")])]
        }
  assertBool "extra tree lives at the package root" (Map.member "runtime/R.hs" m)

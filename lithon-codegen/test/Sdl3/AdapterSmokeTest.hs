{-# LANGUAGE OverloadedStrings #-}

-- | End-to-end smoke of the 'Lithon.HsBindgen' adapter: drive the seam's
-- invocation pipeline over a toy header and demand translated+rendered
-- module text per category, a binding-spec artifact, and include-graph
-- dependencies.
--
-- This pins the orchestration surface the SDL3 generator builds on —
-- 'HB.runBindgen' over lithon-owned invocation records plus the
-- 'HB.BindgenM' operations, and the translate-then-render path
-- ('HB.translatedFamily' \/ 'HB.renderFamilyWith'). The toy header takes
-- a struct BY VALUE so the userland-CAPI wrapper path (inline
-- @addCSource@ Template Haskell splice) is exercised, not just plain
-- foreign imports.
module Sdl3.AdapterSmokeTest (
  unit_adapterSmoke,
) where

import Data.List qualified as L
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.Directory (
  createDirectoryIfMissing,
  getTemporaryDirectory,
  removePathForcibly,
 )
import System.FilePath ((</>))
import Test.Tasty.HUnit (Assertion, assertBool, assertFailure)

unit_adapterSmoke :: Assertion
unit_adapterSmoke = do
  tmpRoot <- getTemporaryDirectory
  let dir = tmpRoot </> "lithon-hs-bindgen-smoke"
  removePathForcibly dir
  createDirectoryIfMissing True dir
  TIO.writeFile (dir </> "toy.h") toyHeader
  let specPath = dir </> "toy.yaml"
      env =
        HB.InvocationEnv
          { extraIncludeDirs = [dir]
          , defineMacros = []
          , doxygenAliases = []
          , fieldNaming = HB.AddFieldPrefixes
          , uniqueId = "lithon-smoke"
          }
      spec =
        HB.InvocationSpec
          { baseModule = "Toy.Bindgen"
          , includes = ["toy.h"]
          , priorSpecs = []
          , prescriptiveSpec = Nothing
          }
  eres <-
    HB.runBindgen env spec do
      deps <- HB.sortedIncludeGraph
      family <- HB.translatedFamily
      HB.writeSpec specPath
      pure (deps, family)
  case eres of
    Left err -> assertFailure ("bindgen error: " <> toString (display err))
    Right (deps, family) -> do
      assertBool "include graph has entries" (not (null deps))
      rendered <-
        either (assertFailure . show) pure (HB.renderFamilyWith [] family)
      let pairs = map (\m -> (HB.moduleName m, m.hsModule.text)) rendered
          typesSrc = fromMaybe "" (L.lookup "Toy.Bindgen" pairs)
          safeSrc = fromMaybe "" (L.lookup "Toy.Bindgen.Safe" pairs)
      assertBool
        "types module rendered under the base name"
        ("module Toy.Bindgen" `T.isInfixOf` typesSrc)
      assertBool
        "types module declares something"
        (any (`T.isInfixOf` typesSrc) ["data ", "newtype "])
      assertBool "safe module binds toy_add" ("toy_add" `T.isInfixOf` safeSrc)
      assertBool "safe module has foreign imports" ("foreign import" `T.isInfixOf` safeSrc)
      assertBool
        "by-value struct argument goes through an inline CAPI wrapper"
        ("addCSource" `T.isInfixOf` safeSrc)
      spec <- TIO.readFile specPath
      assertBool "binding spec mentions the struct" ("toy_point" `T.isInfixOf` spec)

toyHeader :: Text
toyHeader =
  T.unlines
    [ "#ifndef TOY_H"
    , "#define TOY_H"
    , ""
    , "typedef struct toy_point {"
    , "  int x;"
    , "  int y;"
    , "} toy_point;"
    , ""
    , "typedef enum toy_mode { TOY_OFF, TOY_ON } toy_mode;"
    , ""
    , "#define TOY_ANSWER 42"
    , ""
    , "int toy_add(toy_point p);"
    , "void toy_reset(toy_point *p);"
    , ""
    , "#endif"
    ]

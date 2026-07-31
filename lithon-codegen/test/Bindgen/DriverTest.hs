{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

-- | The generic bindgen fold, end-to-end over a toy header: planning mints
-- typed module names through the plan's mangle, 'HB.RequireHit' misses fail
-- generation loudly, 'HB.AllowMiss' misses pass through untouched, text
-- edits apply in list order (a later edit sees an earlier edit's output),
-- and the finalizer's payload arrives on the result.
module Bindgen.DriverTest (
  unit_driverFoldsToyHeader,
  unit_requireHitMissFails,
  unit_allowMissSkips,
  unit_editsApplyInOrder,
) where

import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import Effectful (runEff)
import Lithon.Effect.Error
import Lithon.Effect.Log (runLog)
import Lithon.Effect.Temporary (runTemporary)
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.Directory (createDirectoryIfMissing)
import System.FilePath (takeDirectory, (</>))
import System.IO.Temp (withSystemTempDirectory)
import Test.Tasty.HUnit (Assertion, assertBool, assertFailure, (@?=))

import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen (
  BindgenError,
  BindgenOpts (..),
  HeaderPlan (..),
  HeaderResult (..),
  HeaderUnit (..),
  PackageInfo (..),
  Passes (..),
  Visitor (..),
  defaultSpecFileName,
  runBindgen,
  runHeaderChain,
 )

toyHeader :: Text
toyHeader =
  unlines
    [ "#ifndef TOY_THING_H"
    , "#define TOY_THING_H"
    , "typedef struct toy_point { int x; int y; } toy_point;"
    , "int toy_add(int a, int b);"
    , "#endif"
    ]

toyPlan :: HeaderPlan
toyPlan =
  HeaderPlan
    { baseNamespace = $$(Module.metaLit ["Toy", "Bindgen"])
    , mangle = def{Module.stripPrefix = Just "toy_", Module.segmentJoin = Module.JoinConcat}
    , projectHeader = \path -> case T.splitOn "/toy/" (T.pack path) of
        [_, basename]
          | not (T.null basename)
          , not ("/" `T.isInfixOf` basename) ->
              Just (toString basename)
        _ -> Nothing
    , includeArg = ("toy" </>)
    , excludedHeaders = []
    , mainIncludes = ["toy/toy_thing.h"]
    , specFileName = defaultSpecFileName
    }

toyOpts :: FilePath -> BindgenOpts
toyOpts dir =
  BindgenOpts
    { invocationEnv =
        HB.InvocationEnv
          { extraIncludeDirs = [dir]
          , defineMacros = []
          , doxygenAliases = []
          , fieldNaming = HB.AddFieldPrefixes
          , uniqueId = "lithon-driver-toy"
          }
    , prescriptiveSpec = Nothing
    , packageInfo = PackageInfo{name = "driver-toy", dataDir = dir, version = Nothing}
    }

-- | Run one visitor over the toy universe under the real effect stack.
runDriver :: Visitor r -> IO (Either Text [HeaderResult r])
runDriver visitor = withSystemTempDirectory "lithon-driver-toy" \dir -> do
  let headerPath = dir </> "toy" </> "toy_thing.h"
  createDirectoryIfMissing True (takeDirectory headerPath)
  TIO.writeFile headerPath toyHeader
  fmap (first snd)
    . runEff
    . runLog "driver-test"
    . runError @Text
    . runErrorDisplay @BindgenError
    . runTemporary
    . runBindgen (toyOpts dir)
    $ runHeaderChain toyPlan visitor

renderedPairs :: [HB.NameableModule HB.RenderedHsModule] -> [(Text, Text)]
renderedPairs = map \m -> (HB.moduleName m, m.hsModule.text)

unit_driverFoldsToyHeader :: Assertion
unit_driverFoldsToyHeader = do
  results <-
    either (assertFailure . toString) pure
      =<< runDriver Visitor{passes = mempty, finalize = \_ arts _ -> Right (length arts.cDecls)}
  case results of
    [r] -> do
      Module.hsName r.unit.moduleName @?= "Toy.Bindgen.Thing"
      r.unit.headerName @?= "toy_thing.h"
      r.unit.specFile @?= "toy_thing.yaml"
      assertBool "payload distilled from the artefacts" (r.payload > 0)
      let pairs = renderedPairs r.modules
      assertBool "types module rendered under the minted name" ("Toy.Bindgen.Thing" `elem` map fst pairs)
      assertBool
        "typed imports captured at render"
        (any (not . null . (.hsModule.importedModules)) r.modules)
    _other -> assertFailure ("expected exactly one header result, got " <> show (length results))

unit_requireHitMissFails :: Assertion
unit_requireHitMissFails = do
  r <-
    runDriver
      Visitor
        { passes =
            mempty
              { stubEdits = \_ _ ->
                  [HB.replaceStubLine "phantom edit" "toy_missing" "  no such line" ["boom"]]
              }
        , finalize = \_ _ _ -> Right ()
        }
  case r of
    Right _ -> assertFailure "expected the RequireHit miss to fail generation"
    Left err -> assertBool ("names the edit: " <> toString err) ("phantom edit" `T.isInfixOf` err)

unit_allowMissSkips :: Assertion
unit_allowMissSkips = do
  results <-
    either (assertFailure . toString) pure
      =<< runDriver
        Visitor
          { passes =
              mempty
                { textEdits = \_ _ ->
                    [ HB.TextEdit
                        { label = "optional rewrite"
                        , needle = "no such needle anywhere"
                        , replacement = "unused"
                        , onMiss = HB.AllowMiss
                        }
                    ]
                }
          , finalize = \_ _ _ -> Right ()
          }
  case results of
    [r] ->
      assertBool
        "family rendered untouched"
        (all (not . T.isInfixOf "unused" . snd) (renderedPairs r.modules))
    _other -> assertFailure "expected exactly one header result"

-- | The second edit's needle exists only in the first edit's output — the
-- run succeeds iff edits apply left to right.
unit_editsApplyInOrder :: Assertion
unit_editsApplyInOrder = do
  results <-
    either (assertFailure . toString) pure
      =<< runDriver
        Visitor
          { passes =
              Passes
                { stubEdits = \_ _ -> []
                , textEdits = \_ _ ->
                    [ HB.TextEdit
                        { label = "first"
                        , needle = "module Toy.Bindgen.Thing"
                        , replacement = "{- pass1 -}\nmodule Toy.Bindgen.Thing"
                        , onMiss = HB.RequireHit
                        }
                    , HB.TextEdit
                        { label = "second"
                        , needle = "{- pass1 -}"
                        , replacement = "{- pass1 pass2 -}"
                        , onMiss = HB.RequireHit
                        }
                    ]
                }
          , finalize = \_ _ _ -> Right ()
          }
  case results of
    [r] ->
      assertBool
        "later edit saw the earlier edit's output"
        (any (T.isInfixOf "{- pass1 pass2 -}" . snd) (renderedPairs r.modules))
    _other -> assertFailure "expected exactly one header result"

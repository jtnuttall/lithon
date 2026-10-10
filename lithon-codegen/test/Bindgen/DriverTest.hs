{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

-- | The generic bindgen fold, end-to-end over a toy header: planning mints
-- typed module names through the plan's mangle, 'HB.RequireHit' misses fail
-- generation loudly, 'HB.AllowMiss' misses pass through untouched, text
-- edits apply in list order (a later edit sees an earlier edit's output),
-- the finalizer's payload arrives on the result, and a header reaching
-- another through a quoted include (libmpv's shape) chains after it and
-- binds against its spec. A prescriptive spec reaches its own header's
-- invocation alone, one that pairs with no planned header fails the run,
-- and so does one with an entry its header's run does not use.
module Bindgen.DriverTest (
  unit_driverFoldsToyHeader,
  unit_requireHitMissFails,
  unit_allowMissSkips,
  unit_editsApplyInOrder,
  unit_quotedIncludeChains,
  unit_overrideScopedToItsUnit,
  unit_orphanOverrideFails,
  unit_unusedOverrideFails,
) where

import Data.Text qualified as T
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.FilePath ((</>))
import Test.Tasty.HUnit (Assertion, assertBool, assertFailure, (@?=))

import Bindgen.Support.Toy (
  ToyEnv (..),
  ToyHeader (..),
  renderedPairs,
  runToyChain,
  runToyChainSpecs,
  toyEnv,
 )
import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen.Driver (
  HeaderPlan (..),
  HeaderResult (..),
  HeaderUnit (..),
  Passes (..),
  Visitor (..),
  defaultSpecFileName,
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

-- | Run one visitor over the toy universe under the real effect stack.
runToyDriver :: Visitor r -> IO (Either Text [HeaderResult r])
runToyDriver =
  runToyChain
    (toyEnv "lithon-driver-toy")
    [ToyHeader{include = "toy" </> "toy_thing.h", source = toyHeader}]
    toyPlan

unit_driverFoldsToyHeader :: Assertion
unit_driverFoldsToyHeader = do
  results <-
    either (assertFailure . toString) pure
      =<< runToyDriver Visitor{passes = mempty, finalize = \_ arts _ -> Right (length arts.cDecls)}
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
    runToyDriver
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
      =<< runToyDriver
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
      =<< runToyDriver
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

headerA, headerB :: Text
headerA =
  unlines
    [ "#ifndef TOY_A_H"
    , "#define TOY_A_H"
    , "typedef struct toy_point { int x; int y; } toy_point;"
    , "int toy_a_origin(toy_point *out);"
    , "#endif"
    ]
headerB =
  unlines
    [ "#ifndef TOY_B_H"
    , "#define TOY_B_H"
    , "#include \"toy_a.h\""
    , "int toy_b_norm(toy_point p);"
    , "#endif"
    ]

-- | @toy_b.h@ reaches @toy_a.h@ only through a quoted include, so the
-- chain is @toy_a.h@ then @toy_b.h@.
quotedHeaders :: [ToyHeader]
quotedHeaders =
  [ ToyHeader{include = "toy" </> "toy_a.h", source = headerA}
  , ToyHeader{include = "toy" </> "toy_b.h", source = headerB}
  ]

-- | @toy_b.h@ reaches @toy_a.h@ only through a quoted include (as
-- libmpv's @render_gl.h@ reaches @render.h@) and is the only main
-- include: the preflight graph still finds both, the chain runs them in
-- dependency order, and the second invocation binds @toy_point@ through
-- the first one's spec — it imports the defining module instead of
-- declaring the type again.
unit_quotedIncludeChains :: Assertion
unit_quotedIncludeChains = do
  results <-
    either (assertFailure . toString) pure
      =<< runToyChain
        (toyEnv "lithon-driver-quoted")
        quotedHeaders
        toyPlan{mainIncludes = ["toy/toy_b.h"]}
        Visitor{passes = mempty, finalize = \_ _ _ -> Right ()}
  map (.unit.headerName) results @?= ["toy_a.h", "toy_b.h"]
  case results of
    [a, b] -> do
      let declares r = any (T.isInfixOf "data Toy_point" . snd) (renderedPairs r.modules)
      assertBool "toy_a.h declares toy_point" (declares a)
      assertBool "toy_b.h does not redeclare toy_point" (not (declares b))
      assertBool
        "toy_b.h's family imports toy_a.h's types module"
        (any (elem "Toy.Bindgen.A" . (.hsModule.importedModules)) b.modules)
    _other -> assertFailure "expected two header results"

-- | A prescriptive spec omitting @toy_a_origin@, the function @toy_a.h@
-- declares and @toy_b.h@ reaches through its include.
omitOrigin :: Text
omitOrigin =
  unlines
    [ "version:"
    , "  hs_bindgen: 0.1.0"
    , "  binding_specification: \"1.0\""
    , "ctypes:"
    , "  - omit:"
    , "      headers: toy/toy_a.h"
    , "      cname: toy_a_origin"
    ]

-- | An override named like @toy_a.h@'s spec file reaches @toy_a.h@'s
-- invocation alone: @toy_a.h@ drops the function and its spec records the
-- omit, while @toy_b.h@ (which includes it) is run without the file, so
-- its spec does not copy the omit (handing every unit the whole set did,
-- and drew an unused-entry warning from every unit that did not reach
-- the function).
unit_overrideScopedToItsUnit :: Assertion
unit_overrideScopedToItsUnit = do
  results <-
    either (assertFailure . toString) pure
      =<< runToyChainSpecs
        (toyEnv "lithon-driver-scoped"){overrides = [("toy_a.yaml", omitOrigin)]}
        quotedHeaders
        toyPlan{mainIncludes = ["toy/toy_b.h"]}
        Visitor{passes = mempty, finalize = \_ _ _ -> Right ()}
  case results of
    [(a, specA), (b, specB)] -> do
      let mentions what = any (T.isInfixOf what . snd) . renderedPairs . (.modules)
      assertBool "toy_a.h's family lacks the omitted function" (not (mentions "toy_a_origin" a))
      assertBool
        ("toy_a.h's spec records the omit under its own header:\n" <> toString specA)
        ( and
            [needle `T.isInfixOf` specA | needle <- ["omit:", "headers: toy/toy_a.h", "cname: toy_a_origin"]]
        )
      assertBool "toy_b.h's family still binds its own function" (mentions "toy_b_norm" b)
      assertBool
        ("toy_b.h's spec does not copy the omit:\n" <> toString specB)
        (not ("toy_a_origin" `T.isInfixOf` specB))
    _other -> assertFailure ("expected two header results, got " <> show (length results))

-- | An override that pairs with no planned header (a misspelled name, or
-- the file of an excluded header) fails the run, naming the file, before
-- any header is invoked.
unit_orphanOverrideFails :: Assertion
unit_orphanOverrideFails = do
  r <-
    runToyChain
      (toyEnv "lithon-driver-orphan")
        { overrides = [("toy_a.yaml", omitOrigin), ("toy_tpyo.yaml", omitOrigin)]
        }
      quotedHeaders
      toyPlan{mainIncludes = ["toy/toy_b.h"]}
      Visitor{passes = mempty, finalize = \_ _ _ -> Right ()}
  case r of
    Right _ -> assertFailure "expected the orphaned override to fail the run"
    Left err -> do
      assertBool ("names the orphan: " <> toString err) ("overrides/toy_tpyo.yaml" `T.isInfixOf` err)
      assertBool
        ("does not name a paired file: " <> toString err)
        (not ("overrides/toy_a.yaml" `T.isInfixOf` err))

-- | An override entry that names nothing its header declares (a typo, or
-- a declaration the library removed) fails the header's run, naming the
-- file and the entry; hs-bindgen alone would only warn and bind on.
unit_unusedOverrideFails :: Assertion
unit_unusedOverrideFails = do
  r <-
    runToyChain
      (toyEnv "lithon-driver-unused")
        { overrides = [("toy_a.yaml", T.replace "toy_a_origin" "toy_a_orgin" omitOrigin)]
        }
      quotedHeaders
      toyPlan{mainIncludes = ["toy/toy_b.h"]}
      Visitor{passes = mempty, finalize = \_ _ _ -> Right ()}
  case r of
    Right _ -> assertFailure "expected the unused override entry to fail the run"
    Left err -> do
      assertBool ("names the file: " <> toString err) ("overrides/toy_a.yaml" `T.isInfixOf` err)
      assertBool ("names the entry: " <> toString err) ("toy_a_orgin" `T.isInfixOf` err)

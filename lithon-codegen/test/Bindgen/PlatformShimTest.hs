{-# LANGUAGE OverloadedStrings #-}

-- | Pins for the platform shims under the AST-level transform mechanism:
-- the per-family >= 1-hit invariant and the production shim data itself
-- ('Lithon.Codegen.Bindgen.Target.Sdl3.stubEditsFor'), driven through the
-- REAL pipeline over toy headers that declare the shimmed symbols. Shim
-- edits legitimately miss individual modules (the types module carries no
-- wrapper C; call bodies live in @.Safe@\/@.Unsafe@, address-of bodies in
-- @.FunPtr@), but an edit matching NO module means the wrapper shape
-- drifted under an hs-bindgen change and a platform guard would silently
-- vanish — generation must fail instead.
--
-- Also pins the one shim that is no longer a shim: SDL's
-- @SDL_MAIN_HANDLED@ is a root define, and hs-bindgen renders root
-- directives (defines before includes) at the top of every wrapper
-- translation unit.
module Bindgen.PlatformShimTest (
  unit_linuxStubsRewriteTheFamily,
  unit_rootDefinesPrecedeIncludes,
  unit_shimDriftFails,
  unit_unshimmedHeaderUntouched,
) where

import Data.List qualified as L
import Data.Text qualified as T
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, assertEqual, assertFailure, (@?=))

import Bindgen.Support.Toy (ToyEnv (..), ToyHeader (..), renderedPairs, runToy, toyEnv, wrapperC)
import Lithon.Codegen.Bindgen.Target.Sdl3 (stubEditsFor)

-- | Drive one toy header through the seam and hand back the translated
-- family (pre-render).
toyFamily :: FilePath -> Text -> IO [HB.NameableModule HB.HsModule]
toyFamily = toyFamilyWith (toyEnv "lithon-shim-toy")

toyFamilyWith :: ToyEnv -> FilePath -> Text -> IO [HB.NameableModule HB.HsModule]
toyFamilyWith env include source =
  runToy
    env
    "SDL3.Sys.Bindgen.ShimToy"
    [ToyHeader{include, source}]
    HB.translatedFamily

-- | A header declaring exactly the two Linux-only symbols the production
-- shims guard, so 'stubEditsFor' applies to real wrapper C.
systemToyHeader :: Text
systemToyHeader =
  unlines
    [ "#ifndef SDL_SYSTEM_TOY_H"
    , "#define SDL_SYSTEM_TOY_H"
    , "typedef int SDL_bool_toy;"
    , "SDL_bool_toy SDL_SetLinuxThreadPriority(long long threadID, int priority);"
    , "SDL_bool_toy SDL_SetLinuxThreadPriorityAndPolicy(long long threadID, int sdlPriority, int schedPolicy);"
    , "#endif"
    ]

unit_linuxStubsRewriteTheFamily :: IO ()
unit_linuxStubsRewriteTheFamily = do
  family <- toyFamily "SDL_system_toy.h" systemToyHeader
  shimmed <-
    either (assertFailure . show) pure
      $ HB.applyStubEdits (stubEditsFor "SDL_system.h") family
  rendered <-
    either (assertFailure . show) pure
      $ HB.renderFamilyWith [] shimmed
  let everything = T.concat (map snd (renderedPairs rendered))
  -- Two call edits land in Unsafe AND Safe, two address edits in FunPtr:
  -- six guards, each with a loud SetError stub.
  T.count "#ifdef SDL_PLATFORM_LINUX" everything @?= 6
  T.count "SDL_SetError" everything @?= 6
  -- The types module is untouched even though no edit matches it.
  let typesSrc = fromMaybe "" (L.lookup "SDL3.Sys.Bindgen.ShimToy" (renderedPairs rendered))
  T.count "#ifdef SDL_PLATFORM_LINUX" typesSrc @?= 0

-- | The define and the include argument mirror production (@parse.defines@
-- and @SDL3\/SDL_main.h@ of the SDL3 target): @SDL_main.h@ tests
-- @SDL_MAIN_HANDLED@ with @#ifndef@, so the define has to come first in
-- the wrapper C, with no text edit to put it there.
unit_rootDefinesPrecedeIncludes :: IO ()
unit_rootDefinesPrecedeIncludes = do
  family <-
    toyFamilyWith
      (toyEnv "lithon-shim-toy"){defineMacros = [("SDL_MAIN_HANDLED", "")]}
      "SDL3/SDL_main.h"
      $ unlines
        [ "#ifndef SDL_MAIN_TOY_H"
        , "#define SDL_MAIN_TOY_H"
        , "typedef struct SDL_ToyEvent { int t; } SDL_ToyEvent;"
        , "int SDL_ToyRunApp(SDL_ToyEvent ev);"
        , "#endif"
        ]
  rendered <-
    either (assertFailure . show) pure
      $ HB.renderFamilyWith [] family
  let withWrapperC =
        [ (name, c)
        | (name, source) <- renderedPairs rendered
        , let c = wrapperC source
        , not (null c)
        ]
  assertBool
    "the Unsafe module carries wrapper C"
    (any ((== "SDL3.Sys.Bindgen.ShimToy.Unsafe") . fst) withWrapperC)
  -- Every wrapper translation unit opens with the directives, in order,
  -- each once.
  for_ withWrapperC \(name, c) -> do
    assertEqual
      (toString name <> ": wrapper C opens with the define, then the include")
      ["#define SDL_MAIN_HANDLED", "#include <SDL3/SDL_main.h>"]
      (take 2 c)
    assertEqual
      (toString name <> ": the define appears once")
      1
      (length (filter (== "#define SDL_MAIN_HANDLED") c))
    assertEqual
      (toString name <> ": the include appears once")
      1
      (length (filter (== "#include <SDL3/SDL_main.h>") c))

unit_shimDriftFails :: IO ()
unit_shimDriftFails = do
  -- A family that never declares the guarded symbols: every stub edit
  -- must miss, and the first miss fails generation loudly.
  family <-
    toyFamily "SDL_other_toy.h"
      $ unlines
        [ "#ifndef SDL_OTHER_TOY_H"
        , "#define SDL_OTHER_TOY_H"
        , "int SDL_ToyOther(int x);"
        , "#endif"
        ]
  case HB.applyStubEdits (stubEditsFor "SDL_system.h") family of
    Right _mods -> assertFailure "expected drift to fail generation"
    Left (HB.StubEditMissed label symbol target) -> do
      label @?= "SDL_SetLinuxThreadPriority call"
      symbol @?= "SDL_SetLinuxThreadPriority"
      assertBool
        "shows the expected stub line"
        ("return (SDL_SetLinuxThreadPriority)" `T.isInfixOf` target)
    Left other -> assertFailure ("unexpected transform error: " <> show other)

unit_unshimmedHeaderUntouched :: IO ()
unit_unshimmedHeaderUntouched = do
  family <- toyFamily "SDL_video_toy.h" "int SDL_ToyVideo(int x);\n"
  length (stubEditsFor "SDL_video.h") @?= 0
  rendered0 <-
    either (assertFailure . show) pure
      $ HB.renderFamilyWith [] family
  shimmed <-
    either (assertFailure . show) pure
      $ HB.applyStubEdits (stubEditsFor "SDL_video.h") family
  rendered1 <-
    either (assertFailure . show) pure
      $ HB.renderFamilyWith [] shimmed
  renderedPairs rendered1 @?= renderedPairs rendered0

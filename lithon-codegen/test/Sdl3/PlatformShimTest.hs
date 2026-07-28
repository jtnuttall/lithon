{-# LANGUAGE OverloadedStrings #-}

-- | Pins for the platform shims under the AST-level transform mechanism:
-- the per-family >= 1-hit invariant and the production shim data itself
-- ('Lithon.Codegen.Sdl3.Bindgen.stubEditsFor' \/ 'textEditsFor'), driven
-- through the REAL pipeline over toy headers that declare the shimmed
-- symbols. Shim edits legitimately miss individual modules (the types
-- module carries no wrapper C; call bodies live in @.Safe@\/@.Unsafe@,
-- address-of bodies in @.FunPtr@), but an edit matching NO module means
-- the wrapper shape drifted under an hs-bindgen change and a platform
-- guard would silently vanish — generation must fail instead.
module Sdl3.PlatformShimTest (
  unit_linuxStubsRewriteTheFamily,
  unit_mainHandledInsertsDefine,
  unit_shimDriftFails,
  unit_unshimmedHeaderUntouched,
) where

import Data.List qualified as L
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.Directory (createDirectoryIfMissing)
import System.FilePath (takeDirectory, (</>))
import System.IO.Temp (withSystemTempDirectory)
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Sdl3.Bindgen (stubEditsFor, textEditsFor)

-- | Drive one toy header through the seam and hand back the translated
-- family (pre-render).
toyFamily :: FilePath -> Text -> IO [(Text, HB.HsModule)]
toyFamily include header = withSystemTempDirectory "lithon-sdl3-shim-toy" \dir -> do
  createDirectoryIfMissing True (takeDirectory (dir </> include))
  TIO.writeFile (dir </> include) header
  let env =
        HB.InvocationEnv
          { extraIncludeDirs = [dir]
          , defineMacros = []
          , doxygenAliases = []
          , fieldNaming = HB.AddFieldPrefixes
          , uniqueId = "lithon-shim-toy"
          }
      spec =
        HB.InvocationSpec
          { baseModule = "SDL3.Sys.Bindgen.ShimToy"
          , includes = [include]
          , priorSpecs = []
          , prescriptiveSpec = Nothing
          }
  either (\e -> assertFailure ("bindgen error: " <> toString (display e))) pure
    =<< HB.runBindgen env spec HB.translatedFamily

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
  let everything = T.concat (map snd rendered)
  -- Two call edits land in Unsafe AND Safe, two address edits in FunPtr:
  -- six guards, each with a loud SetError stub.
  T.count "#ifdef SDL_PLATFORM_LINUX" everything @?= 6
  T.count "SDL_SetError" everything @?= 6
  -- The types module is untouched even though no edit matches it.
  let typesSrc = fromMaybe "" (L.lookup "SDL3.Sys.Bindgen.ShimToy" rendered)
  T.count "#ifdef SDL_PLATFORM_LINUX" typesSrc @?= 0

unit_mainHandledInsertsDefine :: IO ()
unit_mainHandledInsertsDefine = do
  -- The include argument mirrors production (@SDL3\/SDL_main.h@) so the
  -- rendered wrapper splice carries the exact needle the text edit targets.
  family <-
    toyFamily "SDL3/SDL_main.h"
      $ unlines
        [ "#ifndef SDL_MAIN_TOY_H"
        , "#define SDL_MAIN_TOY_H"
        , "typedef struct SDL_ToyEvent { int t; } SDL_ToyEvent;"
        , "int SDL_ToyRunApp(SDL_ToyEvent ev);"
        , "#endif"
        ]
  rendered <-
    either (assertFailure . show) pure
      $ HB.renderFamilyWith (textEditsFor "SDL_main.h") family
  assertBool "SDL_MAIN_HANDLED define inserted before the include"
    $ any (T.isInfixOf "#define SDL_MAIN_HANDLED" . snd) rendered

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
  length (textEditsFor "SDL_video.h") @?= 0
  rendered0 <-
    either (assertFailure . show) pure
      $ HB.renderFamilyWith [] family
  shimmed <-
    either (assertFailure . show) pure
      $ HB.applyStubEdits (stubEditsFor "SDL_video.h") family
  rendered1 <-
    either (assertFailure . show) pure
      $ HB.renderFamilyWith (textEditsFor "SDL_video.h") shimmed
  rendered1 @?= rendered0

{-# LANGUAGE OverloadedStrings #-}

-- | End-to-end golden of the alias planner\/renderer: drive an SDL-shaped
-- toy header through the real hs-bindgen pipeline (the same artefacts
-- 'Lithon.Codegen.Sdl3.Bindgen.runHeader' demands), then distill, census,
-- validate, plan, and render.
--
-- Pins, in one artifact: callback detection on the C AST (including the
-- pointer-to-callback out-param exclusion), the three flavor classes, the
-- camel-segments minting, see-also rewriting to alias names, the flavor
-- provenance paragraphs, and the module\/umbrella shapes.
module Sdl3.AliasRenderTest (
  unit_toyCensusDetectsCallbacks,
  test_aliasRenderGolden,
) where

import Data.ByteString.Lazy qualified as LBS
import Data.List qualified as L
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Data.Text.IO qualified as TIO
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.FilePath ((</>))
import System.IO.Temp (withSystemTempDirectory)
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.Golden (goldenVsStringDiff)
import Test.Tasty.HUnit (assertFailure, (@?=))

import Lithon.Codegen.Sdl3.Alias (
  FamilyDecls (..),
  aliasRewriteMap,
  distillFamily,
  functionCensus,
  planAliasLayer,
  renderAliasModule,
  renderUmbrella,
 )
import Lithon.Codegen.Sdl3.Alias.Config (
  AliasConfig (..),
  FunctionEntry (..),
  NamingRule (..),
  validateAliasConfig,
 )
import Lithon.Codegen.Sdl3.Alias.Constants (
  Combine (..),
  ConstantGroup (..),
  ConstantsConfig (..),
  planConstants,
  scanObjectMacros,
 )
import Lithon.Codegen.Sdl3.Alias.Constants qualified as Constants
import Lithon.Codegen.Sdl3.Alias.Names (Safety (..))

unit_toyCensusDetectsCallbacks :: IO ()
unit_toyCensusDetectsCallbacks = do
  (facts, _baseModule) <- toyFamily
  functionCensus [facts]
    @?= Map.fromList
      [ ("SDL_CreateToyThing", False)
      , ("SDL_ToyIsOk", False) -- scalar-bridge pin (bool/float/double)
      , ("SDL_ToyCount", False) -- scalar-bridge pin (int result, width typedef + size_t args)
      , ("SDL_GetToyId", False) -- negative control: semantic typedef stays raw
      , ("SDL_ToyEnumerate", True) -- direct callback param
      , ("SDL_SetToyCallback", True) -- direct callback param
      , ("SDL_GetToyCallback", False) -- pointer-to-callback out-param
      ]

test_aliasRenderGolden :: TestTree
test_aliasRenderGolden =
  testGroup
    "alias-render"
    [ golden "alias-toy-module" (fmap (\(m, _, _) -> m) rendered)
    , golden "alias-toy-umbrella" (fmap (\(_, u, _) -> u) rendered)
    , -- The Bindgen base (types) module: pins the CategoryToy peel — the
      -- overview renders as the module Haddock between the pragmas and the
      -- module line, and the first declaration's doc stays clean.
      golden "alias-toy-bindgen-base" (fmap (\(_, _, b) -> b) rendered)
    ]
 where
  golden name source =
    goldenVsStringDiff
      name
      (\ref new -> ["diff", "-u", ref, new])
      ("test/golden/sdl3" </> name <> ".golden")
      (LBS.fromStrict . TE.encodeUtf8 <$> source)

  rendered = do
    (facts, baseModule) <- toyFamily
    let census = functionCensus [facts]
        config =
          AliasConfig
            { naming = CamelSegments
            , functions =
                Map.fromList
                  [
                    ( "SDL_ToyEnumerate"
                    , FunctionEntry SafeOnly (Just "invokes the callback synchronously")
                    )
                  ,
                    ( "SDL_SetToyCallback"
                    , FunctionEntry Both (Just "registration only")
                    )
                  , -- keeps the explicit opt-out class exercised end-to-end
                    -- now that unlisted functions default to Both

                    ( "SDL_CreateToyThing"
                    , FunctionEntry UnsafeOnly (Just "toy pin of the opt-out class")
                    )
                  ]
            , renames = mempty
            , skip = mempty
            }
    validated <-
      either (assertFailure . toString . display) pure
        $ validateAliasConfig census config
    -- The constants pipeline, minus the probe: membership from the toy
    -- header's scanned macros, values/sizeofs supplied directly (what the
    -- probe TU would have printed).
    let constantsConfig =
          ConstantsConfig
            { groups =
                Map.fromList
                  [
                    ( "SDL_ToyFlags"
                    , ConstantGroup
                        { combine = Bitmask
                        , prefix = Just "SDL_TOY_"
                        , suffix = Nothing
                        , -- The include guard is an object-like macro too:
                          -- excluding it here pins the valueless-macro
                          -- failure mode the probe otherwise hard-fails on.
                          exclude = ["SDL_TOY_LIMIT", "SDL_TOY_H"]
                        , members = Nothing
                        }
                    )
                  ,
                    ( "SDL_ToyMode"
                    , ConstantGroup
                        { combine = ValueSpace
                        , prefix = Nothing
                        , suffix = Nothing
                        , exclude = []
                        , members = Just ["SDL_TOY_LIMIT"]
                        }
                    )
                  ]
            }
        familyConstants =
          Constants.FamilyConstants
            { familyBase = facts.familyBase
            , headerName = facts.headerName
            , headerMacros = scanObjectMacros toyHeader
            , newtypeConstrs = facts.newtypeConstrs
            , takenNames = facts.takenNames
            }
    constantPlans <-
      either (assertFailure . toString . display) pure
        $ planConstants
          constantsConfig
          [familyConstants]
          (Map.fromList [("SDL_ToyFlags", 4), ("SDL_ToyMode", 1)])
          ( Map.fromList
              [("SDL_TOY_A", 1), ("SDL_TOY_B", 2), ("SDL_TOY_AB", 3), ("SDL_TOY_LIMIT", 7)]
          )
    let plansByFamily =
          Map.fromListWith (flip (<>)) [(p.familyBase, [p]) | p <- constantPlans]
    aliasModules <-
      either (assertFailure . toString . display) pure
        $ planAliasLayer validated plansByFamily [facts]
    let rewriteMap = aliasRewriteMap aliasModules
        modules = map (renderAliasModule rewriteMap) aliasModules
        umbrella = renderUmbrella aliasModules
    case modules of
      [(_, familySrc)] -> pure (familySrc, snd umbrella, baseModule)
      _unexpected -> assertFailure ("expected exactly one alias module, got " <> show (map fst modules))

-- | Run the toy header through the same artefact demands as @runHeader@
-- and distill it for the planner; also return the rendered Bindgen base
-- (types) module for the peel golden. A unique temp dir per invocation:
-- the fixed shared name raced under tasty parallelism (toyFamily runs
-- several times) and was squattable in a shared @\/tmp@. The header file
-- is only read during the bindgen invocation; the distilled decls derive
-- from the in-memory result, so the directory may die at the end of the
-- bracket.
toyFamily :: IO (FamilyDecls, Text)
toyFamily = withSystemTempDirectory "lithon-sdl3-alias-toy" \dir -> do
  TIO.writeFile (dir </> "SDL_toy.h") toyHeader
  let env =
        HB.InvocationEnv
          { extraIncludeDirs = [dir]
          , defineMacros = []
          , -- Mirrors the production env in "Lithon.Codegen.Sdl3.Bindgen":
            -- without the alias, doxygen leaks @\\threadsafety ...@ verbatim.
            doxygenAliases = [("threadsafety", "\\par Thread safety:^^")]
          , fieldNaming = HB.AddFieldPrefixes
          , uniqueId = "lithon-alias-toy"
          }
      spec =
        HB.InvocationSpec
          { baseModule = "SDL3.Sys.Bindgen.Toy"
          , includes = ["SDL_toy.h"]
          , priorSpecs = []
          , prescriptiveSpec = Nothing
          }
  eres <-
    HB.runBindgen env spec do
      family <- HB.translatedFamily
      hsDecls <- HB.reifiedHs
      cDecls <- HB.reifiedC
      mdoc <- HB.headerComment
      pure (family, hsDecls, cDecls, mdoc)
  case eres of
    Left err -> assertFailure ("bindgen error: " <> toString (display err))
    Right (family, hsDecls, cDecls, mdoc) -> do
      rendered <-
        either (assertFailure . show) pure (HB.renderFamilyWith [] family)
      let pairs = map (\m -> (HB.moduleName m, m.hsModule.text)) rendered
      baseModule <-
        maybe
          (assertFailure "no Bindgen base module for the toy header")
          pure
          (L.lookup "SDL3.Sys.Bindgen.Toy" pairs)
      pure
        ( distillFamily
            "SDL3.Sys.Bindgen.Toy"
            "SDL_toy.h"
            (any ((== "SDL3.Sys.Bindgen.Toy") . fst) pairs)
            mdoc
            hsDecls
            cDecls
        , baseModule
        )

-- | SDL-shaped toy header. The file-level @# CategoryToy@ comment mirrors
-- SDL's per-header category overview: doxygen fuses it into the first
-- declaration as a @\<sect1\>@, which the vendored peel moves onto the
-- Bindgen base module. @SDL_CreateToyThing@ carries pins for the other
-- vendor doc patches: @\\since@ version extraction, @\\threadsafety@ via
-- the doxygen alias, prose slashes (must render escaped, not as Haddock
-- italics), and a code block with a backslash escape.
toyHeader :: Text
toyHeader =
  T.unlines
    [ "#ifndef SDL_TOY_H"
    , "#define SDL_TOY_H"
    , ""
    , "#include <stdbool.h>"
    , "#include <stddef.h>"
    , "#include <stdint.h>"
    , ""
    , "/**"
    , " * # CategoryToy"
    , " *"
    , " * Toy overview prose."
    , " */"
    , ""
    , "typedef struct SDL_ToyThing {"
    , "  int size;"
    , "} SDL_ToyThing;"
    , ""
    , "/**"
    , " * Toy capability flags."
    , " */"
    , "typedef unsigned int SDL_ToyFlags;"
    , ""
    , "#define SDL_TOY_A     0x00000001u /**< the A capability */"
    , "#define SDL_TOY_B     (1u << 1)"
    , "#define SDL_TOY_AB    (SDL_TOY_A | SDL_TOY_B)"
    , ""
    , "/**"
    , " * Toy mode selector (not a bitmask)."
    , " */"
    , "typedef unsigned char SDL_ToyMode;"
    , ""
    , "#define SDL_TOY_LIMIT 7"
    , ""
    , "/**"
    , " * A callback invoked per toy."
    , " */"
    , "typedef void (*SDL_ToyCallback)(void *userdata, int value);"
    , ""
    , "/**"
    , " * Create a toy thing."
    , " *"
    , " * The thing writes into read/write locks in the /unlocked/ state."
    , " * Pass `SDL_TOY_A` to enable the A capability."
    , " *"
    , " * ```c"
    , " * SDL_ToyThing *t = SDL_CreateToyThing(4);"
    , " * printf(\"%d\\n\", t->size);"
    , " * ```"
    , " *"
    , " * \\param size how big."
    , " * \\returns a new thing."
    , " *"
    , " * \\threadsafety It is safe to call this function from any thread."
    , " *"
    , " * \\since This function is available since SDL 3.2.0."
    , " *"
    , " * \\sa SDL_ToyEnumerate"
    , " * \\sa SDL_ToyIsOk"
    , " */"
    , "SDL_ToyThing *SDL_CreateToyThing(int size);"
    , ""
    , "/**"
    , " * Check a toy against a pair of thresholds."
    , " *"
    , " * \\param x low water mark."
    , " * \\param y high water mark."
    , " * \\returns true if the toy is ok."
    , " */"
    , "bool SDL_ToyIsOk(float x, double y);"
    , ""
    , "/**"
    , " * A stdinc-shaped width typedef (mirrors SDL_stdinc's Uint32):"
    , " * the same-family TCon arm of the scalar bridge."
    , " */"
    , "typedef uint32_t Uint32;"
    , ""
    , "/**"
    , " * A semantic id over the width typedef: must NOT scalar-bridge."
    , " */"
    , "typedef Uint32 SDL_ToyId;"
    , ""
    , "/**"
    , " * Count the toys."
    , " *"
    , " * \\param n how many to consider."
    , " * \\param len buffer length."
    , " * \\returns how many matched."
    , " */"
    , "int SDL_ToyCount(Uint32 n, size_t len);"
    , ""
    , "/**"
    , " * Identify a toy."
    , " *"
    , " * \\param slot which slot."
    , " * \\returns the toy's id."
    , " */"
    , "SDL_ToyId SDL_GetToyId(short slot);"
    , ""
    , "/**"
    , " * Enumerate the toys, invoking the callback for each one."
    , " *"
    , " * \\param callback the per-toy callback."
    , " * \\param userdata app pointer."
    , " */"
    , "void SDL_ToyEnumerate(SDL_ToyCallback callback, void *userdata);"
    , ""
    , "/**"
    , " * Register a callback for later toys."
    , " *"
    , " * \\sa SDL_GetToyCallback"
    , " */"
    , "void SDL_SetToyCallback(SDL_ToyCallback callback, void *userdata);"
    , ""
    , "/**"
    , " * Fetch the registered callback through an out-param."
    , " */"
    , "void SDL_GetToyCallback(SDL_ToyCallback *callback);"
    , ""
    , "#endif"
    ]

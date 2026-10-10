{-# LANGUAGE OverloadedStrings #-}

-- | The alias-name minting rules for the curated @SDL3.Sys.*@ layer: the
-- camelCase-segments normalization over every corpus shape, the
-- exceptionless flavor surface, and the loud-failure paths (invalid
-- identifiers, collisions — including the @Safe@-suffix trap — and rename
-- resolution), and the target's base-name rule for authored functions
-- (C shims are named like what they wrap, so they can collide with the
-- library's own functions).
module Bindgen.AliasNamesTest (
  unit_normalizeCorpusShapes,
  unit_normalizeMpvShapes,
  unit_flavorSurface,
  unit_invalidNamesError,
  unit_collisionsAccumulate,
  unit_safeSuffixTrapCollides,
  unit_renamesOverrideAndResolve,
  unit_authoredNamesMint,
) where

import Data.Map.Strict qualified as Map
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Bindgen.Alias (aliasBaseName)
import Lithon.Codegen.Bindgen.Alias.Names (
  AliasError (..),
  MintedAlias (..),
  Safety (..),
  mintAliasNames,
  normalizeFunctionName,
  validVarId,
 )
import Lithon.Codegen.Bindgen.Target (BindgenTarget (..))
import Lithon.Codegen.Bindgen.Target qualified as Target
import Lithon.Codegen.Bindgen.Target.Sdl3 (sdl3)

-- | Every naming shape the SDL 3.4.2 corpus exercises, pinned to the exact
-- expected spelling (cross-validated against the full 1,232-function
-- census during design).
unit_normalizeCorpusShapes :: IO ()
unit_normalizeCorpusShapes =
  for_ cases $ \(cName, expected) ->
    normalizeFunctionName sdlPrefix cName @?= expected
 where
  cases :: [(Text, Text)]
  cases =
    [ ("SDL_CreateWindow", "createWindow") -- plain PascalCase
    , ("SDL_Init", "init") -- single word
    , ("SDL_GetError", "getError") -- single-letter leading run
    , ("SDL_GL_SwapWindow", "glSwapWindow") -- all-caps first segment
    , ("SDL_EGL_GetProcAddress", "eglGetProcAddress")
    , ("SDL_Vulkan_CreateSurface", "vulkanCreateSurface")
    , ("SDL_Metal_CreateView", "metalCreateView")
    , ("SDL_hid_get_feature_report", "hidGetFeatureReport") -- snake_case family
    , ("SDL_qsort_r", "qsortR") -- trailing _r
    , ("SDL_iconv_string", "iconvString")
    , ("SDL_getenv_unsafe", "getenvUnsafe")
    , ("SDL_murmur3_32", "murmur3_32") -- digit-led segment keeps _
    , ("SDL_LoadBMP_IO", "loadBMPIO") -- capitalized later segment
    , ("SDL_GDKSuspendComplete", "gdkSuspendComplete") -- leading acronym run
    , ("SDL_GPUSupportsProperties", "gpuSupportsProperties")
    , ("SDL_GUIDToString", "guidToString")
    , ("SDL_IOFromFile", "ioFromFile")
    , ("SDL_UCS4ToUTF8", "ucs4ToUTF8") -- acronym run ended by a digit
    , ("SDL_isalpha", "isalpha") -- already lowercase
    ]

-- | The same rule over libmpv's all-snake_case spellings: a lowercase
-- prefix, every later segment capitalized.
unit_normalizeMpvShapes :: IO ()
unit_normalizeMpvShapes =
  for_ cases $ \(cName, expected) ->
    normalizeFunctionName "mpv_" cName @?= expected
 where
  cases :: [(Text, Text)]
  cases =
    [ ("mpv_set_property", "setProperty")
    , ("mpv_get_time_ns", "getTimeNs")
    , ("mpv_render_context_create", "renderContextCreate")
    , ("mpv_stream_cb_add_ro", "streamCbAddRo")
    , ("mpv_command", "command") -- single segment
    ]

unit_flavorSurface :: IO ()
unit_flavorSurface = do
  minted <-
    either (assertFailureText . display) pure
      . validationToEither
      $ mintAliasNames
        (normalizeFunctionName sdlPrefix)
        mempty
        [ ("SDL_CreateWindow", UnsafeOnly)
        , ("SDL_WaitEvent", Both)
        , ("SDL_EnumerateDirectory", SafeOnly)
        ]
  Map.lookup "SDL_CreateWindow" minted
    @?= Just MintedAlias{unsafeName = Just "createWindow", safeName = Nothing}
  Map.lookup "SDL_WaitEvent" minted
    @?= Just MintedAlias{unsafeName = Just "waitEvent", safeName = Just "waitEventSafe"}
  Map.lookup "SDL_EnumerateDirectory" minted
    @?= Just MintedAlias{unsafeName = Nothing, safeName = Just "enumerateDirectorySafe"}

unit_invalidNamesError :: IO ()
unit_invalidNamesError = do
  validVarId "case" @?= Just "Haskell keyword"
  validVarId "" @?= Just "empty after prefix strip"
  assertBool "valid name passes" (isNothing (validVarId "createWindow"))
  -- A C name normalizing to a keyword is a hard error naming the culprit.
  let errs = failures (mintAliasNames (normalizeFunctionName sdlPrefix) mempty [("SDL_case", UnsafeOnly)])
  errs @?= [AliasNameInvalid{cName = "SDL_case", minted = "case", reason = "Haskell keyword"}]

unit_collisionsAccumulate :: IO ()
unit_collisionsAccumulate = do
  -- Two C spellings minting one alias fail loudly, naming both, sorted.
  let errs =
        failures
          $ mintAliasNames
            (normalizeFunctionName sdlPrefix)
            mempty
            [ ("SDL_rand_bits", UnsafeOnly)
            , ("SDL_RandBits", UnsafeOnly) -- synthetic doppelgänger
            , ("SDL_CreateWindow", UnsafeOnly) -- innocent bystander
            ]
  errs
    @?= [ AliasNameCollision
            { minted = "randBits"
            , cNames = ["SDL_RandBits", "SDL_rand_bits"]
            }
        ]

-- | A minted @Safe@ suffix can collide with the alias of a real C function:
-- @SDL_getenv@ (classified 'Both') mints @getenvSafe@, the same alias a
-- hypothetical @SDL_getenv_safe@ would get.
unit_safeSuffixTrapCollides :: IO ()
unit_safeSuffixTrapCollides = do
  let errs =
        failures
          $ mintAliasNames
            (normalizeFunctionName sdlPrefix)
            mempty
            [ ("SDL_getenv", Both)
            , ("SDL_getenv_safe", UnsafeOnly)
            ]
  errs
    @?= [ AliasNameCollision
            { minted = "getenvSafe"
            , cNames = ["SDL_getenv", "SDL_getenv_safe"]
            }
        ]

unit_renamesOverrideAndResolve :: IO ()
unit_renamesOverrideAndResolve = do
  -- The rename resolves the suffix-trap collision from the previous test,
  -- and the Safe variant derives from the renamed base.
  minted <-
    either (assertFailureText . display) pure
      . validationToEither
      $ mintAliasNames
        (normalizeFunctionName sdlPrefix)
        (Map.fromList [("SDL_getenv", "getEnvironment")])
        [ ("SDL_getenv", Both)
        , ("SDL_getenv_safe", UnsafeOnly)
        ]
  Map.lookup "SDL_getenv" minted
    @?= Just
      MintedAlias
        { unsafeName = Just "getEnvironment"
        , safeName = Just "getEnvironmentSafe"
        }
  -- A rename to an invalid identifier still fails loudly.
  let errs =
        failures
          $ mintAliasNames
            (normalizeFunctionName sdlPrefix)
            (Map.fromList [("SDL_getenv", "Class")])
            [("SDL_getenv", UnsafeOnly)]
  errs
    @?= [ AliasNameInvalid
            { cName = "SDL_getenv"
            , minted = "Class"
            , reason = "does not start with a lowercase letter"
            }
        ]

-- | An authored function mints from the name it wraps: the name prefix
-- goes, then the camel-segments rule applies. @lithon_SDL_Log@ wraps
-- @SDL_Log@ and mints @log@, free since @SDL_stdinc.h@'s allowlist leaves
-- the math @SDL_log@ raw-only. A shim whose name an aliased function
-- already mints collides loudly, and a rename resolves it.
unit_authoredNamesMint :: IO ()
unit_authoredNamesMint = do
  let rule = aliasBaseName withShims
  rule "lithon_SDL_LogMessage" @?= "logMessage"
  rule "lithon_SDL_Swap16LE" @?= "swap16LE"
  rule "lithon_SDL_FOURCC" @?= "fourcc"
  rule "SDL_CreateWindow" @?= "createWindow"
  -- A library function is never stripped, and a target without authored
  -- headers strips nothing.
  aliasBaseName sdl3{authored = Nothing} "lithon_SDL_Log" @?= "lithonSDLLog"
  logMinted <-
    either (assertFailureText . display) pure
      . validationToEither
      $ mintAliasNames rule mempty [("lithon_SDL_Log", Both)]
  Map.lookup "lithon_SDL_Log" logMinted
    @?= Just MintedAlias{unsafeName = Just "log", safeName = Just "logSafe"}
  -- The collision machinery, on a toy pair: a library SDL_toy and a shim
  -- over a (hypothetical) SDL_Toy both mint toy.
  failures (mintAliasNames rule mempty [("SDL_toy", UnsafeOnly), ("lithon_SDL_Toy", Both)])
    @?= [AliasNameCollision{minted = "toy", cNames = ["SDL_toy", "lithon_SDL_Toy"]}]
  minted <-
    either (assertFailureText . display) pure
      . validationToEither
      $ mintAliasNames
        rule
        (Map.fromList [("lithon_SDL_Toy", "toyShim")])
        [("SDL_toy", UnsafeOnly), ("lithon_SDL_Toy", Both)]
  Map.lookup "lithon_SDL_Toy" minted
    @?= Just MintedAlias{unsafeName = Just "toyShim", safeName = Just "toyShimSafe"}
  Map.lookup "SDL_toy" minted @?= Just MintedAlias{unsafeName = Just "toy", safeName = Nothing}
 where
  withShims =
    sdl3
      { authored =
          Just
            Target.AuthoredHeaders
              { Target.includeRoot = "sdl3-bindgen-sys"
              , Target.namePrefix = "lithon_"
              , Target.headers = []
              }
      }

-- | The SDL prefix the corpus shapes strip.
sdlPrefix :: Text
sdlPrefix = "SDL_"

failures :: Validation (Errors e) a -> [e]
failures = \case
  Failure es -> toList es
  Success _ -> []

assertFailureText :: Text -> IO a
assertFailureText = assertFailure . toString

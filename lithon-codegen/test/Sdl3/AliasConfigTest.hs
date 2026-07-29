{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Sdl3.AliasConfigTest where

import Data.ByteString.Lazy qualified as LBS
import Data.FileEmbed (embedFileRelative)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Sdl3.Alias.Config (
  AliasConfig (..),
  FunctionEntry (..),
  NamingRule (..),
  ValidatedAliasConfig (..),
  decodeAliasConfig,
  validateAliasConfig,
 )
import Lithon.Codegen.Sdl3.Alias.Names (AliasError (..), Safety (..))

unit_committedRegistryDecodes :: IO ()
unit_committedRegistryDecodes = do
  let bytes = LBS.fromStrict $(embedFileRelative "data/sdl3/aliases.json")
  config <- either (assertFailure . toString) pure (decodeAliasConfig bytes)
  config.naming @?= CamelSegments
  config.renames @?= mempty
  config.skip @?= mempty
  -- Spot-check the three classification poles.
  fmap (.safety) (Map.lookup "SDL_EnumerateDirectory" config.functions)
    @?= Just SafeOnly
  fmap (.safety) (Map.lookup "SDL_WaitEvent" config.functions)
    @?= Just Both
  fmap (.safety) (Map.lookup "SDL_GetTicks" config.functions)
    @?= Just UnsafeOnly
  -- Every entry carries its why.
  assertBool
    "every committed entry has a rationale"
    (all (isJust . (.rationale)) (Map.elems config.functions))

emptyConfig :: AliasConfig
emptyConfig =
  AliasConfig
    { naming = CamelSegments
    , functions = mempty
    , renames = mempty
    , skip = mempty
    }

unit_validationTotalizesSafeties :: IO ()
unit_validationTotalizesSafeties = do
  let census = Map.fromList [("SDL_CreateWindow", False), ("SDL_EnumerateDirectory", True)]
      config =
        emptyConfig
          { functions =
              Map.fromList
                [ ("SDL_EnumerateDirectory", FunctionEntry SafeOnly (Just "sync"))
                ]
          }
  validated <-
    either (assertFailure . toString . display) pure
      $ validateAliasConfig census config
  -- Total over the census: the unlisted non-callback function defaults to
  -- both flavors.
  validated.safeties
    @?= Map.fromList
      [ ("SDL_CreateWindow", Both)
      , ("SDL_EnumerateDirectory", SafeOnly)
      ]

unit_unclassifiedCallbackErrors :: IO ()
unit_unclassifiedCallbackErrors = do
  let census = Map.fromList [("SDL_EnumerateDirectory", True)]
  failures (validateAliasConfig census emptyConfig)
    @?= [AliasUnclassifiedCallback{cName = "SDL_EnumerateDirectory"}]
  -- An explicit unsafe-only entry does not classify a callback function
  -- (rationale present so only the classification error fires).
  let config =
        emptyConfig
          { functions =
              Map.fromList
                [ ("SDL_EnumerateDirectory", FunctionEntry UnsafeOnly (Just "misguided"))
                ]
          }
  failures (validateAliasConfig census config)
    @?= [AliasUnclassifiedCallback{cName = "SDL_EnumerateDirectory"}]

unit_unknownNamesAccumulate :: IO ()
unit_unknownNamesAccumulate = do
  let census = Map.fromList [("SDL_CreateWindow", False)]
      config =
        emptyConfig
          { functions = Map.fromList [("SDL_Nope", FunctionEntry Both Nothing)]
          , renames = Map.fromList [("SDL_AlsoNope", "alias")]
          , skip = ["SDL_StillNope"]
          }
  sort (failures (validateAliasConfig census config))
    @?= sort
      [ AliasUnknownFunction{context = "functions", cName = "SDL_Nope"}
      , AliasUnknownFunction{context = "renames", cName = "SDL_AlsoNope"}
      , AliasUnknownFunction{context = "skip", cName = "SDL_StillNope"}
      ]

unit_deadAndContradictoryConfigErrors :: IO ()
unit_deadAndContradictoryConfigErrors = do
  let census = Map.fromList [("SDL_CreateWindow", False), ("SDL_WaitEvent", False)]
      config =
        emptyConfig
          { functions =
              Map.fromList
                [ ("SDL_CreateWindow", FunctionEntry Both Nothing) -- dead default
                , ("SDL_WaitEvent", FunctionEntry Both (Just "blocks")) -- also skipped
                ]
          , renames = Map.fromList [("SDL_WaitEvent", "waitEv")] -- also skipped
          , skip = ["SDL_WaitEvent"]
          }
  sort (failures (validateAliasConfig census config))
    @?= sort
      [ AliasConfigConflict
          { cName = "SDL_CreateWindow"
          , reason =
              "explicit both without a rationale on a non-callback function is the default; remove the entry or add a rationale"
          }
      , AliasConfigConflict
          { cName = "SDL_WaitEvent"
          , reason = "classified in functions but also skipped"
          }
      , AliasConfigConflict
          { cName = "SDL_WaitEvent"
          , reason = "renamed but also skipped"
          }
      ]
  -- Explicit opt-out (unsafe-only) and rationale-bearing both entries are
  -- meaningful config, not dead config.
  let okConfig =
        emptyConfig
          { functions =
              Map.fromList
                [ ("SDL_CreateWindow", FunctionEntry UnsafeOnly (Just "suppress the pointless Safe alias"))
                , ("SDL_WaitEvent", FunctionEntry Both (Just "blocks"))
                ]
          }
  validated <-
    either (assertFailure . toString . display) pure
      $ validateAliasConfig census okConfig
  validated.safeties
    @?= Map.fromList [("SDL_CreateWindow", UnsafeOnly), ("SDL_WaitEvent", Both)]

unit_missingRationaleErrors :: IO ()
unit_missingRationaleErrors = do
  -- Withholding a flavor without recording why is dead curation either way.
  let census = Map.fromList [("SDL_GetTicks", False), ("SDL_GetVersion", False)]
      config =
        emptyConfig
          { functions =
              Map.fromList
                [ ("SDL_GetTicks", FunctionEntry UnsafeOnly Nothing)
                , ("SDL_GetVersion", FunctionEntry SafeOnly Nothing)
                ]
          }
  sort (failures (validateAliasConfig census config))
    @?= sort
      [ AliasConfigConflict
          { cName = "SDL_GetTicks"
          , reason = "safe-only/unsafe-only withholds a flavor and requires a rationale"
          }
      , AliasConfigConflict
          { cName = "SDL_GetVersion"
          , reason = "safe-only/unsafe-only withholds a flavor and requires a rationale"
          }
      ]

unit_skipRemovesFromSurface :: IO ()
unit_skipRemovesFromSurface = do
  let census = Map.fromList [("SDL_EnumerateDirectory", True), ("SDL_CreateWindow", False)]
      config = emptyConfig{skip = ["SDL_EnumerateDirectory"]}
  validated <-
    either (assertFailure . toString . display) pure
      $ validateAliasConfig census config
  -- Skipping a callback function needs no classification and removes it.
  validated.safeties @?= Map.fromList [("SDL_CreateWindow", Both)]
  validated.skipped @?= Set.fromList ["SDL_EnumerateDirectory"]

failures :: Either (Errors e) a -> [e]
failures = \case
  Left es -> toList es
  Right _ -> []

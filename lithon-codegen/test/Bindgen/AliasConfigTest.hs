{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Bindgen.AliasConfigTest where

import Data.ByteString.Lazy qualified as LBS
import Data.FileEmbed (embedFileRelative)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Bindgen.Alias.Config (
  AliasConfig (..),
  AllowEntry (..),
  FunctionEntry (..),
  NamingRule (..),
  ValidatedAliasConfig (..),
  decodeAliasConfig,
  encodeAliasConfig,
  validateAliasConfig,
 )
import Lithon.Codegen.Bindgen.Alias.Names (AliasError (..), Safety (..))

unit_committedRegistryDecodes :: IO ()
unit_committedRegistryDecodes = do
  let bytes = LBS.fromStrict $(embedFileRelative "data/sdl3/aliases.json")
  config <- either (assertFailure . toString) pure (decodeAliasConfig bytes)
  config.naming @?= CamelSegments
  -- Only C shims are renamed (SCREAMING macros, IOprintf). SDL_Log is
  -- not: the math SDL_log is raw-only, so its shim mints log.
  Map.lookup "lithon_SDL_Log" config.renames @?= Nothing
  assertBool
    "only C shims are renamed"
    (all ("lithon_SDL_" `T.isPrefixOf`) (Map.keys config.renames))
  config.skip @?= mempty
  -- SDL_stdinc.h aliases SDL's own API and the allocator family only.
  -- (CensusTest checks its bound against the committed census.)
  Map.keys config.allow @?= ["SDL_stdinc.h"]
  let stdincAllowed = maybe [] (.names) (Map.lookup "SDL_stdinc.h" config.allow)
  length stdincAllowed @?= 22
  for_ ["SDL_malloc", "SDL_free", "SDL_GetEnvironmentVariable", "SDL_StepUTF8"] \cName ->
    assertBool (toString cName <> " is allowed") (cName `elem` stdincAllowed)
  for_ ["SDL_log", "SDL_strlen", "SDL_memcpy", "SDL_qsort"] \cName -> do
    assertBool (toString cName <> " is not allowed") (cName `notElem` stdincAllowed)
    -- …and so carries no classification (it would be dead configuration).
    Map.member cName config.functions @?= False
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
    , allow = mempty
    }

-- | A one-header census.
oneHeader :: [(Text, Bool)] -> Map FilePath (Map Text Bool)
oneHeader = Map.singleton "SDL_test.h" . Map.fromList

unit_validationTotalizesSafeties :: IO ()
unit_validationTotalizesSafeties = do
  let census = oneHeader [("SDL_CreateWindow", False), ("SDL_EnumerateDirectory", True)]
      config =
        emptyConfig
          { functions =
              Map.fromList
                [ ("SDL_EnumerateDirectory", FunctionEntry SafeOnly (Just "sync"))
                ]
          }
  validated <-
    either (assertFailure . toString . display) pure
      $ validateAliasConfig "SDL_" census config
  -- Total over the census: the unlisted non-callback function defaults to
  -- both flavors.
  validated.safeties
    @?= Map.fromList
      [ ("SDL_CreateWindow", Both)
      , ("SDL_EnumerateDirectory", SafeOnly)
      ]

unit_unclassifiedCallbackErrors :: IO ()
unit_unclassifiedCallbackErrors = do
  let census = oneHeader [("SDL_EnumerateDirectory", True)]
  failures (validateAliasConfig "SDL_" census emptyConfig)
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
  failures (validateAliasConfig "SDL_" census config)
    @?= [AliasUnclassifiedCallback{cName = "SDL_EnumerateDirectory"}]

unit_unknownNamesAccumulate :: IO ()
unit_unknownNamesAccumulate = do
  let census = oneHeader [("SDL_CreateWindow", False)]
      config =
        emptyConfig
          { functions = Map.fromList [("SDL_Nope", FunctionEntry Both Nothing)]
          , renames = Map.fromList [("SDL_AlsoNope", "alias")]
          , skip = ["SDL_StillNope"]
          }
  sort (failures (validateAliasConfig "SDL_" census config))
    @?= sort
      [ AliasUnknownFunction{context = "functions", cName = "SDL_Nope"}
      , AliasUnknownFunction{context = "renames", cName = "SDL_AlsoNope"}
      , AliasUnknownFunction{context = "skip", cName = "SDL_StillNope"}
      ]

unit_deadAndContradictoryConfigErrors :: IO ()
unit_deadAndContradictoryConfigErrors = do
  let census = oneHeader [("SDL_CreateWindow", False), ("SDL_WaitEvent", False)]
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
  sort (failures (validateAliasConfig "SDL_" census config))
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
      $ validateAliasConfig "SDL_" census okConfig
  validated.safeties
    @?= Map.fromList [("SDL_CreateWindow", UnsafeOnly), ("SDL_WaitEvent", Both)]

unit_missingRationaleErrors :: IO ()
unit_missingRationaleErrors = do
  -- Withholding a flavor without recording why is dead curation either way.
  let census = oneHeader [("SDL_GetTicks", False), ("SDL_GetVersion", False)]
      config =
        emptyConfig
          { functions =
              Map.fromList
                [ ("SDL_GetTicks", FunctionEntry UnsafeOnly Nothing)
                , ("SDL_GetVersion", FunctionEntry SafeOnly Nothing)
                ]
          }
  sort (failures (validateAliasConfig "SDL_" census config))
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
  let census = oneHeader [("SDL_EnumerateDirectory", True), ("SDL_CreateWindow", False)]
      config = emptyConfig{skip = ["SDL_EnumerateDirectory"]}
  validated <-
    either (assertFailure . toString . display) pure
      $ validateAliasConfig "SDL_" census config
  -- Skipping a callback function needs no classification and removes it.
  validated.safeties @?= Map.fromList [("SDL_CreateWindow", Both)]
  validated.skipped @?= Set.fromList ["SDL_EnumerateDirectory"]

-- | The @allow@ field decodes as header -> names and round-trips.
unit_allowDecodes :: IO ()
unit_allowDecodes = do
  config <-
    either (assertFailure . toString) pure
      $ decodeAliasConfig
        "{\"naming\": \"camel-segments\", \"allow\": {\"SDL_stdinc.h\": {\"bound\": 153, \"names\": [\"SDL_malloc\", \"SDL_free\"]}}}"
  config.allow
    @?= Map.fromList [("SDL_stdinc.h", AllowEntry{bound = 153, names = ["SDL_malloc", "SDL_free"]})]
  decodeAliasConfig (encodeAliasConfig config) @?= Right config
  -- Absent, it is empty: every header aliases every function.
  fmap (.allow) (decodeAliasConfig "{\"naming\": \"camel-segments\"}") @?= Right mempty

-- | Two headers, one allowlisted: it aliases its allowed functions alone
-- (a callback function it leaves out needs no classification); the other
-- aliases everything.
stdincCensus :: Map FilePath (Map Text Bool)
stdincCensus =
  Map.fromList
    [
      ( "SDL_stdinc.h"
      , Map.fromList
          [ ("SDL_malloc", False)
          , ("SDL_free", False)
          , ("SDL_strlen", False)
          , ("SDL_qsort", True)
          , ("SDL_SetMemoryFunctions", True)
          ]
      )
    , ("SDL_video.h", Map.fromList [("SDL_CreateWindow", False)])
    ]

-- | The 'stdincCensus' allowlist of the given names, curated against its
-- current count.
stdincAllow :: [Text] -> Map Text AllowEntry
stdincAllow names = Map.fromList [("SDL_stdinc.h", AllowEntry{bound = 5, names})]

unit_allowlistCurates :: IO ()
unit_allowlistCurates = do
  let config =
        emptyConfig
          { allow = stdincAllow ["SDL_malloc", "SDL_free", "SDL_SetMemoryFunctions"]
          , functions =
              Map.fromList
                [("SDL_SetMemoryFunctions", FunctionEntry Both (Just "registration"))]
          }
  validated <-
    either (assertFailure . toString . display) pure
      $ validateAliasConfig "SDL_" stdincCensus config
  validated.safeties
    @?= Map.fromList
      [ ("SDL_malloc", Both)
      , ("SDL_free", Both)
      , ("SDL_SetMemoryFunctions", Both)
      , ("SDL_CreateWindow", Both)
      ]
  validated.allowlisted @?= Set.fromList ["SDL_stdinc.h"]
  -- An allowed callback function still needs its classification.
  failures (validateAliasConfig "SDL_" stdincCensus config{functions = mempty})
    @?= [AliasUnclassifiedCallback{cName = "SDL_SetMemoryFunctions"}]

-- | Every allowlist contradiction, accumulated: an unknown header, an
-- unknown name, a name its header does not declare, a name allowed twice,
-- a name allowed and skipped, and entries for a function the allowlist
-- leaves out (classified, renamed, skipped: dead configuration).
unit_allowlistConflictsAccumulate :: IO ()
unit_allowlistConflictsAccumulate = do
  let config =
        emptyConfig
          { allow =
              stdincAllow ["SDL_malloc", "SDL_malloc", "SDL_free", "SDL_Nope", "SDL_CreateWindow"]
                <> Map.fromList [("SDL_nope.h", AllowEntry{bound = 0, names = []})]
          , functions = Map.fromList [("SDL_strlen", FunctionEntry UnsafeOnly (Just "pure"))]
          , renames = Map.fromList [("SDL_qsort", "sortC")]
          , skip = ["SDL_free", "SDL_SetMemoryFunctions"]
          }
  sort (failures (validateAliasConfig "SDL_" stdincCensus config))
    @?= sort
      [ AliasUnknownHeader{header = "SDL_nope.h"}
      , AliasUnknownFunction{context = "allow", cName = "SDL_Nope"}
      , AliasConfigConflict
          { cName = "SDL_CreateWindow"
          , reason = "allowed under SDL_stdinc.h, but declared in SDL_video.h"
          }
      , AliasConfigConflict{cName = "SDL_malloc", reason = "allowed twice under SDL_stdinc.h"}
      , AliasConfigConflict{cName = "SDL_free", reason = "allowed but also skipped"}
      , AliasConfigConflict
          { cName = "SDL_strlen"
          , reason =
              "classified in functions, but the SDL_stdinc.h allowlist leaves it out, so it is not aliased; remove the entry"
          }
      , AliasConfigConflict
          { cName = "SDL_qsort"
          , reason =
              "renamed, but the SDL_stdinc.h allowlist leaves it out, so it is not aliased; remove the entry"
          }
      , AliasConfigConflict
          { cName = "SDL_SetMemoryFunctions"
          , reason =
              "skipped, but the SDL_stdinc.h allowlist leaves it out, so it is not aliased; remove the entry"
          }
      ]

-- | An allowlist curated against another count of its header's functions
-- is stale: the error names the unlisted functions in SDL's own API style
-- (uppercase after the prefix: the ones to review) and counts the
-- libc-style rest.
unit_staleAllowlistErrors :: IO ()
unit_staleAllowlistErrors = do
  let config names bound =
        emptyConfig
          { allow = Map.fromList [("SDL_stdinc.h", AllowEntry{bound, names})]
          , functions =
              Map.fromList
                [ ("SDL_SetMemoryFunctions", FunctionEntry Both (Just "registration"))
                | "SDL_SetMemoryFunctions" `elem` names
                ]
          }
      check names bound expected text = do
        let errs = failures (validateAliasConfig "SDL_" stdincCensus (config names bound))
        errs @?= [expected]
        map display errs @?= [text :: Text]
  -- SDL_SetMemoryFunctions is new and unlisted: named in the hint.
  check
    ["SDL_malloc", "SDL_free"]
    4
    AliasAllowlistStale
      { header = "SDL_stdinc.h"
      , recorded = 4
      , actual = 5
      , functionPrefix = "SDL_"
      , apiStyle = ["SDL_SetMemoryFunctions"]
      , libcStyle = 2
      }
    "SDL_stdinc.h binds 5 functions, but its allowlist was curated against 4; review the \
    \list, then set \"bound\" to 5. SDL-proper names not allowlisted: SDL_SetMemoryFunctions; \
    \libc-style names not allowlisted: 2"
  -- Only libc-style names are unlisted: the hint says none, and a count
  -- that fell is stale too.
  check
    ["SDL_malloc", "SDL_free", "SDL_SetMemoryFunctions"]
    7
    AliasAllowlistStale
      { header = "SDL_stdinc.h"
      , recorded = 7
      , actual = 5
      , functionPrefix = "SDL_"
      , apiStyle = []
      , libcStyle = 2
      }
    "SDL_stdinc.h binds 5 functions, but its allowlist was curated against 7; review the \
    \list, then set \"bound\" to 5. SDL-proper names not allowlisted: none; \
    \libc-style names not allowlisted: 2"

failures :: Either (Errors e) a -> [e]
failures = \case
  Left es -> toList es
  Right _ -> []

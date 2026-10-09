{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

-- | Every registered bindgen-sys target is a well-formed record whose
-- data directory decodes under its own version arity and holds prescriptive
-- specs only for headers it generates specs for, and no two targets claim
-- the same key, package, or namespace; each malformation
-- 'validateTarget' guards against is rejected with a message naming it;
-- and the include-graph scope is exactly "the parent directory is the
-- include root".
module Bindgen.TargetsTest (
  unit_targetsValidate,
  unit_toy2Validates,
  unit_registeredTargetsDataDecodes,
  unit_overridesNamePlannedHeaders,
  unit_malformedTargetsRejected,
  unit_clashingTargetsRejected,
  unit_projectHeaderUnderScopesByParent,
) where

import Data.ByteString.Lazy qualified as LBS
import Data.FileEmbed (makeRelativeToProject)
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Effectful (runEff)
import Effectful.Error.Dynamic (runErrorNoCallStack)
import Language.Haskell.TH (stringE)
import Lithon.Effect.ClangEnv (PkgDbEntry (..))
import Lithon.Effect.FileSystem (listDirectory, runFileSystem)
import Lithon.Effect.Log (runLog)
import Lithon.Prelude
import System.FilePath ((</>))
import Test.Tasty.HUnit (Assertion, assertBool, assertFailure, (@?=))

import Bindgen.Support.Targets (toy2)
import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen.Alias.Config (decodeAliasConfig)
import Lithon.Codegen.Bindgen.Alias.Constants (decodeConstantsConfig)
import Lithon.Codegen.Bindgen.Env (
  BindgenEnv (..),
  BindgenPaths (..),
  BindgenResolutionError,
  PackageStatics (..),
  discoverOverrides,
  loadStatics,
 )
import Lithon.Codegen.Bindgen.Target (
  BindgenTarget (..),
  GateStubs (..),
  HeaderSpec (..),
  Prose (..),
  VersionScheme (..),
  projectHeaderUnder,
  validateTarget,
  validateTargets,
 )
import Lithon.Codegen.Bindgen.Target.Sdl3 (sdl3)
import Lithon.Codegen.Bindgen.Targets (bindgenTargets)
import Lithon.Codegen.Bindgen.Unbound (decodeUnboundConfig)
import Lithon.Codegen.Bindgen.Version (mkVersion)
import Lithon.Codegen.Bindgen.Versions (decodeVersionsRegistry)

unit_targetsValidate :: Assertion
unit_targetsValidate = validateTargets bindgenTargets @?= Right ()

-- | The test-only mpv-shaped target is a well-formed record too, and
-- coexists with every registered one.
unit_toy2Validates :: Assertion
unit_toy2Validates = do
  validateTarget toy2 @?= Right ()
  validateTargets (toy2 : bindgenTargets) @?= Right ()

-- | The lithon-codegen package directory (the data directories live
-- under @data\/\<key\>\/@).
projectDir :: FilePath
projectDir = $(stringE =<< makeRelativeToProject ".")

-- | What generation reads from each registered target's data directory
-- decodes: the versions registry at the target's own arity, the alias,
-- constants, and skip-ledger registries, and the package statics.
unit_registeredTargetsDataDecodes :: Assertion
unit_registeredTargetsDataDecodes = for_ bindgenTargets \target -> do
  let dataDir = projectDir </> "data" </> toString target.key
      decodes :: String -> Either Text a -> IO ()
      decodes what =
        either (\e -> assertFailure (toString target.key <> " " <> what <> ": " <> toString e)) (const pass)
  decodes "versions.json"
    . decodeVersionsRegistry target.versioning.arity
    =<< LBS.readFile (dataDir </> "versions.json")
  decodes "aliases.json" . decodeAliasConfig =<< LBS.readFile (dataDir </> "aliases.json")
  decodes "constants.json" . decodeConstantsConfig =<< LBS.readFile (dataDir </> "constants.json")
  decodes "unbound.json" . decodeUnboundConfig =<< LBS.readFile (dataDir </> "unbound.json")
  statics <-
    runEff
      . runLog "targets-test"
      . runFileSystem
      . runErrorNoCallStack @BindgenResolutionError
      $ loadStatics target (envFor dataDir)
  case statics of
    Left err -> assertFailure (toString target.key <> " statics: " <> toString (display err))
    Right loaded ->
      assertBool
        (toString target.key <> ": the package ships a license of its library")
        (not (null loaded.licenses))
 where
  envFor dataDir =
    BindgenEnv
      { includeDir = "/nonexistent"
      , libraryVersion = "0"
      , pkgDbEntry = PkgDbEntry{name = "none", description = Nothing, version = Nothing, vars = mempty}
      , paths =
          BindgenPaths
            { dataDir
            , versions = dataDir </> "versions.json"
            , aliases = dataDir </> "aliases.json"
            , constants = dataDir </> "constants.json"
            , unbound = dataDir </> "unbound.json"
            , static = dataDir </> "static"
            , overrides = mempty
            }
      }

-- | Every committed prescriptive spec pairs with a spec artifact of the
-- same name in @spec\/@, which is how the driver pairs it with its header:
-- a rename, a typo, or the spec of an excluded header is caught here,
-- before a full generation run reports it as an 'OrphanOverrides'.
unit_overridesNamePlannedHeaders :: Assertion
unit_overridesNamePlannedHeaders = for_ bindgenTargets \target -> do
  let dataDir = projectDir </> "data" </> toString target.key
  found <-
    runEff
      . runLog "targets-test"
      . runFileSystem
      . runErrorNoCallStack @BindgenResolutionError
      $ discoverOverrides dataDir
  overrides <-
    either
      (\e -> assertFailure (toString target.key <> " overrides: " <> toString (display e)))
      pure
      found
  specs <- runEff . runFileSystem $ listDirectory (dataDir </> "spec")
  let orphans = filter (`notElem` specs) (Map.keys overrides)
  assertBool
    (toString target.key <> ": overrides without a spec artifact: " <> show orphans)
    (null orphans)

-- | One malformation per case, each rejected with a message naming it.
unit_malformedTargetsRejected :: Assertion
unit_malformedTargetsRejected =
  for_ cases \(label, target, needle) -> case validateTarget target of
    Right () -> assertFailure (label <> ": accepted")
    Left problems ->
      assertBool
        (label <> ": no problem mentions " <> show needle <> " in " <> show problems)
        (any (needle `T.isInfixOf`) problems)
 where
  cases :: [(String, BindgenTarget, Text)]
  cases =
    [ ("uppercase key", sdl3{key = "SDL3"}, "key must match")
    , ("empty key", sdl3{key = ""}, "key must match")
    , ("underscored key", sdl3{key = "sdl_3"}, "key must match")
    , ("the Vulkan generator's key", sdl3{key = "vulkan"}, "the key vulkan")
    , ("underscored package", sdl3{packageName = "sdl3_bindgen_sys"}, "not a valid cabal package name")
    , ("empty package word", sdl3{packageName = "sdl3--sys"}, "not a valid cabal package name")
    , ("all-digit package word", sdl3{packageName = "sdl3-3"}, "not a valid cabal package name")
    , ("empty prefix", sdl3{functionPrefix = ""}, "the function prefix is empty")
    ,
      ( "multi-component include root"
      , sdl3{headers = sdl3.headers{includeRoot = "include/SDL3"}}
      , "one directory component"
      )
    , ("dot include root", sdl3{headers = sdl3.headers{includeRoot = "."}}, "one directory component")
    , ("no main includes", sdl3{headers = sdl3.headers{mainIncludes = []}}, "no main includes")
    ,
      ( "non-basename main include"
      , sdl3{headers = sdl3.headers{mainIncludes = ["SDL3/SDL.h"]}}
      , "main includes are basenames"
      )
    ,
      ( "non-basename guard include"
      , sdl3{versioning = sdl3.versioning{guardIncludes = ["SDL3/SDL_version.h"]}}
      , "guard includes are basenames"
      )
    ,
      ( "non-basename stub include"
      , sdl3{gateStubs = sdl3.gateStubs{includes = ["../SDL_error.h"]}}
      , "gate stub includes are basenames"
      )
    ,
      ( "namespace ending in Bindgen"
      , sdl3{namespace = $$(Module.metaLit ["SDL3", "Sys", "Bindgen"])}
      , "may not end in Bindgen"
      )
    ,
      ( "namespace ending in Runtime"
      , sdl3{namespace = $$(Module.metaLit ["SDL3", "Runtime"])}
      , "may not end in Runtime"
      )
    ,
      ( "non-conid one-liner key"
      , sdl3{prose = sdl3.prose{familyOneLiners = Map.fromList [("events", "Events.")]}}
      , "family one-liner key is not a module segment"
      )
    ,
      ( "wrong-arity baseline"
      , sdl3{versioning = sdl3.versioning{baseline = mkVersion (3 :| [2])}}
      , "has 2 parts; the scheme's arity is 3"
      )
    , ("zero arity", sdl3{versioning = sdl3.versioning{arity = 0}}, "arity must be positive")
    ]

-- | Two targets may not share a key, a package, or a curated namespace
-- (each would overwrite the other's data, package, or modules).
unit_clashingTargetsRejected :: Assertion
unit_clashingTargetsRejected = do
  clash "key" toy2{key = sdl3.key}
  clash "package" toy2{packageName = sdl3.packageName}
  clash "namespace" toy2{namespace = sdl3.namespace}
 where
  clash what other = case validateTargets [sdl3, other] of
    Right () -> assertFailure ("a shared " <> toString what <> " was accepted")
    Left problems ->
      assertBool
        ("no clash on " <> toString what <> " in " <> show problems)
        (any (\p -> (what <> " ") `T.isPrefixOf` p && "more than one target" `T.isInfixOf` p) problems)

unit_projectHeaderUnderScopesByParent :: Assertion
unit_projectHeaderUnderScopesByParent = do
  projectHeaderUnder "SDL3" "/nix/store/0z3-sdl3-3.4.16-dev/include/SDL3/SDL_video.h"
    @?= Just "SDL_video.h"
  projectHeaderUnder "SDL3" "/nix/store/f1x-glibc-2.40-dev/include/string.h" @?= Nothing
  projectHeaderUnder "SDL3" "/usr/include/SDL3/nested/SDL_x.h" @?= Nothing
  -- Only the parent counts: an earlier SDL3 component is no match, a
  -- later one is.
  projectHeaderUnder "SDL3" "/x/SDL3/include/SDL3/a.h" @?= Just "a.h"
  projectHeaderUnder "SDL3" "/x/SDL3/include/a.h" @?= Nothing
  projectHeaderUnder "mpv" "/usr/include/mpv/client.h" @?= Just "client.h"
  projectHeaderUnder "mpv" "/usr/include/libmpv/client.h" @?= Nothing

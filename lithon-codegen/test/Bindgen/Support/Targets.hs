{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

-- | A second target for the generic pipeline's tests, shaped like libmpv
-- rather than SDL: two-part versions compared through a version macro
-- (@TOY_API_VERSION >= TOY_MAKE_VERSION(2, 1)@), no failure statement in
-- gated stubs, no stub includes, no documented availability (the
-- availability annotations are the only source), no width typedefs, no
-- shims, and no doc rewrites. Nothing here is registered: it exists to
-- prove the SDL configuration is data, not a hidden assumption.
--
-- 'toy2Shims' is the same target with an authored C header, shaped like
-- SDL's shim headers.
module Bindgen.Support.Targets (
  toy2,
  toy2Shims,
) where

import Lithon.Prelude

import Lithon.Codegen.Backend.Hs.Module qualified as Module
-- The authored-header records share field names with the target's own
-- (@includeRoot@, @headers@); qualified, so updates of the target's stay
-- unambiguous.
import Lithon.Codegen.Bindgen.Target hiding (AuthoredHeader (..), AuthoredHeaders (..))
import Lithon.Codegen.Bindgen.Target qualified as Target
import Lithon.Codegen.Bindgen.Version (mkVersion, versionArgs)

toy2 :: BindgenTarget
toy2 =
  BindgenTarget
    { key = "toy2"
    , packageName = "toy2-bindgen-sys"
    , displayName = "libtoy"
    , versionLabel = "libtoy API"
    , namespace = $$(Module.metaLit ["Toy2", "Sys"])
    , functionPrefix = "toy_"
    , pkgConfig = "toy2"
    , headers =
        HeaderSpec
          { includeRoot = "toy2"
          , mainIncludes = ["toy_gate.h", "toy_abi.h"]
          , excluded = []
          , mangle = def{Module.segmentJoin = Module.JoinConcat}
          }
    , parse = ParseEnv{defines = [], doxygenAliases = []}
    , versioning =
        VersionScheme
          { arity = 2
          , baseline = mkVersion (2 :| [0])
          , atLeast = \v -> "TOY_API_VERSION >= TOY_MAKE_VERSION(" <> versionArgs v <> ")"
          , below = \v -> "TOY_API_VERSION < TOY_MAKE_VERSION(" <> versionArgs v <> ")"
          , guardIncludes = ["toy_version.h"]
          , declSince = const Nothing
          , fieldSince = const Nothing
          }
    , gateStubs = GateStubs{includes = [], failure = Nothing}
    , shims = mempty
    , widthTypedefs = Nothing
    , docs = DocHooks{fixText = id, fixLink = id}
    , prose =
        Prose
          { familyOneLiners = [("ToyGate", "Version-gated toy functions.")]
          , familyExtras = []
          , umbrellaDoc = \familyIndex ->
              "-- | Curated low-level libtoy surface.\n--\n-- == Families\n--\n" <> familyIndex <> "\n--"
          , runtimeDoc = "-- | Bridge vocabulary for the curated layer."
          , abiBanner =
              [ "Every size, alignment, field offset, and enum value baked into the"
              , "generated Haskell is re-asserted here against the libtoy headers."
              , ""
              , "#if guards come from the availability annotations alone."
              ]
          }
    , authored = Nothing
    }

-- | 'toy2' binding @toy2\/toy_thing.h@ alone, plus the authored
-- @toy2-shims\/toy_thing_shims.h@ extending it: functions named
-- @lithon_@ and the name they wrap.
toy2Shims :: BindgenTarget
toy2Shims =
  toy2
    { headers = toy2.headers{mainIncludes = ["toy_thing.h"]}
    , authored =
        Just
          Target.AuthoredHeaders
            { Target.includeRoot = "toy2-shims"
            , Target.namePrefix = "lithon_"
            , Target.headers =
                [Target.AuthoredHeader{Target.file = "toy_thing_shims.h", Target.extends = Just "toy_thing.h"}]
            }
    }

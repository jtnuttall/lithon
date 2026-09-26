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
module Bindgen.Support.Targets (
  toy2,
) where

import Lithon.Prelude

import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen.Target
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
    }

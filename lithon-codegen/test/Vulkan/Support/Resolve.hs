{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Vulkan.Support.Resolve where

import Data.ByteString.Lazy qualified as LBS
import Data.FileEmbed (embedFileRelative)
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Curate (Curated, curate)
import Lithon.Codegen.Vulkan.Curate.Profile (Profile, decodeProfile)
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry (Registry, Specialize (..), Specialized)
import Lithon.Codegen.Vulkan.Registry.Types.Common (Api (..))
import Lithon.Codegen.Vulkan.Resolve (resolveRegistry)
import Lithon.Codegen.Vulkan.Resolve.Aliases (Aliases, resolveAliases)
import Lithon.Codegen.Vulkan.Resolve.CrossRef (TypeGraph, resolveCrossRefs)
import Lithon.Codegen.Vulkan.Resolve.Enums (MaterializedEnums, materializeEnums)
import Lithon.Codegen.Vulkan.Resolve.Flow (EnumFlow, Flows (..), classifyFlow)
import Lithon.Codegen.Vulkan.Resolve.Require (Requirements, collectRequirements)
import Lithon.Codegen.Vulkan.Resolve.Symbols (Symbols, buildSymbols)
import Lithon.Codegen.Vulkan.Resolve.TierMerge (TieredFeature, mergeInternalTiers)
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry)
import Vulkan.Support.Registry (pinnedRegistry)

pinnedSpecialized :: Specialized Registry
pinnedSpecialized = orDieV "specialization" (specialize ApiVulkan pinnedRegistry)

pinnedTiered :: Vector TieredFeature
pinnedTiered = orDieV "tier merge" (mergeInternalTiers pinnedSpecialized)

pinnedSymbols :: Symbols
pinnedSymbols = orDieV "symbol tables" (buildSymbols (pinnedSpecialized, pinnedTiered))

pinnedAliases :: Aliases
pinnedAliases = orDieV "alias resolution" (resolveAliases pinnedSymbols)

pinnedRequirements :: Requirements
pinnedRequirements =
  orDieV
    "requirement collection"
    (collectRequirements (pinnedSpecialized, pinnedSymbols, pinnedAliases, pinnedTiered))

pinnedMaterialized :: MaterializedEnums
pinnedMaterialized =
  orDieV
    "enum materialization"
    (materializeEnums (pinnedSymbols, pinnedAliases, pinnedRequirements))

pinnedTypeGraph :: TypeGraph
pinnedTypeGraph =
  orDieV
    "cross-reference resolution"
    ( resolveCrossRefs
        (pinnedSymbols, pinnedAliases, pinnedRequirements, pinnedMaterialized, pinnedSpecialized)
    )

pinnedFlows :: Map TypeName EnumFlow
pinnedFlows = flows
 where
  Flows flows = classifyFlow (pinnedTypeGraph, pinnedMaterialized)

pinnedResolved :: ResolvedRegistry
pinnedResolved = orDie "resolve" (resolveRegistry ApiVulkan pinnedRegistry)

lithonProfile :: Profile
lithonProfile =
  case decodeProfile (LBS.fromStrict $(embedFileRelative "data/vulkan/profiles/lithon-core.json")) of
    Left e -> error $ "Failed to decode lithon core profile: " <> show e
    Right p -> p

pinnedCurated :: Curated
pinnedCurated = orDie "curation" (curate lithonProfile pinnedResolved)

orDie :: (Show e) => String -> Either e a -> a
orDie what = either (\e -> error (toText (what <> " failed: ") <> show e)) id

orDieV :: (Show e) => String -> Validation e a -> a
orDieV what = orDie what . validationToEither

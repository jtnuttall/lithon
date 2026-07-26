-- | Shared phase-2 pass results over the pinned registry, computed once as
-- CAFs. Tests that exercise a pass directly should run it themselves (for
-- proper failure reporting); tests of DOWNSTREAM passes use these. Passes
-- take their inputs through @HasType@ constraints, so a bare value or a
-- tuple of the pinned artifacts serves as the context.
module Vulkan.Support.Resolve (
  pinnedSpecialized,
  pinnedTiered,
  pinnedSymbols,
  pinnedAliases,
  pinnedRequirements,
  pinnedMaterialized,
  pinnedTypeGraph,
  pinnedFlows,
  pinnedResolved,
  lithonProfile,
  pinnedCurated,
) where

import Data.ByteString.Lazy qualified as LBS
import System.Directory (doesFileExist)
import System.IO.Unsafe (unsafePerformIO)

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Curate (Curated, curate)
import Lithon.Codegen.Vulkan.Curate.Profile (Profile, decodeProfile)
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

-- | The checked-in lithon-core profile.
lithonProfile :: Profile
lithonProfile = unsafePerformIO do
  path <- probe ["profiles/lithon-core.json", "lithon-codegen/profiles/lithon-core.json"]
  bytes <- LBS.readFile path
  either (fail . ("lithon-core profile: " <>) . show) pure (decodeProfile bytes)
 where
  probe [] = fail "profiles/lithon-core.json not found"
  probe (p : rest) = do
    exists <- doesFileExist p
    if exists then pure p else probe rest
{-# NOINLINE lithonProfile #-}

pinnedCurated :: Curated
pinnedCurated = orDie "curation" (curate lithonProfile pinnedResolved)

orDie :: (Show e) => String -> Either e a -> a
orDie what = either (\e -> error (toText (what <> " failed: ") <> show e)) id

orDieV :: (Show e) => String -> Validation e a -> a
orDieV what = orDie what . validationToEither

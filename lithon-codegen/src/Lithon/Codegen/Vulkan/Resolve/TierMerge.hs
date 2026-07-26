{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Merge internal version tiers into their public features.
--
-- The 2025 modular registry splits each core version's interface across
-- internal features (@apitype="internal"@: @VK_BASE_VERSION_1_x@,
-- @VK_COMPUTE_VERSION_1_x@, @VK_GRAPHICS_VERSION_1_x@) that form a strict
-- dependency lattice, while the public @VK_VERSION_1_x@ features carry only
-- mandatory device-feature requirements. This pass replays the canonical
-- merge (@scripts/reg.py mergeInternalFeatures@): every internal feature's
-- change blocks are appended to the FIRST public feature (document order)
-- that transitively depends on it, and no internal feature survives.
--
-- Two semantics notes, both load-bearing:
--
-- * Feature-level @depends=@ atoms are prerequisite EDGES, not a boolean
--   formula — @,@ and @+@ are both flattened ('boolExprAtoms'), matching
--   reg.py's @get_dependencies@. Evaluating the OR in
--   @VK_VERSION_1_4 depends="VK_VERSION_1_3,VK_GRAPHICS_VERSION_1_4"@
--   boolean-style would lose a branch of the lattice.
-- * Within one internal feature, reg.py appends all @\<require\>@ blocks,
--   then all @\<deprecate\>@, then all @\<remove\>@ — reproduced here so the
--   merged block order matches the canonical tooling.
--
-- Unlike reg.py (which silently leaves unmerged internals in the tree), an
-- internal feature with no public dependent is an error: it would otherwise
-- vanish from the resolved API surface without a trace.
module Lithon.Codegen.Vulkan.Resolve.TierMerge (
  TierBlock (..),
  TieredFeature (..),
  TierError (..),
  mergeInternalTiers,
) where

import Data.Aeson (ToJSON)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Vector qualified as V

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (DependsAtom (..), boolExprAtoms)
import Lithon.Codegen.Vulkan.Registry.Types.Common (Raw (..))
import Lithon.Codegen.Vulkan.Registry.Types.Features (
  ChangeBlock (..),
  Feature (..),
  FeatureVisibility (..),
 )

-- | One change block of a merged feature: 'Nothing' for the public
-- feature's own blocks, @'Just' tierName@ for merged ones (provenance).
data TierBlock = TierBlock
  { tier :: Maybe FeatureName
  , block :: ChangeBlock
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | A public feature with the full, tier-tagged block list. @feature@ is
-- kept verbatim for its metadata; consumers read @blocks@, not
-- @feature.changes@ (which holds only the public feature's own blocks).
data TieredFeature = TieredFeature
  { feature :: Feature
  , blocks :: Vector TierBlock
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data TierError
  = -- | An internal feature no public feature transitively depends on.
    TierOrphan {tier :: FeatureName}
  | -- | A feature-level @depends=@ names something that is not a feature.
    TierUnknownDep {feature :: FeatureName, dep :: FeatureName}
  | -- | A @Struct::member@ atom in a feature-level @depends=@ — those are
    -- runtime conditions and cannot be lattice edges.
    TierFeaturePathDep {feature :: FeatureName, path :: Text}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display TierError where
  displayBuilder =
    displayBuilder @Text . \case
      TierOrphan{tier} ->
        "internal feature " <> display tier <> " has no public dependent to merge into"
      TierUnknownDep{feature, dep} ->
        "feature " <> display feature <> " depends on unknown feature " <> display dep
      TierFeaturePathDep{feature, path} ->
        "feature " <> display feature <> " has a feature-path depends atom " <> path

-- | Fold every @apitype="internal"@ feature into its first public dependent.
-- Input is the post-specialization feature list (one API variant); output
-- contains exactly the public features, in document order.
mergeInternalTiers
  :: (HasType (Specialized Registry) cxt)
  => cxt -> Validation (Errors TierError) (Vector TieredFeature)
mergeInternalTiers cxt = failUnlessEmpty errors merged
 where
  features = cxt ^. typed @(Specialized Registry) . #features
  publics = filter (\f -> f.apiType == VisPublic) features
  internals = toList (filter (\f -> f.apiType == VisInternal) features)

  byName :: Map FeatureName Feature
  byName = Map.fromList [(f.name, f) | f <- V.toList features]

  errors = depErrors <> orphanErrors
  depErrors = concatMap checkDeps (V.toList features)
  checkDeps f = concatMap bad (dependsAtoms f)
   where
    bad = \case
      DependsName n
        | Map.member (WithNS n) byName -> []
        | otherwise -> [TierUnknownDep{feature = f.name, dep = WithNS n}]
      DependsFeature fp -> [TierFeaturePathDep{feature = f.name, path = display fp}]
  orphanErrors = [TierOrphan{tier = int.name} | int <- internals, isNothing (targetOf int.name)]

  dependsAtoms :: Feature -> [DependsAtom]
  dependsAtoms f = maybe [] (toList . boolExprAtoms . (.parsed)) f.depends

  depNames :: Feature -> [FeatureName]
  depNames f = [WithNS n | DependsName n <- dependsAtoms f]

  -- Transitive prerequisite closure per feature (a handful of nodes; plain
  -- DFS). Unknown names land in the set harmlessly — they are already
  -- reported as errors above.
  reachability :: Map FeatureName (Set FeatureName)
  reachability = Map.fromList [(f.name, dfs Set.empty (depNames f)) | f <- V.toList features]
   where
    dfs seen = \case
      [] -> seen
      n : rest
        | n `Set.member` seen -> dfs seen rest
        | otherwise ->
            dfs (Set.insert n seen) (maybe [] depNames (Map.lookup n byName) <> rest)

  -- reg.py: the FIRST public feature (document order) transitively
  -- depending on the internal one.
  targetOf :: FeatureName -> Maybe FeatureName
  targetOf internalName = (.name) <$> V.find reaches publics
   where
    reaches pub =
      internalName `Set.member` Map.findWithDefault Set.empty pub.name reachability

  merged = fmap mergeOne publics
  mergeOne pub = TieredFeature{feature = pub, blocks = V.concat (own : mergedHere)}
   where
    own = fmap (TierBlock Nothing) pub.changes
    mergedHere =
      [ fmap (TierBlock (Just int.name)) (kindOrdered int.changes)
      | int <- internals
      , targetOf int.name == Just pub.name
      ]

  -- reg.py appends all requires, then deprecates, then removes.
  kindOrdered :: Vector ChangeBlock -> Vector ChangeBlock
  kindOrdered changes = V.concat [ofKind isRequire, ofKind isDeprecate, ofKind isRemove]
   where
    ofKind p = filter p changes
    isRequire = \case ChRequire{} -> True; _ -> False
    isDeprecate = \case ChDeprecate{} -> True; _ -> False
    isRemove = \case ChRemove{} -> True; _ -> False

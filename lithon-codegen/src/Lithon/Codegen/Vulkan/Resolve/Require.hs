{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Requirement collection: walk every require\/deprecate\/remove block of
-- the merged features and the extensions, producing per-item provenance.
--
-- This is where interface membership becomes queryable: 'required' maps
-- every referenced type\/command\/enum-value to the origins requiring it
-- (block conditions classified into 'AvailExpr's), device-feature markers
-- become 'FeatureRequirement' rows per owner, @\<deprecate\>@ blocks fold
-- into 'DeprecationInfo', and @\<remove\>@ blocks are recorded (the only
-- vulkan-side remove waives a feature requirement —
-- @VK_KHR_portability_subset@\/@robustBufferAccess@).
--
-- Every referenced name is validated against the symbol tables; a name this
-- pass cannot place is an error, not a warning.
module Lithon.Codegen.Vulkan.Resolve.Require (
  Requirements (..),
  RequireError (..),
  collectRequirements,
  originsFor,
  deprecationAt,
) where

import Data.Aeson (ToJSON)
import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry (Registry, Specialized)
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (DependsExpr)
import Lithon.Codegen.Vulkan.Registry.Micro.Common (FeaturePath (..))
import Lithon.Codegen.Vulkan.Registry.Types.Common (Raw (..))
import Lithon.Codegen.Vulkan.Registry.Types.Enums (
  EnumDef (..),
  EnumValueSpec (..),
  enumsBlockOfType,
 )
import Lithon.Codegen.Vulkan.Registry.Types.Features (
  ChangeBlock (..),
  DeprecateBlock (..),
  DeprecateItem (..),
  Extension (..),
  Feature (..),
  InterfaceItem (..),
  RemoveBlock (..),
  RequireBlock (..),
 )
import Lithon.Codegen.Vulkan.Resolve.Aliases (Aliases)
import Lithon.Codegen.Vulkan.Resolve.Symbols (Symbols (..))
import Lithon.Codegen.Vulkan.Resolve.TierMerge (TierBlock (..), TieredFeature (..))
import Lithon.Codegen.Vulkan.Resolved.Avail (
  AvailAtom (..),
  AvailError,
  AvailExpr,
  CoreVersion (..),
  DeprecationInfo (..),
  FeatureRequirement (..),
  InterfaceItemNamespace (..),
  ItemKey (..),
  Origin (..),
  OriginSource (..),
  canonicalFeaturePath,
  classifyDepends,
 )
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

data Requirements = Requirements
  { required :: Map ItemKey (NonEmpty Origin)
  -- ^ Every required item, with all its require-sites in walk order
  -- (features in document order, then extensions).
  , deviceFeatures :: Map Text (Vector FeatureRequirement)
  -- ^ Mandatory device features per owner (feature or extension name).
  , deprecations :: Map ItemKey DeprecationInfo
  -- ^ From @\<deprecate\>@ blocks; multiple sites merge (all categories
  -- kept, first supersededBy\/since win).
  , deprecatedFeatures :: [(FeaturePath, DeprecationInfo)]
  -- ^ Device-feature rows of @\<deprecate\>@ blocks.
  , removedItems :: Map ItemKey (NonEmpty Text)
  -- ^ Interface items removed, mapped to their removers.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

-- | Every require-site of an item, in walk order; empty when no surviving
-- interface requires it.
originsFor :: (HasType Requirements cxt) => cxt -> InterfaceItemNamespace -> Text -> [Origin]
originsFor cxt ns n =
  maybe [] NE.toList (Map.lookup ItemKey{namespace = ns, name = n} requirements.required)
 where
  requirements = getTyped @Requirements cxt

-- | The merged @\<deprecate\>@-block info at a key, if any.
deprecationAt
  :: (HasType Requirements cxt) => cxt -> InterfaceItemNamespace -> Text -> Maybe DeprecationInfo
deprecationAt cxt ns n =
  Map.lookup ItemKey{namespace = ns, name = n} requirements.deprecations
 where
  requirements = getTyped @Requirements cxt

instance From Walk Requirements where
  from walk =
    Requirements
      { required = from @(DNonEmpty _) <$> pickOldestVia pure walk.items
      , deviceFeatures = applyFeatureRemovals $ pickOldestVia pure walk.featureRows
      , deprecations = pickOldestVia id walk.deprecated
      , deprecatedFeatures = walk.deprecatedFeats
      , removedItems = from @(DNonEmpty _) <$> pickOldestVia pure walk.removed
      }
   where
    pickOldestVia f vs = Map.fromListWith (flip (<>)) (map (second f) vs)

    -- A remove targeting a ReqFeature marker waives the matching requirement
    -- rows wherever they were declared.
    -- XXX: May be an edge case in here for any-of + not combination. Revisit.
    -- TODO: Clean up
    applyFeatureRemovals
      :: Map Text (Vector FeatureRequirement) -> Map Text (Vector FeatureRequirement)
    applyFeatureRemovals
      | null walk.removedFeats = id
      | otherwise = (fmap . fmap) waive
     where
      waive row =
        case [remover | (path, remover) <- walk.removedFeats, path `elem` row.paths] of
          remover : _ -> row{removedBy = Just remover}
          [] -> row

data RequireError
  = ReqUnknownName
      { namespace :: !InterfaceItemNamespace
      , name :: !Text
      , owner :: !Text
      , pos :: !Pos
      }
  | ReqUnknownExtends
      { value :: !Text
      , extends :: !Text
      , owner :: !Text
      , pos :: !Pos
      }
  | ReqUnknownFeaturePath
      { path :: !Text
      , owner :: !Text
      , pos :: !Pos
      }
  | ReqFeatureWithoutNumber {feature :: !Text}
  | ReqBadDepends
      { owner :: !Text
      , err :: !AvailError
      , pos :: !Pos
      }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display RequireError where
  displayBuilder =
    displayBuilder @Text . \case
      ReqUnknownName{namespace, name, owner} ->
        owner <> " requires unknown " <> display namespace <> ": " <> name
      ReqUnknownExtends{value, extends, owner} ->
        owner <> " extends unknown enums block " <> extends <> " with " <> value
      ReqUnknownFeaturePath{path, owner} ->
        owner <> " references unknown device feature: " <> path
      ReqFeatureWithoutNumber{feature} ->
        "feature has no version number: " <> feature
      ReqBadDepends{owner, err} ->
        owner <> ": " <> display err

-- | Everything one block walk can contribute; concatenated across all
-- blocks of all owners.
data Walk = Walk
  { errs :: [RequireError]
  , items :: [(ItemKey, Origin)]
  , featureRows :: [(Text, FeatureRequirement)]
  , deprecated :: [(ItemKey, DeprecationInfo)]
  , deprecatedFeats :: [(FeaturePath, DeprecationInfo)]
  , removed :: [(ItemKey, Text)]
  , removedFeats :: [(FeaturePath, Text)]
  }
  deriving stock (Generic, Show)

instance Semigroup Walk where
  a <> b =
    Walk
      { errs = a.errs <> b.errs
      , items = a.items <> b.items
      , featureRows = a.featureRows <> b.featureRows
      , deprecated = a.deprecated <> b.deprecated
      , deprecatedFeats = a.deprecatedFeats <> b.deprecatedFeats
      , removed = a.removed <> b.removed
      , removedFeats = a.removedFeats <> b.removedFeats
      }

instance Monoid Walk where
  mempty = Walk [] [] [] [] [] [] []

-- | Walk merged features (document order), then extensions, collecting and
-- validating every interface reference. Feature paths are canonicalized
-- (alias struct spellings resolved) before validation and storage.
collectRequirements
  :: ( HasType (Specialized Registry) cxt
     , HasType Symbols cxt
     , HasType Aliases cxt
     , HasType (Vector TieredFeature) cxt
     )
  => cxt
  -> Validation (Errors RequireError) Requirements
collectRequirements cxt = failUnlessEmpty walked.errs requirements
 where
  symbols = getTyped @Symbols cxt
  aliases = getTyped @Aliases cxt
  tiered = getTyped @(Vector TieredFeature) cxt
  extensions = cxt ^. typed @(Specialized Registry) . #extensions

  walked =
    mconcat (map walkFeature (V.toList tiered) <> map walkExtension (V.toList extensions))

  requirements = from walked

  walkFeature :: TieredFeature -> Walk
  walkFeature tf = case tf.feature.number of
    Nothing -> mempty & #errs .~ [ReqFeatureWithoutNumber{feature = forgetNamespace tf.feature.name}]
    Just n ->
      walkChanges
        (forgetNamespace tf.feature.name)
        FromFeature
          { feature = tf.feature.name
          , version = CoreVersion{major = fst n.parsed, minor = snd n.parsed}
          }
        [(tb.tier, tb.block) | tb <- V.toList tf.blocks]

  walkExtension :: Extension -> Walk
  walkExtension e =
    walkChanges
      (forgetNamespace e.name)
      FromExtension{extension = e.name, number = e.number}
      [(Nothing, ch) | ch <- V.toList e.changes]

  walkChanges :: Text -> OriginSource -> [(Maybe FeatureName, ChangeBlock)] -> Walk
  walkChanges owner source blocks =
    mconcat
      [ walkBlock owner source tier idx block
      | (idx, (tier, block)) <- zip [0 ..] blocks
      ]

  walkBlock :: Text -> OriginSource -> Maybe FeatureName -> Int -> ChangeBlock -> Walk
  walkBlock owner source tier blockIndex = \case
    ChRequire r ->
      let (condErrs, condition) = classifyCondition owner r.pos r.depends
          origin =
            Origin
              { source
              , tier
              , blockIndex
              , condition
              , profile = r.profile
              , blockComment = r.comment
              , pos = r.pos
              }
       in mconcat
            ( (mempty & #errs .~ condErrs)
                : map (walkRequireItem owner condition origin) (V.toList r.items)
            )
    ChDeprecate d -> walkDeprecateBlock owner source d
    ChRemove r -> mconcat (map (walkRemoveItem owner) (V.toList r.items))

  walkRequireItem :: Text -> Maybe AvailExpr -> Origin -> InterfaceItem -> Walk
  walkRequireItem owner condition origin = \case
    ReqType{name, pos}
      | Map.member (WithNS name) symbols.types -> mempty & #items .~ [(ItemKey NsType name, origin)]
      | otherwise -> mempty & #errs .~ [ReqUnknownName NsType name owner pos]
    ReqCommand{name, pos}
      | Map.member (WithNS name) symbols.commands ->
          mempty & #items .~ [(ItemKey NsCommand name, origin)]
      | otherwise -> mempty & #errs .~ [ReqUnknownName NsCommand name owner pos]
    ReqEnum d -> case d.spec of
      EvNone
        | Map.member d.name symbols.enumValues ->
            mempty & #items .~ [(ItemKey NsEnumValue (forgetNamespace d.name), origin)]
        | otherwise ->
            mempty & #errs .~ [ReqUnknownName NsEnumValue (forgetNamespace d.name) owner d.pos]
      _ -> case d.extends of
        Just target
          | not (Map.member (enumsBlockOfType target) symbols.enumsBlocks) ->
              mempty & #errs .~ [ReqUnknownExtends (forgetNamespace d.name) (forgetNamespace target) owner d.pos]
        _ -> mempty & #items .~ [(ItemKey NsEnumValue (forgetNamespace d.name), origin)]
    ReqFeature{names, struct, pos} -> case resolveFeaturePaths owner pos struct names of
      Right paths ->
        mempty & #featureRows .~ [(owner, FeatureRequirement{paths, condition, removedBy = Nothing, pos})]
      Left errs -> mempty & #errs .~ errs
    ReqComment _ -> mempty

  walkDeprecateBlock :: Text -> OriginSource -> DeprecateBlock -> Walk
  walkDeprecateBlock owner source d =
    mconcat (map walkDep (V.toList d.items))
   where
    sinceAtom = case source of
      FromFeature{version} -> AvailVersion version
      FromExtension{extension} -> AvailExtension extension
    info supersededBy =
      DeprecationInfo
        { supersededBy
        , categories = [d.explanationLink]
        , since = Just sinceAtom
        , marker = Nothing
        }
    walkDep = \case
      DepType{name, supersededBy, pos}
        | Map.member (WithNS name) symbols.types ->
            mempty & #deprecated .~ [(ItemKey NsType name, info supersededBy)]
        | otherwise -> mempty & #errs .~ [ReqUnknownName NsType name owner pos]
      DepCommand{name, supersededBy, pos}
        | Map.member (WithNS name) symbols.commands ->
            mempty & #deprecated .~ [(ItemKey NsCommand name, info supersededBy)]
        | otherwise -> mempty & #errs .~ [ReqUnknownName NsCommand name owner pos]
      DepFeature{names, struct, pos} -> case resolveFeaturePaths owner pos struct names of
        Right paths -> mempty & #deprecatedFeats .~ [(p, info Nothing) | p <- NE.toList paths]
        Left errs -> mempty & #errs .~ errs

  walkRemoveItem :: Text -> InterfaceItem -> Walk
  walkRemoveItem owner = \case
    ReqType{name, pos}
      | Map.member (WithNS name) symbols.types -> mempty & #removed .~ [(ItemKey NsType name, owner)]
      | otherwise -> mempty & #errs .~ [ReqUnknownName{namespace = NsType, name, owner, pos}]
    ReqCommand{name, pos}
      | Map.member (WithNS name) symbols.commands ->
          mempty & #removed .~ [(ItemKey NsCommand name, owner)]
      | otherwise -> mempty & #errs .~ [ReqUnknownName{namespace = NsCommand, name, owner, pos}]
    ReqEnum (EnumDef{name, pos})
      | Map.member name symbols.enumValues ->
          mempty & #removed .~ [(ItemKey NsEnumValue (forgetNamespace name), owner)]
      | otherwise ->
          mempty & #errs .~ [ReqUnknownName{namespace = NsEnumValue, name = forgetNamespace name, owner, pos}]
    ReqFeature{names, struct, pos} -> case resolveFeaturePaths owner pos struct names of
      Right paths -> mempty & #removedFeats .~ [(p, owner) | p <- toList paths]
      Left errs -> mempty & #errs .~ errs
    ReqComment _ -> mempty

  -- Canonicalize and failUnlessEmpty each Struct::member path of a marker; all-or-
  -- nothing so a valid row never carries an unvalidated sibling.
  resolveFeaturePaths
    :: Text -> Pos -> TypeName -> NonEmpty Text -> Either [RequireError] (NonEmpty FeaturePath)
  resolveFeaturePaths owner pos struct names =
    case partitionEithers (map resolveOne (toList names)) of
      ([], ok) -> Right (NE.fromList ok) -- same length as the nonempty input
      (errs, _) -> Left errs
   where
    resolveOne member =
      let path = FeaturePath{struct, member}
       in case canonicalFeaturePath symbols aliases path of
            Right canonical -> Right canonical
            Left _ -> Left (ReqUnknownFeaturePath (display path) owner pos)

  classifyCondition
    :: Text -> Pos -> Maybe (Raw DependsExpr) -> ([RequireError], Maybe AvailExpr)
  classifyCondition owner pos = \case
    Nothing -> ([], Nothing)
    Just raw -> case classifyDepends symbols aliases raw.parsed of
      Right expr -> ([], Just expr)
      Left errs -> ([ReqBadDepends{owner, err = e, pos} | e <- NE.toList errs], Nothing)

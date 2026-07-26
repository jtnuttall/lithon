{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | The phase-2 output: a resolved registry with canonical names, name-keyed
-- tables, materialized values, classified availability, and inverted alias
-- and pNext topologies. Formats, SPIR-V metadata, and sync tables are
-- carried in their phase-1 shapes (their pruning is curation's job); video
-- codecs are gone by construction.
--
-- 'assemble' builds the registry from the accumulated pass context; it is
-- the final resolve pass and, like the others, polymorphic in the context.
module Lithon.Codegen.Vulkan.Resolved.Registry (
  PromotionTarget (..),
  ExtensionStatus (..),
  ResolvedFeature (..),
  ResolvedExtension (..),
  ResolvedRegistry (..),
  AssemblyError (..),
  assemble,
  deprecationOf,
) where

import Data.Aeson (ToJSON)
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Text.Read qualified as TR
import Data.Vector qualified as V

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry (Registry (..), Specialized)
import Lithon.Codegen.Vulkan.Registry.Types.CDecl (MixedBody (..))
import Lithon.Codegen.Vulkan.Registry.Types.Common (Api, Platform (..), Raw (..), VendorTag)
import Lithon.Codegen.Vulkan.Registry.Types.Core (
  DefineType (..),
  TypeBody (..),
  TypeDecl (..),
 )
import Lithon.Codegen.Vulkan.Registry.Types.Features (Extension (..), ExtensionType, Feature (..))
import Lithon.Codegen.Vulkan.Registry.Types.Misc (
  Format,
  SpirvCapability,
  SpirvExtension,
  SyncSection,
 )
import Lithon.Codegen.Vulkan.Resolve.Aliases (Aliases)
import Lithon.Codegen.Vulkan.Resolve.CrossRef (TypeGraph (..))
import Lithon.Codegen.Vulkan.Resolve.Enums (MaterializedConstant (..), MaterializedEnums (..))
import Lithon.Codegen.Vulkan.Resolve.Require (Requirements (..))
import Lithon.Codegen.Vulkan.Resolve.Symbols (Symbols (..))
import Lithon.Codegen.Vulkan.Resolve.TierMerge (TierBlock (..), TieredFeature (..))
import Lithon.Codegen.Vulkan.Resolved.Avail (
  AvailError,
  AvailExpr,
  CoreVersion (..),
  DeprecationInfo,
  FeatureRequirement,
  InterfaceItemNamespace (..),
  ItemKey (..),
  PlatformGuard (..),
  classifyDepends,
 )
import Lithon.Codegen.Vulkan.Resolved.Commands (ResolvedCommand (..))
import Lithon.Codegen.Vulkan.Resolved.Core (
  ResolvedBasetype,
  ResolvedBitmask (..),
  ResolvedDefine (..),
  ResolvedExternal,
  ResolvedFuncpointer,
  ResolvedHandle (..),
  ResolvedStruct (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Enums (
  Constant (..),
  ConstantValue (..),
  Flows,
  ResolvedEnumBlock,
  resolveConstants,
  resolveEnumBlocks,
 )
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

data PromotionTarget
  = PromotedToVersion CoreVersion
  | PromotedToExtension ExtensionName
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ExtensionStatus
  = StatusCurrent
  | StatusPromoted PromotionTarget
  | -- | 'Nothing' = @deprecatedby=\"\"@, deprecated with no replacement.
    StatusDeprecated (Maybe ExtensionName)
  | StatusObsoleted (Maybe ExtensionName)
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | A public core version with its tiers merged: interface membership lives
-- in per-item origins; what remains here is identity plus the mandatory
-- device features.
data ResolvedFeature = ResolvedFeature
  { name :: FeatureName
  , version :: CoreVersion
  , deviceFeatures :: Vector FeatureRequirement
  , mergedTiers :: [FeatureName]
  , comment :: Maybe Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Extension metadata; item membership is queryable through per-item
-- origins, not duplicated here.
data ResolvedExtension = ResolvedExtension
  { name :: ExtensionName
  , number :: Int
  , extensionType :: Maybe ExtensionType
  , status :: ExtensionStatus
  , ratified :: Bool
  , provisional :: Bool
  , platformGuard :: Maybe PlatformGuard
  , specialUse :: [Text]
  , depends :: Maybe AvailExpr
  , specVersion :: Maybe Int
  , nameString :: Maybe Text
  , deviceFeatures :: Vector FeatureRequirement
  , author :: Maybe Text
  , comment :: Maybe Text
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ResolvedRegistry = ResolvedRegistry
  { headerVersion :: Int
  , apiVariant :: Api
  , platforms :: Vector Platform
  , tags :: Vector VendorTag
  , constants :: Map EnumValueName Constant
  , enums :: Map TypeName ResolvedEnumBlock
  , bitmasks :: Map TypeName ResolvedBitmask
  , handles :: Map TypeName ResolvedHandle
  , structs :: Map TypeName ResolvedStruct
  , funcpointers :: Map TypeName ResolvedFuncpointer
  , basetypes :: Map TypeName ResolvedBasetype
  , defines :: Map TypeName ResolvedDefine
  , externals :: Map TypeName ResolvedExternal
  , commands :: Map CommandName ResolvedCommand
  , features :: Vector ResolvedFeature
  -- ^ Version-ascending.
  , extensions :: Map ExtensionName ResolvedExtension
  , formats :: Vector Format
  , spirvExtensions :: Vector SpirvExtension
  , spirvCapabilities :: Vector SpirvCapability
  , sync :: Vector SyncSection
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data AssemblyError
  = -- | A depends expression on an extension failed to classify.
    ADepends {extension :: ExtensionName, err :: AvailError}
  | AMessage Text
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

instance Display AssemblyError where
  displayBuilder =
    displayBuilder @Text . \case
      ADepends{extension, err} -> display extension <> ": " <> display err
      AMessage msg -> msg

-- | Assemble the 'ResolvedRegistry' from the accumulated pass results.
assemble
  :: ( HasType Api cxt
     , HasType (Specialized Registry) cxt
     , HasType (Vector TieredFeature) cxt
     , HasType Symbols cxt
     , HasType Aliases cxt
     , HasType Requirements cxt
     , HasType MaterializedEnums cxt
     , HasType TypeGraph cxt
     , HasType Flows cxt
     )
  => cxt
  -> Validation (Errors AssemblyError) ResolvedRegistry
assemble cxt = failUnlessEmpty errors resolved
 where
  api = getTyped @Api cxt
  specialized = getTyped @(Specialized Registry) cxt
  tiered = getTyped @(Vector TieredFeature) cxt
  symbols = getTyped @Symbols cxt
  aliases = getTyped @Aliases cxt
  requirements = getTyped @Requirements cxt
  materialized = getTyped @MaterializedEnums cxt
  typeGraph = getTyped @TypeGraph cxt

  errors = featureErrs <> extensionErrs <> headerErrs
  resolved =
    ResolvedRegistry
      { headerVersion
      , apiVariant = api
      , platforms = specialized.platforms
      , tags = specialized.tags
      , constants = resolveConstants cxt
      , enums = resolveEnumBlocks cxt
      , bitmasks = typeGraph.bitmasks
      , handles = typeGraph.handles
      , structs = typeGraph.structs
      , funcpointers = typeGraph.funcpointers
      , basetypes = typeGraph.basetypes
      , defines = typeGraph.defines
      , externals = typeGraph.externals
      , commands = typeGraph.commands
      , features = V.fromList (sortOn (.version) featuresOk)
      , extensions = Map.fromList (toList extensionsOk)
      , formats = specialized.formats
      , spirvExtensions = specialized.spirvExtensions
      , spirvCapabilities = specialized.spirvCapabilities
      , sync = specialized.sync
      }

  -- ── features and extensions ─────────────────────────────────────────

  (featureErrs, featuresOk) = partitionWith resolveFeature (V.toList tiered)
  resolveFeature tf = case tf.feature.number of
    Nothing -> Left (AMessage ("feature has no version number: " <> display tf.feature.name))
    Just n ->
      Right
        ResolvedFeature
          { name = tf.feature.name
          , version = CoreVersion{major = fst n.parsed, minor = snd n.parsed}
          , deviceFeatures =
              Map.findWithDefault V.empty (forgetNamespace tf.feature.name) requirements.deviceFeatures
          , mergedTiers = ordNub (mapMaybe (.tier) (V.toList tf.blocks))
          , comment = tf.feature.comment
          , pos = tf.feature.pos
          }

  (extensionErrs, extensionsOk) =
    first fold $ V.partitionWith resolveExtension specialized.extensions
  resolveExtension e = case dependsResult of
    Left errs -> Left errs
    Right depends ->
      Right
        ( e.name
        , ResolvedExtension
            { name = e.name
            , number = e.number
            , extensionType = e.extensionType
            , status = statusOf
            , ratified = api `elem` e.ratified
            , provisional = e.provisional
            , platformGuard = do
                p <- e.platform
                protect <- Map.lookup (WithNS p) platformProtect
                pure PlatformGuard{platform = WithNS p, protect}
            , specialUse = e.specialUse
            , depends
            , specVersion = constantInt (WithNS (T.toUpper (forgetNamespace e.name) <> "_SPEC_VERSION"))
            , nameString = constantString (WithNS (T.toUpper (forgetNamespace e.name) <> "_EXTENSION_NAME"))
            , deviceFeatures =
                Map.findWithDefault V.empty (forgetNamespace e.name) requirements.deviceFeatures
            , author = e.author
            , comment = e.comment
            , pos = e.pos
            }
        )
   where
    dependsResult = case e.depends of
      Nothing -> Right Nothing
      Just raw -> case classifyDepends symbols aliases raw.parsed of
        Right expr -> Right (Just expr)
        Left errs -> Left [ADepends{extension = e.name, err} | err <- toList errs]
    statusOf
      | Just target <- e.obsoletedBy = StatusObsoleted (nonEmptyText target)
      | Just target <- e.deprecatedBy = StatusDeprecated (nonEmptyText target)
      | Just target <- e.promotedTo = StatusPromoted (promotionOf target)
      | otherwise = StatusCurrent
    nonEmptyText t = if T.null t then Nothing else Just (WithNS t)
    promotionOf target = case T.stripPrefix "VK_VERSION_" target of
      Just rest
        | [major, minor] <- T.splitOn "_" rest
        , Right (ma, "") <- TR.decimal major
        , Right (mi, "") <- TR.decimal minor ->
            PromotedToVersion CoreVersion{major = ma, minor = mi}
      _ -> PromotedToExtension (WithNS target)

  platformProtect = Map.fromList [(p.name, p.protect) | p <- V.toList specialized.platforms]

  constantInt n = case Map.lookup n materialized.constants of
    Just MaterializedConstant{value = ConstInt i} -> Just (fromIntegral i)
    Just MaterializedConstant{value = ConstU32 w} -> Just (fromIntegral w)
    _ -> Nothing
  constantString n = case Map.lookup n materialized.constants of
    Just MaterializedConstant{value = ConstString s} -> Just s
    _ -> Nothing

  -- ── header version ──────────────────────────────────────────────────

  (headerErrs, headerVersion) = case headerDefine of
    Nothing -> ([AMessage "VK_HEADER_VERSION define not found"], 0)
    Just body -> case reverse (T.words body.raw) of
      lastWord : _ | Right (n, "") <- TR.decimal lastWord -> ([], n)
      _ -> ([AMessage "VK_HEADER_VERSION define did not end in a number"], 0)
  headerDefine =
    case Map.lookup VK_HEADER_VERSION symbols.types of
      Just TypeDecl{body = TDefine d} -> Just d.body
      _ -> Nothing

-- | Deprecation info for one item across the tables that carry it.
deprecationOf :: ResolvedRegistry -> ItemKey -> Maybe DeprecationInfo
deprecationOf reg key = case key.namespace of
  NsType ->
    (Map.lookup (WithNS key.name) reg.structs >>= (.deprecation))
      <|> (Map.lookup (WithNS key.name) reg.handles >>= (.deprecation))
      <|> (Map.lookup (WithNS key.name) reg.bitmasks >>= (.deprecation))
      <|> (Map.lookup (WithNS key.name) reg.defines >>= (.deprecation))
  NsCommand -> Map.lookup (WithNS key.name) reg.commands >>= (.deprecation)
  NsEnumValue -> Map.lookup (WithNS key.name) reg.constants >>= (.deprecation)

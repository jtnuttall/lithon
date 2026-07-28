{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}

-- | WithNS-keyed lookup tables over the specialized, tier-merged registry.
--
-- These are phase-1-typed views (no resolution happens here): every later
-- pass looks names up through 'Symbols' instead of scanning vectors. Names
-- are unique per namespace — the specialization pass already guarantees
-- that, and this pass re-checks it as a safety net against pass-ordering
-- mistakes.
--
-- Enum VALUE names are the exception: one name may legitimately have
-- several definition sites (the same value required by a core tier and by
-- extensions, promoted pairs, …), so 'enumValues' maps to every site in
-- encounts order. Deduplication and value-equality checking is the enum
-- materialization pass's job, not this one's.
module Lithon.Codegen.Vulkan.Resolve.Symbols (
  Symbols (..),
  InfoOf,
  tableFor,
  EnumValueSite (..),
  SymbolProvenance (..),
  SymbolError (..),
  buildSymbols,
) where

import Data.Aeson (ToJSON)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry
import Lithon.Codegen.Vulkan.Registry.Micro.Common (FeaturePath (..))
import Lithon.Codegen.Vulkan.Registry.Types.CDecl (Declaration (..))
import Lithon.Codegen.Vulkan.Registry.Types.Commands (
  Command (..),
  CommandDefinition (..),
  ProtoDecl (..),
 )
import Lithon.Codegen.Vulkan.Registry.Types.Core (
  AliasOr (..),
  Member (..),
  StructDef (..),
  TypeBody (..),
  TypeDecl (..),
  typeBodyName,
 )
import Lithon.Codegen.Vulkan.Registry.Types.Enums (
  EnumDef (..),
  EnumValueSpec (..),
  EnumsBlock (..),
  EnumsItem (..),
  enumsBlockOfType,
 )
import Lithon.Codegen.Vulkan.Registry.Types.Features (
  ChangeBlock (..),
  Extension (..),
  Feature (..),
  InterfaceItem (..),
  RequireBlock (..),
 )
import Lithon.Codegen.Vulkan.Resolve.TierMerge (TierBlock (..), TieredFeature (..))
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

-- | Where a symbol (currently: an enum value definition) was declared.
data SymbolProvenance
  = InTypesSection Pos
  | InEnumsSection {block :: EnumsBlockName, pos :: Pos}
  | InFeature {feature :: FeatureName, tier :: Maybe FeatureName, pos :: !Pos}
  | InExtension {extension :: ExtensionName, pos :: Pos}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | One definition site of an enum value (any @\<enum\>@ element whose spec
-- is not a bare reference).
data EnumValueSite = EnumValueSite
  { block :: Maybe EnumsBlockName
  -- ^ The owning @\<enums\>@ block: the block itself for block items, the
  -- @extends=@ target for require items, 'Nothing' for extension-local
  -- constants (SPEC_VERSION\/EXTENSION_NAME and friends).
  , def :: EnumDef
  , declaredIn :: SymbolProvenance
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data Symbols = Symbols
  { types :: Map TypeName TypeDecl
  , enumsBlocks :: Map EnumsBlockName EnumsBlock
  , enumValues :: Map EnumValueName (NonEmpty EnumValueSite)
  -- ^ Every definition site per value name, in encounts order (enums
  -- blocks, then merged features, then extensions — document order within
  -- each).
  , commands :: Map CommandName Command
  , features :: Map FeatureName Feature
  -- ^ Public features only (tier merge has run).
  , extensions :: Map ExtensionName Extension
  , featurePaths :: Set FeaturePath
  -- ^ Every @Struct::member@ path a @depends=@ atom may legally name.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | What one name maps to in each namespace's symbol table. The seam between
-- the type and enums namespaces is 'tableFor'-dispatch plus the conversions
-- in "Lithon.Codegen.Vulkan.Registry.Types.Enums"; platforms carry no table.
type family InfoOf (k :: Namespace) where
  InfoOf TypeNS = TypeDecl
  InfoOf EnumsBlockNS = EnumsBlock
  InfoOf EnumValueNS = NonEmpty EnumValueSite
  InfoOf CommandNS = Command
  InfoOf FeatureNS = Feature
  InfoOf ExtensionNS = Extension
  InfoOf PlatformNS = Void

-- | The table for a namespace, by singleton evidence — namespace tag and
-- table can no longer drift at call sites.
tableFor :: SNamespace k -> Symbols -> Map (WithNS k) (InfoOf k)
tableFor k s = case k of
  STypeNS -> s.types
  SEnumsBlockNS -> s.enumsBlocks
  SEnumValueNS -> s.enumValues
  SCommandNS -> s.commands
  SFeatureNS -> s.features
  SExtensionNS -> s.extensions
  SPlatformNS -> Map.empty

data SymbolError = SymDuplicate
  { namespace :: Namespace
  , name :: Text
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display SymbolError where
  displayBuilder e =
    "duplicate " <> displayBuilder e.namespace <> " name in symbol table: " <> displayBuilder e.name

-- | Build the tables from the specialized registry and its merged
-- features. The registry's own feature vector is ignored in favor of
-- @tiered@ (which holds the public features with tier-tagged blocks).
buildSymbols
  :: forall cxt
   . ( HasType (Specialized Registry) cxt
     , HasType (Vector TieredFeature) cxt
     )
  => cxt -> Validation (Errors SymbolError) Symbols
buildSymbols cxt = failUnlessEmpty errors symbols
 where
  reg = getTyped @(Specialized Registry) cxt
  tiered = getTyped @(Vector TieredFeature) cxt
  symbols =
    Symbols
      { types = Map.fromList typeKvs
      , enumsBlocks = Map.fromList enumsKvs
      , enumValues = Map.fromListWith (flip (<>)) (map (fmap pure) valueSites)
      , commands = Map.fromList commandKvs
      , features = Map.fromList featureKvs
      , extensions = Map.fromList extensionKvs
      , featurePaths = Set.fromList paths
      }

  typeKvs = [(typeBodyName t.body, t) | t <- V.toList reg.types]
  enumsKvs = [(b.name, b) | b <- V.toList reg.enums]
  commandKvs = [(commandName c, c) | c <- V.toList reg.commands]
  featureKvs = [(tf.feature.name, tf.feature) | tf <- V.toList tiered]
  extensionKvs = [(e.name, e) | e <- V.toList reg.extensions]

  commandName = \case
    CommandAlias{name} -> name
    CommandDef d -> WithNS d.proto.decl.name

  valueSites :: [(EnumValueName, EnumValueSite)]
  valueSites = blockSites <> featureSites <> extensionSites
  blockSites =
    [ ( d.name
      , EnumValueSite
          { block = Just b.name
          , def = d
          , declaredIn = InEnumsSection{block = b.name, pos = d.pos}
          }
      )
    | b <- V.toList reg.enums
    , ItemEnum d <- V.toList b.items
    , isDefinition d
    ]
  featureSites =
    [ (d.name, site)
    | tf <- V.toList tiered
    , tb <- V.toList tf.blocks
    , d <- requireEnumDefs tb.block
    , let site =
            EnumValueSite
              { block = enumsBlockOfType <$> d.extends
              , def = d
              , declaredIn = InFeature{feature = tf.feature.name, tier = tb.tier, pos = d.pos}
              }
    ]
  extensionSites =
    [ (d.name, site)
    | e <- V.toList reg.extensions
    , ch <- V.toList e.changes
    , d <- requireEnumDefs ch
    , let site =
            EnumValueSite
              { block = enumsBlockOfType <$> d.extends
              , def = d
              , declaredIn = InExtension{extension = e.name, pos = d.pos}
              }
    ]

  -- dinition sites live only in require blocks; remove/deprecate items
  -- reference existing names.
  requireEnumDefs = \case
    ChRequire r -> [d | ReqEnum d <- V.toList r.items, isDefinition d]
    ChDeprecate _ -> []
    ChRemove _ -> []

  isDefinition d = case d.spec of
    EvNone -> False
    _ -> True

  paths =
    [ FeaturePath{struct = s.name, member = m.decl.name}
    | t <- V.toList reg.types
    , s <- structDefOf t.body
    , m <- V.toList s.members
    ]
  structDefOf = \case
    TStruct (FullDef s) -> [s]
    TUnion (FullDef s) -> [s]
    _ -> []

  errors =
    concat
      [ dupes STypeNS (map fst typeKvs)
      , dupes SEnumsBlockNS (map fst enumsKvs)
      , dupes SCommandNS (map fst commandKvs)
      , dupes SFeatureNS (map fst featureKvs)
      , dupes SExtensionNS (map fst extensionKvs)
      ]
  dupes :: SNamespace k -> [WithNS k] -> [SymbolError]
  dupes ns pool = [SymDuplicate{namespace, name} | (namespace, name) <- duplicateNames ns pool]

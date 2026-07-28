-- | Resolved enum blocks, items, and API constants, plus their construction
-- from the materialized forms. The invariant (pinned by tests): 'NumSigned'
-- appears in @KindEnum@ blocks, 'NumBits' in @KindBitmask@ blocks; constants
-- get their own typed representation driven by the registry's @type=@
-- attribute. The value vocabulary lives in
-- "Lithon.Codegen.Vulkan.Resolved.Enums.Value" (re-exported here).
module Lithon.Codegen.Vulkan.Resolved.Enums (
  module Lithon.Codegen.Vulkan.Resolved.Enums.Value,
  EnumFlow (..),
  Flows (..),
  flowOf,
  ResolvedEnumItem (..),
  ResolvedEnumBlock (..),
  Constant (..),
  resolveEnumBlocks,
  resolveConstants,
) where

import Data.Aeson (ToJSON)
import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry (Registry, Specialized)
import Lithon.Codegen.Vulkan.Registry.Types.Core (TypeCommon (..), TypeDecl (..))
import Lithon.Codegen.Vulkan.Registry.Types.Enums (BitWidth, EnumsKind)
import Lithon.Codegen.Vulkan.Resolve.Aliases (Aliases (..), CanonicalEntry (..))
import Lithon.Codegen.Vulkan.Resolve.Enums (
  MaterializedBlock (..),
  MaterializedConstant (..),
  MaterializedEnums (..),
  MaterializedValue (..),
 )
import Lithon.Codegen.Vulkan.Resolve.Require (Requirements, deprecationAt, originsFor)
import Lithon.Codegen.Vulkan.Resolve.Symbols (Symbols (..))
import Lithon.Codegen.Vulkan.Resolved.Avail (
  AliasInfo (..),
  AvailExpr,
  DeprecationInfo,
  InterfaceItemNamespace (..),
  Origin,
  PlatformGuard,
  availabilityOf,
  guardsFor,
  mergeDeprecation,
 )
import Lithon.Codegen.Vulkan.Resolved.Enums.Value
import Lithon.Codegen.Vulkan.Xml.Types (Pos, noPos)

-- | Whether values of an enum cross the boundary app->driver ('FlowIn'),
-- driver->app ('FlowOut'), or both — phase 3's open-ADT ("unknown hole")
-- driver: driver-returned enums can carry values the binding was not
-- generated against.
data EnumFlow
  = FlowIn
  | FlowOut
  | FlowBoth
  | -- | Never reached from any command surface (orphan blocks).
    FlowUnreferenced
  deriving stock (Bounded, Enum, Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Flow classification per enums-block name, as computed by
-- 'Lithon.Codegen.Vulkan.Resolve.Flow.classifyFlow'.
newtype Flows = Flows (Map TypeName EnumFlow)
  deriving stock (Eq, Generic, Show)
  deriving newtype (NFData)

flowOf :: Flows -> TypeName -> EnumFlow
flowOf (Flows flows) name = Map.findWithDefault FlowUnreferenced name flows

data ResolvedEnumItem = ResolvedEnumItem
  { name :: !EnumValueName
  , value :: !EnumNumber
  , encoding :: !ValueEncoding
  , aliases :: !(Vector (AliasInfo 'EnumValueNS))
  , availability :: !(Maybe AvailExpr)
  , origins :: ![Origin]
  , platformGuards :: ![PlatformGuard]
  , deprecation :: !(Maybe DeprecationInfo)
  , comment :: !(Maybe Text)
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ResolvedEnumBlock = ResolvedEnumBlock
  { name :: !TypeName
  , kind :: !EnumsKind
  , bitWidth :: !BitWidth
  , flow :: !EnumFlow
  , items :: !(Vector ResolvedEnumItem)
  -- ^ Block-native values in document order, then additions sorted by
  -- (value, name).
  , aliases :: !(Vector (AliasInfo 'TypeNS))
  -- ^ Enum TYPE aliases.
  , availability :: !(Maybe AvailExpr)
  , origins :: ![Origin]
  , comment :: !(Maybe Text)
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | A resolved API constant.
data Constant = Constant
  { name :: !EnumValueName
  , value :: !ConstantValue
  , aliases :: !(Vector (AliasInfo 'EnumValueNS))
  , availability :: !(Maybe AvailExpr)
  , origins :: ![Origin]
  , deprecation :: !(Maybe DeprecationInfo)
  , comment :: !(Maybe Text)
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Construct every resolved enum block from the materialized set. One call
-- builds the alias indexes once and shares them across all blocks and items.
resolveEnumBlocks
  :: ( HasType (Specialized Registry) cxt
     , HasType Symbols cxt
     , HasType Aliases cxt
     , HasType Requirements cxt
     , HasType MaterializedEnums cxt
     , HasType Flows cxt
     )
  => cxt -> Map TypeName ResolvedEnumBlock
resolveEnumBlocks cxt = Map.mapWithKey resolveBlock materialized.blocks
 where
  materialized = getTyped @MaterializedEnums cxt
  flows = getTyped @Flows cxt
  valueAliasesOf = aliasesFromIndex (valueAliasIndex cxt)
  typeAliasesOf = aliasesFromIndex (typeAliasIndex cxt)

  resolveBlock name block =
    ResolvedEnumBlock
      { name
      , kind = block.kind
      , bitWidth = block.bitWidth
      , flow = flowOf flows name
      , items = fmap resolveItem block.values
      , aliases = typeAliasesOf name
      , availability = availabilityOf origins
      , origins
      , comment = block.comment
      , pos = block.pos
      }
   where
    origins = originsFor cxt NsType (forgetNamespace name)

  resolveItem v =
    ResolvedEnumItem
      { name = v.name
      , value = v.value
      , encoding = v.encoding
      , aliases = valueAliasesOf v.name
      , availability = availabilityOf v.origins
      , origins = v.origins
      , platformGuards = guardsFor cxt v.origins
      , deprecation = mergeDeprecation (deprecationAt cxt NsEnumValue (forgetNamespace v.name)) v.deprecated
      , comment = v.comment
      , pos = v.pos
      }

-- | Construct every resolved API constant from the materialized set.
resolveConstants
  :: ( HasType Symbols cxt
     , HasType Aliases cxt
     , HasType Requirements cxt
     , HasType MaterializedEnums cxt
     )
  => cxt -> Map EnumValueName Constant
resolveConstants cxt = Map.mapWithKey resolveConstant materialized.constants
 where
  materialized = getTyped @MaterializedEnums cxt
  valueAliasesOf = aliasesFromIndex (valueAliasIndex cxt)

  resolveConstant name c =
    Constant
      { name
      , value = c.value
      , aliases = valueAliasesOf name
      , availability = availabilityOf c.origins
      , origins = c.origins
      , deprecation = mergeDeprecation (deprecationAt cxt NsEnumValue (forgetNamespace name)) c.deprecated
      , comment = c.comment
      , pos = c.pos
      }

-- ── alias inversion for the enum-value and enum-type namespaces ─────────

aliasesFromIndex :: Map (WithNS k) [AliasInfo k] -> WithNS k -> Vector (AliasInfo k)
aliasesFromIndex index n = V.fromList (Map.findWithDefault [] n index)

valueAliasIndex
  :: (HasType Symbols cxt, HasType Aliases cxt, HasType Requirements cxt)
  => cxt -> Map EnumValueName [AliasInfo 'EnumValueNS]
valueAliasIndex cxt = buildAliasIndex cxt aliases.enumValues NsEnumValue valuePos
 where
  aliases = getTyped @Aliases cxt
  symbols = getTyped @Symbols cxt
  valuePos n = case Map.lookup n symbols.enumValues of
    Just sites -> NE.head sites ^. #def . #pos
    Nothing -> noPos

typeAliasIndex
  :: (HasType Symbols cxt, HasType Aliases cxt, HasType Requirements cxt)
  => cxt -> Map TypeName [AliasInfo 'TypeNS]
typeAliasIndex cxt = buildAliasIndex cxt aliases.types NsType typePos
 where
  aliases = getTyped @Aliases cxt
  symbols = getTyped @Symbols cxt
  typePos n = maybe noPos (\t -> t.common.pos) (Map.lookup n symbols.types)

buildAliasIndex
  :: (HasType Requirements cxt)
  => cxt
  -> Map (WithNS k) (CanonicalEntry k)
  -> InterfaceItemNamespace
  -> (WithNS k -> Pos)
  -> Map (WithNS k) [AliasInfo k]
buildAliasIndex cxt table ns posOf =
  Map.map (map snd . sortOn fst)
    $ Map.fromListWith
      (<>)
      [ (entry.target, [(aliasName, info aliasName entry)])
      | (aliasName, entry) <- Map.toList table
      ]
 where
  info aliasName entry =
    let origins = originsFor cxt ns (forgetNamespace aliasName)
     in AliasInfo
          { name = aliasName
          , availability = availabilityOf origins
          , origins
          , deprecated = entry.deprecated
          , pos = posOf aliasName
          }

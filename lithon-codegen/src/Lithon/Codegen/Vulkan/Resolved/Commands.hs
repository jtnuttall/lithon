-- | Resolved commands: classified parameter\/return references, dispatch
-- level, canonicalized result codes, and alias spellings (which double as
-- the loader's alternative @vkGetProcAddr@ names, each with its own
-- availability).
module Lithon.Codegen.Vulkan.Resolved.Commands (
  DispatchLevel (..),
  ResolvedCommand (..),
  resolveCommands,
) where

import Data.Aeson (ToJSON)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry (Registry, Specialized)
import Lithon.Codegen.Vulkan.Registry.Types.CDecl (Declaration (..), TypeRef (..))
import Lithon.Codegen.Vulkan.Registry.Types.Commands (
  CmdBufferLevel,
  Command (..),
  CommandDefinition (..),
  ProtoDecl (..),
  QueueTask,
  Scope,
 )
import Lithon.Codegen.Vulkan.Registry.Types.Core (
  AliasOr (..),
  HandleDef (..),
  TypeBody (..),
  TypeDecl (..),
 )
import Lithon.Codegen.Vulkan.Resolve.Aliases (Aliases (..), canonicalize)
import Lithon.Codegen.Vulkan.Resolve.Enums (MaterializedEnums)
import Lithon.Codegen.Vulkan.Resolve.Require (Requirements)
import Lithon.Codegen.Vulkan.Resolve.Require qualified as Require
import Lithon.Codegen.Vulkan.Resolve.Symbols (Symbols (..))
import Lithon.Codegen.Vulkan.Resolved.Avail (
  AliasInfo,
  AvailExpr,
  DeprecationInfo,
  InterfaceItemNamespace (..),
  Origin,
  PlatformGuard,
  availabilityOf,
 )
import Lithon.Codegen.Vulkan.Resolved.Avail qualified as Avail
import Lithon.Codegen.Vulkan.Resolved.Core (
  CrossRefError (..),
  ResolvedParam (..),
  ResolvedTypeRef (..),
  TypeRefKind (..),
  aliasesOf,
  blockValueNames,
  classifyRef,
  deprecationFor,
  invertAliases,
  resolveParam,
 )
import Lithon.Codegen.Vulkan.Xml.Types (Pos, noPos)

-- | Which loader table a command belongs to, derived from the first
-- parameter's handle ancestry (device-side if the chain passes VkDevice).
data DispatchLevel = DispatchGlobal | DispatchInstance | DispatchDevice
  deriving stock (Bounded, Enum, Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ResolvedCommand = ResolvedCommand
  { name :: !CommandName
  -- ^ Canonical (the promoted spelling when one exists).
  , returnType :: !ResolvedTypeRef
  , params :: !(Vector ResolvedParam)
  , dispatch :: !DispatchLevel
  , successCodes :: ![EnumValueName]
  -- ^ Canonicalized and validated against the materialized 'VkResult'.
  , errorCodes :: ![EnumValueName]
  , queues :: ![QueueTask]
  , tasks :: ![QueueTask]
  , renderPass :: !(Maybe Scope)
  , videoCoding :: !(Maybe Scope)
  , conditionalRendering :: !(Maybe Bool)
  , cmdBufferLevel :: ![CmdBufferLevel]
  , allowNoQueues :: !(Maybe Bool)
  , export :: ![Text]
  , implicitExternSyncParams :: ![Text]
  , aliases :: !(Vector (AliasInfo 'CommandNS))
  -- ^ Alias spellings; also the loader's alternative symbol names.
  , availability :: !(Maybe AvailExpr)
  , origins :: ![Origin]
  , platformGuards :: ![PlatformGuard]
  , deprecation :: !(Maybe DeprecationInfo)
  , comment :: !(Maybe Text)
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Resolve every command: classified return\/parameter references, result
-- codes validated against the materialized 'VkResult', dispatch level from
-- the first parameter's handle ancestry, alias spellings attached.
resolveCommands
  :: ( HasType Aliases cxt
     , HasType MaterializedEnums cxt
     , HasType Requirements cxt
     , HasType (Specialized Registry) cxt
     , HasType Symbols cxt
     )
  => cxt -> Validation (Errors CrossRefError) (Map CommandName ResolvedCommand)
resolveCommands cxt = Map.fromList <$> traverse validateEither items
 where
  symbols = getTyped @Symbols cxt
  aliases = getTyped @Aliases cxt
  canonicalType = canonicalize aliases.types
  canonicalValue = canonicalize aliases.enumValues
  resultNames = blockValueNames (getTyped @MaterializedEnums cxt) VkResult
  commandAliasIndex =
    invertAliases cxt aliases.commands NsCommand \n -> case Map.lookup n symbols.commands of
      Just CommandAlias{pos} -> pos
      _ -> noPos

  items =
    [ resolveCommand name d
    | (name, cmd) <- Map.toAscList symbols.commands
    , CommandDef d <- [cmd]
    ]

  resolveCommand name d = do
    returnType <- classifyRef cxt (forgetNamespace name) d.proto.decl.pos d.proto.decl.typeName.name
    params <- traverse (resolveParam cxt (forgetNamespace name)) (V.toList d.params)
    successCodes <- traverse checkCode d.successCodes
    errorCodes <- traverse checkCode d.errorCodes
    pure
      ( name
      , ResolvedCommand
          { name
          , returnType
          , params = V.fromList params
          , dispatch = dispatchOf params
          , successCodes
          , errorCodes
          , queues = d.queues
          , tasks = d.tasks
          , renderPass = d.renderPass
          , videoCoding = d.videoCoding
          , conditionalRendering = d.conditionalRendering
          , cmdBufferLevel = d.cmdBufferLevel
          , allowNoQueues = d.allowNoQueues
          , export = d.export
          , implicitExternSyncParams = d.implicitExternSyncParams
          , aliases = aliasesOf commandAliasIndex name
          , availability = availabilityOf origins
          , origins
          , platformGuards = Avail.guardsFor cxt origins
          , deprecation = deprecationFor cxt NsCommand (forgetNamespace name) Nothing
          , comment = d.comment
          , pos = d.pos
          }
      )
   where
    origins = Require.originsFor cxt NsCommand (forgetNamespace name)
    checkCode code =
      let canonical = canonicalValue (WithNS code)
       in if null origins || Set.member canonical resultNames then
            Right canonical
          else
            Left XBadResultCode{code, owner = forgetNamespace name, pos = d.pos}

  -- Device-side iff the first parameter's handle ancestry passes VkDevice.
  handleParents :: Map TypeName (Maybe TypeName)
  handleParents =
    Map.fromList
      [ (name, canonicalType <$> h.parent)
      | (name, t) <- Map.toAscList symbols.types
      , THandle (FullDef h) <- [t.body]
      ]
  deviceSide :: TypeName -> Bool
  deviceSide n
    | n == VkDevice = True
    | otherwise = case Map.lookup n handleParents of
        Just (Just parent) -> deviceSide parent
        _ -> False
  dispatchOf :: [ResolvedParam] -> DispatchLevel
  dispatchOf = \case
    p : _
      | p.typeRef.kind == RefHandle ->
          if deviceSide p.typeRef.name then DispatchDevice else DispatchInstance
    _ -> DispatchGlobal

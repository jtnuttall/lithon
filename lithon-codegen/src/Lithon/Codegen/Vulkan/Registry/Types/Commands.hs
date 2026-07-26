{-# LANGUAGE StrictData #-}

-- | IR for commands and the declaration wrappers shared with funcpointers
-- ('ProtoDecl', 'Param').
module Lithon.Codegen.Vulkan.Registry.Types.Commands (
  ProtoDecl (..),
  Param (..),
  Command (..),
  commandName,
  CommandDefinition (..),
  Scope (..),
  CmdBufferLevel (..),
  QueueTask (..),
) where

import Data.Aeson (ToJSON)

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Micro.ExternSync (ExternSync)
import Lithon.Codegen.Vulkan.Registry.Micro.Len (AltLen, LenSpec)
import Lithon.Codegen.Vulkan.Registry.Types.CDecl (Declaration (..), MixedBody)
import Lithon.Codegen.Vulkan.Registry.Types.Common (ApiSet, Raw)
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

-- | A @\<proto\>@: the return type and name of a command or funcpointer.
data ProtoDecl = ProtoDecl
  { decl :: !Declaration
  , body :: !MixedBody
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | A @\<param\>@ of a command or funcpointer.
data Param = Param
  { decl :: Declaration
  , body :: MixedBody
  , api :: ApiSet
  , len :: Maybe (Raw LenSpec)
  , altLen :: Maybe (Raw AltLen)
  , stride :: Maybe Text
  , externSync :: Maybe (Raw ExternSync)
  , isOptional :: Maybe (NonEmpty Bool)
  , selector :: Maybe Text
  , noAutoValidity :: Bool
  , objectType :: Maybe Text
  , validStructs :: [TypeName]
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data Command
  = CommandAlias
      { name :: CommandName
      , alias :: CommandName
      , api :: ApiSet
      , comment :: Maybe Text
      , pos :: Pos
      }
  | CommandDef CommandDefinition
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

commandName :: Command -> CommandName
commandName = \case
  CommandAlias{name} -> name
  CommandDef d -> WithNS d.proto.decl.name

data CommandDefinition = CommandDefinition
  { proto :: ProtoDecl
  , params :: Vector Param
  , api :: ApiSet
  , queues :: [QueueTask]
  , successCodes :: [Text]
  , errorCodes :: [Text]
  , renderPass :: Maybe Scope
  , videoCoding :: Maybe Scope
  , conditionalRendering :: Maybe Bool
  , cmdBufferLevel :: [CmdBufferLevel]
  , tasks :: [QueueTask]
  , allowNoQueues :: Maybe Bool
  , export :: [Text]
  -- ^ Which APIs export the symbol (2025 modular restructure).
  , implicitExternSyncParams :: [Text]
  -- ^ Prose descriptions of implicitly synchronized objects.
  , comment :: Maybe Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | @renderpass=@ \/ @videocoding=@ scopes.
data Scope = ScopeInside | ScopeOutside | ScopeBoth
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data CmdBufferLevel = LevelPrimary | LevelSecondary
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Queue kinds (@queues=@) and task kinds (@tasks=@) are name lists in the
-- registry (e.g. @graphics@, @compute@, @action@, @state@); kept as tagged
-- text — their vocabularies live in prose, not the RNC.
newtype QueueTask = QueueTask Text
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

{-# LANGUAGE StrictData #-}

-- | Cross-reference resolution: run every per-entity constructor from
-- "Lithon.Codegen.Vulkan.Resolved.Core" and "Lithon.Codegen.Vulkan.Resolved.Commands"
-- against the context, accumulating all errors, and assemble the
-- 'TypeGraph'. @include@ types are dropped here: nothing downstream
-- consumes them (the vk_video ones are out of scope by decision, and
-- @vk_platform@ is phase 3's concern).
module Lithon.Codegen.Vulkan.Resolve.CrossRef (
  TypeGraph (..),
  resolveCrossRefs,
) where

import Data.Aeson (ToJSON)
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry (Registry, Specialized)
import Lithon.Codegen.Vulkan.Resolve.Aliases (Aliases)
import Lithon.Codegen.Vulkan.Resolve.Enums (MaterializedEnums)
import Lithon.Codegen.Vulkan.Resolve.Require (Requirements)
import Lithon.Codegen.Vulkan.Resolve.Symbols (Symbols)
import Lithon.Codegen.Vulkan.Resolved.Commands (ResolvedCommand, resolveCommands)
import Lithon.Codegen.Vulkan.Resolved.Core (
  CrossRefError (..),
  ResolvedBasetype,
  ResolvedBitmask,
  ResolvedDefine,
  ResolvedExternal,
  ResolvedFuncpointer,
  ResolvedHandle,
  ResolvedStruct,
  resolveBasetypes,
  resolveBitmasks,
  resolveDefines,
  resolveExternals,
  resolveFuncpointers,
  resolveHandles,
  resolveStructs,
 )

data TypeGraph = TypeGraph
  { structs :: !(Map TypeName ResolvedStruct)
  , handles :: !(Map TypeName ResolvedHandle)
  , bitmasks :: !(Map TypeName ResolvedBitmask)
  , funcpointers :: !(Map TypeName ResolvedFuncpointer)
  , basetypes :: !(Map TypeName ResolvedBasetype)
  , defines :: !(Map TypeName ResolvedDefine)
  , externals :: !(Map TypeName ResolvedExternal)
  , commands :: !(Map CommandName ResolvedCommand)
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Resolve every type and command, accumulating ALL errors applicatively
-- (struct, handle, bitmask, funcpointer, command order).
resolveCrossRefs
  :: ( HasType Symbols cxt
     , HasType Aliases cxt
     , HasType Requirements cxt
     , HasType MaterializedEnums cxt
     , HasType (Specialized Registry) cxt
     )
  => cxt
  -> Validation (Errors CrossRefError) TypeGraph
resolveCrossRefs cxt =
  TypeGraph
    <$> resolveStructs cxt
    <*> resolveHandles cxt
    <*> resolveBitmasks cxt
    <*> resolveFuncpointers cxt
    <*> pure (resolveBasetypes cxt)
    <*> pure (resolveDefines cxt)
    <*> pure (resolveExternals cxt)
    <*> resolveCommands cxt

{-# LANGUAGE StrictData #-}

-- | The phase-2 umbrella: run every resolve pass in order, each reading what
-- it needs from the accumulating context through its @HasType@ constraints,
-- then assemble the 'ResolvedRegistry'.
--
-- Pipeline: api specialization -> internal-tier merge -> symbol tables ->
-- alias canonicalization -> requirement collection -> enum materialization ->
-- cross-reference resolution -> flow classification -> assembly. Each pass
-- accumulates its own errors; the pipeline aborts at the first failing pass
-- (later passes need the earlier invariants).
module Lithon.Codegen.Vulkan.Resolve (
  ResolveError (..),
  resolveRegistry,
) where

import Data.Generics.SOP.Builder.Typed qualified as TB
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Registry
import Lithon.Codegen.Vulkan.Registry.Types.Common (Api)
import Lithon.Codegen.Vulkan.Resolve.Aliases (AliasError, resolveAliases)
import Lithon.Codegen.Vulkan.Resolve.CrossRef (resolveCrossRefs)
import Lithon.Codegen.Vulkan.Resolve.Enums (EnumError, materializeEnums)
import Lithon.Codegen.Vulkan.Resolve.Flow (classifyFlow)
import Lithon.Codegen.Vulkan.Resolve.Require (RequireError, collectRequirements)
import Lithon.Codegen.Vulkan.Resolve.Symbols (SymbolError, buildSymbols)
import Lithon.Codegen.Vulkan.Resolve.TierMerge (TierError, mergeInternalTiers)
import Lithon.Codegen.Vulkan.Resolved.Core (CrossRefError)
import Lithon.Codegen.Vulkan.Resolved.Registry (
  AssemblyError,
  ResolvedRegistry,
  assemble,
 )

data ResolveError
  = RSpecialize SpecializeError
  | RTier TierError
  | RSymbol SymbolError
  | RAlias AliasError
  | RRequire RequireError
  | REnum EnumError
  | RCrossRef CrossRefError
  | RAssemble AssemblyError
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

instance Display ResolveError where
  displayBuilder = \case
    RSpecialize e -> displayBuilder e
    RTier e -> displayBuilder e
    RSymbol e -> displayBuilder e
    RAlias e -> displayBuilder e
    RRequire e -> displayBuilder e
    REnum e -> displayBuilder e
    RCrossRef e -> displayBuilder e
    RAssemble e -> displayBuilder e

-- | Run the full phase-2 pipeline against one API variant. The passes
-- accumulate an anonymous product; 'assemble' reads it through the same
-- @HasType@ constraints the passes use.
resolveRegistry :: Api -> Registry -> Either (Errors ResolveError) ResolvedRegistry
resolveRegistry api registry = do
  cxt <-
    TB.buildNP
      $ TB.injectI_ api
      >>> TB.injectIA (\c -> specialize c registry <??> RSpecialize)
      >>> TB.injectIA (\c -> mergeInternalTiers c <??> RTier)
      >>> TB.injectIA (\c -> buildSymbols c <??> RSymbol)
      >>> TB.injectIA (\c -> resolveAliases c <??> RAlias)
      >>> TB.injectIA (\c -> collectRequirements c <??> RRequire)
      >>> TB.injectIA (\c -> materializeEnums c <??> REnum)
      >>> TB.injectIA (\c -> resolveCrossRefs c <??> RCrossRef)
      >>> TB.injectI classifyFlow
  assemble cxt <??> RAssemble

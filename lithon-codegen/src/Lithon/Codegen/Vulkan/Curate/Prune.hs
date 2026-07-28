{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoMonomorphismRestriction #-}

-- | Prune the resolved registry to a closure. Total: everything outside
-- the closure is dropped, per-entity lists (enum items, alias spellings,
-- result codes, pNext reverse edges, format rows, SPIR-V enables, sync
-- tables) are filtered to survivors, and anything silently narrowed is
-- recorded in 'PruneNotes' so the report never claims more coverage than
-- the output has.
module Lithon.Codegen.Vulkan.Curate.Prune (
  Pruned (..),
  PruneNotes (..),
  pruneRegistry,
) where

import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Curate.Closure (Closure (..))
import Lithon.Codegen.Vulkan.Curate.Profile (Profile (..))
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Types.Common (Platform (..))
import Lithon.Codegen.Vulkan.Registry.Types.Misc (
  Enable (..),
  Format (..),
  SyncAccess (..),
  SyncEquivalent (..),
  SyncSection (..),
  SyncStage (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Avail (
  AliasInfo (..),
  InterfaceItemNamespace (..),
  ItemKey (..),
  Origin (..),
  OriginSource (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Commands (ResolvedCommand (..))
import Lithon.Codegen.Vulkan.Resolved.Enums (
  ResolvedEnumItem (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Registry (
  ResolvedFeature (..),
  ResolvedRegistry (..),
 )

data Pruned = Pruned
  { registry :: !ResolvedRegistry
  , notes :: !PruneNotes
  }
  deriving stock (Generic)
  deriving anyclass (NFData)

data PruneNotes = PruneNotes
  { droppedResultCodes :: ![(CommandName, EnumValueName)]
  -- ^ (command, code) result codes referencing values outside the closure.
  , droppedSpirvCapabilities :: ![Text]
  -- ^ Capabilities left with zero enables.
  , droppedSpirvExtensions :: ![Text]
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

-- | Restrict the resolved registry to the closure. The profile supplies the
-- platform set (for the platforms table).
pruneRegistry
  :: (HasType Profile cxt, HasType Closure cxt, HasType ResolvedRegistry cxt)
  => cxt -> Pruned
pruneRegistry cxt =
  Pruned
    { registry =
        reg
          & (#platforms %~ filter (\p -> Set.member p.name platformSet))
          & (#constants %~ fmap pruneAliases . keepMap NsEnumValue)
          & (#enums %~ fmap pruneBlock . keepMap NsType)
          & (#bitmasks %~ fmap pruneAliases . keepMap NsType)
          & (#handles %~ fmap pruneAliases . keepMap NsType)
          & (#structs %~ fmap pruneStruct . keepMap NsType)
          & (#funcpointers %~ keepMap NsType)
          & (#basetypes %~ keepMap NsType)
          & (#defines %~ keepMap NsType)
          & (#externals %~ keepMap NsType)
          & (#commands .~ prunedCommands)
          & (#features %~ filter (\f -> f.version `elem` closure.coreVersions))
          & (#extensions %~ ifilter (\k _ -> Map.member k closure.selectedExtensions))
          & (#formats %~ filter keepFormat)
          & (#spirvExtensions .~ spirvExtensionsKept)
          & (#spirvCapabilities .~ spirvCapabilitiesKept)
          & (#sync %~ fmap pruneSync)
    , notes =
        PruneNotes
          { droppedResultCodes
          , droppedSpirvCapabilities
          , droppedSpirvExtensions
          }
    }
 where
  profile = getTyped @Profile cxt
  closure = getTyped @Closure cxt
  reg = getTyped @ResolvedRegistry cxt

  platformSet = Set.fromList profile.platforms <> Set.singleton "provisional"

  inClosure ns n = Map.member ItemKey{namespace = ns, name = n} closure.items
  keepMap :: InterfaceItemNamespace -> Map (WithNS k) a -> Map (WithNS k) a
  keepMap ns = Map.filterWithKey (\k _ -> inClosure ns (forgetNamespace k))

  pruneAliases :: forall s f k. (HasField' "aliases" s (f (AliasInfo k)), Filterable f) => s -> s
  pruneAliases = #aliases %~ filter keepAlias
   where
    keepAlias (a :: AliasInfo k) = any (sourceSelected . (.source)) a.origins
    sourceSelected = \case
      FromFeature{version} -> Set.member version closure.coreVersions
      FromExtension{extension} -> Map.member extension closure.selectedExtensions

  pruneStruct s =
    s
      & (#extends %~ filter (inClosure NsType . forgetNamespace))
      & (#extendedBy %~ filter (inClosure NsType . forgetNamespace))
      & pruneAliases

  pruneBlock b =
    b
      & (#items %~ fmap pruneAliases . filter (inClosure NsEnumValue . forgetNamespace . (.name)))
      & pruneAliases

  (droppedResultCodes, prunedCommands) = (concat drops, Map.fromList kept)
   where
    (drops, kept) =
      unzip
        [ let (dropped, cmd') = pruneCommandCodes cmd
           in (dropped, (name, cmd'))
        | (name, cmd) <- Map.toAscList (keepMap NsCommand reg.commands)
        ]
  pruneCommandCodes cmd =
    ( [(cmd.name, code) | code <- droppedS <> droppedE]
    , cmd
        & (#successCodes .~ keptS)
        & (#errorCodes .~ keptE)
        & pruneAliases
    )
   where
    (keptS, droppedS) = partition (inClosure NsEnumValue . forgetNamespace) cmd.successCodes
    (keptE, droppedE) = partition (inClosure NsEnumValue . forgetNamespace) cmd.errorCodes

  keepFormat f = inClosure NsEnumValue f.name

  (droppedSpirvExtensions, spirvExtensionsKept) =
    second V.fromList
      $ partitionWith keepSpirv (toList reg.spirvExtensions)

  (droppedSpirvCapabilities, spirvCapabilitiesKept) =
    second V.fromList
      $ partitionWith keepSpirv (toList reg.spirvCapabilities)

  keepSpirv :: (HasField' "enables" s (Vector Enable), HasField' "name" s Text) => s -> Either Text s
  keepSpirv s
    | spirvEnablesSurvive (s ^. field' @"enables") = Right s
    | otherwise = Left (s ^. field' @"name")

  -- An entry survives when at least one enable references something in the
  -- curated set. Enables are kept verbatim (phase 3 filters again with
  -- full context).
  spirvEnablesSurvive :: Vector Enable -> Bool
  spirvEnablesSurvive = any enableSurvives
  enableSurvives = \case
    EnableVersion _ -> True
    EnableExtension e -> Map.member e closure.selectedExtensions
    EnableFeature{struct} -> inClosure NsType struct
    EnableProperty{property} -> inClosure NsType property

  pruneSync s =
    SyncSection
      { comment = s.comment
      , stages = fmap pruneEquivalent . filter (inClosure NsEnumValue . (.name)) $ s.stages
      , accesses = fmap pruneEquivalent . filter (inClosure NsEnumValue . (.name)) $ s.accesses
      , pipelines = s.pipelines
      }

  pruneEquivalent :: (HasField' "equivalent" s (f SyncEquivalent), Traversable f) => s -> s
  pruneEquivalent =
    (field' @"equivalent" . traverse)
      %~ (#stages %~ filter (inClosure NsEnumValue))
      . (#accesses %~ filter (inClosure NsEnumValue))

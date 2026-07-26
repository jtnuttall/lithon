{-# LANGUAGE OverloadedStrings #-}

-- | Symbol tables and alias canonicalization over the pinned registry,
-- plus synthetic cycle/dangling cases the registry never exercises.
module Vulkan.Resolve.SymbolsTest (
  unit_symbolTablesCoverPinnedVulkan,
  unit_aliasesResolvePinnedVulkan,
  unit_aliasCycleAndDanglingDetected,
) where

import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Vector qualified as V
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry (Registry (..))
import Lithon.Codegen.Vulkan.Registry.Micro.Common (FeaturePath (..))
import Lithon.Codegen.Vulkan.Registry.Types.Common (ApiSet (..))
import Lithon.Codegen.Vulkan.Registry.Types.Core (
  AliasOr (..),
  TypeBody (..),
  TypeCommon (..),
  TypeDecl (..),
 )
import Lithon.Codegen.Vulkan.Resolve.Aliases (
  AliasError (..),
  Aliases (..),
  CanonicalEntry (..),
  canonicalize,
  resolveAliases,
 )
import Lithon.Codegen.Vulkan.Resolve.Symbols (Symbols (..))
import Lithon.Codegen.Vulkan.Xml.Types (noPos)
import Vulkan.Support.Resolve (pinnedAliases, pinnedSpecialized, pinnedSymbols)

unit_symbolTablesCoverPinnedVulkan :: IO ()
unit_symbolTablesCoverPinnedVulkan = do
  -- Every section is fully indexed; counts pinned against v1.4.356.
  Map.size pinnedSymbols.types @?= V.length pinnedSpecialized.types
  Map.size pinnedSymbols.types @?= 2657
  Map.size pinnedSymbols.enumsBlocks @?= V.length pinnedSpecialized.enums
  Map.size pinnedSymbols.commands @?= 857
  Map.size pinnedSymbols.extensions @?= 471
  Map.size pinnedSymbols.enumValues @?= 5619
  Set.size pinnedSymbols.featurePaths @?= 7601
  Map.keys pinnedSymbols.features
    @?= ["VK_VERSION_1_0", "VK_VERSION_1_1", "VK_VERSION_1_2", "VK_VERSION_1_3", "VK_VERSION_1_4"]
  assertBool
    "descriptorIndexing feature path present"
    ( Set.member
        FeaturePath{struct = "VkPhysicalDeviceVulkan12Features", member = "descriptorIndexing"}
        pinnedSymbols.featurePaths
    )

unit_aliasesResolvePinnedVulkan :: IO ()
unit_aliasesResolvePinnedVulkan = do
  Map.size pinnedAliases.types @?= 364
  Map.size pinnedAliases.commands @?= 105
  Map.size pinnedAliases.enumValues @?= 790
  -- Promoted spellings canonicalize to core names.
  canonicalize pinnedAliases.types "VkPipelineCreateFlags2CreateInfoKHR"
    @?= "VkPipelineCreateFlags2CreateInfo"
  canonicalize pinnedAliases.commands "vkCmdBindIndexBuffer2KHR" @?= "vkCmdBindIndexBuffer2"
  canonicalize pinnedAliases.enumValues "VK_STENCIL_FRONT_AND_BACK"
    @?= "VK_STENCIL_FACE_FRONT_AND_BACK"
  -- Non-aliases are identity.
  canonicalize pinnedAliases.types "VkDevice" @?= "VkDevice"
  -- Every table is fully resolved: no target is itself an alias.
  fullyResolved pinnedAliases.types
  fullyResolved pinnedAliases.commands
  fullyResolved pinnedAliases.enumValues
 where
  fullyResolved :: Map (WithNS k) (CanonicalEntry k) -> IO ()
  fullyResolved table =
    Map.keys (Map.filter (\e -> Map.member e.target table) table) @?= []

unit_aliasCycleAndDanglingDetected :: IO ()
unit_aliasCycleAndDanglingDetected = do
  let symbols =
        Symbols
          { types = Map.fromList (map withName [cycleA, cycleB, dangling])
          , enumsBlocks = Map.empty
          , enumValues = Map.empty
          , commands = Map.empty
          , features = Map.empty
          , extensions = Map.empty
          , featurePaths = Set.empty
          }
  case resolveAliases symbols of
    Success _ -> assertFailure "cycle and dangling aliases resolved successfully"
    Failure errs ->
      toList errs
        @?= [ AliasCycle{namespace = TypeNS, chain = ["VkA", "VkB", "VkA"]}
            , AliasCycle{namespace = TypeNS, chain = ["VkB", "VkA", "VkB"]}
            , AliasDangling{namespace = TypeNS, alias = "VkC", target = "VkMissing"}
            ]
 where
  cycleA = handleAlias "VkA" "VkB"
  cycleB = handleAlias "VkB" "VkA"
  dangling = handleAlias "VkC" "VkMissing"
  withName t = (aliasNameOf t.body, t)
  aliasNameOf = \case
    THandle AliasDef{name} -> name
    _ -> error "test builds handle aliases only"
  handleAlias name target =
    TypeDecl
      { common =
          TypeCommon
            { api = AllApis
            , requires = Nothing
            , deprecated = Nothing
            , comment = Nothing
            , pos = noPos
            }
      , body = THandle AliasDef{name, target}
      }

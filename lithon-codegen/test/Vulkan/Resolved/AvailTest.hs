{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}

-- | Depends-atom classification and availability-expression normalization
-- and evaluation.
module Vulkan.Resolved.AvailTest (
  unit_classifyAtomSpotChecks,
  unit_allExtensionDependsClassify,
  unit_normalizeExtensionDependsSoundly,
  hprop_normalizePreservesEval,
) where

import Data.List.NonEmpty qualified as NE
import Data.Set qualified as Set
import Data.Vector qualified as V
import Hedgehog (Gen, forAll, property, (===))
import Hedgehog qualified
import Hedgehog.Gen qualified as Gen
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry (Registry (..))
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (
  DependsAtom (..),
  pattern BAnd,
  pattern BAtom,
  pattern BOr,
 )
import Lithon.Codegen.Vulkan.Registry.Micro.Common (FeaturePath (..))
import Lithon.Codegen.Vulkan.Registry.Types.Common (Raw (..))
import Lithon.Codegen.Vulkan.Registry.Types.Features (Extension (..))
import Lithon.Codegen.Vulkan.Resolved.Avail (
  AvailAtom (..),
  AvailExpr,
  CapabilityEnv (..),
  CoreVersion (..),
  FeatureMode (..),
  classifyAtom,
  classifyDepends,
  evalAvail,
  normalizeAvail,
 )
import Vulkan.Support.Resolve (pinnedAliases, pinnedSpecialized, pinnedSymbols)

unit_classifyAtomSpotChecks :: IO ()
unit_classifyAtomSpotChecks = do
  classify (DependsName "VK_VERSION_1_1")
    @?= Right (AvailVersion CoreVersion{major = 1, minor = 1})
  classify (DependsName "VK_KHR_surface") @?= Right (AvailExtension "VK_KHR_surface")
  classify
    ( DependsFeature
        FeaturePath{struct = "VkPhysicalDeviceVulkan12Features", member = "descriptorIndexing"}
    )
    @?= Right
      (AvailFeature FeaturePath{struct = "VkPhysicalDeviceVulkan12Features", member = "descriptorIndexing"})
  -- Alias struct spellings canonicalize.
  classify
    ( DependsFeature
        FeaturePath{struct = "VkPhysicalDeviceDynamicRenderingFeaturesKHR", member = "dynamicRendering"}
    )
    @?= Right
      ( AvailFeature
          FeaturePath{struct = "VkPhysicalDeviceDynamicRenderingFeatures", member = "dynamicRendering"}
      )
  assertBool "unknown name rejected" (isLeft (classify (DependsName "VK_NOT_A_THING")))
 where
  classify = classifyAtom pinnedSymbols pinnedAliases

-- | Every extension-level depends expression in the specialized registry
-- classifies. The count is pinned against v1.4.356.
unit_allExtensionDependsClassify :: IO ()
unit_allExtensionDependsClassify = do
  let exprs = mapMaybe (fmap (.parsed) . (.depends)) (V.toList pinnedSpecialized.extensions)
  length exprs @?= 388
  case concatMap classifyErrs exprs of
    [] -> pure ()
    errs -> assertFailure ("unclassifiable atoms: " <> show errs)
 where
  classifyErrs expr =
    either NE.toList (const []) (classifyDepends pinnedSymbols pinnedAliases expr)

-- | Normalization is idempotent and evaluation-preserving over every real
-- extension depends expression.
unit_normalizeExtensionDependsSoundly :: IO ()
unit_normalizeExtensionDependsSoundly = do
  let classified =
        [ expr
        | e <- V.toList pinnedSpecialized.extensions
        , Just raw <- [e.depends]
        , Right expr <- [classifyDepends pinnedSymbols pinnedAliases raw.parsed]
        ]
  assertBool "have expressions" (not (null classified))
  sequence_
    [ do
        display (normalizeAvail (normalizeAvail expr)) @?= display (normalizeAvail expr)
        sequence_
          [ evalAvail env (normalizeAvail expr) @?= evalAvail env expr
          | env <- envs
          ]
    | expr <- classified
    ]
 where
  envs =
    [ CapabilityEnv{core = v, extensions = exts, featureMode = mode}
    | v <- [CoreVersion 1 0, CoreVersion 1 3, CoreVersion 1 4]
    , exts <-
        [ Set.empty
        , Set.fromList
            [ "VK_KHR_surface"
            , "VK_KHR_swapchain"
            , "VK_KHR_get_physical_device_properties2"
            , "VK_KHR_synchronization2"
            ]
        ]
    , mode <- [FeaturesAssumedTrue, FeaturesAssumedFalse]
    ]

hprop_normalizePreservesEval :: Hedgehog.Property
hprop_normalizePreservesEval = property do
  expr <- forAll genExpr
  env <- forAll genEnv
  evalAvail env (normalizeAvail expr) === evalAvail env expr

genExpr :: Gen AvailExpr
genExpr =
  Gen.recursive
    Gen.choice
    [BAtom <$> genAtom]
    [ Gen.subterm2 genExpr genExpr BAnd
    , Gen.subterm2 genExpr genExpr BOr
    ]
 where
  genAtom =
    Gen.element
      [ AvailVersion CoreVersion{major = 1, minor = 0}
      , AvailVersion CoreVersion{major = 1, minor = 3}
      , AvailVersion CoreVersion{major = 1, minor = 4}
      , AvailExtension "VK_A"
      , AvailExtension "VK_B"
      , AvailFeature FeaturePath{struct = "VkS", member = "m"}
      ]

genEnv :: Gen CapabilityEnv
genEnv = do
  core <- Gen.element [CoreVersion 1 0, CoreVersion 1 3, CoreVersion 1 4]
  extensions <- Set.fromList <$> Gen.subsequence ["VK_A", "VK_B"]
  featureMode <- Gen.element [FeaturesAssumedTrue, FeaturesAssumedFalse]
  pure CapabilityEnv{core, extensions, featureMode}

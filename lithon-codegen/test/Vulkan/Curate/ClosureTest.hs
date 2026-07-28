{-# LANGUAGE OverloadedStrings #-}

-- | Profile decoding and dependency closure over the pinned resolved
-- registry.
module Vulkan.Curate.ClosureTest (
  unit_profileDecodesWithDefaults,
  unit_swapchainClosure,
  unit_promotedSpellingsAutoSelected,
  unit_bannedTransitiveFails,
  unit_strictModeFails,
  unit_provisionalGate,
  unit_legacyExcludePolicy,
) where

import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text.Lazy qualified as TL
import Data.Text.Lazy.Encoding qualified as TLE
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Vulkan.Curate.Closure (
  Closure (..),
  CurateError (..),
  InclusionReason (..),
  InclusionTrace (..),
  computeClosure,
 )
import Lithon.Codegen.Vulkan.Curate.Profile (
  DependencyPolicy (..),
  LegacyCoreMode (..),
  LegacyCorePolicy (..),
  Profile (..),
  ProfileCore (..),
  ProfileExtension (..),
  ProfilePolicy (..),
  RegistryPin (..),
  decodeProfile,
 )
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Resolved.Avail (
  CoreVersion (..),
  InterfaceItemNamespace (..),
  ItemKey (..),
 )
import Vulkan.Support.Resolve (pinnedResolved)

baseProfile :: Profile
baseProfile =
  Profile
    { name = "test"
    , description = Nothing
    , registry = RegistryPin{headerVersion = Nothing}
    , core =
        ProfileCore
          { baseline = CoreVersion{major = 1, minor = 3}
          , maxCore = CoreVersion{major = 1, minor = 3}
          }
    , platforms = []
    , extensions = []
    , exclude = []
    , policy =
        ProfilePolicy
          { dependencies = DepsAuto
          , includePromotedToOptionalCores = False
          , allowProvisional = []
          , denySpecialUse = []
          , allowDeprecated = True
          , legacyCore = LegacyCorePolicy{mode = LegacyAnnotate, categories = []}
          , warnOnRegistryDrift = True
          }
    }

withExtensions :: [ExtensionName] -> Profile
withExtensions names =
  Profile
    { name = baseProfile.name
    , description = baseProfile.description
    , registry = baseProfile.registry
    , core = baseProfile.core
    , platforms = baseProfile.platforms
    , extensions = [ProfileExtension{name = n, rationale = Nothing} | n <- names]
    , exclude = baseProfile.exclude
    , policy = baseProfile.policy
    }

unit_profileDecodesWithDefaults :: IO ()
unit_profileDecodesWithDefaults = do
  let json =
        TLE.encodeUtf8
          $ TL.fromStrict
          $ "{\"name\":\"lithon-core\",\"core\":{\"baseline\":\"1.3\",\"max\":\"1.4\"},"
          <> "\"extensions\":[\"VK_KHR_swapchain\","
          <> "{\"name\":\"VK_EXT_mesh_shader\",\"rationale\":\"geometry path\"}]}"
  profile <- either (assertFailure . show) pure (decodeProfile json)
  profile.name @?= "lithon-core"
  profile.core.baseline @?= CoreVersion{major = 1, minor = 3}
  profile.core.maxCore @?= CoreVersion{major = 1, minor = 4}
  map (.name) profile.extensions @?= ["VK_KHR_swapchain", "VK_EXT_mesh_shader"]
  map (.rationale) profile.extensions @?= [Nothing, Just "geometry path"]
  profile.policy.dependencies @?= DepsAuto
  profile.policy.includePromotedToOptionalCores @?= True

unit_swapchainClosure :: IO ()
unit_swapchainClosure = do
  closure <- closureOrFail (withExtensions ["VK_KHR_swapchain"])
  closure.coreVersions
    @?= Set.fromList [CoreVersion 1 m | m <- [0 .. 3]]
  assertBool
    "surface pulled in transitively"
    (Map.member "VK_KHR_surface" closure.selectedExtensions)
  surfaceTrace <- traceOf closure "VK_KHR_surface"
  NE.head surfaceTrace.reasons @?= DependencyOf{dependent = "VK_KHR_swapchain"}
  sequence_
    [ assertBool (show key <> " in closure") (Map.member key closure.items)
    | key <-
        [ ItemKey NsType "VkSwapchainCreateInfoKHR"
        , ItemKey NsCommand "vkCreateSwapchainKHR"
        , ItemKey NsType "VkSurfaceKHR"
        , ItemKey NsCommand "vkCmdDraw"
        , ItemKey NsType "VkStructureType"
        , ItemKey NsEnumValue "VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR"
        ]
    ]
  -- 1.4-only items stay out at a 1.3 max.
  assertBool
    "1.4 core command not included"
    (not (Map.member (ItemKey NsCommand "vkCmdBindIndexBuffer2") closure.items))
 where
  traceOf closure n = case Map.lookup n closure.selectedExtensions of
    Nothing -> assertFailure ("extension not selected: " <> show n)
    Just t -> pure t

unit_promotedSpellingsAutoSelected :: IO ()
unit_promotedSpellingsAutoSelected = do
  let profile =
        Profile
          { name = baseProfile.name
          , description = baseProfile.description
          , registry = baseProfile.registry
          , core =
              ProfileCore
                { baseline = CoreVersion{major = 1, minor = 3}
                , maxCore = CoreVersion{major = 1, minor = 4}
                }
          , platforms = baseProfile.platforms
          , extensions = []
          , exclude = []
          , policy =
              ProfilePolicy
                { dependencies = DepsAuto
                , includePromotedToOptionalCores = True
                , allowProvisional = []
                , denySpecialUse = []
                , allowDeprecated = True
                , legacyCore = LegacyCorePolicy{mode = LegacyAnnotate, categories = []}
                , warnOnRegistryDrift = True
                }
          }
  closure <- closureOrFail profile
  maintenance5 <- case Map.lookup "VK_KHR_maintenance5" closure.selectedExtensions of
    Nothing -> assertFailure "VK_KHR_maintenance5 not auto-selected"
    Just t -> pure t
  NE.head maintenance5.reasons @?= SeedPromoted{version = CoreVersion{major = 1, minor = 4}}
  -- 1.4 core items are reachable at max 1.4.
  assertBool
    "1.4 core command included"
    (Map.member (ItemKey NsCommand "vkCmdBindIndexBuffer2") closure.items)

unit_bannedTransitiveFails :: IO ()
unit_bannedTransitiveFails = do
  let profile =
        Profile
          { name = baseProfile.name
          , description = baseProfile.description
          , registry = baseProfile.registry
          , core = baseProfile.core
          , platforms = baseProfile.platforms
          , extensions = [ProfileExtension{name = "VK_KHR_swapchain", rationale = Nothing}]
          , exclude = ["VK_KHR_surface"]
          , policy = baseProfile.policy
          }
  case computeClosure (profile, pinnedResolved) of
    Right _ -> assertFailure "banned transitive dependency selected"
    Left errs ->
      assertBool
        ("has BannedButRequired: " <> show errs)
        ( any
            ( \case
                BannedButRequired{banned = "VK_KHR_surface", dependent = Just "VK_KHR_swapchain"} -> True
                _ -> False
            )
            (toList errs)
        )

unit_strictModeFails :: IO ()
unit_strictModeFails = do
  let profile =
        Profile
          { name = baseProfile.name
          , description = baseProfile.description
          , registry = baseProfile.registry
          , core = baseProfile.core
          , platforms = baseProfile.platforms
          , extensions = [ProfileExtension{name = "VK_KHR_swapchain", rationale = Nothing}]
          , exclude = []
          , policy =
              ProfilePolicy
                { dependencies = DepsStrict
                , includePromotedToOptionalCores = False
                , allowProvisional = []
                , denySpecialUse = []
                , allowDeprecated = True
                , legacyCore = LegacyCorePolicy{mode = LegacyAnnotate, categories = []}
                , warnOnRegistryDrift = True
                }
          }
  case computeClosure (profile, pinnedResolved) of
    Right _ -> assertFailure "strict mode auto-included a dependency"
    Left errs ->
      assertBool
        ("has StrictDependencyMissing: " <> show errs)
        ( any
            ( \case
                StrictDependencyMissing{name = "VK_KHR_surface", neededBy = "VK_KHR_swapchain"} -> True
                _ -> False
            )
            (toList errs)
        )

unit_provisionalGate :: IO ()
unit_provisionalGate = do
  case computeClosure (withExtensions ["VK_KHR_portability_subset"], pinnedResolved) of
    Right _ -> assertFailure "provisional extension selected without allowlist"
    Left errs ->
      assertBool
        ("has ProvisionalNotAllowed: " <> show errs)
        ( any
            ( \case
                ProvisionalNotAllowed{name = "VK_KHR_portability_subset"} -> True
                _ -> False
            )
            (toList errs)
        )

unit_legacyExcludePolicy :: IO ()
unit_legacyExcludePolicy = do
  annotated <- closureOrFail baseProfile
  assertBool
    "legacy command included under annotate"
    (Map.member legacyKey annotated.items)
  let excludeProfile =
        Profile
          { name = baseProfile.name
          , description = baseProfile.description
          , registry = baseProfile.registry
          , core = baseProfile.core
          , platforms = baseProfile.platforms
          , extensions = []
          , exclude = []
          , policy =
              ProfilePolicy
                { dependencies = DepsAuto
                , includePromotedToOptionalCores = False
                , allowProvisional = []
                , denySpecialUse = []
                , allowDeprecated = True
                , legacyCore = LegacyCorePolicy{mode = LegacyExclude, categories = []}
                , warnOnRegistryDrift = True
                }
          }
  excluded <- closureOrFail excludeProfile
  assertBool
    "legacy command dropped under exclude"
    (not (Map.member legacyKey excluded.items))
 where
  legacyKey = ItemKey NsCommand "vkCmdPipelineBarrier"

closureOrFail :: Profile -> IO Closure
closureOrFail profile = case computeClosure (profile, pinnedResolved) of
  Left errs -> assertFailure ("closure failed: " <> show errs)
  Right c -> pure c

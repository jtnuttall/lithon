{-# LANGUAGE OverloadedStrings #-}

-- | Enum-value materialization over the pinned registry (offset
-- arithmetic, 64-bit bitmasks, constants) plus a synthetic value clash.
module Vulkan.Resolve.EnumMaterializeTest (
  unit_materializedCountsPinned,
  unit_offsetArithmeticSpotChecks,
  unit_bitmask64SpotChecks,
  unit_constantSpotChecks,
  unit_valueClashIsAnError,
) where

import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Vector qualified as V
import Lithon.Prelude
import Test.Tasty.HUnit (assertFailure, (@?=))

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Micro.Literal (ValueLiteral (..))
import Lithon.Codegen.Vulkan.Registry.Types.Common (ApiSet (..), Raw (..))
import Lithon.Codegen.Vulkan.Registry.Types.Enums (
  BitWidth (..),
  EnumDef (..),
  EnumValueSpec (..),
  EnumsBlock (..),
  EnumsKind (..),
 )
import Lithon.Codegen.Vulkan.Resolve.Aliases (Aliases (..))
import Lithon.Codegen.Vulkan.Resolve.Enums (
  EnumError (..),
  MaterializedBlock (..),
  MaterializedConstant (..),
  MaterializedEnums (..),
  MaterializedValue (..),
  materializeEnums,
  offsetValue,
 )
import Lithon.Codegen.Vulkan.Resolve.Require (Requirements (..))
import Lithon.Codegen.Vulkan.Resolve.Symbols (
  EnumValueSite (..),
  SymbolProvenance (..),
  Symbols (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Enums (ConstantValue (..), EnumNumber (..))
import Lithon.Codegen.Vulkan.Xml.Types (noPos)
import Vulkan.Support.Resolve (pinnedMaterialized)

unit_materializedCountsPinned :: IO ()
unit_materializedCountsPinned = do
  Map.size pinnedMaterialized.blocks @?= 354
  sum (fmap (V.length . (.values)) pinnedMaterialized.blocks) @?= 3848
  Map.size pinnedMaterialized.constants @?= 981

valueIn :: TypeName -> EnumValueName -> IO EnumNumber
valueIn blockName valueName = do
  block <- case Map.lookup blockName pinnedMaterialized.blocks of
    Nothing -> assertFailure ("no block " <> show blockName)
    Just b -> pure b
  case V.find (\v -> v.name == valueName) block.values of
    Nothing -> assertFailure ("no value " <> show valueName <> " in " <> show blockName)
    Just v -> pure v.value

unit_offsetArithmeticSpotChecks :: IO ()
unit_offsetArithmeticSpotChecks = do
  offsetValue 12 1 True @?= (-1000011001)
  offsetValue 197 0 False @?= 1000196000
  validationFailed <- valueIn "VkResult" "VK_ERROR_VALIDATION_FAILED"
  validationFailed @?= NumSigned (-1000011001)
  driverProps <- valueIn "VkStructureType" "VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES"
  driverProps @?= NumSigned 1000196000

unit_bitmask64SpotChecks :: IO ()
unit_bitmask64SpotChecks = do
  access2 <- case Map.lookup "VkAccessFlagBits2" pinnedMaterialized.blocks of
    Nothing -> assertFailure "no VkAccessFlagBits2 block"
    Just b -> pure b
  access2.bitWidth @?= W64
  sampledRead <- valueIn "VkAccessFlagBits2" "VK_ACCESS_2_SHADER_SAMPLED_READ_BIT"
  sampledRead @?= NumBits 0x100000000

unit_constantSpotChecks :: IO ()
unit_constantSpotChecks = do
  constant "VK_TRUE" (ConstU32 1)
  constant "VK_WHOLE_SIZE" (ConstU64 maxBound)
  constant "VK_QUEUE_FAMILY_EXTERNAL" (ConstU32 4294967294)
  constant "VK_KHR_SURFACE_SPEC_VERSION" (ConstInt 25)
  constant "VK_KHR_SURFACE_EXTENSION_NAME" (ConstString "VK_KHR_surface")
 where
  constant name expected = case Map.lookup name pinnedMaterialized.constants of
    Nothing -> assertFailure ("no constant " <> show name)
    Just c -> c.value @?= expected

unit_valueClashIsAnError :: IO ()
unit_valueClashIsAnError = do
  let block =
        EnumsBlock
          { name = "VkFoo"
          , kind = KindEnum
          , bitWidth = W32
          , comment = Nothing
          , items = V.empty
          , pos = noPos
          }
      site n =
        EnumValueSite
          { block = Just "VkFoo"
          , def =
              EnumDef
                { name = "VK_FOO_X"
                , spec = EvValue (Raw (T.show n) (VInt n)) Nothing
                , extends = Just "VkFoo"
                , extNumber = Nothing
                , valueType = Nothing
                , api = AllApis
                , protect = Nothing
                , deprecated = Nothing
                , comment = Nothing
                , pos = noPos
                }
          , declaredIn = InExtension{extension = "VK_TEST_ext", pos = noPos}
          }
      symbols =
        Symbols
          { types = Map.empty
          , enumsBlocks = Map.fromList [("VkFoo", block)]
          , enumValues = Map.fromList [("VK_FOO_X", site 1 :| [site 2])]
          , commands = Map.empty
          , features = Map.empty
          , extensions = Map.empty
          , featurePaths = Set.empty
          }
      aliases = Aliases{types = Map.empty, commands = Map.empty, enumValues = Map.empty}
      requirements =
        Requirements
          { required = Map.empty
          , deviceFeatures = Map.empty
          , deprecations = Map.empty
          , deprecatedFeatures = []
          , removedItems = Map.empty
          }
  case materializeEnums (symbols, aliases, requirements) of
    Success _ -> assertFailure "conflicting values materialized successfully"
    Failure errs -> case toList errs of
      [EnumValueClash{name, placement, first = firstValue, conflicting}] -> do
        name @?= "VK_FOO_X"
        placement @?= "VkFoo"
        (firstValue, conflicting) @?= ("1", "2")
      other -> assertFailure ("unexpected errors: " <> show other)

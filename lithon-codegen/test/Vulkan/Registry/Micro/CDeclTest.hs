{-# LANGUAGE OverloadedStrings #-}

-- | Mixed-content C declaration parsing: every gnarly construct censused
-- from the pinned registry, plus raw-text fidelity and strict rejections.
module Vulkan.Registry.Micro.CDeclTest (
  unit_simpleValue,
  unit_constPointer,
  unit_doubleConstPointer,
  unit_structKeyword,
  unit_constStructPointer,
  unit_bitfields,
  unit_multiDimArray,
  unit_enumDimArray,
  unit_nameAlias,
  unit_protoPointer,
  unit_commentDroppedFromRaw,
  unit_rawPreservesWhitespace,
  unit_rejectsUnknownElement,
  unit_rejectsUnknownNameAttr,
  unit_rejectsStrayIdentifier,
  unit_rejectsMissingName,
  unit_rejectsTrailingTokens,
  unit_pinnedRegistryDeclarationsAllParse,
) where

import Data.ByteString qualified as BS
import Data.Text qualified as T
import Test.Tasty.HUnit (Assertion, assertBool, assertFailure, (@?=))

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Micro.CDecl (chunksFromNodes, parseDeclaration)
import Lithon.Codegen.Vulkan.Registry.Micro.Common (FeaturePath (..))
import Lithon.Codegen.Vulkan.Registry.Types.CDecl (
  ArrayDim (..),
  Declaration (..),
  MixedBody (..),
  NameAlias (..),
  PtrLayer (..),
  TypeRef (..),
  mkMixedBody,
 )
import Lithon.Codegen.Vulkan.Xml.Decode (ErrorKind (..))
import Lithon.Codegen.Vulkan.Xml.Load (loadXmlBytes)
import Lithon.Codegen.Vulkan.Xml.Types (Pos, XElement (..), XNode (..), noPos)
import Vulkan.Support.Paths (registryXmlPath)

-- | Parse the body of @\<m\>…\<\/m\>@ as a declaration.
declFrom :: ByteString -> Either (Pos, ErrorKind) Declaration
declFrom bytes = case loadXmlBytes bytes of
  Left err -> error ("fixture failed to load: " <> show err)
  Right el -> do
    chunks <- chunksFromNodes el.nodes
    parseDeclaration (mkMixedBody chunks)

bodyFrom :: ByteString -> MixedBody
bodyFrom bytes = case loadXmlBytes bytes of
  Left err -> error ("fixture failed to load: " <> show err)
  Right el -> case chunksFromNodes el.nodes of
    Left err -> error ("chunk extraction failed: " <> show err)
    Right chunks -> mkMixedBody chunks

-- | Compare, ignoring positions.
(@?~) :: Either (Pos, ErrorKind) Declaration -> Declaration -> Assertion
actual @?~ expected = case actual of
  Left err -> assertFailure ("declaration failed to parse: " <> show err)
  Right decl -> stripPos decl @?= expected
 where
  stripPos d =
    Declaration
      { name = d.name
      , nameAlias = d.nameAlias
      , typeName = TypeRef{name = d.typeName.name, pos = noPos}
      , baseConst = d.baseConst
      , structKw = d.structKw
      , pointers = d.pointers
      , arrayDims = map stripDim d.arrayDims
      , bitfield = d.bitfield
      , pos = noPos
      }
  stripDim = \case
    DimNamespace n _ -> DimNamespace n noPos
    dim -> dim

plain :: Text -> Text -> Declaration
plain ty nm =
  Declaration
    { name = nm
    , nameAlias = Nothing
    , typeName = TypeRef{name = WithNS ty, pos = noPos}
    , baseConst = False
    , structKw = False
    , pointers = []
    , arrayDims = []
    , bitfield = Nothing
    , pos = noPos
    }

unit_simpleValue :: IO ()
unit_simpleValue =
  declFrom "<m><type>uint32_t</type> <name>width</name></m>" @?~ plain "uint32_t" "width"

unit_constPointer :: IO ()
unit_constPointer =
  declFrom "<m>const <type>char</type>* <name>pName</name></m>"
    @?~ (plain "char" "pName"){baseConst = True, pointers = [PtrLayer False]}

unit_doubleConstPointer :: IO ()
unit_doubleConstPointer =
  declFrom "<m>const <type>char</type>* const* <name>ppEnabledLayerNames</name></m>"
    @?~ (plain "char" "ppEnabledLayerNames")
      { baseConst = True
      , pointers = [PtrLayer True, PtrLayer False]
      }

unit_structKeyword :: IO ()
unit_structKeyword =
  declFrom "<m>struct <type>wl_display</type>* <name>display</name></m>"
    @?~ (plain "wl_display" "display"){structKw = True, pointers = [PtrLayer False]}

unit_constStructPointer :: IO ()
unit_constStructPointer =
  declFrom "<m>const struct <type>AHardwareBuffer</type>* <name>buffer</name></m>"
    @?~ (plain "AHardwareBuffer" "buffer")
      { baseConst = True
      , structKw = True
      , pointers = [PtrLayer False]
      }

-- | VkAccelerationStructureInstanceKHR's packed fields.
unit_bitfields :: IO ()
unit_bitfields = do
  declFrom "<m><type>uint32_t</type> <name>instanceCustomIndex</name>:24</m>"
    @?~ (plain "uint32_t" "instanceCustomIndex"){bitfield = Just 24}
  declFrom "<m><type>VkGeometryInstanceFlagsKHR</type> <name>flags</name>:8</m>"
    @?~ (plain "VkGeometryInstanceFlagsKHR" "flags"){bitfield = Just 8}

-- | VkTransformMatrixKHR's matrix.
unit_multiDimArray :: IO ()
unit_multiDimArray =
  declFrom "<m><type>float</type> <name>matrix</name>[3][4]</m>"
    @?~ (plain "float" "matrix"){arrayDims = [DimLit 3, DimLit 4]}

unit_enumDimArray :: IO ()
unit_enumDimArray =
  declFrom "<m><type>uint8_t</type> <name>deviceUUID</name>[<enum>VK_UUID_SIZE</enum>]</m>"
    @?~ (plain "uint8_t" "deviceUUID"){arrayDims = [DimNamespace "VK_UUID_SIZE" noPos]}

-- | VkPhysicalDeviceVulkan11Features members alias their extension-struct
-- feature bits.
unit_nameAlias :: IO ()
unit_nameAlias = do
  declFrom
    "<m><type>VkBool32</type> <name alias=\"VkPhysicalDevice16BitStorageFeatures::storageBuffer16BitAccess\">storageBuffer16BitAccess</name></m>"
    @?~ (plain "VkBool32" "storageBuffer16BitAccess")
      { nameAlias =
          Just
            ( NameAliasPath
                FeaturePath
                  { struct = "VkPhysicalDevice16BitStorageFeatures"
                  , member = "storageBuffer16BitAccess"
                  }
            )
      }
  -- Six VkPhysicalDeviceVulkan12Features members alias whole extensions.
  declFrom
    "<m><type>VkBool32</type> <name alias=\"VK_KHR_sampler_mirror_clamp_to_edge\">samplerMirrorClampToEdge</name></m>"
    @?~ (plain "VkBool32" "samplerMirrorClampToEdge")
      { nameAlias = Just (NameAliasName "VK_KHR_sampler_mirror_clamp_to_edge")
      }

unit_protoPointer :: IO ()
unit_protoPointer =
  declFrom "<proto><type>void</type>* <name>PFN_vkAllocationFunction</name></proto>"
    @?~ (plain "void" "PFN_vkAllocationFunction"){pointers = [PtrLayer False]}

unit_commentDroppedFromRaw :: IO ()
unit_commentDroppedFromRaw = do
  let body = bodyFrom "<m><type>uint32_t</type> <name>x</name><comment>note</comment></m>"
  body.raw @?= "uint32_t x"

unit_rawPreservesWhitespace :: IO ()
unit_rawPreservesWhitespace = do
  let body = bodyFrom "<m>const <type>uint32_t</type>*    <name>pCode</name></m>"
  body.raw @?= "const uint32_t*    pCode"

expectError :: ByteString -> (ErrorKind -> Bool) -> Assertion
expectError bytes check = case declFrom bytes of
  Left (_, kind) -> assertBool ("unexpected kind: " <> show kind) (check kind)
  Right decl -> assertFailure ("expected failure, parsed: " <> show decl)

unit_rejectsUnknownElement :: IO ()
unit_rejectsUnknownElement =
  expectError "<m><type>int</type> <bogus/> <name>x</name></m>" \case
    UnknownElement "bogus" -> True
    _ -> False

unit_rejectsUnknownNameAttr :: IO ()
unit_rejectsUnknownNameAttr =
  expectError "<m><type>int</type> <name evil=\"1\">x</name></m>" \case
    UnknownAttribute "evil" _ -> True
    _ -> False

unit_rejectsStrayIdentifier :: IO ()
unit_rejectsStrayIdentifier =
  expectError "<m>banana <type>int</type> <name>x</name></m>" \case
    MalformedBody msg -> "banana" `T.isInfixOf` msg
    _ -> False

unit_rejectsMissingName :: IO ()
unit_rejectsMissingName =
  expectError "<m><type>int</type>*</m>" \case
    MalformedBody msg -> "missing its <name>" `T.isInfixOf` msg
    _ -> False

unit_rejectsTrailingTokens :: IO ()
unit_rejectsTrailingTokens =
  expectError "<m><type>int</type> <name>x</name> *</m>" \case
    MalformedBody msg -> "end of declaration" `T.isInfixOf` msg
    _ -> False

-- | The whole-registry tripwire: every @\<member\>@, @\<proto\>@, and
-- declaration-shaped @\<param\>@ in the pinned vk.xml must parse. (Params
-- under @\<implicitexternsyncparams\>@ are prose, not declarations.)
unit_pinnedRegistryDeclarationsAllParse :: IO ()
unit_pinnedRegistryDeclarationsAllParse = do
  path <- registryXmlPath
  bytes <- BS.readFile path
  root <- either (assertFailure . show) pure (loadXmlBytes bytes)
  let decls = collect "registry" root
      failures =
        [ (el.pos, err)
        | el <- decls
        , Left err <- [chunksFromNodes el.nodes >>= parseDeclaration . mkMixedBody]
        ]
  assertBool "expected >10k declarations" (length decls > 10_000)
  case failures of
    [] -> pure ()
    ((p, err) : _) ->
      assertFailure
        ( show (length failures)
            <> " declarations failed; first at "
            <> show p
            <> ": "
            <> show err
        )
 where
  collect parent el =
    [ el
    | el.name
        `elem` (["member", "proto"] :: [Text])
        || (el.name == "param" && parent /= ("implicitexternsyncparams" :: Text))
    ]
      <> concat [collect el.name child | XElem child <- el.nodes]

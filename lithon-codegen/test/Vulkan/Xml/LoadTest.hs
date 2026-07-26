{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

-- | The positioned XML loader: tree shape, entity handling, strict
-- rejections, whitespace fidelity, and the full pinned registry.
module Vulkan.Xml.LoadTest (
  unit_xmlDeclarationAccepted,
  unit_smallDocShape,
  unit_positionsReported,
  unit_entityDecoding,
  unit_unknownEntityRejected,
  unit_doctypeRejected,
  unit_instructionRejected,
  unit_duplicateAttributeRejected,
  unit_multipleRootsRejected,
  unit_commentSplitTextMerges,
  unit_cdataFolded,
  unit_whitespacePreserved,
  unit_fullRegistryLoads,
) where

import Data.Map.Strict qualified as Map
import Effectful (runEff)
import Effectful.Resource (runResource)
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Xml.Load (XmlLoadError (..), loadXmlBytes, loadXmlFile)
import Lithon.Codegen.Vulkan.Xml.Types (Pos (..), XElement (..), XNode (..), noPos)
import Vulkan.Support.Paths (registryXmlPath)

-- | Load and erase positions, for shape-only assertions.
loadShape :: ByteString -> Either XmlLoadError XElement
loadShape = fmap stripPos . loadXmlBytes

stripPos :: XElement -> XElement
stripPos el =
  XElement
    { name = el.name
    , attrs = el.attrs
    , nodes = map stripNode el.nodes
    , pos = noPos
    }
 where
  stripNode = \case
    XElem e -> XElem (stripPos e)
    XText t _ -> XText t noPos

elemsIn :: XElement -> Int
elemsIn el = 1 + sum [elemsIn e | XElem e <- el.nodes]

unit_xmlDeclarationAccepted :: IO ()
unit_xmlDeclarationAccepted =
  loadShape "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<a/>"
    @?= Right XElement{name = "a", attrs = Map.empty, nodes = [], pos = noPos}

unit_smallDocShape :: IO ()
unit_smallDocShape =
  loadShape "<a x=\"1\" y=\"2\">t<b inner=\"z\"/></a>"
    @?= Right
      XElement
        { name = "a"
        , attrs = Map.fromList [("x", "1"), ("y", "2")]
        , nodes =
            [ XText "t" noPos
            , XElem XElement{name = "b", attrs = Map.fromList [("inner", "z")], nodes = [], pos = noPos}
            ]
        , pos = noPos
        }

unit_positionsReported :: IO ()
unit_positionsReported =
  case loadXmlBytes "<a>\n  <b/>\n  <c/>\n</a>" of
    Left err -> assertFailure (show err)
    Right root -> do
      root.pos.line @?= 1
      let elemLines = [e.pos.line | XElem e <- root.nodes]
      elemLines @?= [2, 3]
      assertBool
        "columns are 1-based"
        (all (> 0) (root.pos.column : [e.pos.column | XElem e <- root.nodes]))

unit_entityDecoding :: IO ()
unit_entityDecoding =
  loadShape "<a>&lt;&amp;&#x2192;&gt;</a>"
    @?= Right XElement{name = "a", attrs = Map.empty, nodes = [XText "<&\8594>" noPos], pos = noPos}

unit_unknownEntityRejected :: IO ()
unit_unknownEntityRejected =
  assertBool "undefined entity must be rejected" (isLeft (loadXmlBytes "<a>&undefined;</a>"))

unit_doctypeRejected :: IO ()
unit_doctypeRejected = case loadXmlBytes "<!DOCTYPE a>\n<a/>" of
  Left (XmlDoctypeForbidden _) -> pure ()
  Left other -> assertFailure ("expected XmlDoctypeForbidden, got: " <> show other)
  Right _ -> assertFailure "doctype must be rejected"

unit_instructionRejected :: IO ()
unit_instructionRejected = case loadXmlBytes "<a><?target data?></a>" of
  Left (XmlInstructionForbidden _) -> pure ()
  Left other -> assertFailure ("expected XmlInstructionForbidden, got: " <> show other)
  Right _ -> assertFailure "processing instruction must be rejected"

unit_duplicateAttributeRejected :: IO ()
unit_duplicateAttributeRejected =
  assertBool "duplicate attribute must be rejected" (isLeft (loadXmlBytes "<a x=\"1\" x=\"2\"/>"))

unit_multipleRootsRejected :: IO ()
unit_multipleRootsRejected =
  assertBool "second root must be rejected" (isLeft (loadXmlBytes "<a/><b/>"))

unit_commentSplitTextMerges :: IO ()
unit_commentSplitTextMerges =
  loadShape "<a>x<!-- comment -->y</a>"
    @?= Right XElement{name = "a", attrs = Map.empty, nodes = [XText "xy" noPos], pos = noPos}

unit_cdataFolded :: IO ()
unit_cdataFolded =
  loadShape "<a>p<![CDATA[<raw&>]]>q</a>"
    @?= Right XElement{name = "a", attrs = Map.empty, nodes = [XText "p<raw&>q" noPos], pos = noPos}

unit_whitespacePreserved :: IO ()
unit_whitespacePreserved =
  loadShape "<a>\n  <b/>  tail\n</a>"
    @?= Right
      XElement
        { name = "a"
        , attrs = Map.empty
        , nodes =
            [ XText "\n  " noPos
            , XElem XElement{name = "b", attrs = Map.empty, nodes = [], pos = noPos}
            , XText "  tail\n" noPos
            ]
        , pos = noPos
        }

unit_fullRegistryLoads :: IO ()
unit_fullRegistryLoads = do
  path <- registryXmlPath
  result <- runEff (runResource (loadXmlFile path))
  case result of
    Left err -> assertFailure ("vk.xml failed to load: " <> show err)
    Right root -> do
      root.name @?= "registry"
      assertBool "expected >30k elements" (elemsIn root > 30_000)

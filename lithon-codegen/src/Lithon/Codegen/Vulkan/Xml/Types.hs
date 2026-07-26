{-# LANGUAGE OverloadedStrings #-}

-- | A minimal, position-annotated XML tree.
--
-- The Vulkan registry embeds C fragments as mixed content where whitespace is
-- significant, and our strict decoder reports errors with source positions, so
-- neither @Text.XML@'s 'Text.XML.Document' (no positions) nor a
-- whitespace-normalizing tree fits. This tree keeps every text run verbatim
-- and stamps every node with the position reported by the streaming parser.
module Lithon.Codegen.Vulkan.Xml.Types (
  -- * Source positions
  Pos (..),
  noPos,

  -- * Decoder paths
  PathSeg (..),
  XPath (..),
  emptyXPath,
  pushSeg,

  -- * Positioned tree
  XElement (..),
  XNode (..),
) where

import Data.Aeson (ToJSON (toJSON))
import Data.Aeson qualified as Aeson
import Data.Text qualified as T

import Lithon.Codegen.Prelude

-- | 1-based line/column of an open tag or text run. @'Pos' 0 0@ ('noPos') is
-- the sentinel for "position unavailable".
data Pos = Pos
  { line :: !Int
  , column :: !Int
  }
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData)

-- | Encoded compactly as @"line:column"@ so IR dumps stay readable.
instance ToJSON Pos where
  toJSON = Aeson.String . display

noPos :: Pos
noPos = Pos 0 0

instance Display Pos where
  displayBuilder pos
    | pos == noPos = "?:?"
    | otherwise = displayBuilder pos.line <> ":" <> displayBuilder pos.column

-- | One step in a decoder path: element name, 0-based index among the
-- parent's /element/ children, and the @name=@ attribute when present (purely
-- for readability of error messages).
data PathSeg = PathSeg
  { element :: !Text
  , index :: !Int
  , name :: !(Maybe Text)
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Breadcrumbs from the root, innermost segment first.
newtype XPath = XPath [PathSeg]
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

emptyXPath :: XPath
emptyXPath = XPath []

pushSeg :: PathSeg -> XPath -> XPath
pushSeg seg (XPath segs) = XPath (seg : segs)

-- | Rendered outermost-first, e.g.
-- @registry\/types\/type[1051]{VkImageCreateInfo}\/member[3]@.
instance Display XPath where
  displayBuilder = displayBuilder . renderXPath

renderXPath :: XPath -> Text
renderXPath (XPath segs) = T.intercalate "/" (map renderSeg (reverse segs))
 where
  renderSeg s =
    s.element
      <> "["
      <> T.pack (show s.index)
      <> "]"
      <> maybe "" (\n -> "{" <> n <> "}") s.name

-- | An element with its attributes, children in document order, and the
-- position of its open tag. vk.xml uses no XML namespaces; names are plain
-- local names (the loader rejects anything namespaced).
data XElement = XElement
  { name :: !Text
  , attrs :: !(Map Text Text)
  , nodes :: ![XNode]
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)

-- | Child nodes. Text runs are verbatim (no whitespace normalization, which
-- mixed-content C fragments rely on); adjacent runs are merged by the loader.
-- XML comments and processing instructions never reach this tree.
data XNode
  = XElem !XElement
  | XText !Text !Pos
  deriving stock (Eq, Generic, Show)

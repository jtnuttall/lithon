{-# LANGUAGE OverloadedStrings #-}

-- | The @externsync=@ attribute grammar.
--
-- Observed forms in the pinned registry: @true@ (378×), @maybe@ (22×), a
-- parameter path (@pNameInfo->objectHandle@), and @maybe:@-prefixed paths
-- with array markers (@maybe:pDescriptorWrites[].dstSet@). Paths may join
-- segments with @->@ or @.@; both normalize to the same segment list (the
-- raw text is preserved by the 'Lithon.Codegen.Vulkan.Registry.Micro.Common.Raw'
-- wrapper at every use site).
module Lithon.Codegen.Vulkan.Registry.Micro.ExternSync (
  SyncSeg (..),
  SyncPath (..),
  ExternSync (..),
  parseExternSync,
) where

import Data.Aeson (ToJSON)
import Data.List.NonEmpty qualified as NE
import Data.Text qualified as T
import Lithon.Prelude
import Text.Megaparsec (eof, sepBy1, try)
import Text.Megaparsec.Char (char, string)

import Lithon.Codegen.Vulkan.Registry.Micro.Common (P, identifier, viaMegaparsec)

-- | One path segment; 'indexed' marks a @[]@ suffix (element-wise sync).
data SyncSeg = SyncSeg
  { field :: !Text
  , indexed :: !Bool
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

newtype SyncPath = SyncPath (NonEmpty SyncSeg)
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ExternSync
  = SyncTrue
  | SyncMaybe
  | SyncParams !(NonEmpty SyncPath)
  | SyncMaybeParams !(NonEmpty SyncPath)
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

parseExternSync :: Text -> Either Text ExternSync
parseExternSync = viaMegaparsec externSyncP

externSyncP :: P ExternSync
externSyncP =
  try (SyncTrue <$ string "true" <* eof)
    <|> try (string "maybe" *> maybeTail)
    <|> (SyncParams <$> pathsP)
 where
  maybeTail =
    (SyncMaybeParams <$> (char ':' *> pathsP))
      <|> (SyncMaybe <$ eof)

pathsP :: P (NonEmpty SyncPath)
pathsP = NE.fromList <$> sepBy1 pathP (char ',')

pathP :: P SyncPath
pathP = SyncPath . NE.fromList <$> sepBy1 segP joint
 where
  joint = void (string "->") <|> void (char '.')
  segP = do
    field <- identifier
    indexed <- (True <$ string "[]") <|> pure False
    pure SyncSeg{field, indexed}

-- | Canonical rendering (segments joined with @.@). Two source spellings can
-- normalize to one value; AST round-trips hold, textual ones need 'Raw'.
instance Display ExternSync where
  displayBuilder = displayBuilder . renderExternSync

renderExternSync :: ExternSync -> Text
renderExternSync = \case
  SyncTrue -> "true"
  SyncMaybe -> "maybe"
  SyncParams paths -> renderPaths paths
  SyncMaybeParams paths -> "maybe:" <> renderPaths paths
 where
  renderPaths paths = T.intercalate "," (map renderPath (NE.toList paths))
  renderPath (SyncPath segs) = T.intercalate "." (map renderSeg (NE.toList segs))
  renderSeg seg = seg.field <> (if seg.indexed then "[]" else "")

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Reading availability out of a library's own documentation: the
-- doxygen @\\since@ section of a declaration and the \"(added in
-- X.Y.Z)\" prose note of a member — SDL's two conventions. A target whose
-- docs state availability wires these into its
-- 'Lithon.Codegen.Sys.Target.VersionScheme'; the empirical registry
-- ("Lithon.Codegen.Sys.Versions") corrects them either way.
module Lithon.Codegen.Sys.Version.Doc (
  declSince,
  fieldSince,
  addedInSince,
  versionToken,
  parseSince,
) where

import Data.Char (isDigit)
import Data.Text qualified as T
import Doxygen.Parser.Types qualified as Doxy
import Lithon.HsBindgen.C qualified as C
import Lithon.Prelude

import Lithon.Codegen.Sys.Version (AbiSince (..))

-- | The declaration's @\@since@ version, mirroring the vendored haddock
-- backend's extraction: the first version-shaped token of the doxygen
-- @\\since@ section ("This function is available since SDL 3.2.0.").
-- A target wires it in as its 'Lithon.Codegen.Sys.Target.VersionScheme'
-- decl reader; the wrapper version gates ("Lithon.Codegen.Sys.Chain")
-- and the assert TU correct it through the same registry.
declSince :: C.DeclInfo C.Final -> Maybe AbiSince
declSince info = do
  comment <- info.comment
  safeHead
    [ v
    | Doxy.SimpleSect Doxy.SSSince inner <- comment.doxygen.detailed
    , Just v <- [versionToken (blockText inner)]
    ]

-- | A member's availability from its own doxygen comment: SDL's prose
-- convention for a late member is \"(added in 3.4.16)\" in the
-- @\/**< ... *\/@ trailing its declaration (fields never carry a
-- @\\since@ section). The registry wins over it
-- ('Lithon.Codegen.Sys.Abi.distillAbi').
fieldSince :: C.FieldInfo C.Final -> Maybe AbiSince
fieldSince info = do
  comment <- info.comment
  addedInSince (inlineText comment.doxygen.brief <> " " <> blockText comment.doxygen.detailed)

-- | The version named by the first \"added in\" phrase in prose,
-- case-insensitive, an intervening \"SDL\" word tolerated.
addedInSince :: Text -> Maybe AbiSince
addedInSince prose = do
  let (_, hit) = T.breakOn marker (T.toLower prose)
  guard (not (T.null hit))
  w <- safeHead (dropSdl (T.words (T.drop (T.length marker) hit)))
  parseSince w
 where
  marker = "added in "
  dropSdl = \case
    ("sdl" : rest) -> rest
    ws -> ws

-- | The first version-shaped word in prose ("SDL 3.2.0." -> 3.2.0).
versionToken :: Text -> Maybe AbiSince
versionToken = safeHead . mapMaybe parseSince . T.words

-- | One word as a version: two or three dot-separated digit groups, a
-- trailing run of sentence punctuation tolerated ("3.4.16)." -> 3.4.16).
-- Two groups mean patch 0.
parseSince :: Text -> Maybe AbiSince
parseSince w
  | all (\g -> not (T.null g) && T.all isDigit g) groups =
      case traverse (readMaybe . toString) groups of
        Just [major, minor] -> Just AbiSince{major, minor, patch = 0}
        Just [major, minor, patch] -> Just AbiSince{major, minor, patch}
        _malformed -> Nothing
  | otherwise = Nothing
 where
  groups = T.splitOn "." (T.dropWhileEnd (`elem` (".,;:)" :: String)) w)

-- | The plain text of a doxygen paragraph list (paragraphs only).
blockText :: [Doxy.Block r] -> Text
blockText blocks = T.strip (T.unwords [inlineText inlines | Doxy.Paragraph inlines <- blocks])

-- | The display text of doxygen inlines, markup flattened.
inlineText :: [Doxy.Inline r] -> Text
inlineText =
  T.concat . map \case
    Doxy.Text t -> t
    Doxy.Bold is -> inlineText is
    Doxy.Emph is -> inlineText is
    Doxy.Mono is -> inlineText is
    Doxy.Ref _ t -> t
    Doxy.Anchor _ -> ""
    Doxy.Link is _ -> inlineText is

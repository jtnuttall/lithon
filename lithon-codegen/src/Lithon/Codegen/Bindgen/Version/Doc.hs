{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Reading availability out of a library's own documentation: the
-- doxygen @\\since@ section of a declaration and the \"(added in
-- X.Y.Z)\" prose note of a member — SDL's two conventions. A target whose
-- docs state availability wires these into its
-- 'Lithon.Codegen.Bindgen.Target.VersionScheme', at its arity; the empirical
-- registry ("Lithon.Codegen.Bindgen.Versions") corrects them either way.
module Lithon.Codegen.Bindgen.Version.Doc (
  doxygenSince,
  addedInNote,
  addedInProse,
  versionToken,
  parseVersionProse,
) where

import Data.Char (isDigit)
import Data.Text qualified as T
import Doxygen.Parser.Types qualified as Doxy
import Lithon.HsBindgen.C qualified as C
import Lithon.Prelude

import Lithon.Codegen.Bindgen.Version (Version, mkVersion)

-- | The declaration's @\@since@ version, mirroring the vendored haddock
-- backend's extraction: the first version-shaped token of the doxygen
-- @\\since@ section ("This function is available since SDL 3.2.0.").
-- A target wires it in as its 'Lithon.Codegen.Bindgen.Target.VersionScheme'
-- decl reader; the wrapper version gates
-- ("Lithon.Codegen.Bindgen.Versions.Guards") and the assert TU correct it
-- through the same registry.
doxygenSince :: Int -> C.DeclInfo C.Final -> Maybe Version
doxygenSince arity info = do
  comment <- info.comment
  safeHead
    [ v
    | Doxy.SimpleSect Doxy.SSSince inner <- comment.doxygen.detailed
    , Just v <- [versionToken arity (blockText inner)]
    ]

-- | A member's availability from its own doxygen comment: SDL's prose
-- convention for a late member is \"(added in 3.4.16)\" in the
-- @\/**< ... *\/@ trailing its declaration (fields never carry a
-- @\\since@ section). The given words may stand between \"added in\"
-- and the version (SDL: @[\"sdl\"]@). The registry wins over it
-- ('Lithon.Codegen.Bindgen.Abi.distillAbi').
addedInNote :: Int -> [Text] -> C.FieldInfo C.Final -> Maybe Version
addedInNote arity skipped info = do
  comment <- info.comment
  addedInProse
    arity
    skipped
    (inlineText comment.doxygen.brief <> " " <> blockText comment.doxygen.detailed)

-- | The version named by the first \"added in\" phrase in prose,
-- case-insensitive, a run of the given words tolerated before it.
addedInProse :: Int -> [Text] -> Text -> Maybe Version
addedInProse arity skipped prose = do
  let (_, hit) = T.breakOn marker (T.toLower prose)
  guard (not (T.null hit))
  w <- safeHead (dropWhile (`elem` skippedLower) (T.words (T.drop (T.length marker) hit)))
  parseVersionProse arity w
 where
  marker = "added in "
  skippedLower = map T.toLower skipped

-- | The first version-shaped word in prose ("SDL 3.2.0." -> 3.2.0).
versionToken :: Int -> Text -> Maybe Version
versionToken arity = safeHead . mapMaybe (parseVersionProse arity) . T.words

-- | One word as a version of the given arity: @min 2 arity@ to @arity@
-- dot-separated digit groups, a trailing run of sentence punctuation
-- tolerated ("3.4.16)." -> 3.4.16). Missing trailing groups are zero (at
-- arity 3, "3.4" -> 3.4.0).
parseVersionProse :: Int -> Text -> Maybe Version
parseVersionProse arity w = do
  guard (all (\g -> not (T.null g) && T.all isDigit g) groups)
  parts <- traverse (readMaybe . toString) groups
  let n = length parts
  guard (n >= min 2 arity && n <= arity)
  case parts <> replicate (arity - n) 0 of
    p : ps -> Just (mkVersion (p :| ps))
    [] -> Nothing
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

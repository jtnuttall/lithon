{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}

-- | The final C IR: declarations, types, and their identifiers, plus
-- lithon's own readers of a comment's doxygen prose.
--
-- Explicit entity-level surface (no module re-exports): exactly what the
-- lithon emitters consume, grouped by origin. Extend deliberately; every
-- addition widens the vendor-API footprint this seam exists to bound.
module Lithon.HsBindgen.C (
  -- * Declarations ("HsBindgen.IR.C")
  Comment,
  Decl (..),
  DeclInfo (..),
  DeclKind (..),
  Enum (..),
  EnumConstant (..),
  RegularField (..),
  Field (..),
  FieldInfo (..),
  Function (..),
  FunctionArg (..),
  Struct (..),
  Union (..),
  Type,
  TypeF (..),
  TypeFunArgF (..),

  -- * Names ("HsBindgen.IR.C")
  DeclId (..),
  DeclName (..),
  ScopedName (..),
  renderDeclNameC,

  -- * Final-pass vocabulary ("HsBindgen.Frontend.Pass.Final")
  Final,
  DeclIdPair (..),
  ScopedNamePair (..),

  -- * Type translation ("HsBindgen.IR.Translation")
  getCanonicalType,
  -- 1.0 decls carry @typ :: Types p@ = @TranslatedTypes {c, hs}@; @.c@ needs the field in scope.
  TranslatedTypes (..),

  -- * Doxygen prose readers (lithon-owned)
  sinceSections,
  commentProse,
) where

import Data.Text (Text)
import Data.Text qualified as T
import Doxygen.Parser.Types qualified as Doxy
import HsBindgen.Frontend.Pass.Final (Final)
import HsBindgen.IR.C (
  Comment (..),
  Decl (..),
  DeclId (..),
  DeclInfo (..),
  DeclKind (..),
  DeclName (..),
  Enum (..),
  EnumConstant (..),
  Field (..),
  FieldInfo (..),
  Function (..),
  FunctionArg (..),
  RegularField (..),
  ScopedName (..),
  Struct (..),
  Type,
  TypeF (..),
  TypeFunArgF (..),
  Union (..),
  getCanonicalType,
  renderDeclNameC,
 )
import HsBindgen.IR.Translation (DeclIdPair (..), ScopedNamePair (..), TranslatedTypes (..))
import Prelude hiding (Enum)

{-------------------------------------------------------------------------------
  Doxygen prose
-------------------------------------------------------------------------------}

-- | The text of each of a comment's doxygen @\\since@ sections (\"This
-- function is available since SDL 3.2.0.\"), in document order: one entry per
-- section, its paragraphs flattened and joined by a space; @[]@ without one.
-- All of them, not just the first: a reader taking the first version-shaped
-- word must still find one that a later section names. A section with no text
-- keeps its (empty) entry; callers filter.
sinceSections :: Comment Final -> [Text]
sinceSections c = [blockText inner | Doxy.SimpleSect Doxy.SSSince inner <- c.doxygen.detailed]

-- | A comment's prose as one text: the brief description, then the detailed
-- paragraphs, markup flattened and surrounding whitespace trimmed.
commentProse :: Comment Final -> Text
commentProse c =
  T.strip (inlineText c.doxygen.brief <> " " <> blockText c.doxygen.detailed)

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

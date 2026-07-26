-- | The translated Haddock comment AST attached to generated declarations.
--
-- Explicit entity-level surface (no module re-exports): exactly what the
-- lithon emitters consume. Extend deliberately.
module Lithon.HsBindgen.HsDoc (
  Comment (..),
  CommentBlockContent (..),
  CommentInlineContent (..),
  HeaderLevel (..),
) where

import HsBindgen.Backend.Hs.Haddock.Documentation (
  Comment (..),
  CommentBlockContent (..),
  CommentInlineContent (..),
  HeaderLevel (..),
 )

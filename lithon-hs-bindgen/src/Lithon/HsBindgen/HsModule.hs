{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | Module assembly and rendering: build an 'HsModule' out of 'SDecl's
-- ('authoredModule') and render it in hs-bindgen's generated style.
-- Consumed by the alias layer, which authors its own modules; the
-- bindgen-rendered path goes through "Lithon.HsBindgen.Invoke" \/
-- "Lithon.HsBindgen.Transform" instead.
--
-- 'HsModule' itself is abstract: consumers build one with 'authoredModule'
-- and 'render' it.
--
-- Explicit entity-level surface (no module re-exports). Extend
-- deliberately.
module Lithon.HsBindgen.HsModule (
  AuthoredModule (..),
  ExportEntry (..),
  ExportItem (..),
  GhcPragma (..),
  HsModule,
  ImportListItem (..),
  authoredModule,
  render,
  resolveImports,
  resolvePragmas,
) where

import HsBindgen.Backend.Hs.Haddock.Documentation qualified as HsDoc
import HsBindgen.Backend.HsModule.Render (render)
import HsBindgen.Backend.HsModule.Translation (
  ExportEntry (..),
  ExportItem (..),
  GhcPragma (..),
  HsModule (..),
  ImportListItem (..),
  resolveImports,
  resolvePragmas,
 )
import HsBindgen.Backend.SHs.AST (SDecl)
import HsBindgen.Config.Prelims (QualifiedStyle (PreQualified))
import HsBindgen.Language.Haskell (ModuleName)

-- | A module the alias layer authors itself, as opposed to one hs-bindgen
-- translates from a header. It has no C wrappers and no root directives;
-- 'authoredModule' fills those vendor-only fields, so a new 'HsModule' field
-- breaks this module and not the alias layer.
data AuthoredModule = AuthoredModule
  { name :: ModuleName
  , pragmas :: [GhcPragma]
  , moduleComment :: Maybe HsDoc.Comment
  -- ^ Rendered between the pragmas and the @module@ line.
  , exports :: [ExportEntry]
  , imports :: [ImportListItem]
  , decls :: [SDecl]
  }

-- | The renderable module: prepositive @import qualified@ imports, no C
-- wrappers, no root directives. The 'PreQualified' style it fixes must agree
-- with the pragmas the caller resolves: the alias layer passes 'PreQualified'
-- to 'resolvePragmas', and @PostQualified@ would need @ImportQualifiedPost@.
authoredModule :: AuthoredModule -> HsModule
authoredModule m =
  HsModule
    { pragmas = m.pragmas
    , moduleComment = m.moduleComment
    , name = m.name
    , exports = m.exports
    , imports = m.imports
    , qualifiedStyle = PreQualified
    , rootDirectives = []
    , cWrappers = []
    , decls = m.decls
    }

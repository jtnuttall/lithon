{-# LANGUAGE DuplicateRecordFields #-}

-- | Module assembly and rendering: build an 'HsModule' out of 'SDecl's and
-- render it in hs-bindgen's generated style. Consumed by the alias layer,
-- which authors its own modules; the bindgen-rendered path goes through
-- "Lithon.HsBindgen.Invoke" \/ "Lithon.HsBindgen.Transform" instead.
--
-- Explicit entity-level surface (no module re-exports). Extend
-- deliberately.
module Lithon.HsBindgen.HsModule (
  ExportEntry (..),
  ExportItem (..),
  GhcPragma (..),
  HsModule (..),
  ImportListItem (..),
  render,
  resolveImports,
  resolvePragmas,
) where

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

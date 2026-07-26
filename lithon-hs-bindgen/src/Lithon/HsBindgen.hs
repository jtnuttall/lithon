-- | Curated hs-bindgen surface for lithon.
--
-- Only modules in this package may import @HsBindgen.*@, and
-- @lithon-hs-bindgen@ is the only lithon package that may build-depend on
-- @hs-bindgen@ — the seam is enforced by cabal, not convention.
--
-- This module is the flat, unqualified surface. The AST surfaces consumed
-- by the sdl3 alias emitter clash by design (@Decl@ lives in both the C and
-- Haskell IRs) and live in sibling facades intended for qualified import.
--
-- Surface map:
--
-- * "Lithon.HsBindgen.Invoke" — the rewrap boundary: lithon-owned
--   invocation records ('InvocationEnv' \/ 'InvocationSpec'),
--   'runBindgen', and the 'BindgenM' operations. hs-bindgen's own
--   orchestration vocabulary stays behind it.
-- * "Lithon.HsBindgen.Transform" — AST-level passes over translated
--   modules ('StubEdit', the rendered-text escape hatch), replacing
--   post-render text surgery.
-- * Category \/ naming vocabulary (explicit entity re-exports): the
--   module-split categories and the naming knobs the alias layer feeds
--   to module assembly.
module Lithon.HsBindgen (
  module Lithon.HsBindgen.Invoke,
  module Lithon.HsBindgen.Transform,

  -- * Categories ("HsBindgen.Backend.Category")
  ByCategory (..),
  ByCategory_ (..),
  Category (..),
  TermCategory (..),

  -- * Naming and rendering knobs ("HsBindgen.Config.Prelims")
  BaseModuleName (..),
  FieldNamingStrategy (..),
  ModuleRenderConfig (..),
  QualifiedStyle (..),
) where

import HsBindgen.Backend.Category (ByCategory (..), ByCategory_ (..), Category (..), TermCategory (..))
import HsBindgen.Config.Prelims (
  BaseModuleName (..),
  FieldNamingStrategy (..),
  ModuleRenderConfig (..),
  QualifiedStyle (..),
 )
import Lithon.HsBindgen.Invoke
import Lithon.HsBindgen.Transform

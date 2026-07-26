{-# LANGUAGE DuplicateRecordFields #-}

-- | The translated Haskell declaration AST and Haskell-side names.
--
-- Explicit entity-level surface (no module re-exports): exactly what the
-- lithon emitters consume. Extend deliberately.
module Lithon.HsBindgen.Hs (
  -- * Declarations ("HsBindgen.Backend.Hs.AST")
  Decl (..),
  FunctionDecl (..),
  FunctionParameter (..),
  Newtype (..),
  PatSyn (..),

  -- * Names ("HsBindgen.Backend.Hs.Name" \/ "HsBindgen.Language.Haskell")
  ExtRef (..),
  Import (..),
  ModuleName (..),
  Name (..),
  SomeName (..),
  TermName (..),
  termNameToText,
) where

import HsBindgen.Backend.Hs.AST (
  Decl (..),
  FunctionDecl (..),
  FunctionParameter (..),
  Newtype (..),
  PatSyn (..),
 )
import HsBindgen.Backend.Hs.Name (TermName (..), termNameToText)
import HsBindgen.Language.Haskell (ExtRef (..), Import (..), ModuleName (..), Name (..), SomeName (..))

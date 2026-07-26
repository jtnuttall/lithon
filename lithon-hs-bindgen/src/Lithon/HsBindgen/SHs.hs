{-# LANGUAGE DuplicateRecordFields #-}

-- | The simplified Haskell AST (the final pre-render representation) and
-- its global-symbol vocabulary.
--
-- The @DeBruijn@ re-exports are the index\/environment vocabulary needed to
-- build 'ELam' bodies (the alias layer's scalar-bridge wrappers): 'IZ'\/'IS'
-- for bound-variable references, 'Env'\/@(:>)@ for the environment threading
-- used by n-ary lambda builders.
--
-- Explicit entity-level surface (no module re-exports): exactly what the
-- lithon emitters consume. Extend deliberately.
module Lithon.HsBindgen.SHs (
  -- * De Bruijn vocabulary ("DeBruijn")
  Env (..),
  Idx (..),
  lookupEnv,

  -- * Simplified declarations ("HsBindgen.Backend.SHs.AST")
  Binding (..),
  ClosedExpr,
  Parameter (..),
  Result (..),
  SDecl (..),
  SExpr (..),
  SType (..),

  -- * Globals ("HsBindgen.Backend.Global" \/ "HsBindgen.Backend.Level")
  BindgenGlobalTerm (..),
  BindgenGlobalType (..),
  Global (..),
  GlobalCat (..),
  Level (..),
  bindgenGlobalType,
  eBindgenGlobal,
  tBindgenGlobal,

  -- * Name hints ("HsBindgen.NameHint")
  NameHint (..),

  -- * Translation ("HsBindgen.Backend.SHs.Translation")
  translateType,
) where

import DeBruijn (Env (..), Idx (..), lookupEnv)
import HsBindgen.Backend.Global (
  BindgenGlobalTerm (..),
  BindgenGlobalType (..),
  Global (..),
  GlobalCat (..),
  bindgenGlobalType,
 )
import HsBindgen.Backend.Level (Level (..))
import HsBindgen.Backend.SHs.AST (
  Binding (..),
  ClosedExpr,
  Parameter (..),
  Result (..),
  SDecl (..),
  SExpr (..),
  SType (..),
  eBindgenGlobal,
  tBindgenGlobal,
 )
import HsBindgen.Backend.SHs.Translation (translateType)
import HsBindgen.NameHint (NameHint (..))

{-# LANGUAGE DuplicateRecordFields #-}

-- | The final C IR: declarations, types, and their identifiers.
--
-- Explicit entity-level surface (no module re-exports): exactly what the
-- lithon emitters consume, grouped by origin. Extend deliberately; every
-- addition widens the vendor-API footprint this seam exists to bound.
module Lithon.HsBindgen.C (
  -- * Declarations ("HsBindgen.IR.C")
  Comment (..),
  Decl (..),
  DeclInfo (..),
  DeclKind (..),
  Enum (..),
  EnumConstant (..),
  ExplicitField (..),
  Field (..),
  FieldInfo (..),
  Function (..),
  FunctionArg (..),
  Struct (..),
  Union (..),
  TypeF (..),
  TypeFunArgF (..),

  -- * Names ("HsBindgen.IR.C")
  DeclId (..),
  DeclName (..),
  ScopedName (..),
  renderDeclNameC,

  -- * Final-pass vocabulary ("HsBindgen.Frontend.Pass.Final")
  Final (..),
  DeclIdPair (..),
  ScopedNamePair (..),

  -- * Type translation ("HsBindgen.IR.Translation")
  getCanonicalType,
) where

import Prelude hiding (Enum)

import HsBindgen.Frontend.Pass.Final (Final (..))
import HsBindgen.IR.C (
  Comment (..),
  getCanonicalType,
  Decl (..),
  DeclId (..),
  DeclInfo (..),
  DeclKind (..),
  DeclName (..),
  Enum (..),
  EnumConstant (..),
  ExplicitField (..),
  Field (..),
  FieldInfo (..),
  Function (..),
  FunctionArg (..),
  ScopedName (..),
  Struct (..),
  TypeF (..),
  TypeFunArgF (..),
  Union (..),
  renderDeclNameC,
 )
import HsBindgen.IR.Translation (DeclIdPair (..), ScopedNamePair (..))

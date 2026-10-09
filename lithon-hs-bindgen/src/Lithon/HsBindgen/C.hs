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
) where

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

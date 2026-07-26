-- | Bridge vocabulary for the curated layer: C99 bool conversions and
-- the C enum classes, curated from the vendored hs-bindgen runtime.
--
-- Struct fields deliberately keep their C types (a keyboard event's
-- @repeat@ field is a @CBool@; a rect's @x@ is a C @int@); 'toBool'
-- bridges the bool case, and plain 'Prelude.fromIntegral' or
-- 'Data.Coerce.coerce' the fixed-width integer typedefs. The full
-- runtime surface — including the lifted 'Prelude'-shadowing
-- combinators these exports leave behind — stays available under
-- "SDL3.Sys.Bindgen.Runtime" and its submodules.
module SDL3.Sys.Runtime (
  -- * C99 bool
  CBool.toBool,
  CBool.fromBool,
  CBool.true,
  CBool.false,
  CBool.isTrue,
  CBool.isFalse,

  -- * C enums
  CEnum.CEnum (CEnumZ, toCEnum, fromCEnum, isDeclared, mkDeclared, declaredValues),
  CEnum.SequentialCEnum (minDeclaredValue, maxDeclaredValue),
  CEnum.getNames,
) where

import SDL3.Sys.Bindgen.Runtime.CBool qualified as CBool
import SDL3.Sys.Bindgen.Runtime.CEnum qualified as CEnum

-- | Bridge vocabulary for the curated layer: C99 bool conversions and
-- the C enum classes, curated from the vendored hs-bindgen runtime.
--
-- Struct fields deliberately keep their C types (an event's @error@
-- field is a C @int@; its @event_id@ is the @Mpv_event_id@ enum
-- newtype); plain 'Prelude.fromIntegral' converts the integers, and
-- 'fromCEnum' and 'toCEnum' the enums. libmpv's flags are C @int@s,
-- not C99 bools. The full runtime surface — including the lifted
-- 'Prelude'-shadowing combinators these exports leave behind — stays
-- available under "Mpv.Sys.Bindgen.Runtime" and its submodules.
module Mpv.Sys.Runtime (
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

import Mpv.Sys.Bindgen.Runtime.CBool qualified as CBool
import Mpv.Sys.Bindgen.Runtime.CEnum qualified as CEnum

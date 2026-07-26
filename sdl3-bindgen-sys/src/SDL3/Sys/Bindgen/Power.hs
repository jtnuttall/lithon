{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | SDL power management routines.
--
--     There is a single function in this category: @SDL_GetPowerInfo()@.
--
--     This function is useful for games on the go. This allows an app to know if it\'s running on a draining battery, which can be useful if the app wants to reduce processing, or perhaps framerate, to extend the duration of the battery\'s charge. Perhaps the app just wants to show a battery meter when fullscreen, or alert the user when the power is getting extremely low, so they can save their game. The basic state for the system\'s power supply.
--
--     These are results returned by @SDL_GetPowerInfo()@.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Power (
  SDL3.Sys.Bindgen.Power.SDL_PowerState (..),
  pattern SDL3.Sys.Bindgen.Power.SDL_POWERSTATE_ERROR,
  pattern SDL3.Sys.Bindgen.Power.SDL_POWERSTATE_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Power.SDL_POWERSTATE_ON_BATTERY,
  pattern SDL3.Sys.Bindgen.Power.SDL_POWERSTATE_NO_BATTERY,
  pattern SDL3.Sys.Bindgen.Power.SDL_POWERSTATE_CHARGING,
  pattern SDL3.Sys.Bindgen.Power.SDL_POWERSTATE_CHARGED,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @enum SDL_PowerState@, defined at @SDL3\/SDL_power.h 56:14@
newtype SDL_PowerState = SDL_PowerState
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_PowerState where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_PowerState where
  readRaw =
    \ptr0 ->
      pure SDL_PowerState
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_PowerState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PowerState unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_PowerState instance BG.Storable SDL_PowerState

deriving via BG.CInt instance BG.Prim SDL_PowerState

instance CEnum.CEnum SDL_PowerState where
  type CEnumZ SDL_PowerState = BG.CInt

  toCEnum = SDL_PowerState

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (-1, BG.singleton "SDL_POWERSTATE_ERROR")
        , (0, BG.singleton "SDL_POWERSTATE_UNKNOWN")
        , (1, BG.singleton "SDL_POWERSTATE_ON_BATTERY")
        , (2, BG.singleton "SDL_POWERSTATE_NO_BATTERY")
        , (3, BG.singleton "SDL_POWERSTATE_CHARGING")
        , (4, BG.singleton "SDL_POWERSTATE_CHARGED")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_PowerState"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_PowerState"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_PowerState where
  minDeclaredValue = SDL_POWERSTATE_ERROR

  maxDeclaredValue = SDL_POWERSTATE_CHARGED

instance Show SDL_PowerState where
  showsPrec = CEnum.shows

instance Read SDL_PowerState where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_PowerState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PowerState{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_PowerState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_PowerState "unwrap" where
  type CFieldType SDL_PowerState "unwrap" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | error determining power status
--
--     [C declaration]: @SDL_POWERSTATE_ERROR@, defined at @SDL3\/SDL_power.h 58:5@
pattern SDL_POWERSTATE_ERROR :: SDL_PowerState
pattern SDL_POWERSTATE_ERROR = SDL_PowerState (-1)

-- | cannot determine power status
--
--     [C declaration]: @SDL_POWERSTATE_UNKNOWN@, defined at @SDL3\/SDL_power.h 59:5@
pattern SDL_POWERSTATE_UNKNOWN :: SDL_PowerState
pattern SDL_POWERSTATE_UNKNOWN = SDL_PowerState 0

-- | Not plugged in, running on the battery
--
--     [C declaration]: @SDL_POWERSTATE_ON_BATTERY@, defined at @SDL3\/SDL_power.h 60:5@
pattern SDL_POWERSTATE_ON_BATTERY :: SDL_PowerState
pattern SDL_POWERSTATE_ON_BATTERY = SDL_PowerState 1

-- | Plugged in, no battery available
--
--     [C declaration]: @SDL_POWERSTATE_NO_BATTERY@, defined at @SDL3\/SDL_power.h 61:5@
pattern SDL_POWERSTATE_NO_BATTERY :: SDL_PowerState
pattern SDL_POWERSTATE_NO_BATTERY = SDL_PowerState 2

-- | Plugged in, charging battery
--
--     [C declaration]: @SDL_POWERSTATE_CHARGING@, defined at @SDL3\/SDL_power.h 62:5@
pattern SDL_POWERSTATE_CHARGING :: SDL_PowerState
pattern SDL_POWERSTATE_CHARGING = SDL_PowerState 3

-- | Plugged in, battery charged
--
--     [C declaration]: @SDL_POWERSTATE_CHARGED@, defined at @SDL3\/SDL_power.h 63:5@
pattern SDL_POWERSTATE_CHARGED :: SDL_PowerState
pattern SDL_POWERSTATE_CHARGED = SDL_PowerState 4

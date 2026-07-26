{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExplicitForAll #-}
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

-- | SDL joystick support.
--
--     This is the lower-level joystick handling. If you want the simpler option, where what each button does is well-defined, you should use the gamepad API instead.
--
--     The term \"instance_id\" is the current instantiation of a joystick device in the system. If the joystick is removed and then re-inserted then it will get a new instance_id. instance_id\'s are monotonically increasing identifiers of a joystick plugged in.
--
--     The term \"player_index\" is the number assigned to a player on a specific controller. For XInput controllers this returns the XInput user index. Many joysticks will not be able to supply this information.
--
--     SDL_GUID is used as a stable 128-bit identifier for a joystick device that does not change over time. It identifies class of the device (a X360 wired controller for example). This identifier is platform dependent.
--
--     In order to use these functions, SDL_Init() must have been called with the SDL_INIT_JOYSTICK flag. This causes SDL to scan the system for joysticks, and load appropriate drivers.
--
--     If you would like to receive joystick updates while the application is in the background, you should set the following hint before calling SDL_Init(): SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS
--
--     SDL can provide virtual joysticks as well: the app defines an imaginary controller with @SDL_AttachVirtualJoystick()@, and then can provide inputs for it via @SDL_SetJoystickVirtualAxis()@, @SDL_SetJoystickVirtualButton()@, etc. As this data is supplied, it will look like a normal joystick to SDL, just not backed by a hardware driver. This has been used to make unusual devices, like VR headset controllers, look like normal joysticks, or provide recording\/playback of game inputs, etc. The joystick structure used to identify an SDL joystick.
--
--     This is opaque data.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Joystick (
  SDL3.Sys.Bindgen.Joystick.SDL_Joystick,
  SDL3.Sys.Bindgen.Joystick.SDL_JoystickID (..),
  SDL3.Sys.Bindgen.Joystick.SDL_JoystickType (..),
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_TYPE_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_TYPE_GAMEPAD,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_TYPE_WHEEL,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_TYPE_ARCADE_STICK,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_TYPE_FLIGHT_STICK,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_TYPE_DANCE_PAD,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_TYPE_GUITAR,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_TYPE_DRUM_KIT,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_TYPE_ARCADE_PAD,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_TYPE_THROTTLE,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_TYPE_COUNT,
  SDL3.Sys.Bindgen.Joystick.SDL_JoystickConnectionState (..),
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_CONNECTION_INVALID,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_CONNECTION_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_CONNECTION_WIRED,
  pattern SDL3.Sys.Bindgen.Joystick.SDL_JOYSTICK_CONNECTION_WIRELESS,
  SDL3.Sys.Bindgen.Joystick.sDL_JOYSTICK_AXIS_MAX,
  SDL3.Sys.Bindgen.Joystick.sDL_JOYSTICK_AXIS_MIN,
  SDL3.Sys.Bindgen.Joystick.SDL_VirtualJoystickTouchpadDesc (..),
  SDL3.Sys.Bindgen.Joystick.SDL_VirtualJoystickSensorDesc (..),
  SDL3.Sys.Bindgen.Joystick.SDL_VirtualJoystickDesc (..),
  SDL3.Sys.Bindgen.Joystick.sDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN,
  SDL3.Sys.Bindgen.Joystick.sDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN,
  SDL3.Sys.Bindgen.Joystick.sDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN,
  SDL3.Sys.Bindgen.Joystick.sDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN,
  SDL3.Sys.Bindgen.Joystick.sDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN,
  SDL3.Sys.Bindgen.Joystick.sDL_HAT_CENTERED,
  SDL3.Sys.Bindgen.Joystick.sDL_HAT_UP,
  SDL3.Sys.Bindgen.Joystick.sDL_HAT_RIGHT,
  SDL3.Sys.Bindgen.Joystick.sDL_HAT_DOWN,
  SDL3.Sys.Bindgen.Joystick.sDL_HAT_LEFT,
  SDL3.Sys.Bindgen.Joystick.sDL_HAT_RIGHTUP,
  SDL3.Sys.Bindgen.Joystick.sDL_HAT_RIGHTDOWN,
  SDL3.Sys.Bindgen.Joystick.sDL_HAT_LEFTUP,
  SDL3.Sys.Bindgen.Joystick.sDL_HAT_LEFTDOWN,
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.ConstantArray qualified as CA
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Sensor qualified
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @struct SDL_Joystick@, defined at @SDL3\/SDL_joystick.h 94:16@
data SDL_Joystick

-- | This is a unique ID for a joystick for the time it is connected to the system, and is never reused for the lifetime of the application.
--
--     If the joystick is disconnected and reconnected, it will get a new ID.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_JoystickID@, defined at @SDL3\/SDL_joystick.h 106:16@
newtype SDL_JoystickID = SDL_JoystickID
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_JoystickID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoystickID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_JoystickID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_JoystickID "unwrap" where
  type
    CFieldType SDL_JoystickID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | An enum of some common joystick types.
--
--     In some cases, SDL can identify a low-level joystick as being a certain type of device, and will report it through SDL_GetJoystickType (or SDL_GetJoystickTypeForID).
--
--     This is by no means a complete list of everything that can be plugged into a computer.
--
--     You may refer to [XInput Controller Types](https://learn.microsoft.com/en-us/windows/win32/xinput/xinput-and-controller-subtypes) table for a general understanding of each joystick type.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_JoystickType@, defined at @SDL3\/SDL_joystick.h 124:14@
newtype SDL_JoystickType = SDL_JoystickType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_JoystickType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_JoystickType where
  readRaw =
    \ptr0 ->
      pure SDL_JoystickType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_JoystickType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_JoystickType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_JoystickType instance BG.Storable SDL_JoystickType

deriving via BG.CUInt instance BG.Prim SDL_JoystickType

instance CEnum.CEnum SDL_JoystickType where
  type CEnumZ SDL_JoystickType = BG.CUInt

  toCEnum = SDL_JoystickType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_JOYSTICK_TYPE_UNKNOWN")
        , (1, BG.singleton "SDL_JOYSTICK_TYPE_GAMEPAD")
        , (2, BG.singleton "SDL_JOYSTICK_TYPE_WHEEL")
        , (3, BG.singleton "SDL_JOYSTICK_TYPE_ARCADE_STICK")
        , (4, BG.singleton "SDL_JOYSTICK_TYPE_FLIGHT_STICK")
        , (5, BG.singleton "SDL_JOYSTICK_TYPE_DANCE_PAD")
        , (6, BG.singleton "SDL_JOYSTICK_TYPE_GUITAR")
        , (7, BG.singleton "SDL_JOYSTICK_TYPE_DRUM_KIT")
        , (8, BG.singleton "SDL_JOYSTICK_TYPE_ARCADE_PAD")
        , (9, BG.singleton "SDL_JOYSTICK_TYPE_THROTTLE")
        , (10, BG.singleton "SDL_JOYSTICK_TYPE_COUNT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_JoystickType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_JoystickType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_JoystickType where
  minDeclaredValue = SDL_JOYSTICK_TYPE_UNKNOWN

  maxDeclaredValue = SDL_JOYSTICK_TYPE_COUNT

instance Show SDL_JoystickType where
  showsPrec = CEnum.shows

instance Read SDL_JoystickType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_JoystickType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoystickType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_JoystickType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_JoystickType "unwrap" where
  type CFieldType SDL_JoystickType "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_JOYSTICK_TYPE_UNKNOWN@, defined at @SDL3\/SDL_joystick.h 126:5@
pattern SDL_JOYSTICK_TYPE_UNKNOWN :: SDL_JoystickType
pattern SDL_JOYSTICK_TYPE_UNKNOWN = SDL_JoystickType 0

-- | [C declaration]: @SDL_JOYSTICK_TYPE_GAMEPAD@, defined at @SDL3\/SDL_joystick.h 127:5@
pattern SDL_JOYSTICK_TYPE_GAMEPAD :: SDL_JoystickType
pattern SDL_JOYSTICK_TYPE_GAMEPAD = SDL_JoystickType 1

-- | [C declaration]: @SDL_JOYSTICK_TYPE_WHEEL@, defined at @SDL3\/SDL_joystick.h 128:5@
pattern SDL_JOYSTICK_TYPE_WHEEL :: SDL_JoystickType
pattern SDL_JOYSTICK_TYPE_WHEEL = SDL_JoystickType 2

-- | [C declaration]: @SDL_JOYSTICK_TYPE_ARCADE_STICK@, defined at @SDL3\/SDL_joystick.h 129:5@
pattern SDL_JOYSTICK_TYPE_ARCADE_STICK :: SDL_JoystickType
pattern SDL_JOYSTICK_TYPE_ARCADE_STICK = SDL_JoystickType 3

-- | [C declaration]: @SDL_JOYSTICK_TYPE_FLIGHT_STICK@, defined at @SDL3\/SDL_joystick.h 130:5@
pattern SDL_JOYSTICK_TYPE_FLIGHT_STICK :: SDL_JoystickType
pattern SDL_JOYSTICK_TYPE_FLIGHT_STICK = SDL_JoystickType 4

-- | [C declaration]: @SDL_JOYSTICK_TYPE_DANCE_PAD@, defined at @SDL3\/SDL_joystick.h 131:5@
pattern SDL_JOYSTICK_TYPE_DANCE_PAD :: SDL_JoystickType
pattern SDL_JOYSTICK_TYPE_DANCE_PAD = SDL_JoystickType 5

-- | [C declaration]: @SDL_JOYSTICK_TYPE_GUITAR@, defined at @SDL3\/SDL_joystick.h 132:5@
pattern SDL_JOYSTICK_TYPE_GUITAR :: SDL_JoystickType
pattern SDL_JOYSTICK_TYPE_GUITAR = SDL_JoystickType 6

-- | [C declaration]: @SDL_JOYSTICK_TYPE_DRUM_KIT@, defined at @SDL3\/SDL_joystick.h 133:5@
pattern SDL_JOYSTICK_TYPE_DRUM_KIT :: SDL_JoystickType
pattern SDL_JOYSTICK_TYPE_DRUM_KIT = SDL_JoystickType 7

-- | [C declaration]: @SDL_JOYSTICK_TYPE_ARCADE_PAD@, defined at @SDL3\/SDL_joystick.h 134:5@
pattern SDL_JOYSTICK_TYPE_ARCADE_PAD :: SDL_JoystickType
pattern SDL_JOYSTICK_TYPE_ARCADE_PAD = SDL_JoystickType 8

-- | [C declaration]: @SDL_JOYSTICK_TYPE_THROTTLE@, defined at @SDL3\/SDL_joystick.h 135:5@
pattern SDL_JOYSTICK_TYPE_THROTTLE :: SDL_JoystickType
pattern SDL_JOYSTICK_TYPE_THROTTLE = SDL_JoystickType 9

-- | [C declaration]: @SDL_JOYSTICK_TYPE_COUNT@, defined at @SDL3\/SDL_joystick.h 136:5@
pattern SDL_JOYSTICK_TYPE_COUNT :: SDL_JoystickType
pattern SDL_JOYSTICK_TYPE_COUNT = SDL_JoystickType 10

-- | Possible connection states for a joystick device.
--
--     This is used by SDL_GetJoystickConnectionState to report how a device is connected to the system.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_JoystickConnectionState@, defined at @SDL3\/SDL_joystick.h 147:14@
newtype SDL_JoystickConnectionState = SDL_JoystickConnectionState
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_JoystickConnectionState where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_JoystickConnectionState where
  readRaw =
    \ptr0 ->
      pure SDL_JoystickConnectionState
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_JoystickConnectionState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_JoystickConnectionState unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_JoystickConnectionState
  instance
    BG.Storable SDL_JoystickConnectionState

deriving via BG.CInt instance BG.Prim SDL_JoystickConnectionState

instance CEnum.CEnum SDL_JoystickConnectionState where
  type CEnumZ SDL_JoystickConnectionState = BG.CInt

  toCEnum = SDL_JoystickConnectionState

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (-1, BG.singleton "SDL_JOYSTICK_CONNECTION_INVALID")
        , (0, BG.singleton "SDL_JOYSTICK_CONNECTION_UNKNOWN")
        , (1, BG.singleton "SDL_JOYSTICK_CONNECTION_WIRED")
        , (2, BG.singleton "SDL_JOYSTICK_CONNECTION_WIRELESS")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_JoystickConnectionState"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_JoystickConnectionState"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_JoystickConnectionState where
  minDeclaredValue = SDL_JOYSTICK_CONNECTION_INVALID

  maxDeclaredValue = SDL_JOYSTICK_CONNECTION_WIRELESS

instance Show SDL_JoystickConnectionState where
  showsPrec = CEnum.shows

instance Read SDL_JoystickConnectionState where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_JoystickConnectionState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoystickConnectionState{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_JoystickConnectionState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_JoystickConnectionState "unwrap" where
  type
    CFieldType SDL_JoystickConnectionState "unwrap" =
      BG.CInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_JOYSTICK_CONNECTION_INVALID@, defined at @SDL3\/SDL_joystick.h 149:5@
pattern SDL_JOYSTICK_CONNECTION_INVALID :: SDL_JoystickConnectionState
pattern SDL_JOYSTICK_CONNECTION_INVALID = SDL_JoystickConnectionState (-1)

-- | [C declaration]: @SDL_JOYSTICK_CONNECTION_UNKNOWN@, defined at @SDL3\/SDL_joystick.h 150:5@
pattern SDL_JOYSTICK_CONNECTION_UNKNOWN :: SDL_JoystickConnectionState
pattern SDL_JOYSTICK_CONNECTION_UNKNOWN = SDL_JoystickConnectionState 0

-- | [C declaration]: @SDL_JOYSTICK_CONNECTION_WIRED@, defined at @SDL3\/SDL_joystick.h 151:5@
pattern SDL_JOYSTICK_CONNECTION_WIRED :: SDL_JoystickConnectionState
pattern SDL_JOYSTICK_CONNECTION_WIRED = SDL_JoystickConnectionState 1

-- | [C declaration]: @SDL_JOYSTICK_CONNECTION_WIRELESS@, defined at @SDL3\/SDL_joystick.h 152:5@
pattern SDL_JOYSTICK_CONNECTION_WIRELESS :: SDL_JoystickConnectionState
pattern SDL_JOYSTICK_CONNECTION_WIRELESS = SDL_JoystickConnectionState 2

-- | The largest value an 'SDL_Joystick' \'s axis can report.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_JOYSTICK_AXIS_MIN'
--
--     [C declaration]: @macro SDL_JOYSTICK_AXIS_MAX@, defined at @SDL3\/SDL_joystick.h 162:9@
sDL_JOYSTICK_AXIS_MAX :: BG.CInt
sDL_JOYSTICK_AXIS_MAX = (32767 :: BG.CInt)

-- | The smallest value an 'SDL_Joystick' \'s axis can report.
--
--     This is a negative number!
--
--     @since 3.2.0
--
--     [See also]: 'sDL_JOYSTICK_AXIS_MAX'
--
--     [C declaration]: @macro SDL_JOYSTICK_AXIS_MIN@, defined at @SDL3\/SDL_joystick.h 173:9@
sDL_JOYSTICK_AXIS_MIN :: BG.CInt
sDL_JOYSTICK_AXIS_MIN =
  C.Expr.HostPlatform.negate (32768 :: BG.CInt)

-- | The structure that describes a virtual joystick touchpad.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_VirtualJoystickDesc'
--
--     [C declaration]: @struct SDL_VirtualJoystickTouchpadDesc@, defined at @SDL3\/SDL_joystick.h 433:16@
data SDL_VirtualJoystickTouchpadDesc = SDL_VirtualJoystickTouchpadDesc
  { nfingers :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ the number of simultaneous fingers on this touchpad
  --
  --          [C declaration]: @nfingers@, defined at @SDL3\/SDL_joystick.h 435:12@
  , padding :: CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ [C declaration]: @padding@, defined at @SDL3\/SDL_joystick.h 436:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_VirtualJoystickTouchpadDesc where
  staticSizeOf = \_ -> (8 :: Int)

  staticAlignment = \_ -> (2 :: Int)

instance Marshal.ReadRaw SDL_VirtualJoystickTouchpadDesc where
  readRaw =
    \ptr0 ->
      pure SDL_VirtualJoystickTouchpadDesc
        <*> HasCField.readRaw (BG.Proxy @"nfingers") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding") ptr0

instance Marshal.WriteRaw SDL_VirtualJoystickTouchpadDesc where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_VirtualJoystickTouchpadDesc nfingers2 padding3 ->
            HasCField.writeRaw (BG.Proxy @"nfingers") ptr0 nfingers2
              >> HasCField.writeRaw (BG.Proxy @"padding") ptr0 padding3

deriving via
  Marshal.EquivStorable SDL_VirtualJoystickTouchpadDesc
  instance
    BG.Storable SDL_VirtualJoystickTouchpadDesc

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "nfingers" SDL_VirtualJoystickTouchpadDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickTouchpadDesc{nfingers = y1, padding = BG.getField @"padding" x0}
      , BG.getField @"nfingers" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "nfingers" (BG.Ptr SDL_VirtualJoystickTouchpadDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"nfingers")

instance HasCField.HasCField SDL_VirtualJoystickTouchpadDesc "nfingers" where
  type
    CFieldType SDL_VirtualJoystickTouchpadDesc "nfingers" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 0

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "padding" SDL_VirtualJoystickTouchpadDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickTouchpadDesc{padding = y1, nfingers = BG.getField @"nfingers" x0}
      , BG.getField @"padding" x0
      )

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "padding" (BG.Ptr SDL_VirtualJoystickTouchpadDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding")

instance HasCField.HasCField SDL_VirtualJoystickTouchpadDesc "padding" where
  type
    CFieldType SDL_VirtualJoystickTouchpadDesc "padding" =
      CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 2

-- | The structure that describes a virtual joystick sensor.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_VirtualJoystickDesc'
--
--     [C declaration]: @struct SDL_VirtualJoystickSensorDesc@, defined at @SDL3\/SDL_joystick.h 446:16@
data SDL_VirtualJoystickSensorDesc = SDL_VirtualJoystickSensorDesc
  { type' :: SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^ the type of this sensor
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_joystick.h 448:20@
  , rate :: BG.CFloat
  -- ^ the update frequency of this sensor, may be 0.0f
  --
  --          [C declaration]: @rate@, defined at @SDL3\/SDL_joystick.h 449:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_VirtualJoystickSensorDesc where
  staticSizeOf = \_ -> (8 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_VirtualJoystickSensorDesc where
  readRaw =
    \ptr0 ->
      pure SDL_VirtualJoystickSensorDesc
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"rate") ptr0

instance Marshal.WriteRaw SDL_VirtualJoystickSensorDesc where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_VirtualJoystickSensorDesc type'2 rate3 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"rate") ptr0 rate3

deriving via
  Marshal.EquivStorable SDL_VirtualJoystickSensorDesc
  instance
    BG.Storable SDL_VirtualJoystickSensorDesc

instance
  (ty ~ SDL3.Sys.Bindgen.Sensor.SDL_SensorType)
  => BG.CompatHasField.HasField "type'" SDL_VirtualJoystickSensorDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickSensorDesc{type' = y1, rate = BG.getField @"rate" x0}
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Sensor.SDL_SensorType)
  => BG.HasField "type'" (BG.Ptr SDL_VirtualJoystickSensorDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_VirtualJoystickSensorDesc "type'" where
  type
    CFieldType SDL_VirtualJoystickSensorDesc "type'" =
      SDL3.Sys.Bindgen.Sensor.SDL_SensorType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "rate" SDL_VirtualJoystickSensorDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickSensorDesc{rate = y1, type' = BG.getField @"type'" x0}
      , BG.getField @"rate" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "rate" (BG.Ptr SDL_VirtualJoystickSensorDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"rate")

instance HasCField.HasCField SDL_VirtualJoystickSensorDesc "rate" where
  type
    CFieldType SDL_VirtualJoystickSensorDesc "rate" =
      BG.CFloat

  offset# = \_ -> \_ -> 4

-- | The structure that describes a virtual joystick.
--
--     This structure should be initialized using SDL_INIT_INTERFACE(). All elements of this structure are optional.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AttachVirtualJoystick', SDL_INIT_INTERFACE, 'SDL_VirtualJoystickSensorDesc', 'SDL_VirtualJoystickTouchpadDesc'
--
--     [C declaration]: @struct SDL_VirtualJoystickDesc@, defined at @SDL3\/SDL_joystick.h 465:16@
data SDL_VirtualJoystickDesc = SDL_VirtualJoystickDesc
  { version :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ the version of this interface
  --
  --          [C declaration]: @version@, defined at @SDL3\/SDL_joystick.h 467:12@
  , type' :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ @'SDL_JoystickType'@
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_joystick.h 468:12@
  , padding :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ unused
  --
  --          [C declaration]: @padding@, defined at @SDL3\/SDL_joystick.h 469:12@
  , vendor_id :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ the USB vendor ID of this joystick
  --
  --          [C declaration]: @vendor_id@, defined at @SDL3\/SDL_joystick.h 470:12@
  , product_id :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ the USB product ID of this joystick
  --
  --          [C declaration]: @product_id@, defined at @SDL3\/SDL_joystick.h 471:12@
  , naxes :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ the number of axes on this joystick
  --
  --          [C declaration]: @naxes@, defined at @SDL3\/SDL_joystick.h 472:12@
  , nbuttons :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ the number of buttons on this joystick
  --
  --          [C declaration]: @nbuttons@, defined at @SDL3\/SDL_joystick.h 473:12@
  , nballs :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ the number of balls on this joystick
  --
  --          [C declaration]: @nballs@, defined at @SDL3\/SDL_joystick.h 474:12@
  , nhats :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ the number of hats on this joystick
  --
  --          [C declaration]: @nhats@, defined at @SDL3\/SDL_joystick.h 475:12@
  , ntouchpads :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ the number of touchpads on this joystick, requires @touchpads@ to point at valid descriptions
  --
  --          [C declaration]: @ntouchpads@, defined at @SDL3\/SDL_joystick.h 476:12@
  , nsensors :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ the number of sensors on this joystick, requires @sensors@ to point at valid descriptions
  --
  --          [C declaration]: @nsensors@, defined at @SDL3\/SDL_joystick.h 477:12@
  , padding2 :: CA.ConstantArray 2 SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ unused
  --
  --          [C declaration]: @padding2@, defined at @SDL3\/SDL_joystick.h 478:12@
  , button_mask :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ A mask of which buttons are valid for this controller e.g. (1 \<\< SDL_GAMEPAD_BUTTON_SOUTH)
  --
  --          [C declaration]: @button_mask@, defined at @SDL3\/SDL_joystick.h 479:12@
  , axis_mask :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ A mask of which axes are valid for this controller e.g. (1 \<\< SDL_GAMEPAD_AXIS_LEFTX)
  --
  --          [C declaration]: @axis_mask@, defined at @SDL3\/SDL_joystick.h 481:12@
  , name :: PtrConst.PtrConst BG.CChar
  -- ^ the name of the joystick
  --
  --          [C declaration]: @name@, defined at @SDL3\/SDL_joystick.h 483:17@
  , touchpads :: PtrConst.PtrConst SDL_VirtualJoystickTouchpadDesc
  -- ^ A pointer to an array of touchpad descriptions, required if @ntouchpads@ is > 0
  --
  --          [C declaration]: @touchpads@, defined at @SDL3\/SDL_joystick.h 484:44@
  , sensors :: PtrConst.PtrConst SDL_VirtualJoystickSensorDesc
  -- ^ A pointer to an array of sensor descriptions, required if @nsensors@ is > 0
  --
  --          [C declaration]: @sensors@, defined at @SDL3\/SDL_joystick.h 485:42@
  , userdata :: BG.Ptr BG.Void
  -- ^ User data pointer passed to callbacks
  --
  --          [C declaration]: @userdata@, defined at @SDL3\/SDL_joystick.h 487:11@
  , update :: BG.FunPtr (BG.Ptr BG.Void -> IO ())
  -- ^ [C declaration]: @Update@, defined at @SDL3\/SDL_joystick.h 488:20@
  , setPlayerIndex :: BG.FunPtr (BG.Ptr BG.Void -> BG.CInt -> IO ())
  -- ^ [C declaration]: @SetPlayerIndex@, defined at @SDL3\/SDL_joystick.h 489:20@
  , rumble
      :: BG.FunPtr
           (BG.Ptr BG.Void -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool)
  -- ^ [C declaration]: @Rumble@, defined at @SDL3\/SDL_joystick.h 490:20@
  , rumbleTriggers
      :: BG.FunPtr
           (BG.Ptr BG.Void -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool)
  -- ^ [C declaration]: @RumbleTriggers@, defined at @SDL3\/SDL_joystick.h 491:20@
  , setLED
      :: BG.FunPtr
           ( BG.Ptr BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO BG.CBool
           )
  -- ^ [C declaration]: @SetLED@, defined at @SDL3\/SDL_joystick.h 492:20@
  , sendEffect :: BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO BG.CBool)
  -- ^ [C declaration]: @SendEffect@, defined at @SDL3\/SDL_joystick.h 493:20@
  , setSensorsEnabled :: BG.FunPtr (BG.Ptr BG.Void -> BG.CBool -> IO BG.CBool)
  -- ^ [C declaration]: @SetSensorsEnabled@, defined at @SDL3\/SDL_joystick.h 494:20@
  , cleanup :: BG.FunPtr (BG.Ptr BG.Void -> IO ())
  -- ^ [C declaration]: @Cleanup@, defined at @SDL3\/SDL_joystick.h 495:20@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_VirtualJoystickDesc where
  staticSizeOf = \_ -> (136 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_VirtualJoystickDesc where
  readRaw =
    \ptr0 ->
      pure SDL_VirtualJoystickDesc
        <*> HasCField.readRaw (BG.Proxy @"version") ptr0
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding") ptr0
        <*> HasCField.readRaw (BG.Proxy @"vendor_id") ptr0
        <*> HasCField.readRaw (BG.Proxy @"product_id") ptr0
        <*> HasCField.readRaw (BG.Proxy @"naxes") ptr0
        <*> HasCField.readRaw (BG.Proxy @"nbuttons") ptr0
        <*> HasCField.readRaw (BG.Proxy @"nballs") ptr0
        <*> HasCField.readRaw (BG.Proxy @"nhats") ptr0
        <*> HasCField.readRaw (BG.Proxy @"ntouchpads") ptr0
        <*> HasCField.readRaw (BG.Proxy @"nsensors") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"button_mask") ptr0
        <*> HasCField.readRaw (BG.Proxy @"axis_mask") ptr0
        <*> HasCField.readRaw (BG.Proxy @"name") ptr0
        <*> HasCField.readRaw (BG.Proxy @"touchpads") ptr0
        <*> HasCField.readRaw (BG.Proxy @"sensors") ptr0
        <*> HasCField.readRaw (BG.Proxy @"userdata") ptr0
        <*> HasCField.readRaw (BG.Proxy @"update") ptr0
        <*> HasCField.readRaw (BG.Proxy @"setPlayerIndex") ptr0
        <*> HasCField.readRaw (BG.Proxy @"rumble") ptr0
        <*> HasCField.readRaw (BG.Proxy @"rumbleTriggers") ptr0
        <*> HasCField.readRaw (BG.Proxy @"setLED") ptr0
        <*> HasCField.readRaw (BG.Proxy @"sendEffect") ptr0
        <*> HasCField.readRaw (BG.Proxy @"setSensorsEnabled") ptr0
        <*> HasCField.readRaw (BG.Proxy @"cleanup") ptr0

instance Marshal.WriteRaw SDL_VirtualJoystickDesc where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_VirtualJoystickDesc
            version2
            type'3
            padding4
            vendor_id5
            product_id6
            naxes7
            nbuttons8
            nballs9
            nhats10
            ntouchpads11
            nsensors12
            padding213
            button_mask14
            axis_mask15
            name16
            touchpads17
            sensors18
            userdata19
            update20
            setPlayerIndex21
            rumble22
            rumbleTriggers23
            setLED24
            sendEffect25
            setSensorsEnabled26
            cleanup27 ->
              HasCField.writeRaw (BG.Proxy @"version") ptr0 version2
                >> HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'3
                >> HasCField.writeRaw (BG.Proxy @"padding") ptr0 padding4
                >> HasCField.writeRaw (BG.Proxy @"vendor_id") ptr0 vendor_id5
                >> HasCField.writeRaw (BG.Proxy @"product_id") ptr0 product_id6
                >> HasCField.writeRaw (BG.Proxy @"naxes") ptr0 naxes7
                >> HasCField.writeRaw (BG.Proxy @"nbuttons") ptr0 nbuttons8
                >> HasCField.writeRaw (BG.Proxy @"nballs") ptr0 nballs9
                >> HasCField.writeRaw (BG.Proxy @"nhats") ptr0 nhats10
                >> HasCField.writeRaw (BG.Proxy @"ntouchpads") ptr0 ntouchpads11
                >> HasCField.writeRaw (BG.Proxy @"nsensors") ptr0 nsensors12
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding213
                >> HasCField.writeRaw (BG.Proxy @"button_mask") ptr0 button_mask14
                >> HasCField.writeRaw (BG.Proxy @"axis_mask") ptr0 axis_mask15
                >> HasCField.writeRaw (BG.Proxy @"name") ptr0 name16
                >> HasCField.writeRaw (BG.Proxy @"touchpads") ptr0 touchpads17
                >> HasCField.writeRaw (BG.Proxy @"sensors") ptr0 sensors18
                >> HasCField.writeRaw (BG.Proxy @"userdata") ptr0 userdata19
                >> HasCField.writeRaw (BG.Proxy @"update") ptr0 update20
                >> HasCField.writeRaw (BG.Proxy @"setPlayerIndex") ptr0 setPlayerIndex21
                >> HasCField.writeRaw (BG.Proxy @"rumble") ptr0 rumble22
                >> HasCField.writeRaw (BG.Proxy @"rumbleTriggers") ptr0 rumbleTriggers23
                >> HasCField.writeRaw (BG.Proxy @"setLED") ptr0 setLED24
                >> HasCField.writeRaw (BG.Proxy @"sendEffect") ptr0 sendEffect25
                >> HasCField.writeRaw (BG.Proxy @"setSensorsEnabled") ptr0 setSensorsEnabled26
                >> HasCField.writeRaw (BG.Proxy @"cleanup") ptr0 cleanup27

deriving via
  Marshal.EquivStorable SDL_VirtualJoystickDesc
  instance
    BG.Storable SDL_VirtualJoystickDesc

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "version" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { version = y1
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"version" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "version" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"version")

instance HasCField.HasCField SDL_VirtualJoystickDesc "version" where
  type
    CFieldType SDL_VirtualJoystickDesc "version" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "type'" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { type' = y1
            , version = BG.getField @"version" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "type'" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_VirtualJoystickDesc "type'" where
  type
    CFieldType SDL_VirtualJoystickDesc "type'" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "padding" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { padding = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"padding" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "padding" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding")

instance HasCField.HasCField SDL_VirtualJoystickDesc "padding" where
  type
    CFieldType SDL_VirtualJoystickDesc "padding" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 6

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "vendor_id" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { vendor_id = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"vendor_id" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "vendor_id" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"vendor_id")

instance HasCField.HasCField SDL_VirtualJoystickDesc "vendor_id" where
  type
    CFieldType SDL_VirtualJoystickDesc "vendor_id" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "product_id" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { product_id = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"product_id" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "product_id" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"product_id")

instance HasCField.HasCField SDL_VirtualJoystickDesc "product_id" where
  type
    CFieldType SDL_VirtualJoystickDesc "product_id" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 10

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "naxes" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { naxes = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"naxes" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "naxes" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"naxes")

instance HasCField.HasCField SDL_VirtualJoystickDesc "naxes" where
  type
    CFieldType SDL_VirtualJoystickDesc "naxes" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 12

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "nbuttons" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { nbuttons = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"nbuttons" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "nbuttons" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"nbuttons")

instance HasCField.HasCField SDL_VirtualJoystickDesc "nbuttons" where
  type
    CFieldType SDL_VirtualJoystickDesc "nbuttons" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 14

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "nballs" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { nballs = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"nballs" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "nballs" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"nballs")

instance HasCField.HasCField SDL_VirtualJoystickDesc "nballs" where
  type
    CFieldType SDL_VirtualJoystickDesc "nballs" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "nhats" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { nhats = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"nhats" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "nhats" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"nhats")

instance HasCField.HasCField SDL_VirtualJoystickDesc "nhats" where
  type
    CFieldType SDL_VirtualJoystickDesc "nhats" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 18

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "ntouchpads" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { ntouchpads = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"ntouchpads" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "ntouchpads" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"ntouchpads")

instance HasCField.HasCField SDL_VirtualJoystickDesc "ntouchpads" where
  type
    CFieldType SDL_VirtualJoystickDesc "ntouchpads" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "nsensors" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { nsensors = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"nsensors" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "nsensors" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"nsensors")

instance HasCField.HasCField SDL_VirtualJoystickDesc "nsensors" where
  type
    CFieldType SDL_VirtualJoystickDesc "nsensors" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 22

instance
  (ty ~ CA.ConstantArray 2 SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "padding2" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { padding2 = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ CA.ConstantArray 2 SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "padding2" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_VirtualJoystickDesc "padding2" where
  type
    CFieldType SDL_VirtualJoystickDesc "padding2" =
      CA.ConstantArray 2 SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "button_mask" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { button_mask = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"button_mask" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "button_mask" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"button_mask")

instance HasCField.HasCField SDL_VirtualJoystickDesc "button_mask" where
  type
    CFieldType SDL_VirtualJoystickDesc "button_mask" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "axis_mask" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { axis_mask = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"axis_mask" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "axis_mask" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"axis_mask")

instance HasCField.HasCField SDL_VirtualJoystickDesc "axis_mask" where
  type
    CFieldType SDL_VirtualJoystickDesc "axis_mask" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 32

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "name" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { name = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"name" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "name" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"name")

instance HasCField.HasCField SDL_VirtualJoystickDesc "name" where
  type
    CFieldType SDL_VirtualJoystickDesc "name" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 40

instance
  (ty ~ PtrConst.PtrConst SDL_VirtualJoystickTouchpadDesc)
  => BG.CompatHasField.HasField "touchpads" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { touchpads = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"touchpads" x0
      )

instance
  (ty ~ PtrConst.PtrConst SDL_VirtualJoystickTouchpadDesc)
  => BG.HasField "touchpads" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"touchpads")

instance HasCField.HasCField SDL_VirtualJoystickDesc "touchpads" where
  type
    CFieldType SDL_VirtualJoystickDesc "touchpads" =
      PtrConst.PtrConst SDL_VirtualJoystickTouchpadDesc

  offset# = \_ -> \_ -> 48

instance
  (ty ~ PtrConst.PtrConst SDL_VirtualJoystickSensorDesc)
  => BG.CompatHasField.HasField "sensors" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { sensors = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"sensors" x0
      )

instance
  (ty ~ PtrConst.PtrConst SDL_VirtualJoystickSensorDesc)
  => BG.HasField "sensors" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"sensors")

instance HasCField.HasCField SDL_VirtualJoystickDesc "sensors" where
  type
    CFieldType SDL_VirtualJoystickDesc "sensors" =
      PtrConst.PtrConst SDL_VirtualJoystickSensorDesc

  offset# = \_ -> \_ -> 56

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "userdata" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { userdata = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"userdata" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "userdata" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"userdata")

instance HasCField.HasCField SDL_VirtualJoystickDesc "userdata" where
  type
    CFieldType SDL_VirtualJoystickDesc "userdata" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 64

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO ()))
  => BG.CompatHasField.HasField "update" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { update = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"update" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO ()))
  => BG.HasField "update" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"update")

instance HasCField.HasCField SDL_VirtualJoystickDesc "update" where
  type
    CFieldType SDL_VirtualJoystickDesc "update" =
      BG.FunPtr (BG.Ptr BG.Void -> IO ())

  offset# = \_ -> \_ -> 72

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> BG.CInt -> IO ()))
  => BG.CompatHasField.HasField "setPlayerIndex" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { setPlayerIndex = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"setPlayerIndex" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> BG.CInt -> IO ()))
  => BG.HasField "setPlayerIndex" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"setPlayerIndex")

instance HasCField.HasCField SDL_VirtualJoystickDesc "setPlayerIndex" where
  type
    CFieldType SDL_VirtualJoystickDesc "setPlayerIndex" =
      BG.FunPtr (BG.Ptr BG.Void -> BG.CInt -> IO ())

  offset# = \_ -> \_ -> 80

instance
  ( ty
      ~ BG.FunPtr
          (BG.Ptr BG.Void -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool)
  )
  => BG.CompatHasField.HasField "rumble" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { rumble = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"rumble" x0
      )

instance
  ( ty
      ~ BG.FunPtr
          (BG.Ptr BG.Void -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool)
  )
  => BG.HasField "rumble" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"rumble")

instance HasCField.HasCField SDL_VirtualJoystickDesc "rumble" where
  type
    CFieldType SDL_VirtualJoystickDesc "rumble" =
      BG.FunPtr
        (BG.Ptr BG.Void -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool)

  offset# = \_ -> \_ -> 88

instance
  ( ty
      ~ BG.FunPtr
          (BG.Ptr BG.Void -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool)
  )
  => BG.CompatHasField.HasField "rumbleTriggers" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { rumbleTriggers = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"rumbleTriggers" x0
      )

instance
  ( ty
      ~ BG.FunPtr
          (BG.Ptr BG.Void -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool)
  )
  => BG.HasField "rumbleTriggers" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"rumbleTriggers")

instance HasCField.HasCField SDL_VirtualJoystickDesc "rumbleTriggers" where
  type
    CFieldType SDL_VirtualJoystickDesc "rumbleTriggers" =
      BG.FunPtr
        (BG.Ptr BG.Void -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool)

  offset# = \_ -> \_ -> 96

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> SDL3.Sys.Bindgen.Stdinc.Uint8
            -> SDL3.Sys.Bindgen.Stdinc.Uint8
            -> SDL3.Sys.Bindgen.Stdinc.Uint8
            -> IO BG.CBool
          )
  )
  => BG.CompatHasField.HasField "setLED" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { setLED = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"setLED" x0
      )

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> SDL3.Sys.Bindgen.Stdinc.Uint8
            -> SDL3.Sys.Bindgen.Stdinc.Uint8
            -> SDL3.Sys.Bindgen.Stdinc.Uint8
            -> IO BG.CBool
          )
  )
  => BG.HasField "setLED" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"setLED")

instance HasCField.HasCField SDL_VirtualJoystickDesc "setLED" where
  type
    CFieldType SDL_VirtualJoystickDesc "setLED" =
      BG.FunPtr
        ( BG.Ptr BG.Void
          -> SDL3.Sys.Bindgen.Stdinc.Uint8
          -> SDL3.Sys.Bindgen.Stdinc.Uint8
          -> SDL3.Sys.Bindgen.Stdinc.Uint8
          -> IO BG.CBool
        )

  offset# = \_ -> \_ -> 104

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO BG.CBool))
  => BG.CompatHasField.HasField "sendEffect" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { sendEffect = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"sendEffect" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO BG.CBool))
  => BG.HasField "sendEffect" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"sendEffect")

instance HasCField.HasCField SDL_VirtualJoystickDesc "sendEffect" where
  type
    CFieldType SDL_VirtualJoystickDesc "sendEffect" =
      BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO BG.CBool)

  offset# = \_ -> \_ -> 112

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> BG.CBool -> IO BG.CBool))
  => BG.CompatHasField.HasField "setSensorsEnabled" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { setSensorsEnabled = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , cleanup = BG.getField @"cleanup" x0
            }
      , BG.getField @"setSensorsEnabled" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> BG.CBool -> IO BG.CBool))
  => BG.HasField "setSensorsEnabled" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"setSensorsEnabled")

instance HasCField.HasCField SDL_VirtualJoystickDesc "setSensorsEnabled" where
  type
    CFieldType SDL_VirtualJoystickDesc "setSensorsEnabled" =
      BG.FunPtr (BG.Ptr BG.Void -> BG.CBool -> IO BG.CBool)

  offset# = \_ -> \_ -> 120

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO ()))
  => BG.CompatHasField.HasField "cleanup" SDL_VirtualJoystickDesc ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_VirtualJoystickDesc
            { cleanup = y1
            , version = BG.getField @"version" x0
            , type' = BG.getField @"type'" x0
            , padding = BG.getField @"padding" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , naxes = BG.getField @"naxes" x0
            , nbuttons = BG.getField @"nbuttons" x0
            , nballs = BG.getField @"nballs" x0
            , nhats = BG.getField @"nhats" x0
            , ntouchpads = BG.getField @"ntouchpads" x0
            , nsensors = BG.getField @"nsensors" x0
            , padding2 = BG.getField @"padding2" x0
            , button_mask = BG.getField @"button_mask" x0
            , axis_mask = BG.getField @"axis_mask" x0
            , name = BG.getField @"name" x0
            , touchpads = BG.getField @"touchpads" x0
            , sensors = BG.getField @"sensors" x0
            , userdata = BG.getField @"userdata" x0
            , update = BG.getField @"update" x0
            , setPlayerIndex = BG.getField @"setPlayerIndex" x0
            , rumble = BG.getField @"rumble" x0
            , rumbleTriggers = BG.getField @"rumbleTriggers" x0
            , setLED = BG.getField @"setLED" x0
            , sendEffect = BG.getField @"sendEffect" x0
            , setSensorsEnabled = BG.getField @"setSensorsEnabled" x0
            }
      , BG.getField @"cleanup" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO ()))
  => BG.HasField "cleanup" (BG.Ptr SDL_VirtualJoystickDesc) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"cleanup")

instance HasCField.HasCField SDL_VirtualJoystickDesc "cleanup" where
  type
    CFieldType SDL_VirtualJoystickDesc "cleanup" =
      BG.FunPtr (BG.Ptr BG.Void -> IO ())

  offset# = \_ -> \_ -> 128

-- | [C declaration]: @macro SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN@, literal @\"SDL.joystick.cap.mono_led\"@, defined at @SDL3\/SDL_joystick.h 772:9@
sDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN :: BG.ByteString
sDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x6A
    , 0x6F
    , 0x79
    , 0x73
    , 0x74
    , 0x69
    , 0x63
    , 0x6B
    , 0x2E
    , 0x63
    , 0x61
    , 0x70
    , 0x2E
    , 0x6D
    , 0x6F
    , 0x6E
    , 0x6F
    , 0x5F
    , 0x6C
    , 0x65
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN@, literal @\"SDL.joystick.cap.rgb_led\"@, defined at @SDL3\/SDL_joystick.h 773:9@
sDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN :: BG.ByteString
sDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x6A
    , 0x6F
    , 0x79
    , 0x73
    , 0x74
    , 0x69
    , 0x63
    , 0x6B
    , 0x2E
    , 0x63
    , 0x61
    , 0x70
    , 0x2E
    , 0x72
    , 0x67
    , 0x62
    , 0x5F
    , 0x6C
    , 0x65
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN@, literal @\"SDL.joystick.cap.player_led\"@, defined at @SDL3\/SDL_joystick.h 774:9@
sDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN :: BG.ByteString
sDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x6A
    , 0x6F
    , 0x79
    , 0x73
    , 0x74
    , 0x69
    , 0x63
    , 0x6B
    , 0x2E
    , 0x63
    , 0x61
    , 0x70
    , 0x2E
    , 0x70
    , 0x6C
    , 0x61
    , 0x79
    , 0x65
    , 0x72
    , 0x5F
    , 0x6C
    , 0x65
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN@, literal @\"SDL.joystick.cap.rumble\"@, defined at @SDL3\/SDL_joystick.h 775:9@
sDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN :: BG.ByteString
sDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x6A
    , 0x6F
    , 0x79
    , 0x73
    , 0x74
    , 0x69
    , 0x63
    , 0x6B
    , 0x2E
    , 0x63
    , 0x61
    , 0x70
    , 0x2E
    , 0x72
    , 0x75
    , 0x6D
    , 0x62
    , 0x6C
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN@, literal @\"SDL.joystick.cap.trigger_rumble\"@, defined at @SDL3\/SDL_joystick.h 776:9@
sDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN :: BG.ByteString
sDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x6A
    , 0x6F
    , 0x79
    , 0x73
    , 0x74
    , 0x69
    , 0x63
    , 0x6B
    , 0x2E
    , 0x63
    , 0x61
    , 0x70
    , 0x2E
    , 0x74
    , 0x72
    , 0x69
    , 0x67
    , 0x67
    , 0x65
    , 0x72
    , 0x5F
    , 0x72
    , 0x75
    , 0x6D
    , 0x62
    , 0x6C
    , 0x65
    ]

-- | [C declaration]: @macro SDL_HAT_CENTERED@, defined at @SDL3\/SDL_joystick.h 1212:9@
sDL_HAT_CENTERED :: BG.CUInt
sDL_HAT_CENTERED = (0 :: BG.CUInt)

-- | [C declaration]: @macro SDL_HAT_UP@, defined at @SDL3\/SDL_joystick.h 1213:9@
sDL_HAT_UP :: BG.CUInt
sDL_HAT_UP = (1 :: BG.CUInt)

-- | [C declaration]: @macro SDL_HAT_RIGHT@, defined at @SDL3\/SDL_joystick.h 1214:9@
sDL_HAT_RIGHT :: BG.CUInt
sDL_HAT_RIGHT = (2 :: BG.CUInt)

-- | [C declaration]: @macro SDL_HAT_DOWN@, defined at @SDL3\/SDL_joystick.h 1215:9@
sDL_HAT_DOWN :: BG.CUInt
sDL_HAT_DOWN = (4 :: BG.CUInt)

-- | [C declaration]: @macro SDL_HAT_LEFT@, defined at @SDL3\/SDL_joystick.h 1216:9@
sDL_HAT_LEFT :: BG.CUInt
sDL_HAT_LEFT = (8 :: BG.CUInt)

-- | [C declaration]: @macro SDL_HAT_RIGHTUP@, defined at @SDL3\/SDL_joystick.h 1217:9@
sDL_HAT_RIGHTUP :: BG.CUInt
sDL_HAT_RIGHTUP =
  (C.Expr.HostPlatform..|.) sDL_HAT_RIGHT sDL_HAT_UP

-- | [C declaration]: @macro SDL_HAT_RIGHTDOWN@, defined at @SDL3\/SDL_joystick.h 1218:9@
sDL_HAT_RIGHTDOWN :: BG.CUInt
sDL_HAT_RIGHTDOWN =
  (C.Expr.HostPlatform..|.) sDL_HAT_RIGHT sDL_HAT_DOWN

-- | [C declaration]: @macro SDL_HAT_LEFTUP@, defined at @SDL3\/SDL_joystick.h 1219:9@
sDL_HAT_LEFTUP :: BG.CUInt
sDL_HAT_LEFTUP =
  (C.Expr.HostPlatform..|.) sDL_HAT_LEFT sDL_HAT_UP

-- | [C declaration]: @macro SDL_HAT_LEFTDOWN@, defined at @SDL3\/SDL_joystick.h 1220:9@
sDL_HAT_LEFTDOWN :: BG.CUInt
sDL_HAT_LEFTDOWN =
  (C.Expr.HostPlatform..|.) sDL_HAT_LEFT sDL_HAT_DOWN

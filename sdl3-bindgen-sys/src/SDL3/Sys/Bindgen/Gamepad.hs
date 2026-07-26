{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
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

-- | SDL provides a low-level joystick API, which just treats joysticks as an arbitrary pile of buttons, axes, and hat switches. If you\'re planning to write your own control configuration screen, this can give you a lot of flexibility, but that\'s a lot of work, and most things that we consider \"joysticks\" now are actually console-style gamepads. So SDL provides the gamepad API on top of the lower-level joystick functionality.
--
--     The difference between a joystick and a gamepad is that a gamepad tells you /where/ a button or axis is on the device. You don\'t speak to gamepads in terms of arbitrary numbers like \"button 3\" or \"axis 2\" but in standard locations: the d-pad, the shoulder buttons, triggers, A\/B\/X\/Y (or X\/O\/Square\/Triangle, if you will).
--
--     One turns a joystick into a gamepad by providing a magic configuration string, which tells SDL the details of a specific device: when you see this specific hardware, if button 2 gets pressed, this is actually D-Pad Up, etc.
--
--     SDL has many popular controllers configured out of the box, and users can add their own controller details through an environment variable if it\'s otherwise unknown to SDL.
--
--     In order to use these functions, SDL_Init() must have been called with the SDL_INIT_GAMEPAD flag. This causes SDL to scan the system for gamepads, and load appropriate drivers.
--
--     If you\'re using SDL gamepad support in a Steam game, you must call SteamAPI_InitEx() before calling SDL_Init().
--
--     If you would like to receive gamepad updates while the application is in the background, you should set the following hint before calling SDL_Init(): SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS
--
--     Gamepads support various optional features such as rumble, color LEDs, touchpad, gyro, etc. The support for these features varies depending on the controller and OS support available. You can check for LED and rumble capabilities at runtime by calling @SDL_GetGamepadProperties()@ and checking the various capability properties. You can check for touchpad by calling @SDL_GetNumGamepadTouchpads()@ and check for gyro and accelerometer by calling @SDL_GamepadHasSensor()@.
--
--     By default SDL will try to use the most capable driver available, but you can tune which OS drivers to use with the various joystick hints in SDL_hints.h.
--
--     Your application should always support gamepad hotplugging. On some platforms like Xbox, Steam Deck, etc., this is a requirement for certification. On other platforms, like macOS and Windows when using Windows.Gaming.Input, controllers may not be available at startup and will come in at some point after you\'ve started processing events. The structure used to identify an SDL gamepad
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Gamepad (
  SDL3.Sys.Bindgen.Gamepad.SDL_Gamepad,
  SDL3.Sys.Bindgen.Gamepad.SDL_GamepadType (..),
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_STANDARD,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_XBOX360,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_XBOXONE,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_PS3,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_PS4,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_PS5,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_GAMECUBE,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_TYPE_COUNT,
  SDL3.Sys.Bindgen.Gamepad.SDL_GamepadButton (..),
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_INVALID,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_SOUTH,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_EAST,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_WEST,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_NORTH,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_BACK,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_GUIDE,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_START,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LEFT_STICK,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_RIGHT_STICK,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LEFT_SHOULDER,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_DPAD_UP,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_DPAD_DOWN,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_DPAD_LEFT,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_DPAD_RIGHT,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_MISC1,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LEFT_PADDLE1,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LEFT_PADDLE2,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_TOUCHPAD,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_MISC2,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_MISC3,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_MISC4,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_MISC5,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_MISC6,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_COUNT,
  SDL3.Sys.Bindgen.Gamepad.SDL_GamepadButtonLabel (..),
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LABEL_A,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LABEL_B,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LABEL_X,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LABEL_Y,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LABEL_CROSS,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LABEL_CIRCLE,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LABEL_SQUARE,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE,
  SDL3.Sys.Bindgen.Gamepad.SDL_GamepadAxis (..),
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_AXIS_INVALID,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_AXIS_LEFTX,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_AXIS_LEFTY,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_AXIS_RIGHTX,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_AXIS_RIGHTY,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_AXIS_LEFT_TRIGGER,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_AXIS_RIGHT_TRIGGER,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_AXIS_COUNT,
  SDL3.Sys.Bindgen.Gamepad.SDL_GamepadBindingType (..),
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BINDTYPE_NONE,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BINDTYPE_BUTTON,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BINDTYPE_AXIS,
  pattern SDL3.Sys.Bindgen.Gamepad.SDL_GAMEPAD_BINDTYPE_HAT,
  SDL3.Sys.Bindgen.Gamepad.SDL_GamepadBinding_input_axis (..),
  SDL3.Sys.Bindgen.Gamepad.SDL_GamepadBinding_input_hat (..),
  SDL3.Sys.Bindgen.Gamepad.SDL_GamepadBinding_input (..),
  SDL3.Sys.Bindgen.Gamepad.SDL_GamepadBinding_output_axis (..),
  SDL3.Sys.Bindgen.Gamepad.SDL_GamepadBinding_output (..),
  SDL3.Sys.Bindgen.Gamepad.SDL_GamepadBinding (..),
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import HsBindgen.Runtime.Union qualified as Union

-- | [C declaration]: @struct SDL_Gamepad@, defined at @SDL3\/SDL_gamepad.h 100:16@
data SDL_Gamepad

-- | Standard gamepad types.
--
--     This type does not necessarily map to first-party controllers from Microsoft\/Sony\/Nintendo; in many cases, third-party controllers can report as these, either because they were designed for a specific console, or they simply most closely match that console\'s controllers (does it have A\/B\/X\/Y buttons or X\/O\/Square\/Triangle? Does it have a touchpad? etc).
--
--     [C declaration]: @enum SDL_GamepadType@, defined at @SDL3\/SDL_gamepad.h 111:14@
newtype SDL_GamepadType = SDL_GamepadType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GamepadType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GamepadType where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GamepadType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GamepadType instance BG.Storable SDL_GamepadType

deriving via BG.CUInt instance BG.Prim SDL_GamepadType

instance CEnum.CEnum SDL_GamepadType where
  type CEnumZ SDL_GamepadType = BG.CUInt

  toCEnum = SDL_GamepadType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GAMEPAD_TYPE_UNKNOWN")
        , (1, BG.singleton "SDL_GAMEPAD_TYPE_STANDARD")
        , (2, BG.singleton "SDL_GAMEPAD_TYPE_XBOX360")
        , (3, BG.singleton "SDL_GAMEPAD_TYPE_XBOXONE")
        , (4, BG.singleton "SDL_GAMEPAD_TYPE_PS3")
        , (5, BG.singleton "SDL_GAMEPAD_TYPE_PS4")
        , (6, BG.singleton "SDL_GAMEPAD_TYPE_PS5")
        , (7, BG.singleton "SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO")
        , (8, BG.singleton "SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT")
        , (9, BG.singleton "SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT")
        , (10, BG.singleton "SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR")
        , (11, BG.singleton "SDL_GAMEPAD_TYPE_GAMECUBE")
        , (12, BG.singleton "SDL_GAMEPAD_TYPE_COUNT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GamepadType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GamepadType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GamepadType where
  minDeclaredValue = SDL_GAMEPAD_TYPE_UNKNOWN

  maxDeclaredValue = SDL_GAMEPAD_TYPE_COUNT

instance Show SDL_GamepadType where
  showsPrec = CEnum.shows

instance Read SDL_GamepadType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GamepadType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GamepadType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GamepadType "unwrap" where
  type CFieldType SDL_GamepadType "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GAMEPAD_TYPE_UNKNOWN@, defined at @SDL3\/SDL_gamepad.h 113:5@
pattern SDL_GAMEPAD_TYPE_UNKNOWN :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_UNKNOWN = SDL_GamepadType 0

-- | [C declaration]: @SDL_GAMEPAD_TYPE_STANDARD@, defined at @SDL3\/SDL_gamepad.h 114:5@
pattern SDL_GAMEPAD_TYPE_STANDARD :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_STANDARD = SDL_GamepadType 1

-- | [C declaration]: @SDL_GAMEPAD_TYPE_XBOX360@, defined at @SDL3\/SDL_gamepad.h 115:5@
pattern SDL_GAMEPAD_TYPE_XBOX360 :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_XBOX360 = SDL_GamepadType 2

-- | [C declaration]: @SDL_GAMEPAD_TYPE_XBOXONE@, defined at @SDL3\/SDL_gamepad.h 116:5@
pattern SDL_GAMEPAD_TYPE_XBOXONE :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_XBOXONE = SDL_GamepadType 3

-- | [C declaration]: @SDL_GAMEPAD_TYPE_PS3@, defined at @SDL3\/SDL_gamepad.h 117:5@
pattern SDL_GAMEPAD_TYPE_PS3 :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_PS3 = SDL_GamepadType 4

-- | [C declaration]: @SDL_GAMEPAD_TYPE_PS4@, defined at @SDL3\/SDL_gamepad.h 118:5@
pattern SDL_GAMEPAD_TYPE_PS4 :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_PS4 = SDL_GamepadType 5

-- | [C declaration]: @SDL_GAMEPAD_TYPE_PS5@, defined at @SDL3\/SDL_gamepad.h 119:5@
pattern SDL_GAMEPAD_TYPE_PS5 :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_PS5 = SDL_GamepadType 6

-- | [C declaration]: @SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO@, defined at @SDL3\/SDL_gamepad.h 120:5@
pattern SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO = SDL_GamepadType 7

-- | [C declaration]: @SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT@, defined at @SDL3\/SDL_gamepad.h 121:5@
pattern SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT = SDL_GamepadType 8

-- | [C declaration]: @SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT@, defined at @SDL3\/SDL_gamepad.h 122:5@
pattern SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT = SDL_GamepadType 9

-- | [C declaration]: @SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR@, defined at @SDL3\/SDL_gamepad.h 123:5@
pattern SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR = SDL_GamepadType 10

-- | [C declaration]: @SDL_GAMEPAD_TYPE_GAMECUBE@, defined at @SDL3\/SDL_gamepad.h 124:5@
pattern SDL_GAMEPAD_TYPE_GAMECUBE :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_GAMECUBE = SDL_GamepadType 11

-- | [C declaration]: @SDL_GAMEPAD_TYPE_COUNT@, defined at @SDL3\/SDL_gamepad.h 125:5@
pattern SDL_GAMEPAD_TYPE_COUNT :: SDL_GamepadType
pattern SDL_GAMEPAD_TYPE_COUNT = SDL_GamepadType 12

-- | The list of buttons available on a gamepad
--
--     For controllers that use a diamond pattern for the face buttons, the south\/east\/west\/north buttons below correspond to the locations in the diamond pattern. For Xbox controllers, this would be A\/B\/X\/Y, for Nintendo Switch controllers, this would be B\/A\/Y\/X, for GameCube controllers this would be A\/X\/B\/Y, for PlayStation controllers this would be Cross\/Circle\/Square\/Triangle.
--
--     For controllers that don\'t use a diamond pattern for the face buttons, the south\/east\/west\/north buttons indicate the buttons labeled A, B, C, D, or 1, 2, 3, 4, or for controllers that aren\'t labeled, they are the primary, secondary, etc. buttons.
--
--     The activate action is often the south button and the cancel action is often the east button, but in some regions this is reversed, so your game should allow remapping actions based on user preferences.
--
--     You can query the labels for the face buttons using @SDL_GetGamepadButtonLabel()@
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_GamepadButton@, defined at @SDL3\/SDL_gamepad.h 152:14@
newtype SDL_GamepadButton = SDL_GamepadButton
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GamepadButton where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GamepadButton where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadButton
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GamepadButton where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadButton unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GamepadButton instance BG.Storable SDL_GamepadButton

deriving via BG.CInt instance BG.Prim SDL_GamepadButton

instance CEnum.CEnum SDL_GamepadButton where
  type CEnumZ SDL_GamepadButton = BG.CInt

  toCEnum = SDL_GamepadButton

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (-1, BG.singleton "SDL_GAMEPAD_BUTTON_INVALID")
        , (0, BG.singleton "SDL_GAMEPAD_BUTTON_SOUTH")
        , (1, BG.singleton "SDL_GAMEPAD_BUTTON_EAST")
        , (2, BG.singleton "SDL_GAMEPAD_BUTTON_WEST")
        , (3, BG.singleton "SDL_GAMEPAD_BUTTON_NORTH")
        , (4, BG.singleton "SDL_GAMEPAD_BUTTON_BACK")
        , (5, BG.singleton "SDL_GAMEPAD_BUTTON_GUIDE")
        , (6, BG.singleton "SDL_GAMEPAD_BUTTON_START")
        , (7, BG.singleton "SDL_GAMEPAD_BUTTON_LEFT_STICK")
        , (8, BG.singleton "SDL_GAMEPAD_BUTTON_RIGHT_STICK")
        , (9, BG.singleton "SDL_GAMEPAD_BUTTON_LEFT_SHOULDER")
        , (10, BG.singleton "SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER")
        , (11, BG.singleton "SDL_GAMEPAD_BUTTON_DPAD_UP")
        , (12, BG.singleton "SDL_GAMEPAD_BUTTON_DPAD_DOWN")
        , (13, BG.singleton "SDL_GAMEPAD_BUTTON_DPAD_LEFT")
        , (14, BG.singleton "SDL_GAMEPAD_BUTTON_DPAD_RIGHT")
        , (15, BG.singleton "SDL_GAMEPAD_BUTTON_MISC1")
        , (16, BG.singleton "SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1")
        , (17, BG.singleton "SDL_GAMEPAD_BUTTON_LEFT_PADDLE1")
        , (18, BG.singleton "SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2")
        , (19, BG.singleton "SDL_GAMEPAD_BUTTON_LEFT_PADDLE2")
        , (20, BG.singleton "SDL_GAMEPAD_BUTTON_TOUCHPAD")
        , (21, BG.singleton "SDL_GAMEPAD_BUTTON_MISC2")
        , (22, BG.singleton "SDL_GAMEPAD_BUTTON_MISC3")
        , (23, BG.singleton "SDL_GAMEPAD_BUTTON_MISC4")
        , (24, BG.singleton "SDL_GAMEPAD_BUTTON_MISC5")
        , (25, BG.singleton "SDL_GAMEPAD_BUTTON_MISC6")
        , (26, BG.singleton "SDL_GAMEPAD_BUTTON_COUNT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GamepadButton"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GamepadButton"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GamepadButton where
  minDeclaredValue = SDL_GAMEPAD_BUTTON_INVALID

  maxDeclaredValue = SDL_GAMEPAD_BUTTON_COUNT

instance Show SDL_GamepadButton where
  showsPrec = CEnum.shows

instance Read SDL_GamepadButton where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GamepadButton ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadButton{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GamepadButton) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GamepadButton "unwrap" where
  type CFieldType SDL_GamepadButton "unwrap" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_INVALID@, defined at @SDL3\/SDL_gamepad.h 154:5@
pattern SDL_GAMEPAD_BUTTON_INVALID :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_INVALID = SDL_GamepadButton (-1)

-- | Bottom face button (e.g. Xbox A button)
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_SOUTH@, defined at @SDL3\/SDL_gamepad.h 155:5@
pattern SDL_GAMEPAD_BUTTON_SOUTH :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_SOUTH = SDL_GamepadButton 0

-- | Right face button (e.g. Xbox B button)
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_EAST@, defined at @SDL3\/SDL_gamepad.h 156:5@
pattern SDL_GAMEPAD_BUTTON_EAST :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_EAST = SDL_GamepadButton 1

-- | Left face button (e.g. Xbox X button)
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_WEST@, defined at @SDL3\/SDL_gamepad.h 157:5@
pattern SDL_GAMEPAD_BUTTON_WEST :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_WEST = SDL_GamepadButton 2

-- | Top face button (e.g. Xbox Y button)
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_NORTH@, defined at @SDL3\/SDL_gamepad.h 158:5@
pattern SDL_GAMEPAD_BUTTON_NORTH :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_NORTH = SDL_GamepadButton 3

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_BACK@, defined at @SDL3\/SDL_gamepad.h 159:5@
pattern SDL_GAMEPAD_BUTTON_BACK :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_BACK = SDL_GamepadButton 4

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_GUIDE@, defined at @SDL3\/SDL_gamepad.h 160:5@
pattern SDL_GAMEPAD_BUTTON_GUIDE :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_GUIDE = SDL_GamepadButton 5

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_START@, defined at @SDL3\/SDL_gamepad.h 161:5@
pattern SDL_GAMEPAD_BUTTON_START :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_START = SDL_GamepadButton 6

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_LEFT_STICK@, defined at @SDL3\/SDL_gamepad.h 162:5@
pattern SDL_GAMEPAD_BUTTON_LEFT_STICK :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_LEFT_STICK = SDL_GamepadButton 7

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_RIGHT_STICK@, defined at @SDL3\/SDL_gamepad.h 163:5@
pattern SDL_GAMEPAD_BUTTON_RIGHT_STICK :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_RIGHT_STICK = SDL_GamepadButton 8

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_LEFT_SHOULDER@, defined at @SDL3\/SDL_gamepad.h 164:5@
pattern SDL_GAMEPAD_BUTTON_LEFT_SHOULDER :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_LEFT_SHOULDER = SDL_GamepadButton 9

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER@, defined at @SDL3\/SDL_gamepad.h 165:5@
pattern SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER = SDL_GamepadButton 10

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_DPAD_UP@, defined at @SDL3\/SDL_gamepad.h 166:5@
pattern SDL_GAMEPAD_BUTTON_DPAD_UP :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_DPAD_UP = SDL_GamepadButton 11

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_DPAD_DOWN@, defined at @SDL3\/SDL_gamepad.h 167:5@
pattern SDL_GAMEPAD_BUTTON_DPAD_DOWN :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_DPAD_DOWN = SDL_GamepadButton 12

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_DPAD_LEFT@, defined at @SDL3\/SDL_gamepad.h 168:5@
pattern SDL_GAMEPAD_BUTTON_DPAD_LEFT :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_DPAD_LEFT = SDL_GamepadButton 13

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_DPAD_RIGHT@, defined at @SDL3\/SDL_gamepad.h 169:5@
pattern SDL_GAMEPAD_BUTTON_DPAD_RIGHT :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_DPAD_RIGHT = SDL_GamepadButton 14

-- | Additional button (e.g. Xbox Series X share button, PS5 microphone button, Nintendo Switch Pro capture button, Amazon Luna microphone button, Google Stadia capture button)
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_MISC1@, defined at @SDL3\/SDL_gamepad.h 170:5@
pattern SDL_GAMEPAD_BUTTON_MISC1 :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_MISC1 = SDL_GamepadButton 15

-- | Upper or primary paddle, under your right hand (e.g. Xbox Elite paddle P1, DualSense Edge RB button, Right Joy-Con SR button)
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1@, defined at @SDL3\/SDL_gamepad.h 171:5@
pattern SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1 :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1 = SDL_GamepadButton 16

-- | Upper or primary paddle, under your left hand (e.g. Xbox Elite paddle P3, DualSense Edge LB button, Left Joy-Con SL button)
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_LEFT_PADDLE1@, defined at @SDL3\/SDL_gamepad.h 172:5@
pattern SDL_GAMEPAD_BUTTON_LEFT_PADDLE1 :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_LEFT_PADDLE1 = SDL_GamepadButton 17

-- | Lower or secondary paddle, under your right hand (e.g. Xbox Elite paddle P2, DualSense Edge right Fn button, Right Joy-Con SL button)
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2@, defined at @SDL3\/SDL_gamepad.h 173:5@
pattern SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2 :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2 = SDL_GamepadButton 18

-- | Lower or secondary paddle, under your left hand (e.g. Xbox Elite paddle P4, DualSense Edge left Fn button, Left Joy-Con SR button)
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_LEFT_PADDLE2@, defined at @SDL3\/SDL_gamepad.h 174:5@
pattern SDL_GAMEPAD_BUTTON_LEFT_PADDLE2 :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_LEFT_PADDLE2 = SDL_GamepadButton 19

-- | PS4\/PS5 touchpad button
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_TOUCHPAD@, defined at @SDL3\/SDL_gamepad.h 175:5@
pattern SDL_GAMEPAD_BUTTON_TOUCHPAD :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_TOUCHPAD = SDL_GamepadButton 20

-- | Additional button
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_MISC2@, defined at @SDL3\/SDL_gamepad.h 176:5@
pattern SDL_GAMEPAD_BUTTON_MISC2 :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_MISC2 = SDL_GamepadButton 21

-- | Additional button (e.g. Nintendo GameCube left trigger click)
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_MISC3@, defined at @SDL3\/SDL_gamepad.h 177:5@
pattern SDL_GAMEPAD_BUTTON_MISC3 :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_MISC3 = SDL_GamepadButton 22

-- | Additional button (e.g. Nintendo GameCube right trigger click)
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_MISC4@, defined at @SDL3\/SDL_gamepad.h 178:5@
pattern SDL_GAMEPAD_BUTTON_MISC4 :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_MISC4 = SDL_GamepadButton 23

-- | Additional button
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_MISC5@, defined at @SDL3\/SDL_gamepad.h 179:5@
pattern SDL_GAMEPAD_BUTTON_MISC5 :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_MISC5 = SDL_GamepadButton 24

-- | Additional button
--
--     [C declaration]: @SDL_GAMEPAD_BUTTON_MISC6@, defined at @SDL3\/SDL_gamepad.h 180:5@
pattern SDL_GAMEPAD_BUTTON_MISC6 :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_MISC6 = SDL_GamepadButton 25

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_COUNT@, defined at @SDL3\/SDL_gamepad.h 181:5@
pattern SDL_GAMEPAD_BUTTON_COUNT :: SDL_GamepadButton
pattern SDL_GAMEPAD_BUTTON_COUNT = SDL_GamepadButton 26

-- | The set of gamepad button labels
--
--     This isn\'t a complete set, just the face buttons to make it easy to show button prompts.
--
--     For a complete set, you should look at the button and gamepad type and have a set of symbols that work well with your art style.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_GamepadButtonLabel@, defined at @SDL3\/SDL_gamepad.h 195:14@
newtype SDL_GamepadButtonLabel = SDL_GamepadButtonLabel
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GamepadButtonLabel where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GamepadButtonLabel where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadButtonLabel
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GamepadButtonLabel where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadButtonLabel unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_GamepadButtonLabel
  instance
    BG.Storable SDL_GamepadButtonLabel

deriving via BG.CUInt instance BG.Prim SDL_GamepadButtonLabel

instance CEnum.CEnum SDL_GamepadButtonLabel where
  type CEnumZ SDL_GamepadButtonLabel = BG.CUInt

  toCEnum = SDL_GamepadButtonLabel

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN")
        , (1, BG.singleton "SDL_GAMEPAD_BUTTON_LABEL_A")
        , (2, BG.singleton "SDL_GAMEPAD_BUTTON_LABEL_B")
        , (3, BG.singleton "SDL_GAMEPAD_BUTTON_LABEL_X")
        , (4, BG.singleton "SDL_GAMEPAD_BUTTON_LABEL_Y")
        , (5, BG.singleton "SDL_GAMEPAD_BUTTON_LABEL_CROSS")
        , (6, BG.singleton "SDL_GAMEPAD_BUTTON_LABEL_CIRCLE")
        , (7, BG.singleton "SDL_GAMEPAD_BUTTON_LABEL_SQUARE")
        , (8, BG.singleton "SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GamepadButtonLabel"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GamepadButtonLabel"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GamepadButtonLabel where
  minDeclaredValue = SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN

  maxDeclaredValue = SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE

instance Show SDL_GamepadButtonLabel where
  showsPrec = CEnum.shows

instance Read SDL_GamepadButtonLabel where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GamepadButtonLabel ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadButtonLabel{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GamepadButtonLabel) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GamepadButtonLabel "unwrap" where
  type
    CFieldType SDL_GamepadButtonLabel "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN@, defined at @SDL3\/SDL_gamepad.h 197:5@
pattern SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN :: SDL_GamepadButtonLabel
pattern SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN = SDL_GamepadButtonLabel 0

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_LABEL_A@, defined at @SDL3\/SDL_gamepad.h 198:5@
pattern SDL_GAMEPAD_BUTTON_LABEL_A :: SDL_GamepadButtonLabel
pattern SDL_GAMEPAD_BUTTON_LABEL_A = SDL_GamepadButtonLabel 1

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_LABEL_B@, defined at @SDL3\/SDL_gamepad.h 199:5@
pattern SDL_GAMEPAD_BUTTON_LABEL_B :: SDL_GamepadButtonLabel
pattern SDL_GAMEPAD_BUTTON_LABEL_B = SDL_GamepadButtonLabel 2

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_LABEL_X@, defined at @SDL3\/SDL_gamepad.h 200:5@
pattern SDL_GAMEPAD_BUTTON_LABEL_X :: SDL_GamepadButtonLabel
pattern SDL_GAMEPAD_BUTTON_LABEL_X = SDL_GamepadButtonLabel 3

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_LABEL_Y@, defined at @SDL3\/SDL_gamepad.h 201:5@
pattern SDL_GAMEPAD_BUTTON_LABEL_Y :: SDL_GamepadButtonLabel
pattern SDL_GAMEPAD_BUTTON_LABEL_Y = SDL_GamepadButtonLabel 4

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_LABEL_CROSS@, defined at @SDL3\/SDL_gamepad.h 202:5@
pattern SDL_GAMEPAD_BUTTON_LABEL_CROSS :: SDL_GamepadButtonLabel
pattern SDL_GAMEPAD_BUTTON_LABEL_CROSS = SDL_GamepadButtonLabel 5

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_LABEL_CIRCLE@, defined at @SDL3\/SDL_gamepad.h 203:5@
pattern SDL_GAMEPAD_BUTTON_LABEL_CIRCLE :: SDL_GamepadButtonLabel
pattern SDL_GAMEPAD_BUTTON_LABEL_CIRCLE = SDL_GamepadButtonLabel 6

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_LABEL_SQUARE@, defined at @SDL3\/SDL_gamepad.h 204:5@
pattern SDL_GAMEPAD_BUTTON_LABEL_SQUARE :: SDL_GamepadButtonLabel
pattern SDL_GAMEPAD_BUTTON_LABEL_SQUARE = SDL_GamepadButtonLabel 7

-- | [C declaration]: @SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE@, defined at @SDL3\/SDL_gamepad.h 205:5@
pattern SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE :: SDL_GamepadButtonLabel
pattern SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE = SDL_GamepadButtonLabel 8

-- | The list of axes available on a gamepad
--
--     Thumbstick axis values range from SDL_JOYSTICK_AXIS_MIN to SDL_JOYSTICK_AXIS_MAX, and are centered within ~8000 of zero, though advanced UI will allow users to set or autodetect the dead zone, which varies between gamepads.
--
--     Trigger axis values range from 0 (released) to SDL_JOYSTICK_AXIS_MAX (fully pressed) when reported by @SDL_GetGamepadAxis()@. Note that this is not the same range that will be reported by the lower-level SDL_GetJoystickAxis().
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_GamepadAxis@, defined at @SDL3\/SDL_gamepad.h 222:14@
newtype SDL_GamepadAxis = SDL_GamepadAxis
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GamepadAxis where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GamepadAxis where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadAxis
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GamepadAxis where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadAxis unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GamepadAxis instance BG.Storable SDL_GamepadAxis

deriving via BG.CInt instance BG.Prim SDL_GamepadAxis

instance CEnum.CEnum SDL_GamepadAxis where
  type CEnumZ SDL_GamepadAxis = BG.CInt

  toCEnum = SDL_GamepadAxis

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (-1, BG.singleton "SDL_GAMEPAD_AXIS_INVALID")
        , (0, BG.singleton "SDL_GAMEPAD_AXIS_LEFTX")
        , (1, BG.singleton "SDL_GAMEPAD_AXIS_LEFTY")
        , (2, BG.singleton "SDL_GAMEPAD_AXIS_RIGHTX")
        , (3, BG.singleton "SDL_GAMEPAD_AXIS_RIGHTY")
        , (4, BG.singleton "SDL_GAMEPAD_AXIS_LEFT_TRIGGER")
        , (5, BG.singleton "SDL_GAMEPAD_AXIS_RIGHT_TRIGGER")
        , (6, BG.singleton "SDL_GAMEPAD_AXIS_COUNT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GamepadAxis"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GamepadAxis"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GamepadAxis where
  minDeclaredValue = SDL_GAMEPAD_AXIS_INVALID

  maxDeclaredValue = SDL_GAMEPAD_AXIS_COUNT

instance Show SDL_GamepadAxis where
  showsPrec = CEnum.shows

instance Read SDL_GamepadAxis where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GamepadAxis ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadAxis{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GamepadAxis) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GamepadAxis "unwrap" where
  type CFieldType SDL_GamepadAxis "unwrap" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GAMEPAD_AXIS_INVALID@, defined at @SDL3\/SDL_gamepad.h 224:5@
pattern SDL_GAMEPAD_AXIS_INVALID :: SDL_GamepadAxis
pattern SDL_GAMEPAD_AXIS_INVALID = SDL_GamepadAxis (-1)

-- | [C declaration]: @SDL_GAMEPAD_AXIS_LEFTX@, defined at @SDL3\/SDL_gamepad.h 225:5@
pattern SDL_GAMEPAD_AXIS_LEFTX :: SDL_GamepadAxis
pattern SDL_GAMEPAD_AXIS_LEFTX = SDL_GamepadAxis 0

-- | [C declaration]: @SDL_GAMEPAD_AXIS_LEFTY@, defined at @SDL3\/SDL_gamepad.h 226:5@
pattern SDL_GAMEPAD_AXIS_LEFTY :: SDL_GamepadAxis
pattern SDL_GAMEPAD_AXIS_LEFTY = SDL_GamepadAxis 1

-- | [C declaration]: @SDL_GAMEPAD_AXIS_RIGHTX@, defined at @SDL3\/SDL_gamepad.h 227:5@
pattern SDL_GAMEPAD_AXIS_RIGHTX :: SDL_GamepadAxis
pattern SDL_GAMEPAD_AXIS_RIGHTX = SDL_GamepadAxis 2

-- | [C declaration]: @SDL_GAMEPAD_AXIS_RIGHTY@, defined at @SDL3\/SDL_gamepad.h 228:5@
pattern SDL_GAMEPAD_AXIS_RIGHTY :: SDL_GamepadAxis
pattern SDL_GAMEPAD_AXIS_RIGHTY = SDL_GamepadAxis 3

-- | [C declaration]: @SDL_GAMEPAD_AXIS_LEFT_TRIGGER@, defined at @SDL3\/SDL_gamepad.h 229:5@
pattern SDL_GAMEPAD_AXIS_LEFT_TRIGGER :: SDL_GamepadAxis
pattern SDL_GAMEPAD_AXIS_LEFT_TRIGGER = SDL_GamepadAxis 4

-- | [C declaration]: @SDL_GAMEPAD_AXIS_RIGHT_TRIGGER@, defined at @SDL3\/SDL_gamepad.h 230:5@
pattern SDL_GAMEPAD_AXIS_RIGHT_TRIGGER :: SDL_GamepadAxis
pattern SDL_GAMEPAD_AXIS_RIGHT_TRIGGER = SDL_GamepadAxis 5

-- | [C declaration]: @SDL_GAMEPAD_AXIS_COUNT@, defined at @SDL3\/SDL_gamepad.h 231:5@
pattern SDL_GAMEPAD_AXIS_COUNT :: SDL_GamepadAxis
pattern SDL_GAMEPAD_AXIS_COUNT = SDL_GamepadAxis 6

-- | Types of gamepad control bindings.
--
--     A gamepad is a collection of bindings that map arbitrary joystick buttons, axes and hat switches to specific positions on a generic console-style gamepad. This enum is used as part of 'SDL_GamepadBinding' to specify those mappings.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_GamepadBindingType@, defined at @SDL3\/SDL_gamepad.h 244:14@
newtype SDL_GamepadBindingType = SDL_GamepadBindingType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GamepadBindingType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GamepadBindingType where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadBindingType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GamepadBindingType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadBindingType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_GamepadBindingType
  instance
    BG.Storable SDL_GamepadBindingType

deriving via BG.CUInt instance BG.Prim SDL_GamepadBindingType

instance CEnum.CEnum SDL_GamepadBindingType where
  type CEnumZ SDL_GamepadBindingType = BG.CUInt

  toCEnum = SDL_GamepadBindingType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GAMEPAD_BINDTYPE_NONE")
        , (1, BG.singleton "SDL_GAMEPAD_BINDTYPE_BUTTON")
        , (2, BG.singleton "SDL_GAMEPAD_BINDTYPE_AXIS")
        , (3, BG.singleton "SDL_GAMEPAD_BINDTYPE_HAT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GamepadBindingType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GamepadBindingType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GamepadBindingType where
  minDeclaredValue = SDL_GAMEPAD_BINDTYPE_NONE

  maxDeclaredValue = SDL_GAMEPAD_BINDTYPE_HAT

instance Show SDL_GamepadBindingType where
  showsPrec = CEnum.shows

instance Read SDL_GamepadBindingType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GamepadBindingType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBindingType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GamepadBindingType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GamepadBindingType "unwrap" where
  type
    CFieldType SDL_GamepadBindingType "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GAMEPAD_BINDTYPE_NONE@, defined at @SDL3\/SDL_gamepad.h 246:5@
pattern SDL_GAMEPAD_BINDTYPE_NONE :: SDL_GamepadBindingType
pattern SDL_GAMEPAD_BINDTYPE_NONE = SDL_GamepadBindingType 0

-- | [C declaration]: @SDL_GAMEPAD_BINDTYPE_BUTTON@, defined at @SDL3\/SDL_gamepad.h 247:5@
pattern SDL_GAMEPAD_BINDTYPE_BUTTON :: SDL_GamepadBindingType
pattern SDL_GAMEPAD_BINDTYPE_BUTTON = SDL_GamepadBindingType 1

-- | [C declaration]: @SDL_GAMEPAD_BINDTYPE_AXIS@, defined at @SDL3\/SDL_gamepad.h 248:5@
pattern SDL_GAMEPAD_BINDTYPE_AXIS :: SDL_GamepadBindingType
pattern SDL_GAMEPAD_BINDTYPE_AXIS = SDL_GamepadBindingType 2

-- | [C declaration]: @SDL_GAMEPAD_BINDTYPE_HAT@, defined at @SDL3\/SDL_gamepad.h 249:5@
pattern SDL_GAMEPAD_BINDTYPE_HAT :: SDL_GamepadBindingType
pattern SDL_GAMEPAD_BINDTYPE_HAT = SDL_GamepadBindingType 3

-- | [C declaration]: @struct \@SDL_GamepadBinding_input_axis@, defined at @SDL3\/SDL_gamepad.h 274:9@
data SDL_GamepadBinding_input_axis = SDL_GamepadBinding_input_axis
  { axis :: BG.CInt
  -- ^ [C declaration]: @axis@, defined at @SDL3\/SDL_gamepad.h 276:17@
  , axis_min :: BG.CInt
  -- ^ [C declaration]: @axis_min@, defined at @SDL3\/SDL_gamepad.h 277:17@
  , axis_max :: BG.CInt
  -- ^ [C declaration]: @axis_max@, defined at @SDL3\/SDL_gamepad.h 278:17@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GamepadBinding_input_axis where
  staticSizeOf = \_ -> (12 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GamepadBinding_input_axis where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadBinding_input_axis
        <*> HasCField.readRaw (BG.Proxy @"axis") ptr0
        <*> HasCField.readRaw (BG.Proxy @"axis_min") ptr0
        <*> HasCField.readRaw (BG.Proxy @"axis_max") ptr0

instance Marshal.WriteRaw SDL_GamepadBinding_input_axis where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadBinding_input_axis axis2 axis_min3 axis_max4 ->
            HasCField.writeRaw (BG.Proxy @"axis") ptr0 axis2
              >> HasCField.writeRaw (BG.Proxy @"axis_min") ptr0 axis_min3
              >> HasCField.writeRaw (BG.Proxy @"axis_max") ptr0 axis_max4

deriving via
  Marshal.EquivStorable SDL_GamepadBinding_input_axis
  instance
    BG.Storable SDL_GamepadBinding_input_axis

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "axis" SDL_GamepadBinding_input_axis ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBinding_input_axis
            { axis = y1
            , axis_min = BG.getField @"axis_min" x0
            , axis_max = BG.getField @"axis_max" x0
            }
      , BG.getField @"axis" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "axis" (BG.Ptr SDL_GamepadBinding_input_axis) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"axis")

instance HasCField.HasCField SDL_GamepadBinding_input_axis "axis" where
  type
    CFieldType SDL_GamepadBinding_input_axis "axis" =
      BG.CInt

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "axis_min" SDL_GamepadBinding_input_axis ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBinding_input_axis
            { axis_min = y1
            , axis = BG.getField @"axis" x0
            , axis_max = BG.getField @"axis_max" x0
            }
      , BG.getField @"axis_min" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "axis_min" (BG.Ptr SDL_GamepadBinding_input_axis) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"axis_min")

instance HasCField.HasCField SDL_GamepadBinding_input_axis "axis_min" where
  type
    CFieldType SDL_GamepadBinding_input_axis "axis_min" =
      BG.CInt

  offset# = \_ -> \_ -> 4

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "axis_max" SDL_GamepadBinding_input_axis ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBinding_input_axis
            { axis_max = y1
            , axis = BG.getField @"axis" x0
            , axis_min = BG.getField @"axis_min" x0
            }
      , BG.getField @"axis_max" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "axis_max" (BG.Ptr SDL_GamepadBinding_input_axis) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"axis_max")

instance HasCField.HasCField SDL_GamepadBinding_input_axis "axis_max" where
  type
    CFieldType SDL_GamepadBinding_input_axis "axis_max" =
      BG.CInt

  offset# = \_ -> \_ -> 8

-- | [C declaration]: @struct \@SDL_GamepadBinding_input_hat@, defined at @SDL3\/SDL_gamepad.h 281:9@
data SDL_GamepadBinding_input_hat = SDL_GamepadBinding_input_hat
  { hat :: BG.CInt
  -- ^ [C declaration]: @hat@, defined at @SDL3\/SDL_gamepad.h 283:17@
  , hat_mask :: BG.CInt
  -- ^ [C declaration]: @hat_mask@, defined at @SDL3\/SDL_gamepad.h 284:17@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GamepadBinding_input_hat where
  staticSizeOf = \_ -> (8 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GamepadBinding_input_hat where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadBinding_input_hat
        <*> HasCField.readRaw (BG.Proxy @"hat") ptr0
        <*> HasCField.readRaw (BG.Proxy @"hat_mask") ptr0

instance Marshal.WriteRaw SDL_GamepadBinding_input_hat where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadBinding_input_hat hat2 hat_mask3 ->
            HasCField.writeRaw (BG.Proxy @"hat") ptr0 hat2
              >> HasCField.writeRaw (BG.Proxy @"hat_mask") ptr0 hat_mask3

deriving via
  Marshal.EquivStorable SDL_GamepadBinding_input_hat
  instance
    BG.Storable SDL_GamepadBinding_input_hat

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "hat" SDL_GamepadBinding_input_hat ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBinding_input_hat{hat = y1, hat_mask = BG.getField @"hat_mask" x0}
      , BG.getField @"hat" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "hat" (BG.Ptr SDL_GamepadBinding_input_hat) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"hat")

instance HasCField.HasCField SDL_GamepadBinding_input_hat "hat" where
  type
    CFieldType SDL_GamepadBinding_input_hat "hat" =
      BG.CInt

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "hat_mask" SDL_GamepadBinding_input_hat ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBinding_input_hat{hat_mask = y1, hat = BG.getField @"hat" x0}
      , BG.getField @"hat_mask" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "hat_mask" (BG.Ptr SDL_GamepadBinding_input_hat) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"hat_mask")

instance HasCField.HasCField SDL_GamepadBinding_input_hat "hat_mask" where
  type
    CFieldType SDL_GamepadBinding_input_hat "hat_mask" =
      BG.CInt

  offset# = \_ -> \_ -> 4

-- | [C declaration]: @union \@SDL_GamepadBinding_input@, defined at @SDL3\/SDL_gamepad.h 270:5@
newtype SDL_GamepadBinding_input = SDL_GamepadBinding_input
  { unwrap :: BG.ByteArray
  }
  deriving stock (BG.Generic)

deriving via BG.SizedByteArray 12 4 instance Marshal.StaticSize SDL_GamepadBinding_input

deriving via BG.SizedByteArray 12 4 instance Marshal.ReadRaw SDL_GamepadBinding_input

deriving via BG.SizedByteArray 12 4 instance Marshal.WriteRaw SDL_GamepadBinding_input

deriving via
  Marshal.EquivStorable SDL_GamepadBinding_input
  instance
    BG.Storable SDL_GamepadBinding_input

deriving via BG.SizedByteArray 12 4 instance Union.IsUnion SDL_GamepadBinding_input

-- | [C declaration]: @button@, defined at @SDL3\/SDL_gamepad.h 272:13@
instance
  (ty ~ BG.CInt)
  => BG.HasField "button" SDL_GamepadBinding_input ty
  where
  getField = BG.getUnionPayload

-- | [C declaration]: @button@, defined at @SDL3\/SDL_gamepad.h 272:13@
instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "button" SDL_GamepadBinding_input ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"button" x0)

instance
  (ty ~ BG.CInt)
  => BG.HasField "button" (BG.Ptr SDL_GamepadBinding_input) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"button")

instance HasCField.HasCField SDL_GamepadBinding_input "button" where
  type
    CFieldType SDL_GamepadBinding_input "button" =
      BG.CInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @axis@, defined at @SDL3\/SDL_gamepad.h 279:11@
instance
  (ty ~ SDL_GamepadBinding_input_axis)
  => BG.HasField "axis" SDL_GamepadBinding_input ty
  where
  getField = BG.getUnionPayload

-- | [C declaration]: @axis@, defined at @SDL3\/SDL_gamepad.h 279:11@
instance
  (ty ~ SDL_GamepadBinding_input_axis)
  => BG.CompatHasField.HasField "axis" SDL_GamepadBinding_input ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"axis" x0)

instance
  (ty ~ SDL_GamepadBinding_input_axis)
  => BG.HasField "axis" (BG.Ptr SDL_GamepadBinding_input) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"axis")

instance HasCField.HasCField SDL_GamepadBinding_input "axis" where
  type
    CFieldType SDL_GamepadBinding_input "axis" =
      SDL_GamepadBinding_input_axis

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @hat@, defined at @SDL3\/SDL_gamepad.h 285:11@
instance
  (ty ~ SDL_GamepadBinding_input_hat)
  => BG.HasField "hat" SDL_GamepadBinding_input ty
  where
  getField = BG.getUnionPayload

-- | [C declaration]: @hat@, defined at @SDL3\/SDL_gamepad.h 285:11@
instance
  (ty ~ SDL_GamepadBinding_input_hat)
  => BG.CompatHasField.HasField "hat" SDL_GamepadBinding_input ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"hat" x0)

instance
  (ty ~ SDL_GamepadBinding_input_hat)
  => BG.HasField "hat" (BG.Ptr SDL_GamepadBinding_input) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"hat")

instance HasCField.HasCField SDL_GamepadBinding_input "hat" where
  type
    CFieldType SDL_GamepadBinding_input "hat" =
      SDL_GamepadBinding_input_hat

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @struct \@SDL_GamepadBinding_output_axis@, defined at @SDL3\/SDL_gamepad.h 294:9@
data SDL_GamepadBinding_output_axis = SDL_GamepadBinding_output_axis
  { axis :: SDL_GamepadAxis
  -- ^ [C declaration]: @axis@, defined at @SDL3\/SDL_gamepad.h 296:29@
  , axis_min :: BG.CInt
  -- ^ [C declaration]: @axis_min@, defined at @SDL3\/SDL_gamepad.h 297:17@
  , axis_max :: BG.CInt
  -- ^ [C declaration]: @axis_max@, defined at @SDL3\/SDL_gamepad.h 298:17@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GamepadBinding_output_axis where
  staticSizeOf = \_ -> (12 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GamepadBinding_output_axis where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadBinding_output_axis
        <*> HasCField.readRaw (BG.Proxy @"axis") ptr0
        <*> HasCField.readRaw (BG.Proxy @"axis_min") ptr0
        <*> HasCField.readRaw (BG.Proxy @"axis_max") ptr0

instance Marshal.WriteRaw SDL_GamepadBinding_output_axis where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadBinding_output_axis axis2 axis_min3 axis_max4 ->
            HasCField.writeRaw (BG.Proxy @"axis") ptr0 axis2
              >> HasCField.writeRaw (BG.Proxy @"axis_min") ptr0 axis_min3
              >> HasCField.writeRaw (BG.Proxy @"axis_max") ptr0 axis_max4

deriving via
  Marshal.EquivStorable SDL_GamepadBinding_output_axis
  instance
    BG.Storable SDL_GamepadBinding_output_axis

instance
  (ty ~ SDL_GamepadAxis)
  => BG.CompatHasField.HasField "axis" SDL_GamepadBinding_output_axis ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBinding_output_axis
            { axis = y1
            , axis_min = BG.getField @"axis_min" x0
            , axis_max = BG.getField @"axis_max" x0
            }
      , BG.getField @"axis" x0
      )

instance
  (ty ~ SDL_GamepadAxis)
  => BG.HasField "axis" (BG.Ptr SDL_GamepadBinding_output_axis) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"axis")

instance HasCField.HasCField SDL_GamepadBinding_output_axis "axis" where
  type
    CFieldType SDL_GamepadBinding_output_axis "axis" =
      SDL_GamepadAxis

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "axis_min" SDL_GamepadBinding_output_axis ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBinding_output_axis
            { axis_min = y1
            , axis = BG.getField @"axis" x0
            , axis_max = BG.getField @"axis_max" x0
            }
      , BG.getField @"axis_min" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "axis_min" (BG.Ptr SDL_GamepadBinding_output_axis) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"axis_min")

instance HasCField.HasCField SDL_GamepadBinding_output_axis "axis_min" where
  type
    CFieldType SDL_GamepadBinding_output_axis "axis_min" =
      BG.CInt

  offset# = \_ -> \_ -> 4

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "axis_max" SDL_GamepadBinding_output_axis ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBinding_output_axis
            { axis_max = y1
            , axis = BG.getField @"axis" x0
            , axis_min = BG.getField @"axis_min" x0
            }
      , BG.getField @"axis_max" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "axis_max" (BG.Ptr SDL_GamepadBinding_output_axis) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"axis_max")

instance HasCField.HasCField SDL_GamepadBinding_output_axis "axis_max" where
  type
    CFieldType SDL_GamepadBinding_output_axis "axis_max" =
      BG.CInt

  offset# = \_ -> \_ -> 8

-- | [C declaration]: @union \@SDL_GamepadBinding_output@, defined at @SDL3\/SDL_gamepad.h 290:5@
newtype SDL_GamepadBinding_output = SDL_GamepadBinding_output
  { unwrap :: BG.ByteArray
  }
  deriving stock (BG.Generic)

deriving via BG.SizedByteArray 12 4 instance Marshal.StaticSize SDL_GamepadBinding_output

deriving via BG.SizedByteArray 12 4 instance Marshal.ReadRaw SDL_GamepadBinding_output

deriving via BG.SizedByteArray 12 4 instance Marshal.WriteRaw SDL_GamepadBinding_output

deriving via
  Marshal.EquivStorable SDL_GamepadBinding_output
  instance
    BG.Storable SDL_GamepadBinding_output

deriving via BG.SizedByteArray 12 4 instance Union.IsUnion SDL_GamepadBinding_output

-- | [C declaration]: @button@, defined at @SDL3\/SDL_gamepad.h 292:27@
instance
  (ty ~ SDL_GamepadButton)
  => BG.HasField "button" SDL_GamepadBinding_output ty
  where
  getField = BG.getUnionPayload

-- | [C declaration]: @button@, defined at @SDL3\/SDL_gamepad.h 292:27@
instance
  (ty ~ SDL_GamepadButton)
  => BG.CompatHasField.HasField "button" SDL_GamepadBinding_output ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"button" x0)

instance
  (ty ~ SDL_GamepadButton)
  => BG.HasField "button" (BG.Ptr SDL_GamepadBinding_output) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"button")

instance HasCField.HasCField SDL_GamepadBinding_output "button" where
  type
    CFieldType SDL_GamepadBinding_output "button" =
      SDL_GamepadButton

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @axis@, defined at @SDL3\/SDL_gamepad.h 299:11@
instance
  (ty ~ SDL_GamepadBinding_output_axis)
  => BG.HasField "axis" SDL_GamepadBinding_output ty
  where
  getField = BG.getUnionPayload

-- | [C declaration]: @axis@, defined at @SDL3\/SDL_gamepad.h 299:11@
instance
  (ty ~ SDL_GamepadBinding_output_axis)
  => BG.CompatHasField.HasField "axis" SDL_GamepadBinding_output ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"axis" x0)

instance
  (ty ~ SDL_GamepadBinding_output_axis)
  => BG.HasField "axis" (BG.Ptr SDL_GamepadBinding_output) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"axis")

instance HasCField.HasCField SDL_GamepadBinding_output "axis" where
  type
    CFieldType SDL_GamepadBinding_output "axis" =
      SDL_GamepadBinding_output_axis

  offset# = \_ -> \_ -> 0

-- | A mapping between one joystick input to a gamepad control.
--
--     A gamepad has a collection of several bindings, to say, for example, when joystick button number 5 is pressed, that should be treated like the gamepad\'s \"start\" button.
--
--     SDL has these bindings built-in for many popular controllers, and can add more with a simple text string. Those strings are parsed into a collection of these structs to make it easier to operate on the data.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadBindings'
--
--     [C declaration]: @struct SDL_GamepadBinding@, defined at @SDL3\/SDL_gamepad.h 267:16@
data SDL_GamepadBinding = SDL_GamepadBinding
  { input_type :: SDL_GamepadBindingType
  -- ^ [C declaration]: @input_type@, defined at @SDL3\/SDL_gamepad.h 269:28@
  , input :: SDL_GamepadBinding_input
  -- ^ [C declaration]: @input@, defined at @SDL3\/SDL_gamepad.h 287:7@
  , output_type :: SDL_GamepadBindingType
  -- ^ [C declaration]: @output_type@, defined at @SDL3\/SDL_gamepad.h 289:28@
  , output :: SDL_GamepadBinding_output
  -- ^ [C declaration]: @output@, defined at @SDL3\/SDL_gamepad.h 301:7@
  }
  deriving stock (BG.Generic)

instance Marshal.StaticSize SDL_GamepadBinding where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GamepadBinding where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadBinding
        <*> HasCField.readRaw (BG.Proxy @"input_type") ptr0
        <*> HasCField.readRaw (BG.Proxy @"input") ptr0
        <*> HasCField.readRaw (BG.Proxy @"output_type") ptr0
        <*> HasCField.readRaw (BG.Proxy @"output") ptr0

instance Marshal.WriteRaw SDL_GamepadBinding where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadBinding input_type2 input3 output_type4 output5 ->
            HasCField.writeRaw (BG.Proxy @"input_type") ptr0 input_type2
              >> HasCField.writeRaw (BG.Proxy @"input") ptr0 input3
              >> HasCField.writeRaw (BG.Proxy @"output_type") ptr0 output_type4
              >> HasCField.writeRaw (BG.Proxy @"output") ptr0 output5

deriving via Marshal.EquivStorable SDL_GamepadBinding instance BG.Storable SDL_GamepadBinding

instance
  (ty ~ SDL_GamepadBindingType)
  => BG.CompatHasField.HasField "input_type" SDL_GamepadBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBinding
            { input_type = y1
            , input = BG.getField @"input" x0
            , output_type = BG.getField @"output_type" x0
            , output = BG.getField @"output" x0
            }
      , BG.getField @"input_type" x0
      )

instance
  (ty ~ SDL_GamepadBindingType)
  => BG.HasField "input_type" (BG.Ptr SDL_GamepadBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"input_type")

instance HasCField.HasCField SDL_GamepadBinding "input_type" where
  type
    CFieldType SDL_GamepadBinding "input_type" =
      SDL_GamepadBindingType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_GamepadBinding_input)
  => BG.CompatHasField.HasField "input" SDL_GamepadBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBinding
            { input = y1
            , input_type = BG.getField @"input_type" x0
            , output_type = BG.getField @"output_type" x0
            , output = BG.getField @"output" x0
            }
      , BG.getField @"input" x0
      )

instance
  (ty ~ SDL_GamepadBinding_input)
  => BG.HasField "input" (BG.Ptr SDL_GamepadBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"input")

instance HasCField.HasCField SDL_GamepadBinding "input" where
  type
    CFieldType SDL_GamepadBinding "input" =
      SDL_GamepadBinding_input

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL_GamepadBindingType)
  => BG.CompatHasField.HasField "output_type" SDL_GamepadBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBinding
            { output_type = y1
            , input_type = BG.getField @"input_type" x0
            , input = BG.getField @"input" x0
            , output = BG.getField @"output" x0
            }
      , BG.getField @"output_type" x0
      )

instance
  (ty ~ SDL_GamepadBindingType)
  => BG.HasField "output_type" (BG.Ptr SDL_GamepadBinding) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"output_type")

instance HasCField.HasCField SDL_GamepadBinding "output_type" where
  type
    CFieldType SDL_GamepadBinding "output_type" =
      SDL_GamepadBindingType

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL_GamepadBinding_output)
  => BG.CompatHasField.HasField "output" SDL_GamepadBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadBinding
            { output = y1
            , input_type = BG.getField @"input_type" x0
            , input = BG.getField @"input" x0
            , output_type = BG.getField @"output_type" x0
            }
      , BG.getField @"output" x0
      )

instance
  (ty ~ SDL_GamepadBinding_output)
  => BG.HasField "output" (BG.Ptr SDL_GamepadBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"output")

instance HasCField.HasCField SDL_GamepadBinding "output" where
  type
    CFieldType SDL_GamepadBinding "output" =
      SDL_GamepadBinding_output

  offset# = \_ -> \_ -> 20

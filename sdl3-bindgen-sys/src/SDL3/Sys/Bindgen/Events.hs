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

-- | Event queue management.
--
--     It\'s extremely common often required that an app deal with SDL\'s event queue. Almost all useful information about interactions with the real world flow through here: the user interacting with the computer and app, hardware coming and going, the system changing in some way, etc.
--
--     An app generally takes a moment, perhaps at the start of a new frame, to examine any events that have occurred since the last time and process or ignore them. This is generally done by calling @SDL_PollEvent()@ in a loop until it returns false (or, if using the main callbacks, events are provided one at a time in calls to SDL_AppEvent() before the next call to SDL_AppIterate(); in this scenario, the app does not call @SDL_PollEvent()@ at all).
--
--     There is other forms of control, too: @SDL_PeepEvents()@ has more functionality at the cost of more complexity, and @SDL_WaitEvent()@ can block the process until something interesting happens, which might be beneficial for certain types of programs on low-power hardware. One may also call @SDL_AddEventWatch()@ to set a callback when new events arrive.
--
--     The app is free to generate their own events, too: SDL_PushEvent allows the app to put events onto the queue for later retrieval; SDL_RegisterEvents can guarantee that these events have a type that isn\'t in use by other parts of the system. The types of events that can be delivered.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Events (
  SDL3.Sys.Bindgen.Events.SDL_EventType (..),
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_FIRST,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_QUIT,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_TERMINATING,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_LOW_MEMORY,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WILL_ENTER_BACKGROUND,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DID_ENTER_BACKGROUND,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WILL_ENTER_FOREGROUND,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DID_ENTER_FOREGROUND,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_LOCALE_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_SYSTEM_THEME_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DISPLAY_ORIENTATION,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DISPLAY_ADDED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DISPLAY_REMOVED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DISPLAY_MOVED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DISPLAY_FIRST,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DISPLAY_LAST,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_SHOWN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_HIDDEN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_EXPOSED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_MOVED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_RESIZED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_METAL_VIEW_RESIZED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_MINIMIZED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_MAXIMIZED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_RESTORED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_MOUSE_ENTER,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_MOUSE_LEAVE,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_FOCUS_GAINED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_FOCUS_LOST,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_CLOSE_REQUESTED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_HIT_TEST,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_ICCPROF_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_DISPLAY_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_SAFE_AREA_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_OCCLUDED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_ENTER_FULLSCREEN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_LEAVE_FULLSCREEN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_DESTROYED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_HDR_STATE_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_FIRST,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_WINDOW_LAST,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_KEY_DOWN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_KEY_UP,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_TEXT_EDITING,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_TEXT_INPUT,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_KEYMAP_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_KEYBOARD_ADDED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_KEYBOARD_REMOVED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_TEXT_EDITING_CANDIDATES,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_SCREEN_KEYBOARD_SHOWN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_SCREEN_KEYBOARD_HIDDEN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_MOUSE_MOTION,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_MOUSE_BUTTON_DOWN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_MOUSE_BUTTON_UP,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_MOUSE_WHEEL,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_MOUSE_ADDED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_MOUSE_REMOVED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_JOYSTICK_AXIS_MOTION,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_JOYSTICK_BALL_MOTION,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_JOYSTICK_HAT_MOTION,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_JOYSTICK_BUTTON_DOWN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_JOYSTICK_BUTTON_UP,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_JOYSTICK_ADDED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_JOYSTICK_REMOVED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_JOYSTICK_BATTERY_UPDATED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_JOYSTICK_UPDATE_COMPLETE,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_GAMEPAD_AXIS_MOTION,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_GAMEPAD_BUTTON_DOWN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_GAMEPAD_BUTTON_UP,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_GAMEPAD_ADDED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_GAMEPAD_REMOVED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_GAMEPAD_REMAPPED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_GAMEPAD_TOUCHPAD_UP,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_GAMEPAD_SENSOR_UPDATE,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_GAMEPAD_UPDATE_COMPLETE,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_FINGER_DOWN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_FINGER_UP,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_FINGER_MOTION,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_FINGER_CANCELED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PINCH_BEGIN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PINCH_UPDATE,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PINCH_END,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_CLIPBOARD_UPDATE,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DROP_FILE,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DROP_TEXT,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DROP_BEGIN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DROP_COMPLETE,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_DROP_POSITION,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_AUDIO_DEVICE_ADDED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_AUDIO_DEVICE_REMOVED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_SENSOR_UPDATE,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PEN_PROXIMITY_IN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PEN_PROXIMITY_OUT,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PEN_DOWN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PEN_UP,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PEN_BUTTON_DOWN,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PEN_BUTTON_UP,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PEN_MOTION,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PEN_AXIS,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_CAMERA_DEVICE_ADDED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_CAMERA_DEVICE_REMOVED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_CAMERA_DEVICE_APPROVED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_CAMERA_DEVICE_DENIED,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_RENDER_TARGETS_RESET,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_RENDER_DEVICE_RESET,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_RENDER_DEVICE_LOST,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PRIVATE0,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PRIVATE1,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PRIVATE2,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_PRIVATE3,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_POLL_SENTINEL,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_USER,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_LAST,
  pattern SDL3.Sys.Bindgen.Events.SDL_EVENT_ENUM_PADDING,
  SDL3.Sys.Bindgen.Events.SDL_CommonEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_DisplayEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_WindowEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_KeyboardDeviceEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_KeyboardEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_TextEditingEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_TextEditingCandidatesEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_TextInputEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_MouseDeviceEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_MouseMotionEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_MouseButtonEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_MouseWheelEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_JoyAxisEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_JoyBallEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_JoyHatEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_JoyButtonEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_JoyDeviceEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_JoyBatteryEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_GamepadAxisEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_GamepadButtonEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_GamepadDeviceEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_GamepadTouchpadEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_GamepadSensorEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_AudioDeviceEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_CameraDeviceEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_RenderEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_TouchFingerEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_PinchFingerEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_PenProximityEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_PenMotionEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_PenTouchEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_PenButtonEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_PenAxisEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_DropEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_ClipboardEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_SensorEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_QuitEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_UserEvent (..),
  SDL3.Sys.Bindgen.Events.SDL_Event (..),
  SDL3.Sys.Bindgen.Events.SDL_EventAction (..),
  pattern SDL3.Sys.Bindgen.Events.SDL_ADDEVENT,
  pattern SDL3.Sys.Bindgen.Events.SDL_PEEKEVENT,
  pattern SDL3.Sys.Bindgen.Events.SDL_GETEVENT,
  SDL3.Sys.Bindgen.Events.SDL_EventFilter_Aux (..),
  SDL3.Sys.Bindgen.Events.SDL_EventFilter (..),
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.ConstantArray qualified as CA
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import HsBindgen.Runtime.Union qualified as Union
import SDL3.Sys.Bindgen.Audio qualified
import SDL3.Sys.Bindgen.Camera qualified
import SDL3.Sys.Bindgen.Joystick qualified
import SDL3.Sys.Bindgen.Keyboard qualified
import SDL3.Sys.Bindgen.Keycode qualified
import SDL3.Sys.Bindgen.Mouse qualified
import SDL3.Sys.Bindgen.Pen qualified
import SDL3.Sys.Bindgen.Power qualified
import SDL3.Sys.Bindgen.Scancode qualified
import SDL3.Sys.Bindgen.Sensor qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Touch qualified
import SDL3.Sys.Bindgen.Video qualified

-- | [C declaration]: @enum SDL_EventType@, defined at @SDL3\/SDL_events.h 84:14@
newtype SDL_EventType = SDL_EventType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_EventType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_EventType where
  readRaw =
    \ptr0 ->
      pure SDL_EventType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_EventType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_EventType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_EventType instance BG.Storable SDL_EventType

deriving via BG.CUInt instance BG.Prim SDL_EventType

instance CEnum.CEnum SDL_EventType where
  type CEnumZ SDL_EventType = BG.CUInt

  toCEnum = SDL_EventType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_EVENT_FIRST")
        , (256, BG.singleton "SDL_EVENT_QUIT")
        , (257, BG.singleton "SDL_EVENT_TERMINATING")
        , (258, BG.singleton "SDL_EVENT_LOW_MEMORY")
        , (259, BG.singleton "SDL_EVENT_WILL_ENTER_BACKGROUND")
        , (260, BG.singleton "SDL_EVENT_DID_ENTER_BACKGROUND")
        , (261, BG.singleton "SDL_EVENT_WILL_ENTER_FOREGROUND")
        , (262, BG.singleton "SDL_EVENT_DID_ENTER_FOREGROUND")
        , (263, BG.singleton "SDL_EVENT_LOCALE_CHANGED")
        , (264, BG.singleton "SDL_EVENT_SYSTEM_THEME_CHANGED")
        , (337, ("SDL_EVENT_DISPLAY_ORIENTATION" BG.:| ["SDL_EVENT_DISPLAY_FIRST"]))
        , (338, BG.singleton "SDL_EVENT_DISPLAY_ADDED")
        , (339, BG.singleton "SDL_EVENT_DISPLAY_REMOVED")
        , (340, BG.singleton "SDL_EVENT_DISPLAY_MOVED")
        , (341, BG.singleton "SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED")
        , (342, BG.singleton "SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED")
        , (343, BG.singleton "SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED")
        ,
          ( 344
          , ("SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED" BG.:| ["SDL_EVENT_DISPLAY_LAST"])
          )
        , (514, ("SDL_EVENT_WINDOW_SHOWN" BG.:| ["SDL_EVENT_WINDOW_FIRST"]))
        , (515, BG.singleton "SDL_EVENT_WINDOW_HIDDEN")
        , (516, BG.singleton "SDL_EVENT_WINDOW_EXPOSED")
        , (517, BG.singleton "SDL_EVENT_WINDOW_MOVED")
        , (518, BG.singleton "SDL_EVENT_WINDOW_RESIZED")
        , (519, BG.singleton "SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED")
        , (520, BG.singleton "SDL_EVENT_WINDOW_METAL_VIEW_RESIZED")
        , (521, BG.singleton "SDL_EVENT_WINDOW_MINIMIZED")
        , (522, BG.singleton "SDL_EVENT_WINDOW_MAXIMIZED")
        , (523, BG.singleton "SDL_EVENT_WINDOW_RESTORED")
        , (524, BG.singleton "SDL_EVENT_WINDOW_MOUSE_ENTER")
        , (525, BG.singleton "SDL_EVENT_WINDOW_MOUSE_LEAVE")
        , (526, BG.singleton "SDL_EVENT_WINDOW_FOCUS_GAINED")
        , (527, BG.singleton "SDL_EVENT_WINDOW_FOCUS_LOST")
        , (528, BG.singleton "SDL_EVENT_WINDOW_CLOSE_REQUESTED")
        , (529, BG.singleton "SDL_EVENT_WINDOW_HIT_TEST")
        , (530, BG.singleton "SDL_EVENT_WINDOW_ICCPROF_CHANGED")
        , (531, BG.singleton "SDL_EVENT_WINDOW_DISPLAY_CHANGED")
        , (532, BG.singleton "SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED")
        , (533, BG.singleton "SDL_EVENT_WINDOW_SAFE_AREA_CHANGED")
        , (534, BG.singleton "SDL_EVENT_WINDOW_OCCLUDED")
        , (535, BG.singleton "SDL_EVENT_WINDOW_ENTER_FULLSCREEN")
        , (536, BG.singleton "SDL_EVENT_WINDOW_LEAVE_FULLSCREEN")
        , (537, BG.singleton "SDL_EVENT_WINDOW_DESTROYED")
        , (538, ("SDL_EVENT_WINDOW_HDR_STATE_CHANGED" BG.:| ["SDL_EVENT_WINDOW_LAST"]))
        , (768, BG.singleton "SDL_EVENT_KEY_DOWN")
        , (769, BG.singleton "SDL_EVENT_KEY_UP")
        , (770, BG.singleton "SDL_EVENT_TEXT_EDITING")
        , (771, BG.singleton "SDL_EVENT_TEXT_INPUT")
        , (772, BG.singleton "SDL_EVENT_KEYMAP_CHANGED")
        , (773, BG.singleton "SDL_EVENT_KEYBOARD_ADDED")
        , (774, BG.singleton "SDL_EVENT_KEYBOARD_REMOVED")
        , (775, BG.singleton "SDL_EVENT_TEXT_EDITING_CANDIDATES")
        , (776, BG.singleton "SDL_EVENT_SCREEN_KEYBOARD_SHOWN")
        , (777, BG.singleton "SDL_EVENT_SCREEN_KEYBOARD_HIDDEN")
        , (1024, BG.singleton "SDL_EVENT_MOUSE_MOTION")
        , (1025, BG.singleton "SDL_EVENT_MOUSE_BUTTON_DOWN")
        , (1026, BG.singleton "SDL_EVENT_MOUSE_BUTTON_UP")
        , (1027, BG.singleton "SDL_EVENT_MOUSE_WHEEL")
        , (1028, BG.singleton "SDL_EVENT_MOUSE_ADDED")
        , (1029, BG.singleton "SDL_EVENT_MOUSE_REMOVED")
        , (1536, BG.singleton "SDL_EVENT_JOYSTICK_AXIS_MOTION")
        , (1537, BG.singleton "SDL_EVENT_JOYSTICK_BALL_MOTION")
        , (1538, BG.singleton "SDL_EVENT_JOYSTICK_HAT_MOTION")
        , (1539, BG.singleton "SDL_EVENT_JOYSTICK_BUTTON_DOWN")
        , (1540, BG.singleton "SDL_EVENT_JOYSTICK_BUTTON_UP")
        , (1541, BG.singleton "SDL_EVENT_JOYSTICK_ADDED")
        , (1542, BG.singleton "SDL_EVENT_JOYSTICK_REMOVED")
        , (1543, BG.singleton "SDL_EVENT_JOYSTICK_BATTERY_UPDATED")
        , (1544, BG.singleton "SDL_EVENT_JOYSTICK_UPDATE_COMPLETE")
        , (1616, BG.singleton "SDL_EVENT_GAMEPAD_AXIS_MOTION")
        , (1617, BG.singleton "SDL_EVENT_GAMEPAD_BUTTON_DOWN")
        , (1618, BG.singleton "SDL_EVENT_GAMEPAD_BUTTON_UP")
        , (1619, BG.singleton "SDL_EVENT_GAMEPAD_ADDED")
        , (1620, BG.singleton "SDL_EVENT_GAMEPAD_REMOVED")
        , (1621, BG.singleton "SDL_EVENT_GAMEPAD_REMAPPED")
        , (1622, BG.singleton "SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN")
        , (1623, BG.singleton "SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION")
        , (1624, BG.singleton "SDL_EVENT_GAMEPAD_TOUCHPAD_UP")
        , (1625, BG.singleton "SDL_EVENT_GAMEPAD_SENSOR_UPDATE")
        , (1626, BG.singleton "SDL_EVENT_GAMEPAD_UPDATE_COMPLETE")
        , (1627, BG.singleton "SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED")
        , (1792, BG.singleton "SDL_EVENT_FINGER_DOWN")
        , (1793, BG.singleton "SDL_EVENT_FINGER_UP")
        , (1794, BG.singleton "SDL_EVENT_FINGER_MOTION")
        , (1795, BG.singleton "SDL_EVENT_FINGER_CANCELED")
        , (1808, BG.singleton "SDL_EVENT_PINCH_BEGIN")
        , (1809, BG.singleton "SDL_EVENT_PINCH_UPDATE")
        , (1810, BG.singleton "SDL_EVENT_PINCH_END")
        , (2304, BG.singleton "SDL_EVENT_CLIPBOARD_UPDATE")
        , (4096, BG.singleton "SDL_EVENT_DROP_FILE")
        , (4097, BG.singleton "SDL_EVENT_DROP_TEXT")
        , (4098, BG.singleton "SDL_EVENT_DROP_BEGIN")
        , (4099, BG.singleton "SDL_EVENT_DROP_COMPLETE")
        , (4100, BG.singleton "SDL_EVENT_DROP_POSITION")
        , (4352, BG.singleton "SDL_EVENT_AUDIO_DEVICE_ADDED")
        , (4353, BG.singleton "SDL_EVENT_AUDIO_DEVICE_REMOVED")
        , (4354, BG.singleton "SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED")
        , (4608, BG.singleton "SDL_EVENT_SENSOR_UPDATE")
        , (4864, BG.singleton "SDL_EVENT_PEN_PROXIMITY_IN")
        , (4865, BG.singleton "SDL_EVENT_PEN_PROXIMITY_OUT")
        , (4866, BG.singleton "SDL_EVENT_PEN_DOWN")
        , (4867, BG.singleton "SDL_EVENT_PEN_UP")
        , (4868, BG.singleton "SDL_EVENT_PEN_BUTTON_DOWN")
        , (4869, BG.singleton "SDL_EVENT_PEN_BUTTON_UP")
        , (4870, BG.singleton "SDL_EVENT_PEN_MOTION")
        , (4871, BG.singleton "SDL_EVENT_PEN_AXIS")
        , (5120, BG.singleton "SDL_EVENT_CAMERA_DEVICE_ADDED")
        , (5121, BG.singleton "SDL_EVENT_CAMERA_DEVICE_REMOVED")
        , (5122, BG.singleton "SDL_EVENT_CAMERA_DEVICE_APPROVED")
        , (5123, BG.singleton "SDL_EVENT_CAMERA_DEVICE_DENIED")
        , (8192, BG.singleton "SDL_EVENT_RENDER_TARGETS_RESET")
        , (8193, BG.singleton "SDL_EVENT_RENDER_DEVICE_RESET")
        , (8194, BG.singleton "SDL_EVENT_RENDER_DEVICE_LOST")
        , (16384, BG.singleton "SDL_EVENT_PRIVATE0")
        , (16385, BG.singleton "SDL_EVENT_PRIVATE1")
        , (16386, BG.singleton "SDL_EVENT_PRIVATE2")
        , (16387, BG.singleton "SDL_EVENT_PRIVATE3")
        , (32512, BG.singleton "SDL_EVENT_POLL_SENTINEL")
        , (32768, BG.singleton "SDL_EVENT_USER")
        , (65535, BG.singleton "SDL_EVENT_LAST")
        , (2147483647, BG.singleton "SDL_EVENT_ENUM_PADDING")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_EventType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_EventType"

instance Show SDL_EventType where
  showsPrec = CEnum.shows

instance Read SDL_EventType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_EventType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EventType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_EventType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EventType "unwrap" where
  type CFieldType SDL_EventType "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Unused (do not remove)
--
--     [C declaration]: @SDL_EVENT_FIRST@, defined at @SDL3\/SDL_events.h 86:5@
pattern SDL_EVENT_FIRST :: SDL_EventType
pattern SDL_EVENT_FIRST = SDL_EventType 0

-- | User-requested quit
--
--     [C declaration]: @SDL_EVENT_QUIT@, defined at @SDL3\/SDL_events.h 89:5@
pattern SDL_EVENT_QUIT :: SDL_EventType
pattern SDL_EVENT_QUIT = SDL_EventType 256

-- | The application is being terminated by the OS. This event must be handled in a callback set with @SDL_AddEventWatch()@. Called on iOS in applicationWillTerminate() Called on Android in onDestroy()
--
--     [C declaration]: @SDL_EVENT_TERMINATING@, defined at @SDL3\/SDL_events.h 92:5@
pattern SDL_EVENT_TERMINATING :: SDL_EventType
pattern SDL_EVENT_TERMINATING = SDL_EventType 257

-- | The application is low on memory, free memory if possible. This event must be handled in a callback set with @SDL_AddEventWatch()@. Called on iOS in applicationDidReceiveMemoryWarning() Called on Android in onTrimMemory()
--
--     [C declaration]: @SDL_EVENT_LOW_MEMORY@, defined at @SDL3\/SDL_events.h 96:5@
pattern SDL_EVENT_LOW_MEMORY :: SDL_EventType
pattern SDL_EVENT_LOW_MEMORY = SDL_EventType 258

-- | The application is about to enter the background. This event must be handled in a callback set with @SDL_AddEventWatch()@. Called on iOS in applicationWillResignActive() Called on Android in onPause()
--
--     [C declaration]: @SDL_EVENT_WILL_ENTER_BACKGROUND@, defined at @SDL3\/SDL_events.h 100:5@
pattern SDL_EVENT_WILL_ENTER_BACKGROUND :: SDL_EventType
pattern SDL_EVENT_WILL_ENTER_BACKGROUND = SDL_EventType 259

-- | The application did enter the background and may not get CPU for some time. This event must be handled in a callback set with @SDL_AddEventWatch()@. Called on iOS in applicationDidEnterBackground() Called on Android in onPause()
--
--     [C declaration]: @SDL_EVENT_DID_ENTER_BACKGROUND@, defined at @SDL3\/SDL_events.h 104:5@
pattern SDL_EVENT_DID_ENTER_BACKGROUND :: SDL_EventType
pattern SDL_EVENT_DID_ENTER_BACKGROUND = SDL_EventType 260

-- | The application is about to enter the foreground. This event must be handled in a callback set with @SDL_AddEventWatch()@. Called on iOS in applicationWillEnterForeground() Called on Android in onResume()
--
--     [C declaration]: @SDL_EVENT_WILL_ENTER_FOREGROUND@, defined at @SDL3\/SDL_events.h 108:5@
pattern SDL_EVENT_WILL_ENTER_FOREGROUND :: SDL_EventType
pattern SDL_EVENT_WILL_ENTER_FOREGROUND = SDL_EventType 261

-- | The application is now interactive. This event must be handled in a callback set with @SDL_AddEventWatch()@. Called on iOS in applicationDidBecomeActive() Called on Android in onResume()
--
--     [C declaration]: @SDL_EVENT_DID_ENTER_FOREGROUND@, defined at @SDL3\/SDL_events.h 112:5@
pattern SDL_EVENT_DID_ENTER_FOREGROUND :: SDL_EventType
pattern SDL_EVENT_DID_ENTER_FOREGROUND = SDL_EventType 262

-- | The user\'s locale preferences have changed.
--
--     [C declaration]: @SDL_EVENT_LOCALE_CHANGED@, defined at @SDL3\/SDL_events.h 117:5@
pattern SDL_EVENT_LOCALE_CHANGED :: SDL_EventType
pattern SDL_EVENT_LOCALE_CHANGED = SDL_EventType 263

-- | The system theme changed
--
--     [C declaration]: @SDL_EVENT_SYSTEM_THEME_CHANGED@, defined at @SDL3\/SDL_events.h 119:5@
pattern SDL_EVENT_SYSTEM_THEME_CHANGED :: SDL_EventType
pattern SDL_EVENT_SYSTEM_THEME_CHANGED = SDL_EventType 264

-- | Display orientation has changed to data1
--
--     [C declaration]: @SDL_EVENT_DISPLAY_ORIENTATION@, defined at @SDL3\/SDL_events.h 123:5@
pattern SDL_EVENT_DISPLAY_ORIENTATION :: SDL_EventType
pattern SDL_EVENT_DISPLAY_ORIENTATION = SDL_EventType 337

-- | Display has been added to the system
--
--     [C declaration]: @SDL_EVENT_DISPLAY_ADDED@, defined at @SDL3\/SDL_events.h 124:5@
pattern SDL_EVENT_DISPLAY_ADDED :: SDL_EventType
pattern SDL_EVENT_DISPLAY_ADDED = SDL_EventType 338

-- | Display has been removed from the system
--
--     [C declaration]: @SDL_EVENT_DISPLAY_REMOVED@, defined at @SDL3\/SDL_events.h 125:5@
pattern SDL_EVENT_DISPLAY_REMOVED :: SDL_EventType
pattern SDL_EVENT_DISPLAY_REMOVED = SDL_EventType 339

-- | Display has changed position
--
--     [C declaration]: @SDL_EVENT_DISPLAY_MOVED@, defined at @SDL3\/SDL_events.h 126:5@
pattern SDL_EVENT_DISPLAY_MOVED :: SDL_EventType
pattern SDL_EVENT_DISPLAY_MOVED = SDL_EventType 340

-- | Display has changed desktop mode
--
--     [C declaration]: @SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED@, defined at @SDL3\/SDL_events.h 127:5@
pattern SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED :: SDL_EventType
pattern SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED = SDL_EventType 341

-- | Display has changed current mode
--
--     [C declaration]: @SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED@, defined at @SDL3\/SDL_events.h 128:5@
pattern SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED :: SDL_EventType
pattern SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED = SDL_EventType 342

-- | Display has changed content scale
--
--     [C declaration]: @SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED@, defined at @SDL3\/SDL_events.h 129:5@
pattern SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED :: SDL_EventType
pattern SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED = SDL_EventType 343

-- | Display has changed usable bounds
--
--     [C declaration]: @SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED@, defined at @SDL3\/SDL_events.h 130:5@
pattern SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED :: SDL_EventType
pattern SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED = SDL_EventType 344

-- | [C declaration]: @SDL_EVENT_DISPLAY_FIRST@, defined at @SDL3\/SDL_events.h 131:5@
pattern SDL_EVENT_DISPLAY_FIRST :: SDL_EventType
pattern SDL_EVENT_DISPLAY_FIRST = SDL_EventType 337

-- | [C declaration]: @SDL_EVENT_DISPLAY_LAST@, defined at @SDL3\/SDL_events.h 132:5@
pattern SDL_EVENT_DISPLAY_LAST :: SDL_EventType
pattern SDL_EVENT_DISPLAY_LAST = SDL_EventType 344

-- | Window has been shown
--
--     [C declaration]: @SDL_EVENT_WINDOW_SHOWN@, defined at @SDL3\/SDL_events.h 137:5@
pattern SDL_EVENT_WINDOW_SHOWN :: SDL_EventType
pattern SDL_EVENT_WINDOW_SHOWN = SDL_EventType 514

-- | Window has been hidden
--
--     [C declaration]: @SDL_EVENT_WINDOW_HIDDEN@, defined at @SDL3\/SDL_events.h 138:5@
pattern SDL_EVENT_WINDOW_HIDDEN :: SDL_EventType
pattern SDL_EVENT_WINDOW_HIDDEN = SDL_EventType 515

-- | Window has been exposed and should be redrawn, and can be redrawn directly from event watchers for this event. data1 is 1 for live-resize expose events, 0 otherwise.
--
--     [C declaration]: @SDL_EVENT_WINDOW_EXPOSED@, defined at @SDL3\/SDL_events.h 139:5@
pattern SDL_EVENT_WINDOW_EXPOSED :: SDL_EventType
pattern SDL_EVENT_WINDOW_EXPOSED = SDL_EventType 516

-- | Window has been moved to data1, data2
--
--     [C declaration]: @SDL_EVENT_WINDOW_MOVED@, defined at @SDL3\/SDL_events.h 141:5@
pattern SDL_EVENT_WINDOW_MOVED :: SDL_EventType
pattern SDL_EVENT_WINDOW_MOVED = SDL_EventType 517

-- | Window has been resized to data1xdata2
--
--     [C declaration]: @SDL_EVENT_WINDOW_RESIZED@, defined at @SDL3\/SDL_events.h 142:5@
pattern SDL_EVENT_WINDOW_RESIZED :: SDL_EventType
pattern SDL_EVENT_WINDOW_RESIZED = SDL_EventType 518

-- | The pixel size of the window has changed to data1xdata2
--
--     [C declaration]: @SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED@, defined at @SDL3\/SDL_events.h 143:5@
pattern SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED :: SDL_EventType
pattern SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED = SDL_EventType 519

-- | The pixel size of a Metal view associated with the window has changed
--
--     [C declaration]: @SDL_EVENT_WINDOW_METAL_VIEW_RESIZED@, defined at @SDL3\/SDL_events.h 144:5@
pattern SDL_EVENT_WINDOW_METAL_VIEW_RESIZED :: SDL_EventType
pattern SDL_EVENT_WINDOW_METAL_VIEW_RESIZED = SDL_EventType 520

-- | Window has been minimized
--
--     [C declaration]: @SDL_EVENT_WINDOW_MINIMIZED@, defined at @SDL3\/SDL_events.h 145:5@
pattern SDL_EVENT_WINDOW_MINIMIZED :: SDL_EventType
pattern SDL_EVENT_WINDOW_MINIMIZED = SDL_EventType 521

-- | Window has been maximized
--
--     [C declaration]: @SDL_EVENT_WINDOW_MAXIMIZED@, defined at @SDL3\/SDL_events.h 146:5@
pattern SDL_EVENT_WINDOW_MAXIMIZED :: SDL_EventType
pattern SDL_EVENT_WINDOW_MAXIMIZED = SDL_EventType 522

-- | Window has been restored to normal size and position
--
--     [C declaration]: @SDL_EVENT_WINDOW_RESTORED@, defined at @SDL3\/SDL_events.h 147:5@
pattern SDL_EVENT_WINDOW_RESTORED :: SDL_EventType
pattern SDL_EVENT_WINDOW_RESTORED = SDL_EventType 523

-- | Window has gained mouse focus
--
--     [C declaration]: @SDL_EVENT_WINDOW_MOUSE_ENTER@, defined at @SDL3\/SDL_events.h 148:5@
pattern SDL_EVENT_WINDOW_MOUSE_ENTER :: SDL_EventType
pattern SDL_EVENT_WINDOW_MOUSE_ENTER = SDL_EventType 524

-- | Window has lost mouse focus
--
--     [C declaration]: @SDL_EVENT_WINDOW_MOUSE_LEAVE@, defined at @SDL3\/SDL_events.h 149:5@
pattern SDL_EVENT_WINDOW_MOUSE_LEAVE :: SDL_EventType
pattern SDL_EVENT_WINDOW_MOUSE_LEAVE = SDL_EventType 525

-- | Window has gained keyboard focus
--
--     [C declaration]: @SDL_EVENT_WINDOW_FOCUS_GAINED@, defined at @SDL3\/SDL_events.h 150:5@
pattern SDL_EVENT_WINDOW_FOCUS_GAINED :: SDL_EventType
pattern SDL_EVENT_WINDOW_FOCUS_GAINED = SDL_EventType 526

-- | Window has lost keyboard focus
--
--     [C declaration]: @SDL_EVENT_WINDOW_FOCUS_LOST@, defined at @SDL3\/SDL_events.h 151:5@
pattern SDL_EVENT_WINDOW_FOCUS_LOST :: SDL_EventType
pattern SDL_EVENT_WINDOW_FOCUS_LOST = SDL_EventType 527

-- | The window manager requests that the window be closed
--
--     [C declaration]: @SDL_EVENT_WINDOW_CLOSE_REQUESTED@, defined at @SDL3\/SDL_events.h 152:5@
pattern SDL_EVENT_WINDOW_CLOSE_REQUESTED :: SDL_EventType
pattern SDL_EVENT_WINDOW_CLOSE_REQUESTED = SDL_EventType 528

-- | Window had a hit test that wasn\'t SDL_HITTEST_NORMAL
--
--     [C declaration]: @SDL_EVENT_WINDOW_HIT_TEST@, defined at @SDL3\/SDL_events.h 153:5@
pattern SDL_EVENT_WINDOW_HIT_TEST :: SDL_EventType
pattern SDL_EVENT_WINDOW_HIT_TEST = SDL_EventType 529

-- | The ICC profile of the window\'s display has changed
--
--     [C declaration]: @SDL_EVENT_WINDOW_ICCPROF_CHANGED@, defined at @SDL3\/SDL_events.h 154:5@
pattern SDL_EVENT_WINDOW_ICCPROF_CHANGED :: SDL_EventType
pattern SDL_EVENT_WINDOW_ICCPROF_CHANGED = SDL_EventType 530

-- | Window has been moved to display data1
--
--     [C declaration]: @SDL_EVENT_WINDOW_DISPLAY_CHANGED@, defined at @SDL3\/SDL_events.h 155:5@
pattern SDL_EVENT_WINDOW_DISPLAY_CHANGED :: SDL_EventType
pattern SDL_EVENT_WINDOW_DISPLAY_CHANGED = SDL_EventType 531

-- | Window display scale has been changed
--
--     [C declaration]: @SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED@, defined at @SDL3\/SDL_events.h 156:5@
pattern SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED :: SDL_EventType
pattern SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED = SDL_EventType 532

-- | The window safe area has been changed
--
--     [C declaration]: @SDL_EVENT_WINDOW_SAFE_AREA_CHANGED@, defined at @SDL3\/SDL_events.h 157:5@
pattern SDL_EVENT_WINDOW_SAFE_AREA_CHANGED :: SDL_EventType
pattern SDL_EVENT_WINDOW_SAFE_AREA_CHANGED = SDL_EventType 533

-- | The window has been occluded
--
--     [C declaration]: @SDL_EVENT_WINDOW_OCCLUDED@, defined at @SDL3\/SDL_events.h 158:5@
pattern SDL_EVENT_WINDOW_OCCLUDED :: SDL_EventType
pattern SDL_EVENT_WINDOW_OCCLUDED = SDL_EventType 534

-- | The window has entered fullscreen mode
--
--     [C declaration]: @SDL_EVENT_WINDOW_ENTER_FULLSCREEN@, defined at @SDL3\/SDL_events.h 159:5@
pattern SDL_EVENT_WINDOW_ENTER_FULLSCREEN :: SDL_EventType
pattern SDL_EVENT_WINDOW_ENTER_FULLSCREEN = SDL_EventType 535

-- | The window has left fullscreen mode
--
--     [C declaration]: @SDL_EVENT_WINDOW_LEAVE_FULLSCREEN@, defined at @SDL3\/SDL_events.h 160:5@
pattern SDL_EVENT_WINDOW_LEAVE_FULLSCREEN :: SDL_EventType
pattern SDL_EVENT_WINDOW_LEAVE_FULLSCREEN = SDL_EventType 536

-- | The window with the associated ID is being or has been destroyed. If this message is being handled in an event watcher, the window handle is still valid and can still be used to retrieve any properties associated with the window. Otherwise, the handle has already been destroyed and all resources associated with it are invalid
--
--     [C declaration]: @SDL_EVENT_WINDOW_DESTROYED@, defined at @SDL3\/SDL_events.h 161:5@
pattern SDL_EVENT_WINDOW_DESTROYED :: SDL_EventType
pattern SDL_EVENT_WINDOW_DESTROYED = SDL_EventType 537

-- | Window HDR properties have changed
--
--     [C declaration]: @SDL_EVENT_WINDOW_HDR_STATE_CHANGED@, defined at @SDL3\/SDL_events.h 165:5@
pattern SDL_EVENT_WINDOW_HDR_STATE_CHANGED :: SDL_EventType
pattern SDL_EVENT_WINDOW_HDR_STATE_CHANGED = SDL_EventType 538

-- | [C declaration]: @SDL_EVENT_WINDOW_FIRST@, defined at @SDL3\/SDL_events.h 166:5@
pattern SDL_EVENT_WINDOW_FIRST :: SDL_EventType
pattern SDL_EVENT_WINDOW_FIRST = SDL_EventType 514

-- | [C declaration]: @SDL_EVENT_WINDOW_LAST@, defined at @SDL3\/SDL_events.h 167:5@
pattern SDL_EVENT_WINDOW_LAST :: SDL_EventType
pattern SDL_EVENT_WINDOW_LAST = SDL_EventType 538

-- | Key pressed
--
--     [C declaration]: @SDL_EVENT_KEY_DOWN@, defined at @SDL3\/SDL_events.h 170:5@
pattern SDL_EVENT_KEY_DOWN :: SDL_EventType
pattern SDL_EVENT_KEY_DOWN = SDL_EventType 768

-- | Key released
--
--     [C declaration]: @SDL_EVENT_KEY_UP@, defined at @SDL3\/SDL_events.h 171:5@
pattern SDL_EVENT_KEY_UP :: SDL_EventType
pattern SDL_EVENT_KEY_UP = SDL_EventType 769

-- | Keyboard text editing (composition)
--
--     [C declaration]: @SDL_EVENT_TEXT_EDITING@, defined at @SDL3\/SDL_events.h 172:5@
pattern SDL_EVENT_TEXT_EDITING :: SDL_EventType
pattern SDL_EVENT_TEXT_EDITING = SDL_EventType 770

-- | Keyboard text input
--
--     [C declaration]: @SDL_EVENT_TEXT_INPUT@, defined at @SDL3\/SDL_events.h 173:5@
pattern SDL_EVENT_TEXT_INPUT :: SDL_EventType
pattern SDL_EVENT_TEXT_INPUT = SDL_EventType 771

-- | Keymap changed due to a system event such as an input language or keyboard layout change.
--
--     [C declaration]: @SDL_EVENT_KEYMAP_CHANGED@, defined at @SDL3\/SDL_events.h 174:5@
pattern SDL_EVENT_KEYMAP_CHANGED :: SDL_EventType
pattern SDL_EVENT_KEYMAP_CHANGED = SDL_EventType 772

-- | A new keyboard has been inserted into the system
--
--     [C declaration]: @SDL_EVENT_KEYBOARD_ADDED@, defined at @SDL3\/SDL_events.h 176:5@
pattern SDL_EVENT_KEYBOARD_ADDED :: SDL_EventType
pattern SDL_EVENT_KEYBOARD_ADDED = SDL_EventType 773

-- | A keyboard has been removed
--
--     [C declaration]: @SDL_EVENT_KEYBOARD_REMOVED@, defined at @SDL3\/SDL_events.h 177:5@
pattern SDL_EVENT_KEYBOARD_REMOVED :: SDL_EventType
pattern SDL_EVENT_KEYBOARD_REMOVED = SDL_EventType 774

-- | Keyboard text editing candidates
--
--     [C declaration]: @SDL_EVENT_TEXT_EDITING_CANDIDATES@, defined at @SDL3\/SDL_events.h 178:5@
pattern SDL_EVENT_TEXT_EDITING_CANDIDATES :: SDL_EventType
pattern SDL_EVENT_TEXT_EDITING_CANDIDATES = SDL_EventType 775

-- | The on-screen keyboard has been shown
--
--     [C declaration]: @SDL_EVENT_SCREEN_KEYBOARD_SHOWN@, defined at @SDL3\/SDL_events.h 179:5@
pattern SDL_EVENT_SCREEN_KEYBOARD_SHOWN :: SDL_EventType
pattern SDL_EVENT_SCREEN_KEYBOARD_SHOWN = SDL_EventType 776

-- | The on-screen keyboard has been hidden
--
--     [C declaration]: @SDL_EVENT_SCREEN_KEYBOARD_HIDDEN@, defined at @SDL3\/SDL_events.h 180:5@
pattern SDL_EVENT_SCREEN_KEYBOARD_HIDDEN :: SDL_EventType
pattern SDL_EVENT_SCREEN_KEYBOARD_HIDDEN = SDL_EventType 777

-- | Mouse moved
--
--     [C declaration]: @SDL_EVENT_MOUSE_MOTION@, defined at @SDL3\/SDL_events.h 183:5@
pattern SDL_EVENT_MOUSE_MOTION :: SDL_EventType
pattern SDL_EVENT_MOUSE_MOTION = SDL_EventType 1024

-- | Mouse button pressed
--
--     [C declaration]: @SDL_EVENT_MOUSE_BUTTON_DOWN@, defined at @SDL3\/SDL_events.h 184:5@
pattern SDL_EVENT_MOUSE_BUTTON_DOWN :: SDL_EventType
pattern SDL_EVENT_MOUSE_BUTTON_DOWN = SDL_EventType 1025

-- | Mouse button released
--
--     [C declaration]: @SDL_EVENT_MOUSE_BUTTON_UP@, defined at @SDL3\/SDL_events.h 185:5@
pattern SDL_EVENT_MOUSE_BUTTON_UP :: SDL_EventType
pattern SDL_EVENT_MOUSE_BUTTON_UP = SDL_EventType 1026

-- | Mouse wheel motion
--
--     [C declaration]: @SDL_EVENT_MOUSE_WHEEL@, defined at @SDL3\/SDL_events.h 186:5@
pattern SDL_EVENT_MOUSE_WHEEL :: SDL_EventType
pattern SDL_EVENT_MOUSE_WHEEL = SDL_EventType 1027

-- | A new mouse has been inserted into the system
--
--     [C declaration]: @SDL_EVENT_MOUSE_ADDED@, defined at @SDL3\/SDL_events.h 187:5@
pattern SDL_EVENT_MOUSE_ADDED :: SDL_EventType
pattern SDL_EVENT_MOUSE_ADDED = SDL_EventType 1028

-- | A mouse has been removed
--
--     [C declaration]: @SDL_EVENT_MOUSE_REMOVED@, defined at @SDL3\/SDL_events.h 188:5@
pattern SDL_EVENT_MOUSE_REMOVED :: SDL_EventType
pattern SDL_EVENT_MOUSE_REMOVED = SDL_EventType 1029

-- | Joystick axis motion
--
--     [C declaration]: @SDL_EVENT_JOYSTICK_AXIS_MOTION@, defined at @SDL3\/SDL_events.h 191:5@
pattern SDL_EVENT_JOYSTICK_AXIS_MOTION :: SDL_EventType
pattern SDL_EVENT_JOYSTICK_AXIS_MOTION = SDL_EventType 1536

-- | Joystick trackball motion
--
--     [C declaration]: @SDL_EVENT_JOYSTICK_BALL_MOTION@, defined at @SDL3\/SDL_events.h 192:5@
pattern SDL_EVENT_JOYSTICK_BALL_MOTION :: SDL_EventType
pattern SDL_EVENT_JOYSTICK_BALL_MOTION = SDL_EventType 1537

-- | Joystick hat position change
--
--     [C declaration]: @SDL_EVENT_JOYSTICK_HAT_MOTION@, defined at @SDL3\/SDL_events.h 193:5@
pattern SDL_EVENT_JOYSTICK_HAT_MOTION :: SDL_EventType
pattern SDL_EVENT_JOYSTICK_HAT_MOTION = SDL_EventType 1538

-- | Joystick button pressed
--
--     [C declaration]: @SDL_EVENT_JOYSTICK_BUTTON_DOWN@, defined at @SDL3\/SDL_events.h 194:5@
pattern SDL_EVENT_JOYSTICK_BUTTON_DOWN :: SDL_EventType
pattern SDL_EVENT_JOYSTICK_BUTTON_DOWN = SDL_EventType 1539

-- | Joystick button released
--
--     [C declaration]: @SDL_EVENT_JOYSTICK_BUTTON_UP@, defined at @SDL3\/SDL_events.h 195:5@
pattern SDL_EVENT_JOYSTICK_BUTTON_UP :: SDL_EventType
pattern SDL_EVENT_JOYSTICK_BUTTON_UP = SDL_EventType 1540

-- | A new joystick has been inserted into the system
--
--     [C declaration]: @SDL_EVENT_JOYSTICK_ADDED@, defined at @SDL3\/SDL_events.h 196:5@
pattern SDL_EVENT_JOYSTICK_ADDED :: SDL_EventType
pattern SDL_EVENT_JOYSTICK_ADDED = SDL_EventType 1541

-- | An opened joystick has been removed
--
--     [C declaration]: @SDL_EVENT_JOYSTICK_REMOVED@, defined at @SDL3\/SDL_events.h 197:5@
pattern SDL_EVENT_JOYSTICK_REMOVED :: SDL_EventType
pattern SDL_EVENT_JOYSTICK_REMOVED = SDL_EventType 1542

-- | Joystick battery level change
--
--     [C declaration]: @SDL_EVENT_JOYSTICK_BATTERY_UPDATED@, defined at @SDL3\/SDL_events.h 198:5@
pattern SDL_EVENT_JOYSTICK_BATTERY_UPDATED :: SDL_EventType
pattern SDL_EVENT_JOYSTICK_BATTERY_UPDATED = SDL_EventType 1543

-- | Joystick update is complete
--
--     [C declaration]: @SDL_EVENT_JOYSTICK_UPDATE_COMPLETE@, defined at @SDL3\/SDL_events.h 199:5@
pattern SDL_EVENT_JOYSTICK_UPDATE_COMPLETE :: SDL_EventType
pattern SDL_EVENT_JOYSTICK_UPDATE_COMPLETE = SDL_EventType 1544

-- | Gamepad axis motion
--
--     [C declaration]: @SDL_EVENT_GAMEPAD_AXIS_MOTION@, defined at @SDL3\/SDL_events.h 202:5@
pattern SDL_EVENT_GAMEPAD_AXIS_MOTION :: SDL_EventType
pattern SDL_EVENT_GAMEPAD_AXIS_MOTION = SDL_EventType 1616

-- | Gamepad button pressed
--
--     [C declaration]: @SDL_EVENT_GAMEPAD_BUTTON_DOWN@, defined at @SDL3\/SDL_events.h 203:5@
pattern SDL_EVENT_GAMEPAD_BUTTON_DOWN :: SDL_EventType
pattern SDL_EVENT_GAMEPAD_BUTTON_DOWN = SDL_EventType 1617

-- | Gamepad button released
--
--     [C declaration]: @SDL_EVENT_GAMEPAD_BUTTON_UP@, defined at @SDL3\/SDL_events.h 204:5@
pattern SDL_EVENT_GAMEPAD_BUTTON_UP :: SDL_EventType
pattern SDL_EVENT_GAMEPAD_BUTTON_UP = SDL_EventType 1618

-- | A new gamepad has been inserted into the system
--
--     [C declaration]: @SDL_EVENT_GAMEPAD_ADDED@, defined at @SDL3\/SDL_events.h 205:5@
pattern SDL_EVENT_GAMEPAD_ADDED :: SDL_EventType
pattern SDL_EVENT_GAMEPAD_ADDED = SDL_EventType 1619

-- | A gamepad has been removed
--
--     [C declaration]: @SDL_EVENT_GAMEPAD_REMOVED@, defined at @SDL3\/SDL_events.h 206:5@
pattern SDL_EVENT_GAMEPAD_REMOVED :: SDL_EventType
pattern SDL_EVENT_GAMEPAD_REMOVED = SDL_EventType 1620

-- | The gamepad mapping was updated
--
--     [C declaration]: @SDL_EVENT_GAMEPAD_REMAPPED@, defined at @SDL3\/SDL_events.h 207:5@
pattern SDL_EVENT_GAMEPAD_REMAPPED :: SDL_EventType
pattern SDL_EVENT_GAMEPAD_REMAPPED = SDL_EventType 1621

-- | Gamepad touchpad was touched
--
--     [C declaration]: @SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN@, defined at @SDL3\/SDL_events.h 208:5@
pattern SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN :: SDL_EventType
pattern SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN = SDL_EventType 1622

-- | Gamepad touchpad finger was moved
--
--     [C declaration]: @SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION@, defined at @SDL3\/SDL_events.h 209:5@
pattern SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION :: SDL_EventType
pattern SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION = SDL_EventType 1623

-- | Gamepad touchpad finger was lifted
--
--     [C declaration]: @SDL_EVENT_GAMEPAD_TOUCHPAD_UP@, defined at @SDL3\/SDL_events.h 210:5@
pattern SDL_EVENT_GAMEPAD_TOUCHPAD_UP :: SDL_EventType
pattern SDL_EVENT_GAMEPAD_TOUCHPAD_UP = SDL_EventType 1624

-- | Gamepad sensor was updated
--
--     [C declaration]: @SDL_EVENT_GAMEPAD_SENSOR_UPDATE@, defined at @SDL3\/SDL_events.h 211:5@
pattern SDL_EVENT_GAMEPAD_SENSOR_UPDATE :: SDL_EventType
pattern SDL_EVENT_GAMEPAD_SENSOR_UPDATE = SDL_EventType 1625

-- | Gamepad update is complete
--
--     [C declaration]: @SDL_EVENT_GAMEPAD_UPDATE_COMPLETE@, defined at @SDL3\/SDL_events.h 212:5@
pattern SDL_EVENT_GAMEPAD_UPDATE_COMPLETE :: SDL_EventType
pattern SDL_EVENT_GAMEPAD_UPDATE_COMPLETE = SDL_EventType 1626

-- | Gamepad Steam handle has changed
--
--     [C declaration]: @SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED@, defined at @SDL3\/SDL_events.h 213:5@
pattern SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED :: SDL_EventType
pattern SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED = SDL_EventType 1627

-- | [C declaration]: @SDL_EVENT_FINGER_DOWN@, defined at @SDL3\/SDL_events.h 216:5@
pattern SDL_EVENT_FINGER_DOWN :: SDL_EventType
pattern SDL_EVENT_FINGER_DOWN = SDL_EventType 1792

-- | [C declaration]: @SDL_EVENT_FINGER_UP@, defined at @SDL3\/SDL_events.h 217:5@
pattern SDL_EVENT_FINGER_UP :: SDL_EventType
pattern SDL_EVENT_FINGER_UP = SDL_EventType 1793

-- | [C declaration]: @SDL_EVENT_FINGER_MOTION@, defined at @SDL3\/SDL_events.h 218:5@
pattern SDL_EVENT_FINGER_MOTION :: SDL_EventType
pattern SDL_EVENT_FINGER_MOTION = SDL_EventType 1794

-- | [C declaration]: @SDL_EVENT_FINGER_CANCELED@, defined at @SDL3\/SDL_events.h 219:5@
pattern SDL_EVENT_FINGER_CANCELED :: SDL_EventType
pattern SDL_EVENT_FINGER_CANCELED = SDL_EventType 1795

-- | Pinch gesture started
--
--     [C declaration]: @SDL_EVENT_PINCH_BEGIN@, defined at @SDL3\/SDL_events.h 222:5@
pattern SDL_EVENT_PINCH_BEGIN :: SDL_EventType
pattern SDL_EVENT_PINCH_BEGIN = SDL_EventType 1808

-- | Pinch gesture updated
--
--     [C declaration]: @SDL_EVENT_PINCH_UPDATE@, defined at @SDL3\/SDL_events.h 223:5@
pattern SDL_EVENT_PINCH_UPDATE :: SDL_EventType
pattern SDL_EVENT_PINCH_UPDATE = SDL_EventType 1809

-- | Pinch gesture ended
--
--     [C declaration]: @SDL_EVENT_PINCH_END@, defined at @SDL3\/SDL_events.h 224:5@
pattern SDL_EVENT_PINCH_END :: SDL_EventType
pattern SDL_EVENT_PINCH_END = SDL_EventType 1810

-- | The clipboard changed
--
--     [C declaration]: @SDL_EVENT_CLIPBOARD_UPDATE@, defined at @SDL3\/SDL_events.h 229:5@
pattern SDL_EVENT_CLIPBOARD_UPDATE :: SDL_EventType
pattern SDL_EVENT_CLIPBOARD_UPDATE = SDL_EventType 2304

-- | The system requests a file open
--
--     [C declaration]: @SDL_EVENT_DROP_FILE@, defined at @SDL3\/SDL_events.h 232:5@
pattern SDL_EVENT_DROP_FILE :: SDL_EventType
pattern SDL_EVENT_DROP_FILE = SDL_EventType 4096

-- | text\/plain drag-and-drop event
--
--     [C declaration]: @SDL_EVENT_DROP_TEXT@, defined at @SDL3\/SDL_events.h 233:5@
pattern SDL_EVENT_DROP_TEXT :: SDL_EventType
pattern SDL_EVENT_DROP_TEXT = SDL_EventType 4097

-- | A new set of drops is beginning (NULL filename)
--
--     [C declaration]: @SDL_EVENT_DROP_BEGIN@, defined at @SDL3\/SDL_events.h 234:5@
pattern SDL_EVENT_DROP_BEGIN :: SDL_EventType
pattern SDL_EVENT_DROP_BEGIN = SDL_EventType 4098

-- | Current set of drops is now complete (NULL filename)
--
--     [C declaration]: @SDL_EVENT_DROP_COMPLETE@, defined at @SDL3\/SDL_events.h 235:5@
pattern SDL_EVENT_DROP_COMPLETE :: SDL_EventType
pattern SDL_EVENT_DROP_COMPLETE = SDL_EventType 4099

-- | Position while moving over the window
--
--     [C declaration]: @SDL_EVENT_DROP_POSITION@, defined at @SDL3\/SDL_events.h 236:5@
pattern SDL_EVENT_DROP_POSITION :: SDL_EventType
pattern SDL_EVENT_DROP_POSITION = SDL_EventType 4100

-- | A new audio device is available
--
--     [C declaration]: @SDL_EVENT_AUDIO_DEVICE_ADDED@, defined at @SDL3\/SDL_events.h 239:5@
pattern SDL_EVENT_AUDIO_DEVICE_ADDED :: SDL_EventType
pattern SDL_EVENT_AUDIO_DEVICE_ADDED = SDL_EventType 4352

-- | An audio device has been removed.
--
--     [C declaration]: @SDL_EVENT_AUDIO_DEVICE_REMOVED@, defined at @SDL3\/SDL_events.h 240:5@
pattern SDL_EVENT_AUDIO_DEVICE_REMOVED :: SDL_EventType
pattern SDL_EVENT_AUDIO_DEVICE_REMOVED = SDL_EventType 4353

-- | An audio device\'s format has been changed by the system.
--
--     [C declaration]: @SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED@, defined at @SDL3\/SDL_events.h 241:5@
pattern SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED :: SDL_EventType
pattern SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED = SDL_EventType 4354

-- | A sensor was updated
--
--     [C declaration]: @SDL_EVENT_SENSOR_UPDATE@, defined at @SDL3\/SDL_events.h 244:5@
pattern SDL_EVENT_SENSOR_UPDATE :: SDL_EventType
pattern SDL_EVENT_SENSOR_UPDATE = SDL_EventType 4608

-- | Pressure-sensitive pen has become available
--
--     [C declaration]: @SDL_EVENT_PEN_PROXIMITY_IN@, defined at @SDL3\/SDL_events.h 247:5@
pattern SDL_EVENT_PEN_PROXIMITY_IN :: SDL_EventType
pattern SDL_EVENT_PEN_PROXIMITY_IN = SDL_EventType 4864

-- | Pressure-sensitive pen has become unavailable
--
--     [C declaration]: @SDL_EVENT_PEN_PROXIMITY_OUT@, defined at @SDL3\/SDL_events.h 248:5@
pattern SDL_EVENT_PEN_PROXIMITY_OUT :: SDL_EventType
pattern SDL_EVENT_PEN_PROXIMITY_OUT = SDL_EventType 4865

-- | Pressure-sensitive pen touched drawing surface
--
--     [C declaration]: @SDL_EVENT_PEN_DOWN@, defined at @SDL3\/SDL_events.h 249:5@
pattern SDL_EVENT_PEN_DOWN :: SDL_EventType
pattern SDL_EVENT_PEN_DOWN = SDL_EventType 4866

-- | Pressure-sensitive pen stopped touching drawing surface
--
--     [C declaration]: @SDL_EVENT_PEN_UP@, defined at @SDL3\/SDL_events.h 250:5@
pattern SDL_EVENT_PEN_UP :: SDL_EventType
pattern SDL_EVENT_PEN_UP = SDL_EventType 4867

-- | Pressure-sensitive pen button pressed
--
--     [C declaration]: @SDL_EVENT_PEN_BUTTON_DOWN@, defined at @SDL3\/SDL_events.h 251:5@
pattern SDL_EVENT_PEN_BUTTON_DOWN :: SDL_EventType
pattern SDL_EVENT_PEN_BUTTON_DOWN = SDL_EventType 4868

-- | Pressure-sensitive pen button released
--
--     [C declaration]: @SDL_EVENT_PEN_BUTTON_UP@, defined at @SDL3\/SDL_events.h 252:5@
pattern SDL_EVENT_PEN_BUTTON_UP :: SDL_EventType
pattern SDL_EVENT_PEN_BUTTON_UP = SDL_EventType 4869

-- | Pressure-sensitive pen is moving on the tablet
--
--     [C declaration]: @SDL_EVENT_PEN_MOTION@, defined at @SDL3\/SDL_events.h 253:5@
pattern SDL_EVENT_PEN_MOTION :: SDL_EventType
pattern SDL_EVENT_PEN_MOTION = SDL_EventType 4870

-- | Pressure-sensitive pen angle\/pressure\/etc changed
--
--     [C declaration]: @SDL_EVENT_PEN_AXIS@, defined at @SDL3\/SDL_events.h 254:5@
pattern SDL_EVENT_PEN_AXIS :: SDL_EventType
pattern SDL_EVENT_PEN_AXIS = SDL_EventType 4871

-- | A new camera device is available
--
--     [C declaration]: @SDL_EVENT_CAMERA_DEVICE_ADDED@, defined at @SDL3\/SDL_events.h 257:5@
pattern SDL_EVENT_CAMERA_DEVICE_ADDED :: SDL_EventType
pattern SDL_EVENT_CAMERA_DEVICE_ADDED = SDL_EventType 5120

-- | A camera device has been removed.
--
--     [C declaration]: @SDL_EVENT_CAMERA_DEVICE_REMOVED@, defined at @SDL3\/SDL_events.h 258:5@
pattern SDL_EVENT_CAMERA_DEVICE_REMOVED :: SDL_EventType
pattern SDL_EVENT_CAMERA_DEVICE_REMOVED = SDL_EventType 5121

-- | A camera device has been approved for use by the user.
--
--     [C declaration]: @SDL_EVENT_CAMERA_DEVICE_APPROVED@, defined at @SDL3\/SDL_events.h 259:5@
pattern SDL_EVENT_CAMERA_DEVICE_APPROVED :: SDL_EventType
pattern SDL_EVENT_CAMERA_DEVICE_APPROVED = SDL_EventType 5122

-- | A camera device has been denied for use by the user.
--
--     [C declaration]: @SDL_EVENT_CAMERA_DEVICE_DENIED@, defined at @SDL3\/SDL_events.h 260:5@
pattern SDL_EVENT_CAMERA_DEVICE_DENIED :: SDL_EventType
pattern SDL_EVENT_CAMERA_DEVICE_DENIED = SDL_EventType 5123

-- | The render targets have been reset and their contents need to be updated
--
--     [C declaration]: @SDL_EVENT_RENDER_TARGETS_RESET@, defined at @SDL3\/SDL_events.h 263:5@
pattern SDL_EVENT_RENDER_TARGETS_RESET :: SDL_EventType
pattern SDL_EVENT_RENDER_TARGETS_RESET = SDL_EventType 8192

-- | The device has been reset and all textures need to be recreated
--
--     [C declaration]: @SDL_EVENT_RENDER_DEVICE_RESET@, defined at @SDL3\/SDL_events.h 264:5@
pattern SDL_EVENT_RENDER_DEVICE_RESET :: SDL_EventType
pattern SDL_EVENT_RENDER_DEVICE_RESET = SDL_EventType 8193

-- | The device has been lost and can\'t be recovered.
--
--     [C declaration]: @SDL_EVENT_RENDER_DEVICE_LOST@, defined at @SDL3\/SDL_events.h 265:5@
pattern SDL_EVENT_RENDER_DEVICE_LOST :: SDL_EventType
pattern SDL_EVENT_RENDER_DEVICE_LOST = SDL_EventType 8194

-- | [C declaration]: @SDL_EVENT_PRIVATE0@, defined at @SDL3\/SDL_events.h 268:5@
pattern SDL_EVENT_PRIVATE0 :: SDL_EventType
pattern SDL_EVENT_PRIVATE0 = SDL_EventType 16384

-- | [C declaration]: @SDL_EVENT_PRIVATE1@, defined at @SDL3\/SDL_events.h 269:5@
pattern SDL_EVENT_PRIVATE1 :: SDL_EventType
pattern SDL_EVENT_PRIVATE1 = SDL_EventType 16385

-- | [C declaration]: @SDL_EVENT_PRIVATE2@, defined at @SDL3\/SDL_events.h 270:5@
pattern SDL_EVENT_PRIVATE2 :: SDL_EventType
pattern SDL_EVENT_PRIVATE2 = SDL_EventType 16386

-- | [C declaration]: @SDL_EVENT_PRIVATE3@, defined at @SDL3\/SDL_events.h 271:5@
pattern SDL_EVENT_PRIVATE3 :: SDL_EventType
pattern SDL_EVENT_PRIVATE3 = SDL_EventType 16387

-- | Signals the end of an event poll cycle
--
--     [C declaration]: @SDL_EVENT_POLL_SENTINEL@, defined at @SDL3\/SDL_events.h 274:5@
pattern SDL_EVENT_POLL_SENTINEL :: SDL_EventType
pattern SDL_EVENT_POLL_SENTINEL = SDL_EventType 32512

-- | Events SDL_EVENT_USER through SDL_EVENT_LAST are for your use, and should be allocated with @SDL_RegisterEvents()@
--
--     [C declaration]: @SDL_EVENT_USER@, defined at @SDL3\/SDL_events.h 279:5@
pattern SDL_EVENT_USER :: SDL_EventType
pattern SDL_EVENT_USER = SDL_EventType 32768

-- | This last event is only for bounding internal arrays
--
--     [C declaration]: @SDL_EVENT_LAST@, defined at @SDL3\/SDL_events.h 284:5@
pattern SDL_EVENT_LAST :: SDL_EventType
pattern SDL_EVENT_LAST = SDL_EventType 65535

-- | [C declaration]: @SDL_EVENT_ENUM_PADDING@, defined at @SDL3\/SDL_events.h 287:5@
pattern SDL_EVENT_ENUM_PADDING :: SDL_EventType
pattern SDL_EVENT_ENUM_PADDING = SDL_EventType 2147483647

-- | Fields shared by every event
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_CommonEvent@, defined at @SDL3\/SDL_events.h 296:16@
data SDL_CommonEvent = SDL_CommonEvent
  { type' :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ Event type, shared with all events, Uint32 to cover user events which are not in the 'SDL_EventType' enumeration
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 298:12@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 299:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 300:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_CommonEvent where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_CommonEvent where
  readRaw =
    \ptr0 ->
      pure SDL_CommonEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0

instance Marshal.WriteRaw SDL_CommonEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_CommonEvent type'2 reserved3 timestamp4 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4

deriving via Marshal.EquivStorable SDL_CommonEvent instance BG.Storable SDL_CommonEvent

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "type'" SDL_CommonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CommonEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "type'" (BG.Ptr SDL_CommonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_CommonEvent "type'" where
  type
    CFieldType SDL_CommonEvent "type'" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_CommonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CommonEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_CommonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_CommonEvent "reserved" where
  type
    CFieldType SDL_CommonEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_CommonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CommonEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_CommonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_CommonEvent "timestamp" where
  type
    CFieldType SDL_CommonEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

-- | Display state change event data (event.display.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_DisplayEvent@, defined at @SDL3\/SDL_events.h 308:16@
data SDL_DisplayEvent = SDL_DisplayEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_DISPLAY_*
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 310:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 311:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 312:12@
  , displayID :: SDL3.Sys.Bindgen.Video.SDL_DisplayID
  -- ^ The associated display
  --
  --          [C declaration]: @displayID@, defined at @SDL3\/SDL_events.h 313:19@
  , data1 :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ event dependent data
  --
  --          [C declaration]: @data1@, defined at @SDL3\/SDL_events.h 314:12@
  , data2 :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ event dependent data
  --
  --          [C declaration]: @data2@, defined at @SDL3\/SDL_events.h 315:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_DisplayEvent where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_DisplayEvent where
  readRaw =
    \ptr0 ->
      pure SDL_DisplayEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"displayID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data2") ptr0

instance Marshal.WriteRaw SDL_DisplayEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_DisplayEvent type'2 reserved3 timestamp4 displayID5 data16 data27 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"displayID") ptr0 displayID5
              >> HasCField.writeRaw (BG.Proxy @"data1") ptr0 data16
              >> HasCField.writeRaw (BG.Proxy @"data2") ptr0 data27

deriving via Marshal.EquivStorable SDL_DisplayEvent instance BG.Storable SDL_DisplayEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_DisplayEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , displayID = BG.getField @"displayID" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_DisplayEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_DisplayEvent "type'" where
  type
    CFieldType SDL_DisplayEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_DisplayEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , displayID = BG.getField @"displayID" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_DisplayEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_DisplayEvent "reserved" where
  type
    CFieldType SDL_DisplayEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_DisplayEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , displayID = BG.getField @"displayID" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_DisplayEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_DisplayEvent "timestamp" where
  type
    CFieldType SDL_DisplayEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_DisplayID)
  => BG.CompatHasField.HasField "displayID" SDL_DisplayEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayEvent
            { displayID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"displayID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_DisplayID)
  => BG.HasField "displayID" (BG.Ptr SDL_DisplayEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"displayID")

instance HasCField.HasCField SDL_DisplayEvent "displayID" where
  type
    CFieldType SDL_DisplayEvent "displayID" =
      SDL3.Sys.Bindgen.Video.SDL_DisplayID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "data1" SDL_DisplayEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayEvent
            { data1 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , displayID = BG.getField @"displayID" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"data1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "data1" (BG.Ptr SDL_DisplayEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data1")

instance HasCField.HasCField SDL_DisplayEvent "data1" where
  type
    CFieldType SDL_DisplayEvent "data1" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "data2" SDL_DisplayEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayEvent
            { data2 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , displayID = BG.getField @"displayID" x0
            , data1 = BG.getField @"data1" x0
            }
      , BG.getField @"data2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "data2" (BG.Ptr SDL_DisplayEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data2")

instance HasCField.HasCField SDL_DisplayEvent "data2" where
  type
    CFieldType SDL_DisplayEvent "data2" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 24

-- | Window state change event data (event.window.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_WindowEvent@, defined at @SDL3\/SDL_events.h 323:16@
data SDL_WindowEvent = SDL_WindowEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_WINDOW_*
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 325:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 326:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 327:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The associated window
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 328:18@
  , data1 :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ event dependent data
  --
  --          [C declaration]: @data1@, defined at @SDL3\/SDL_events.h 329:12@
  , data2 :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ event dependent data
  --
  --          [C declaration]: @data2@, defined at @SDL3\/SDL_events.h 330:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_WindowEvent where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_WindowEvent where
  readRaw =
    \ptr0 ->
      pure SDL_WindowEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data2") ptr0

instance Marshal.WriteRaw SDL_WindowEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_WindowEvent type'2 reserved3 timestamp4 windowID5 data16 data27 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
              >> HasCField.writeRaw (BG.Proxy @"data1") ptr0 data16
              >> HasCField.writeRaw (BG.Proxy @"data2") ptr0 data27

deriving via Marshal.EquivStorable SDL_WindowEvent instance BG.Storable SDL_WindowEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_WindowEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_WindowEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_WindowEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_WindowEvent "type'" where
  type
    CFieldType SDL_WindowEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_WindowEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_WindowEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_WindowEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_WindowEvent "reserved" where
  type
    CFieldType SDL_WindowEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_WindowEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_WindowEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_WindowEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_WindowEvent "timestamp" where
  type
    CFieldType SDL_WindowEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_WindowEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_WindowEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_WindowEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_WindowEvent "windowID" where
  type
    CFieldType SDL_WindowEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "data1" SDL_WindowEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_WindowEvent
            { data1 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"data1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "data1" (BG.Ptr SDL_WindowEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data1")

instance HasCField.HasCField SDL_WindowEvent "data1" where
  type
    CFieldType SDL_WindowEvent "data1" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "data2" SDL_WindowEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_WindowEvent
            { data2 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , data1 = BG.getField @"data1" x0
            }
      , BG.getField @"data2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "data2" (BG.Ptr SDL_WindowEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data2")

instance HasCField.HasCField SDL_WindowEvent "data2" where
  type
    CFieldType SDL_WindowEvent "data2" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 24

-- | Keyboard device event structure (event.kdevice.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_KeyboardDeviceEvent@, defined at @SDL3\/SDL_events.h 338:16@
data SDL_KeyboardDeviceEvent = SDL_KeyboardDeviceEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_KEYBOARD_ADDED or SDL_EVENT_KEYBOARD_REMOVED
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 340:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 341:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 342:12@
  , which :: SDL3.Sys.Bindgen.Keyboard.SDL_KeyboardID
  -- ^ The keyboard instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 343:20@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_KeyboardDeviceEvent where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_KeyboardDeviceEvent where
  readRaw =
    \ptr0 ->
      pure SDL_KeyboardDeviceEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0

instance Marshal.WriteRaw SDL_KeyboardDeviceEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_KeyboardDeviceEvent type'2 reserved3 timestamp4 which5 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5

deriving via
  Marshal.EquivStorable SDL_KeyboardDeviceEvent
  instance
    BG.Storable SDL_KeyboardDeviceEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_KeyboardDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardDeviceEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_KeyboardDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_KeyboardDeviceEvent "type'" where
  type
    CFieldType SDL_KeyboardDeviceEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_KeyboardDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardDeviceEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_KeyboardDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_KeyboardDeviceEvent "reserved" where
  type
    CFieldType SDL_KeyboardDeviceEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_KeyboardDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardDeviceEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_KeyboardDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_KeyboardDeviceEvent "timestamp" where
  type
    CFieldType SDL_KeyboardDeviceEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Keyboard.SDL_KeyboardID)
  => BG.CompatHasField.HasField "which" SDL_KeyboardDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardDeviceEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Keyboard.SDL_KeyboardID)
  => BG.HasField "which" (BG.Ptr SDL_KeyboardDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_KeyboardDeviceEvent "which" where
  type
    CFieldType SDL_KeyboardDeviceEvent "which" =
      SDL3.Sys.Bindgen.Keyboard.SDL_KeyboardID

  offset# = \_ -> \_ -> 16

-- | Keyboard button event structure (event.key.*)
--
--     The @key@ is the base SDL_Keycode generated by pressing the @scancode@ using the current keyboard layout, applying any options specified in SDL_HINT_KEYCODE_OPTIONS. You can get the SDL_Keycode corresponding to the event scancode and modifiers directly from the keyboard layout, bypassing SDL_HINT_KEYCODE_OPTIONS, by calling SDL_GetKeyFromScancode().
--
--     @since 3.2.0
--
--     [See also]: SDL_GetKeyFromScancode, SDL_HINT_KEYCODE_OPTIONS
--
--     [C declaration]: @struct SDL_KeyboardEvent@, defined at @SDL3\/SDL_events.h 360:16@
data SDL_KeyboardEvent = SDL_KeyboardEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_KEY_DOWN or SDL_EVENT_KEY_UP
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 362:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 363:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 364:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window with keyboard focus, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 365:18@
  , which :: SDL3.Sys.Bindgen.Keyboard.SDL_KeyboardID
  -- ^ The keyboard instance id, or 0 if unknown or virtual
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 366:20@
  , scancode :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -- ^ SDL physical key code
  --
  --          [C declaration]: @scancode@, defined at @SDL3\/SDL_events.h 367:18@
  , key :: SDL3.Sys.Bindgen.Keycode.SDL_Keycode
  -- ^ SDL virtual key code
  --
  --          [C declaration]: @key@, defined at @SDL3\/SDL_events.h 368:17@
  , mod :: SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -- ^ current key modifiers
  --
  --          [C declaration]: @mod@, defined at @SDL3\/SDL_events.h 369:16@
  , raw :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ The platform dependent scancode for this event
  --
  --          [C declaration]: @raw@, defined at @SDL3\/SDL_events.h 370:12@
  , down :: BG.CBool
  -- ^ true if the key is pressed
  --
  --          [C declaration]: @down@, defined at @SDL3\/SDL_events.h 371:10@
  , repeat :: BG.CBool
  -- ^ true if this is a key repeat
  --
  --          [C declaration]: @repeat@, defined at @SDL3\/SDL_events.h 372:10@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_KeyboardEvent where
  staticSizeOf = \_ -> (40 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_KeyboardEvent where
  readRaw =
    \ptr0 ->
      pure SDL_KeyboardEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"scancode") ptr0
        <*> HasCField.readRaw (BG.Proxy @"key") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mod") ptr0
        <*> HasCField.readRaw (BG.Proxy @"raw") ptr0
        <*> HasCField.readRaw (BG.Proxy @"down") ptr0
        <*> HasCField.readRaw (BG.Proxy @"repeat") ptr0

instance Marshal.WriteRaw SDL_KeyboardEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_KeyboardEvent
            type'2
            reserved3
            timestamp4
            windowID5
            which6
            scancode7
            key8
            mod9
            raw10
            down11
            repeat12 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which6
                >> HasCField.writeRaw (BG.Proxy @"scancode") ptr0 scancode7
                >> HasCField.writeRaw (BG.Proxy @"key") ptr0 key8
                >> HasCField.writeRaw (BG.Proxy @"mod") ptr0 mod9
                >> HasCField.writeRaw (BG.Proxy @"raw") ptr0 raw10
                >> HasCField.writeRaw (BG.Proxy @"down") ptr0 down11
                >> HasCField.writeRaw (BG.Proxy @"repeat") ptr0 repeat12

deriving via Marshal.EquivStorable SDL_KeyboardEvent instance BG.Storable SDL_KeyboardEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_KeyboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , scancode = BG.getField @"scancode" x0
            , key = BG.getField @"key" x0
            , mod = BG.getField @"mod" x0
            , raw = BG.getField @"raw" x0
            , down = BG.getField @"down" x0
            , repeat = BG.getField @"repeat" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_KeyboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_KeyboardEvent "type'" where
  type
    CFieldType SDL_KeyboardEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_KeyboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , scancode = BG.getField @"scancode" x0
            , key = BG.getField @"key" x0
            , mod = BG.getField @"mod" x0
            , raw = BG.getField @"raw" x0
            , down = BG.getField @"down" x0
            , repeat = BG.getField @"repeat" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_KeyboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_KeyboardEvent "reserved" where
  type
    CFieldType SDL_KeyboardEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_KeyboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , scancode = BG.getField @"scancode" x0
            , key = BG.getField @"key" x0
            , mod = BG.getField @"mod" x0
            , raw = BG.getField @"raw" x0
            , down = BG.getField @"down" x0
            , repeat = BG.getField @"repeat" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_KeyboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_KeyboardEvent "timestamp" where
  type
    CFieldType SDL_KeyboardEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_KeyboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , scancode = BG.getField @"scancode" x0
            , key = BG.getField @"key" x0
            , mod = BG.getField @"mod" x0
            , raw = BG.getField @"raw" x0
            , down = BG.getField @"down" x0
            , repeat = BG.getField @"repeat" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_KeyboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_KeyboardEvent "windowID" where
  type
    CFieldType SDL_KeyboardEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Keyboard.SDL_KeyboardID)
  => BG.CompatHasField.HasField "which" SDL_KeyboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , scancode = BG.getField @"scancode" x0
            , key = BG.getField @"key" x0
            , mod = BG.getField @"mod" x0
            , raw = BG.getField @"raw" x0
            , down = BG.getField @"down" x0
            , repeat = BG.getField @"repeat" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Keyboard.SDL_KeyboardID)
  => BG.HasField "which" (BG.Ptr SDL_KeyboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_KeyboardEvent "which" where
  type
    CFieldType SDL_KeyboardEvent "which" =
      SDL3.Sys.Bindgen.Keyboard.SDL_KeyboardID

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Scancode.SDL_Scancode)
  => BG.CompatHasField.HasField "scancode" SDL_KeyboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardEvent
            { scancode = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , key = BG.getField @"key" x0
            , mod = BG.getField @"mod" x0
            , raw = BG.getField @"raw" x0
            , down = BG.getField @"down" x0
            , repeat = BG.getField @"repeat" x0
            }
      , BG.getField @"scancode" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Scancode.SDL_Scancode)
  => BG.HasField "scancode" (BG.Ptr SDL_KeyboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"scancode")

instance HasCField.HasCField SDL_KeyboardEvent "scancode" where
  type
    CFieldType SDL_KeyboardEvent "scancode" =
      SDL3.Sys.Bindgen.Scancode.SDL_Scancode

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Keycode.SDL_Keycode)
  => BG.CompatHasField.HasField "key" SDL_KeyboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardEvent
            { key = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , scancode = BG.getField @"scancode" x0
            , mod = BG.getField @"mod" x0
            , raw = BG.getField @"raw" x0
            , down = BG.getField @"down" x0
            , repeat = BG.getField @"repeat" x0
            }
      , BG.getField @"key" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Keycode.SDL_Keycode)
  => BG.HasField "key" (BG.Ptr SDL_KeyboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"key")

instance HasCField.HasCField SDL_KeyboardEvent "key" where
  type
    CFieldType SDL_KeyboardEvent "key" =
      SDL3.Sys.Bindgen.Keycode.SDL_Keycode

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Keycode.SDL_Keymod)
  => BG.CompatHasField.HasField "mod" SDL_KeyboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardEvent
            { mod = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , scancode = BG.getField @"scancode" x0
            , key = BG.getField @"key" x0
            , raw = BG.getField @"raw" x0
            , down = BG.getField @"down" x0
            , repeat = BG.getField @"repeat" x0
            }
      , BG.getField @"mod" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Keycode.SDL_Keymod)
  => BG.HasField "mod" (BG.Ptr SDL_KeyboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mod")

instance HasCField.HasCField SDL_KeyboardEvent "mod" where
  type
    CFieldType SDL_KeyboardEvent "mod" =
      SDL3.Sys.Bindgen.Keycode.SDL_Keymod

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "raw" SDL_KeyboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardEvent
            { raw = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , scancode = BG.getField @"scancode" x0
            , key = BG.getField @"key" x0
            , mod = BG.getField @"mod" x0
            , down = BG.getField @"down" x0
            , repeat = BG.getField @"repeat" x0
            }
      , BG.getField @"raw" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "raw" (BG.Ptr SDL_KeyboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"raw")

instance HasCField.HasCField SDL_KeyboardEvent "raw" where
  type
    CFieldType SDL_KeyboardEvent "raw" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 34

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "down" SDL_KeyboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardEvent
            { down = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , scancode = BG.getField @"scancode" x0
            , key = BG.getField @"key" x0
            , mod = BG.getField @"mod" x0
            , raw = BG.getField @"raw" x0
            , repeat = BG.getField @"repeat" x0
            }
      , BG.getField @"down" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "down" (BG.Ptr SDL_KeyboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"down")

instance HasCField.HasCField SDL_KeyboardEvent "down" where
  type CFieldType SDL_KeyboardEvent "down" = BG.CBool

  offset# = \_ -> \_ -> 36

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "repeat" SDL_KeyboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardEvent
            { repeat = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , scancode = BG.getField @"scancode" x0
            , key = BG.getField @"key" x0
            , mod = BG.getField @"mod" x0
            , raw = BG.getField @"raw" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"repeat" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "repeat" (BG.Ptr SDL_KeyboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"repeat")

instance HasCField.HasCField SDL_KeyboardEvent "repeat" where
  type CFieldType SDL_KeyboardEvent "repeat" = BG.CBool

  offset# = \_ -> \_ -> 37

-- | Keyboard text editing event structure (event.edit.*)
--
--     The start cursor is the position, in UTF-8 characters, where new typing will be inserted into the editing text. The length is the number of UTF-8 characters that will be replaced by new typing.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_TextEditingEvent@, defined at @SDL3\/SDL_events.h 384:16@
data SDL_TextEditingEvent = SDL_TextEditingEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_TEXT_EDITING
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 386:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 387:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 388:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window with keyboard focus, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 389:18@
  , text :: PtrConst.PtrConst BG.CChar
  -- ^ The editing text
  --
  --          [C declaration]: @text@, defined at @SDL3\/SDL_events.h 390:17@
  , start :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The start cursor of selected editing text, or -1 if not set
  --
  --          [C declaration]: @start@, defined at @SDL3\/SDL_events.h 391:12@
  , length :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The length of selected editing text, or -1 if not set
  --
  --          [C declaration]: @length@, defined at @SDL3\/SDL_events.h 392:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_TextEditingEvent where
  staticSizeOf = \_ -> (40 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_TextEditingEvent where
  readRaw =
    \ptr0 ->
      pure SDL_TextEditingEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"text") ptr0
        <*> HasCField.readRaw (BG.Proxy @"start") ptr0
        <*> HasCField.readRaw (BG.Proxy @"length") ptr0

instance Marshal.WriteRaw SDL_TextEditingEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_TextEditingEvent
            type'2
            reserved3
            timestamp4
            windowID5
            text6
            start7
            length8 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
                >> HasCField.writeRaw (BG.Proxy @"text") ptr0 text6
                >> HasCField.writeRaw (BG.Proxy @"start") ptr0 start7
                >> HasCField.writeRaw (BG.Proxy @"length") ptr0 length8

deriving via Marshal.EquivStorable SDL_TextEditingEvent instance BG.Storable SDL_TextEditingEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_TextEditingEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , text = BG.getField @"text" x0
            , start = BG.getField @"start" x0
            , length = BG.getField @"length" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_TextEditingEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_TextEditingEvent "type'" where
  type
    CFieldType SDL_TextEditingEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_TextEditingEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , text = BG.getField @"text" x0
            , start = BG.getField @"start" x0
            , length = BG.getField @"length" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_TextEditingEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_TextEditingEvent "reserved" where
  type
    CFieldType SDL_TextEditingEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_TextEditingEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , text = BG.getField @"text" x0
            , start = BG.getField @"start" x0
            , length = BG.getField @"length" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_TextEditingEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_TextEditingEvent "timestamp" where
  type
    CFieldType SDL_TextEditingEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_TextEditingEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , text = BG.getField @"text" x0
            , start = BG.getField @"start" x0
            , length = BG.getField @"length" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_TextEditingEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_TextEditingEvent "windowID" where
  type
    CFieldType SDL_TextEditingEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "text" SDL_TextEditingEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingEvent
            { text = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , start = BG.getField @"start" x0
            , length = BG.getField @"length" x0
            }
      , BG.getField @"text" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "text" (BG.Ptr SDL_TextEditingEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"text")

instance HasCField.HasCField SDL_TextEditingEvent "text" where
  type
    CFieldType SDL_TextEditingEvent "text" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "start" SDL_TextEditingEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingEvent
            { start = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , text = BG.getField @"text" x0
            , length = BG.getField @"length" x0
            }
      , BG.getField @"start" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "start" (BG.Ptr SDL_TextEditingEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"start")

instance HasCField.HasCField SDL_TextEditingEvent "start" where
  type
    CFieldType SDL_TextEditingEvent "start" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "length" SDL_TextEditingEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingEvent
            { length = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , text = BG.getField @"text" x0
            , start = BG.getField @"start" x0
            }
      , BG.getField @"length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "length" (BG.Ptr SDL_TextEditingEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"length")

instance HasCField.HasCField SDL_TextEditingEvent "length" where
  type
    CFieldType SDL_TextEditingEvent "length" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 36

-- | Keyboard IME candidates event structure (event.edit_candidates.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_TextEditingCandidatesEvent@, defined at @SDL3\/SDL_events.h 400:16@
data SDL_TextEditingCandidatesEvent = SDL_TextEditingCandidatesEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_TEXT_EDITING_CANDIDATES
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 402:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 403:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 404:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window with keyboard focus, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 405:18@
  , candidates :: PtrConst.PtrConst (PtrConst.PtrConst BG.CChar)
  -- ^ The list of candidates, or NULL if there are no candidates available
  --
  --          [C declaration]: @candidates@, defined at @SDL3\/SDL_events.h 406:25@
  , num_candidates :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The number of strings in @candidates@
  --
  --          [C declaration]: @num_candidates@, defined at @SDL3\/SDL_events.h 407:12@
  , selected_candidate :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The index of the selected candidate, or -1 if no candidate is selected
  --
  --          [C declaration]: @selected_candidate@, defined at @SDL3\/SDL_events.h 408:12@
  , horizontal :: BG.CBool
  -- ^ true if the list is horizontal, false if it\'s vertical
  --
  --          [C declaration]: @horizontal@, defined at @SDL3\/SDL_events.h 409:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_events.h 410:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_events.h 411:11@
  , padding3 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding3@, defined at @SDL3\/SDL_events.h 412:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_TextEditingCandidatesEvent where
  staticSizeOf = \_ -> (48 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_TextEditingCandidatesEvent where
  readRaw =
    \ptr0 ->
      pure SDL_TextEditingCandidatesEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"candidates") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_candidates") ptr0
        <*> HasCField.readRaw (BG.Proxy @"selected_candidate") ptr0
        <*> HasCField.readRaw (BG.Proxy @"horizontal") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding3") ptr0

instance Marshal.WriteRaw SDL_TextEditingCandidatesEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_TextEditingCandidatesEvent
            type'2
            reserved3
            timestamp4
            windowID5
            candidates6
            num_candidates7
            selected_candidate8
            horizontal9
            padding110
            padding211
            padding312 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
                >> HasCField.writeRaw (BG.Proxy @"candidates") ptr0 candidates6
                >> HasCField.writeRaw (BG.Proxy @"num_candidates") ptr0 num_candidates7
                >> HasCField.writeRaw (BG.Proxy @"selected_candidate") ptr0 selected_candidate8
                >> HasCField.writeRaw (BG.Proxy @"horizontal") ptr0 horizontal9
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding110
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding211
                >> HasCField.writeRaw (BG.Proxy @"padding3") ptr0 padding312

deriving via
  Marshal.EquivStorable SDL_TextEditingCandidatesEvent
  instance
    BG.Storable SDL_TextEditingCandidatesEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_TextEditingCandidatesEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingCandidatesEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , candidates = BG.getField @"candidates" x0
            , num_candidates = BG.getField @"num_candidates" x0
            , selected_candidate = BG.getField @"selected_candidate" x0
            , horizontal = BG.getField @"horizontal" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_TextEditingCandidatesEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_TextEditingCandidatesEvent "type'" where
  type
    CFieldType SDL_TextEditingCandidatesEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_TextEditingCandidatesEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingCandidatesEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , candidates = BG.getField @"candidates" x0
            , num_candidates = BG.getField @"num_candidates" x0
            , selected_candidate = BG.getField @"selected_candidate" x0
            , horizontal = BG.getField @"horizontal" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_TextEditingCandidatesEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_TextEditingCandidatesEvent "reserved" where
  type
    CFieldType SDL_TextEditingCandidatesEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_TextEditingCandidatesEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingCandidatesEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , candidates = BG.getField @"candidates" x0
            , num_candidates = BG.getField @"num_candidates" x0
            , selected_candidate = BG.getField @"selected_candidate" x0
            , horizontal = BG.getField @"horizontal" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_TextEditingCandidatesEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_TextEditingCandidatesEvent "timestamp" where
  type
    CFieldType SDL_TextEditingCandidatesEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_TextEditingCandidatesEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingCandidatesEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , candidates = BG.getField @"candidates" x0
            , num_candidates = BG.getField @"num_candidates" x0
            , selected_candidate = BG.getField @"selected_candidate" x0
            , horizontal = BG.getField @"horizontal" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_TextEditingCandidatesEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_TextEditingCandidatesEvent "windowID" where
  type
    CFieldType SDL_TextEditingCandidatesEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ PtrConst.PtrConst (PtrConst.PtrConst BG.CChar))
  => BG.CompatHasField.HasField "candidates" SDL_TextEditingCandidatesEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingCandidatesEvent
            { candidates = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , num_candidates = BG.getField @"num_candidates" x0
            , selected_candidate = BG.getField @"selected_candidate" x0
            , horizontal = BG.getField @"horizontal" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"candidates" x0
      )

instance
  (ty ~ PtrConst.PtrConst (PtrConst.PtrConst BG.CChar))
  => BG.HasField "candidates" (BG.Ptr SDL_TextEditingCandidatesEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"candidates")

instance HasCField.HasCField SDL_TextEditingCandidatesEvent "candidates" where
  type
    CFieldType SDL_TextEditingCandidatesEvent "candidates" =
      PtrConst.PtrConst (PtrConst.PtrConst BG.CChar)

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "num_candidates" SDL_TextEditingCandidatesEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingCandidatesEvent
            { num_candidates = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , candidates = BG.getField @"candidates" x0
            , selected_candidate = BG.getField @"selected_candidate" x0
            , horizontal = BG.getField @"horizontal" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"num_candidates" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "num_candidates" (BG.Ptr SDL_TextEditingCandidatesEvent) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_candidates")

instance HasCField.HasCField SDL_TextEditingCandidatesEvent "num_candidates" where
  type
    CFieldType SDL_TextEditingCandidatesEvent "num_candidates" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "selected_candidate" SDL_TextEditingCandidatesEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingCandidatesEvent
            { selected_candidate = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , candidates = BG.getField @"candidates" x0
            , num_candidates = BG.getField @"num_candidates" x0
            , horizontal = BG.getField @"horizontal" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"selected_candidate" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "selected_candidate" (BG.Ptr SDL_TextEditingCandidatesEvent) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"selected_candidate")

instance HasCField.HasCField SDL_TextEditingCandidatesEvent "selected_candidate" where
  type
    CFieldType SDL_TextEditingCandidatesEvent "selected_candidate" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 36

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "horizontal" SDL_TextEditingCandidatesEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingCandidatesEvent
            { horizontal = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , candidates = BG.getField @"candidates" x0
            , num_candidates = BG.getField @"num_candidates" x0
            , selected_candidate = BG.getField @"selected_candidate" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"horizontal" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "horizontal" (BG.Ptr SDL_TextEditingCandidatesEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"horizontal")

instance HasCField.HasCField SDL_TextEditingCandidatesEvent "horizontal" where
  type
    CFieldType SDL_TextEditingCandidatesEvent "horizontal" =
      BG.CBool

  offset# = \_ -> \_ -> 40

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_TextEditingCandidatesEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingCandidatesEvent
            { padding1 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , candidates = BG.getField @"candidates" x0
            , num_candidates = BG.getField @"num_candidates" x0
            , selected_candidate = BG.getField @"selected_candidate" x0
            , horizontal = BG.getField @"horizontal" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_TextEditingCandidatesEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_TextEditingCandidatesEvent "padding1" where
  type
    CFieldType SDL_TextEditingCandidatesEvent "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 41

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_TextEditingCandidatesEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingCandidatesEvent
            { padding2 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , candidates = BG.getField @"candidates" x0
            , num_candidates = BG.getField @"num_candidates" x0
            , selected_candidate = BG.getField @"selected_candidate" x0
            , horizontal = BG.getField @"horizontal" x0
            , padding1 = BG.getField @"padding1" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_TextEditingCandidatesEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_TextEditingCandidatesEvent "padding2" where
  type
    CFieldType SDL_TextEditingCandidatesEvent "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 42

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding3" SDL_TextEditingCandidatesEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextEditingCandidatesEvent
            { padding3 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , candidates = BG.getField @"candidates" x0
            , num_candidates = BG.getField @"num_candidates" x0
            , selected_candidate = BG.getField @"selected_candidate" x0
            , horizontal = BG.getField @"horizontal" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding3" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding3" (BG.Ptr SDL_TextEditingCandidatesEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding3")

instance HasCField.HasCField SDL_TextEditingCandidatesEvent "padding3" where
  type
    CFieldType SDL_TextEditingCandidatesEvent "padding3" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 43

-- | Keyboard text input event structure (event.text.*)
--
--     This event will never be delivered unless text input is enabled by calling SDL_StartTextInput(). Text input is disabled by default!
--
--     @since 3.2.0
--
--     [See also]: SDL_StartTextInput, SDL_StopTextInput
--
--     [C declaration]: @struct SDL_TextInputEvent@, defined at @SDL3\/SDL_events.h 426:16@
data SDL_TextInputEvent = SDL_TextInputEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_TEXT_INPUT
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 428:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 429:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 430:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window with keyboard focus, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 431:18@
  , text :: PtrConst.PtrConst BG.CChar
  -- ^ The input text, UTF-8 encoded
  --
  --          [C declaration]: @text@, defined at @SDL3\/SDL_events.h 432:17@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_TextInputEvent where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_TextInputEvent where
  readRaw =
    \ptr0 ->
      pure SDL_TextInputEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"text") ptr0

instance Marshal.WriteRaw SDL_TextInputEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_TextInputEvent type'2 reserved3 timestamp4 windowID5 text6 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
              >> HasCField.writeRaw (BG.Proxy @"text") ptr0 text6

deriving via Marshal.EquivStorable SDL_TextInputEvent instance BG.Storable SDL_TextInputEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_TextInputEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextInputEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , text = BG.getField @"text" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_TextInputEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_TextInputEvent "type'" where
  type
    CFieldType SDL_TextInputEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_TextInputEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextInputEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , text = BG.getField @"text" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_TextInputEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_TextInputEvent "reserved" where
  type
    CFieldType SDL_TextInputEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_TextInputEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextInputEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , text = BG.getField @"text" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_TextInputEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_TextInputEvent "timestamp" where
  type
    CFieldType SDL_TextInputEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_TextInputEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextInputEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , text = BG.getField @"text" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_TextInputEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_TextInputEvent "windowID" where
  type
    CFieldType SDL_TextInputEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "text" SDL_TextInputEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextInputEvent
            { text = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"text" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "text" (BG.Ptr SDL_TextInputEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"text")

instance HasCField.HasCField SDL_TextInputEvent "text" where
  type
    CFieldType SDL_TextInputEvent "text" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 24

-- | Mouse device event structure (event.mdevice.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_MouseDeviceEvent@, defined at @SDL3\/SDL_events.h 440:16@
data SDL_MouseDeviceEvent = SDL_MouseDeviceEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_MOUSE_ADDED or SDL_EVENT_MOUSE_REMOVED
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 442:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 443:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 444:12@
  , which :: SDL3.Sys.Bindgen.Mouse.SDL_MouseID
  -- ^ The mouse instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 445:17@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_MouseDeviceEvent where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_MouseDeviceEvent where
  readRaw =
    \ptr0 ->
      pure SDL_MouseDeviceEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0

instance Marshal.WriteRaw SDL_MouseDeviceEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_MouseDeviceEvent type'2 reserved3 timestamp4 which5 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5

deriving via Marshal.EquivStorable SDL_MouseDeviceEvent instance BG.Storable SDL_MouseDeviceEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_MouseDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseDeviceEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_MouseDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_MouseDeviceEvent "type'" where
  type
    CFieldType SDL_MouseDeviceEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_MouseDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseDeviceEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_MouseDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_MouseDeviceEvent "reserved" where
  type
    CFieldType SDL_MouseDeviceEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_MouseDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseDeviceEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_MouseDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_MouseDeviceEvent "timestamp" where
  type
    CFieldType SDL_MouseDeviceEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Mouse.SDL_MouseID)
  => BG.CompatHasField.HasField "which" SDL_MouseDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseDeviceEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Mouse.SDL_MouseID)
  => BG.HasField "which" (BG.Ptr SDL_MouseDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_MouseDeviceEvent "which" where
  type
    CFieldType SDL_MouseDeviceEvent "which" =
      SDL3.Sys.Bindgen.Mouse.SDL_MouseID

  offset# = \_ -> \_ -> 16

-- | Mouse motion event structure (event.motion.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_MouseMotionEvent@, defined at @SDL3\/SDL_events.h 453:16@
data SDL_MouseMotionEvent = SDL_MouseMotionEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_MOUSE_MOTION
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 455:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 456:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 457:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window with mouse focus, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 458:18@
  , which :: SDL3.Sys.Bindgen.Mouse.SDL_MouseID
  -- ^ The mouse instance id in relative mode, SDL_TOUCH_MOUSEID for touch events, or 0
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 459:17@
  , state :: SDL3.Sys.Bindgen.Mouse.SDL_MouseButtonFlags
  -- ^ The current button state
  --
  --          [C declaration]: @state@, defined at @SDL3\/SDL_events.h 460:26@
  , x :: BG.CFloat
  -- ^ X coordinate, relative to window
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_events.h 461:11@
  , y :: BG.CFloat
  -- ^ Y coordinate, relative to window
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_events.h 462:11@
  , xrel :: BG.CFloat
  -- ^ The relative motion in the X direction
  --
  --          [C declaration]: @xrel@, defined at @SDL3\/SDL_events.h 463:11@
  , yrel :: BG.CFloat
  -- ^ The relative motion in the Y direction
  --
  --          [C declaration]: @yrel@, defined at @SDL3\/SDL_events.h 464:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_MouseMotionEvent where
  staticSizeOf = \_ -> (48 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_MouseMotionEvent where
  readRaw =
    \ptr0 ->
      pure SDL_MouseMotionEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"state") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"xrel") ptr0
        <*> HasCField.readRaw (BG.Proxy @"yrel") ptr0

instance Marshal.WriteRaw SDL_MouseMotionEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_MouseMotionEvent
            type'2
            reserved3
            timestamp4
            windowID5
            which6
            state7
            x8
            y9
            xrel10
            yrel11 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which6
                >> HasCField.writeRaw (BG.Proxy @"state") ptr0 state7
                >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x8
                >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y9
                >> HasCField.writeRaw (BG.Proxy @"xrel") ptr0 xrel10
                >> HasCField.writeRaw (BG.Proxy @"yrel") ptr0 yrel11

deriving via Marshal.EquivStorable SDL_MouseMotionEvent instance BG.Storable SDL_MouseMotionEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_MouseMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseMotionEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , state = BG.getField @"state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_MouseMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_MouseMotionEvent "type'" where
  type
    CFieldType SDL_MouseMotionEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_MouseMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseMotionEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , state = BG.getField @"state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_MouseMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_MouseMotionEvent "reserved" where
  type
    CFieldType SDL_MouseMotionEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_MouseMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseMotionEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , state = BG.getField @"state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_MouseMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_MouseMotionEvent "timestamp" where
  type
    CFieldType SDL_MouseMotionEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_MouseMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseMotionEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , state = BG.getField @"state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_MouseMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_MouseMotionEvent "windowID" where
  type
    CFieldType SDL_MouseMotionEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Mouse.SDL_MouseID)
  => BG.CompatHasField.HasField "which" SDL_MouseMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseMotionEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , state = BG.getField @"state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Mouse.SDL_MouseID)
  => BG.HasField "which" (BG.Ptr SDL_MouseMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_MouseMotionEvent "which" where
  type
    CFieldType SDL_MouseMotionEvent "which" =
      SDL3.Sys.Bindgen.Mouse.SDL_MouseID

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Mouse.SDL_MouseButtonFlags)
  => BG.CompatHasField.HasField "state" SDL_MouseMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseMotionEvent
            { state = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"state" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Mouse.SDL_MouseButtonFlags)
  => BG.HasField "state" (BG.Ptr SDL_MouseMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"state")

instance HasCField.HasCField SDL_MouseMotionEvent "state" where
  type
    CFieldType SDL_MouseMotionEvent "state" =
      SDL3.Sys.Bindgen.Mouse.SDL_MouseButtonFlags

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "x" SDL_MouseMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseMotionEvent
            { x = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , state = BG.getField @"state" x0
            , y = BG.getField @"y" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_MouseMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_MouseMotionEvent "x" where
  type CFieldType SDL_MouseMotionEvent "x" = BG.CFloat

  offset# = \_ -> \_ -> 28

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "y" SDL_MouseMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseMotionEvent
            { y = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , state = BG.getField @"state" x0
            , x = BG.getField @"x" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_MouseMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_MouseMotionEvent "y" where
  type CFieldType SDL_MouseMotionEvent "y" = BG.CFloat

  offset# = \_ -> \_ -> 32

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "xrel" SDL_MouseMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseMotionEvent
            { xrel = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , state = BG.getField @"state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"xrel" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "xrel" (BG.Ptr SDL_MouseMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"xrel")

instance HasCField.HasCField SDL_MouseMotionEvent "xrel" where
  type
    CFieldType SDL_MouseMotionEvent "xrel" =
      BG.CFloat

  offset# = \_ -> \_ -> 36

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "yrel" SDL_MouseMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseMotionEvent
            { yrel = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , state = BG.getField @"state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , xrel = BG.getField @"xrel" x0
            }
      , BG.getField @"yrel" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "yrel" (BG.Ptr SDL_MouseMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"yrel")

instance HasCField.HasCField SDL_MouseMotionEvent "yrel" where
  type
    CFieldType SDL_MouseMotionEvent "yrel" =
      BG.CFloat

  offset# = \_ -> \_ -> 40

-- | Mouse button event structure (event.button.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_MouseButtonEvent@, defined at @SDL3\/SDL_events.h 472:16@
data SDL_MouseButtonEvent = SDL_MouseButtonEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_MOUSE_BUTTON_DOWN or SDL_EVENT_MOUSE_BUTTON_UP
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 474:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 475:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 476:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window with mouse focus, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 477:18@
  , which :: SDL3.Sys.Bindgen.Mouse.SDL_MouseID
  -- ^ The mouse instance id in relative mode, SDL_TOUCH_MOUSEID for touch events, or 0
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 478:17@
  , button :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ The mouse button index
  --
  --          [C declaration]: @button@, defined at @SDL3\/SDL_events.h 479:11@
  , down :: BG.CBool
  -- ^ true if the button is pressed
  --
  --          [C declaration]: @down@, defined at @SDL3\/SDL_events.h 480:10@
  , clicks :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ 1 for single-click, 2 for double-click, etc.
  --
  --          [C declaration]: @clicks@, defined at @SDL3\/SDL_events.h 481:11@
  , padding :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding@, defined at @SDL3\/SDL_events.h 482:11@
  , x :: BG.CFloat
  -- ^ X coordinate, relative to window
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_events.h 483:11@
  , y :: BG.CFloat
  -- ^ Y coordinate, relative to window
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_events.h 484:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_MouseButtonEvent where
  staticSizeOf = \_ -> (40 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_MouseButtonEvent where
  readRaw =
    \ptr0 ->
      pure SDL_MouseButtonEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"button") ptr0
        <*> HasCField.readRaw (BG.Proxy @"down") ptr0
        <*> HasCField.readRaw (BG.Proxy @"clicks") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0

instance Marshal.WriteRaw SDL_MouseButtonEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_MouseButtonEvent
            type'2
            reserved3
            timestamp4
            windowID5
            which6
            button7
            down8
            clicks9
            padding10
            x11
            y12 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which6
                >> HasCField.writeRaw (BG.Proxy @"button") ptr0 button7
                >> HasCField.writeRaw (BG.Proxy @"down") ptr0 down8
                >> HasCField.writeRaw (BG.Proxy @"clicks") ptr0 clicks9
                >> HasCField.writeRaw (BG.Proxy @"padding") ptr0 padding10
                >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x11
                >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y12

deriving via Marshal.EquivStorable SDL_MouseButtonEvent instance BG.Storable SDL_MouseButtonEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_MouseButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseButtonEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , clicks = BG.getField @"clicks" x0
            , padding = BG.getField @"padding" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_MouseButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_MouseButtonEvent "type'" where
  type
    CFieldType SDL_MouseButtonEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_MouseButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseButtonEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , clicks = BG.getField @"clicks" x0
            , padding = BG.getField @"padding" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_MouseButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_MouseButtonEvent "reserved" where
  type
    CFieldType SDL_MouseButtonEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_MouseButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseButtonEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , clicks = BG.getField @"clicks" x0
            , padding = BG.getField @"padding" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_MouseButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_MouseButtonEvent "timestamp" where
  type
    CFieldType SDL_MouseButtonEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_MouseButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseButtonEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , clicks = BG.getField @"clicks" x0
            , padding = BG.getField @"padding" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_MouseButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_MouseButtonEvent "windowID" where
  type
    CFieldType SDL_MouseButtonEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Mouse.SDL_MouseID)
  => BG.CompatHasField.HasField "which" SDL_MouseButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseButtonEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , clicks = BG.getField @"clicks" x0
            , padding = BG.getField @"padding" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Mouse.SDL_MouseID)
  => BG.HasField "which" (BG.Ptr SDL_MouseButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_MouseButtonEvent "which" where
  type
    CFieldType SDL_MouseButtonEvent "which" =
      SDL3.Sys.Bindgen.Mouse.SDL_MouseID

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "button" SDL_MouseButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseButtonEvent
            { button = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , down = BG.getField @"down" x0
            , clicks = BG.getField @"clicks" x0
            , padding = BG.getField @"padding" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"button" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "button" (BG.Ptr SDL_MouseButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"button")

instance HasCField.HasCField SDL_MouseButtonEvent "button" where
  type
    CFieldType SDL_MouseButtonEvent "button" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "down" SDL_MouseButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseButtonEvent
            { down = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , clicks = BG.getField @"clicks" x0
            , padding = BG.getField @"padding" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"down" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "down" (BG.Ptr SDL_MouseButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"down")

instance HasCField.HasCField SDL_MouseButtonEvent "down" where
  type
    CFieldType SDL_MouseButtonEvent "down" =
      BG.CBool

  offset# = \_ -> \_ -> 25

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "clicks" SDL_MouseButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseButtonEvent
            { clicks = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding = BG.getField @"padding" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"clicks" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "clicks" (BG.Ptr SDL_MouseButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"clicks")

instance HasCField.HasCField SDL_MouseButtonEvent "clicks" where
  type
    CFieldType SDL_MouseButtonEvent "clicks" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 26

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding" SDL_MouseButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseButtonEvent
            { padding = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , clicks = BG.getField @"clicks" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"padding" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding" (BG.Ptr SDL_MouseButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding")

instance HasCField.HasCField SDL_MouseButtonEvent "padding" where
  type
    CFieldType SDL_MouseButtonEvent "padding" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 27

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "x" SDL_MouseButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseButtonEvent
            { x = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , clicks = BG.getField @"clicks" x0
            , padding = BG.getField @"padding" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_MouseButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_MouseButtonEvent "x" where
  type CFieldType SDL_MouseButtonEvent "x" = BG.CFloat

  offset# = \_ -> \_ -> 28

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "y" SDL_MouseButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseButtonEvent
            { y = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , clicks = BG.getField @"clicks" x0
            , padding = BG.getField @"padding" x0
            , x = BG.getField @"x" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_MouseButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_MouseButtonEvent "y" where
  type CFieldType SDL_MouseButtonEvent "y" = BG.CFloat

  offset# = \_ -> \_ -> 32

-- | Mouse wheel event structure (event.wheel.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_MouseWheelEvent@, defined at @SDL3\/SDL_events.h 492:16@
data SDL_MouseWheelEvent = SDL_MouseWheelEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_MOUSE_WHEEL
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 494:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 495:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 496:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window with mouse focus, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 497:18@
  , which :: SDL3.Sys.Bindgen.Mouse.SDL_MouseID
  -- ^ The mouse instance id in relative mode or 0
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 498:17@
  , x :: BG.CFloat
  -- ^ The amount scrolled horizontally, positive to the right and negative to the left
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_events.h 499:11@
  , y :: BG.CFloat
  -- ^ The amount scrolled vertically, positive away from the user and negative toward the user
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_events.h 500:11@
  , direction :: SDL3.Sys.Bindgen.Mouse.SDL_MouseWheelDirection
  -- ^ Set to one of the SDL_MOUSEWHEEL_* defines. When FLIPPED the values in X and Y will be opposite. Multiply by -1 to change them back
  --
  --          [C declaration]: @direction@, defined at @SDL3\/SDL_events.h 501:29@
  , mouse_x :: BG.CFloat
  -- ^ X coordinate, relative to window
  --
  --          [C declaration]: @mouse_x@, defined at @SDL3\/SDL_events.h 502:11@
  , mouse_y :: BG.CFloat
  -- ^ Y coordinate, relative to window
  --
  --          [C declaration]: @mouse_y@, defined at @SDL3\/SDL_events.h 503:11@
  , integer_x :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The amount scrolled horizontally, accumulated to whole scroll \"ticks\" (added in 3.2.12)
  --
  --          [C declaration]: @integer_x@, defined at @SDL3\/SDL_events.h 504:12@
  , integer_y :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The amount scrolled vertically, accumulated to whole scroll \"ticks\" (added in 3.2.12)
  --
  --          [C declaration]: @integer_y@, defined at @SDL3\/SDL_events.h 505:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_MouseWheelEvent where
  staticSizeOf = \_ -> (56 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_MouseWheelEvent where
  readRaw =
    \ptr0 ->
      pure SDL_MouseWheelEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"direction") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mouse_x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mouse_y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"integer_x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"integer_y") ptr0

instance Marshal.WriteRaw SDL_MouseWheelEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_MouseWheelEvent
            type'2
            reserved3
            timestamp4
            windowID5
            which6
            x7
            y8
            direction9
            mouse_x10
            mouse_y11
            integer_x12
            integer_y13 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which6
                >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x7
                >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y8
                >> HasCField.writeRaw (BG.Proxy @"direction") ptr0 direction9
                >> HasCField.writeRaw (BG.Proxy @"mouse_x") ptr0 mouse_x10
                >> HasCField.writeRaw (BG.Proxy @"mouse_y") ptr0 mouse_y11
                >> HasCField.writeRaw (BG.Proxy @"integer_x") ptr0 integer_x12
                >> HasCField.writeRaw (BG.Proxy @"integer_y") ptr0 integer_y13

deriving via Marshal.EquivStorable SDL_MouseWheelEvent instance BG.Storable SDL_MouseWheelEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_MouseWheelEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , direction = BG.getField @"direction" x0
            , mouse_x = BG.getField @"mouse_x" x0
            , mouse_y = BG.getField @"mouse_y" x0
            , integer_x = BG.getField @"integer_x" x0
            , integer_y = BG.getField @"integer_y" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_MouseWheelEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_MouseWheelEvent "type'" where
  type
    CFieldType SDL_MouseWheelEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_MouseWheelEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , direction = BG.getField @"direction" x0
            , mouse_x = BG.getField @"mouse_x" x0
            , mouse_y = BG.getField @"mouse_y" x0
            , integer_x = BG.getField @"integer_x" x0
            , integer_y = BG.getField @"integer_y" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_MouseWheelEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_MouseWheelEvent "reserved" where
  type
    CFieldType SDL_MouseWheelEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_MouseWheelEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , direction = BG.getField @"direction" x0
            , mouse_x = BG.getField @"mouse_x" x0
            , mouse_y = BG.getField @"mouse_y" x0
            , integer_x = BG.getField @"integer_x" x0
            , integer_y = BG.getField @"integer_y" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_MouseWheelEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_MouseWheelEvent "timestamp" where
  type
    CFieldType SDL_MouseWheelEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_MouseWheelEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , direction = BG.getField @"direction" x0
            , mouse_x = BG.getField @"mouse_x" x0
            , mouse_y = BG.getField @"mouse_y" x0
            , integer_x = BG.getField @"integer_x" x0
            , integer_y = BG.getField @"integer_y" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_MouseWheelEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_MouseWheelEvent "windowID" where
  type
    CFieldType SDL_MouseWheelEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Mouse.SDL_MouseID)
  => BG.CompatHasField.HasField "which" SDL_MouseWheelEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , direction = BG.getField @"direction" x0
            , mouse_x = BG.getField @"mouse_x" x0
            , mouse_y = BG.getField @"mouse_y" x0
            , integer_x = BG.getField @"integer_x" x0
            , integer_y = BG.getField @"integer_y" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Mouse.SDL_MouseID)
  => BG.HasField "which" (BG.Ptr SDL_MouseWheelEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_MouseWheelEvent "which" where
  type
    CFieldType SDL_MouseWheelEvent "which" =
      SDL3.Sys.Bindgen.Mouse.SDL_MouseID

  offset# = \_ -> \_ -> 20

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "x" SDL_MouseWheelEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelEvent
            { x = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , y = BG.getField @"y" x0
            , direction = BG.getField @"direction" x0
            , mouse_x = BG.getField @"mouse_x" x0
            , mouse_y = BG.getField @"mouse_y" x0
            , integer_x = BG.getField @"integer_x" x0
            , integer_y = BG.getField @"integer_y" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_MouseWheelEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_MouseWheelEvent "x" where
  type CFieldType SDL_MouseWheelEvent "x" = BG.CFloat

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "y" SDL_MouseWheelEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelEvent
            { y = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , direction = BG.getField @"direction" x0
            , mouse_x = BG.getField @"mouse_x" x0
            , mouse_y = BG.getField @"mouse_y" x0
            , integer_x = BG.getField @"integer_x" x0
            , integer_y = BG.getField @"integer_y" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_MouseWheelEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_MouseWheelEvent "y" where
  type CFieldType SDL_MouseWheelEvent "y" = BG.CFloat

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Mouse.SDL_MouseWheelDirection)
  => BG.CompatHasField.HasField "direction" SDL_MouseWheelEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelEvent
            { direction = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , mouse_x = BG.getField @"mouse_x" x0
            , mouse_y = BG.getField @"mouse_y" x0
            , integer_x = BG.getField @"integer_x" x0
            , integer_y = BG.getField @"integer_y" x0
            }
      , BG.getField @"direction" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Mouse.SDL_MouseWheelDirection)
  => BG.HasField "direction" (BG.Ptr SDL_MouseWheelEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"direction")

instance HasCField.HasCField SDL_MouseWheelEvent "direction" where
  type
    CFieldType SDL_MouseWheelEvent "direction" =
      SDL3.Sys.Bindgen.Mouse.SDL_MouseWheelDirection

  offset# = \_ -> \_ -> 32

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "mouse_x" SDL_MouseWheelEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelEvent
            { mouse_x = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , direction = BG.getField @"direction" x0
            , mouse_y = BG.getField @"mouse_y" x0
            , integer_x = BG.getField @"integer_x" x0
            , integer_y = BG.getField @"integer_y" x0
            }
      , BG.getField @"mouse_x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "mouse_x" (BG.Ptr SDL_MouseWheelEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mouse_x")

instance HasCField.HasCField SDL_MouseWheelEvent "mouse_x" where
  type
    CFieldType SDL_MouseWheelEvent "mouse_x" =
      BG.CFloat

  offset# = \_ -> \_ -> 36

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "mouse_y" SDL_MouseWheelEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelEvent
            { mouse_y = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , direction = BG.getField @"direction" x0
            , mouse_x = BG.getField @"mouse_x" x0
            , integer_x = BG.getField @"integer_x" x0
            , integer_y = BG.getField @"integer_y" x0
            }
      , BG.getField @"mouse_y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "mouse_y" (BG.Ptr SDL_MouseWheelEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mouse_y")

instance HasCField.HasCField SDL_MouseWheelEvent "mouse_y" where
  type
    CFieldType SDL_MouseWheelEvent "mouse_y" =
      BG.CFloat

  offset# = \_ -> \_ -> 40

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "integer_x" SDL_MouseWheelEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelEvent
            { integer_x = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , direction = BG.getField @"direction" x0
            , mouse_x = BG.getField @"mouse_x" x0
            , mouse_y = BG.getField @"mouse_y" x0
            , integer_y = BG.getField @"integer_y" x0
            }
      , BG.getField @"integer_x" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "integer_x" (BG.Ptr SDL_MouseWheelEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"integer_x")

instance HasCField.HasCField SDL_MouseWheelEvent "integer_x" where
  type
    CFieldType SDL_MouseWheelEvent "integer_x" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 44

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "integer_y" SDL_MouseWheelEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelEvent
            { integer_y = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , direction = BG.getField @"direction" x0
            , mouse_x = BG.getField @"mouse_x" x0
            , mouse_y = BG.getField @"mouse_y" x0
            , integer_x = BG.getField @"integer_x" x0
            }
      , BG.getField @"integer_y" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "integer_y" (BG.Ptr SDL_MouseWheelEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"integer_y")

instance HasCField.HasCField SDL_MouseWheelEvent "integer_y" where
  type
    CFieldType SDL_MouseWheelEvent "integer_y" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 48

-- | Joystick axis motion event structure (event.jaxis.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_JoyAxisEvent@, defined at @SDL3\/SDL_events.h 513:16@
data SDL_JoyAxisEvent = SDL_JoyAxisEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_JOYSTICK_AXIS_MOTION
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 515:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 516:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 517:12@
  , which :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^ The joystick instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 518:20@
  , axis :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ The joystick axis index
  --
  --          [C declaration]: @axis@, defined at @SDL3\/SDL_events.h 519:11@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_events.h 520:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_events.h 521:11@
  , padding3 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding3@, defined at @SDL3\/SDL_events.h 522:11@
  , value :: SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^ The axis value (range: -32768 to 32767)
  --
  --          [C declaration]: @value@, defined at @SDL3\/SDL_events.h 523:12@
  , padding4 :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ [C declaration]: @padding4@, defined at @SDL3\/SDL_events.h 524:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_JoyAxisEvent where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_JoyAxisEvent where
  readRaw =
    \ptr0 ->
      pure SDL_JoyAxisEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"axis") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding3") ptr0
        <*> HasCField.readRaw (BG.Proxy @"value") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding4") ptr0

instance Marshal.WriteRaw SDL_JoyAxisEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_JoyAxisEvent
            type'2
            reserved3
            timestamp4
            which5
            axis6
            padding17
            padding28
            padding39
            value10
            padding411 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5
                >> HasCField.writeRaw (BG.Proxy @"axis") ptr0 axis6
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding17
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding28
                >> HasCField.writeRaw (BG.Proxy @"padding3") ptr0 padding39
                >> HasCField.writeRaw (BG.Proxy @"value") ptr0 value10
                >> HasCField.writeRaw (BG.Proxy @"padding4") ptr0 padding411

deriving via Marshal.EquivStorable SDL_JoyAxisEvent instance BG.Storable SDL_JoyAxisEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_JoyAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyAxisEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_JoyAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_JoyAxisEvent "type'" where
  type
    CFieldType SDL_JoyAxisEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_JoyAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyAxisEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_JoyAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_JoyAxisEvent "reserved" where
  type
    CFieldType SDL_JoyAxisEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_JoyAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyAxisEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_JoyAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_JoyAxisEvent "timestamp" where
  type
    CFieldType SDL_JoyAxisEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.CompatHasField.HasField "which" SDL_JoyAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyAxisEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.HasField "which" (BG.Ptr SDL_JoyAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_JoyAxisEvent "which" where
  type
    CFieldType SDL_JoyAxisEvent "which" =
      SDL3.Sys.Bindgen.Joystick.SDL_JoystickID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "axis" SDL_JoyAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyAxisEvent
            { axis = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"axis" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "axis" (BG.Ptr SDL_JoyAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"axis")

instance HasCField.HasCField SDL_JoyAxisEvent "axis" where
  type
    CFieldType SDL_JoyAxisEvent "axis" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_JoyAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyAxisEvent
            { padding1 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_JoyAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_JoyAxisEvent "padding1" where
  type
    CFieldType SDL_JoyAxisEvent "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 21

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_JoyAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyAxisEvent
            { padding2 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_JoyAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_JoyAxisEvent "padding2" where
  type
    CFieldType SDL_JoyAxisEvent "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 22

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding3" SDL_JoyAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyAxisEvent
            { padding3 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"padding3" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding3" (BG.Ptr SDL_JoyAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding3")

instance HasCField.HasCField SDL_JoyAxisEvent "padding3" where
  type
    CFieldType SDL_JoyAxisEvent "padding3" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 23

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.CompatHasField.HasField "value" SDL_JoyAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyAxisEvent
            { value = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"value" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.HasField "value" (BG.Ptr SDL_JoyAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"value")

instance HasCField.HasCField SDL_JoyAxisEvent "value" where
  type
    CFieldType SDL_JoyAxisEvent "value" =
      SDL3.Sys.Bindgen.Stdinc.Sint16

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "padding4" SDL_JoyAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyAxisEvent
            { padding4 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            }
      , BG.getField @"padding4" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "padding4" (BG.Ptr SDL_JoyAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding4")

instance HasCField.HasCField SDL_JoyAxisEvent "padding4" where
  type
    CFieldType SDL_JoyAxisEvent "padding4" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 26

-- | Joystick trackball motion event structure (event.jball.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_JoyBallEvent@, defined at @SDL3\/SDL_events.h 532:16@
data SDL_JoyBallEvent = SDL_JoyBallEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_JOYSTICK_BALL_MOTION
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 534:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 535:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 536:12@
  , which :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^ The joystick instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 537:20@
  , ball :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ The joystick trackball index
  --
  --          [C declaration]: @ball@, defined at @SDL3\/SDL_events.h 538:11@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_events.h 539:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_events.h 540:11@
  , padding3 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding3@, defined at @SDL3\/SDL_events.h 541:11@
  , xrel :: SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^ The relative motion in the X direction
  --
  --          [C declaration]: @xrel@, defined at @SDL3\/SDL_events.h 542:12@
  , yrel :: SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^ The relative motion in the Y direction
  --
  --          [C declaration]: @yrel@, defined at @SDL3\/SDL_events.h 543:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_JoyBallEvent where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_JoyBallEvent where
  readRaw =
    \ptr0 ->
      pure SDL_JoyBallEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"ball") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding3") ptr0
        <*> HasCField.readRaw (BG.Proxy @"xrel") ptr0
        <*> HasCField.readRaw (BG.Proxy @"yrel") ptr0

instance Marshal.WriteRaw SDL_JoyBallEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_JoyBallEvent
            type'2
            reserved3
            timestamp4
            which5
            ball6
            padding17
            padding28
            padding39
            xrel10
            yrel11 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5
                >> HasCField.writeRaw (BG.Proxy @"ball") ptr0 ball6
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding17
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding28
                >> HasCField.writeRaw (BG.Proxy @"padding3") ptr0 padding39
                >> HasCField.writeRaw (BG.Proxy @"xrel") ptr0 xrel10
                >> HasCField.writeRaw (BG.Proxy @"yrel") ptr0 yrel11

deriving via Marshal.EquivStorable SDL_JoyBallEvent instance BG.Storable SDL_JoyBallEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_JoyBallEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBallEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , ball = BG.getField @"ball" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_JoyBallEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_JoyBallEvent "type'" where
  type
    CFieldType SDL_JoyBallEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_JoyBallEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBallEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , ball = BG.getField @"ball" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_JoyBallEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_JoyBallEvent "reserved" where
  type
    CFieldType SDL_JoyBallEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_JoyBallEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBallEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            , ball = BG.getField @"ball" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_JoyBallEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_JoyBallEvent "timestamp" where
  type
    CFieldType SDL_JoyBallEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.CompatHasField.HasField "which" SDL_JoyBallEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBallEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , ball = BG.getField @"ball" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.HasField "which" (BG.Ptr SDL_JoyBallEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_JoyBallEvent "which" where
  type
    CFieldType SDL_JoyBallEvent "which" =
      SDL3.Sys.Bindgen.Joystick.SDL_JoystickID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "ball" SDL_JoyBallEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBallEvent
            { ball = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"ball" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "ball" (BG.Ptr SDL_JoyBallEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"ball")

instance HasCField.HasCField SDL_JoyBallEvent "ball" where
  type
    CFieldType SDL_JoyBallEvent "ball" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_JoyBallEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBallEvent
            { padding1 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , ball = BG.getField @"ball" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_JoyBallEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_JoyBallEvent "padding1" where
  type
    CFieldType SDL_JoyBallEvent "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 21

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_JoyBallEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBallEvent
            { padding2 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , ball = BG.getField @"ball" x0
            , padding1 = BG.getField @"padding1" x0
            , padding3 = BG.getField @"padding3" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_JoyBallEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_JoyBallEvent "padding2" where
  type
    CFieldType SDL_JoyBallEvent "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 22

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding3" SDL_JoyBallEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBallEvent
            { padding3 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , ball = BG.getField @"ball" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , xrel = BG.getField @"xrel" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"padding3" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding3" (BG.Ptr SDL_JoyBallEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding3")

instance HasCField.HasCField SDL_JoyBallEvent "padding3" where
  type
    CFieldType SDL_JoyBallEvent "padding3" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 23

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.CompatHasField.HasField "xrel" SDL_JoyBallEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBallEvent
            { xrel = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , ball = BG.getField @"ball" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , yrel = BG.getField @"yrel" x0
            }
      , BG.getField @"xrel" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.HasField "xrel" (BG.Ptr SDL_JoyBallEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"xrel")

instance HasCField.HasCField SDL_JoyBallEvent "xrel" where
  type
    CFieldType SDL_JoyBallEvent "xrel" =
      SDL3.Sys.Bindgen.Stdinc.Sint16

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.CompatHasField.HasField "yrel" SDL_JoyBallEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBallEvent
            { yrel = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , ball = BG.getField @"ball" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , xrel = BG.getField @"xrel" x0
            }
      , BG.getField @"yrel" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.HasField "yrel" (BG.Ptr SDL_JoyBallEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"yrel")

instance HasCField.HasCField SDL_JoyBallEvent "yrel" where
  type
    CFieldType SDL_JoyBallEvent "yrel" =
      SDL3.Sys.Bindgen.Stdinc.Sint16

  offset# = \_ -> \_ -> 26

-- | Joystick hat position change event structure (event.jhat.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_JoyHatEvent@, defined at @SDL3\/SDL_events.h 551:16@
data SDL_JoyHatEvent = SDL_JoyHatEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_JOYSTICK_HAT_MOTION
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 553:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 554:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 555:12@
  , which :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^ The joystick instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 556:20@
  , hat :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ The joystick hat index
  --
  --          [C declaration]: @hat@, defined at @SDL3\/SDL_events.h 557:11@
  , value :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ The hat position value. Note that zero means the POV is centered.
  --
  --          [See also]: SDL_HAT_LEFTUP SDL_HAT_UP SDL_HAT_RIGHTUP, SDL_HAT_LEFT SDL_HAT_CENTERED SDL_HAT_RIGHT, SDL_HAT_LEFTDOWN SDL_HAT_DOWN SDL_HAT_RIGHTDOWN
  --
  --          [C declaration]: @value@, defined at @SDL3\/SDL_events.h 558:11@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_events.h 565:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_events.h 566:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_JoyHatEvent where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_JoyHatEvent where
  readRaw =
    \ptr0 ->
      pure SDL_JoyHatEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"hat") ptr0
        <*> HasCField.readRaw (BG.Proxy @"value") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0

instance Marshal.WriteRaw SDL_JoyHatEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_JoyHatEvent
            type'2
            reserved3
            timestamp4
            which5
            hat6
            value7
            padding18
            padding29 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5
                >> HasCField.writeRaw (BG.Proxy @"hat") ptr0 hat6
                >> HasCField.writeRaw (BG.Proxy @"value") ptr0 value7
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding18
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding29

deriving via Marshal.EquivStorable SDL_JoyHatEvent instance BG.Storable SDL_JoyHatEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_JoyHatEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyHatEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , hat = BG.getField @"hat" x0
            , value = BG.getField @"value" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_JoyHatEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_JoyHatEvent "type'" where
  type
    CFieldType SDL_JoyHatEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_JoyHatEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyHatEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , hat = BG.getField @"hat" x0
            , value = BG.getField @"value" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_JoyHatEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_JoyHatEvent "reserved" where
  type
    CFieldType SDL_JoyHatEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_JoyHatEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyHatEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            , hat = BG.getField @"hat" x0
            , value = BG.getField @"value" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_JoyHatEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_JoyHatEvent "timestamp" where
  type
    CFieldType SDL_JoyHatEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.CompatHasField.HasField "which" SDL_JoyHatEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyHatEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , hat = BG.getField @"hat" x0
            , value = BG.getField @"value" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.HasField "which" (BG.Ptr SDL_JoyHatEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_JoyHatEvent "which" where
  type
    CFieldType SDL_JoyHatEvent "which" =
      SDL3.Sys.Bindgen.Joystick.SDL_JoystickID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "hat" SDL_JoyHatEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyHatEvent
            { hat = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , value = BG.getField @"value" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"hat" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "hat" (BG.Ptr SDL_JoyHatEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"hat")

instance HasCField.HasCField SDL_JoyHatEvent "hat" where
  type
    CFieldType SDL_JoyHatEvent "hat" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "value" SDL_JoyHatEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyHatEvent
            { value = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , hat = BG.getField @"hat" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"value" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "value" (BG.Ptr SDL_JoyHatEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"value")

instance HasCField.HasCField SDL_JoyHatEvent "value" where
  type
    CFieldType SDL_JoyHatEvent "value" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 21

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_JoyHatEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyHatEvent
            { padding1 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , hat = BG.getField @"hat" x0
            , value = BG.getField @"value" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_JoyHatEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_JoyHatEvent "padding1" where
  type
    CFieldType SDL_JoyHatEvent "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 22

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_JoyHatEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyHatEvent
            { padding2 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , hat = BG.getField @"hat" x0
            , value = BG.getField @"value" x0
            , padding1 = BG.getField @"padding1" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_JoyHatEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_JoyHatEvent "padding2" where
  type
    CFieldType SDL_JoyHatEvent "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 23

-- | Joystick button event structure (event.jbutton.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_JoyButtonEvent@, defined at @SDL3\/SDL_events.h 574:16@
data SDL_JoyButtonEvent = SDL_JoyButtonEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_JOYSTICK_BUTTON_DOWN or SDL_EVENT_JOYSTICK_BUTTON_UP
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 576:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 577:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 578:12@
  , which :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^ The joystick instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 579:20@
  , button :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ The joystick button index
  --
  --          [C declaration]: @button@, defined at @SDL3\/SDL_events.h 580:11@
  , down :: BG.CBool
  -- ^ true if the button is pressed
  --
  --          [C declaration]: @down@, defined at @SDL3\/SDL_events.h 581:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_events.h 582:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_events.h 583:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_JoyButtonEvent where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_JoyButtonEvent where
  readRaw =
    \ptr0 ->
      pure SDL_JoyButtonEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"button") ptr0
        <*> HasCField.readRaw (BG.Proxy @"down") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0

instance Marshal.WriteRaw SDL_JoyButtonEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_JoyButtonEvent
            type'2
            reserved3
            timestamp4
            which5
            button6
            down7
            padding18
            padding29 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5
                >> HasCField.writeRaw (BG.Proxy @"button") ptr0 button6
                >> HasCField.writeRaw (BG.Proxy @"down") ptr0 down7
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding18
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding29

deriving via Marshal.EquivStorable SDL_JoyButtonEvent instance BG.Storable SDL_JoyButtonEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_JoyButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyButtonEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_JoyButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_JoyButtonEvent "type'" where
  type
    CFieldType SDL_JoyButtonEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_JoyButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyButtonEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_JoyButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_JoyButtonEvent "reserved" where
  type
    CFieldType SDL_JoyButtonEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_JoyButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyButtonEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_JoyButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_JoyButtonEvent "timestamp" where
  type
    CFieldType SDL_JoyButtonEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.CompatHasField.HasField "which" SDL_JoyButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyButtonEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.HasField "which" (BG.Ptr SDL_JoyButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_JoyButtonEvent "which" where
  type
    CFieldType SDL_JoyButtonEvent "which" =
      SDL3.Sys.Bindgen.Joystick.SDL_JoystickID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "button" SDL_JoyButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyButtonEvent
            { button = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , down = BG.getField @"down" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"button" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "button" (BG.Ptr SDL_JoyButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"button")

instance HasCField.HasCField SDL_JoyButtonEvent "button" where
  type
    CFieldType SDL_JoyButtonEvent "button" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 20

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "down" SDL_JoyButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyButtonEvent
            { down = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"down" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "down" (BG.Ptr SDL_JoyButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"down")

instance HasCField.HasCField SDL_JoyButtonEvent "down" where
  type CFieldType SDL_JoyButtonEvent "down" = BG.CBool

  offset# = \_ -> \_ -> 21

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_JoyButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyButtonEvent
            { padding1 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_JoyButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_JoyButtonEvent "padding1" where
  type
    CFieldType SDL_JoyButtonEvent "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 22

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_JoyButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyButtonEvent
            { padding2 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding1 = BG.getField @"padding1" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_JoyButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_JoyButtonEvent "padding2" where
  type
    CFieldType SDL_JoyButtonEvent "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 23

-- | Joystick device event structure (event.jdevice.*)
--
--     SDL will send JOYSTICK_ADDED events for devices that are already plugged in during SDL_Init.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_GamepadDeviceEvent'
--
--     [C declaration]: @struct SDL_JoyDeviceEvent@, defined at @SDL3\/SDL_events.h 596:16@
data SDL_JoyDeviceEvent = SDL_JoyDeviceEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_JOYSTICK_ADDED or SDL_EVENT_JOYSTICK_REMOVED or SDL_EVENT_JOYSTICK_UPDATE_COMPLETE
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 598:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 599:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 600:12@
  , which :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^ The joystick instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 601:20@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_JoyDeviceEvent where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_JoyDeviceEvent where
  readRaw =
    \ptr0 ->
      pure SDL_JoyDeviceEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0

instance Marshal.WriteRaw SDL_JoyDeviceEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_JoyDeviceEvent type'2 reserved3 timestamp4 which5 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5

deriving via Marshal.EquivStorable SDL_JoyDeviceEvent instance BG.Storable SDL_JoyDeviceEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_JoyDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyDeviceEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_JoyDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_JoyDeviceEvent "type'" where
  type
    CFieldType SDL_JoyDeviceEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_JoyDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyDeviceEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_JoyDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_JoyDeviceEvent "reserved" where
  type
    CFieldType SDL_JoyDeviceEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_JoyDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyDeviceEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_JoyDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_JoyDeviceEvent "timestamp" where
  type
    CFieldType SDL_JoyDeviceEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.CompatHasField.HasField "which" SDL_JoyDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyDeviceEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.HasField "which" (BG.Ptr SDL_JoyDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_JoyDeviceEvent "which" where
  type
    CFieldType SDL_JoyDeviceEvent "which" =
      SDL3.Sys.Bindgen.Joystick.SDL_JoystickID

  offset# = \_ -> \_ -> 16

-- | Joystick battery level change event structure (event.jbattery.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_JoyBatteryEvent@, defined at @SDL3\/SDL_events.h 609:16@
data SDL_JoyBatteryEvent = SDL_JoyBatteryEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_JOYSTICK_BATTERY_UPDATED
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 611:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 612:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 613:12@
  , which :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^ The joystick instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 614:20@
  , state :: SDL3.Sys.Bindgen.Power.SDL_PowerState
  -- ^ The joystick battery state
  --
  --          [C declaration]: @state@, defined at @SDL3\/SDL_events.h 615:20@
  , percent :: BG.CInt
  -- ^ The joystick battery percent charge remaining
  --
  --          [C declaration]: @percent@, defined at @SDL3\/SDL_events.h 616:9@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_JoyBatteryEvent where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_JoyBatteryEvent where
  readRaw =
    \ptr0 ->
      pure SDL_JoyBatteryEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"state") ptr0
        <*> HasCField.readRaw (BG.Proxy @"percent") ptr0

instance Marshal.WriteRaw SDL_JoyBatteryEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_JoyBatteryEvent type'2 reserved3 timestamp4 which5 state6 percent7 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5
              >> HasCField.writeRaw (BG.Proxy @"state") ptr0 state6
              >> HasCField.writeRaw (BG.Proxy @"percent") ptr0 percent7

deriving via Marshal.EquivStorable SDL_JoyBatteryEvent instance BG.Storable SDL_JoyBatteryEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_JoyBatteryEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBatteryEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , state = BG.getField @"state" x0
            , percent = BG.getField @"percent" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_JoyBatteryEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_JoyBatteryEvent "type'" where
  type
    CFieldType SDL_JoyBatteryEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_JoyBatteryEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBatteryEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , state = BG.getField @"state" x0
            , percent = BG.getField @"percent" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_JoyBatteryEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_JoyBatteryEvent "reserved" where
  type
    CFieldType SDL_JoyBatteryEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_JoyBatteryEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBatteryEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            , state = BG.getField @"state" x0
            , percent = BG.getField @"percent" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_JoyBatteryEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_JoyBatteryEvent "timestamp" where
  type
    CFieldType SDL_JoyBatteryEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.CompatHasField.HasField "which" SDL_JoyBatteryEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBatteryEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , state = BG.getField @"state" x0
            , percent = BG.getField @"percent" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.HasField "which" (BG.Ptr SDL_JoyBatteryEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_JoyBatteryEvent "which" where
  type
    CFieldType SDL_JoyBatteryEvent "which" =
      SDL3.Sys.Bindgen.Joystick.SDL_JoystickID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Power.SDL_PowerState)
  => BG.CompatHasField.HasField "state" SDL_JoyBatteryEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBatteryEvent
            { state = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , percent = BG.getField @"percent" x0
            }
      , BG.getField @"state" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Power.SDL_PowerState)
  => BG.HasField "state" (BG.Ptr SDL_JoyBatteryEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"state")

instance HasCField.HasCField SDL_JoyBatteryEvent "state" where
  type
    CFieldType SDL_JoyBatteryEvent "state" =
      SDL3.Sys.Bindgen.Power.SDL_PowerState

  offset# = \_ -> \_ -> 20

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "percent" SDL_JoyBatteryEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_JoyBatteryEvent
            { percent = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , state = BG.getField @"state" x0
            }
      , BG.getField @"percent" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "percent" (BG.Ptr SDL_JoyBatteryEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"percent")

instance HasCField.HasCField SDL_JoyBatteryEvent "percent" where
  type
    CFieldType SDL_JoyBatteryEvent "percent" =
      BG.CInt

  offset# = \_ -> \_ -> 24

-- | Gamepad axis motion event structure (event.gaxis.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_GamepadAxisEvent@, defined at @SDL3\/SDL_events.h 624:16@
data SDL_GamepadAxisEvent = SDL_GamepadAxisEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_GAMEPAD_AXIS_MOTION
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 626:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 627:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 628:12@
  , which :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^ The joystick instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 629:20@
  , axis :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ The gamepad axis (SDL_GamepadAxis)
  --
  --          [C declaration]: @axis@, defined at @SDL3\/SDL_events.h 630:11@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_events.h 631:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_events.h 632:11@
  , padding3 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding3@, defined at @SDL3\/SDL_events.h 633:11@
  , value :: SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^ The axis value (range: -32768 to 32767)
  --
  --          [C declaration]: @value@, defined at @SDL3\/SDL_events.h 634:12@
  , padding4 :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ [C declaration]: @padding4@, defined at @SDL3\/SDL_events.h 635:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GamepadAxisEvent where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GamepadAxisEvent where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadAxisEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"axis") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding3") ptr0
        <*> HasCField.readRaw (BG.Proxy @"value") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding4") ptr0

instance Marshal.WriteRaw SDL_GamepadAxisEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadAxisEvent
            type'2
            reserved3
            timestamp4
            which5
            axis6
            padding17
            padding28
            padding39
            value10
            padding411 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5
                >> HasCField.writeRaw (BG.Proxy @"axis") ptr0 axis6
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding17
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding28
                >> HasCField.writeRaw (BG.Proxy @"padding3") ptr0 padding39
                >> HasCField.writeRaw (BG.Proxy @"value") ptr0 value10
                >> HasCField.writeRaw (BG.Proxy @"padding4") ptr0 padding411

deriving via Marshal.EquivStorable SDL_GamepadAxisEvent instance BG.Storable SDL_GamepadAxisEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_GamepadAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadAxisEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_GamepadAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_GamepadAxisEvent "type'" where
  type
    CFieldType SDL_GamepadAxisEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_GamepadAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadAxisEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_GamepadAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_GamepadAxisEvent "reserved" where
  type
    CFieldType SDL_GamepadAxisEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_GamepadAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadAxisEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_GamepadAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_GamepadAxisEvent "timestamp" where
  type
    CFieldType SDL_GamepadAxisEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.CompatHasField.HasField "which" SDL_GamepadAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadAxisEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.HasField "which" (BG.Ptr SDL_GamepadAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_GamepadAxisEvent "which" where
  type
    CFieldType SDL_GamepadAxisEvent "which" =
      SDL3.Sys.Bindgen.Joystick.SDL_JoystickID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "axis" SDL_GamepadAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadAxisEvent
            { axis = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"axis" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "axis" (BG.Ptr SDL_GamepadAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"axis")

instance HasCField.HasCField SDL_GamepadAxisEvent "axis" where
  type
    CFieldType SDL_GamepadAxisEvent "axis" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_GamepadAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadAxisEvent
            { padding1 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_GamepadAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_GamepadAxisEvent "padding1" where
  type
    CFieldType SDL_GamepadAxisEvent "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 21

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_GamepadAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadAxisEvent
            { padding2 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_GamepadAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_GamepadAxisEvent "padding2" where
  type
    CFieldType SDL_GamepadAxisEvent "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 22

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding3" SDL_GamepadAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadAxisEvent
            { padding3 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , value = BG.getField @"value" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"padding3" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding3" (BG.Ptr SDL_GamepadAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding3")

instance HasCField.HasCField SDL_GamepadAxisEvent "padding3" where
  type
    CFieldType SDL_GamepadAxisEvent "padding3" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 23

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.CompatHasField.HasField "value" SDL_GamepadAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadAxisEvent
            { value = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , padding4 = BG.getField @"padding4" x0
            }
      , BG.getField @"value" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.HasField "value" (BG.Ptr SDL_GamepadAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"value")

instance HasCField.HasCField SDL_GamepadAxisEvent "value" where
  type
    CFieldType SDL_GamepadAxisEvent "value" =
      SDL3.Sys.Bindgen.Stdinc.Sint16

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "padding4" SDL_GamepadAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadAxisEvent
            { padding4 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , axis = BG.getField @"axis" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            , value = BG.getField @"value" x0
            }
      , BG.getField @"padding4" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "padding4" (BG.Ptr SDL_GamepadAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding4")

instance HasCField.HasCField SDL_GamepadAxisEvent "padding4" where
  type
    CFieldType SDL_GamepadAxisEvent "padding4" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 26

-- | Gamepad button event structure (event.gbutton.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_GamepadButtonEvent@, defined at @SDL3\/SDL_events.h 644:16@
data SDL_GamepadButtonEvent = SDL_GamepadButtonEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_GAMEPAD_BUTTON_DOWN or SDL_EVENT_GAMEPAD_BUTTON_UP
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 646:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 647:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 648:12@
  , which :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^ The joystick instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 649:20@
  , button :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ The gamepad button (SDL_GamepadButton)
  --
  --          [C declaration]: @button@, defined at @SDL3\/SDL_events.h 650:11@
  , down :: BG.CBool
  -- ^ true if the button is pressed
  --
  --          [C declaration]: @down@, defined at @SDL3\/SDL_events.h 651:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_events.h 652:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_events.h 653:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GamepadButtonEvent where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GamepadButtonEvent where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadButtonEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"button") ptr0
        <*> HasCField.readRaw (BG.Proxy @"down") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0

instance Marshal.WriteRaw SDL_GamepadButtonEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadButtonEvent
            type'2
            reserved3
            timestamp4
            which5
            button6
            down7
            padding18
            padding29 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5
                >> HasCField.writeRaw (BG.Proxy @"button") ptr0 button6
                >> HasCField.writeRaw (BG.Proxy @"down") ptr0 down7
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding18
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding29

deriving via
  Marshal.EquivStorable SDL_GamepadButtonEvent
  instance
    BG.Storable SDL_GamepadButtonEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_GamepadButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadButtonEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_GamepadButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_GamepadButtonEvent "type'" where
  type
    CFieldType SDL_GamepadButtonEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_GamepadButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadButtonEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_GamepadButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_GamepadButtonEvent "reserved" where
  type
    CFieldType SDL_GamepadButtonEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_GamepadButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadButtonEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_GamepadButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_GamepadButtonEvent "timestamp" where
  type
    CFieldType SDL_GamepadButtonEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.CompatHasField.HasField "which" SDL_GamepadButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadButtonEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.HasField "which" (BG.Ptr SDL_GamepadButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_GamepadButtonEvent "which" where
  type
    CFieldType SDL_GamepadButtonEvent "which" =
      SDL3.Sys.Bindgen.Joystick.SDL_JoystickID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "button" SDL_GamepadButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadButtonEvent
            { button = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , down = BG.getField @"down" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"button" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "button" (BG.Ptr SDL_GamepadButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"button")

instance HasCField.HasCField SDL_GamepadButtonEvent "button" where
  type
    CFieldType SDL_GamepadButtonEvent "button" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 20

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "down" SDL_GamepadButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadButtonEvent
            { down = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"down" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "down" (BG.Ptr SDL_GamepadButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"down")

instance HasCField.HasCField SDL_GamepadButtonEvent "down" where
  type
    CFieldType SDL_GamepadButtonEvent "down" =
      BG.CBool

  offset# = \_ -> \_ -> 21

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_GamepadButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadButtonEvent
            { padding1 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_GamepadButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_GamepadButtonEvent "padding1" where
  type
    CFieldType SDL_GamepadButtonEvent "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 22

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_GamepadButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadButtonEvent
            { padding2 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            , padding1 = BG.getField @"padding1" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_GamepadButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_GamepadButtonEvent "padding2" where
  type
    CFieldType SDL_GamepadButtonEvent "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 23

-- | Gamepad device event structure (event.gdevice.*)
--
--     Joysticks that are supported gamepads receive both an 'SDL_JoyDeviceEvent' and an 'SDL_GamepadDeviceEvent'.
--
--     SDL will send GAMEPAD_ADDED events for joysticks that are already plugged in during SDL_Init() and are recognized as gamepads. It will also send events for joysticks that get gamepad mappings at runtime.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_JoyDeviceEvent'
--
--     [C declaration]: @struct SDL_GamepadDeviceEvent@, defined at @SDL3\/SDL_events.h 671:16@
data SDL_GamepadDeviceEvent = SDL_GamepadDeviceEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_GAMEPAD_ADDED, SDL_EVENT_GAMEPAD_REMOVED, or SDL_EVENT_GAMEPAD_REMAPPED, SDL_EVENT_GAMEPAD_UPDATE_COMPLETE or SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 673:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 674:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 675:12@
  , which :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^ The joystick instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 676:20@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GamepadDeviceEvent where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GamepadDeviceEvent where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadDeviceEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0

instance Marshal.WriteRaw SDL_GamepadDeviceEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadDeviceEvent type'2 reserved3 timestamp4 which5 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5

deriving via
  Marshal.EquivStorable SDL_GamepadDeviceEvent
  instance
    BG.Storable SDL_GamepadDeviceEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_GamepadDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadDeviceEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_GamepadDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_GamepadDeviceEvent "type'" where
  type
    CFieldType SDL_GamepadDeviceEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_GamepadDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadDeviceEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_GamepadDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_GamepadDeviceEvent "reserved" where
  type
    CFieldType SDL_GamepadDeviceEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_GamepadDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadDeviceEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_GamepadDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_GamepadDeviceEvent "timestamp" where
  type
    CFieldType SDL_GamepadDeviceEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.CompatHasField.HasField "which" SDL_GamepadDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadDeviceEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.HasField "which" (BG.Ptr SDL_GamepadDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_GamepadDeviceEvent "which" where
  type
    CFieldType SDL_GamepadDeviceEvent "which" =
      SDL3.Sys.Bindgen.Joystick.SDL_JoystickID

  offset# = \_ -> \_ -> 16

-- | Gamepad touchpad event structure (event.gtouchpad.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_GamepadTouchpadEvent@, defined at @SDL3\/SDL_events.h 684:16@
data SDL_GamepadTouchpadEvent = SDL_GamepadTouchpadEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN or SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION or SDL_EVENT_GAMEPAD_TOUCHPAD_UP
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 686:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 687:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 688:12@
  , which :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^ The joystick instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 689:20@
  , touchpad :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The index of the touchpad
  --
  --          [C declaration]: @touchpad@, defined at @SDL3\/SDL_events.h 690:12@
  , finger :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The index of the finger on the touchpad
  --
  --          [C declaration]: @finger@, defined at @SDL3\/SDL_events.h 691:12@
  , x :: BG.CFloat
  -- ^ Normalized in the range 0...1 with 0 being on the left
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_events.h 692:11@
  , y :: BG.CFloat
  -- ^ Normalized in the range 0...1 with 0 being at the top
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_events.h 693:11@
  , pressure :: BG.CFloat
  -- ^ Normalized in the range 0...1
  --
  --          [C declaration]: @pressure@, defined at @SDL3\/SDL_events.h 694:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GamepadTouchpadEvent where
  staticSizeOf = \_ -> (40 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GamepadTouchpadEvent where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadTouchpadEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"touchpad") ptr0
        <*> HasCField.readRaw (BG.Proxy @"finger") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pressure") ptr0

instance Marshal.WriteRaw SDL_GamepadTouchpadEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadTouchpadEvent
            type'2
            reserved3
            timestamp4
            which5
            touchpad6
            finger7
            x8
            y9
            pressure10 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5
                >> HasCField.writeRaw (BG.Proxy @"touchpad") ptr0 touchpad6
                >> HasCField.writeRaw (BG.Proxy @"finger") ptr0 finger7
                >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x8
                >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y9
                >> HasCField.writeRaw (BG.Proxy @"pressure") ptr0 pressure10

deriving via
  Marshal.EquivStorable SDL_GamepadTouchpadEvent
  instance
    BG.Storable SDL_GamepadTouchpadEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_GamepadTouchpadEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadTouchpadEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , touchpad = BG.getField @"touchpad" x0
            , finger = BG.getField @"finger" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , pressure = BG.getField @"pressure" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_GamepadTouchpadEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_GamepadTouchpadEvent "type'" where
  type
    CFieldType SDL_GamepadTouchpadEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_GamepadTouchpadEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadTouchpadEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , touchpad = BG.getField @"touchpad" x0
            , finger = BG.getField @"finger" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , pressure = BG.getField @"pressure" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_GamepadTouchpadEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_GamepadTouchpadEvent "reserved" where
  type
    CFieldType SDL_GamepadTouchpadEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_GamepadTouchpadEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadTouchpadEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            , touchpad = BG.getField @"touchpad" x0
            , finger = BG.getField @"finger" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , pressure = BG.getField @"pressure" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_GamepadTouchpadEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_GamepadTouchpadEvent "timestamp" where
  type
    CFieldType SDL_GamepadTouchpadEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.CompatHasField.HasField "which" SDL_GamepadTouchpadEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadTouchpadEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , touchpad = BG.getField @"touchpad" x0
            , finger = BG.getField @"finger" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , pressure = BG.getField @"pressure" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.HasField "which" (BG.Ptr SDL_GamepadTouchpadEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_GamepadTouchpadEvent "which" where
  type
    CFieldType SDL_GamepadTouchpadEvent "which" =
      SDL3.Sys.Bindgen.Joystick.SDL_JoystickID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "touchpad" SDL_GamepadTouchpadEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadTouchpadEvent
            { touchpad = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , finger = BG.getField @"finger" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , pressure = BG.getField @"pressure" x0
            }
      , BG.getField @"touchpad" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "touchpad" (BG.Ptr SDL_GamepadTouchpadEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"touchpad")

instance HasCField.HasCField SDL_GamepadTouchpadEvent "touchpad" where
  type
    CFieldType SDL_GamepadTouchpadEvent "touchpad" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "finger" SDL_GamepadTouchpadEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadTouchpadEvent
            { finger = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , touchpad = BG.getField @"touchpad" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , pressure = BG.getField @"pressure" x0
            }
      , BG.getField @"finger" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "finger" (BG.Ptr SDL_GamepadTouchpadEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"finger")

instance HasCField.HasCField SDL_GamepadTouchpadEvent "finger" where
  type
    CFieldType SDL_GamepadTouchpadEvent "finger" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "x" SDL_GamepadTouchpadEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadTouchpadEvent
            { x = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , touchpad = BG.getField @"touchpad" x0
            , finger = BG.getField @"finger" x0
            , y = BG.getField @"y" x0
            , pressure = BG.getField @"pressure" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_GamepadTouchpadEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_GamepadTouchpadEvent "x" where
  type
    CFieldType SDL_GamepadTouchpadEvent "x" =
      BG.CFloat

  offset# = \_ -> \_ -> 28

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "y" SDL_GamepadTouchpadEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadTouchpadEvent
            { y = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , touchpad = BG.getField @"touchpad" x0
            , finger = BG.getField @"finger" x0
            , x = BG.getField @"x" x0
            , pressure = BG.getField @"pressure" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_GamepadTouchpadEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_GamepadTouchpadEvent "y" where
  type
    CFieldType SDL_GamepadTouchpadEvent "y" =
      BG.CFloat

  offset# = \_ -> \_ -> 32

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "pressure" SDL_GamepadTouchpadEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadTouchpadEvent
            { pressure = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , touchpad = BG.getField @"touchpad" x0
            , finger = BG.getField @"finger" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"pressure" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "pressure" (BG.Ptr SDL_GamepadTouchpadEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pressure")

instance HasCField.HasCField SDL_GamepadTouchpadEvent "pressure" where
  type
    CFieldType SDL_GamepadTouchpadEvent "pressure" =
      BG.CFloat

  offset# = \_ -> \_ -> 36

-- | Gamepad sensor event structure (event.gsensor.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_GamepadSensorEvent@, defined at @SDL3\/SDL_events.h 702:16@
data SDL_GamepadSensorEvent = SDL_GamepadSensorEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_GAMEPAD_SENSOR_UPDATE
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 704:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 705:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 706:12@
  , which :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^ The joystick instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 707:20@
  , sensor :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The type of the sensor, one of the values of SDL_SensorType
  --
  --          [C declaration]: @sensor@, defined at @SDL3\/SDL_events.h 708:12@
  , data' :: CA.ConstantArray 3 BG.CFloat
  -- ^ Up to 3 values from the sensor, as defined in SDL_sensor.h
  --
  --          [C declaration]: @data@, defined at @SDL3\/SDL_events.h 709:11@
  , sensor_timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ The timestamp of the sensor reading in nanoseconds, not necessarily synchronized with the system clock
  --
  --          [C declaration]: @sensor_timestamp@, defined at @SDL3\/SDL_events.h 710:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GamepadSensorEvent where
  staticSizeOf = \_ -> (48 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GamepadSensorEvent where
  readRaw =
    \ptr0 ->
      pure SDL_GamepadSensorEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"sensor") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"sensor_timestamp") ptr0

instance Marshal.WriteRaw SDL_GamepadSensorEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GamepadSensorEvent
            type'2
            reserved3
            timestamp4
            which5
            sensor6
            data'7
            sensor_timestamp8 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5
                >> HasCField.writeRaw (BG.Proxy @"sensor") ptr0 sensor6
                >> HasCField.writeRaw (BG.Proxy @"data'") ptr0 data'7
                >> HasCField.writeRaw (BG.Proxy @"sensor_timestamp") ptr0 sensor_timestamp8

deriving via
  Marshal.EquivStorable SDL_GamepadSensorEvent
  instance
    BG.Storable SDL_GamepadSensorEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_GamepadSensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadSensorEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , sensor = BG.getField @"sensor" x0
            , data' = BG.getField @"data'" x0
            , sensor_timestamp = BG.getField @"sensor_timestamp" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_GamepadSensorEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_GamepadSensorEvent "type'" where
  type
    CFieldType SDL_GamepadSensorEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_GamepadSensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadSensorEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , sensor = BG.getField @"sensor" x0
            , data' = BG.getField @"data'" x0
            , sensor_timestamp = BG.getField @"sensor_timestamp" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_GamepadSensorEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_GamepadSensorEvent "reserved" where
  type
    CFieldType SDL_GamepadSensorEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_GamepadSensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadSensorEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            , sensor = BG.getField @"sensor" x0
            , data' = BG.getField @"data'" x0
            , sensor_timestamp = BG.getField @"sensor_timestamp" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_GamepadSensorEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_GamepadSensorEvent "timestamp" where
  type
    CFieldType SDL_GamepadSensorEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.CompatHasField.HasField "which" SDL_GamepadSensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadSensorEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , sensor = BG.getField @"sensor" x0
            , data' = BG.getField @"data'" x0
            , sensor_timestamp = BG.getField @"sensor_timestamp" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
  => BG.HasField "which" (BG.Ptr SDL_GamepadSensorEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_GamepadSensorEvent "which" where
  type
    CFieldType SDL_GamepadSensorEvent "which" =
      SDL3.Sys.Bindgen.Joystick.SDL_JoystickID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "sensor" SDL_GamepadSensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadSensorEvent
            { sensor = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , data' = BG.getField @"data'" x0
            , sensor_timestamp = BG.getField @"sensor_timestamp" x0
            }
      , BG.getField @"sensor" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "sensor" (BG.Ptr SDL_GamepadSensorEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"sensor")

instance HasCField.HasCField SDL_GamepadSensorEvent "sensor" where
  type
    CFieldType SDL_GamepadSensorEvent "sensor" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ CA.ConstantArray 3 BG.CFloat)
  => BG.CompatHasField.HasField "data'" SDL_GamepadSensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadSensorEvent
            { data' = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , sensor = BG.getField @"sensor" x0
            , sensor_timestamp = BG.getField @"sensor_timestamp" x0
            }
      , BG.getField @"data'" x0
      )

instance
  (ty ~ CA.ConstantArray 3 BG.CFloat)
  => BG.HasField "data'" (BG.Ptr SDL_GamepadSensorEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data'")

instance HasCField.HasCField SDL_GamepadSensorEvent "data'" where
  type
    CFieldType SDL_GamepadSensorEvent "data'" =
      CA.ConstantArray 3 BG.CFloat

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "sensor_timestamp" SDL_GamepadSensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GamepadSensorEvent
            { sensor_timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , sensor = BG.getField @"sensor" x0
            , data' = BG.getField @"data'" x0
            }
      , BG.getField @"sensor_timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "sensor_timestamp" (BG.Ptr SDL_GamepadSensorEvent) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"sensor_timestamp")

instance HasCField.HasCField SDL_GamepadSensorEvent "sensor_timestamp" where
  type
    CFieldType SDL_GamepadSensorEvent "sensor_timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 40

-- | Audio device event structure (event.adevice.*)
--
--     Note that SDL will send a SDL_EVENT_AUDIO_DEVICE_ADDED event for every device it discovers during initialization. After that, this event will only arrive when a device is hotplugged during the program\'s run.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_AudioDeviceEvent@, defined at @SDL3\/SDL_events.h 722:16@
data SDL_AudioDeviceEvent = SDL_AudioDeviceEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_AUDIO_DEVICE_ADDED, or SDL_EVENT_AUDIO_DEVICE_REMOVED, or SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 724:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 725:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 726:12@
  , which :: SDL3.Sys.Bindgen.Audio.SDL_AudioDeviceID
  -- ^ SDL_AudioDeviceID for the device being added or removed or changing
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 727:23@
  , recording :: BG.CBool
  -- ^ false if a playback device, true if a recording device.
  --
  --          [C declaration]: @recording@, defined at @SDL3\/SDL_events.h 728:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_events.h 729:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_events.h 730:11@
  , padding3 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding3@, defined at @SDL3\/SDL_events.h 731:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_AudioDeviceEvent where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_AudioDeviceEvent where
  readRaw =
    \ptr0 ->
      pure SDL_AudioDeviceEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"recording") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding3") ptr0

instance Marshal.WriteRaw SDL_AudioDeviceEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_AudioDeviceEvent
            type'2
            reserved3
            timestamp4
            which5
            recording6
            padding17
            padding28
            padding39 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5
                >> HasCField.writeRaw (BG.Proxy @"recording") ptr0 recording6
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding17
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding28
                >> HasCField.writeRaw (BG.Proxy @"padding3") ptr0 padding39

deriving via Marshal.EquivStorable SDL_AudioDeviceEvent instance BG.Storable SDL_AudioDeviceEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_AudioDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioDeviceEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , recording = BG.getField @"recording" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_AudioDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_AudioDeviceEvent "type'" where
  type
    CFieldType SDL_AudioDeviceEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_AudioDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioDeviceEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , recording = BG.getField @"recording" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_AudioDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_AudioDeviceEvent "reserved" where
  type
    CFieldType SDL_AudioDeviceEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_AudioDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioDeviceEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            , recording = BG.getField @"recording" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_AudioDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_AudioDeviceEvent "timestamp" where
  type
    CFieldType SDL_AudioDeviceEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Audio.SDL_AudioDeviceID)
  => BG.CompatHasField.HasField "which" SDL_AudioDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioDeviceEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , recording = BG.getField @"recording" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Audio.SDL_AudioDeviceID)
  => BG.HasField "which" (BG.Ptr SDL_AudioDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_AudioDeviceEvent "which" where
  type
    CFieldType SDL_AudioDeviceEvent "which" =
      SDL3.Sys.Bindgen.Audio.SDL_AudioDeviceID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "recording" SDL_AudioDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioDeviceEvent
            { recording = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"recording" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "recording" (BG.Ptr SDL_AudioDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"recording")

instance HasCField.HasCField SDL_AudioDeviceEvent "recording" where
  type
    CFieldType SDL_AudioDeviceEvent "recording" =
      BG.CBool

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_AudioDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioDeviceEvent
            { padding1 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , recording = BG.getField @"recording" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_AudioDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_AudioDeviceEvent "padding1" where
  type
    CFieldType SDL_AudioDeviceEvent "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 21

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_AudioDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioDeviceEvent
            { padding2 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , recording = BG.getField @"recording" x0
            , padding1 = BG.getField @"padding1" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_AudioDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_AudioDeviceEvent "padding2" where
  type
    CFieldType SDL_AudioDeviceEvent "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 22

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding3" SDL_AudioDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioDeviceEvent
            { padding3 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , recording = BG.getField @"recording" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding3" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding3" (BG.Ptr SDL_AudioDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding3")

instance HasCField.HasCField SDL_AudioDeviceEvent "padding3" where
  type
    CFieldType SDL_AudioDeviceEvent "padding3" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 23

-- | Camera device event structure (event.cdevice.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_CameraDeviceEvent@, defined at @SDL3\/SDL_events.h 739:16@
data SDL_CameraDeviceEvent = SDL_CameraDeviceEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_CAMERA_DEVICE_ADDED, SDL_EVENT_CAMERA_DEVICE_REMOVED, SDL_EVENT_CAMERA_DEVICE_APPROVED, SDL_EVENT_CAMERA_DEVICE_DENIED
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 741:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 742:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 743:12@
  , which :: SDL3.Sys.Bindgen.Camera.SDL_CameraID
  -- ^ SDL_CameraID for the device being added or removed or changing
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 744:18@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_CameraDeviceEvent where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_CameraDeviceEvent where
  readRaw =
    \ptr0 ->
      pure SDL_CameraDeviceEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0

instance Marshal.WriteRaw SDL_CameraDeviceEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_CameraDeviceEvent type'2 reserved3 timestamp4 which5 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5

deriving via Marshal.EquivStorable SDL_CameraDeviceEvent instance BG.Storable SDL_CameraDeviceEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_CameraDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraDeviceEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_CameraDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_CameraDeviceEvent "type'" where
  type
    CFieldType SDL_CameraDeviceEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_CameraDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraDeviceEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_CameraDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_CameraDeviceEvent "reserved" where
  type
    CFieldType SDL_CameraDeviceEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_CameraDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraDeviceEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_CameraDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_CameraDeviceEvent "timestamp" where
  type
    CFieldType SDL_CameraDeviceEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Camera.SDL_CameraID)
  => BG.CompatHasField.HasField "which" SDL_CameraDeviceEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraDeviceEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Camera.SDL_CameraID)
  => BG.HasField "which" (BG.Ptr SDL_CameraDeviceEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_CameraDeviceEvent "which" where
  type
    CFieldType SDL_CameraDeviceEvent "which" =
      SDL3.Sys.Bindgen.Camera.SDL_CameraID

  offset# = \_ -> \_ -> 16

-- | Renderer event structure (event.render.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_RenderEvent@, defined at @SDL3\/SDL_events.h 753:16@
data SDL_RenderEvent = SDL_RenderEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_RENDER_TARGETS_RESET, SDL_EVENT_RENDER_DEVICE_RESET, SDL_EVENT_RENDER_DEVICE_LOST
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 755:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 756:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 757:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window containing the renderer in question.
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 758:18@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_RenderEvent where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_RenderEvent where
  readRaw =
    \ptr0 ->
      pure SDL_RenderEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0

instance Marshal.WriteRaw SDL_RenderEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_RenderEvent type'2 reserved3 timestamp4 windowID5 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5

deriving via Marshal.EquivStorable SDL_RenderEvent instance BG.Storable SDL_RenderEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_RenderEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_RenderEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_RenderEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_RenderEvent "type'" where
  type
    CFieldType SDL_RenderEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_RenderEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_RenderEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_RenderEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_RenderEvent "reserved" where
  type
    CFieldType SDL_RenderEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_RenderEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_RenderEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_RenderEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_RenderEvent "timestamp" where
  type
    CFieldType SDL_RenderEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_RenderEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_RenderEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_RenderEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_RenderEvent "windowID" where
  type
    CFieldType SDL_RenderEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

-- | Touch finger event structure (event.tfinger.*)
--
--     Coordinates in this event are normalized. @x@ and @y@ are normalized to a range between 0.0f and 1.0f, relative to the window, so (0,0) is the top left and (1,1) is the bottom right. Delta coordinates @dx@ and @dy@ are normalized in the ranges of -1.0f (traversed all the way from the bottom or right to all the way up or left) to 1.0f (traversed all the way from the top or left to all the way down or right).
--
--     Note that while the coordinates are /normalized/, they are not /clamped/, which means in some circumstances you can get a value outside of this range. For example, a renderer using logical presentation might give a negative value when the touch is in the letterboxing. Some platforms might report a touch outside of the window, which will also be outside of the range.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_TouchFingerEvent@, defined at @SDL3\/SDL_events.h 781:16@
data SDL_TouchFingerEvent = SDL_TouchFingerEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_FINGER_DOWN, SDL_EVENT_FINGER_UP, SDL_EVENT_FINGER_MOTION, or SDL_EVENT_FINGER_CANCELED
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 783:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 784:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 785:12@
  , touchID :: SDL3.Sys.Bindgen.Touch.SDL_TouchID
  -- ^ The touch device id
  --
  --          [C declaration]: @touchID@, defined at @SDL3\/SDL_events.h 786:17@
  , fingerID :: SDL3.Sys.Bindgen.Touch.SDL_FingerID
  -- ^ [C declaration]: @fingerID@, defined at @SDL3\/SDL_events.h 787:18@
  , x :: BG.CFloat
  -- ^ Normalized in the range 0...1
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_events.h 788:11@
  , y :: BG.CFloat
  -- ^ Normalized in the range 0...1
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_events.h 789:11@
  , dx :: BG.CFloat
  -- ^ Normalized in the range -1...1
  --
  --          [C declaration]: @dx@, defined at @SDL3\/SDL_events.h 790:11@
  , dy :: BG.CFloat
  -- ^ Normalized in the range -1...1
  --
  --          [C declaration]: @dy@, defined at @SDL3\/SDL_events.h 791:11@
  , pressure :: BG.CFloat
  -- ^ Normalized in the range 0...1
  --
  --          [C declaration]: @pressure@, defined at @SDL3\/SDL_events.h 792:11@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window underneath the finger, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 793:18@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_TouchFingerEvent where
  staticSizeOf = \_ -> (56 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_TouchFingerEvent where
  readRaw =
    \ptr0 ->
      pure SDL_TouchFingerEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"touchID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"fingerID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"dx") ptr0
        <*> HasCField.readRaw (BG.Proxy @"dy") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pressure") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0

instance Marshal.WriteRaw SDL_TouchFingerEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_TouchFingerEvent
            type'2
            reserved3
            timestamp4
            touchID5
            fingerID6
            x7
            y8
            dx9
            dy10
            pressure11
            windowID12 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"touchID") ptr0 touchID5
                >> HasCField.writeRaw (BG.Proxy @"fingerID") ptr0 fingerID6
                >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x7
                >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y8
                >> HasCField.writeRaw (BG.Proxy @"dx") ptr0 dx9
                >> HasCField.writeRaw (BG.Proxy @"dy") ptr0 dy10
                >> HasCField.writeRaw (BG.Proxy @"pressure") ptr0 pressure11
                >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID12

deriving via Marshal.EquivStorable SDL_TouchFingerEvent instance BG.Storable SDL_TouchFingerEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_TouchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchFingerEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , touchID = BG.getField @"touchID" x0
            , fingerID = BG.getField @"fingerID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , dx = BG.getField @"dx" x0
            , dy = BG.getField @"dy" x0
            , pressure = BG.getField @"pressure" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_TouchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_TouchFingerEvent "type'" where
  type
    CFieldType SDL_TouchFingerEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_TouchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchFingerEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , touchID = BG.getField @"touchID" x0
            , fingerID = BG.getField @"fingerID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , dx = BG.getField @"dx" x0
            , dy = BG.getField @"dy" x0
            , pressure = BG.getField @"pressure" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_TouchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_TouchFingerEvent "reserved" where
  type
    CFieldType SDL_TouchFingerEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_TouchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchFingerEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , touchID = BG.getField @"touchID" x0
            , fingerID = BG.getField @"fingerID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , dx = BG.getField @"dx" x0
            , dy = BG.getField @"dy" x0
            , pressure = BG.getField @"pressure" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_TouchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_TouchFingerEvent "timestamp" where
  type
    CFieldType SDL_TouchFingerEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Touch.SDL_TouchID)
  => BG.CompatHasField.HasField "touchID" SDL_TouchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchFingerEvent
            { touchID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , fingerID = BG.getField @"fingerID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , dx = BG.getField @"dx" x0
            , dy = BG.getField @"dy" x0
            , pressure = BG.getField @"pressure" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"touchID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Touch.SDL_TouchID)
  => BG.HasField "touchID" (BG.Ptr SDL_TouchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"touchID")

instance HasCField.HasCField SDL_TouchFingerEvent "touchID" where
  type
    CFieldType SDL_TouchFingerEvent "touchID" =
      SDL3.Sys.Bindgen.Touch.SDL_TouchID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Touch.SDL_FingerID)
  => BG.CompatHasField.HasField "fingerID" SDL_TouchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchFingerEvent
            { fingerID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , touchID = BG.getField @"touchID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , dx = BG.getField @"dx" x0
            , dy = BG.getField @"dy" x0
            , pressure = BG.getField @"pressure" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"fingerID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Touch.SDL_FingerID)
  => BG.HasField "fingerID" (BG.Ptr SDL_TouchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"fingerID")

instance HasCField.HasCField SDL_TouchFingerEvent "fingerID" where
  type
    CFieldType SDL_TouchFingerEvent "fingerID" =
      SDL3.Sys.Bindgen.Touch.SDL_FingerID

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "x" SDL_TouchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchFingerEvent
            { x = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , touchID = BG.getField @"touchID" x0
            , fingerID = BG.getField @"fingerID" x0
            , y = BG.getField @"y" x0
            , dx = BG.getField @"dx" x0
            , dy = BG.getField @"dy" x0
            , pressure = BG.getField @"pressure" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_TouchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_TouchFingerEvent "x" where
  type CFieldType SDL_TouchFingerEvent "x" = BG.CFloat

  offset# = \_ -> \_ -> 32

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "y" SDL_TouchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchFingerEvent
            { y = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , touchID = BG.getField @"touchID" x0
            , fingerID = BG.getField @"fingerID" x0
            , x = BG.getField @"x" x0
            , dx = BG.getField @"dx" x0
            , dy = BG.getField @"dy" x0
            , pressure = BG.getField @"pressure" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_TouchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_TouchFingerEvent "y" where
  type CFieldType SDL_TouchFingerEvent "y" = BG.CFloat

  offset# = \_ -> \_ -> 36

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "dx" SDL_TouchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchFingerEvent
            { dx = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , touchID = BG.getField @"touchID" x0
            , fingerID = BG.getField @"fingerID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , dy = BG.getField @"dy" x0
            , pressure = BG.getField @"pressure" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"dx" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "dx" (BG.Ptr SDL_TouchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"dx")

instance HasCField.HasCField SDL_TouchFingerEvent "dx" where
  type CFieldType SDL_TouchFingerEvent "dx" = BG.CFloat

  offset# = \_ -> \_ -> 40

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "dy" SDL_TouchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchFingerEvent
            { dy = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , touchID = BG.getField @"touchID" x0
            , fingerID = BG.getField @"fingerID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , dx = BG.getField @"dx" x0
            , pressure = BG.getField @"pressure" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"dy" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "dy" (BG.Ptr SDL_TouchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"dy")

instance HasCField.HasCField SDL_TouchFingerEvent "dy" where
  type CFieldType SDL_TouchFingerEvent "dy" = BG.CFloat

  offset# = \_ -> \_ -> 44

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "pressure" SDL_TouchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchFingerEvent
            { pressure = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , touchID = BG.getField @"touchID" x0
            , fingerID = BG.getField @"fingerID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , dx = BG.getField @"dx" x0
            , dy = BG.getField @"dy" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"pressure" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "pressure" (BG.Ptr SDL_TouchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pressure")

instance HasCField.HasCField SDL_TouchFingerEvent "pressure" where
  type
    CFieldType SDL_TouchFingerEvent "pressure" =
      BG.CFloat

  offset# = \_ -> \_ -> 48

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_TouchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchFingerEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , touchID = BG.getField @"touchID" x0
            , fingerID = BG.getField @"fingerID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , dx = BG.getField @"dx" x0
            , dy = BG.getField @"dy" x0
            , pressure = BG.getField @"pressure" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_TouchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_TouchFingerEvent "windowID" where
  type
    CFieldType SDL_TouchFingerEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 52

-- | Pinch event structure (event.pinch.*)
--
--     [C declaration]: @struct SDL_PinchFingerEvent@, defined at @SDL3\/SDL_events.h 799:16@
data SDL_PinchFingerEvent = SDL_PinchFingerEvent
  { type' :: SDL_EventType
  -- ^ @SDL_EVENT_PINCH_BEGIN@ or @SDL_EVENT_PINCH_UPDATE@ or @SDL_EVENT_PINCH_END@
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 801:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 802:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 803:12@
  , scale :: BG.CFloat
  -- ^ The scale change since the last SDL_EVENT_PINCH_UPDATE. Scale \< 1 is \"zoom out\". Scale > 1 is \"zoom in\".
  --
  --          [C declaration]: @scale@, defined at @SDL3\/SDL_events.h 804:11@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window underneath the finger, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 805:18@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_PinchFingerEvent where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_PinchFingerEvent where
  readRaw =
    \ptr0 ->
      pure SDL_PinchFingerEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"scale") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0

instance Marshal.WriteRaw SDL_PinchFingerEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PinchFingerEvent type'2 reserved3 timestamp4 scale5 windowID6 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"scale") ptr0 scale5
              >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID6

deriving via Marshal.EquivStorable SDL_PinchFingerEvent instance BG.Storable SDL_PinchFingerEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_PinchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PinchFingerEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , scale = BG.getField @"scale" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_PinchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_PinchFingerEvent "type'" where
  type
    CFieldType SDL_PinchFingerEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_PinchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PinchFingerEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , scale = BG.getField @"scale" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_PinchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_PinchFingerEvent "reserved" where
  type
    CFieldType SDL_PinchFingerEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_PinchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PinchFingerEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , scale = BG.getField @"scale" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_PinchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_PinchFingerEvent "timestamp" where
  type
    CFieldType SDL_PinchFingerEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "scale" SDL_PinchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PinchFingerEvent
            { scale = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"scale" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "scale" (BG.Ptr SDL_PinchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"scale")

instance HasCField.HasCField SDL_PinchFingerEvent "scale" where
  type
    CFieldType SDL_PinchFingerEvent "scale" =
      BG.CFloat

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_PinchFingerEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PinchFingerEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , scale = BG.getField @"scale" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_PinchFingerEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_PinchFingerEvent "windowID" where
  type
    CFieldType SDL_PinchFingerEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 20

-- | Pressure-sensitive pen proximity event structure (event.pproximity.*)
--
--     When a pen becomes visible to the system (it is close enough to a tablet, etc), SDL will send an SDL_EVENT_PEN_PROXIMITY_IN event with the new pen\'s ID. This ID is valid until the pen leaves proximity again (has been removed from the tablet\'s area, the tablet has been unplugged, etc). If the same pen reenters proximity again, it will be given a new ID.
--
--     Note that \"proximity\" means \"close enough for the tablet to know the tool is there.\" The pen touching and lifting off from the tablet while not leaving the area are handled by SDL_EVENT_PEN_DOWN and SDL_EVENT_PEN_UP.
--
--     Not all platforms have a window associated with the pen during proximity events. Some wait until motion\/button\/etc events to offer this info.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_PenProximityEvent@, defined at @SDL3\/SDL_events.h 826:16@
data SDL_PenProximityEvent = SDL_PenProximityEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_PEN_PROXIMITY_IN or SDL_EVENT_PEN_PROXIMITY_OUT
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 828:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 829:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 830:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window with pen focus, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 831:18@
  , which :: SDL3.Sys.Bindgen.Pen.SDL_PenID
  -- ^ The pen instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 832:15@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_PenProximityEvent where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_PenProximityEvent where
  readRaw =
    \ptr0 ->
      pure SDL_PenProximityEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0

instance Marshal.WriteRaw SDL_PenProximityEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PenProximityEvent type'2 reserved3 timestamp4 windowID5 which6 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
              >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which6

deriving via Marshal.EquivStorable SDL_PenProximityEvent instance BG.Storable SDL_PenProximityEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_PenProximityEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenProximityEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_PenProximityEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_PenProximityEvent "type'" where
  type
    CFieldType SDL_PenProximityEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_PenProximityEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenProximityEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_PenProximityEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_PenProximityEvent "reserved" where
  type
    CFieldType SDL_PenProximityEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_PenProximityEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenProximityEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_PenProximityEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_PenProximityEvent "timestamp" where
  type
    CFieldType SDL_PenProximityEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_PenProximityEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenProximityEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_PenProximityEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_PenProximityEvent "windowID" where
  type
    CFieldType SDL_PenProximityEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenID)
  => BG.CompatHasField.HasField "which" SDL_PenProximityEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenProximityEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenID)
  => BG.HasField "which" (BG.Ptr SDL_PenProximityEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_PenProximityEvent "which" where
  type
    CFieldType SDL_PenProximityEvent "which" =
      SDL3.Sys.Bindgen.Pen.SDL_PenID

  offset# = \_ -> \_ -> 20

-- | Pressure-sensitive pen motion event structure (event.pmotion.*)
--
--     Depending on the hardware, you may get motion events when the pen is not touching a tablet, for tracking a pen even when it isn\'t drawing. You should listen for SDL_EVENT_PEN_DOWN and SDL_EVENT_PEN_UP events, or check @pen_state & SDL_PEN_INPUT_DOWN@ to decide if a pen is \"drawing\" when dealing with pen motion.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_PenMotionEvent@, defined at @SDL3\/SDL_events.h 846:16@
data SDL_PenMotionEvent = SDL_PenMotionEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_PEN_MOTION
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 848:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 849:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 850:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window with pen focus, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 851:18@
  , which :: SDL3.Sys.Bindgen.Pen.SDL_PenID
  -- ^ The pen instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 852:15@
  , pen_state :: SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags
  -- ^ Complete pen input state at time of event
  --
  --          [C declaration]: @pen_state@, defined at @SDL3\/SDL_events.h 853:23@
  , x :: BG.CFloat
  -- ^ X coordinate, relative to window
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_events.h 854:11@
  , y :: BG.CFloat
  -- ^ Y coordinate, relative to window
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_events.h 855:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_PenMotionEvent where
  staticSizeOf = \_ -> (40 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_PenMotionEvent where
  readRaw =
    \ptr0 ->
      pure SDL_PenMotionEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pen_state") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0

instance Marshal.WriteRaw SDL_PenMotionEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PenMotionEvent
            type'2
            reserved3
            timestamp4
            windowID5
            which6
            pen_state7
            x8
            y9 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which6
                >> HasCField.writeRaw (BG.Proxy @"pen_state") ptr0 pen_state7
                >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x8
                >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y9

deriving via Marshal.EquivStorable SDL_PenMotionEvent instance BG.Storable SDL_PenMotionEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_PenMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenMotionEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_PenMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_PenMotionEvent "type'" where
  type
    CFieldType SDL_PenMotionEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_PenMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenMotionEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_PenMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_PenMotionEvent "reserved" where
  type
    CFieldType SDL_PenMotionEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_PenMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenMotionEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_PenMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_PenMotionEvent "timestamp" where
  type
    CFieldType SDL_PenMotionEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_PenMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenMotionEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_PenMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_PenMotionEvent "windowID" where
  type
    CFieldType SDL_PenMotionEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenID)
  => BG.CompatHasField.HasField "which" SDL_PenMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenMotionEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenID)
  => BG.HasField "which" (BG.Ptr SDL_PenMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_PenMotionEvent "which" where
  type
    CFieldType SDL_PenMotionEvent "which" =
      SDL3.Sys.Bindgen.Pen.SDL_PenID

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags)
  => BG.CompatHasField.HasField "pen_state" SDL_PenMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenMotionEvent
            { pen_state = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"pen_state" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags)
  => BG.HasField "pen_state" (BG.Ptr SDL_PenMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pen_state")

instance HasCField.HasCField SDL_PenMotionEvent "pen_state" where
  type
    CFieldType SDL_PenMotionEvent "pen_state" =
      SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "x" SDL_PenMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenMotionEvent
            { x = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_PenMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_PenMotionEvent "x" where
  type CFieldType SDL_PenMotionEvent "x" = BG.CFloat

  offset# = \_ -> \_ -> 28

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "y" SDL_PenMotionEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenMotionEvent
            { y = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_PenMotionEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_PenMotionEvent "y" where
  type CFieldType SDL_PenMotionEvent "y" = BG.CFloat

  offset# = \_ -> \_ -> 32

-- | Pressure-sensitive pen touched event structure (event.ptouch.*)
--
--     These events come when a pen touches a surface (a tablet, etc), or lifts off from one.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_PenTouchEvent@, defined at @SDL3\/SDL_events.h 866:16@
data SDL_PenTouchEvent = SDL_PenTouchEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_PEN_DOWN or SDL_EVENT_PEN_UP
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 868:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 869:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 870:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window with pen focus, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 871:18@
  , which :: SDL3.Sys.Bindgen.Pen.SDL_PenID
  -- ^ The pen instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 872:15@
  , pen_state :: SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags
  -- ^ Complete pen input state at time of event
  --
  --          [C declaration]: @pen_state@, defined at @SDL3\/SDL_events.h 873:23@
  , x :: BG.CFloat
  -- ^ X coordinate, relative to window
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_events.h 874:11@
  , y :: BG.CFloat
  -- ^ Y coordinate, relative to window
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_events.h 875:11@
  , eraser :: BG.CBool
  -- ^ true if eraser end is used (not all pens support this).
  --
  --          [C declaration]: @eraser@, defined at @SDL3\/SDL_events.h 876:10@
  , down :: BG.CBool
  -- ^ true if the pen is touching or false if the pen is lifted off
  --
  --          [C declaration]: @down@, defined at @SDL3\/SDL_events.h 877:10@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_PenTouchEvent where
  staticSizeOf = \_ -> (40 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_PenTouchEvent where
  readRaw =
    \ptr0 ->
      pure SDL_PenTouchEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pen_state") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"eraser") ptr0
        <*> HasCField.readRaw (BG.Proxy @"down") ptr0

instance Marshal.WriteRaw SDL_PenTouchEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PenTouchEvent
            type'2
            reserved3
            timestamp4
            windowID5
            which6
            pen_state7
            x8
            y9
            eraser10
            down11 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which6
                >> HasCField.writeRaw (BG.Proxy @"pen_state") ptr0 pen_state7
                >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x8
                >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y9
                >> HasCField.writeRaw (BG.Proxy @"eraser") ptr0 eraser10
                >> HasCField.writeRaw (BG.Proxy @"down") ptr0 down11

deriving via Marshal.EquivStorable SDL_PenTouchEvent instance BG.Storable SDL_PenTouchEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_PenTouchEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenTouchEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , eraser = BG.getField @"eraser" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_PenTouchEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_PenTouchEvent "type'" where
  type
    CFieldType SDL_PenTouchEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_PenTouchEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenTouchEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , eraser = BG.getField @"eraser" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_PenTouchEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_PenTouchEvent "reserved" where
  type
    CFieldType SDL_PenTouchEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_PenTouchEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenTouchEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , eraser = BG.getField @"eraser" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_PenTouchEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_PenTouchEvent "timestamp" where
  type
    CFieldType SDL_PenTouchEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_PenTouchEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenTouchEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , eraser = BG.getField @"eraser" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_PenTouchEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_PenTouchEvent "windowID" where
  type
    CFieldType SDL_PenTouchEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenID)
  => BG.CompatHasField.HasField "which" SDL_PenTouchEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenTouchEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , eraser = BG.getField @"eraser" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenID)
  => BG.HasField "which" (BG.Ptr SDL_PenTouchEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_PenTouchEvent "which" where
  type
    CFieldType SDL_PenTouchEvent "which" =
      SDL3.Sys.Bindgen.Pen.SDL_PenID

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags)
  => BG.CompatHasField.HasField "pen_state" SDL_PenTouchEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenTouchEvent
            { pen_state = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , eraser = BG.getField @"eraser" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"pen_state" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags)
  => BG.HasField "pen_state" (BG.Ptr SDL_PenTouchEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pen_state")

instance HasCField.HasCField SDL_PenTouchEvent "pen_state" where
  type
    CFieldType SDL_PenTouchEvent "pen_state" =
      SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "x" SDL_PenTouchEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenTouchEvent
            { x = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , y = BG.getField @"y" x0
            , eraser = BG.getField @"eraser" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_PenTouchEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_PenTouchEvent "x" where
  type CFieldType SDL_PenTouchEvent "x" = BG.CFloat

  offset# = \_ -> \_ -> 28

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "y" SDL_PenTouchEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenTouchEvent
            { y = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , eraser = BG.getField @"eraser" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_PenTouchEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_PenTouchEvent "y" where
  type CFieldType SDL_PenTouchEvent "y" = BG.CFloat

  offset# = \_ -> \_ -> 32

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "eraser" SDL_PenTouchEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenTouchEvent
            { eraser = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"eraser" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "eraser" (BG.Ptr SDL_PenTouchEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"eraser")

instance HasCField.HasCField SDL_PenTouchEvent "eraser" where
  type CFieldType SDL_PenTouchEvent "eraser" = BG.CBool

  offset# = \_ -> \_ -> 36

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "down" SDL_PenTouchEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenTouchEvent
            { down = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , eraser = BG.getField @"eraser" x0
            }
      , BG.getField @"down" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "down" (BG.Ptr SDL_PenTouchEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"down")

instance HasCField.HasCField SDL_PenTouchEvent "down" where
  type CFieldType SDL_PenTouchEvent "down" = BG.CBool

  offset# = \_ -> \_ -> 37

-- | Pressure-sensitive pen button event structure (event.pbutton.*)
--
--     This is for buttons on the pen itself that the user might click. The pen itself pressing down to draw triggers a SDL_EVENT_PEN_DOWN event instead.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_PenButtonEvent@, defined at @SDL3\/SDL_events.h 888:16@
data SDL_PenButtonEvent = SDL_PenButtonEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_PEN_BUTTON_DOWN or SDL_EVENT_PEN_BUTTON_UP
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 890:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 891:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 892:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window with mouse focus, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 893:18@
  , which :: SDL3.Sys.Bindgen.Pen.SDL_PenID
  -- ^ The pen instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 894:15@
  , pen_state :: SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags
  -- ^ Complete pen input state at time of event
  --
  --          [C declaration]: @pen_state@, defined at @SDL3\/SDL_events.h 895:23@
  , x :: BG.CFloat
  -- ^ X coordinate, relative to window
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_events.h 896:11@
  , y :: BG.CFloat
  -- ^ Y coordinate, relative to window
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_events.h 897:11@
  , button :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ The pen button index (first button is 1).
  --
  --          [C declaration]: @button@, defined at @SDL3\/SDL_events.h 898:11@
  , down :: BG.CBool
  -- ^ true if the button is pressed
  --
  --          [C declaration]: @down@, defined at @SDL3\/SDL_events.h 899:10@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_PenButtonEvent where
  staticSizeOf = \_ -> (40 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_PenButtonEvent where
  readRaw =
    \ptr0 ->
      pure SDL_PenButtonEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pen_state") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"button") ptr0
        <*> HasCField.readRaw (BG.Proxy @"down") ptr0

instance Marshal.WriteRaw SDL_PenButtonEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PenButtonEvent
            type'2
            reserved3
            timestamp4
            windowID5
            which6
            pen_state7
            x8
            y9
            button10
            down11 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which6
                >> HasCField.writeRaw (BG.Proxy @"pen_state") ptr0 pen_state7
                >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x8
                >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y9
                >> HasCField.writeRaw (BG.Proxy @"button") ptr0 button10
                >> HasCField.writeRaw (BG.Proxy @"down") ptr0 down11

deriving via Marshal.EquivStorable SDL_PenButtonEvent instance BG.Storable SDL_PenButtonEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_PenButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenButtonEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_PenButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_PenButtonEvent "type'" where
  type
    CFieldType SDL_PenButtonEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_PenButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenButtonEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_PenButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_PenButtonEvent "reserved" where
  type
    CFieldType SDL_PenButtonEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_PenButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenButtonEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_PenButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_PenButtonEvent "timestamp" where
  type
    CFieldType SDL_PenButtonEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_PenButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenButtonEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_PenButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_PenButtonEvent "windowID" where
  type
    CFieldType SDL_PenButtonEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenID)
  => BG.CompatHasField.HasField "which" SDL_PenButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenButtonEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenID)
  => BG.HasField "which" (BG.Ptr SDL_PenButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_PenButtonEvent "which" where
  type
    CFieldType SDL_PenButtonEvent "which" =
      SDL3.Sys.Bindgen.Pen.SDL_PenID

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags)
  => BG.CompatHasField.HasField "pen_state" SDL_PenButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenButtonEvent
            { pen_state = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"pen_state" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags)
  => BG.HasField "pen_state" (BG.Ptr SDL_PenButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pen_state")

instance HasCField.HasCField SDL_PenButtonEvent "pen_state" where
  type
    CFieldType SDL_PenButtonEvent "pen_state" =
      SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "x" SDL_PenButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenButtonEvent
            { x = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , y = BG.getField @"y" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_PenButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_PenButtonEvent "x" where
  type CFieldType SDL_PenButtonEvent "x" = BG.CFloat

  offset# = \_ -> \_ -> 28

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "y" SDL_PenButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenButtonEvent
            { y = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , button = BG.getField @"button" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_PenButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_PenButtonEvent "y" where
  type CFieldType SDL_PenButtonEvent "y" = BG.CFloat

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "button" SDL_PenButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenButtonEvent
            { button = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , down = BG.getField @"down" x0
            }
      , BG.getField @"button" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "button" (BG.Ptr SDL_PenButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"button")

instance HasCField.HasCField SDL_PenButtonEvent "button" where
  type
    CFieldType SDL_PenButtonEvent "button" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 36

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "down" SDL_PenButtonEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenButtonEvent
            { down = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , button = BG.getField @"button" x0
            }
      , BG.getField @"down" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "down" (BG.Ptr SDL_PenButtonEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"down")

instance HasCField.HasCField SDL_PenButtonEvent "down" where
  type CFieldType SDL_PenButtonEvent "down" = BG.CBool

  offset# = \_ -> \_ -> 37

-- | Pressure-sensitive pen pressure \/ angle event structure (event.paxis.*)
--
--     You might get some of these events even if the pen isn\'t touching the tablet.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_PenAxisEvent@, defined at @SDL3\/SDL_events.h 910:16@
data SDL_PenAxisEvent = SDL_PenAxisEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_PEN_AXIS
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 912:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 913:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 914:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window with pen focus, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 915:18@
  , which :: SDL3.Sys.Bindgen.Pen.SDL_PenID
  -- ^ The pen instance id
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 916:15@
  , pen_state :: SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags
  -- ^ Complete pen input state at time of event
  --
  --          [C declaration]: @pen_state@, defined at @SDL3\/SDL_events.h 917:23@
  , x :: BG.CFloat
  -- ^ X coordinate, relative to window
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_events.h 918:11@
  , y :: BG.CFloat
  -- ^ Y coordinate, relative to window
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_events.h 919:11@
  , axis :: SDL3.Sys.Bindgen.Pen.SDL_PenAxis
  -- ^ Axis that has changed
  --
  --          [C declaration]: @axis@, defined at @SDL3\/SDL_events.h 920:17@
  , value :: BG.CFloat
  -- ^ New value of axis
  --
  --          [C declaration]: @value@, defined at @SDL3\/SDL_events.h 921:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_PenAxisEvent where
  staticSizeOf = \_ -> (48 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_PenAxisEvent where
  readRaw =
    \ptr0 ->
      pure SDL_PenAxisEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pen_state") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"axis") ptr0
        <*> HasCField.readRaw (BG.Proxy @"value") ptr0

instance Marshal.WriteRaw SDL_PenAxisEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PenAxisEvent
            type'2
            reserved3
            timestamp4
            windowID5
            which6
            pen_state7
            x8
            y9
            axis10
            value11 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
                >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which6
                >> HasCField.writeRaw (BG.Proxy @"pen_state") ptr0 pen_state7
                >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x8
                >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y9
                >> HasCField.writeRaw (BG.Proxy @"axis") ptr0 axis10
                >> HasCField.writeRaw (BG.Proxy @"value") ptr0 value11

deriving via Marshal.EquivStorable SDL_PenAxisEvent instance BG.Storable SDL_PenAxisEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_PenAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenAxisEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , axis = BG.getField @"axis" x0
            , value = BG.getField @"value" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_PenAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_PenAxisEvent "type'" where
  type
    CFieldType SDL_PenAxisEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_PenAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenAxisEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , axis = BG.getField @"axis" x0
            , value = BG.getField @"value" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_PenAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_PenAxisEvent "reserved" where
  type
    CFieldType SDL_PenAxisEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_PenAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenAxisEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , axis = BG.getField @"axis" x0
            , value = BG.getField @"value" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_PenAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_PenAxisEvent "timestamp" where
  type
    CFieldType SDL_PenAxisEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_PenAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenAxisEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , axis = BG.getField @"axis" x0
            , value = BG.getField @"value" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_PenAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_PenAxisEvent "windowID" where
  type
    CFieldType SDL_PenAxisEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenID)
  => BG.CompatHasField.HasField "which" SDL_PenAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenAxisEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , axis = BG.getField @"axis" x0
            , value = BG.getField @"value" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenID)
  => BG.HasField "which" (BG.Ptr SDL_PenAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_PenAxisEvent "which" where
  type
    CFieldType SDL_PenAxisEvent "which" =
      SDL3.Sys.Bindgen.Pen.SDL_PenID

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags)
  => BG.CompatHasField.HasField "pen_state" SDL_PenAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenAxisEvent
            { pen_state = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , axis = BG.getField @"axis" x0
            , value = BG.getField @"value" x0
            }
      , BG.getField @"pen_state" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags)
  => BG.HasField "pen_state" (BG.Ptr SDL_PenAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pen_state")

instance HasCField.HasCField SDL_PenAxisEvent "pen_state" where
  type
    CFieldType SDL_PenAxisEvent "pen_state" =
      SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "x" SDL_PenAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenAxisEvent
            { x = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , y = BG.getField @"y" x0
            , axis = BG.getField @"axis" x0
            , value = BG.getField @"value" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_PenAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_PenAxisEvent "x" where
  type CFieldType SDL_PenAxisEvent "x" = BG.CFloat

  offset# = \_ -> \_ -> 28

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "y" SDL_PenAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenAxisEvent
            { y = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , axis = BG.getField @"axis" x0
            , value = BG.getField @"value" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_PenAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_PenAxisEvent "y" where
  type CFieldType SDL_PenAxisEvent "y" = BG.CFloat

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenAxis)
  => BG.CompatHasField.HasField "axis" SDL_PenAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenAxisEvent
            { axis = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , value = BG.getField @"value" x0
            }
      , BG.getField @"axis" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pen.SDL_PenAxis)
  => BG.HasField "axis" (BG.Ptr SDL_PenAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"axis")

instance HasCField.HasCField SDL_PenAxisEvent "axis" where
  type
    CFieldType SDL_PenAxisEvent "axis" =
      SDL3.Sys.Bindgen.Pen.SDL_PenAxis

  offset# = \_ -> \_ -> 36

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "value" SDL_PenAxisEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenAxisEvent
            { value = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , which = BG.getField @"which" x0
            , pen_state = BG.getField @"pen_state" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , axis = BG.getField @"axis" x0
            }
      , BG.getField @"value" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "value" (BG.Ptr SDL_PenAxisEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"value")

instance HasCField.HasCField SDL_PenAxisEvent "value" where
  type CFieldType SDL_PenAxisEvent "value" = BG.CFloat

  offset# = \_ -> \_ -> 40

-- | An event used to drop text or request a file open by the system (event.drop.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_DropEvent@, defined at @SDL3\/SDL_events.h 930:16@
data SDL_DropEvent = SDL_DropEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_DROP_BEGIN or SDL_EVENT_DROP_FILE or SDL_EVENT_DROP_TEXT or SDL_EVENT_DROP_COMPLETE or SDL_EVENT_DROP_POSITION
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 932:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 933:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 934:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The window that was dropped on, if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 935:18@
  , x :: BG.CFloat
  -- ^ X coordinate, relative to window (not on begin)
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_events.h 936:11@
  , y :: BG.CFloat
  -- ^ Y coordinate, relative to window (not on begin)
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_events.h 937:11@
  , source :: PtrConst.PtrConst BG.CChar
  -- ^ The source app that sent this drop event, or NULL if that isn\'t available
  --
  --          [C declaration]: @source@, defined at @SDL3\/SDL_events.h 938:17@
  , data' :: PtrConst.PtrConst BG.CChar
  -- ^ The text for SDL_EVENT_DROP_TEXT and the file name for SDL_EVENT_DROP_FILE, NULL for other events
  --
  --          [C declaration]: @data@, defined at @SDL3\/SDL_events.h 939:17@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_DropEvent where
  staticSizeOf = \_ -> (48 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_DropEvent where
  readRaw =
    \ptr0 ->
      pure SDL_DropEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"source") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data'") ptr0

instance Marshal.WriteRaw SDL_DropEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_DropEvent type'2 reserved3 timestamp4 windowID5 x6 y7 source8 data'9 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
              >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x6
              >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y7
              >> HasCField.writeRaw (BG.Proxy @"source") ptr0 source8
              >> HasCField.writeRaw (BG.Proxy @"data'") ptr0 data'9

deriving via Marshal.EquivStorable SDL_DropEvent instance BG.Storable SDL_DropEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_DropEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DropEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , source = BG.getField @"source" x0
            , data' = BG.getField @"data'" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_DropEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_DropEvent "type'" where
  type CFieldType SDL_DropEvent "type'" = SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_DropEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DropEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , source = BG.getField @"source" x0
            , data' = BG.getField @"data'" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_DropEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_DropEvent "reserved" where
  type
    CFieldType SDL_DropEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_DropEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DropEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , source = BG.getField @"source" x0
            , data' = BG.getField @"data'" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_DropEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_DropEvent "timestamp" where
  type
    CFieldType SDL_DropEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_DropEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DropEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , source = BG.getField @"source" x0
            , data' = BG.getField @"data'" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_DropEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_DropEvent "windowID" where
  type
    CFieldType SDL_DropEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "x" SDL_DropEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DropEvent
            { x = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , y = BG.getField @"y" x0
            , source = BG.getField @"source" x0
            , data' = BG.getField @"data'" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_DropEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_DropEvent "x" where
  type CFieldType SDL_DropEvent "x" = BG.CFloat

  offset# = \_ -> \_ -> 20

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "y" SDL_DropEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DropEvent
            { y = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , x = BG.getField @"x" x0
            , source = BG.getField @"source" x0
            , data' = BG.getField @"data'" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_DropEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_DropEvent "y" where
  type CFieldType SDL_DropEvent "y" = BG.CFloat

  offset# = \_ -> \_ -> 24

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "source" SDL_DropEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DropEvent
            { source = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , data' = BG.getField @"data'" x0
            }
      , BG.getField @"source" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "source" (BG.Ptr SDL_DropEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"source")

instance HasCField.HasCField SDL_DropEvent "source" where
  type
    CFieldType SDL_DropEvent "source" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 32

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "data'" SDL_DropEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DropEvent
            { data' = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , source = BG.getField @"source" x0
            }
      , BG.getField @"data'" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "data'" (BG.Ptr SDL_DropEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data'")

instance HasCField.HasCField SDL_DropEvent "data'" where
  type
    CFieldType SDL_DropEvent "data'" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 40

-- | An event triggered when the clipboard contents have changed (event.clipboard.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_ClipboardEvent@, defined at @SDL3\/SDL_events.h 948:16@
data SDL_ClipboardEvent = SDL_ClipboardEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_CLIPBOARD_UPDATE
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 950:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 951:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 952:12@
  , owner :: BG.CBool
  -- ^ are we owning the clipboard (internal update)
  --
  --          [C declaration]: @owner@, defined at @SDL3\/SDL_events.h 953:10@
  , num_mime_types :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ number of mime types
  --
  --          [C declaration]: @num_mime_types@, defined at @SDL3\/SDL_events.h 954:12@
  , mime_types :: BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^ current mime types
  --
  --          [C declaration]: @mime_types@, defined at @SDL3\/SDL_events.h 955:18@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_ClipboardEvent where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_ClipboardEvent where
  readRaw =
    \ptr0 ->
      pure SDL_ClipboardEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"owner") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_mime_types") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mime_types") ptr0

instance Marshal.WriteRaw SDL_ClipboardEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_ClipboardEvent
            type'2
            reserved3
            timestamp4
            owner5
            num_mime_types6
            mime_types7 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
                >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
                >> HasCField.writeRaw (BG.Proxy @"owner") ptr0 owner5
                >> HasCField.writeRaw (BG.Proxy @"num_mime_types") ptr0 num_mime_types6
                >> HasCField.writeRaw (BG.Proxy @"mime_types") ptr0 mime_types7

deriving via Marshal.EquivStorable SDL_ClipboardEvent instance BG.Storable SDL_ClipboardEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_ClipboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ClipboardEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , owner = BG.getField @"owner" x0
            , num_mime_types = BG.getField @"num_mime_types" x0
            , mime_types = BG.getField @"mime_types" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_ClipboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_ClipboardEvent "type'" where
  type
    CFieldType SDL_ClipboardEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_ClipboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ClipboardEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , owner = BG.getField @"owner" x0
            , num_mime_types = BG.getField @"num_mime_types" x0
            , mime_types = BG.getField @"mime_types" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_ClipboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_ClipboardEvent "reserved" where
  type
    CFieldType SDL_ClipboardEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_ClipboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ClipboardEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , owner = BG.getField @"owner" x0
            , num_mime_types = BG.getField @"num_mime_types" x0
            , mime_types = BG.getField @"mime_types" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_ClipboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_ClipboardEvent "timestamp" where
  type
    CFieldType SDL_ClipboardEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "owner" SDL_ClipboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ClipboardEvent
            { owner = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , num_mime_types = BG.getField @"num_mime_types" x0
            , mime_types = BG.getField @"mime_types" x0
            }
      , BG.getField @"owner" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "owner" (BG.Ptr SDL_ClipboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"owner")

instance HasCField.HasCField SDL_ClipboardEvent "owner" where
  type CFieldType SDL_ClipboardEvent "owner" = BG.CBool

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "num_mime_types" SDL_ClipboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ClipboardEvent
            { num_mime_types = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , owner = BG.getField @"owner" x0
            , mime_types = BG.getField @"mime_types" x0
            }
      , BG.getField @"num_mime_types" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "num_mime_types" (BG.Ptr SDL_ClipboardEvent) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_mime_types")

instance HasCField.HasCField SDL_ClipboardEvent "num_mime_types" where
  type
    CFieldType SDL_ClipboardEvent "num_mime_types" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ BG.Ptr (PtrConst.PtrConst BG.CChar))
  => BG.CompatHasField.HasField "mime_types" SDL_ClipboardEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ClipboardEvent
            { mime_types = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , owner = BG.getField @"owner" x0
            , num_mime_types = BG.getField @"num_mime_types" x0
            }
      , BG.getField @"mime_types" x0
      )

instance
  (ty ~ BG.Ptr (PtrConst.PtrConst BG.CChar))
  => BG.HasField "mime_types" (BG.Ptr SDL_ClipboardEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mime_types")

instance HasCField.HasCField SDL_ClipboardEvent "mime_types" where
  type
    CFieldType SDL_ClipboardEvent "mime_types" =
      BG.Ptr (PtrConst.PtrConst BG.CChar)

  offset# = \_ -> \_ -> 24

-- | Sensor event structure (event.sensor.*)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_SensorEvent@, defined at @SDL3\/SDL_events.h 963:16@
data SDL_SensorEvent = SDL_SensorEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_SENSOR_UPDATE
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 965:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 966:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 967:12@
  , which :: SDL3.Sys.Bindgen.Sensor.SDL_SensorID
  -- ^ The instance ID of the sensor
  --
  --          [C declaration]: @which@, defined at @SDL3\/SDL_events.h 968:18@
  , data' :: CA.ConstantArray 6 BG.CFloat
  -- ^ Up to 6 values from the sensor - additional values can be queried using SDL_GetSensorData()
  --
  --          [C declaration]: @data@, defined at @SDL3\/SDL_events.h 969:11@
  , sensor_timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ The timestamp of the sensor reading in nanoseconds, not necessarily synchronized with the system clock
  --
  --          [C declaration]: @sensor_timestamp@, defined at @SDL3\/SDL_events.h 970:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_SensorEvent where
  staticSizeOf = \_ -> (56 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_SensorEvent where
  readRaw =
    \ptr0 ->
      pure SDL_SensorEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"which") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"sensor_timestamp") ptr0

instance Marshal.WriteRaw SDL_SensorEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_SensorEvent type'2 reserved3 timestamp4 which5 data'6 sensor_timestamp7 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"which") ptr0 which5
              >> HasCField.writeRaw (BG.Proxy @"data'") ptr0 data'6
              >> HasCField.writeRaw (BG.Proxy @"sensor_timestamp") ptr0 sensor_timestamp7

deriving via Marshal.EquivStorable SDL_SensorEvent instance BG.Storable SDL_SensorEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_SensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_SensorEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , data' = BG.getField @"data'" x0
            , sensor_timestamp = BG.getField @"sensor_timestamp" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_SensorEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_SensorEvent "type'" where
  type
    CFieldType SDL_SensorEvent "type'" =
      SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_SensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_SensorEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , data' = BG.getField @"data'" x0
            , sensor_timestamp = BG.getField @"sensor_timestamp" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_SensorEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_SensorEvent "reserved" where
  type
    CFieldType SDL_SensorEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_SensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_SensorEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , which = BG.getField @"which" x0
            , data' = BG.getField @"data'" x0
            , sensor_timestamp = BG.getField @"sensor_timestamp" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_SensorEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_SensorEvent "timestamp" where
  type
    CFieldType SDL_SensorEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Sensor.SDL_SensorID)
  => BG.CompatHasField.HasField "which" SDL_SensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_SensorEvent
            { which = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , data' = BG.getField @"data'" x0
            , sensor_timestamp = BG.getField @"sensor_timestamp" x0
            }
      , BG.getField @"which" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Sensor.SDL_SensorID)
  => BG.HasField "which" (BG.Ptr SDL_SensorEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"which")

instance HasCField.HasCField SDL_SensorEvent "which" where
  type
    CFieldType SDL_SensorEvent "which" =
      SDL3.Sys.Bindgen.Sensor.SDL_SensorID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ CA.ConstantArray 6 BG.CFloat)
  => BG.CompatHasField.HasField "data'" SDL_SensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_SensorEvent
            { data' = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , sensor_timestamp = BG.getField @"sensor_timestamp" x0
            }
      , BG.getField @"data'" x0
      )

instance
  (ty ~ CA.ConstantArray 6 BG.CFloat)
  => BG.HasField "data'" (BG.Ptr SDL_SensorEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data'")

instance HasCField.HasCField SDL_SensorEvent "data'" where
  type
    CFieldType SDL_SensorEvent "data'" =
      CA.ConstantArray 6 BG.CFloat

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "sensor_timestamp" SDL_SensorEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_SensorEvent
            { sensor_timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , which = BG.getField @"which" x0
            , data' = BG.getField @"data'" x0
            }
      , BG.getField @"sensor_timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "sensor_timestamp" (BG.Ptr SDL_SensorEvent) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"sensor_timestamp")

instance HasCField.HasCField SDL_SensorEvent "sensor_timestamp" where
  type
    CFieldType SDL_SensorEvent "sensor_timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 48

-- | The \"quit requested\" event
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_QuitEvent@, defined at @SDL3\/SDL_events.h 978:16@
data SDL_QuitEvent = SDL_QuitEvent
  { type' :: SDL_EventType
  -- ^ SDL_EVENT_QUIT
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 980:19@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 981:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 982:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_QuitEvent where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_QuitEvent where
  readRaw =
    \ptr0 ->
      pure SDL_QuitEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0

instance Marshal.WriteRaw SDL_QuitEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_QuitEvent type'2 reserved3 timestamp4 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4

deriving via Marshal.EquivStorable SDL_QuitEvent instance BG.Storable SDL_QuitEvent

instance
  (ty ~ SDL_EventType)
  => BG.CompatHasField.HasField "type'" SDL_QuitEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_QuitEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_EventType)
  => BG.HasField "type'" (BG.Ptr SDL_QuitEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_QuitEvent "type'" where
  type CFieldType SDL_QuitEvent "type'" = SDL_EventType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_QuitEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_QuitEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_QuitEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_QuitEvent "reserved" where
  type
    CFieldType SDL_QuitEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_QuitEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_QuitEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_QuitEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_QuitEvent "timestamp" where
  type
    CFieldType SDL_QuitEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

-- | A user-defined event type (event.user.*)
--
--     This event is unique; it is never created by SDL, but only by the application. The event can be pushed onto the event queue using @SDL_PushEvent()@. The contents of the structure members are completely up to the programmer; the only requirement is that \'\'\'type\'\'\' is a value obtained from @SDL_RegisterEvents()@.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_UserEvent@, defined at @SDL3\/SDL_events.h 996:16@
data SDL_UserEvent = SDL_UserEvent
  { type' :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ SDL_EVENT_USER through SDL_EVENT_LAST, Uint32 because these are not in the 'SDL_EventType' enumeration
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_events.h 998:12@
  , reserved :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_events.h 999:12@
  , timestamp :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ In nanoseconds, populated using SDL_GetTicksNS()
  --
  --          [C declaration]: @timestamp@, defined at @SDL3\/SDL_events.h 1000:12@
  , windowID :: SDL3.Sys.Bindgen.Video.SDL_WindowID
  -- ^ The associated window if any
  --
  --          [C declaration]: @windowID@, defined at @SDL3\/SDL_events.h 1001:18@
  , code :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ User defined event code
  --
  --          [C declaration]: @code@, defined at @SDL3\/SDL_events.h 1002:12@
  , data1 :: BG.Ptr BG.Void
  -- ^ User defined data pointer
  --
  --          [C declaration]: @data1@, defined at @SDL3\/SDL_events.h 1003:11@
  , data2 :: BG.Ptr BG.Void
  -- ^ User defined data pointer
  --
  --          [C declaration]: @data2@, defined at @SDL3\/SDL_events.h 1004:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_UserEvent where
  staticSizeOf = \_ -> (40 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_UserEvent where
  readRaw =
    \ptr0 ->
      pure SDL_UserEvent
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0
        <*> HasCField.readRaw (BG.Proxy @"timestamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"windowID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"code") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data2") ptr0

instance Marshal.WriteRaw SDL_UserEvent where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_UserEvent type'2 reserved3 timestamp4 windowID5 code6 data17 data28 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved3
              >> HasCField.writeRaw (BG.Proxy @"timestamp") ptr0 timestamp4
              >> HasCField.writeRaw (BG.Proxy @"windowID") ptr0 windowID5
              >> HasCField.writeRaw (BG.Proxy @"code") ptr0 code6
              >> HasCField.writeRaw (BG.Proxy @"data1") ptr0 data17
              >> HasCField.writeRaw (BG.Proxy @"data2") ptr0 data28

deriving via Marshal.EquivStorable SDL_UserEvent instance BG.Storable SDL_UserEvent

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "type'" SDL_UserEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_UserEvent
            { type' = y1
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , code = BG.getField @"code" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "type'" (BG.Ptr SDL_UserEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_UserEvent "type'" where
  type
    CFieldType SDL_UserEvent "type'" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "reserved" SDL_UserEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_UserEvent
            { reserved = y1
            , type' = BG.getField @"type'" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , code = BG.getField @"code" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "reserved" (BG.Ptr SDL_UserEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_UserEvent "reserved" where
  type
    CFieldType SDL_UserEvent "reserved" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "timestamp" SDL_UserEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_UserEvent
            { timestamp = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , windowID = BG.getField @"windowID" x0
            , code = BG.getField @"code" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"timestamp" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "timestamp" (BG.Ptr SDL_UserEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"timestamp")

instance HasCField.HasCField SDL_UserEvent "timestamp" where
  type
    CFieldType SDL_UserEvent "timestamp" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.CompatHasField.HasField "windowID" SDL_UserEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_UserEvent
            { windowID = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , code = BG.getField @"code" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"windowID" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Video.SDL_WindowID)
  => BG.HasField "windowID" (BG.Ptr SDL_UserEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"windowID")

instance HasCField.HasCField SDL_UserEvent "windowID" where
  type
    CFieldType SDL_UserEvent "windowID" =
      SDL3.Sys.Bindgen.Video.SDL_WindowID

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "code" SDL_UserEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_UserEvent
            { code = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , data1 = BG.getField @"data1" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"code" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "code" (BG.Ptr SDL_UserEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"code")

instance HasCField.HasCField SDL_UserEvent "code" where
  type
    CFieldType SDL_UserEvent "code" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "data1" SDL_UserEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_UserEvent
            { data1 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , code = BG.getField @"code" x0
            , data2 = BG.getField @"data2" x0
            }
      , BG.getField @"data1" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "data1" (BG.Ptr SDL_UserEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data1")

instance HasCField.HasCField SDL_UserEvent "data1" where
  type
    CFieldType SDL_UserEvent "data1" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "data2" SDL_UserEvent ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_UserEvent
            { data2 = y1
            , type' = BG.getField @"type'" x0
            , reserved = BG.getField @"reserved" x0
            , timestamp = BG.getField @"timestamp" x0
            , windowID = BG.getField @"windowID" x0
            , code = BG.getField @"code" x0
            , data1 = BG.getField @"data1" x0
            }
      , BG.getField @"data2" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "data2" (BG.Ptr SDL_UserEvent) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data2")

instance HasCField.HasCField SDL_UserEvent "data2" where
  type
    CFieldType SDL_UserEvent "data2" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 32

-- | The structure for all events in SDL.
--
--     The 'SDL_Event' structure is the core of all event handling in SDL. 'SDL_Event' is a union of all event structures used in SDL.
--
--     @since 3.2.0
--
--     [C declaration]: @union SDL_Event@, defined at @SDL3\/SDL_events.h 1016:15@
newtype SDL_Event = SDL_Event
  { unwrap :: BG.ByteArray
  }
  deriving stock (BG.Generic)

deriving via BG.SizedByteArray 128 8 instance Marshal.StaticSize SDL_Event

deriving via BG.SizedByteArray 128 8 instance Marshal.ReadRaw SDL_Event

deriving via BG.SizedByteArray 128 8 instance Marshal.WriteRaw SDL_Event

deriving via Marshal.EquivStorable SDL_Event instance BG.Storable SDL_Event

deriving via BG.SizedByteArray 128 8 instance Union.IsUnion SDL_Event

-- | Event type, shared with all events, Uint32 to cover user events which are not in the 'SDL_EventType' enumeration
--
--     [C declaration]: @type@, defined at @SDL3\/SDL_events.h 1018:12@
instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "type'" SDL_Event ty
  where
  getField = BG.getUnionPayload

-- | Event type, shared with all events, Uint32 to cover user events which are not in the 'SDL_EventType' enumeration
--
--     [C declaration]: @type@, defined at @SDL3\/SDL_events.h 1018:12@
instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "type'" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"type'" x0)

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "type'" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_Event "type'" where
  type
    CFieldType SDL_Event "type'" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | Common event data
--
--     [C declaration]: @common@, defined at @SDL3\/SDL_events.h 1019:21@
instance (ty ~ SDL_CommonEvent) => BG.HasField "common" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Common event data
--
--     [C declaration]: @common@, defined at @SDL3\/SDL_events.h 1019:21@
instance
  (ty ~ SDL_CommonEvent)
  => BG.CompatHasField.HasField "common" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"common" x0)

instance
  (ty ~ SDL_CommonEvent)
  => BG.HasField "common" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"common")

instance HasCField.HasCField SDL_Event "common" where
  type CFieldType SDL_Event "common" = SDL_CommonEvent

  offset# = \_ -> \_ -> 0

-- | Display event data
--
--     [C declaration]: @display@, defined at @SDL3\/SDL_events.h 1020:22@
instance (ty ~ SDL_DisplayEvent) => BG.HasField "display" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Display event data
--
--     [C declaration]: @display@, defined at @SDL3\/SDL_events.h 1020:22@
instance
  (ty ~ SDL_DisplayEvent)
  => BG.CompatHasField.HasField "display" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"display" x0)

instance
  (ty ~ SDL_DisplayEvent)
  => BG.HasField "display" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"display")

instance HasCField.HasCField SDL_Event "display" where
  type
    CFieldType SDL_Event "display" =
      SDL_DisplayEvent

  offset# = \_ -> \_ -> 0

-- | Window event data
--
--     [C declaration]: @window@, defined at @SDL3\/SDL_events.h 1021:21@
instance (ty ~ SDL_WindowEvent) => BG.HasField "window" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Window event data
--
--     [C declaration]: @window@, defined at @SDL3\/SDL_events.h 1021:21@
instance
  (ty ~ SDL_WindowEvent)
  => BG.CompatHasField.HasField "window" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"window" x0)

instance
  (ty ~ SDL_WindowEvent)
  => BG.HasField "window" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"window")

instance HasCField.HasCField SDL_Event "window" where
  type CFieldType SDL_Event "window" = SDL_WindowEvent

  offset# = \_ -> \_ -> 0

-- | Keyboard device change event data
--
--     [C declaration]: @kdevice@, defined at @SDL3\/SDL_events.h 1022:29@
instance
  (ty ~ SDL_KeyboardDeviceEvent)
  => BG.HasField "kdevice" SDL_Event ty
  where
  getField = BG.getUnionPayload

-- | Keyboard device change event data
--
--     [C declaration]: @kdevice@, defined at @SDL3\/SDL_events.h 1022:29@
instance
  (ty ~ SDL_KeyboardDeviceEvent)
  => BG.CompatHasField.HasField "kdevice" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"kdevice" x0)

instance
  (ty ~ SDL_KeyboardDeviceEvent)
  => BG.HasField "kdevice" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"kdevice")

instance HasCField.HasCField SDL_Event "kdevice" where
  type
    CFieldType SDL_Event "kdevice" =
      SDL_KeyboardDeviceEvent

  offset# = \_ -> \_ -> 0

-- | Keyboard event data
--
--     [C declaration]: @key@, defined at @SDL3\/SDL_events.h 1023:23@
instance (ty ~ SDL_KeyboardEvent) => BG.HasField "key" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Keyboard event data
--
--     [C declaration]: @key@, defined at @SDL3\/SDL_events.h 1023:23@
instance
  (ty ~ SDL_KeyboardEvent)
  => BG.CompatHasField.HasField "key" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"key" x0)

instance
  (ty ~ SDL_KeyboardEvent)
  => BG.HasField "key" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"key")

instance HasCField.HasCField SDL_Event "key" where
  type CFieldType SDL_Event "key" = SDL_KeyboardEvent

  offset# = \_ -> \_ -> 0

-- | Text editing event data
--
--     [C declaration]: @edit@, defined at @SDL3\/SDL_events.h 1024:26@
instance (ty ~ SDL_TextEditingEvent) => BG.HasField "edit" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Text editing event data
--
--     [C declaration]: @edit@, defined at @SDL3\/SDL_events.h 1024:26@
instance
  (ty ~ SDL_TextEditingEvent)
  => BG.CompatHasField.HasField "edit" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"edit" x0)

instance
  (ty ~ SDL_TextEditingEvent)
  => BG.HasField "edit" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"edit")

instance HasCField.HasCField SDL_Event "edit" where
  type
    CFieldType SDL_Event "edit" =
      SDL_TextEditingEvent

  offset# = \_ -> \_ -> 0

-- | Text editing candidates event data
--
--     [C declaration]: @edit_candidates@, defined at @SDL3\/SDL_events.h 1025:36@
instance
  (ty ~ SDL_TextEditingCandidatesEvent)
  => BG.HasField "edit_candidates" SDL_Event ty
  where
  getField = BG.getUnionPayload

-- | Text editing candidates event data
--
--     [C declaration]: @edit_candidates@, defined at @SDL3\/SDL_events.h 1025:36@
instance
  (ty ~ SDL_TextEditingCandidatesEvent)
  => BG.CompatHasField.HasField "edit_candidates" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"edit_candidates" x0)

instance
  (ty ~ SDL_TextEditingCandidatesEvent)
  => BG.HasField "edit_candidates" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"edit_candidates")

instance HasCField.HasCField SDL_Event "edit_candidates" where
  type
    CFieldType SDL_Event "edit_candidates" =
      SDL_TextEditingCandidatesEvent

  offset# = \_ -> \_ -> 0

-- | Text input event data
--
--     [C declaration]: @text@, defined at @SDL3\/SDL_events.h 1026:24@
instance (ty ~ SDL_TextInputEvent) => BG.HasField "text" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Text input event data
--
--     [C declaration]: @text@, defined at @SDL3\/SDL_events.h 1026:24@
instance
  (ty ~ SDL_TextInputEvent)
  => BG.CompatHasField.HasField "text" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"text" x0)

instance
  (ty ~ SDL_TextInputEvent)
  => BG.HasField "text" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"text")

instance HasCField.HasCField SDL_Event "text" where
  type CFieldType SDL_Event "text" = SDL_TextInputEvent

  offset# = \_ -> \_ -> 0

-- | Mouse device change event data
--
--     [C declaration]: @mdevice@, defined at @SDL3\/SDL_events.h 1027:26@
instance (ty ~ SDL_MouseDeviceEvent) => BG.HasField "mdevice" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Mouse device change event data
--
--     [C declaration]: @mdevice@, defined at @SDL3\/SDL_events.h 1027:26@
instance
  (ty ~ SDL_MouseDeviceEvent)
  => BG.CompatHasField.HasField "mdevice" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"mdevice" x0)

instance
  (ty ~ SDL_MouseDeviceEvent)
  => BG.HasField "mdevice" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mdevice")

instance HasCField.HasCField SDL_Event "mdevice" where
  type
    CFieldType SDL_Event "mdevice" =
      SDL_MouseDeviceEvent

  offset# = \_ -> \_ -> 0

-- | Mouse motion event data
--
--     [C declaration]: @motion@, defined at @SDL3\/SDL_events.h 1028:26@
instance (ty ~ SDL_MouseMotionEvent) => BG.HasField "motion" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Mouse motion event data
--
--     [C declaration]: @motion@, defined at @SDL3\/SDL_events.h 1028:26@
instance
  (ty ~ SDL_MouseMotionEvent)
  => BG.CompatHasField.HasField "motion" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"motion" x0)

instance
  (ty ~ SDL_MouseMotionEvent)
  => BG.HasField "motion" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"motion")

instance HasCField.HasCField SDL_Event "motion" where
  type
    CFieldType SDL_Event "motion" =
      SDL_MouseMotionEvent

  offset# = \_ -> \_ -> 0

-- | Mouse button event data
--
--     [C declaration]: @button@, defined at @SDL3\/SDL_events.h 1029:26@
instance (ty ~ SDL_MouseButtonEvent) => BG.HasField "button" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Mouse button event data
--
--     [C declaration]: @button@, defined at @SDL3\/SDL_events.h 1029:26@
instance
  (ty ~ SDL_MouseButtonEvent)
  => BG.CompatHasField.HasField "button" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"button" x0)

instance
  (ty ~ SDL_MouseButtonEvent)
  => BG.HasField "button" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"button")

instance HasCField.HasCField SDL_Event "button" where
  type
    CFieldType SDL_Event "button" =
      SDL_MouseButtonEvent

  offset# = \_ -> \_ -> 0

-- | Mouse wheel event data
--
--     [C declaration]: @wheel@, defined at @SDL3\/SDL_events.h 1030:25@
instance (ty ~ SDL_MouseWheelEvent) => BG.HasField "wheel" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Mouse wheel event data
--
--     [C declaration]: @wheel@, defined at @SDL3\/SDL_events.h 1030:25@
instance
  (ty ~ SDL_MouseWheelEvent)
  => BG.CompatHasField.HasField "wheel" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"wheel" x0)

instance
  (ty ~ SDL_MouseWheelEvent)
  => BG.HasField "wheel" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"wheel")

instance HasCField.HasCField SDL_Event "wheel" where
  type
    CFieldType SDL_Event "wheel" =
      SDL_MouseWheelEvent

  offset# = \_ -> \_ -> 0

-- | Joystick device change event data
--
--     [C declaration]: @jdevice@, defined at @SDL3\/SDL_events.h 1031:24@
instance (ty ~ SDL_JoyDeviceEvent) => BG.HasField "jdevice" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Joystick device change event data
--
--     [C declaration]: @jdevice@, defined at @SDL3\/SDL_events.h 1031:24@
instance
  (ty ~ SDL_JoyDeviceEvent)
  => BG.CompatHasField.HasField "jdevice" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"jdevice" x0)

instance
  (ty ~ SDL_JoyDeviceEvent)
  => BG.HasField "jdevice" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"jdevice")

instance HasCField.HasCField SDL_Event "jdevice" where
  type
    CFieldType SDL_Event "jdevice" =
      SDL_JoyDeviceEvent

  offset# = \_ -> \_ -> 0

-- | Joystick axis event data
--
--     [C declaration]: @jaxis@, defined at @SDL3\/SDL_events.h 1032:22@
instance (ty ~ SDL_JoyAxisEvent) => BG.HasField "jaxis" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Joystick axis event data
--
--     [C declaration]: @jaxis@, defined at @SDL3\/SDL_events.h 1032:22@
instance
  (ty ~ SDL_JoyAxisEvent)
  => BG.CompatHasField.HasField "jaxis" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"jaxis" x0)

instance
  (ty ~ SDL_JoyAxisEvent)
  => BG.HasField "jaxis" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"jaxis")

instance HasCField.HasCField SDL_Event "jaxis" where
  type CFieldType SDL_Event "jaxis" = SDL_JoyAxisEvent

  offset# = \_ -> \_ -> 0

-- | Joystick ball event data
--
--     [C declaration]: @jball@, defined at @SDL3\/SDL_events.h 1033:22@
instance (ty ~ SDL_JoyBallEvent) => BG.HasField "jball" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Joystick ball event data
--
--     [C declaration]: @jball@, defined at @SDL3\/SDL_events.h 1033:22@
instance
  (ty ~ SDL_JoyBallEvent)
  => BG.CompatHasField.HasField "jball" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"jball" x0)

instance
  (ty ~ SDL_JoyBallEvent)
  => BG.HasField "jball" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"jball")

instance HasCField.HasCField SDL_Event "jball" where
  type CFieldType SDL_Event "jball" = SDL_JoyBallEvent

  offset# = \_ -> \_ -> 0

-- | Joystick hat event data
--
--     [C declaration]: @jhat@, defined at @SDL3\/SDL_events.h 1034:21@
instance (ty ~ SDL_JoyHatEvent) => BG.HasField "jhat" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Joystick hat event data
--
--     [C declaration]: @jhat@, defined at @SDL3\/SDL_events.h 1034:21@
instance
  (ty ~ SDL_JoyHatEvent)
  => BG.CompatHasField.HasField "jhat" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"jhat" x0)

instance
  (ty ~ SDL_JoyHatEvent)
  => BG.HasField "jhat" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"jhat")

instance HasCField.HasCField SDL_Event "jhat" where
  type CFieldType SDL_Event "jhat" = SDL_JoyHatEvent

  offset# = \_ -> \_ -> 0

-- | Joystick button event data
--
--     [C declaration]: @jbutton@, defined at @SDL3\/SDL_events.h 1035:24@
instance (ty ~ SDL_JoyButtonEvent) => BG.HasField "jbutton" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Joystick button event data
--
--     [C declaration]: @jbutton@, defined at @SDL3\/SDL_events.h 1035:24@
instance
  (ty ~ SDL_JoyButtonEvent)
  => BG.CompatHasField.HasField "jbutton" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"jbutton" x0)

instance
  (ty ~ SDL_JoyButtonEvent)
  => BG.HasField "jbutton" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"jbutton")

instance HasCField.HasCField SDL_Event "jbutton" where
  type
    CFieldType SDL_Event "jbutton" =
      SDL_JoyButtonEvent

  offset# = \_ -> \_ -> 0

-- | Joystick battery event data
--
--     [C declaration]: @jbattery@, defined at @SDL3\/SDL_events.h 1036:25@
instance (ty ~ SDL_JoyBatteryEvent) => BG.HasField "jbattery" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Joystick battery event data
--
--     [C declaration]: @jbattery@, defined at @SDL3\/SDL_events.h 1036:25@
instance
  (ty ~ SDL_JoyBatteryEvent)
  => BG.CompatHasField.HasField "jbattery" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"jbattery" x0)

instance
  (ty ~ SDL_JoyBatteryEvent)
  => BG.HasField "jbattery" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"jbattery")

instance HasCField.HasCField SDL_Event "jbattery" where
  type
    CFieldType SDL_Event "jbattery" =
      SDL_JoyBatteryEvent

  offset# = \_ -> \_ -> 0

-- | Gamepad device event data
--
--     [C declaration]: @gdevice@, defined at @SDL3\/SDL_events.h 1037:28@
instance
  (ty ~ SDL_GamepadDeviceEvent)
  => BG.HasField "gdevice" SDL_Event ty
  where
  getField = BG.getUnionPayload

-- | Gamepad device event data
--
--     [C declaration]: @gdevice@, defined at @SDL3\/SDL_events.h 1037:28@
instance
  (ty ~ SDL_GamepadDeviceEvent)
  => BG.CompatHasField.HasField "gdevice" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"gdevice" x0)

instance
  (ty ~ SDL_GamepadDeviceEvent)
  => BG.HasField "gdevice" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"gdevice")

instance HasCField.HasCField SDL_Event "gdevice" where
  type
    CFieldType SDL_Event "gdevice" =
      SDL_GamepadDeviceEvent

  offset# = \_ -> \_ -> 0

-- | Gamepad axis event data
--
--     [C declaration]: @gaxis@, defined at @SDL3\/SDL_events.h 1038:26@
instance (ty ~ SDL_GamepadAxisEvent) => BG.HasField "gaxis" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Gamepad axis event data
--
--     [C declaration]: @gaxis@, defined at @SDL3\/SDL_events.h 1038:26@
instance
  (ty ~ SDL_GamepadAxisEvent)
  => BG.CompatHasField.HasField "gaxis" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"gaxis" x0)

instance
  (ty ~ SDL_GamepadAxisEvent)
  => BG.HasField "gaxis" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"gaxis")

instance HasCField.HasCField SDL_Event "gaxis" where
  type
    CFieldType SDL_Event "gaxis" =
      SDL_GamepadAxisEvent

  offset# = \_ -> \_ -> 0

-- | Gamepad button event data
--
--     [C declaration]: @gbutton@, defined at @SDL3\/SDL_events.h 1039:28@
instance
  (ty ~ SDL_GamepadButtonEvent)
  => BG.HasField "gbutton" SDL_Event ty
  where
  getField = BG.getUnionPayload

-- | Gamepad button event data
--
--     [C declaration]: @gbutton@, defined at @SDL3\/SDL_events.h 1039:28@
instance
  (ty ~ SDL_GamepadButtonEvent)
  => BG.CompatHasField.HasField "gbutton" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"gbutton" x0)

instance
  (ty ~ SDL_GamepadButtonEvent)
  => BG.HasField "gbutton" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"gbutton")

instance HasCField.HasCField SDL_Event "gbutton" where
  type
    CFieldType SDL_Event "gbutton" =
      SDL_GamepadButtonEvent

  offset# = \_ -> \_ -> 0

-- | Gamepad touchpad event data
--
--     [C declaration]: @gtouchpad@, defined at @SDL3\/SDL_events.h 1040:30@
instance
  (ty ~ SDL_GamepadTouchpadEvent)
  => BG.HasField "gtouchpad" SDL_Event ty
  where
  getField = BG.getUnionPayload

-- | Gamepad touchpad event data
--
--     [C declaration]: @gtouchpad@, defined at @SDL3\/SDL_events.h 1040:30@
instance
  (ty ~ SDL_GamepadTouchpadEvent)
  => BG.CompatHasField.HasField "gtouchpad" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"gtouchpad" x0)

instance
  (ty ~ SDL_GamepadTouchpadEvent)
  => BG.HasField "gtouchpad" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"gtouchpad")

instance HasCField.HasCField SDL_Event "gtouchpad" where
  type
    CFieldType SDL_Event "gtouchpad" =
      SDL_GamepadTouchpadEvent

  offset# = \_ -> \_ -> 0

-- | Gamepad sensor event data
--
--     [C declaration]: @gsensor@, defined at @SDL3\/SDL_events.h 1041:28@
instance
  (ty ~ SDL_GamepadSensorEvent)
  => BG.HasField "gsensor" SDL_Event ty
  where
  getField = BG.getUnionPayload

-- | Gamepad sensor event data
--
--     [C declaration]: @gsensor@, defined at @SDL3\/SDL_events.h 1041:28@
instance
  (ty ~ SDL_GamepadSensorEvent)
  => BG.CompatHasField.HasField "gsensor" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"gsensor" x0)

instance
  (ty ~ SDL_GamepadSensorEvent)
  => BG.HasField "gsensor" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"gsensor")

instance HasCField.HasCField SDL_Event "gsensor" where
  type
    CFieldType SDL_Event "gsensor" =
      SDL_GamepadSensorEvent

  offset# = \_ -> \_ -> 0

-- | Audio device event data
--
--     [C declaration]: @adevice@, defined at @SDL3\/SDL_events.h 1042:26@
instance (ty ~ SDL_AudioDeviceEvent) => BG.HasField "adevice" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Audio device event data
--
--     [C declaration]: @adevice@, defined at @SDL3\/SDL_events.h 1042:26@
instance
  (ty ~ SDL_AudioDeviceEvent)
  => BG.CompatHasField.HasField "adevice" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"adevice" x0)

instance
  (ty ~ SDL_AudioDeviceEvent)
  => BG.HasField "adevice" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"adevice")

instance HasCField.HasCField SDL_Event "adevice" where
  type
    CFieldType SDL_Event "adevice" =
      SDL_AudioDeviceEvent

  offset# = \_ -> \_ -> 0

-- | Camera device event data
--
--     [C declaration]: @cdevice@, defined at @SDL3\/SDL_events.h 1043:27@
instance
  (ty ~ SDL_CameraDeviceEvent)
  => BG.HasField "cdevice" SDL_Event ty
  where
  getField = BG.getUnionPayload

-- | Camera device event data
--
--     [C declaration]: @cdevice@, defined at @SDL3\/SDL_events.h 1043:27@
instance
  (ty ~ SDL_CameraDeviceEvent)
  => BG.CompatHasField.HasField "cdevice" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"cdevice" x0)

instance
  (ty ~ SDL_CameraDeviceEvent)
  => BG.HasField "cdevice" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"cdevice")

instance HasCField.HasCField SDL_Event "cdevice" where
  type
    CFieldType SDL_Event "cdevice" =
      SDL_CameraDeviceEvent

  offset# = \_ -> \_ -> 0

-- | Sensor event data
--
--     [C declaration]: @sensor@, defined at @SDL3\/SDL_events.h 1044:21@
instance (ty ~ SDL_SensorEvent) => BG.HasField "sensor" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Sensor event data
--
--     [C declaration]: @sensor@, defined at @SDL3\/SDL_events.h 1044:21@
instance
  (ty ~ SDL_SensorEvent)
  => BG.CompatHasField.HasField "sensor" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"sensor" x0)

instance
  (ty ~ SDL_SensorEvent)
  => BG.HasField "sensor" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"sensor")

instance HasCField.HasCField SDL_Event "sensor" where
  type CFieldType SDL_Event "sensor" = SDL_SensorEvent

  offset# = \_ -> \_ -> 0

-- | Quit request event data
--
--     [C declaration]: @quit@, defined at @SDL3\/SDL_events.h 1045:19@
instance (ty ~ SDL_QuitEvent) => BG.HasField "quit" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Quit request event data
--
--     [C declaration]: @quit@, defined at @SDL3\/SDL_events.h 1045:19@
instance
  (ty ~ SDL_QuitEvent)
  => BG.CompatHasField.HasField "quit" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"quit" x0)

instance
  (ty ~ SDL_QuitEvent)
  => BG.HasField "quit" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"quit")

instance HasCField.HasCField SDL_Event "quit" where
  type CFieldType SDL_Event "quit" = SDL_QuitEvent

  offset# = \_ -> \_ -> 0

-- | Custom event data
--
--     [C declaration]: @user@, defined at @SDL3\/SDL_events.h 1046:19@
instance (ty ~ SDL_UserEvent) => BG.HasField "user" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Custom event data
--
--     [C declaration]: @user@, defined at @SDL3\/SDL_events.h 1046:19@
instance
  (ty ~ SDL_UserEvent)
  => BG.CompatHasField.HasField "user" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"user" x0)

instance
  (ty ~ SDL_UserEvent)
  => BG.HasField "user" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"user")

instance HasCField.HasCField SDL_Event "user" where
  type CFieldType SDL_Event "user" = SDL_UserEvent

  offset# = \_ -> \_ -> 0

-- | Touch finger event data
--
--     [C declaration]: @tfinger@, defined at @SDL3\/SDL_events.h 1047:26@
instance (ty ~ SDL_TouchFingerEvent) => BG.HasField "tfinger" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Touch finger event data
--
--     [C declaration]: @tfinger@, defined at @SDL3\/SDL_events.h 1047:26@
instance
  (ty ~ SDL_TouchFingerEvent)
  => BG.CompatHasField.HasField "tfinger" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"tfinger" x0)

instance
  (ty ~ SDL_TouchFingerEvent)
  => BG.HasField "tfinger" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"tfinger")

instance HasCField.HasCField SDL_Event "tfinger" where
  type
    CFieldType SDL_Event "tfinger" =
      SDL_TouchFingerEvent

  offset# = \_ -> \_ -> 0

-- | Pinch event data
--
--     [C declaration]: @pinch@, defined at @SDL3\/SDL_events.h 1048:26@
instance (ty ~ SDL_PinchFingerEvent) => BG.HasField "pinch" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Pinch event data
--
--     [C declaration]: @pinch@, defined at @SDL3\/SDL_events.h 1048:26@
instance
  (ty ~ SDL_PinchFingerEvent)
  => BG.CompatHasField.HasField "pinch" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"pinch" x0)

instance
  (ty ~ SDL_PinchFingerEvent)
  => BG.HasField "pinch" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pinch")

instance HasCField.HasCField SDL_Event "pinch" where
  type
    CFieldType SDL_Event "pinch" =
      SDL_PinchFingerEvent

  offset# = \_ -> \_ -> 0

-- | Pen proximity event data
--
--     [C declaration]: @pproximity@, defined at @SDL3\/SDL_events.h 1049:27@
instance
  (ty ~ SDL_PenProximityEvent)
  => BG.HasField "pproximity" SDL_Event ty
  where
  getField = BG.getUnionPayload

-- | Pen proximity event data
--
--     [C declaration]: @pproximity@, defined at @SDL3\/SDL_events.h 1049:27@
instance
  (ty ~ SDL_PenProximityEvent)
  => BG.CompatHasField.HasField "pproximity" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"pproximity" x0)

instance
  (ty ~ SDL_PenProximityEvent)
  => BG.HasField "pproximity" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pproximity")

instance HasCField.HasCField SDL_Event "pproximity" where
  type
    CFieldType SDL_Event "pproximity" =
      SDL_PenProximityEvent

  offset# = \_ -> \_ -> 0

-- | Pen tip touching event data
--
--     [C declaration]: @ptouch@, defined at @SDL3\/SDL_events.h 1050:23@
instance (ty ~ SDL_PenTouchEvent) => BG.HasField "ptouch" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Pen tip touching event data
--
--     [C declaration]: @ptouch@, defined at @SDL3\/SDL_events.h 1050:23@
instance
  (ty ~ SDL_PenTouchEvent)
  => BG.CompatHasField.HasField "ptouch" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"ptouch" x0)

instance
  (ty ~ SDL_PenTouchEvent)
  => BG.HasField "ptouch" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"ptouch")

instance HasCField.HasCField SDL_Event "ptouch" where
  type
    CFieldType SDL_Event "ptouch" =
      SDL_PenTouchEvent

  offset# = \_ -> \_ -> 0

-- | Pen motion event data
--
--     [C declaration]: @pmotion@, defined at @SDL3\/SDL_events.h 1051:24@
instance (ty ~ SDL_PenMotionEvent) => BG.HasField "pmotion" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Pen motion event data
--
--     [C declaration]: @pmotion@, defined at @SDL3\/SDL_events.h 1051:24@
instance
  (ty ~ SDL_PenMotionEvent)
  => BG.CompatHasField.HasField "pmotion" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"pmotion" x0)

instance
  (ty ~ SDL_PenMotionEvent)
  => BG.HasField "pmotion" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pmotion")

instance HasCField.HasCField SDL_Event "pmotion" where
  type
    CFieldType SDL_Event "pmotion" =
      SDL_PenMotionEvent

  offset# = \_ -> \_ -> 0

-- | Pen button event data
--
--     [C declaration]: @pbutton@, defined at @SDL3\/SDL_events.h 1052:24@
instance (ty ~ SDL_PenButtonEvent) => BG.HasField "pbutton" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Pen button event data
--
--     [C declaration]: @pbutton@, defined at @SDL3\/SDL_events.h 1052:24@
instance
  (ty ~ SDL_PenButtonEvent)
  => BG.CompatHasField.HasField "pbutton" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"pbutton" x0)

instance
  (ty ~ SDL_PenButtonEvent)
  => BG.HasField "pbutton" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pbutton")

instance HasCField.HasCField SDL_Event "pbutton" where
  type
    CFieldType SDL_Event "pbutton" =
      SDL_PenButtonEvent

  offset# = \_ -> \_ -> 0

-- | Pen axis event data
--
--     [C declaration]: @paxis@, defined at @SDL3\/SDL_events.h 1053:22@
instance (ty ~ SDL_PenAxisEvent) => BG.HasField "paxis" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Pen axis event data
--
--     [C declaration]: @paxis@, defined at @SDL3\/SDL_events.h 1053:22@
instance
  (ty ~ SDL_PenAxisEvent)
  => BG.CompatHasField.HasField "paxis" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"paxis" x0)

instance
  (ty ~ SDL_PenAxisEvent)
  => BG.HasField "paxis" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"paxis")

instance HasCField.HasCField SDL_Event "paxis" where
  type CFieldType SDL_Event "paxis" = SDL_PenAxisEvent

  offset# = \_ -> \_ -> 0

-- | Render event data
--
--     [C declaration]: @render@, defined at @SDL3\/SDL_events.h 1054:21@
instance (ty ~ SDL_RenderEvent) => BG.HasField "render" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Render event data
--
--     [C declaration]: @render@, defined at @SDL3\/SDL_events.h 1054:21@
instance
  (ty ~ SDL_RenderEvent)
  => BG.CompatHasField.HasField "render" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"render" x0)

instance
  (ty ~ SDL_RenderEvent)
  => BG.HasField "render" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"render")

instance HasCField.HasCField SDL_Event "render" where
  type CFieldType SDL_Event "render" = SDL_RenderEvent

  offset# = \_ -> \_ -> 0

-- | Drag and drop event data
--
--     [C declaration]: @drop@, defined at @SDL3\/SDL_events.h 1055:19@
instance (ty ~ SDL_DropEvent) => BG.HasField "drop" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Drag and drop event data
--
--     [C declaration]: @drop@, defined at @SDL3\/SDL_events.h 1055:19@
instance
  (ty ~ SDL_DropEvent)
  => BG.CompatHasField.HasField "drop" SDL_Event ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"drop" x0)

instance
  (ty ~ SDL_DropEvent)
  => BG.HasField "drop" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"drop")

instance HasCField.HasCField SDL_Event "drop" where
  type CFieldType SDL_Event "drop" = SDL_DropEvent

  offset# = \_ -> \_ -> 0

-- | Clipboard event data
--
--     [C declaration]: @clipboard@, defined at @SDL3\/SDL_events.h 1056:24@
instance (ty ~ SDL_ClipboardEvent) => BG.HasField "clipboard" SDL_Event ty where
  getField = BG.getUnionPayload

-- | Clipboard event data
--
--     [C declaration]: @clipboard@, defined at @SDL3\/SDL_events.h 1056:24@
instance
  (ty ~ SDL_ClipboardEvent)
  => BG.CompatHasField.HasField "clipboard" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"clipboard" x0)

instance
  (ty ~ SDL_ClipboardEvent)
  => BG.HasField "clipboard" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"clipboard")

instance HasCField.HasCField SDL_Event "clipboard" where
  type
    CFieldType SDL_Event "clipboard" =
      SDL_ClipboardEvent

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @padding@, defined at @SDL3\/SDL_events.h 1071:11@
instance
  (ty ~ CA.ConstantArray 128 SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding" SDL_Event ty
  where
  getField = BG.getUnionPayload

-- | [C declaration]: @padding@, defined at @SDL3\/SDL_events.h 1071:11@
instance
  (ty ~ CA.ConstantArray 128 SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding" SDL_Event ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"padding" x0)

instance
  (ty ~ CA.ConstantArray 128 SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding" (BG.Ptr SDL_Event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding")

instance HasCField.HasCField SDL_Event "padding" where
  type
    CFieldType SDL_Event "padding" =
      CA.ConstantArray 128 SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 0

-- | The type of action to request from @SDL_PeepEvents()@.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_EventAction@, defined at @SDL3\/SDL_events.h 1109:14@
newtype SDL_EventAction = SDL_EventAction
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_EventAction where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_EventAction where
  readRaw =
    \ptr0 ->
      pure SDL_EventAction
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_EventAction where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_EventAction unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_EventAction instance BG.Storable SDL_EventAction

deriving via BG.CUInt instance BG.Prim SDL_EventAction

instance CEnum.CEnum SDL_EventAction where
  type CEnumZ SDL_EventAction = BG.CUInt

  toCEnum = SDL_EventAction

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_ADDEVENT")
        , (1, BG.singleton "SDL_PEEKEVENT")
        , (2, BG.singleton "SDL_GETEVENT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_EventAction"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_EventAction"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_EventAction where
  minDeclaredValue = SDL_ADDEVENT

  maxDeclaredValue = SDL_GETEVENT

instance Show SDL_EventAction where
  showsPrec = CEnum.shows

instance Read SDL_EventAction where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_EventAction ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EventAction{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_EventAction) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EventAction "unwrap" where
  type CFieldType SDL_EventAction "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Add events to the back of the queue.
--
--     [C declaration]: @SDL_ADDEVENT@, defined at @SDL3\/SDL_events.h 1111:5@
pattern SDL_ADDEVENT :: SDL_EventAction
pattern SDL_ADDEVENT = SDL_EventAction 0

-- | Check but don\'t remove events from the queue front.
--
--     [C declaration]: @SDL_PEEKEVENT@, defined at @SDL3\/SDL_events.h 1112:5@
pattern SDL_PEEKEVENT :: SDL_EventAction
pattern SDL_PEEKEVENT = SDL_EventAction 1

-- | Retrieve\/remove events from the front of the queue.
--
--     [C declaration]: @SDL_GETEVENT@, defined at @SDL3\/SDL_events.h 1113:5@
pattern SDL_GETEVENT :: SDL_EventAction
pattern SDL_GETEVENT = SDL_EventAction 2

-- | Auxiliary type used by 'SDL_EventFilter'
--
--     [C declaration]: @SDL_EventFilter@, defined at @SDL3\/SDL_events.h 1413:24@
newtype SDL_EventFilter_Aux = SDL_EventFilter_Aux
  { unwrap :: BG.Ptr BG.Void -> BG.Ptr SDL_Event -> IO BG.CBool
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_EventFilter_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_eb1994b3ef52d185_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word8)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word8))

-- __unique:__ @toSDL_EventFilter_Aux@
hs_bindgen_eb1994b3ef52d185
  :: SDL_EventFilter_Aux
  -> IO (BG.FunPtr SDL_EventFilter_Aux)
hs_bindgen_eb1994b3ef52d185 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_eb1994b3ef52d185_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_EventFilter_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_fff801095df0ae67_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word8)
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @fromSDL_EventFilter_Aux@
hs_bindgen_fff801095df0ae67
  :: BG.FunPtr SDL_EventFilter_Aux
  -> SDL_EventFilter_Aux
hs_bindgen_fff801095df0ae67 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_fff801095df0ae67_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_EventFilter_Aux where
  toFunPtr = hs_bindgen_eb1994b3ef52d185

instance BG.FromFunPtr SDL_EventFilter_Aux where
  fromFunPtr = hs_bindgen_fff801095df0ae67

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr SDL_Event -> IO BG.CBool))
  => BG.CompatHasField.HasField "unwrap" SDL_EventFilter_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EventFilter_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr SDL_Event -> IO BG.CBool))
  => BG.HasField "unwrap" (BG.Ptr SDL_EventFilter_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EventFilter_Aux "unwrap" where
  type
    CFieldType SDL_EventFilter_Aux "unwrap" =
      BG.Ptr BG.Void -> BG.Ptr SDL_Event -> IO BG.CBool

  offset# = \_ -> \_ -> 0

-- | A function pointer used for callbacks that watch the event queue.
--
--     [@userdata@]: what was passed as @userdata@ to @SDL_SetEventFilter()@ or SDL_AddEventWatch, etc.
--
--     [@event@]: the event that triggered the callback.
--
--     [Returns]: true to permit event to be added to the queue, and false to disallow it. When used with SDL_AddEventWatch, the return value is ignored.
--
--     [Thread safety]: SDL may call this callback at any time from any thread; the application is responsible for locking resources the callback touches that need to be protected.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetEventFilter', 'sDL_AddEventWatch'
--
--     [C declaration]: @SDL_EventFilter@, defined at @SDL3\/SDL_events.h 1413:24@
newtype SDL_EventFilter = SDL_EventFilter
  { unwrap :: BG.FunPtr SDL_EventFilter_Aux
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.FunPtr SDL_EventFilter_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_EventFilter ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EventFilter{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_EventFilter_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_EventFilter) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EventFilter "unwrap" where
  type
    CFieldType SDL_EventFilter "unwrap" =
      BG.FunPtr SDL_EventFilter_Aux

  offset# = \_ -> \_ -> 0

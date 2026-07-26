-- | SDL offers touch input, on platforms that support it. It can manage multiple touch devices and track multiple fingers on those devices.
--
--     Touches are mostly dealt with through the event system, in the SDL_EVENT_FINGER_DOWN, SDL_EVENT_FINGER_MOTION, and SDL_EVENT_FINGER_UP events, but there are also functions to query for hardware details, etc.
--
--     The touch system, by default, will also send virtual mouse events; this can be useful for making a some desktop apps work on a phone without significant changes. For apps that care about mouse and touch input separately, they should ignore mouse events that have a @which@ field of SDL_TOUCH_MOUSEID. A unique ID for a touch device.
--
--     This ID is valid for the time the device is connected to the system, and is never reused for the lifetime of the application.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Touch.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Touch (
  module SDL3.Sys.Bindgen.Touch,

  -- * Function aliases
  SDL3.Sys.Touch.getTouchDevices,
  SDL3.Sys.Touch.getTouchDevicesSafe,
  SDL3.Sys.Touch.getTouchDeviceName,
  SDL3.Sys.Touch.getTouchDeviceNameSafe,
  SDL3.Sys.Touch.getTouchDeviceType,
  SDL3.Sys.Touch.getTouchDeviceTypeSafe,
  SDL3.Sys.Touch.getTouchFingers,
  SDL3.Sys.Touch.getTouchFingersSafe,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Touch
import SDL3.Sys.Bindgen.Touch.Safe qualified as Safe
import SDL3.Sys.Bindgen.Touch.Unsafe qualified as Unsafe

-- | Get a list of registered touch devices.
--
--     On some platforms SDL first sees the touch device if it was actually used. Therefore the returned list might be empty, although devices are available. After using all devices at least once the number will be correct.
--
--     [Returns]: a 0 terminated array of touch device IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTouchDevices@.
--                   The safe flavor is 'getTouchDevicesSafe'
--                   .
--
--     [C declaration]: @SDL_GetTouchDevices@, defined at @SDL3\/SDL_touch.h 140:43@
getTouchDevices
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of devices returned, may be NULL.
  -> IO (BG.Ptr SDL_TouchID)
getTouchDevices = Unsafe.sDL_GetTouchDevices

-- | Get a list of registered touch devices.
--
--     On some platforms SDL first sees the touch device if it was actually used. Therefore the returned list might be empty, although devices are available. After using all devices at least once the number will be correct.
--
--     [Returns]: a 0 terminated array of touch device IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTouchDevices@.
--                   The unsafe flavor is 'getTouchDevices'
--                   .
--
--     [C declaration]: @SDL_GetTouchDevices@, defined at @SDL3\/SDL_touch.h 140:43@
getTouchDevicesSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of devices returned, may be NULL.
  -> IO (BG.Ptr SDL_TouchID)
getTouchDevicesSafe = Safe.sDL_GetTouchDevices

-- | Get the touch device name as reported from the driver.
--
--     [Returns]: touch device name, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTouchDeviceName@.
--                   The safe flavor is 'getTouchDeviceNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetTouchDeviceName@, defined at @SDL3\/SDL_touch.h 151:42@
getTouchDeviceName
  :: SDL_TouchID
  -- ^
  --
  --           [@touchID@]: the touch device instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getTouchDeviceName = Unsafe.sDL_GetTouchDeviceName

-- | Get the touch device name as reported from the driver.
--
--     [Returns]: touch device name, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTouchDeviceName@.
--                   The unsafe flavor is 'getTouchDeviceName'
--                   .
--
--     [C declaration]: @SDL_GetTouchDeviceName@, defined at @SDL3\/SDL_touch.h 151:42@
getTouchDeviceNameSafe
  :: SDL_TouchID
  -- ^
  --
  --           [@touchID@]: the touch device instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getTouchDeviceNameSafe = Safe.sDL_GetTouchDeviceName

-- | Get the type of the given touch device.
--
--     [Returns]: touch device type.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTouchDeviceType@.
--                   The safe flavor is 'getTouchDeviceTypeSafe'
--                   .
--
--     [C declaration]: @SDL_GetTouchDeviceType@, defined at @SDL3\/SDL_touch.h 161:49@
getTouchDeviceType
  :: SDL_TouchID
  -- ^
  --
  --           [@touchID@]: the ID of a touch device.
  -> IO SDL_TouchDeviceType
getTouchDeviceType = Unsafe.sDL_GetTouchDeviceType

-- | Get the type of the given touch device.
--
--     [Returns]: touch device type.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTouchDeviceType@.
--                   The unsafe flavor is 'getTouchDeviceType'
--                   .
--
--     [C declaration]: @SDL_GetTouchDeviceType@, defined at @SDL3\/SDL_touch.h 161:49@
getTouchDeviceTypeSafe
  :: SDL_TouchID
  -- ^
  --
  --           [@touchID@]: the ID of a touch device.
  -> IO SDL_TouchDeviceType
getTouchDeviceTypeSafe = Safe.sDL_GetTouchDeviceType

-- | Get a list of active fingers for a given touch device.
--
--     [Returns]: a NULL terminated array of 'SDL_Finger' pointers or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTouchFingers@.
--                   The safe flavor is 'getTouchFingersSafe'
--                   .
--
--     [C declaration]: @SDL_GetTouchFingers@, defined at @SDL3\/SDL_touch.h 176:43@
getTouchFingers
  :: SDL_TouchID
  -- ^
  --
  --           [@touchID@]: the ID of a touch device.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of fingers returned, can be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_Finger))
getTouchFingers = Unsafe.sDL_GetTouchFingers

-- | Get a list of active fingers for a given touch device.
--
--     [Returns]: a NULL terminated array of 'SDL_Finger' pointers or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTouchFingers@.
--                   The unsafe flavor is 'getTouchFingers'
--                   .
--
--     [C declaration]: @SDL_GetTouchFingers@, defined at @SDL3\/SDL_touch.h 176:43@
getTouchFingersSafe
  :: SDL_TouchID
  -- ^
  --
  --           [@touchID@]: the ID of a touch device.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of fingers returned, can be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_Finger))
getTouchFingersSafe = Safe.sDL_GetTouchFingers

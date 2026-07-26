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
--     In order to use these functions, 'SDL3.Sys.Init.init' must have been called with the SDL_INIT_JOYSTICK flag. This causes SDL to scan the system for joysticks, and load appropriate drivers.
--
--     If you would like to receive joystick updates while the application is in the background, you should set the following hint before calling 'SDL3.Sys.Init.init': SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS
--
--     SDL can provide virtual joysticks as well: the app defines an imaginary controller with @'attachVirtualJoystick'@, and then can provide inputs for it via @'setJoystickVirtualAxis'@, @'setJoystickVirtualButton'@, etc. As this data is supplied, it will look like a normal joystick to SDL, just not backed by a hardware driver. This has been used to make unusual devices, like VR headset controllers, look like normal joysticks, or provide recording\/playback of game inputs, etc. The joystick structure used to identify an SDL joystick.
--
--     This is opaque data.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Joystick.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Joystick (
  module SDL3.Sys.Bindgen.Joystick,

  -- * Function aliases
  SDL3.Sys.Joystick.lockJoysticks,
  SDL3.Sys.Joystick.lockJoysticksSafe,
  SDL3.Sys.Joystick.unlockJoysticks,
  SDL3.Sys.Joystick.unlockJoysticksSafe,
  SDL3.Sys.Joystick.hasJoystick,
  SDL3.Sys.Joystick.hasJoystickSafe,
  SDL3.Sys.Joystick.getJoysticks,
  SDL3.Sys.Joystick.getJoysticksSafe,
  SDL3.Sys.Joystick.getJoystickNameForID,
  SDL3.Sys.Joystick.getJoystickNameForIDSafe,
  SDL3.Sys.Joystick.getJoystickPathForID,
  SDL3.Sys.Joystick.getJoystickPathForIDSafe,
  SDL3.Sys.Joystick.getJoystickPlayerIndexForID,
  SDL3.Sys.Joystick.getJoystickPlayerIndexForIDSafe,
  SDL3.Sys.Joystick.getJoystickGUIDForID,
  SDL3.Sys.Joystick.getJoystickGUIDForIDSafe,
  SDL3.Sys.Joystick.getJoystickVendorForID,
  SDL3.Sys.Joystick.getJoystickVendorForIDSafe,
  SDL3.Sys.Joystick.getJoystickProductForID,
  SDL3.Sys.Joystick.getJoystickProductForIDSafe,
  SDL3.Sys.Joystick.getJoystickProductVersionForID,
  SDL3.Sys.Joystick.getJoystickProductVersionForIDSafe,
  SDL3.Sys.Joystick.getJoystickTypeForID,
  SDL3.Sys.Joystick.getJoystickTypeForIDSafe,
  SDL3.Sys.Joystick.openJoystick,
  SDL3.Sys.Joystick.openJoystickSafe,
  SDL3.Sys.Joystick.getJoystickFromID,
  SDL3.Sys.Joystick.getJoystickFromIDSafe,
  SDL3.Sys.Joystick.getJoystickFromPlayerIndex,
  SDL3.Sys.Joystick.getJoystickFromPlayerIndexSafe,
  SDL3.Sys.Joystick.attachVirtualJoystick,
  SDL3.Sys.Joystick.attachVirtualJoystickSafe,
  SDL3.Sys.Joystick.detachVirtualJoystick,
  SDL3.Sys.Joystick.detachVirtualJoystickSafe,
  SDL3.Sys.Joystick.isJoystickVirtual,
  SDL3.Sys.Joystick.isJoystickVirtualSafe,
  SDL3.Sys.Joystick.setJoystickVirtualAxis,
  SDL3.Sys.Joystick.setJoystickVirtualAxisSafe,
  SDL3.Sys.Joystick.setJoystickVirtualBall,
  SDL3.Sys.Joystick.setJoystickVirtualBallSafe,
  SDL3.Sys.Joystick.setJoystickVirtualButton,
  SDL3.Sys.Joystick.setJoystickVirtualButtonSafe,
  SDL3.Sys.Joystick.setJoystickVirtualHat,
  SDL3.Sys.Joystick.setJoystickVirtualHatSafe,
  SDL3.Sys.Joystick.setJoystickVirtualTouchpad,
  SDL3.Sys.Joystick.setJoystickVirtualTouchpadSafe,
  SDL3.Sys.Joystick.sendJoystickVirtualSensorData,
  SDL3.Sys.Joystick.sendJoystickVirtualSensorDataSafe,
  SDL3.Sys.Joystick.getJoystickProperties,
  SDL3.Sys.Joystick.getJoystickPropertiesSafe,
  SDL3.Sys.Joystick.getJoystickName,
  SDL3.Sys.Joystick.getJoystickNameSafe,
  SDL3.Sys.Joystick.getJoystickPath,
  SDL3.Sys.Joystick.getJoystickPathSafe,
  SDL3.Sys.Joystick.getJoystickPlayerIndex,
  SDL3.Sys.Joystick.getJoystickPlayerIndexSafe,
  SDL3.Sys.Joystick.setJoystickPlayerIndex,
  SDL3.Sys.Joystick.setJoystickPlayerIndexSafe,
  SDL3.Sys.Joystick.getJoystickGUID,
  SDL3.Sys.Joystick.getJoystickGUIDSafe,
  SDL3.Sys.Joystick.getJoystickVendor,
  SDL3.Sys.Joystick.getJoystickVendorSafe,
  SDL3.Sys.Joystick.getJoystickProduct,
  SDL3.Sys.Joystick.getJoystickProductSafe,
  SDL3.Sys.Joystick.getJoystickProductVersion,
  SDL3.Sys.Joystick.getJoystickProductVersionSafe,
  SDL3.Sys.Joystick.getJoystickFirmwareVersion,
  SDL3.Sys.Joystick.getJoystickFirmwareVersionSafe,
  SDL3.Sys.Joystick.getJoystickSerial,
  SDL3.Sys.Joystick.getJoystickSerialSafe,
  SDL3.Sys.Joystick.getJoystickType,
  SDL3.Sys.Joystick.getJoystickTypeSafe,
  SDL3.Sys.Joystick.getJoystickGUIDInfo,
  SDL3.Sys.Joystick.getJoystickGUIDInfoSafe,
  SDL3.Sys.Joystick.joystickConnected,
  SDL3.Sys.Joystick.joystickConnectedSafe,
  SDL3.Sys.Joystick.getJoystickID,
  SDL3.Sys.Joystick.getJoystickIDSafe,
  SDL3.Sys.Joystick.getNumJoystickAxes,
  SDL3.Sys.Joystick.getNumJoystickAxesSafe,
  SDL3.Sys.Joystick.getNumJoystickBalls,
  SDL3.Sys.Joystick.getNumJoystickBallsSafe,
  SDL3.Sys.Joystick.getNumJoystickHats,
  SDL3.Sys.Joystick.getNumJoystickHatsSafe,
  SDL3.Sys.Joystick.getNumJoystickButtons,
  SDL3.Sys.Joystick.getNumJoystickButtonsSafe,
  SDL3.Sys.Joystick.setJoystickEventsEnabled,
  SDL3.Sys.Joystick.setJoystickEventsEnabledSafe,
  SDL3.Sys.Joystick.joystickEventsEnabled,
  SDL3.Sys.Joystick.joystickEventsEnabledSafe,
  SDL3.Sys.Joystick.updateJoysticks,
  SDL3.Sys.Joystick.updateJoysticksSafe,
  SDL3.Sys.Joystick.getJoystickAxis,
  SDL3.Sys.Joystick.getJoystickAxisSafe,
  SDL3.Sys.Joystick.getJoystickAxisInitialState,
  SDL3.Sys.Joystick.getJoystickAxisInitialStateSafe,
  SDL3.Sys.Joystick.getJoystickBall,
  SDL3.Sys.Joystick.getJoystickBallSafe,
  SDL3.Sys.Joystick.getJoystickHat,
  SDL3.Sys.Joystick.getJoystickHatSafe,
  SDL3.Sys.Joystick.getJoystickButton,
  SDL3.Sys.Joystick.getJoystickButtonSafe,
  SDL3.Sys.Joystick.rumbleJoystick,
  SDL3.Sys.Joystick.rumbleJoystickSafe,
  SDL3.Sys.Joystick.rumbleJoystickTriggers,
  SDL3.Sys.Joystick.rumbleJoystickTriggersSafe,
  SDL3.Sys.Joystick.setJoystickLED,
  SDL3.Sys.Joystick.setJoystickLEDSafe,
  SDL3.Sys.Joystick.sendJoystickEffect,
  SDL3.Sys.Joystick.sendJoystickEffectSafe,
  SDL3.Sys.Joystick.closeJoystick,
  SDL3.Sys.Joystick.closeJoystickSafe,
  SDL3.Sys.Joystick.getJoystickConnectionState,
  SDL3.Sys.Joystick.getJoystickConnectionStateSafe,
  SDL3.Sys.Joystick.getJoystickPowerInfo,
  SDL3.Sys.Joystick.getJoystickPowerInfoSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Guid qualified
import SDL3.Sys.Bindgen.Joystick
import SDL3.Sys.Bindgen.Joystick.Safe qualified as Safe
import SDL3.Sys.Bindgen.Joystick.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Power qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Sensor qualified
import SDL3.Sys.Bindgen.Stdinc qualified

-- | Locking for atomic access to the joystick API.
--
--     The SDL joystick functions are thread-safe, however you can lock the joysticks while processing to guarantee that the joystick list won\'t change and joystick and gamepad events will not be delivered.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LockJoysticks@.
--                   The safe flavor is 'lockJoysticksSafe'
--                   .
--
--     [C declaration]: @SDL_LockJoysticks@, defined at @SDL3\/SDL_joystick.h 189:34@
lockJoysticks :: IO ()
lockJoysticks = Unsafe.sDL_LockJoysticks

-- | Locking for atomic access to the joystick API.
--
--     The SDL joystick functions are thread-safe, however you can lock the joysticks while processing to guarantee that the joystick list won\'t change and joystick and gamepad events will not be delivered.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LockJoysticks@.
--                   The unsafe flavor is 'lockJoysticks'
--                   .
--
--     [C declaration]: @SDL_LockJoysticks@, defined at @SDL3\/SDL_joystick.h 189:34@
lockJoysticksSafe :: IO ()
lockJoysticksSafe = Safe.sDL_LockJoysticks

-- | Unlocking for atomic access to the joystick API.
--
--     [Thread safety]: This should be called from the same thread that called @'lockJoysticks'@.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnlockJoysticks@.
--                   The safe flavor is 'unlockJoysticksSafe'
--                   .
--
--     [C declaration]: @SDL_UnlockJoysticks@, defined at @SDL3\/SDL_joystick.h 199:34@
unlockJoysticks :: IO ()
unlockJoysticks = Unsafe.sDL_UnlockJoysticks

-- | Unlocking for atomic access to the joystick API.
--
--     [Thread safety]: This should be called from the same thread that called @'lockJoysticks'@.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnlockJoysticks@.
--                   The unsafe flavor is 'unlockJoysticks'
--                   .
--
--     [C declaration]: @SDL_UnlockJoysticks@, defined at @SDL3\/SDL_joystick.h 199:34@
unlockJoysticksSafe :: IO ()
unlockJoysticksSafe = Safe.sDL_UnlockJoysticks

-- | Return whether a joystick is currently connected.
--
--     [Returns]: true if a joystick is connected, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasJoystick@.
--                   The safe flavor is 'hasJoystickSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasJoystick@, defined at @SDL3\/SDL_joystick.h 212:34@
hasJoystick :: IO Bool
hasJoystick =
  fmap CBool.toBool Unsafe.sDL_HasJoystick

-- | Return whether a joystick is currently connected.
--
--     [Returns]: true if a joystick is connected, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasJoystick@.
--                   The unsafe flavor is 'hasJoystick'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasJoystick@, defined at @SDL3\/SDL_joystick.h 212:34@
hasJoystickSafe :: IO Bool
hasJoystickSafe =
  fmap CBool.toBool Safe.sDL_HasJoystick

-- | Get a list of currently connected joysticks.
--
--     [Returns]: a 0 terminated array of joystick instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasJoystick', 'openJoystick'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoysticks@.
--                   The safe flavor is 'getJoysticksSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoysticks@, defined at @SDL3\/SDL_joystick.h 230:46@
getJoysticks
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of joysticks returned, may be NULL.
  -> IO (BG.Ptr SDL_JoystickID)
getJoysticks = Unsafe.sDL_GetJoysticks

-- | Get a list of currently connected joysticks.
--
--     [Returns]: a 0 terminated array of joystick instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasJoystick', 'openJoystick'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoysticks@.
--                   The unsafe flavor is 'getJoysticks'
--                   .
--
--     [C declaration]: @SDL_GetJoysticks@, defined at @SDL3\/SDL_joystick.h 230:46@
getJoysticksSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of joysticks returned, may be NULL.
  -> IO (BG.Ptr SDL_JoystickID)
getJoysticksSafe = Safe.sDL_GetJoysticks

-- | Get the implementation dependent name of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [Returns]: the name of the selected joystick. If no name can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickName', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickNameForID@.
--                   The safe flavor is 'getJoystickNameForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickNameForID@, defined at @SDL3\/SDL_joystick.h 248:42@
getJoystickNameForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getJoystickNameForID =
  Unsafe.sDL_GetJoystickNameForID

-- | Get the implementation dependent name of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [Returns]: the name of the selected joystick. If no name can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickName', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickNameForID@.
--                   The unsafe flavor is 'getJoystickNameForID'
--                   .
--
--     [C declaration]: @SDL_GetJoystickNameForID@, defined at @SDL3\/SDL_joystick.h 248:42@
getJoystickNameForIDSafe
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getJoystickNameForIDSafe =
  Safe.sDL_GetJoystickNameForID

-- | Get the implementation dependent path of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [Returns]: the path of the selected joystick. If no path can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickPath', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickPathForID@.
--                   The safe flavor is 'getJoystickPathForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickPathForID@, defined at @SDL3\/SDL_joystick.h 266:42@
getJoystickPathForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getJoystickPathForID =
  Unsafe.sDL_GetJoystickPathForID

-- | Get the implementation dependent path of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [Returns]: the path of the selected joystick. If no path can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickPath', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickPathForID@.
--                   The unsafe flavor is 'getJoystickPathForID'
--                   .
--
--     [C declaration]: @SDL_GetJoystickPathForID@, defined at @SDL3\/SDL_joystick.h 266:42@
getJoystickPathForIDSafe
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getJoystickPathForIDSafe =
  Safe.sDL_GetJoystickPathForID

-- | Get the player index of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [Returns]: the player index of a joystick, or -1 if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickPlayerIndex', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickPlayerIndexForID@.
--                   The safe flavor is 'getJoystickPlayerIndexForIDSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickPlayerIndexForID@, defined at @SDL3\/SDL_joystick.h 283:33@
getJoystickPlayerIndexForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Int32
getJoystickPlayerIndexForID =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetJoystickPlayerIndexForID x00)

-- | Get the player index of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [Returns]: the player index of a joystick, or -1 if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickPlayerIndex', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickPlayerIndexForID@.
--                   The unsafe flavor is 'getJoystickPlayerIndexForID'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickPlayerIndexForID@, defined at @SDL3\/SDL_joystick.h 283:33@
getJoystickPlayerIndexForIDSafe
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Int32
getJoystickPlayerIndexForIDSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetJoystickPlayerIndexForID x00)

-- | Get the implementation-dependent GUID of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [Returns]: the GUID of the selected joystick. If called with an invalid instance_id, this function returns a zero GUID.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickGUID', 'SDL3.Sys.Guid.guidToString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickGUIDForID@.
--                   The safe flavor is 'getJoystickGUIDForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickGUIDForID@, defined at @SDL3\/SDL_joystick.h 301:38@
getJoystickGUIDForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID
getJoystickGUIDForID =
  Unsafe.sDL_GetJoystickGUIDForID

-- | Get the implementation-dependent GUID of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [Returns]: the GUID of the selected joystick. If called with an invalid instance_id, this function returns a zero GUID.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickGUID', 'SDL3.Sys.Guid.guidToString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickGUIDForID@.
--                   The unsafe flavor is 'getJoystickGUIDForID'
--                   .
--
--     [C declaration]: @SDL_GetJoystickGUIDForID@, defined at @SDL3\/SDL_joystick.h 301:38@
getJoystickGUIDForIDSafe
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID
getJoystickGUIDForIDSafe =
  Safe.sDL_GetJoystickGUIDForID

-- | Get the USB vendor ID of a joystick, if available.
--
--     This can be called before any joysticks are opened. If the vendor ID isn\'t available this function returns 0.
--
--     [Returns]: the USB vendor ID of the selected joystick. If called with an invalid instance_id, this function returns 0.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickVendor', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickVendorForID@.
--                   The safe flavor is 'getJoystickVendorForIDSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickVendorForID@, defined at @SDL3\/SDL_joystick.h 320:36@
getJoystickVendorForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Word16
getJoystickVendorForID =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetJoystickVendorForID x00)

-- | Get the USB vendor ID of a joystick, if available.
--
--     This can be called before any joysticks are opened. If the vendor ID isn\'t available this function returns 0.
--
--     [Returns]: the USB vendor ID of the selected joystick. If called with an invalid instance_id, this function returns 0.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickVendor', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickVendorForID@.
--                   The unsafe flavor is 'getJoystickVendorForID'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickVendorForID@, defined at @SDL3\/SDL_joystick.h 320:36@
getJoystickVendorForIDSafe
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Word16
getJoystickVendorForIDSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetJoystickVendorForID x00)

-- | Get the USB product ID of a joystick, if available.
--
--     This can be called before any joysticks are opened. If the product ID isn\'t available this function returns 0.
--
--     [Returns]: the USB product ID of the selected joystick. If called with an invalid instance_id, this function returns 0.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickProduct', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickProductForID@.
--                   The safe flavor is 'getJoystickProductForIDSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickProductForID@, defined at @SDL3\/SDL_joystick.h 339:36@
getJoystickProductForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Word16
getJoystickProductForID =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetJoystickProductForID x00)

-- | Get the USB product ID of a joystick, if available.
--
--     This can be called before any joysticks are opened. If the product ID isn\'t available this function returns 0.
--
--     [Returns]: the USB product ID of the selected joystick. If called with an invalid instance_id, this function returns 0.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickProduct', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickProductForID@.
--                   The unsafe flavor is 'getJoystickProductForID'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickProductForID@, defined at @SDL3\/SDL_joystick.h 339:36@
getJoystickProductForIDSafe
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Word16
getJoystickProductForIDSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetJoystickProductForID x00)

-- | Get the product version of a joystick, if available.
--
--     This can be called before any joysticks are opened. If the product version isn\'t available this function returns 0.
--
--     [Returns]: the product version of the selected joystick. If called with an invalid instance_id, this function returns 0.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickProductVersion', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickProductVersionForID@.
--                   The safe flavor is 'getJoystickProductVersionForIDSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickProductVersionForID@, defined at @SDL3\/SDL_joystick.h 358:36@
getJoystickProductVersionForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Word16
getJoystickProductVersionForID =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetJoystickProductVersionForID x00)

-- | Get the product version of a joystick, if available.
--
--     This can be called before any joysticks are opened. If the product version isn\'t available this function returns 0.
--
--     [Returns]: the product version of the selected joystick. If called with an invalid instance_id, this function returns 0.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickProductVersion', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickProductVersionForID@.
--                   The unsafe flavor is 'getJoystickProductVersionForID'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickProductVersionForID@, defined at @SDL3\/SDL_joystick.h 358:36@
getJoystickProductVersionForIDSafe
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Word16
getJoystickProductVersionForIDSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetJoystickProductVersionForID x00)

-- | Get the type of a joystick, if available.
--
--     This can be called before any joysticks are opened.
--
--     [Returns]: the 'SDL_JoystickType' of the selected joystick. If called with an invalid instance_id, this function returns @SDL_JOYSTICK_TYPE_UNKNOWN@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickType', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickTypeForID@.
--                   The safe flavor is 'getJoystickTypeForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickTypeForID@, defined at @SDL3\/SDL_joystick.h 377:46@
getJoystickTypeForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL_JoystickType
getJoystickTypeForID =
  Unsafe.sDL_GetJoystickTypeForID

-- | Get the type of a joystick, if available.
--
--     This can be called before any joysticks are opened.
--
--     [Returns]: the 'SDL_JoystickType' of the selected joystick. If called with an invalid instance_id, this function returns @SDL_JOYSTICK_TYPE_UNKNOWN@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickType', 'getJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickTypeForID@.
--                   The unsafe flavor is 'getJoystickTypeForID'
--                   .
--
--     [C declaration]: @SDL_GetJoystickTypeForID@, defined at @SDL3\/SDL_joystick.h 377:46@
getJoystickTypeForIDSafe
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL_JoystickType
getJoystickTypeForIDSafe =
  Safe.sDL_GetJoystickTypeForID

-- | Open a joystick for use.
--
--     The joystick subsystem must be initialized before a joystick can be opened for use.
--
--     [Returns]: a joystick identifier or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeJoystick'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenJoystick@.
--                   The safe flavor is 'openJoystickSafe'
--                   .
--
--     [C declaration]: @SDL_OpenJoystick@, defined at @SDL3\/SDL_joystick.h 395:44@
openJoystick
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (BG.Ptr SDL_Joystick)
openJoystick = Unsafe.sDL_OpenJoystick

-- | Open a joystick for use.
--
--     The joystick subsystem must be initialized before a joystick can be opened for use.
--
--     [Returns]: a joystick identifier or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeJoystick'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenJoystick@.
--                   The unsafe flavor is 'openJoystick'
--                   .
--
--     [C declaration]: @SDL_OpenJoystick@, defined at @SDL3\/SDL_joystick.h 395:44@
openJoystickSafe
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (BG.Ptr SDL_Joystick)
openJoystickSafe = Safe.sDL_OpenJoystick

-- | Get the 'SDL_Joystick' associated with an instance ID, if it has been opened.
--
--     [Returns]: an 'SDL_Joystick' on success or NULL on failure or if it hasn\'t been opened yet; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickFromID@.
--                   The safe flavor is 'getJoystickFromIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickFromID@, defined at @SDL3\/SDL_joystick.h 408:44@
getJoystickFromID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the instance ID to get the 'SDL_Joystick' for.
  -> IO (BG.Ptr SDL_Joystick)
getJoystickFromID = Unsafe.sDL_GetJoystickFromID

-- | Get the 'SDL_Joystick' associated with an instance ID, if it has been opened.
--
--     [Returns]: an 'SDL_Joystick' on success or NULL on failure or if it hasn\'t been opened yet; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickFromID@.
--                   The unsafe flavor is 'getJoystickFromID'
--                   .
--
--     [C declaration]: @SDL_GetJoystickFromID@, defined at @SDL3\/SDL_joystick.h 408:44@
getJoystickFromIDSafe
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the instance ID to get the 'SDL_Joystick' for.
  -> IO (BG.Ptr SDL_Joystick)
getJoystickFromIDSafe = Safe.sDL_GetJoystickFromID

-- | Get the 'SDL_Joystick' associated with a player index.
--
--     [Returns]: an 'SDL_Joystick' on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickPlayerIndex', 'setJoystickPlayerIndex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickFromPlayerIndex@.
--                   The safe flavor is 'getJoystickFromPlayerIndexSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickFromPlayerIndex@, defined at @SDL3\/SDL_joystick.h 424:44@
getJoystickFromPlayerIndex
  :: BG.Int32
  -- ^
  --
  --           [@player_index@]: the player index to get the 'SDL_Joystick' for.
  -> IO (BG.Ptr SDL_Joystick)
getJoystickFromPlayerIndex =
  \x00 ->
    Unsafe.sDL_GetJoystickFromPlayerIndex (Coerce.coerce x00)

-- | Get the 'SDL_Joystick' associated with a player index.
--
--     [Returns]: an 'SDL_Joystick' on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickPlayerIndex', 'setJoystickPlayerIndex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickFromPlayerIndex@.
--                   The unsafe flavor is 'getJoystickFromPlayerIndex'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickFromPlayerIndex@, defined at @SDL3\/SDL_joystick.h 424:44@
getJoystickFromPlayerIndexSafe
  :: BG.Int32
  -- ^
  --
  --           [@player_index@]: the player index to get the 'SDL_Joystick' for.
  -> IO (BG.Ptr SDL_Joystick)
getJoystickFromPlayerIndexSafe =
  \x00 ->
    Safe.sDL_GetJoystickFromPlayerIndex (Coerce.coerce x00)

-- | Attach a new virtual joystick.
--
--     Apps can create virtual joysticks, that exist without hardware directly backing them, and have program-supplied inputs. Once attached, a virtual joystick looks like any other joystick that SDL can access. These can be used to make other things look like joysticks, or provide pre-recorded input, etc.
--
--     Once attached, the app can send joystick inputs to the new virtual joystick using @'setJoystickVirtualAxis'@, etc.
--
--     When no longer needed, the virtual joystick can be removed by calling @'detachVirtualJoystick'@.
--
--     [Returns]: the joystick instance ID, or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'detachVirtualJoystick', 'setJoystickVirtualAxis', 'setJoystickVirtualButton', 'setJoystickVirtualBall', 'setJoystickVirtualHat', 'setJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AttachVirtualJoystick@.
--                   The safe flavor is 'attachVirtualJoystickSafe'
--                   .
--
--     [C declaration]: @SDL_AttachVirtualJoystick@, defined at @SDL3\/SDL_joystick.h 539:44@
attachVirtualJoystick
  :: PtrConst.PtrConst SDL_VirtualJoystickDesc
  -- ^
  --
  --           [@desc@]: joystick description, initialized using SDL_INIT_INTERFACE().
  -> IO SDL_JoystickID
attachVirtualJoystick =
  Unsafe.sDL_AttachVirtualJoystick

-- | Attach a new virtual joystick.
--
--     Apps can create virtual joysticks, that exist without hardware directly backing them, and have program-supplied inputs. Once attached, a virtual joystick looks like any other joystick that SDL can access. These can be used to make other things look like joysticks, or provide pre-recorded input, etc.
--
--     Once attached, the app can send joystick inputs to the new virtual joystick using @'setJoystickVirtualAxis'@, etc.
--
--     When no longer needed, the virtual joystick can be removed by calling @'detachVirtualJoystick'@.
--
--     [Returns]: the joystick instance ID, or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'detachVirtualJoystick', 'setJoystickVirtualAxis', 'setJoystickVirtualButton', 'setJoystickVirtualBall', 'setJoystickVirtualHat', 'setJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AttachVirtualJoystick@.
--                   The unsafe flavor is 'attachVirtualJoystick'
--                   .
--
--     [C declaration]: @SDL_AttachVirtualJoystick@, defined at @SDL3\/SDL_joystick.h 539:44@
attachVirtualJoystickSafe
  :: PtrConst.PtrConst SDL_VirtualJoystickDesc
  -- ^
  --
  --           [@desc@]: joystick description, initialized using SDL_INIT_INTERFACE().
  -> IO SDL_JoystickID
attachVirtualJoystickSafe =
  Safe.sDL_AttachVirtualJoystick

-- | Detach a virtual joystick.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'attachVirtualJoystick'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DetachVirtualJoystick@.
--                   The safe flavor is 'detachVirtualJoystickSafe'
--                   : a virtual joystick\'s cleanup callback runs synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DetachVirtualJoystick@, defined at @SDL3\/SDL_joystick.h 555:34@
detachVirtualJoystick
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID, previously returned from @'attachVirtualJoystick'@.
  -> IO Bool
detachVirtualJoystick =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_DetachVirtualJoystick x00)

-- | Detach a virtual joystick.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'attachVirtualJoystick'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DetachVirtualJoystick@.
--                   The unsafe flavor is 'detachVirtualJoystick'
--                   : a virtual joystick\'s cleanup callback runs synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DetachVirtualJoystick@, defined at @SDL3\/SDL_joystick.h 555:34@
detachVirtualJoystickSafe
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID, previously returned from @'attachVirtualJoystick'@.
  -> IO Bool
detachVirtualJoystickSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_DetachVirtualJoystick x00)

-- | Query whether or not a joystick is virtual.
--
--     [Returns]: true if the joystick is virtual, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IsJoystickVirtual@.
--                   The safe flavor is 'isJoystickVirtualSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsJoystickVirtual@, defined at @SDL3\/SDL_joystick.h 567:34@
isJoystickVirtual
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO Bool
isJoystickVirtual =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_IsJoystickVirtual x00)

-- | Query whether or not a joystick is virtual.
--
--     [Returns]: true if the joystick is virtual, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IsJoystickVirtual@.
--                   The unsafe flavor is 'isJoystickVirtual'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsJoystickVirtual@, defined at @SDL3\/SDL_joystick.h 567:34@
isJoystickVirtualSafe
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO Bool
isJoystickVirtualSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_IsJoystickVirtual x00)

-- | Set the state of an axis on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to 'updateJoysticks', which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: 'SDL3.Sys.Events.pollEvent', 'SDL3.Sys.Events.pumpEvents', 'SDL3.Sys.Events.waitEventTimeout', 'SDL3.Sys.Events.waitEvent'.
--
--     Note that when sending trigger axes, you should scale the value to the full range of Sint16. For example, a trigger at rest would have the value of @'sDL_JOYSTICK_AXIS_MIN'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickVirtualButton', 'setJoystickVirtualBall', 'setJoystickVirtualHat', 'setJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetJoystickVirtualAxis@.
--                   The safe flavor is 'setJoystickVirtualAxisSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickVirtualAxis@, defined at @SDL3\/SDL_joystick.h 598:34@
setJoystickVirtualAxis
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.Int32
  -- ^
  --
  --           [@axis@]: the index of the axis on the virtual joystick to update.
  -> BG.Int16
  -- ^
  --
  --           [@value@]: the new value for the specified axis.
  -> IO Bool
setJoystickVirtualAxis =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetJoystickVirtualAxis x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Set the state of an axis on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to 'updateJoysticks', which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: 'SDL3.Sys.Events.pollEvent', 'SDL3.Sys.Events.pumpEvents', 'SDL3.Sys.Events.waitEventTimeout', 'SDL3.Sys.Events.waitEvent'.
--
--     Note that when sending trigger axes, you should scale the value to the full range of Sint16. For example, a trigger at rest would have the value of @'sDL_JOYSTICK_AXIS_MIN'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickVirtualButton', 'setJoystickVirtualBall', 'setJoystickVirtualHat', 'setJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetJoystickVirtualAxis@.
--                   The unsafe flavor is 'setJoystickVirtualAxis'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickVirtualAxis@, defined at @SDL3\/SDL_joystick.h 598:34@
setJoystickVirtualAxisSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.Int32
  -- ^
  --
  --           [@axis@]: the index of the axis on the virtual joystick to update.
  -> BG.Int16
  -- ^
  --
  --           [@value@]: the new value for the specified axis.
  -> IO Bool
setJoystickVirtualAxisSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetJoystickVirtualAxis x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Generate ball motion on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to 'updateJoysticks', which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: 'SDL3.Sys.Events.pollEvent', 'SDL3.Sys.Events.pumpEvents', 'SDL3.Sys.Events.waitEventTimeout', 'SDL3.Sys.Events.waitEvent'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickVirtualAxis', 'setJoystickVirtualButton', 'setJoystickVirtualHat', 'setJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetJoystickVirtualBall@.
--                   The safe flavor is 'setJoystickVirtualBallSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickVirtualBall@, defined at @SDL3\/SDL_joystick.h 626:34@
setJoystickVirtualBall
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.Int32
  -- ^
  --
  --           [@ball@]: the index of the ball on the virtual joystick to update.
  -> BG.Int16
  -- ^
  --
  --           [@xrel@]: the relative motion on the X axis.
  -> BG.Int16
  -- ^
  --
  --           [@yrel@]: the relative motion on the Y axis.
  -> IO Bool
setJoystickVirtualBall =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_SetJoystickVirtualBall x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Generate ball motion on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to 'updateJoysticks', which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: 'SDL3.Sys.Events.pollEvent', 'SDL3.Sys.Events.pumpEvents', 'SDL3.Sys.Events.waitEventTimeout', 'SDL3.Sys.Events.waitEvent'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickVirtualAxis', 'setJoystickVirtualButton', 'setJoystickVirtualHat', 'setJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetJoystickVirtualBall@.
--                   The unsafe flavor is 'setJoystickVirtualBall'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickVirtualBall@, defined at @SDL3\/SDL_joystick.h 626:34@
setJoystickVirtualBallSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.Int32
  -- ^
  --
  --           [@ball@]: the index of the ball on the virtual joystick to update.
  -> BG.Int16
  -- ^
  --
  --           [@xrel@]: the relative motion on the X axis.
  -> BG.Int16
  -- ^
  --
  --           [@yrel@]: the relative motion on the Y axis.
  -> IO Bool
setJoystickVirtualBallSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_SetJoystickVirtualBall x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Set the state of a button on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to 'updateJoysticks', which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: 'SDL3.Sys.Events.pollEvent', 'SDL3.Sys.Events.pumpEvents', 'SDL3.Sys.Events.waitEventTimeout', 'SDL3.Sys.Events.waitEvent'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickVirtualAxis', 'setJoystickVirtualBall', 'setJoystickVirtualHat', 'setJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetJoystickVirtualButton@.
--                   The safe flavor is 'setJoystickVirtualButtonSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickVirtualButton@, defined at @SDL3\/SDL_joystick.h 653:34@
setJoystickVirtualButton
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.Int32
  -- ^
  --
  --           [@button@]: the index of the button on the virtual joystick to update.
  -> Bool
  -- ^
  --
  --           [@down@]: true if the button is pressed, false otherwise.
  -> IO Bool
setJoystickVirtualButton =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetJoystickVirtualButton x00 (Coerce.coerce x11) (CBool.fromBool x22))

-- | Set the state of a button on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to 'updateJoysticks', which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: 'SDL3.Sys.Events.pollEvent', 'SDL3.Sys.Events.pumpEvents', 'SDL3.Sys.Events.waitEventTimeout', 'SDL3.Sys.Events.waitEvent'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickVirtualAxis', 'setJoystickVirtualBall', 'setJoystickVirtualHat', 'setJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetJoystickVirtualButton@.
--                   The unsafe flavor is 'setJoystickVirtualButton'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickVirtualButton@, defined at @SDL3\/SDL_joystick.h 653:34@
setJoystickVirtualButtonSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.Int32
  -- ^
  --
  --           [@button@]: the index of the button on the virtual joystick to update.
  -> Bool
  -- ^
  --
  --           [@down@]: true if the button is pressed, false otherwise.
  -> IO Bool
setJoystickVirtualButtonSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetJoystickVirtualButton x00 (Coerce.coerce x11) (CBool.fromBool x22))

-- | Set the state of a hat on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to 'updateJoysticks', which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: 'SDL3.Sys.Events.pollEvent', 'SDL3.Sys.Events.pumpEvents', 'SDL3.Sys.Events.waitEventTimeout', 'SDL3.Sys.Events.waitEvent'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickVirtualAxis', 'setJoystickVirtualButton', 'setJoystickVirtualBall', 'setJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetJoystickVirtualHat@.
--                   The safe flavor is 'setJoystickVirtualHatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickVirtualHat@, defined at @SDL3\/SDL_joystick.h 680:34@
setJoystickVirtualHat
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.Int32
  -- ^
  --
  --           [@hat@]: the index of the hat on the virtual joystick to update.
  -> BG.Word8
  -- ^
  --
  --           [@value@]: the new value for the specified hat.
  -> IO Bool
setJoystickVirtualHat =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetJoystickVirtualHat x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Set the state of a hat on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to 'updateJoysticks', which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: 'SDL3.Sys.Events.pollEvent', 'SDL3.Sys.Events.pumpEvents', 'SDL3.Sys.Events.waitEventTimeout', 'SDL3.Sys.Events.waitEvent'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickVirtualAxis', 'setJoystickVirtualButton', 'setJoystickVirtualBall', 'setJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetJoystickVirtualHat@.
--                   The unsafe flavor is 'setJoystickVirtualHat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickVirtualHat@, defined at @SDL3\/SDL_joystick.h 680:34@
setJoystickVirtualHatSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.Int32
  -- ^
  --
  --           [@hat@]: the index of the hat on the virtual joystick to update.
  -> BG.Word8
  -- ^
  --
  --           [@value@]: the new value for the specified hat.
  -> IO Bool
setJoystickVirtualHatSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetJoystickVirtualHat x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Set touchpad finger state on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to 'updateJoysticks', which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: 'SDL3.Sys.Events.pollEvent', 'SDL3.Sys.Events.pumpEvents', 'SDL3.Sys.Events.waitEventTimeout', 'SDL3.Sys.Events.waitEvent'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickVirtualAxis', 'setJoystickVirtualButton', 'setJoystickVirtualBall', 'setJoystickVirtualHat', SDL_SetJoystickVirtualSensorData
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetJoystickVirtualTouchpad@.
--                   The safe flavor is 'setJoystickVirtualTouchpadSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickVirtualTouchpad@, defined at @SDL3\/SDL_joystick.h 714:34@
setJoystickVirtualTouchpad
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.Int32
  -- ^
  --
  --           [@touchpad@]: the index of the touchpad on the virtual joystick to update.
  -> BG.Int32
  -- ^
  --
  --           [@finger@]: the index of the finger on the touchpad to set.
  -> Bool
  -- ^
  --
  --           [@down@]: true if the finger is pressed, false if the finger is released.
  -> Float
  -- ^
  --
  --           [@x@]: the x coordinate of the finger on the touchpad, normalized 0 to 1, with the origin in the upper left.
  -> Float
  -- ^
  --
  --           [@y@]: the y coordinate of the finger on the touchpad, normalized 0 to 1, with the origin in the upper left.
  -> Float
  -- ^
  --
  --           [@pressure@]: the pressure of the finger.
  -> IO Bool
setJoystickVirtualTouchpad =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap
                  CBool.toBool
                  ( Unsafe.sDL_SetJoystickVirtualTouchpad
                      x00
                      (Coerce.coerce x11)
                      (Coerce.coerce x22)
                      (CBool.fromBool x33)
                      (Coerce.coerce x44)
                      (Coerce.coerce x55)
                      (Coerce.coerce x66)
                  )

-- | Set touchpad finger state on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to 'updateJoysticks', which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: 'SDL3.Sys.Events.pollEvent', 'SDL3.Sys.Events.pumpEvents', 'SDL3.Sys.Events.waitEventTimeout', 'SDL3.Sys.Events.waitEvent'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickVirtualAxis', 'setJoystickVirtualButton', 'setJoystickVirtualBall', 'setJoystickVirtualHat', SDL_SetJoystickVirtualSensorData
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetJoystickVirtualTouchpad@.
--                   The unsafe flavor is 'setJoystickVirtualTouchpad'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickVirtualTouchpad@, defined at @SDL3\/SDL_joystick.h 714:34@
setJoystickVirtualTouchpadSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.Int32
  -- ^
  --
  --           [@touchpad@]: the index of the touchpad on the virtual joystick to update.
  -> BG.Int32
  -- ^
  --
  --           [@finger@]: the index of the finger on the touchpad to set.
  -> Bool
  -- ^
  --
  --           [@down@]: true if the finger is pressed, false if the finger is released.
  -> Float
  -- ^
  --
  --           [@x@]: the x coordinate of the finger on the touchpad, normalized 0 to 1, with the origin in the upper left.
  -> Float
  -- ^
  --
  --           [@y@]: the y coordinate of the finger on the touchpad, normalized 0 to 1, with the origin in the upper left.
  -> Float
  -- ^
  --
  --           [@pressure@]: the pressure of the finger.
  -> IO Bool
setJoystickVirtualTouchpadSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap
                  CBool.toBool
                  ( Safe.sDL_SetJoystickVirtualTouchpad
                      x00
                      (Coerce.coerce x11)
                      (Coerce.coerce x22)
                      (CBool.fromBool x33)
                      (Coerce.coerce x44)
                      (Coerce.coerce x55)
                      (Coerce.coerce x66)
                  )

-- | Send a sensor update for an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to 'updateJoysticks', which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: 'SDL3.Sys.Events.pollEvent', 'SDL3.Sys.Events.pumpEvents', 'SDL3.Sys.Events.waitEventTimeout', 'SDL3.Sys.Events.waitEvent'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickVirtualAxis', 'setJoystickVirtualButton', 'setJoystickVirtualBall', 'setJoystickVirtualHat', 'setJoystickVirtualTouchpad'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SendJoystickVirtualSensorData@.
--                   The safe flavor is 'sendJoystickVirtualSensorDataSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SendJoystickVirtualSensorData@, defined at @SDL3\/SDL_joystick.h 744:34@
sendJoystickVirtualSensorData
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of the sensor on the virtual joystick to update.
  -> BG.Word64
  -- ^
  --
  --           [@sensor_timestamp@]: a 64-bit timestamp in nanoseconds associated with the sensor reading.
  -> PtrConst.PtrConst BG.CFloat
  -- ^
  --
  --           [@data@]: the data associated with the sensor reading.
  -> BG.Int32
  -- ^
  --
  --           [@num_values@]: the number of values pointed to by @data@.
  -> IO Bool
sendJoystickVirtualSensorData =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              (Unsafe.sDL_SendJoystickVirtualSensorData x00 x11 (Coerce.coerce x22) x33 (Coerce.coerce x44))

-- | Send a sensor update for an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to 'updateJoysticks', which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: 'SDL3.Sys.Events.pollEvent', 'SDL3.Sys.Events.pumpEvents', 'SDL3.Sys.Events.waitEventTimeout', 'SDL3.Sys.Events.waitEvent'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickVirtualAxis', 'setJoystickVirtualButton', 'setJoystickVirtualBall', 'setJoystickVirtualHat', 'setJoystickVirtualTouchpad'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SendJoystickVirtualSensorData@.
--                   The unsafe flavor is 'sendJoystickVirtualSensorData'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SendJoystickVirtualSensorData@, defined at @SDL3\/SDL_joystick.h 744:34@
sendJoystickVirtualSensorDataSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of the sensor on the virtual joystick to update.
  -> BG.Word64
  -- ^
  --
  --           [@sensor_timestamp@]: a 64-bit timestamp in nanoseconds associated with the sensor reading.
  -> PtrConst.PtrConst BG.CFloat
  -- ^
  --
  --           [@data@]: the data associated with the sensor reading.
  -> BG.Int32
  -- ^
  --
  --           [@num_values@]: the number of values pointed to by @data@.
  -> IO Bool
sendJoystickVirtualSensorDataSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              (Safe.sDL_SendJoystickVirtualSensorData x00 x11 (Coerce.coerce x22) x33 (Coerce.coerce x44))

-- | Get the properties associated with a joystick.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN'@: true if this joystick has an LED that has adjustable brightness
--
--     * @'sDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN'@: true if this joystick has an LED that has adjustable color
--
--     * @'sDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN'@: true if this joystick has a player LED
--
--     * @'sDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN'@: true if this joystick has left\/right rumble
--
--     * @'sDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN'@: true if this joystick has simple trigger rumble
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickProperties@.
--                   The safe flavor is 'getJoystickPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickProperties@, defined at @SDL3\/SDL_joystick.h 770:46@
getJoystickProperties
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getJoystickProperties =
  Unsafe.sDL_GetJoystickProperties

-- | Get the properties associated with a joystick.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN'@: true if this joystick has an LED that has adjustable brightness
--
--     * @'sDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN'@: true if this joystick has an LED that has adjustable color
--
--     * @'sDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN'@: true if this joystick has a player LED
--
--     * @'sDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN'@: true if this joystick has left\/right rumble
--
--     * @'sDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN'@: true if this joystick has simple trigger rumble
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickProperties@.
--                   The unsafe flavor is 'getJoystickProperties'
--                   .
--
--     [C declaration]: @SDL_GetJoystickProperties@, defined at @SDL3\/SDL_joystick.h 770:46@
getJoystickPropertiesSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getJoystickPropertiesSafe =
  Safe.sDL_GetJoystickProperties

-- | Get the implementation dependent name of a joystick.
--
--     [Returns]: the name of the selected joystick. If no name can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickNameForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickName@.
--                   The safe flavor is 'getJoystickNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickName@, defined at @SDL3\/SDL_joystick.h 791:42@
getJoystickName
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO (PtrConst.PtrConst BG.CChar)
getJoystickName = Unsafe.sDL_GetJoystickName

-- | Get the implementation dependent name of a joystick.
--
--     [Returns]: the name of the selected joystick. If no name can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickNameForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickName@.
--                   The unsafe flavor is 'getJoystickName'
--                   .
--
--     [C declaration]: @SDL_GetJoystickName@, defined at @SDL3\/SDL_joystick.h 791:42@
getJoystickNameSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO (PtrConst.PtrConst BG.CChar)
getJoystickNameSafe = Safe.sDL_GetJoystickName

-- | Get the implementation dependent path of a joystick.
--
--     [Returns]: the path of the selected joystick. If no path can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickPathForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickPath@.
--                   The safe flavor is 'getJoystickPathSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickPath@, defined at @SDL3\/SDL_joystick.h 806:42@
getJoystickPath
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO (PtrConst.PtrConst BG.CChar)
getJoystickPath = Unsafe.sDL_GetJoystickPath

-- | Get the implementation dependent path of a joystick.
--
--     [Returns]: the path of the selected joystick. If no path can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickPathForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickPath@.
--                   The unsafe flavor is 'getJoystickPath'
--                   .
--
--     [C declaration]: @SDL_GetJoystickPath@, defined at @SDL3\/SDL_joystick.h 806:42@
getJoystickPathSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO (PtrConst.PtrConst BG.CChar)
getJoystickPathSafe = Safe.sDL_GetJoystickPath

-- | Get the player index of an opened joystick.
--
--     For XInput controllers this returns the XInput user index. Many joysticks will not be able to supply this information.
--
--     [Returns]: the player index, or -1 if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickPlayerIndex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickPlayerIndex@.
--                   The safe flavor is 'getJoystickPlayerIndexSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickPlayerIndex@, defined at @SDL3\/SDL_joystick.h 823:33@
getJoystickPlayerIndex
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO BG.Int32
getJoystickPlayerIndex =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetJoystickPlayerIndex x00)

-- | Get the player index of an opened joystick.
--
--     For XInput controllers this returns the XInput user index. Many joysticks will not be able to supply this information.
--
--     [Returns]: the player index, or -1 if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickPlayerIndex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickPlayerIndex@.
--                   The unsafe flavor is 'getJoystickPlayerIndex'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickPlayerIndex@, defined at @SDL3\/SDL_joystick.h 823:33@
getJoystickPlayerIndexSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO BG.Int32
getJoystickPlayerIndexSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetJoystickPlayerIndex x00)

-- | Set the player index of an opened joystick.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickPlayerIndex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetJoystickPlayerIndex@.
--                   The safe flavor is 'setJoystickPlayerIndexSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickPlayerIndex@, defined at @SDL3\/SDL_joystick.h 840:34@
setJoystickPlayerIndex
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> BG.Int32
  -- ^
  --
  --           [@player_index@]: player index to assign to this joystick, or -1 to clear the player index and turn off player LEDs.
  -> IO Bool
setJoystickPlayerIndex =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetJoystickPlayerIndex x00 (Coerce.coerce x11))

-- | Set the player index of an opened joystick.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickPlayerIndex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetJoystickPlayerIndex@.
--                   The unsafe flavor is 'setJoystickPlayerIndex'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickPlayerIndex@, defined at @SDL3\/SDL_joystick.h 840:34@
setJoystickPlayerIndexSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> BG.Int32
  -- ^
  --
  --           [@player_index@]: player index to assign to this joystick, or -1 to clear the player index and turn off player LEDs.
  -> IO Bool
setJoystickPlayerIndexSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetJoystickPlayerIndex x00 (Coerce.coerce x11))

-- | Get the implementation-dependent GUID for the joystick.
--
--     This function requires an open joystick.
--
--     [Returns]: the GUID of the given joystick. If called on an invalid index, this function returns a zero GUID; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickGUIDForID', 'SDL3.Sys.Guid.guidToString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickGUID@.
--                   The safe flavor is 'getJoystickGUIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickGUID@, defined at @SDL3\/SDL_joystick.h 859:38@
getJoystickGUID
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID
getJoystickGUID = Unsafe.sDL_GetJoystickGUID

-- | Get the implementation-dependent GUID for the joystick.
--
--     This function requires an open joystick.
--
--     [Returns]: the GUID of the given joystick. If called on an invalid index, this function returns a zero GUID; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickGUIDForID', 'SDL3.Sys.Guid.guidToString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickGUID@.
--                   The unsafe flavor is 'getJoystickGUID'
--                   .
--
--     [C declaration]: @SDL_GetJoystickGUID@, defined at @SDL3\/SDL_joystick.h 859:38@
getJoystickGUIDSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID
getJoystickGUIDSafe = Safe.sDL_GetJoystickGUID

-- | Get the USB vendor ID of an opened joystick, if available.
--
--     If the vendor ID isn\'t available this function returns 0.
--
--     [Returns]: the USB vendor ID of the selected joystick, or 0 if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickVendorForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickVendor@.
--                   The safe flavor is 'getJoystickVendorSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickVendor@, defined at @SDL3\/SDL_joystick.h 875:36@
getJoystickVendor
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO BG.Word16
getJoystickVendor =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetJoystickVendor x00)

-- | Get the USB vendor ID of an opened joystick, if available.
--
--     If the vendor ID isn\'t available this function returns 0.
--
--     [Returns]: the USB vendor ID of the selected joystick, or 0 if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickVendorForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickVendor@.
--                   The unsafe flavor is 'getJoystickVendor'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickVendor@, defined at @SDL3\/SDL_joystick.h 875:36@
getJoystickVendorSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO BG.Word16
getJoystickVendorSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetJoystickVendor x00)

-- | Get the USB product ID of an opened joystick, if available.
--
--     If the product ID isn\'t available this function returns 0.
--
--     [Returns]: the USB product ID of the selected joystick, or 0 if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickProductForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickProduct@.
--                   The safe flavor is 'getJoystickProductSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickProduct@, defined at @SDL3\/SDL_joystick.h 891:36@
getJoystickProduct
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO BG.Word16
getJoystickProduct =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetJoystickProduct x00)

-- | Get the USB product ID of an opened joystick, if available.
--
--     If the product ID isn\'t available this function returns 0.
--
--     [Returns]: the USB product ID of the selected joystick, or 0 if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickProductForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickProduct@.
--                   The unsafe flavor is 'getJoystickProduct'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickProduct@, defined at @SDL3\/SDL_joystick.h 891:36@
getJoystickProductSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO BG.Word16
getJoystickProductSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetJoystickProduct x00)

-- | Get the product version of an opened joystick, if available.
--
--     If the product version isn\'t available this function returns 0.
--
--     [Returns]: the product version of the selected joystick, or 0 if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickProductVersionForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickProductVersion@.
--                   The safe flavor is 'getJoystickProductVersionSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickProductVersion@, defined at @SDL3\/SDL_joystick.h 907:36@
getJoystickProductVersion
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO BG.Word16
getJoystickProductVersion =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetJoystickProductVersion x00)

-- | Get the product version of an opened joystick, if available.
--
--     If the product version isn\'t available this function returns 0.
--
--     [Returns]: the product version of the selected joystick, or 0 if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickProductVersionForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickProductVersion@.
--                   The unsafe flavor is 'getJoystickProductVersion'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickProductVersion@, defined at @SDL3\/SDL_joystick.h 907:36@
getJoystickProductVersionSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO BG.Word16
getJoystickProductVersionSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetJoystickProductVersion x00)

-- | Get the firmware version of an opened joystick, if available.
--
--     If the firmware version isn\'t available this function returns 0.
--
--     [Returns]: the firmware version of the selected joystick, or 0 if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickFirmwareVersion@.
--                   The safe flavor is 'getJoystickFirmwareVersionSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickFirmwareVersion@, defined at @SDL3\/SDL_joystick.h 922:36@
getJoystickFirmwareVersion
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO BG.Word16
getJoystickFirmwareVersion =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetJoystickFirmwareVersion x00)

-- | Get the firmware version of an opened joystick, if available.
--
--     If the firmware version isn\'t available this function returns 0.
--
--     [Returns]: the firmware version of the selected joystick, or 0 if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickFirmwareVersion@.
--                   The unsafe flavor is 'getJoystickFirmwareVersion'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickFirmwareVersion@, defined at @SDL3\/SDL_joystick.h 922:36@
getJoystickFirmwareVersionSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO BG.Word16
getJoystickFirmwareVersionSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetJoystickFirmwareVersion x00)

-- | Get the serial number of an opened joystick, if available.
--
--     Returns the serial number of the joystick, or NULL if it is not available.
--
--     [Returns]: the serial number of the selected joystick, or NULL if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickSerial@.
--                   The safe flavor is 'getJoystickSerialSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickSerial@, defined at @SDL3\/SDL_joystick.h 937:42@
getJoystickSerial
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO (PtrConst.PtrConst BG.CChar)
getJoystickSerial = Unsafe.sDL_GetJoystickSerial

-- | Get the serial number of an opened joystick, if available.
--
--     Returns the serial number of the joystick, or NULL if it is not available.
--
--     [Returns]: the serial number of the selected joystick, or NULL if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickSerial@.
--                   The unsafe flavor is 'getJoystickSerial'
--                   .
--
--     [C declaration]: @SDL_GetJoystickSerial@, defined at @SDL3\/SDL_joystick.h 937:42@
getJoystickSerialSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO (PtrConst.PtrConst BG.CChar)
getJoystickSerialSafe = Safe.sDL_GetJoystickSerial

-- | Get the type of an opened joystick.
--
--     [Returns]: the 'SDL_JoystickType' of the selected joystick.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickTypeForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickType@.
--                   The safe flavor is 'getJoystickTypeSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickType@, defined at @SDL3\/SDL_joystick.h 951:46@
getJoystickType
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO SDL_JoystickType
getJoystickType = Unsafe.sDL_GetJoystickType

-- | Get the type of an opened joystick.
--
--     [Returns]: the 'SDL_JoystickType' of the selected joystick.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickTypeForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickType@.
--                   The unsafe flavor is 'getJoystickType'
--                   .
--
--     [C declaration]: @SDL_GetJoystickType@, defined at @SDL3\/SDL_joystick.h 951:46@
getJoystickTypeSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @'openJoystick'@.
  -> IO SDL_JoystickType
getJoystickTypeSafe = Safe.sDL_GetJoystickType

-- | Get the device information encoded in a SDL_GUID structure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickGUIDForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickGUIDInfo@.
--                   The safe flavor is 'getJoystickGUIDInfoSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickGUIDInfo@, defined at @SDL3\/SDL_joystick.h 972:34@
getJoystickGUIDInfo
  :: SDL3.Sys.Bindgen.Guid.SDL_GUID
  -- ^
  --
  --           [@guid@]: the SDL_GUID you wish to get info about.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@vendor@]: a pointer filled in with the device VID, or 0 if not available.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@product@]: a pointer filled in with the device PID, or 0 if not available.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@version@]: a pointer filled in with the device version, or 0 if not available.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@crc16@]: a pointer filled in with a CRC used to distinguish different products with the same VID\/PID, or 0 if not available.
  -> IO ()
getJoystickGUIDInfo = Unsafe.sDL_GetJoystickGUIDInfo

-- | Get the device information encoded in a SDL_GUID structure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickGUIDForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickGUIDInfo@.
--                   The unsafe flavor is 'getJoystickGUIDInfo'
--                   .
--
--     [C declaration]: @SDL_GetJoystickGUIDInfo@, defined at @SDL3\/SDL_joystick.h 972:34@
getJoystickGUIDInfoSafe
  :: SDL3.Sys.Bindgen.Guid.SDL_GUID
  -- ^
  --
  --           [@guid@]: the SDL_GUID you wish to get info about.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@vendor@]: a pointer filled in with the device VID, or 0 if not available.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@product@]: a pointer filled in with the device PID, or 0 if not available.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@version@]: a pointer filled in with the device version, or 0 if not available.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@crc16@]: a pointer filled in with a CRC used to distinguish different products with the same VID\/PID, or 0 if not available.
  -> IO ()
getJoystickGUIDInfoSafe =
  Safe.sDL_GetJoystickGUIDInfo

-- | Get the status of a specified joystick.
--
--     [Returns]: true if the joystick has been opened, false if it has not; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_JoystickConnected@.
--                   The safe flavor is 'joystickConnectedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_JoystickConnected@, defined at @SDL3\/SDL_joystick.h 985:34@
joystickConnected
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to query.
  -> IO Bool
joystickConnected =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_JoystickConnected x00)

-- | Get the status of a specified joystick.
--
--     [Returns]: true if the joystick has been opened, false if it has not; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_JoystickConnected@.
--                   The unsafe flavor is 'joystickConnected'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_JoystickConnected@, defined at @SDL3\/SDL_joystick.h 985:34@
joystickConnectedSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to query.
  -> IO Bool
joystickConnectedSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_JoystickConnected x00)

-- | Get the instance ID of an opened joystick.
--
--     [Returns]: the instance ID of the specified joystick on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickID@.
--                   The safe flavor is 'getJoystickIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickID@, defined at @SDL3\/SDL_joystick.h 998:44@
getJoystickID
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO SDL_JoystickID
getJoystickID = Unsafe.sDL_GetJoystickID

-- | Get the instance ID of an opened joystick.
--
--     [Returns]: the instance ID of the specified joystick on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickID@.
--                   The unsafe flavor is 'getJoystickID'
--                   .
--
--     [C declaration]: @SDL_GetJoystickID@, defined at @SDL3\/SDL_joystick.h 998:44@
getJoystickIDSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO SDL_JoystickID
getJoystickIDSafe = Safe.sDL_GetJoystickID

-- | Get the number of general axis controls on a joystick.
--
--     Often, the directional pad on a game controller will either look like 4 separate buttons or a POV hat, and not axes, but all of this is up to the device and platform.
--
--     [Returns]: the number of axis controls\/number of axes on success or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickAxis', 'getNumJoystickBalls', 'getNumJoystickButtons', 'getNumJoystickHats'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumJoystickAxes@.
--                   The safe flavor is 'getNumJoystickAxesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumJoystickAxes@, defined at @SDL3\/SDL_joystick.h 1020:33@
getNumJoystickAxes
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO BG.Int32
getNumJoystickAxes =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetNumJoystickAxes x00)

-- | Get the number of general axis controls on a joystick.
--
--     Often, the directional pad on a game controller will either look like 4 separate buttons or a POV hat, and not axes, but all of this is up to the device and platform.
--
--     [Returns]: the number of axis controls\/number of axes on success or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickAxis', 'getNumJoystickBalls', 'getNumJoystickButtons', 'getNumJoystickHats'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumJoystickAxes@.
--                   The unsafe flavor is 'getNumJoystickAxes'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumJoystickAxes@, defined at @SDL3\/SDL_joystick.h 1020:33@
getNumJoystickAxesSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO BG.Int32
getNumJoystickAxesSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetNumJoystickAxes x00)

-- | Get the number of trackballs on a joystick.
--
--     Joystick trackballs have only relative motion events associated with them and their state cannot be polled.
--
--     Most joysticks do not have trackballs.
--
--     [Returns]: the number of trackballs on success or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickBall', 'getNumJoystickAxes', 'getNumJoystickButtons', 'getNumJoystickHats'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumJoystickBalls@.
--                   The safe flavor is 'getNumJoystickBallsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumJoystickBalls@, defined at @SDL3\/SDL_joystick.h 1043:33@
getNumJoystickBalls
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO BG.Int32
getNumJoystickBalls =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetNumJoystickBalls x00)

-- | Get the number of trackballs on a joystick.
--
--     Joystick trackballs have only relative motion events associated with them and their state cannot be polled.
--
--     Most joysticks do not have trackballs.
--
--     [Returns]: the number of trackballs on success or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickBall', 'getNumJoystickAxes', 'getNumJoystickButtons', 'getNumJoystickHats'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumJoystickBalls@.
--                   The unsafe flavor is 'getNumJoystickBalls'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumJoystickBalls@, defined at @SDL3\/SDL_joystick.h 1043:33@
getNumJoystickBallsSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO BG.Int32
getNumJoystickBallsSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetNumJoystickBalls x00)

-- | Get the number of POV hats on a joystick.
--
--     [Returns]: the number of POV hats on success or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickHat', 'getNumJoystickAxes', 'getNumJoystickBalls', 'getNumJoystickButtons'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumJoystickHats@.
--                   The safe flavor is 'getNumJoystickHatsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumJoystickHats@, defined at @SDL3\/SDL_joystick.h 1061:33@
getNumJoystickHats
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO BG.Int32
getNumJoystickHats =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetNumJoystickHats x00)

-- | Get the number of POV hats on a joystick.
--
--     [Returns]: the number of POV hats on success or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickHat', 'getNumJoystickAxes', 'getNumJoystickBalls', 'getNumJoystickButtons'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumJoystickHats@.
--                   The unsafe flavor is 'getNumJoystickHats'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumJoystickHats@, defined at @SDL3\/SDL_joystick.h 1061:33@
getNumJoystickHatsSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO BG.Int32
getNumJoystickHatsSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetNumJoystickHats x00)

-- | Get the number of buttons on a joystick.
--
--     [Returns]: the number of buttons on success or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickButton', 'getNumJoystickAxes', 'getNumJoystickBalls', 'getNumJoystickHats'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumJoystickButtons@.
--                   The safe flavor is 'getNumJoystickButtonsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumJoystickButtons@, defined at @SDL3\/SDL_joystick.h 1079:33@
getNumJoystickButtons
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO BG.Int32
getNumJoystickButtons =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetNumJoystickButtons x00)

-- | Get the number of buttons on a joystick.
--
--     [Returns]: the number of buttons on success or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getJoystickButton', 'getNumJoystickAxes', 'getNumJoystickBalls', 'getNumJoystickHats'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumJoystickButtons@.
--                   The unsafe flavor is 'getNumJoystickButtons'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumJoystickButtons@, defined at @SDL3\/SDL_joystick.h 1079:33@
getNumJoystickButtonsSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO BG.Int32
getNumJoystickButtonsSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetNumJoystickButtons x00)

-- | Set the state of joystick event processing.
--
--     If joystick events are disabled, you must call @'updateJoysticks'@ yourself and check the state of the joystick when you want joystick information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'joystickEventsEnabled', 'updateJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetJoystickEventsEnabled@.
--                   The safe flavor is 'setJoystickEventsEnabledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickEventsEnabled@, defined at @SDL3\/SDL_joystick.h 1097:34@
setJoystickEventsEnabled
  :: Bool
  -- ^
  --
  --           [@enabled@]: whether to process joystick events or not.
  -> IO ()
setJoystickEventsEnabled =
  \x00 ->
    Unsafe.sDL_SetJoystickEventsEnabled (CBool.fromBool x00)

-- | Set the state of joystick event processing.
--
--     If joystick events are disabled, you must call @'updateJoysticks'@ yourself and check the state of the joystick when you want joystick information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'joystickEventsEnabled', 'updateJoysticks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetJoystickEventsEnabled@.
--                   The unsafe flavor is 'setJoystickEventsEnabled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickEventsEnabled@, defined at @SDL3\/SDL_joystick.h 1097:34@
setJoystickEventsEnabledSafe
  :: Bool
  -- ^
  --
  --           [@enabled@]: whether to process joystick events or not.
  -> IO ()
setJoystickEventsEnabledSafe =
  \x00 ->
    Safe.sDL_SetJoystickEventsEnabled (CBool.fromBool x00)

-- | Query the state of joystick event processing.
--
--     If joystick events are disabled, you must call @'updateJoysticks'@ yourself and check the state of the joystick when you want joystick information.
--
--     [Returns]: true if joystick events are being processed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickEventsEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_JoystickEventsEnabled@.
--                   The safe flavor is 'joystickEventsEnabledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_JoystickEventsEnabled@, defined at @SDL3\/SDL_joystick.h 1114:34@
joystickEventsEnabled :: IO Bool
joystickEventsEnabled =
  fmap CBool.toBool Unsafe.sDL_JoystickEventsEnabled

-- | Query the state of joystick event processing.
--
--     If joystick events are disabled, you must call @'updateJoysticks'@ yourself and check the state of the joystick when you want joystick information.
--
--     [Returns]: true if joystick events are being processed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setJoystickEventsEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_JoystickEventsEnabled@.
--                   The unsafe flavor is 'joystickEventsEnabled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_JoystickEventsEnabled@, defined at @SDL3\/SDL_joystick.h 1114:34@
joystickEventsEnabledSafe :: IO Bool
joystickEventsEnabledSafe =
  fmap CBool.toBool Safe.sDL_JoystickEventsEnabled

-- | Update the current state of the open joysticks.
--
--     This is called automatically by the event loop if any joystick events are enabled.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UpdateJoysticks@.
--                   The safe flavor is 'updateJoysticksSafe'
--                   : virtual-device callbacks run synchronously.
--
--     [C declaration]: @SDL_UpdateJoysticks@, defined at @SDL3\/SDL_joystick.h 1126:34@
updateJoysticks :: IO ()
updateJoysticks = Unsafe.sDL_UpdateJoysticks

-- | Update the current state of the open joysticks.
--
--     This is called automatically by the event loop if any joystick events are enabled.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UpdateJoysticks@.
--                   The unsafe flavor is 'updateJoysticks'
--                   : virtual-device callbacks run synchronously.
--
--     [C declaration]: @SDL_UpdateJoysticks@, defined at @SDL3\/SDL_joystick.h 1126:34@
updateJoysticksSafe :: IO ()
updateJoysticksSafe = Safe.sDL_UpdateJoysticks

-- | Get the current state of an axis control on a joystick.
--
--     SDL makes no promises about what part of the joystick any given axis refers to. Your game should have some sort of configuration UI to let users specify what each axis should be bound to. Alternately, SDL\'s higher-level Game Controller API makes a great effort to apply order to this lower-level interface, so you know that a specific axis is the \"left thumb stick,\" etc.
--
--     The value returned by @'getJoystickAxis'@ is a signed integer (-32768 to 32767) representing the current position of the axis. It may be necessary to impose certain tolerances on these values to account for jitter.
--
--     [Returns]: a 16-bit signed integer representing the current position of the axis or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumJoystickAxes'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickAxis@.
--                   The safe flavor is 'getJoystickAxisSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickAxis@, defined at @SDL3\/SDL_joystick.h 1152:36@
getJoystickAxis
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> BG.Int32
  -- ^
  --
  --           [@axis@]: the axis to query; the axis indices start at index 0.
  -> IO BG.Int16
getJoystickAxis =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_GetJoystickAxis x00 (Coerce.coerce x11))

-- | Get the current state of an axis control on a joystick.
--
--     SDL makes no promises about what part of the joystick any given axis refers to. Your game should have some sort of configuration UI to let users specify what each axis should be bound to. Alternately, SDL\'s higher-level Game Controller API makes a great effort to apply order to this lower-level interface, so you know that a specific axis is the \"left thumb stick,\" etc.
--
--     The value returned by @'getJoystickAxis'@ is a signed integer (-32768 to 32767) representing the current position of the axis. It may be necessary to impose certain tolerances on these values to account for jitter.
--
--     [Returns]: a 16-bit signed integer representing the current position of the axis or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumJoystickAxes'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickAxis@.
--                   The unsafe flavor is 'getJoystickAxis'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickAxis@, defined at @SDL3\/SDL_joystick.h 1152:36@
getJoystickAxisSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> BG.Int32
  -- ^
  --
  --           [@axis@]: the axis to query; the axis indices start at index 0.
  -> IO BG.Int16
getJoystickAxisSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_GetJoystickAxis x00 (Coerce.coerce x11))

-- | Get the initial state of an axis control on a joystick.
--
--     The state is a value ranging from -32768 to 32767.
--
--     The axis indices start at index 0.
--
--     [Returns]: true if this axis has any initial value, or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickAxisInitialState@.
--                   The safe flavor is 'getJoystickAxisInitialStateSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickAxisInitialState@, defined at @SDL3\/SDL_joystick.h 1170:34@
getJoystickAxisInitialState
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> BG.Int32
  -- ^
  --
  --           [@axis@]: the axis to query; the axis indices start at index 0.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@state@]: upon return, the initial value is supplied here.
  -> IO Bool
getJoystickAxisInitialState =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetJoystickAxisInitialState x00 (Coerce.coerce x11) x22)

-- | Get the initial state of an axis control on a joystick.
--
--     The state is a value ranging from -32768 to 32767.
--
--     The axis indices start at index 0.
--
--     [Returns]: true if this axis has any initial value, or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickAxisInitialState@.
--                   The unsafe flavor is 'getJoystickAxisInitialState'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickAxisInitialState@, defined at @SDL3\/SDL_joystick.h 1170:34@
getJoystickAxisInitialStateSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> BG.Int32
  -- ^
  --
  --           [@axis@]: the axis to query; the axis indices start at index 0.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@state@]: upon return, the initial value is supplied here.
  -> IO Bool
getJoystickAxisInitialStateSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetJoystickAxisInitialState x00 (Coerce.coerce x11) x22)

-- | Get the ball axis change since the last poll.
--
--     Trackballs can only return relative motion since the last call to @'getJoystickBall'@, these motion deltas are placed into @dx@ and @dy@.
--
--     Most joysticks do not have trackballs.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumJoystickBalls'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickBall@.
--                   The safe flavor is 'getJoystickBallSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickBall@, defined at @SDL3\/SDL_joystick.h 1193:34@
getJoystickBall
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' to query.
  -> BG.Int32
  -- ^
  --
  --           [@ball@]: the ball index to query; ball indices start at index 0.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@dx@]: stores the difference in the x axis position since the last poll.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@dy@]: stores the difference in the y axis position since the last poll.
  -> IO Bool
getJoystickBall =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_GetJoystickBall x00 (Coerce.coerce x11) x22 x33)

-- | Get the ball axis change since the last poll.
--
--     Trackballs can only return relative motion since the last call to @'getJoystickBall'@, these motion deltas are placed into @dx@ and @dy@.
--
--     Most joysticks do not have trackballs.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumJoystickBalls'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickBall@.
--                   The unsafe flavor is 'getJoystickBall'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickBall@, defined at @SDL3\/SDL_joystick.h 1193:34@
getJoystickBallSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' to query.
  -> BG.Int32
  -- ^
  --
  --           [@ball@]: the ball index to query; ball indices start at index 0.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@dx@]: stores the difference in the x axis position since the last poll.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@dy@]: stores the difference in the y axis position since the last poll.
  -> IO Bool
getJoystickBallSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_GetJoystickBall x00 (Coerce.coerce x11) x22 x33)

-- | Get the current state of a POV hat on a joystick.
--
--     The returned value will be one of the @SDL_HAT_*@ values.
--
--     [Returns]: the current hat position.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumJoystickHats'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickHat@.
--                   The safe flavor is 'getJoystickHatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickHat@, defined at @SDL3\/SDL_joystick.h 1210:35@
getJoystickHat
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> BG.Int32
  -- ^
  --
  --           [@hat@]: the hat index to get the state from; indices start at index 0.
  -> IO BG.Word8
getJoystickHat =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_GetJoystickHat x00 (Coerce.coerce x11))

-- | Get the current state of a POV hat on a joystick.
--
--     The returned value will be one of the @SDL_HAT_*@ values.
--
--     [Returns]: the current hat position.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumJoystickHats'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickHat@.
--                   The unsafe flavor is 'getJoystickHat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickHat@, defined at @SDL3\/SDL_joystick.h 1210:35@
getJoystickHatSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> BG.Int32
  -- ^
  --
  --           [@hat@]: the hat index to get the state from; indices start at index 0.
  -> IO BG.Word8
getJoystickHatSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_GetJoystickHat x00 (Coerce.coerce x11))

-- | Get the current state of a button on a joystick.
--
--     [Returns]: true if the button is pressed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumJoystickButtons'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickButton@.
--                   The safe flavor is 'getJoystickButtonSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickButton@, defined at @SDL3\/SDL_joystick.h 1236:34@
getJoystickButton
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> BG.Int32
  -- ^
  --
  --           [@button@]: the button index to get the state from; indices start at index 0.
  -> IO Bool
getJoystickButton =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetJoystickButton x00 (Coerce.coerce x11))

-- | Get the current state of a button on a joystick.
--
--     [Returns]: true if the button is pressed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumJoystickButtons'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickButton@.
--                   The unsafe flavor is 'getJoystickButton'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetJoystickButton@, defined at @SDL3\/SDL_joystick.h 1236:34@
getJoystickButtonSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> BG.Int32
  -- ^
  --
  --           [@button@]: the button index to get the state from; indices start at index 0.
  -> IO Bool
getJoystickButtonSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetJoystickButton x00 (Coerce.coerce x11))

-- | Start a rumble effect.
--
--     Each call to this function cancels any previous rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     This function requires you to process SDL events or call @'updateJoysticks'@ to update rumble state.
--
--     [Returns]: true, or false if rumble isn\'t supported on this joystick.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RumbleJoystick@.
--                   The safe flavor is 'rumbleJoystickSafe'
--                   : a virtual joystick\'s rumble callback runs synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RumbleJoystick@, defined at @SDL3\/SDL_joystick.h 1259:34@
rumbleJoystick
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to vibrate.
  -> BG.Word16
  -- ^
  --
  --           [@low_frequency_rumble@]: the intensity of the low frequency (left) rumble motor, from 0 to 0xFFFF.
  -> BG.Word16
  -- ^
  --
  --           [@high_frequency_rumble@]: the intensity of the high frequency (right) rumble motor, from 0 to 0xFFFF.
  -> BG.Word32
  -- ^
  --
  --           [@duration_ms@]: the duration of the rumble effect, in milliseconds.
  -> IO Bool
rumbleJoystick =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_RumbleJoystick x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Start a rumble effect.
--
--     Each call to this function cancels any previous rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     This function requires you to process SDL events or call @'updateJoysticks'@ to update rumble state.
--
--     [Returns]: true, or false if rumble isn\'t supported on this joystick.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RumbleJoystick@.
--                   The unsafe flavor is 'rumbleJoystick'
--                   : a virtual joystick\'s rumble callback runs synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RumbleJoystick@, defined at @SDL3\/SDL_joystick.h 1259:34@
rumbleJoystickSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to vibrate.
  -> BG.Word16
  -- ^
  --
  --           [@low_frequency_rumble@]: the intensity of the low frequency (left) rumble motor, from 0 to 0xFFFF.
  -> BG.Word16
  -- ^
  --
  --           [@high_frequency_rumble@]: the intensity of the high frequency (right) rumble motor, from 0 to 0xFFFF.
  -> BG.Word32
  -- ^
  --
  --           [@duration_ms@]: the duration of the rumble effect, in milliseconds.
  -> IO Bool
rumbleJoystickSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_RumbleJoystick x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Start a rumble effect in the joystick\'s triggers.
--
--     Each call to this function cancels any previous trigger rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     Note that this is rumbling of the /triggers/ and not the game controller as a whole. This is currently only supported on Xbox One controllers. If you want the (more common) whole-controller rumble, use @'rumbleJoystick'@ instead.
--
--     This function requires you to process SDL events or call @'updateJoysticks'@ to update rumble state.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'rumbleJoystick'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RumbleJoystickTriggers@.
--                   The safe flavor is 'rumbleJoystickTriggersSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RumbleJoystickTriggers@, defined at @SDL3\/SDL_joystick.h 1290:34@
rumbleJoystickTriggers
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to vibrate.
  -> BG.Word16
  -- ^
  --
  --           [@left_rumble@]: the intensity of the left trigger rumble motor, from 0 to 0xFFFF.
  -> BG.Word16
  -- ^
  --
  --           [@right_rumble@]: the intensity of the right trigger rumble motor, from 0 to 0xFFFF.
  -> BG.Word32
  -- ^
  --
  --           [@duration_ms@]: the duration of the rumble effect, in milliseconds.
  -> IO Bool
rumbleJoystickTriggers =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_RumbleJoystickTriggers x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Start a rumble effect in the joystick\'s triggers.
--
--     Each call to this function cancels any previous trigger rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     Note that this is rumbling of the /triggers/ and not the game controller as a whole. This is currently only supported on Xbox One controllers. If you want the (more common) whole-controller rumble, use @'rumbleJoystick'@ instead.
--
--     This function requires you to process SDL events or call @'updateJoysticks'@ to update rumble state.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'rumbleJoystick'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RumbleJoystickTriggers@.
--                   The unsafe flavor is 'rumbleJoystickTriggers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RumbleJoystickTriggers@, defined at @SDL3\/SDL_joystick.h 1290:34@
rumbleJoystickTriggersSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to vibrate.
  -> BG.Word16
  -- ^
  --
  --           [@left_rumble@]: the intensity of the left trigger rumble motor, from 0 to 0xFFFF.
  -> BG.Word16
  -- ^
  --
  --           [@right_rumble@]: the intensity of the right trigger rumble motor, from 0 to 0xFFFF.
  -> BG.Word32
  -- ^
  --
  --           [@duration_ms@]: the duration of the rumble effect, in milliseconds.
  -> IO Bool
rumbleJoystickTriggersSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_RumbleJoystickTriggers x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Update a joystick\'s LED color.
--
--     An example of a joystick LED is the light on the back of a PlayStation 4\'s DualShock 4 controller.
--
--     For joysticks with a single color LED, the maximum of the RGB values will be used as the LED brightness.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetJoystickLED@.
--                   The safe flavor is 'setJoystickLEDSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickLED@, defined at @SDL3\/SDL_joystick.h 1312:34@
setJoystickLED
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to update.
  -> BG.Word8
  -- ^
  --
  --           [@red@]: the intensity of the red LED.
  -> BG.Word8
  -- ^
  --
  --           [@green@]: the intensity of the green LED.
  -> BG.Word8
  -- ^
  --
  --           [@blue@]: the intensity of the blue LED.
  -> IO Bool
setJoystickLED =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_SetJoystickLED x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Update a joystick\'s LED color.
--
--     An example of a joystick LED is the light on the back of a PlayStation 4\'s DualShock 4 controller.
--
--     For joysticks with a single color LED, the maximum of the RGB values will be used as the LED brightness.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetJoystickLED@.
--                   The unsafe flavor is 'setJoystickLED'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetJoystickLED@, defined at @SDL3\/SDL_joystick.h 1312:34@
setJoystickLEDSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to update.
  -> BG.Word8
  -- ^
  --
  --           [@red@]: the intensity of the red LED.
  -> BG.Word8
  -- ^
  --
  --           [@green@]: the intensity of the green LED.
  -> BG.Word8
  -- ^
  --
  --           [@blue@]: the intensity of the blue LED.
  -> IO Bool
setJoystickLEDSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_SetJoystickLED x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Send a joystick specific effect packet.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SendJoystickEffect@.
--                   The safe flavor is 'sendJoystickEffectSafe'
--                   : a virtual joystick\'s effect callback runs synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SendJoystickEffect@, defined at @SDL3\/SDL_joystick.h 1327:34@
sendJoystickEffect
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to affect.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to send to the joystick.
  -> BG.Int32
  -- ^
  --
  --           [@size@]: the size of the data to send to the joystick.
  -> IO Bool
sendJoystickEffect =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SendJoystickEffect x00 x11 (Coerce.coerce x22))

-- | Send a joystick specific effect packet.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SendJoystickEffect@.
--                   The unsafe flavor is 'sendJoystickEffect'
--                   : a virtual joystick\'s effect callback runs synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SendJoystickEffect@, defined at @SDL3\/SDL_joystick.h 1327:34@
sendJoystickEffectSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to affect.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to send to the joystick.
  -> BG.Int32
  -- ^
  --
  --           [@size@]: the size of the data to send to the joystick.
  -> IO Bool
sendJoystickEffectSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SendJoystickEffect x00 x11 (Coerce.coerce x22))

-- | Close a joystick previously opened with @'openJoystick'@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openJoystick'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CloseJoystick@.
--                   The safe flavor is 'closeJoystickSafe'
--                   .
--
--     [C declaration]: @SDL_CloseJoystick@, defined at @SDL3\/SDL_joystick.h 1340:34@
closeJoystick
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick device to close.
  -> IO ()
closeJoystick = Unsafe.sDL_CloseJoystick

-- | Close a joystick previously opened with @'openJoystick'@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openJoystick'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CloseJoystick@.
--                   The unsafe flavor is 'closeJoystick'
--                   .
--
--     [C declaration]: @SDL_CloseJoystick@, defined at @SDL3\/SDL_joystick.h 1340:34@
closeJoystickSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick device to close.
  -> IO ()
closeJoystickSafe = Safe.sDL_CloseJoystick

-- | Get the connection state of a joystick.
--
--     [Returns]: the connection state on success or @SDL_JOYSTICK_CONNECTION_INVALID@ on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickConnectionState@.
--                   The safe flavor is 'getJoystickConnectionStateSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickConnectionState@, defined at @SDL3\/SDL_joystick.h 1354:57@
getJoystickConnectionState
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to query.
  -> IO SDL_JoystickConnectionState
getJoystickConnectionState =
  Unsafe.sDL_GetJoystickConnectionState

-- | Get the connection state of a joystick.
--
--     [Returns]: the connection state on success or @SDL_JOYSTICK_CONNECTION_INVALID@ on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickConnectionState@.
--                   The unsafe flavor is 'getJoystickConnectionState'
--                   .
--
--     [C declaration]: @SDL_GetJoystickConnectionState@, defined at @SDL3\/SDL_joystick.h 1354:57@
getJoystickConnectionStateSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to query.
  -> IO SDL_JoystickConnectionState
getJoystickConnectionStateSafe =
  Safe.sDL_GetJoystickConnectionState

-- | Get the battery state of a joystick.
--
--     You should never take a battery status as absolute truth. Batteries (especially failing batteries) are delicate hardware, and the values reported here are best estimates based on what that hardware reports. It\'s not uncommon for older batteries to lose stored power much faster than it reports, or completely drain when reporting it has 20 percent left, etc.
--
--     [Returns]: the current battery state or @SDL_POWERSTATE_ERROR@ on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetJoystickPowerInfo@.
--                   The safe flavor is 'getJoystickPowerInfoSafe'
--                   .
--
--     [C declaration]: @SDL_GetJoystickPowerInfo@, defined at @SDL3\/SDL_joystick.h 1377:44@
getJoystickPowerInfo
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@percent@]: a pointer filled in with the percentage of battery life left, between 0 and 100, or NULL to ignore. This will be filled in with -1 we can\'t determine a value or there is no battery.
  -> IO SDL3.Sys.Bindgen.Power.SDL_PowerState
getJoystickPowerInfo =
  Unsafe.sDL_GetJoystickPowerInfo

-- | Get the battery state of a joystick.
--
--     You should never take a battery status as absolute truth. Batteries (especially failing batteries) are delicate hardware, and the values reported here are best estimates based on what that hardware reports. It\'s not uncommon for older batteries to lose stored power much faster than it reports, or completely drain when reporting it has 20 percent left, etc.
--
--     [Returns]: the current battery state or @SDL_POWERSTATE_ERROR@ on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetJoystickPowerInfo@.
--                   The unsafe flavor is 'getJoystickPowerInfo'
--                   .
--
--     [C declaration]: @SDL_GetJoystickPowerInfo@, defined at @SDL3\/SDL_joystick.h 1377:44@
getJoystickPowerInfoSafe
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@percent@]: a pointer filled in with the percentage of battery life left, between 0 and 100, or NULL to ignore. This will be filled in with -1 we can\'t determine a value or there is no battery.
  -> IO SDL3.Sys.Bindgen.Power.SDL_PowerState
getJoystickPowerInfoSafe =
  Safe.sDL_GetJoystickPowerInfo

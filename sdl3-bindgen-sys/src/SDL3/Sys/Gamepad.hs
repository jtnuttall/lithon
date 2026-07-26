-- | SDL provides a low-level joystick API, which just treats joysticks as an arbitrary pile of buttons, axes, and hat switches. If you\'re planning to write your own control configuration screen, this can give you a lot of flexibility, but that\'s a lot of work, and most things that we consider \"joysticks\" now are actually console-style gamepads. So SDL provides the gamepad API on top of the lower-level joystick functionality.
--
--     The difference between a joystick and a gamepad is that a gamepad tells you /where/ a button or axis is on the device. You don\'t speak to gamepads in terms of arbitrary numbers like \"button 3\" or \"axis 2\" but in standard locations: the d-pad, the shoulder buttons, triggers, A\/B\/X\/Y (or X\/O\/Square\/Triangle, if you will).
--
--     One turns a joystick into a gamepad by providing a magic configuration string, which tells SDL the details of a specific device: when you see this specific hardware, if button 2 gets pressed, this is actually D-Pad Up, etc.
--
--     SDL has many popular controllers configured out of the box, and users can add their own controller details through an environment variable if it\'s otherwise unknown to SDL.
--
--     In order to use these functions, 'SDL3.Sys.Init.init' must have been called with the SDL_INIT_GAMEPAD flag. This causes SDL to scan the system for gamepads, and load appropriate drivers.
--
--     If you\'re using SDL gamepad support in a Steam game, you must call SteamAPI_InitEx() before calling 'SDL3.Sys.Init.init'.
--
--     If you would like to receive gamepad updates while the application is in the background, you should set the following hint before calling 'SDL3.Sys.Init.init': SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS
--
--     Gamepads support various optional features such as rumble, color LEDs, touchpad, gyro, etc. The support for these features varies depending on the controller and OS support available. You can check for LED and rumble capabilities at runtime by calling @'getGamepadProperties'@ and checking the various capability properties. You can check for touchpad by calling @'getNumGamepadTouchpads'@ and check for gyro and accelerometer by calling @'gamepadHasSensor'@.
--
--     By default SDL will try to use the most capable driver available, but you can tune which OS drivers to use with the various joystick hints in SDL_hints.h.
--
--     Your application should always support gamepad hotplugging. On some platforms like Xbox, Steam Deck, etc., this is a requirement for certification. On other platforms, like macOS and Windows when using Windows.Gaming.Input, controllers may not be available at startup and will come in at some point after you\'ve started processing events. The structure used to identify an SDL gamepad
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Gamepad.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Gamepad (
  module SDL3.Sys.Bindgen.Gamepad,

  -- * Function aliases
  SDL3.Sys.Gamepad.addGamepadMapping,
  SDL3.Sys.Gamepad.addGamepadMappingSafe,
  SDL3.Sys.Gamepad.addGamepadMappingsFromIO,
  SDL3.Sys.Gamepad.addGamepadMappingsFromIOSafe,
  SDL3.Sys.Gamepad.addGamepadMappingsFromFile,
  SDL3.Sys.Gamepad.addGamepadMappingsFromFileSafe,
  SDL3.Sys.Gamepad.reloadGamepadMappings,
  SDL3.Sys.Gamepad.reloadGamepadMappingsSafe,
  SDL3.Sys.Gamepad.getGamepadMappings,
  SDL3.Sys.Gamepad.getGamepadMappingsSafe,
  SDL3.Sys.Gamepad.getGamepadMappingForGUID,
  SDL3.Sys.Gamepad.getGamepadMappingForGUIDSafe,
  SDL3.Sys.Gamepad.getGamepadMapping,
  SDL3.Sys.Gamepad.getGamepadMappingSafe,
  SDL3.Sys.Gamepad.setGamepadMapping,
  SDL3.Sys.Gamepad.setGamepadMappingSafe,
  SDL3.Sys.Gamepad.hasGamepad,
  SDL3.Sys.Gamepad.hasGamepadSafe,
  SDL3.Sys.Gamepad.getGamepads,
  SDL3.Sys.Gamepad.getGamepadsSafe,
  SDL3.Sys.Gamepad.isGamepad,
  SDL3.Sys.Gamepad.isGamepadSafe,
  SDL3.Sys.Gamepad.getGamepadNameForID,
  SDL3.Sys.Gamepad.getGamepadNameForIDSafe,
  SDL3.Sys.Gamepad.getGamepadPathForID,
  SDL3.Sys.Gamepad.getGamepadPathForIDSafe,
  SDL3.Sys.Gamepad.getGamepadPlayerIndexForID,
  SDL3.Sys.Gamepad.getGamepadPlayerIndexForIDSafe,
  SDL3.Sys.Gamepad.getGamepadGUIDForID,
  SDL3.Sys.Gamepad.getGamepadGUIDForIDSafe,
  SDL3.Sys.Gamepad.getGamepadVendorForID,
  SDL3.Sys.Gamepad.getGamepadVendorForIDSafe,
  SDL3.Sys.Gamepad.getGamepadProductForID,
  SDL3.Sys.Gamepad.getGamepadProductForIDSafe,
  SDL3.Sys.Gamepad.getGamepadProductVersionForID,
  SDL3.Sys.Gamepad.getGamepadProductVersionForIDSafe,
  SDL3.Sys.Gamepad.getGamepadTypeForID,
  SDL3.Sys.Gamepad.getGamepadTypeForIDSafe,
  SDL3.Sys.Gamepad.getRealGamepadTypeForID,
  SDL3.Sys.Gamepad.getRealGamepadTypeForIDSafe,
  SDL3.Sys.Gamepad.getGamepadMappingForID,
  SDL3.Sys.Gamepad.getGamepadMappingForIDSafe,
  SDL3.Sys.Gamepad.openGamepad,
  SDL3.Sys.Gamepad.openGamepadSafe,
  SDL3.Sys.Gamepad.getGamepadFromID,
  SDL3.Sys.Gamepad.getGamepadFromIDSafe,
  SDL3.Sys.Gamepad.getGamepadFromPlayerIndex,
  SDL3.Sys.Gamepad.getGamepadFromPlayerIndexSafe,
  SDL3.Sys.Gamepad.getGamepadProperties,
  SDL3.Sys.Gamepad.getGamepadPropertiesSafe,
  SDL3.Sys.Gamepad.getGamepadID,
  SDL3.Sys.Gamepad.getGamepadIDSafe,
  SDL3.Sys.Gamepad.getGamepadName,
  SDL3.Sys.Gamepad.getGamepadNameSafe,
  SDL3.Sys.Gamepad.getGamepadPath,
  SDL3.Sys.Gamepad.getGamepadPathSafe,
  SDL3.Sys.Gamepad.getGamepadType,
  SDL3.Sys.Gamepad.getGamepadTypeSafe,
  SDL3.Sys.Gamepad.getRealGamepadType,
  SDL3.Sys.Gamepad.getRealGamepadTypeSafe,
  SDL3.Sys.Gamepad.getGamepadPlayerIndex,
  SDL3.Sys.Gamepad.getGamepadPlayerIndexSafe,
  SDL3.Sys.Gamepad.setGamepadPlayerIndex,
  SDL3.Sys.Gamepad.setGamepadPlayerIndexSafe,
  SDL3.Sys.Gamepad.getGamepadVendor,
  SDL3.Sys.Gamepad.getGamepadVendorSafe,
  SDL3.Sys.Gamepad.getGamepadProduct,
  SDL3.Sys.Gamepad.getGamepadProductSafe,
  SDL3.Sys.Gamepad.getGamepadProductVersion,
  SDL3.Sys.Gamepad.getGamepadProductVersionSafe,
  SDL3.Sys.Gamepad.getGamepadFirmwareVersion,
  SDL3.Sys.Gamepad.getGamepadFirmwareVersionSafe,
  SDL3.Sys.Gamepad.getGamepadSerial,
  SDL3.Sys.Gamepad.getGamepadSerialSafe,
  SDL3.Sys.Gamepad.getGamepadSteamHandle,
  SDL3.Sys.Gamepad.getGamepadSteamHandleSafe,
  SDL3.Sys.Gamepad.getGamepadConnectionState,
  SDL3.Sys.Gamepad.getGamepadConnectionStateSafe,
  SDL3.Sys.Gamepad.getGamepadPowerInfo,
  SDL3.Sys.Gamepad.getGamepadPowerInfoSafe,
  SDL3.Sys.Gamepad.gamepadConnected,
  SDL3.Sys.Gamepad.gamepadConnectedSafe,
  SDL3.Sys.Gamepad.getGamepadJoystick,
  SDL3.Sys.Gamepad.getGamepadJoystickSafe,
  SDL3.Sys.Gamepad.setGamepadEventsEnabled,
  SDL3.Sys.Gamepad.setGamepadEventsEnabledSafe,
  SDL3.Sys.Gamepad.gamepadEventsEnabled,
  SDL3.Sys.Gamepad.gamepadEventsEnabledSafe,
  SDL3.Sys.Gamepad.getGamepadBindings,
  SDL3.Sys.Gamepad.getGamepadBindingsSafe,
  SDL3.Sys.Gamepad.updateGamepads,
  SDL3.Sys.Gamepad.updateGamepadsSafe,
  SDL3.Sys.Gamepad.getGamepadTypeFromString,
  SDL3.Sys.Gamepad.getGamepadTypeFromStringSafe,
  SDL3.Sys.Gamepad.getGamepadStringForType,
  SDL3.Sys.Gamepad.getGamepadStringForTypeSafe,
  SDL3.Sys.Gamepad.getGamepadAxisFromString,
  SDL3.Sys.Gamepad.getGamepadAxisFromStringSafe,
  SDL3.Sys.Gamepad.getGamepadStringForAxis,
  SDL3.Sys.Gamepad.getGamepadStringForAxisSafe,
  SDL3.Sys.Gamepad.gamepadHasAxis,
  SDL3.Sys.Gamepad.gamepadHasAxisSafe,
  SDL3.Sys.Gamepad.getGamepadAxis,
  SDL3.Sys.Gamepad.getGamepadAxisSafe,
  SDL3.Sys.Gamepad.getGamepadButtonFromString,
  SDL3.Sys.Gamepad.getGamepadButtonFromStringSafe,
  SDL3.Sys.Gamepad.getGamepadStringForButton,
  SDL3.Sys.Gamepad.getGamepadStringForButtonSafe,
  SDL3.Sys.Gamepad.gamepadHasButton,
  SDL3.Sys.Gamepad.gamepadHasButtonSafe,
  SDL3.Sys.Gamepad.getGamepadButton,
  SDL3.Sys.Gamepad.getGamepadButtonSafe,
  SDL3.Sys.Gamepad.getGamepadButtonLabelForType,
  SDL3.Sys.Gamepad.getGamepadButtonLabelForTypeSafe,
  SDL3.Sys.Gamepad.getGamepadButtonLabel,
  SDL3.Sys.Gamepad.getGamepadButtonLabelSafe,
  SDL3.Sys.Gamepad.getNumGamepadTouchpads,
  SDL3.Sys.Gamepad.getNumGamepadTouchpadsSafe,
  SDL3.Sys.Gamepad.getNumGamepadTouchpadFingers,
  SDL3.Sys.Gamepad.getNumGamepadTouchpadFingersSafe,
  SDL3.Sys.Gamepad.getGamepadTouchpadFinger,
  SDL3.Sys.Gamepad.getGamepadTouchpadFingerSafe,
  SDL3.Sys.Gamepad.gamepadHasSensor,
  SDL3.Sys.Gamepad.gamepadHasSensorSafe,
  SDL3.Sys.Gamepad.setGamepadSensorEnabled,
  SDL3.Sys.Gamepad.setGamepadSensorEnabledSafe,
  SDL3.Sys.Gamepad.gamepadSensorEnabled,
  SDL3.Sys.Gamepad.gamepadSensorEnabledSafe,
  SDL3.Sys.Gamepad.getGamepadSensorDataRate,
  SDL3.Sys.Gamepad.getGamepadSensorDataRateSafe,
  SDL3.Sys.Gamepad.getGamepadSensorData,
  SDL3.Sys.Gamepad.getGamepadSensorDataSafe,
  SDL3.Sys.Gamepad.rumbleGamepad,
  SDL3.Sys.Gamepad.rumbleGamepadSafe,
  SDL3.Sys.Gamepad.rumbleGamepadTriggers,
  SDL3.Sys.Gamepad.rumbleGamepadTriggersSafe,
  SDL3.Sys.Gamepad.setGamepadLED,
  SDL3.Sys.Gamepad.setGamepadLEDSafe,
  SDL3.Sys.Gamepad.sendGamepadEffect,
  SDL3.Sys.Gamepad.sendGamepadEffectSafe,
  SDL3.Sys.Gamepad.closeGamepad,
  SDL3.Sys.Gamepad.closeGamepadSafe,
  SDL3.Sys.Gamepad.getGamepadAppleSFSymbolsNameForButton,
  SDL3.Sys.Gamepad.getGamepadAppleSFSymbolsNameForButtonSafe,
  SDL3.Sys.Gamepad.getGamepadAppleSFSymbolsNameForAxis,
  SDL3.Sys.Gamepad.getGamepadAppleSFSymbolsNameForAxisSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Gamepad
import SDL3.Sys.Bindgen.Gamepad.Safe qualified as Safe
import SDL3.Sys.Bindgen.Gamepad.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Guid qualified
import SDL3.Sys.Bindgen.Iostream qualified
import SDL3.Sys.Bindgen.Joystick qualified
import SDL3.Sys.Bindgen.Power qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Sensor qualified
import SDL3.Sys.Bindgen.Stdinc qualified

-- | Add support for gamepads that SDL is unaware of or change the binding of an existing gamepad.
--
--     The mapping string has the format \"GUID,name,mapping\", where GUID is the string value from 'SDL3.Sys.Guid.guidToString', name is the human readable string for the device and mappings are gamepad mappings to joystick ones. Under Windows there is a reserved GUID of \"xinput\" that covers all XInput devices. The mapping format for joystick is:
--
--     * @bX@: a joystick button, index X
--
--     * @hX.Y@: hat X with value Y
--
--     * @aX@: axis X of the joystick
--
--     Buttons can be used as a gamepad axes and vice versa.
--
--     If a device with this GUID is already plugged in, SDL will generate an SDL_EVENT_GAMEPAD_ADDED event.
--
--     This string shows an example of a valid mapping for a gamepad:
--
--     @
--     \"341a3608000000000000504944564944,Afterglow PS3 Controller,a:b1,b:b2,y:b3,x:b0,start:b9,guide:b12,back:b8,dpup:h0.1,dpleft:h0.8,dpdown:h0.4,dpright:h0.2,leftshoulder:b4,rightshoulder:b5,leftstick:b10,rightstick:b11,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:b6,righttrigger:b7\"
--     @
--
--     [Returns]: 1 if a new mapping is added, 0 if an existing mapping is updated, -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addGamepadMappingsFromFile', 'addGamepadMappingsFromIO', 'getGamepadMapping', 'getGamepadMappingForGUID', SDL_HINT_GAMECONTROLLERCONFIG, SDL_HINT_GAMECONTROLLERCONFIG_FILE, SDL_EVENT_GAMEPAD_ADDED
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AddGamepadMapping@.
--                   The safe flavor is 'addGamepadMappingSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddGamepadMapping@, defined at @SDL3\/SDL_gamepad.h 346:33@
addGamepadMapping
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mapping@]: the mapping string.
  -> IO BG.Int32
addGamepadMapping =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_AddGamepadMapping x00)

-- | Add support for gamepads that SDL is unaware of or change the binding of an existing gamepad.
--
--     The mapping string has the format \"GUID,name,mapping\", where GUID is the string value from 'SDL3.Sys.Guid.guidToString', name is the human readable string for the device and mappings are gamepad mappings to joystick ones. Under Windows there is a reserved GUID of \"xinput\" that covers all XInput devices. The mapping format for joystick is:
--
--     * @bX@: a joystick button, index X
--
--     * @hX.Y@: hat X with value Y
--
--     * @aX@: axis X of the joystick
--
--     Buttons can be used as a gamepad axes and vice versa.
--
--     If a device with this GUID is already plugged in, SDL will generate an SDL_EVENT_GAMEPAD_ADDED event.
--
--     This string shows an example of a valid mapping for a gamepad:
--
--     @
--     \"341a3608000000000000504944564944,Afterglow PS3 Controller,a:b1,b:b2,y:b3,x:b0,start:b9,guide:b12,back:b8,dpup:h0.1,dpleft:h0.8,dpdown:h0.4,dpright:h0.2,leftshoulder:b4,rightshoulder:b5,leftstick:b10,rightstick:b11,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:b6,righttrigger:b7\"
--     @
--
--     [Returns]: 1 if a new mapping is added, 0 if an existing mapping is updated, -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addGamepadMappingsFromFile', 'addGamepadMappingsFromIO', 'getGamepadMapping', 'getGamepadMappingForGUID', SDL_HINT_GAMECONTROLLERCONFIG, SDL_HINT_GAMECONTROLLERCONFIG_FILE, SDL_EVENT_GAMEPAD_ADDED
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AddGamepadMapping@.
--                   The unsafe flavor is 'addGamepadMapping'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddGamepadMapping@, defined at @SDL3\/SDL_gamepad.h 346:33@
addGamepadMappingSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mapping@]: the mapping string.
  -> IO BG.Int32
addGamepadMappingSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_AddGamepadMapping x00)

-- | Load a set of gamepad mappings from an SDL_IOStream.
--
--     You can call this function several times, if needed, to load different database files.
--
--     If a new mapping is loaded for an already known gamepad GUID, the later version will overwrite the one currently loaded.
--
--     Any new mappings for already plugged in controllers will generate SDL_EVENT_GAMEPAD_ADDED events.
--
--     Mappings not belonging to the current platform or with no platform field specified will be ignored (i.e. mappings for Linux will be ignored in Windows, etc).
--
--     This function will load the text database entirely in memory before processing it, so take this into consideration if you are in a memory constrained environment.
--
--     [Returns]: the number of mappings added or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addGamepadMapping', 'addGamepadMappingsFromFile', 'getGamepadMapping', 'getGamepadMappingForGUID', SDL_HINT_GAMECONTROLLERCONFIG, SDL_HINT_GAMECONTROLLERCONFIG_FILE, SDL_EVENT_GAMEPAD_ADDED
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AddGamepadMappingsFromIO@.
--                   The safe flavor is 'addGamepadMappingsFromIOSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddGamepadMappingsFromIO@, defined at @SDL3\/SDL_gamepad.h 386:33@
addGamepadMappingsFromIO
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data stream for the mappings to be added.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @src@ before returning, even in the case of an error.
  -> IO BG.Int32
addGamepadMappingsFromIO =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_AddGamepadMappingsFromIO x00 (CBool.fromBool x11))

-- | Load a set of gamepad mappings from an SDL_IOStream.
--
--     You can call this function several times, if needed, to load different database files.
--
--     If a new mapping is loaded for an already known gamepad GUID, the later version will overwrite the one currently loaded.
--
--     Any new mappings for already plugged in controllers will generate SDL_EVENT_GAMEPAD_ADDED events.
--
--     Mappings not belonging to the current platform or with no platform field specified will be ignored (i.e. mappings for Linux will be ignored in Windows, etc).
--
--     This function will load the text database entirely in memory before processing it, so take this into consideration if you are in a memory constrained environment.
--
--     [Returns]: the number of mappings added or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addGamepadMapping', 'addGamepadMappingsFromFile', 'getGamepadMapping', 'getGamepadMappingForGUID', SDL_HINT_GAMECONTROLLERCONFIG, SDL_HINT_GAMECONTROLLERCONFIG_FILE, SDL_EVENT_GAMEPAD_ADDED
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AddGamepadMappingsFromIO@.
--                   The unsafe flavor is 'addGamepadMappingsFromIO'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddGamepadMappingsFromIO@, defined at @SDL3\/SDL_gamepad.h 386:33@
addGamepadMappingsFromIOSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data stream for the mappings to be added.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @src@ before returning, even in the case of an error.
  -> IO BG.Int32
addGamepadMappingsFromIOSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_AddGamepadMappingsFromIO x00 (CBool.fromBool x11))

-- | Load a set of gamepad mappings from a file.
--
--     You can call this function several times, if needed, to load different database files.
--
--     If a new mapping is loaded for an already known gamepad GUID, the later version will overwrite the one currently loaded.
--
--     Any new mappings for already plugged in controllers will generate SDL_EVENT_GAMEPAD_ADDED events.
--
--     Mappings not belonging to the current platform or with no platform field specified will be ignored (i.e. mappings for Linux will be ignored in Windows, etc).
--
--     [Returns]: the number of mappings added or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addGamepadMapping', 'addGamepadMappingsFromIO', 'getGamepadMapping', 'getGamepadMappingForGUID', SDL_HINT_GAMECONTROLLERCONFIG, SDL_HINT_GAMECONTROLLERCONFIG_FILE, SDL_EVENT_GAMEPAD_ADDED
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AddGamepadMappingsFromFile@.
--                   The safe flavor is 'addGamepadMappingsFromFileSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddGamepadMappingsFromFile@, defined at @SDL3\/SDL_gamepad.h 420:33@
addGamepadMappingsFromFile
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the mappings file to load.
  -> IO BG.Int32
addGamepadMappingsFromFile =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_AddGamepadMappingsFromFile x00)

-- | Load a set of gamepad mappings from a file.
--
--     You can call this function several times, if needed, to load different database files.
--
--     If a new mapping is loaded for an already known gamepad GUID, the later version will overwrite the one currently loaded.
--
--     Any new mappings for already plugged in controllers will generate SDL_EVENT_GAMEPAD_ADDED events.
--
--     Mappings not belonging to the current platform or with no platform field specified will be ignored (i.e. mappings for Linux will be ignored in Windows, etc).
--
--     [Returns]: the number of mappings added or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addGamepadMapping', 'addGamepadMappingsFromIO', 'getGamepadMapping', 'getGamepadMappingForGUID', SDL_HINT_GAMECONTROLLERCONFIG, SDL_HINT_GAMECONTROLLERCONFIG_FILE, SDL_EVENT_GAMEPAD_ADDED
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AddGamepadMappingsFromFile@.
--                   The unsafe flavor is 'addGamepadMappingsFromFile'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddGamepadMappingsFromFile@, defined at @SDL3\/SDL_gamepad.h 420:33@
addGamepadMappingsFromFileSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the mappings file to load.
  -> IO BG.Int32
addGamepadMappingsFromFileSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_AddGamepadMappingsFromFile x00)

-- | Reinitialize the SDL mapping database to its initial state.
--
--     This will generate gamepad events as needed if device mappings change.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReloadGamepadMappings@.
--                   The safe flavor is 'reloadGamepadMappingsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReloadGamepadMappings@, defined at @SDL3\/SDL_gamepad.h 434:34@
reloadGamepadMappings :: IO Bool
reloadGamepadMappings =
  fmap CBool.toBool Unsafe.sDL_ReloadGamepadMappings

-- | Reinitialize the SDL mapping database to its initial state.
--
--     This will generate gamepad events as needed if device mappings change.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReloadGamepadMappings@.
--                   The unsafe flavor is 'reloadGamepadMappings'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReloadGamepadMappings@, defined at @SDL3\/SDL_gamepad.h 434:34@
reloadGamepadMappingsSafe :: IO Bool
reloadGamepadMappingsSafe =
  fmap CBool.toBool Safe.sDL_ReloadGamepadMappings

-- | Get the current gamepad mappings.
--
--     [Returns]: an array of the mapping strings, NULL-terminated, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadMappings@.
--                   The safe flavor is 'getGamepadMappingsSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadMappings@, defined at @SDL3\/SDL_gamepad.h 450:37@
getGamepadMappings
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of mappings returned, can be NULL.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
getGamepadMappings = Unsafe.sDL_GetGamepadMappings

-- | Get the current gamepad mappings.
--
--     [Returns]: an array of the mapping strings, NULL-terminated, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadMappings@.
--                   The unsafe flavor is 'getGamepadMappings'
--                   .
--
--     [C declaration]: @SDL_GetGamepadMappings@, defined at @SDL3\/SDL_gamepad.h 450:37@
getGamepadMappingsSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of mappings returned, can be NULL.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
getGamepadMappingsSafe = Safe.sDL_GetGamepadMappings

-- | Get the gamepad mapping string for a given GUID.
--
--     [Returns]: a mapping string or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Joystick.getJoystickGUIDForID', 'SDL3.Sys.Joystick.getJoystickGUID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadMappingForGUID@.
--                   The safe flavor is 'getGamepadMappingForGUIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadMappingForGUID@, defined at @SDL3\/SDL_gamepad.h 467:36@
getGamepadMappingForGUID
  :: SDL3.Sys.Bindgen.Guid.SDL_GUID
  -- ^
  --
  --           [@guid@]: a structure containing the GUID for which a mapping is desired.
  -> IO (BG.Ptr BG.CChar)
getGamepadMappingForGUID =
  Unsafe.sDL_GetGamepadMappingForGUID

-- | Get the gamepad mapping string for a given GUID.
--
--     [Returns]: a mapping string or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Joystick.getJoystickGUIDForID', 'SDL3.Sys.Joystick.getJoystickGUID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadMappingForGUID@.
--                   The unsafe flavor is 'getGamepadMappingForGUID'
--                   .
--
--     [C declaration]: @SDL_GetGamepadMappingForGUID@, defined at @SDL3\/SDL_gamepad.h 467:36@
getGamepadMappingForGUIDSafe
  :: SDL3.Sys.Bindgen.Guid.SDL_GUID
  -- ^
  --
  --           [@guid@]: a structure containing the GUID for which a mapping is desired.
  -> IO (BG.Ptr BG.CChar)
getGamepadMappingForGUIDSafe =
  Safe.sDL_GetGamepadMappingForGUID

-- | Get the current mapping of a gamepad.
--
--     Details about mappings are discussed with @'addGamepadMapping'@.
--
--     [Returns]: a string that has the gamepad\'s mapping or NULL if no mapping is available; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addGamepadMapping', 'getGamepadMappingForID', 'getGamepadMappingForGUID', 'setGamepadMapping'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadMapping@.
--                   The safe flavor is 'getGamepadMappingSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadMapping@, defined at @SDL3\/SDL_gamepad.h 488:36@
getGamepadMapping
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad you want to get the current mapping for.
  -> IO (BG.Ptr BG.CChar)
getGamepadMapping = Unsafe.sDL_GetGamepadMapping

-- | Get the current mapping of a gamepad.
--
--     Details about mappings are discussed with @'addGamepadMapping'@.
--
--     [Returns]: a string that has the gamepad\'s mapping or NULL if no mapping is available; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addGamepadMapping', 'getGamepadMappingForID', 'getGamepadMappingForGUID', 'setGamepadMapping'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadMapping@.
--                   The unsafe flavor is 'getGamepadMapping'
--                   .
--
--     [C declaration]: @SDL_GetGamepadMapping@, defined at @SDL3\/SDL_gamepad.h 488:36@
getGamepadMappingSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad you want to get the current mapping for.
  -> IO (BG.Ptr BG.CChar)
getGamepadMappingSafe = Safe.sDL_GetGamepadMapping

-- | Set the current mapping of a joystick or gamepad.
--
--     Details about mappings are discussed with @'addGamepadMapping'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addGamepadMapping', 'getGamepadMapping'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGamepadMapping@.
--                   The safe flavor is 'setGamepadMappingSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGamepadMapping@, defined at @SDL3\/SDL_gamepad.h 508:34@
setGamepadMapping
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mapping@]: the mapping to use for this device, or NULL to clear the mapping.
  -> IO Bool
setGamepadMapping =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetGamepadMapping x00 x11)

-- | Set the current mapping of a joystick or gamepad.
--
--     Details about mappings are discussed with @'addGamepadMapping'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addGamepadMapping', 'getGamepadMapping'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGamepadMapping@.
--                   The unsafe flavor is 'setGamepadMapping'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGamepadMapping@, defined at @SDL3\/SDL_gamepad.h 508:34@
setGamepadMappingSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mapping@]: the mapping to use for this device, or NULL to clear the mapping.
  -> IO Bool
setGamepadMappingSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetGamepadMapping x00 x11)

-- | Return whether a gamepad is currently connected.
--
--     [Returns]: true if a gamepad is connected, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasGamepad@.
--                   The safe flavor is 'hasGamepadSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasGamepad@, defined at @SDL3\/SDL_gamepad.h 521:34@
hasGamepad :: IO Bool
hasGamepad = fmap CBool.toBool Unsafe.sDL_HasGamepad

-- | Return whether a gamepad is currently connected.
--
--     [Returns]: true if a gamepad is connected, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasGamepad@.
--                   The unsafe flavor is 'hasGamepad'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasGamepad@, defined at @SDL3\/SDL_gamepad.h 521:34@
hasGamepadSafe :: IO Bool
hasGamepadSafe =
  fmap CBool.toBool Safe.sDL_HasGamepad

-- | Get a list of currently connected gamepads.
--
--     [Returns]: a 0 terminated array of joystick instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasGamepad', 'openGamepad'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepads@.
--                   The safe flavor is 'getGamepadsSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepads@, defined at @SDL3\/SDL_gamepad.h 539:46@
getGamepads
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of gamepads returned, may be NULL.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
getGamepads = Unsafe.sDL_GetGamepads

-- | Get a list of currently connected gamepads.
--
--     [Returns]: a 0 terminated array of joystick instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasGamepad', 'openGamepad'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepads@.
--                   The unsafe flavor is 'getGamepads'
--                   .
--
--     [C declaration]: @SDL_GetGamepads@, defined at @SDL3\/SDL_gamepad.h 539:46@
getGamepadsSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of gamepads returned, may be NULL.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
getGamepadsSafe = Safe.sDL_GetGamepads

-- | Check if the given joystick is supported by the gamepad interface.
--
--     [Returns]: true if the given joystick is supported by the gamepad interface, false if it isn\'t or it\'s an invalid index.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Joystick.getJoysticks', 'openGamepad'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IsGamepad@.
--                   The safe flavor is 'isGamepadSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsGamepad@, defined at @SDL3\/SDL_gamepad.h 555:34@
isGamepad
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO Bool
isGamepad =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_IsGamepad x00)

-- | Check if the given joystick is supported by the gamepad interface.
--
--     [Returns]: true if the given joystick is supported by the gamepad interface, false if it isn\'t or it\'s an invalid index.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Joystick.getJoysticks', 'openGamepad'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IsGamepad@.
--                   The unsafe flavor is 'isGamepad'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsGamepad@, defined at @SDL3\/SDL_gamepad.h 555:34@
isGamepadSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO Bool
isGamepadSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_IsGamepad x00)

-- | Get the implementation dependent name of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the name of the selected gamepad. If no name can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadName', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadNameForID@.
--                   The safe flavor is 'getGamepadNameForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadNameForID@, defined at @SDL3\/SDL_gamepad.h 573:42@
getGamepadNameForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadNameForID = Unsafe.sDL_GetGamepadNameForID

-- | Get the implementation dependent name of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the name of the selected gamepad. If no name can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadName', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadNameForID@.
--                   The unsafe flavor is 'getGamepadNameForID'
--                   .
--
--     [C declaration]: @SDL_GetGamepadNameForID@, defined at @SDL3\/SDL_gamepad.h 573:42@
getGamepadNameForIDSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadNameForIDSafe =
  Safe.sDL_GetGamepadNameForID

-- | Get the implementation dependent path of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the path of the selected gamepad. If no path can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadPath', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadPathForID@.
--                   The safe flavor is 'getGamepadPathForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadPathForID@, defined at @SDL3\/SDL_gamepad.h 591:42@
getGamepadPathForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadPathForID = Unsafe.sDL_GetGamepadPathForID

-- | Get the implementation dependent path of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the path of the selected gamepad. If no path can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadPath', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadPathForID@.
--                   The unsafe flavor is 'getGamepadPathForID'
--                   .
--
--     [C declaration]: @SDL_GetGamepadPathForID@, defined at @SDL3\/SDL_gamepad.h 591:42@
getGamepadPathForIDSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadPathForIDSafe =
  Safe.sDL_GetGamepadPathForID

-- | Get the player index of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the player index of a gamepad, or -1 if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadPlayerIndex', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadPlayerIndexForID@.
--                   The safe flavor is 'getGamepadPlayerIndexForIDSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadPlayerIndexForID@, defined at @SDL3\/SDL_gamepad.h 608:33@
getGamepadPlayerIndexForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Int32
getGamepadPlayerIndexForID =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetGamepadPlayerIndexForID x00)

-- | Get the player index of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the player index of a gamepad, or -1 if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadPlayerIndex', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadPlayerIndexForID@.
--                   The unsafe flavor is 'getGamepadPlayerIndexForID'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadPlayerIndexForID@, defined at @SDL3\/SDL_gamepad.h 608:33@
getGamepadPlayerIndexForIDSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Int32
getGamepadPlayerIndexForIDSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetGamepadPlayerIndexForID x00)

-- | Get the implementation-dependent GUID of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the GUID of the selected gamepad. If called on an invalid index, this function returns a zero GUID.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Guid.guidToString', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadGUIDForID@.
--                   The safe flavor is 'getGamepadGUIDForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadGUIDForID@, defined at @SDL3\/SDL_gamepad.h 626:38@
getGamepadGUIDForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID
getGamepadGUIDForID = Unsafe.sDL_GetGamepadGUIDForID

-- | Get the implementation-dependent GUID of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the GUID of the selected gamepad. If called on an invalid index, this function returns a zero GUID.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Guid.guidToString', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadGUIDForID@.
--                   The unsafe flavor is 'getGamepadGUIDForID'
--                   .
--
--     [C declaration]: @SDL_GetGamepadGUIDForID@, defined at @SDL3\/SDL_gamepad.h 626:38@
getGamepadGUIDForIDSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID
getGamepadGUIDForIDSafe =
  Safe.sDL_GetGamepadGUIDForID

-- | Get the USB vendor ID of a gamepad, if available.
--
--     This can be called before any gamepads are opened. If the vendor ID isn\'t available this function returns 0.
--
--     [Returns]: the USB vendor ID of the selected gamepad. If called on an invalid index, this function returns zero.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadVendor', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadVendorForID@.
--                   The safe flavor is 'getGamepadVendorForIDSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadVendorForID@, defined at @SDL3\/SDL_gamepad.h 645:36@
getGamepadVendorForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Word16
getGamepadVendorForID =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetGamepadVendorForID x00)

-- | Get the USB vendor ID of a gamepad, if available.
--
--     This can be called before any gamepads are opened. If the vendor ID isn\'t available this function returns 0.
--
--     [Returns]: the USB vendor ID of the selected gamepad. If called on an invalid index, this function returns zero.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadVendor', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadVendorForID@.
--                   The unsafe flavor is 'getGamepadVendorForID'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadVendorForID@, defined at @SDL3\/SDL_gamepad.h 645:36@
getGamepadVendorForIDSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Word16
getGamepadVendorForIDSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetGamepadVendorForID x00)

-- | Get the USB product ID of a gamepad, if available.
--
--     This can be called before any gamepads are opened. If the product ID isn\'t available this function returns 0.
--
--     [Returns]: the USB product ID of the selected gamepad. If called on an invalid index, this function returns zero.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadProduct', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadProductForID@.
--                   The safe flavor is 'getGamepadProductForIDSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadProductForID@, defined at @SDL3\/SDL_gamepad.h 664:36@
getGamepadProductForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Word16
getGamepadProductForID =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetGamepadProductForID x00)

-- | Get the USB product ID of a gamepad, if available.
--
--     This can be called before any gamepads are opened. If the product ID isn\'t available this function returns 0.
--
--     [Returns]: the USB product ID of the selected gamepad. If called on an invalid index, this function returns zero.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadProduct', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadProductForID@.
--                   The unsafe flavor is 'getGamepadProductForID'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadProductForID@, defined at @SDL3\/SDL_gamepad.h 664:36@
getGamepadProductForIDSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Word16
getGamepadProductForIDSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetGamepadProductForID x00)

-- | Get the product version of a gamepad, if available.
--
--     This can be called before any gamepads are opened. If the product version isn\'t available this function returns 0.
--
--     [Returns]: the product version of the selected gamepad. If called on an invalid index, this function returns zero.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadProductVersion', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadProductVersionForID@.
--                   The safe flavor is 'getGamepadProductVersionForIDSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadProductVersionForID@, defined at @SDL3\/SDL_gamepad.h 683:36@
getGamepadProductVersionForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Word16
getGamepadProductVersionForID =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetGamepadProductVersionForID x00)

-- | Get the product version of a gamepad, if available.
--
--     This can be called before any gamepads are opened. If the product version isn\'t available this function returns 0.
--
--     [Returns]: the product version of the selected gamepad. If called on an invalid index, this function returns zero.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadProductVersion', 'getGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadProductVersionForID@.
--                   The unsafe flavor is 'getGamepadProductVersionForID'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadProductVersionForID@, defined at @SDL3\/SDL_gamepad.h 683:36@
getGamepadProductVersionForIDSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.Word16
getGamepadProductVersionForIDSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetGamepadProductVersionForID x00)

-- | Get the type of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the gamepad type.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadType', 'getGamepads', 'getRealGamepadTypeForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadTypeForID@.
--                   The safe flavor is 'getGamepadTypeForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadTypeForID@, defined at @SDL3\/SDL_gamepad.h 701:45@
getGamepadTypeForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL_GamepadType
getGamepadTypeForID = Unsafe.sDL_GetGamepadTypeForID

-- | Get the type of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the gamepad type.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadType', 'getGamepads', 'getRealGamepadTypeForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadTypeForID@.
--                   The unsafe flavor is 'getGamepadTypeForID'
--                   .
--
--     [C declaration]: @SDL_GetGamepadTypeForID@, defined at @SDL3\/SDL_gamepad.h 701:45@
getGamepadTypeForIDSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL_GamepadType
getGamepadTypeForIDSafe =
  Safe.sDL_GetGamepadTypeForID

-- | Get the type of a gamepad, ignoring any mapping override.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the gamepad type.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadTypeForID', 'getGamepads', 'getRealGamepadType'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRealGamepadTypeForID@.
--                   The safe flavor is 'getRealGamepadTypeForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetRealGamepadTypeForID@, defined at @SDL3\/SDL_gamepad.h 719:45@
getRealGamepadTypeForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL_GamepadType
getRealGamepadTypeForID =
  Unsafe.sDL_GetRealGamepadTypeForID

-- | Get the type of a gamepad, ignoring any mapping override.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the gamepad type.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadTypeForID', 'getGamepads', 'getRealGamepadType'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRealGamepadTypeForID@.
--                   The unsafe flavor is 'getRealGamepadTypeForID'
--                   .
--
--     [C declaration]: @SDL_GetRealGamepadTypeForID@, defined at @SDL3\/SDL_gamepad.h 719:45@
getRealGamepadTypeForIDSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL_GamepadType
getRealGamepadTypeForIDSafe =
  Safe.sDL_GetRealGamepadTypeForID

-- | Get the mapping of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the mapping string. Returns NULL if no mapping is available. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepads', 'getGamepadMapping'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadMappingForID@.
--                   The safe flavor is 'getGamepadMappingForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadMappingForID@, defined at @SDL3\/SDL_gamepad.h 737:36@
getGamepadMappingForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (BG.Ptr BG.CChar)
getGamepadMappingForID =
  Unsafe.sDL_GetGamepadMappingForID

-- | Get the mapping of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [Returns]: the mapping string. Returns NULL if no mapping is available. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepads', 'getGamepadMapping'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadMappingForID@.
--                   The unsafe flavor is 'getGamepadMappingForID'
--                   .
--
--     [C declaration]: @SDL_GetGamepadMappingForID@, defined at @SDL3\/SDL_gamepad.h 737:36@
getGamepadMappingForIDSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (BG.Ptr BG.CChar)
getGamepadMappingForIDSafe =
  Safe.sDL_GetGamepadMappingForID

-- | Open a gamepad for use.
--
--     [Returns]: a gamepad identifier or NULL if an error occurred; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeGamepad', 'isGamepad'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenGamepad@.
--                   The safe flavor is 'openGamepadSafe'
--                   .
--
--     [C declaration]: @SDL_OpenGamepad@, defined at @SDL3\/SDL_gamepad.h 753:43@
openGamepad
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (BG.Ptr SDL_Gamepad)
openGamepad = Unsafe.sDL_OpenGamepad

-- | Open a gamepad for use.
--
--     [Returns]: a gamepad identifier or NULL if an error occurred; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeGamepad', 'isGamepad'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenGamepad@.
--                   The unsafe flavor is 'openGamepad'
--                   .
--
--     [C declaration]: @SDL_OpenGamepad@, defined at @SDL3\/SDL_gamepad.h 753:43@
openGamepadSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (BG.Ptr SDL_Gamepad)
openGamepadSafe = Safe.sDL_OpenGamepad

-- | Get the 'SDL_Gamepad' associated with a joystick instance ID, if it has been opened.
--
--     [Returns]: an 'SDL_Gamepad' on success or NULL on failure or if it hasn\'t been opened yet; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadFromID@.
--                   The safe flavor is 'getGamepadFromIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadFromID@, defined at @SDL3\/SDL_gamepad.h 767:43@
getGamepadFromID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID of the gamepad.
  -> IO (BG.Ptr SDL_Gamepad)
getGamepadFromID = Unsafe.sDL_GetGamepadFromID

-- | Get the 'SDL_Gamepad' associated with a joystick instance ID, if it has been opened.
--
--     [Returns]: an 'SDL_Gamepad' on success or NULL on failure or if it hasn\'t been opened yet; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadFromID@.
--                   The unsafe flavor is 'getGamepadFromID'
--                   .
--
--     [C declaration]: @SDL_GetGamepadFromID@, defined at @SDL3\/SDL_gamepad.h 767:43@
getGamepadFromIDSafe
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID of the gamepad.
  -> IO (BG.Ptr SDL_Gamepad)
getGamepadFromIDSafe = Safe.sDL_GetGamepadFromID

-- | Get the 'SDL_Gamepad' associated with a player index.
--
--     [Returns]: the 'SDL_Gamepad' associated with a player index.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadPlayerIndex', 'setGamepadPlayerIndex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadFromPlayerIndex@.
--                   The safe flavor is 'getGamepadFromPlayerIndexSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadFromPlayerIndex@, defined at @SDL3\/SDL_gamepad.h 782:43@
getGamepadFromPlayerIndex
  :: BG.Int32
  -- ^
  --
  --           [@player_index@]: the player index, which different from the instance ID.
  -> IO (BG.Ptr SDL_Gamepad)
getGamepadFromPlayerIndex =
  \x00 ->
    Unsafe.sDL_GetGamepadFromPlayerIndex (Coerce.coerce x00)

-- | Get the 'SDL_Gamepad' associated with a player index.
--
--     [Returns]: the 'SDL_Gamepad' associated with a player index.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadPlayerIndex', 'setGamepadPlayerIndex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadFromPlayerIndex@.
--                   The unsafe flavor is 'getGamepadFromPlayerIndex'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadFromPlayerIndex@, defined at @SDL3\/SDL_gamepad.h 782:43@
getGamepadFromPlayerIndexSafe
  :: BG.Int32
  -- ^
  --
  --           [@player_index@]: the player index, which different from the instance ID.
  -> IO (BG.Ptr SDL_Gamepad)
getGamepadFromPlayerIndexSafe =
  \x00 ->
    Safe.sDL_GetGamepadFromPlayerIndex (Coerce.coerce x00)

-- | Get the properties associated with an opened gamepad.
--
--     These properties are shared with the underlying joystick object.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_GAMEPAD_CAP_MONO_LED_BOOLEAN'@: true if this gamepad has an LED that has adjustable brightness
--
--     * @'sDL_PROP_GAMEPAD_CAP_RGB_LED_BOOLEAN'@: true if this gamepad has an LED that has adjustable color
--
--     * @'sDL_PROP_GAMEPAD_CAP_PLAYER_LED_BOOLEAN'@: true if this gamepad has a player LED
--
--     * @'sDL_PROP_GAMEPAD_CAP_RUMBLE_BOOLEAN'@: true if this gamepad has left\/right rumble
--
--     * @'sDL_PROP_GAMEPAD_CAP_TRIGGER_RUMBLE_BOOLEAN'@: true if this gamepad has simple trigger rumble
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadProperties@.
--                   The safe flavor is 'getGamepadPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadProperties@, defined at @SDL3\/SDL_gamepad.h 811:46@
getGamepadProperties
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @'openGamepad'@.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getGamepadProperties =
  Unsafe.sDL_GetGamepadProperties

-- | Get the properties associated with an opened gamepad.
--
--     These properties are shared with the underlying joystick object.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_GAMEPAD_CAP_MONO_LED_BOOLEAN'@: true if this gamepad has an LED that has adjustable brightness
--
--     * @'sDL_PROP_GAMEPAD_CAP_RGB_LED_BOOLEAN'@: true if this gamepad has an LED that has adjustable color
--
--     * @'sDL_PROP_GAMEPAD_CAP_PLAYER_LED_BOOLEAN'@: true if this gamepad has a player LED
--
--     * @'sDL_PROP_GAMEPAD_CAP_RUMBLE_BOOLEAN'@: true if this gamepad has left\/right rumble
--
--     * @'sDL_PROP_GAMEPAD_CAP_TRIGGER_RUMBLE_BOOLEAN'@: true if this gamepad has simple trigger rumble
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadProperties@.
--                   The unsafe flavor is 'getGamepadProperties'
--                   .
--
--     [C declaration]: @SDL_GetGamepadProperties@, defined at @SDL3\/SDL_gamepad.h 811:46@
getGamepadPropertiesSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @'openGamepad'@.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getGamepadPropertiesSafe =
  Safe.sDL_GetGamepadProperties

-- | Get the instance ID of an opened gamepad.
--
--     [Returns]: the instance ID of the specified gamepad on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadID@.
--                   The safe flavor is 'getGamepadIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadID@, defined at @SDL3\/SDL_gamepad.h 831:44@
getGamepadID
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @'openGamepad'@.
  -> IO SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
getGamepadID = Unsafe.sDL_GetGamepadID

-- | Get the instance ID of an opened gamepad.
--
--     [Returns]: the instance ID of the specified gamepad on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadID@.
--                   The unsafe flavor is 'getGamepadID'
--                   .
--
--     [C declaration]: @SDL_GetGamepadID@, defined at @SDL3\/SDL_gamepad.h 831:44@
getGamepadIDSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @'openGamepad'@.
  -> IO SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
getGamepadIDSafe = Safe.sDL_GetGamepadID

-- | Get the implementation-dependent name for an opened gamepad.
--
--     [Returns]: the implementation dependent name for the gamepad, or NULL if there is no name or the identifier passed is invalid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadNameForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadName@.
--                   The safe flavor is 'getGamepadNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadName@, defined at @SDL3\/SDL_gamepad.h 847:42@
getGamepadName
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @'openGamepad'@.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadName = Unsafe.sDL_GetGamepadName

-- | Get the implementation-dependent name for an opened gamepad.
--
--     [Returns]: the implementation dependent name for the gamepad, or NULL if there is no name or the identifier passed is invalid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadNameForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadName@.
--                   The unsafe flavor is 'getGamepadName'
--                   .
--
--     [C declaration]: @SDL_GetGamepadName@, defined at @SDL3\/SDL_gamepad.h 847:42@
getGamepadNameSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @'openGamepad'@.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadNameSafe = Safe.sDL_GetGamepadName

-- | Get the implementation-dependent path for an opened gamepad.
--
--     [Returns]: the implementation dependent path for the gamepad, or NULL if there is no path or the identifier passed is invalid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadPathForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadPath@.
--                   The safe flavor is 'getGamepadPathSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadPath@, defined at @SDL3\/SDL_gamepad.h 863:42@
getGamepadPath
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @'openGamepad'@.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadPath = Unsafe.sDL_GetGamepadPath

-- | Get the implementation-dependent path for an opened gamepad.
--
--     [Returns]: the implementation dependent path for the gamepad, or NULL if there is no path or the identifier passed is invalid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadPathForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadPath@.
--                   The unsafe flavor is 'getGamepadPath'
--                   .
--
--     [C declaration]: @SDL_GetGamepadPath@, defined at @SDL3\/SDL_gamepad.h 863:42@
getGamepadPathSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @'openGamepad'@.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadPathSafe = Safe.sDL_GetGamepadPath

-- | Get the type of an opened gamepad.
--
--     [Returns]: the gamepad type, or SDL_GAMEPAD_TYPE_UNKNOWN if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadTypeForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadType@.
--                   The safe flavor is 'getGamepadTypeSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadType@, defined at @SDL3\/SDL_gamepad.h 878:45@
getGamepadType
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL_GamepadType
getGamepadType = Unsafe.sDL_GetGamepadType

-- | Get the type of an opened gamepad.
--
--     [Returns]: the gamepad type, or SDL_GAMEPAD_TYPE_UNKNOWN if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadTypeForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadType@.
--                   The unsafe flavor is 'getGamepadType'
--                   .
--
--     [C declaration]: @SDL_GetGamepadType@, defined at @SDL3\/SDL_gamepad.h 878:45@
getGamepadTypeSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL_GamepadType
getGamepadTypeSafe = Safe.sDL_GetGamepadType

-- | Get the type of an opened gamepad, ignoring any mapping override.
--
--     [Returns]: the gamepad type, or SDL_GAMEPAD_TYPE_UNKNOWN if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRealGamepadTypeForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRealGamepadType@.
--                   The safe flavor is 'getRealGamepadTypeSafe'
--                   .
--
--     [C declaration]: @SDL_GetRealGamepadType@, defined at @SDL3\/SDL_gamepad.h 893:45@
getRealGamepadType
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL_GamepadType
getRealGamepadType = Unsafe.sDL_GetRealGamepadType

-- | Get the type of an opened gamepad, ignoring any mapping override.
--
--     [Returns]: the gamepad type, or SDL_GAMEPAD_TYPE_UNKNOWN if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRealGamepadTypeForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRealGamepadType@.
--                   The unsafe flavor is 'getRealGamepadType'
--                   .
--
--     [C declaration]: @SDL_GetRealGamepadType@, defined at @SDL3\/SDL_gamepad.h 893:45@
getRealGamepadTypeSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL_GamepadType
getRealGamepadTypeSafe = Safe.sDL_GetRealGamepadType

-- | Get the player index of an opened gamepad.
--
--     For XInput gamepads this returns the XInput user index.
--
--     [Returns]: the player index for gamepad, or -1 if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setGamepadPlayerIndex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadPlayerIndex@.
--                   The safe flavor is 'getGamepadPlayerIndexSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadPlayerIndex@, defined at @SDL3\/SDL_gamepad.h 909:33@
getGamepadPlayerIndex
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.Int32
getGamepadPlayerIndex =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetGamepadPlayerIndex x00)

-- | Get the player index of an opened gamepad.
--
--     For XInput gamepads this returns the XInput user index.
--
--     [Returns]: the player index for gamepad, or -1 if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setGamepadPlayerIndex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadPlayerIndex@.
--                   The unsafe flavor is 'getGamepadPlayerIndex'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadPlayerIndex@, defined at @SDL3\/SDL_gamepad.h 909:33@
getGamepadPlayerIndexSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.Int32
getGamepadPlayerIndexSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetGamepadPlayerIndex x00)

-- | Set the player index of an opened gamepad.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadPlayerIndex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGamepadPlayerIndex@.
--                   The safe flavor is 'setGamepadPlayerIndexSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGamepadPlayerIndex@, defined at @SDL3\/SDL_gamepad.h 926:34@
setGamepadPlayerIndex
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to adjust.
  -> BG.Int32
  -- ^
  --
  --           [@player_index@]: player index to assign to this gamepad, or -1 to clear the player index and turn off player LEDs.
  -> IO Bool
setGamepadPlayerIndex =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetGamepadPlayerIndex x00 (Coerce.coerce x11))

-- | Set the player index of an opened gamepad.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadPlayerIndex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGamepadPlayerIndex@.
--                   The unsafe flavor is 'setGamepadPlayerIndex'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGamepadPlayerIndex@, defined at @SDL3\/SDL_gamepad.h 926:34@
setGamepadPlayerIndexSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to adjust.
  -> BG.Int32
  -- ^
  --
  --           [@player_index@]: player index to assign to this gamepad, or -1 to clear the player index and turn off player LEDs.
  -> IO Bool
setGamepadPlayerIndexSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetGamepadPlayerIndex x00 (Coerce.coerce x11))

-- | Get the USB vendor ID of an opened gamepad, if available.
--
--     If the vendor ID isn\'t available this function returns 0.
--
--     [Returns]: the USB vendor ID, or zero if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadVendorForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadVendor@.
--                   The safe flavor is 'getGamepadVendorSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadVendor@, defined at @SDL3\/SDL_gamepad.h 942:36@
getGamepadVendor
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.Word16
getGamepadVendor =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetGamepadVendor x00)

-- | Get the USB vendor ID of an opened gamepad, if available.
--
--     If the vendor ID isn\'t available this function returns 0.
--
--     [Returns]: the USB vendor ID, or zero if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadVendorForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadVendor@.
--                   The unsafe flavor is 'getGamepadVendor'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadVendor@, defined at @SDL3\/SDL_gamepad.h 942:36@
getGamepadVendorSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.Word16
getGamepadVendorSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetGamepadVendor x00)

-- | Get the USB product ID of an opened gamepad, if available.
--
--     If the product ID isn\'t available this function returns 0.
--
--     [Returns]: the USB product ID, or zero if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadProductForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadProduct@.
--                   The safe flavor is 'getGamepadProductSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadProduct@, defined at @SDL3\/SDL_gamepad.h 958:36@
getGamepadProduct
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.Word16
getGamepadProduct =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetGamepadProduct x00)

-- | Get the USB product ID of an opened gamepad, if available.
--
--     If the product ID isn\'t available this function returns 0.
--
--     [Returns]: the USB product ID, or zero if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadProductForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadProduct@.
--                   The unsafe flavor is 'getGamepadProduct'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadProduct@, defined at @SDL3\/SDL_gamepad.h 958:36@
getGamepadProductSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.Word16
getGamepadProductSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetGamepadProduct x00)

-- | Get the product version of an opened gamepad, if available.
--
--     If the product version isn\'t available this function returns 0.
--
--     [Returns]: the USB product version, or zero if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadProductVersionForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadProductVersion@.
--                   The safe flavor is 'getGamepadProductVersionSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadProductVersion@, defined at @SDL3\/SDL_gamepad.h 974:36@
getGamepadProductVersion
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.Word16
getGamepadProductVersion =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetGamepadProductVersion x00)

-- | Get the product version of an opened gamepad, if available.
--
--     If the product version isn\'t available this function returns 0.
--
--     [Returns]: the USB product version, or zero if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadProductVersionForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadProductVersion@.
--                   The unsafe flavor is 'getGamepadProductVersion'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadProductVersion@, defined at @SDL3\/SDL_gamepad.h 974:36@
getGamepadProductVersionSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.Word16
getGamepadProductVersionSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetGamepadProductVersion x00)

-- | Get the firmware version of an opened gamepad, if available.
--
--     If the firmware version isn\'t available this function returns 0.
--
--     [Returns]: the gamepad firmware version, or zero if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadFirmwareVersion@.
--                   The safe flavor is 'getGamepadFirmwareVersionSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadFirmwareVersion@, defined at @SDL3\/SDL_gamepad.h 988:36@
getGamepadFirmwareVersion
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.Word16
getGamepadFirmwareVersion =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetGamepadFirmwareVersion x00)

-- | Get the firmware version of an opened gamepad, if available.
--
--     If the firmware version isn\'t available this function returns 0.
--
--     [Returns]: the gamepad firmware version, or zero if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadFirmwareVersion@.
--                   The unsafe flavor is 'getGamepadFirmwareVersion'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadFirmwareVersion@, defined at @SDL3\/SDL_gamepad.h 988:36@
getGamepadFirmwareVersionSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.Word16
getGamepadFirmwareVersionSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetGamepadFirmwareVersion x00)

-- | Get the serial number of an opened gamepad, if available.
--
--     Returns the serial number of the gamepad, or NULL if it is not available.
--
--     [Returns]: the serial number, or NULL if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadSerial@.
--                   The safe flavor is 'getGamepadSerialSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadSerial@, defined at @SDL3\/SDL_gamepad.h 1002:42@
getGamepadSerial
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadSerial = Unsafe.sDL_GetGamepadSerial

-- | Get the serial number of an opened gamepad, if available.
--
--     Returns the serial number of the gamepad, or NULL if it is not available.
--
--     [Returns]: the serial number, or NULL if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadSerial@.
--                   The unsafe flavor is 'getGamepadSerial'
--                   .
--
--     [C declaration]: @SDL_GetGamepadSerial@, defined at @SDL3\/SDL_gamepad.h 1002:42@
getGamepadSerialSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadSerialSafe = Safe.sDL_GetGamepadSerial

-- | Get the Steam Input handle of an opened gamepad, if available.
--
--     Returns an InputHandle_t for the gamepad that can be used with Steam Input API: [https:\/\/partner.steamgames.com\/doc\/api\/ISteamInput](https://partner.steamgames.com/doc/api/ISteamInput)
--
--     [Returns]: the gamepad handle, or 0 if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadSteamHandle@.
--                   The safe flavor is 'getGamepadSteamHandleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadSteamHandle@, defined at @SDL3\/SDL_gamepad.h 1017:36@
getGamepadSteamHandle
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.Word64
getGamepadSteamHandle =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetGamepadSteamHandle x00)

-- | Get the Steam Input handle of an opened gamepad, if available.
--
--     Returns an InputHandle_t for the gamepad that can be used with Steam Input API: [https:\/\/partner.steamgames.com\/doc\/api\/ISteamInput](https://partner.steamgames.com/doc/api/ISteamInput)
--
--     [Returns]: the gamepad handle, or 0 if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadSteamHandle@.
--                   The unsafe flavor is 'getGamepadSteamHandle'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadSteamHandle@, defined at @SDL3\/SDL_gamepad.h 1017:36@
getGamepadSteamHandleSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.Word64
getGamepadSteamHandleSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetGamepadSteamHandle x00)

-- | Get the connection state of a gamepad.
--
--     [Returns]: the connection state on success or @SDL_JOYSTICK_CONNECTION_INVALID@ on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadConnectionState@.
--                   The safe flavor is 'getGamepadConnectionStateSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadConnectionState@, defined at @SDL3\/SDL_gamepad.h 1031:57@
getGamepadConnectionState
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL3.Sys.Bindgen.Joystick.SDL_JoystickConnectionState
getGamepadConnectionState =
  Unsafe.sDL_GetGamepadConnectionState

-- | Get the connection state of a gamepad.
--
--     [Returns]: the connection state on success or @SDL_JOYSTICK_CONNECTION_INVALID@ on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadConnectionState@.
--                   The unsafe flavor is 'getGamepadConnectionState'
--                   .
--
--     [C declaration]: @SDL_GetGamepadConnectionState@, defined at @SDL3\/SDL_gamepad.h 1031:57@
getGamepadConnectionStateSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL3.Sys.Bindgen.Joystick.SDL_JoystickConnectionState
getGamepadConnectionStateSafe =
  Safe.sDL_GetGamepadConnectionState

-- | Get the battery state of a gamepad.
--
--     You should never take a battery status as absolute truth. Batteries (especially failing batteries) are delicate hardware, and the values reported here are best estimates based on what that hardware reports. It\'s not uncommon for older batteries to lose stored power much faster than it reports, or completely drain when reporting it has 20 percent left, etc.
--
--     [Returns]: the current battery state.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadPowerInfo@.
--                   The safe flavor is 'getGamepadPowerInfoSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadPowerInfo@, defined at @SDL3\/SDL_gamepad.h 1053:44@
getGamepadPowerInfo
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@percent@]: a pointer filled in with the percentage of battery life left, between 0 and 100, or NULL to ignore. This will be filled in with -1 we can\'t determine a value or there is no battery.
  -> IO SDL3.Sys.Bindgen.Power.SDL_PowerState
getGamepadPowerInfo = Unsafe.sDL_GetGamepadPowerInfo

-- | Get the battery state of a gamepad.
--
--     You should never take a battery status as absolute truth. Batteries (especially failing batteries) are delicate hardware, and the values reported here are best estimates based on what that hardware reports. It\'s not uncommon for older batteries to lose stored power much faster than it reports, or completely drain when reporting it has 20 percent left, etc.
--
--     [Returns]: the current battery state.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadPowerInfo@.
--                   The unsafe flavor is 'getGamepadPowerInfo'
--                   .
--
--     [C declaration]: @SDL_GetGamepadPowerInfo@, defined at @SDL3\/SDL_gamepad.h 1053:44@
getGamepadPowerInfoSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@percent@]: a pointer filled in with the percentage of battery life left, between 0 and 100, or NULL to ignore. This will be filled in with -1 we can\'t determine a value or there is no battery.
  -> IO SDL3.Sys.Bindgen.Power.SDL_PowerState
getGamepadPowerInfoSafe =
  Safe.sDL_GetGamepadPowerInfo

-- | Check if a gamepad has been opened and is currently connected.
--
--     [Returns]: true if the gamepad has been opened and is currently connected, or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GamepadConnected@.
--                   The safe flavor is 'gamepadConnectedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GamepadConnected@, defined at @SDL3\/SDL_gamepad.h 1067:34@
gamepadConnected
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @'openGamepad'@.
  -> IO Bool
gamepadConnected =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GamepadConnected x00)

-- | Check if a gamepad has been opened and is currently connected.
--
--     [Returns]: true if the gamepad has been opened and is currently connected, or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GamepadConnected@.
--                   The unsafe flavor is 'gamepadConnected'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GamepadConnected@, defined at @SDL3\/SDL_gamepad.h 1067:34@
gamepadConnectedSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @'openGamepad'@.
  -> IO Bool
gamepadConnectedSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GamepadConnected x00)

-- | Get the underlying joystick from a gamepad.
--
--     This function will give you a SDL_Joystick object, which allows you to use the SDL_Joystick functions with a 'SDL_Gamepad' object. This would be useful for getting a joystick\'s position at any given time, even if it hasn\'t moved (moving it would produce an event, which would have the axis\' value).
--
--     The pointer returned is owned by the 'SDL_Gamepad'. You should not call 'SDL3.Sys.Joystick.closeJoystick' on it, for example, since doing so will likely cause SDL to crash.
--
--     [Returns]: an SDL_Joystick object, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadJoystick@.
--                   The safe flavor is 'getGamepadJoystickSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadJoystick@, defined at @SDL3\/SDL_gamepad.h 1089:44@
getGamepadJoystick
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object that you want to get a joystick from.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick)
getGamepadJoystick = Unsafe.sDL_GetGamepadJoystick

-- | Get the underlying joystick from a gamepad.
--
--     This function will give you a SDL_Joystick object, which allows you to use the SDL_Joystick functions with a 'SDL_Gamepad' object. This would be useful for getting a joystick\'s position at any given time, even if it hasn\'t moved (moving it would produce an event, which would have the axis\' value).
--
--     The pointer returned is owned by the 'SDL_Gamepad'. You should not call 'SDL3.Sys.Joystick.closeJoystick' on it, for example, since doing so will likely cause SDL to crash.
--
--     [Returns]: an SDL_Joystick object, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadJoystick@.
--                   The unsafe flavor is 'getGamepadJoystick'
--                   .
--
--     [C declaration]: @SDL_GetGamepadJoystick@, defined at @SDL3\/SDL_gamepad.h 1089:44@
getGamepadJoystickSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object that you want to get a joystick from.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick)
getGamepadJoystickSafe = Safe.sDL_GetGamepadJoystick

-- | Set the state of gamepad event processing.
--
--     If gamepad events are disabled, you must call @'updateGamepads'@ yourself and check the state of the gamepad when you want gamepad information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'gamepadEventsEnabled', 'updateGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGamepadEventsEnabled@.
--                   The safe flavor is 'setGamepadEventsEnabledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGamepadEventsEnabled@, defined at @SDL3\/SDL_gamepad.h 1106:34@
setGamepadEventsEnabled
  :: Bool
  -- ^
  --
  --           [@enabled@]: whether to process gamepad events or not.
  -> IO ()
setGamepadEventsEnabled =
  \x00 ->
    Unsafe.sDL_SetGamepadEventsEnabled (CBool.fromBool x00)

-- | Set the state of gamepad event processing.
--
--     If gamepad events are disabled, you must call @'updateGamepads'@ yourself and check the state of the gamepad when you want gamepad information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'gamepadEventsEnabled', 'updateGamepads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGamepadEventsEnabled@.
--                   The unsafe flavor is 'setGamepadEventsEnabled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGamepadEventsEnabled@, defined at @SDL3\/SDL_gamepad.h 1106:34@
setGamepadEventsEnabledSafe
  :: Bool
  -- ^
  --
  --           [@enabled@]: whether to process gamepad events or not.
  -> IO ()
setGamepadEventsEnabledSafe =
  \x00 ->
    Safe.sDL_SetGamepadEventsEnabled (CBool.fromBool x00)

-- | Query the state of gamepad event processing.
--
--     If gamepad events are disabled, you must call @'updateGamepads'@ yourself and check the state of the gamepad when you want gamepad information.
--
--     [Returns]: true if gamepad events are being processed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setGamepadEventsEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GamepadEventsEnabled@.
--                   The safe flavor is 'gamepadEventsEnabledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GamepadEventsEnabled@, defined at @SDL3\/SDL_gamepad.h 1122:34@
gamepadEventsEnabled :: IO Bool
gamepadEventsEnabled =
  fmap CBool.toBool Unsafe.sDL_GamepadEventsEnabled

-- | Query the state of gamepad event processing.
--
--     If gamepad events are disabled, you must call @'updateGamepads'@ yourself and check the state of the gamepad when you want gamepad information.
--
--     [Returns]: true if gamepad events are being processed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setGamepadEventsEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GamepadEventsEnabled@.
--                   The unsafe flavor is 'gamepadEventsEnabled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GamepadEventsEnabled@, defined at @SDL3\/SDL_gamepad.h 1122:34@
gamepadEventsEnabledSafe :: IO Bool
gamepadEventsEnabledSafe =
  fmap CBool.toBool Safe.sDL_GamepadEventsEnabled

-- | Get the SDL joystick layer bindings for a gamepad.
--
--     [Returns]: a NULL terminated array of pointers to bindings or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadBindings@.
--                   The safe flavor is 'getGamepadBindingsSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadBindings@, defined at @SDL3\/SDL_gamepad.h 1138:51@
getGamepadBindings
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of bindings returned.
  -> IO (BG.Ptr (BG.Ptr SDL_GamepadBinding))
getGamepadBindings = Unsafe.sDL_GetGamepadBindings

-- | Get the SDL joystick layer bindings for a gamepad.
--
--     [Returns]: a NULL terminated array of pointers to bindings or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadBindings@.
--                   The unsafe flavor is 'getGamepadBindings'
--                   .
--
--     [C declaration]: @SDL_GetGamepadBindings@, defined at @SDL3\/SDL_gamepad.h 1138:51@
getGamepadBindingsSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of bindings returned.
  -> IO (BG.Ptr (BG.Ptr SDL_GamepadBinding))
getGamepadBindingsSafe = Safe.sDL_GetGamepadBindings

-- | Manually pump gamepad updates if not using the loop.
--
--     This function is called automatically by the event loop if events are enabled. Under such circumstances, it will not be necessary to call this function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UpdateGamepads@.
--                   The safe flavor is 'updateGamepadsSafe'
--                   : routes through joystick update; virtual-device callbacks run synchronously.
--
--     [C declaration]: @SDL_UpdateGamepads@, defined at @SDL3\/SDL_gamepad.h 1151:34@
updateGamepads :: IO ()
updateGamepads = Unsafe.sDL_UpdateGamepads

-- | Manually pump gamepad updates if not using the loop.
--
--     This function is called automatically by the event loop if events are enabled. Under such circumstances, it will not be necessary to call this function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UpdateGamepads@.
--                   The unsafe flavor is 'updateGamepads'
--                   : routes through joystick update; virtual-device callbacks run synchronously.
--
--     [C declaration]: @SDL_UpdateGamepads@, defined at @SDL3\/SDL_gamepad.h 1151:34@
updateGamepadsSafe :: IO ()
updateGamepadsSafe = Safe.sDL_UpdateGamepads

-- | Convert a string into 'SDL_GamepadType' enum.
--
--     This function is called internally to translate 'SDL_Gamepad' mapping strings for the underlying joystick device into the consistent 'SDL_Gamepad' mapping. You do not normally need to call this function unless you are parsing 'SDL_Gamepad' mappings in your own code.
--
--     [Returns]: the 'SDL_GamepadType' enum corresponding to the input string, or @SDL_GAMEPAD_TYPE_UNKNOWN@ if no match was found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadStringForType'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadTypeFromString@.
--                   The safe flavor is 'getGamepadTypeFromStringSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadTypeFromString@, defined at @SDL3\/SDL_gamepad.h 1171:45@
getGamepadTypeFromString
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: string representing a 'SDL_GamepadType' type.
  -> IO SDL_GamepadType
getGamepadTypeFromString =
  Unsafe.sDL_GetGamepadTypeFromString

-- | Convert a string into 'SDL_GamepadType' enum.
--
--     This function is called internally to translate 'SDL_Gamepad' mapping strings for the underlying joystick device into the consistent 'SDL_Gamepad' mapping. You do not normally need to call this function unless you are parsing 'SDL_Gamepad' mappings in your own code.
--
--     [Returns]: the 'SDL_GamepadType' enum corresponding to the input string, or @SDL_GAMEPAD_TYPE_UNKNOWN@ if no match was found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadStringForType'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadTypeFromString@.
--                   The unsafe flavor is 'getGamepadTypeFromString'
--                   .
--
--     [C declaration]: @SDL_GetGamepadTypeFromString@, defined at @SDL3\/SDL_gamepad.h 1171:45@
getGamepadTypeFromStringSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: string representing a 'SDL_GamepadType' type.
  -> IO SDL_GamepadType
getGamepadTypeFromStringSafe =
  Safe.sDL_GetGamepadTypeFromString

-- | Convert from an 'SDL_GamepadType' enum to a string.
--
--     [Returns]: a string for the given type, or NULL if an invalid type is specified. The string returned is of the format used by 'SDL_Gamepad' mapping strings.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadTypeFromString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadStringForType@.
--                   The safe flavor is 'getGamepadStringForTypeSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadStringForType@, defined at @SDL3\/SDL_gamepad.h 1187:42@
getGamepadStringForType
  :: SDL_GamepadType
  -- ^
  --
  --           [@type@]: an enum value for a given 'SDL_GamepadType'.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadStringForType =
  Unsafe.sDL_GetGamepadStringForType

-- | Convert from an 'SDL_GamepadType' enum to a string.
--
--     [Returns]: a string for the given type, or NULL if an invalid type is specified. The string returned is of the format used by 'SDL_Gamepad' mapping strings.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadTypeFromString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadStringForType@.
--                   The unsafe flavor is 'getGamepadStringForType'
--                   .
--
--     [C declaration]: @SDL_GetGamepadStringForType@, defined at @SDL3\/SDL_gamepad.h 1187:42@
getGamepadStringForTypeSafe
  :: SDL_GamepadType
  -- ^
  --
  --           [@type@]: an enum value for a given 'SDL_GamepadType'.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadStringForTypeSafe =
  Safe.sDL_GetGamepadStringForType

-- | Convert a string into 'SDL_GamepadAxis' enum.
--
--     This function is called internally to translate 'SDL_Gamepad' mapping strings for the underlying joystick device into the consistent 'SDL_Gamepad' mapping. You do not normally need to call this function unless you are parsing 'SDL_Gamepad' mappings in your own code.
--
--     Note specially that \"righttrigger\" and \"lefttrigger\" map to @SDL_GAMEPAD_AXIS_RIGHT_TRIGGER@ and @SDL_GAMEPAD_AXIS_LEFT_TRIGGER@, respectively.
--
--     [Returns]: the 'SDL_GamepadAxis' enum corresponding to the input string, or @SDL_GAMEPAD_AXIS_INVALID@ if no match was found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadStringForAxis'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadAxisFromString@.
--                   The safe flavor is 'getGamepadAxisFromStringSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadAxisFromString@, defined at @SDL3\/SDL_gamepad.h 1211:45@
getGamepadAxisFromString
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: string representing a 'SDL_Gamepad' axis.
  -> IO SDL_GamepadAxis
getGamepadAxisFromString =
  Unsafe.sDL_GetGamepadAxisFromString

-- | Convert a string into 'SDL_GamepadAxis' enum.
--
--     This function is called internally to translate 'SDL_Gamepad' mapping strings for the underlying joystick device into the consistent 'SDL_Gamepad' mapping. You do not normally need to call this function unless you are parsing 'SDL_Gamepad' mappings in your own code.
--
--     Note specially that \"righttrigger\" and \"lefttrigger\" map to @SDL_GAMEPAD_AXIS_RIGHT_TRIGGER@ and @SDL_GAMEPAD_AXIS_LEFT_TRIGGER@, respectively.
--
--     [Returns]: the 'SDL_GamepadAxis' enum corresponding to the input string, or @SDL_GAMEPAD_AXIS_INVALID@ if no match was found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadStringForAxis'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadAxisFromString@.
--                   The unsafe flavor is 'getGamepadAxisFromString'
--                   .
--
--     [C declaration]: @SDL_GetGamepadAxisFromString@, defined at @SDL3\/SDL_gamepad.h 1211:45@
getGamepadAxisFromStringSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: string representing a 'SDL_Gamepad' axis.
  -> IO SDL_GamepadAxis
getGamepadAxisFromStringSafe =
  Safe.sDL_GetGamepadAxisFromString

-- | Convert from an 'SDL_GamepadAxis' enum to a string.
--
--     [Returns]: a string for the given axis, or NULL if an invalid axis is specified. The string returned is of the format used by 'SDL_Gamepad' mapping strings.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadAxisFromString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadStringForAxis@.
--                   The safe flavor is 'getGamepadStringForAxisSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadStringForAxis@, defined at @SDL3\/SDL_gamepad.h 1227:42@
getGamepadStringForAxis
  :: SDL_GamepadAxis
  -- ^
  --
  --           [@axis@]: an enum value for a given 'SDL_GamepadAxis'.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadStringForAxis =
  Unsafe.sDL_GetGamepadStringForAxis

-- | Convert from an 'SDL_GamepadAxis' enum to a string.
--
--     [Returns]: a string for the given axis, or NULL if an invalid axis is specified. The string returned is of the format used by 'SDL_Gamepad' mapping strings.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadAxisFromString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadStringForAxis@.
--                   The unsafe flavor is 'getGamepadStringForAxis'
--                   .
--
--     [C declaration]: @SDL_GetGamepadStringForAxis@, defined at @SDL3\/SDL_gamepad.h 1227:42@
getGamepadStringForAxisSafe
  :: SDL_GamepadAxis
  -- ^
  --
  --           [@axis@]: an enum value for a given 'SDL_GamepadAxis'.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadStringForAxisSafe =
  Safe.sDL_GetGamepadStringForAxis

-- | Query whether a gamepad has a given axis.
--
--     This merely reports whether the gamepad\'s mapping defined this axis, as that is all the information SDL has about the physical device.
--
--     [Returns]: true if the gamepad has this axis, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'gamepadHasButton', 'getGamepadAxis'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GamepadHasAxis@.
--                   The safe flavor is 'gamepadHasAxisSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GamepadHasAxis@, defined at @SDL3\/SDL_gamepad.h 1246:34@
gamepadHasAxis
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadAxis
  -- ^
  --
  --           [@axis@]: an axis enum value (an 'SDL_GamepadAxis' value).
  -> IO Bool
gamepadHasAxis =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GamepadHasAxis x00 x11)

-- | Query whether a gamepad has a given axis.
--
--     This merely reports whether the gamepad\'s mapping defined this axis, as that is all the information SDL has about the physical device.
--
--     [Returns]: true if the gamepad has this axis, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'gamepadHasButton', 'getGamepadAxis'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GamepadHasAxis@.
--                   The unsafe flavor is 'gamepadHasAxis'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GamepadHasAxis@, defined at @SDL3\/SDL_gamepad.h 1246:34@
gamepadHasAxisSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadAxis
  -- ^
  --
  --           [@axis@]: an axis enum value (an 'SDL_GamepadAxis' value).
  -> IO Bool
gamepadHasAxisSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GamepadHasAxis x00 x11)

-- | Get the current state of an axis control on a gamepad.
--
--     The axis indices start at index 0.
--
--     For thumbsticks, the state is a value ranging from -32768 (up\/left) to 32767 (down\/right).
--
--     Triggers range from 0 when released to 32767 when fully pressed, and never return a negative value. Note that this differs from the value reported by the lower-level 'SDL3.Sys.Joystick.getJoystickAxis', which normally uses the full range.
--
--     Note that for invalid gamepads or axes, this will return 0. Zero is also a valid value in normal operation; usually it means a centered axis.
--
--     [Returns]: axis state.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'gamepadHasAxis', 'getGamepadButton'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadAxis@.
--                   The safe flavor is 'getGamepadAxisSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadAxis@, defined at @SDL3\/SDL_gamepad.h 1274:36@
getGamepadAxis
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadAxis
  -- ^
  --
  --           [@axis@]: an axis index (one of the 'SDL_GamepadAxis' values).
  -> IO BG.Int16
getGamepadAxis =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_GetGamepadAxis x00 x11)

-- | Get the current state of an axis control on a gamepad.
--
--     The axis indices start at index 0.
--
--     For thumbsticks, the state is a value ranging from -32768 (up\/left) to 32767 (down\/right).
--
--     Triggers range from 0 when released to 32767 when fully pressed, and never return a negative value. Note that this differs from the value reported by the lower-level 'SDL3.Sys.Joystick.getJoystickAxis', which normally uses the full range.
--
--     Note that for invalid gamepads or axes, this will return 0. Zero is also a valid value in normal operation; usually it means a centered axis.
--
--     [Returns]: axis state.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'gamepadHasAxis', 'getGamepadButton'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadAxis@.
--                   The unsafe flavor is 'getGamepadAxis'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadAxis@, defined at @SDL3\/SDL_gamepad.h 1274:36@
getGamepadAxisSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadAxis
  -- ^
  --
  --           [@axis@]: an axis index (one of the 'SDL_GamepadAxis' values).
  -> IO BG.Int16
getGamepadAxisSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_GetGamepadAxis x00 x11)

-- | Convert a string into an 'SDL_GamepadButton' enum.
--
--     This function is called internally to translate 'SDL_Gamepad' mapping strings for the underlying joystick device into the consistent 'SDL_Gamepad' mapping. You do not normally need to call this function unless you are parsing 'SDL_Gamepad' mappings in your own code.
--
--     [Returns]: the 'SDL_GamepadButton' enum corresponding to the input string, or @SDL_GAMEPAD_BUTTON_INVALID@ if no match was found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadStringForButton'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadButtonFromString@.
--                   The safe flavor is 'getGamepadButtonFromStringSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadButtonFromString@, defined at @SDL3\/SDL_gamepad.h 1294:47@
getGamepadButtonFromString
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: string representing a 'SDL_Gamepad' button.
  -> IO SDL_GamepadButton
getGamepadButtonFromString =
  Unsafe.sDL_GetGamepadButtonFromString

-- | Convert a string into an 'SDL_GamepadButton' enum.
--
--     This function is called internally to translate 'SDL_Gamepad' mapping strings for the underlying joystick device into the consistent 'SDL_Gamepad' mapping. You do not normally need to call this function unless you are parsing 'SDL_Gamepad' mappings in your own code.
--
--     [Returns]: the 'SDL_GamepadButton' enum corresponding to the input string, or @SDL_GAMEPAD_BUTTON_INVALID@ if no match was found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadStringForButton'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadButtonFromString@.
--                   The unsafe flavor is 'getGamepadButtonFromString'
--                   .
--
--     [C declaration]: @SDL_GetGamepadButtonFromString@, defined at @SDL3\/SDL_gamepad.h 1294:47@
getGamepadButtonFromStringSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: string representing a 'SDL_Gamepad' button.
  -> IO SDL_GamepadButton
getGamepadButtonFromStringSafe =
  Safe.sDL_GetGamepadButtonFromString

-- | Convert from an 'SDL_GamepadButton' enum to a string.
--
--     [Returns]: a string for the given button, or NULL if an invalid button is specified. The string returned is of the format used by 'SDL_Gamepad' mapping strings.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadButtonFromString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadStringForButton@.
--                   The safe flavor is 'getGamepadStringForButtonSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadStringForButton@, defined at @SDL3\/SDL_gamepad.h 1310:42@
getGamepadStringForButton
  :: SDL_GamepadButton
  -- ^
  --
  --           [@button@]: an enum value for a given 'SDL_GamepadButton'.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadStringForButton =
  Unsafe.sDL_GetGamepadStringForButton

-- | Convert from an 'SDL_GamepadButton' enum to a string.
--
--     [Returns]: a string for the given button, or NULL if an invalid button is specified. The string returned is of the format used by 'SDL_Gamepad' mapping strings.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadButtonFromString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadStringForButton@.
--                   The unsafe flavor is 'getGamepadStringForButton'
--                   .
--
--     [C declaration]: @SDL_GetGamepadStringForButton@, defined at @SDL3\/SDL_gamepad.h 1310:42@
getGamepadStringForButtonSafe
  :: SDL_GamepadButton
  -- ^
  --
  --           [@button@]: an enum value for a given 'SDL_GamepadButton'.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadStringForButtonSafe =
  Safe.sDL_GetGamepadStringForButton

-- | Query whether a gamepad has a given button.
--
--     This merely reports whether the gamepad\'s mapping defined this button, as that is all the information SDL has about the physical device.
--
--     [Returns]: true if the gamepad has this button, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'gamepadHasAxis'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GamepadHasButton@.
--                   The safe flavor is 'gamepadHasButtonSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GamepadHasButton@, defined at @SDL3\/SDL_gamepad.h 1328:34@
gamepadHasButton
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button enum value (an 'SDL_GamepadButton' value).
  -> IO Bool
gamepadHasButton =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GamepadHasButton x00 x11)

-- | Query whether a gamepad has a given button.
--
--     This merely reports whether the gamepad\'s mapping defined this button, as that is all the information SDL has about the physical device.
--
--     [Returns]: true if the gamepad has this button, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'gamepadHasAxis'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GamepadHasButton@.
--                   The unsafe flavor is 'gamepadHasButton'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GamepadHasButton@, defined at @SDL3\/SDL_gamepad.h 1328:34@
gamepadHasButtonSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button enum value (an 'SDL_GamepadButton' value).
  -> IO Bool
gamepadHasButtonSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GamepadHasButton x00 x11)

-- | Get the current state of a button on a gamepad.
--
--     [Returns]: true if the button is pressed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'gamepadHasButton', 'getGamepadAxis'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadButton@.
--                   The safe flavor is 'getGamepadButtonSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadButton@, defined at @SDL3\/SDL_gamepad.h 1344:34@
getGamepadButton
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button index (one of the 'SDL_GamepadButton' values).
  -> IO Bool
getGamepadButton =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetGamepadButton x00 x11)

-- | Get the current state of a button on a gamepad.
--
--     [Returns]: true if the button is pressed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'gamepadHasButton', 'getGamepadAxis'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadButton@.
--                   The unsafe flavor is 'getGamepadButton'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadButton@, defined at @SDL3\/SDL_gamepad.h 1344:34@
getGamepadButtonSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button index (one of the 'SDL_GamepadButton' values).
  -> IO Bool
getGamepadButtonSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetGamepadButton x00 x11)

-- | Get the label of a button on a gamepad.
--
--     [Returns]: the 'SDL_GamepadButtonLabel' enum corresponding to the button label.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadButtonLabel'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadButtonLabelForType@.
--                   The safe flavor is 'getGamepadButtonLabelForTypeSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadButtonLabelForType@, defined at @SDL3\/SDL_gamepad.h 1359:52@
getGamepadButtonLabelForType
  :: SDL_GamepadType
  -- ^
  --
  --           [@type@]: the type of gamepad to check.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button index (one of the 'SDL_GamepadButton' values).
  -> IO SDL_GamepadButtonLabel
getGamepadButtonLabelForType =
  Unsafe.sDL_GetGamepadButtonLabelForType

-- | Get the label of a button on a gamepad.
--
--     [Returns]: the 'SDL_GamepadButtonLabel' enum corresponding to the button label.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadButtonLabel'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadButtonLabelForType@.
--                   The unsafe flavor is 'getGamepadButtonLabelForType'
--                   .
--
--     [C declaration]: @SDL_GetGamepadButtonLabelForType@, defined at @SDL3\/SDL_gamepad.h 1359:52@
getGamepadButtonLabelForTypeSafe
  :: SDL_GamepadType
  -- ^
  --
  --           [@type@]: the type of gamepad to check.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button index (one of the 'SDL_GamepadButton' values).
  -> IO SDL_GamepadButtonLabel
getGamepadButtonLabelForTypeSafe =
  Safe.sDL_GetGamepadButtonLabelForType

-- | Get the label of a button on a gamepad.
--
--     [Returns]: the 'SDL_GamepadButtonLabel' enum corresponding to the button label.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadButtonLabelForType'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadButtonLabel@.
--                   The safe flavor is 'getGamepadButtonLabelSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadButtonLabel@, defined at @SDL3\/SDL_gamepad.h 1374:52@
getGamepadButtonLabel
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button index (one of the 'SDL_GamepadButton' values).
  -> IO SDL_GamepadButtonLabel
getGamepadButtonLabel =
  Unsafe.sDL_GetGamepadButtonLabel

-- | Get the label of a button on a gamepad.
--
--     [Returns]: the 'SDL_GamepadButtonLabel' enum corresponding to the button label.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadButtonLabelForType'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadButtonLabel@.
--                   The unsafe flavor is 'getGamepadButtonLabel'
--                   .
--
--     [C declaration]: @SDL_GetGamepadButtonLabel@, defined at @SDL3\/SDL_gamepad.h 1374:52@
getGamepadButtonLabelSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button index (one of the 'SDL_GamepadButton' values).
  -> IO SDL_GamepadButtonLabel
getGamepadButtonLabelSafe =
  Safe.sDL_GetGamepadButtonLabel

-- | Get the number of touchpads on a gamepad.
--
--     [Returns]: number of touchpads.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumGamepadTouchpadFingers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumGamepadTouchpads@.
--                   The safe flavor is 'getNumGamepadTouchpadsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumGamepadTouchpads@, defined at @SDL3\/SDL_gamepad.h 1388:33@
getNumGamepadTouchpads
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> IO BG.Int32
getNumGamepadTouchpads =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetNumGamepadTouchpads x00)

-- | Get the number of touchpads on a gamepad.
--
--     [Returns]: number of touchpads.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumGamepadTouchpadFingers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumGamepadTouchpads@.
--                   The unsafe flavor is 'getNumGamepadTouchpads'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumGamepadTouchpads@, defined at @SDL3\/SDL_gamepad.h 1388:33@
getNumGamepadTouchpadsSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> IO BG.Int32
getNumGamepadTouchpadsSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetNumGamepadTouchpads x00)

-- | Get the number of supported simultaneous fingers on a touchpad on a game gamepad.
--
--     [Returns]: number of supported simultaneous fingers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadTouchpadFinger', 'getNumGamepadTouchpads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumGamepadTouchpadFingers@.
--                   The safe flavor is 'getNumGamepadTouchpadFingersSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumGamepadTouchpadFingers@, defined at @SDL3\/SDL_gamepad.h 1405:33@
getNumGamepadTouchpadFingers
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> BG.Int32
  -- ^
  --
  --           [@touchpad@]: a touchpad.
  -> IO BG.Int32
getNumGamepadTouchpadFingers =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_GetNumGamepadTouchpadFingers x00 (Coerce.coerce x11))

-- | Get the number of supported simultaneous fingers on a touchpad on a game gamepad.
--
--     [Returns]: number of supported simultaneous fingers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadTouchpadFinger', 'getNumGamepadTouchpads'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumGamepadTouchpadFingers@.
--                   The unsafe flavor is 'getNumGamepadTouchpadFingers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumGamepadTouchpadFingers@, defined at @SDL3\/SDL_gamepad.h 1405:33@
getNumGamepadTouchpadFingersSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> BG.Int32
  -- ^
  --
  --           [@touchpad@]: a touchpad.
  -> IO BG.Int32
getNumGamepadTouchpadFingersSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_GetNumGamepadTouchpadFingers x00 (Coerce.coerce x11))

-- | Get the current state of a finger on a touchpad on a gamepad.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumGamepadTouchpadFingers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadTouchpadFinger@.
--                   The safe flavor is 'getGamepadTouchpadFingerSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadTouchpadFinger@, defined at @SDL3\/SDL_gamepad.h 1429:34@
getGamepadTouchpadFinger
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> BG.Int32
  -- ^
  --
  --           [@touchpad@]: a touchpad.
  -> BG.Int32
  -- ^
  --
  --           [@finger@]: a finger.
  -> BG.Ptr BG.CBool
  -- ^
  --
  --           [@down@]: a pointer filled with true if the finger is down, false otherwise, may be NULL.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@x@]: a pointer filled with the x position, normalized 0 to 1, with the origin in the upper left, may be NULL.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: a pointer filled with the y position, normalized 0 to 1, with the origin in the upper left, may be NULL.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@pressure@]: a pointer filled with pressure value, may be NULL.
  -> IO Bool
getGamepadTouchpadFinger =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap
                  CBool.toBool
                  (Unsafe.sDL_GetGamepadTouchpadFinger x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44 x55 x66)

-- | Get the current state of a finger on a touchpad on a gamepad.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumGamepadTouchpadFingers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadTouchpadFinger@.
--                   The unsafe flavor is 'getGamepadTouchpadFinger'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadTouchpadFinger@, defined at @SDL3\/SDL_gamepad.h 1429:34@
getGamepadTouchpadFingerSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> BG.Int32
  -- ^
  --
  --           [@touchpad@]: a touchpad.
  -> BG.Int32
  -- ^
  --
  --           [@finger@]: a finger.
  -> BG.Ptr BG.CBool
  -- ^
  --
  --           [@down@]: a pointer filled with true if the finger is down, false otherwise, may be NULL.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@x@]: a pointer filled with the x position, normalized 0 to 1, with the origin in the upper left, may be NULL.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: a pointer filled with the y position, normalized 0 to 1, with the origin in the upper left, may be NULL.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@pressure@]: a pointer filled with pressure value, may be NULL.
  -> IO Bool
getGamepadTouchpadFingerSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap
                  CBool.toBool
                  (Safe.sDL_GetGamepadTouchpadFinger x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44 x55 x66)

-- | Return whether a gamepad has a particular sensor.
--
--     [Returns]: true if the sensor exists, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadSensorData', 'getGamepadSensorDataRate', 'setGamepadSensorEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GamepadHasSensor@.
--                   The safe flavor is 'gamepadHasSensorSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GamepadHasSensor@, defined at @SDL3\/SDL_gamepad.h 1446:34@
gamepadHasSensor
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to query.
  -> IO Bool
gamepadHasSensor =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GamepadHasSensor x00 x11)

-- | Return whether a gamepad has a particular sensor.
--
--     [Returns]: true if the sensor exists, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadSensorData', 'getGamepadSensorDataRate', 'setGamepadSensorEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GamepadHasSensor@.
--                   The unsafe flavor is 'gamepadHasSensor'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GamepadHasSensor@, defined at @SDL3\/SDL_gamepad.h 1446:34@
gamepadHasSensorSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to query.
  -> IO Bool
gamepadHasSensorSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GamepadHasSensor x00 x11)

-- | Set whether data reporting for a gamepad sensor is enabled.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'gamepadHasSensor', 'gamepadSensorEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGamepadSensorEnabled@.
--                   The safe flavor is 'setGamepadSensorEnabledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGamepadSensorEnabled@, defined at @SDL3\/SDL_gamepad.h 1464:34@
setGamepadSensorEnabled
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to update.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to enable\/disable.
  -> Bool
  -- ^
  --
  --           [@enabled@]: whether data reporting should be enabled.
  -> IO Bool
setGamepadSensorEnabled =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetGamepadSensorEnabled x00 x11 (CBool.fromBool x22))

-- | Set whether data reporting for a gamepad sensor is enabled.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'gamepadHasSensor', 'gamepadSensorEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGamepadSensorEnabled@.
--                   The unsafe flavor is 'setGamepadSensorEnabled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGamepadSensorEnabled@, defined at @SDL3\/SDL_gamepad.h 1464:34@
setGamepadSensorEnabledSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to update.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to enable\/disable.
  -> Bool
  -- ^
  --
  --           [@enabled@]: whether data reporting should be enabled.
  -> IO Bool
setGamepadSensorEnabledSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetGamepadSensorEnabled x00 x11 (CBool.fromBool x22))

-- | Query whether sensor data reporting is enabled for a gamepad.
--
--     [Returns]: true if the sensor is enabled, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setGamepadSensorEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GamepadSensorEnabled@.
--                   The safe flavor is 'gamepadSensorEnabledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GamepadSensorEnabled@, defined at @SDL3\/SDL_gamepad.h 1479:34@
gamepadSensorEnabled
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to query.
  -> IO Bool
gamepadSensorEnabled =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GamepadSensorEnabled x00 x11)

-- | Query whether sensor data reporting is enabled for a gamepad.
--
--     [Returns]: true if the sensor is enabled, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setGamepadSensorEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GamepadSensorEnabled@.
--                   The unsafe flavor is 'gamepadSensorEnabled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GamepadSensorEnabled@, defined at @SDL3\/SDL_gamepad.h 1479:34@
gamepadSensorEnabledSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to query.
  -> IO Bool
gamepadSensorEnabledSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GamepadSensorEnabled x00 x11)

-- | Get the data rate (number of events per second) of a gamepad sensor.
--
--     [Returns]: the data rate, or 0.0f if the data rate is not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadSensorDataRate@.
--                   The safe flavor is 'getGamepadSensorDataRateSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadSensorDataRate@, defined at @SDL3\/SDL_gamepad.h 1492:35@
getGamepadSensorDataRate
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to query.
  -> IO Float
getGamepadSensorDataRate =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_GetGamepadSensorDataRate x00 x11)

-- | Get the data rate (number of events per second) of a gamepad sensor.
--
--     [Returns]: the data rate, or 0.0f if the data rate is not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadSensorDataRate@.
--                   The unsafe flavor is 'getGamepadSensorDataRate'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadSensorDataRate@, defined at @SDL3\/SDL_gamepad.h 1492:35@
getGamepadSensorDataRateSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to query.
  -> IO Float
getGamepadSensorDataRateSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_GetGamepadSensorDataRate x00 x11)

-- | Get the current state of a gamepad sensor.
--
--     The number of values and interpretation of the data is sensor dependent. See the remarks in SDL_SensorType for details for each type of sensor.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadSensorData@.
--                   The safe flavor is 'getGamepadSensorDataSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadSensorData@, defined at @SDL3\/SDL_gamepad.h 1511:34@
getGamepadSensorData
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to query.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@data@]: a pointer filled with the current sensor state.
  -> BG.Int32
  -- ^
  --
  --           [@num_values@]: the number of values to write to data.
  -> IO Bool
getGamepadSensorData =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_GetGamepadSensorData x00 x11 x22 (Coerce.coerce x33))

-- | Get the current state of a gamepad sensor.
--
--     The number of values and interpretation of the data is sensor dependent. See the remarks in SDL_SensorType for details for each type of sensor.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadSensorData@.
--                   The unsafe flavor is 'getGamepadSensorData'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGamepadSensorData@, defined at @SDL3\/SDL_gamepad.h 1511:34@
getGamepadSensorDataSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to query.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@data@]: a pointer filled with the current sensor state.
  -> BG.Int32
  -- ^
  --
  --           [@num_values@]: the number of values to write to data.
  -> IO Bool
getGamepadSensorDataSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_GetGamepadSensorData x00 x11 x22 (Coerce.coerce x33))

-- | Start a rumble effect on a gamepad.
--
--     Each call to this function cancels any previous rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     This function requires you to process SDL events or call 'SDL3.Sys.Joystick.updateJoysticks' to update rumble state.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RumbleGamepad@.
--                   The safe flavor is 'rumbleGamepadSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RumbleGamepad@, defined at @SDL3\/SDL_gamepad.h 1535:34@
rumbleGamepad
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to vibrate.
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
rumbleGamepad =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_RumbleGamepad x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Start a rumble effect on a gamepad.
--
--     Each call to this function cancels any previous rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     This function requires you to process SDL events or call 'SDL3.Sys.Joystick.updateJoysticks' to update rumble state.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RumbleGamepad@.
--                   The unsafe flavor is 'rumbleGamepad'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RumbleGamepad@, defined at @SDL3\/SDL_gamepad.h 1535:34@
rumbleGamepadSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to vibrate.
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
rumbleGamepadSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_RumbleGamepad x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Start a rumble effect in the gamepad\'s triggers.
--
--     Each call to this function cancels any previous trigger rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     Note that this is rumbling of the /triggers/ and not the gamepad as a whole. This is currently only supported on Xbox One gamepads. If you want the (more common) whole-gamepad rumble, use @'rumbleGamepad'@ instead.
--
--     This function requires you to process SDL events or call 'SDL3.Sys.Joystick.updateJoysticks' to update rumble state.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'rumbleGamepad'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RumbleGamepadTriggers@.
--                   The safe flavor is 'rumbleGamepadTriggersSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RumbleGamepadTriggers@, defined at @SDL3\/SDL_gamepad.h 1565:34@
rumbleGamepadTriggers
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to vibrate.
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
rumbleGamepadTriggers =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_RumbleGamepadTriggers x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Start a rumble effect in the gamepad\'s triggers.
--
--     Each call to this function cancels any previous trigger rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     Note that this is rumbling of the /triggers/ and not the gamepad as a whole. This is currently only supported on Xbox One gamepads. If you want the (more common) whole-gamepad rumble, use @'rumbleGamepad'@ instead.
--
--     This function requires you to process SDL events or call 'SDL3.Sys.Joystick.updateJoysticks' to update rumble state.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'rumbleGamepad'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RumbleGamepadTriggers@.
--                   The unsafe flavor is 'rumbleGamepadTriggers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RumbleGamepadTriggers@, defined at @SDL3\/SDL_gamepad.h 1565:34@
rumbleGamepadTriggersSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to vibrate.
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
rumbleGamepadTriggersSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_RumbleGamepadTriggers x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Update a gamepad\'s LED color.
--
--     An example of a joystick LED is the light on the back of a PlayStation 4\'s DualShock 4 controller.
--
--     For gamepads with a single color LED, the maximum of the RGB values will be used as the LED brightness.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGamepadLED@.
--                   The safe flavor is 'setGamepadLEDSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGamepadLED@, defined at @SDL3\/SDL_gamepad.h 1587:34@
setGamepadLED
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to update.
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
setGamepadLED =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_SetGamepadLED x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Update a gamepad\'s LED color.
--
--     An example of a joystick LED is the light on the back of a PlayStation 4\'s DualShock 4 controller.
--
--     For gamepads with a single color LED, the maximum of the RGB values will be used as the LED brightness.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGamepadLED@.
--                   The unsafe flavor is 'setGamepadLED'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGamepadLED@, defined at @SDL3\/SDL_gamepad.h 1587:34@
setGamepadLEDSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to update.
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
setGamepadLEDSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_SetGamepadLED x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Send a gamepad specific effect packet.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SendGamepadEffect@.
--                   The safe flavor is 'sendGamepadEffectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SendGamepadEffect@, defined at @SDL3\/SDL_gamepad.h 1602:34@
sendGamepadEffect
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to affect.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to send to the gamepad.
  -> BG.Int32
  -- ^
  --
  --           [@size@]: the size of the data to send to the gamepad.
  -> IO Bool
sendGamepadEffect =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SendGamepadEffect x00 x11 (Coerce.coerce x22))

-- | Send a gamepad specific effect packet.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SendGamepadEffect@.
--                   The unsafe flavor is 'sendGamepadEffect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SendGamepadEffect@, defined at @SDL3\/SDL_gamepad.h 1602:34@
sendGamepadEffectSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to affect.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to send to the gamepad.
  -> BG.Int32
  -- ^
  --
  --           [@size@]: the size of the data to send to the gamepad.
  -> IO Bool
sendGamepadEffectSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SendGamepadEffect x00 x11 (Coerce.coerce x22))

-- | Close a gamepad previously opened with @'openGamepad'@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openGamepad'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CloseGamepad@.
--                   The safe flavor is 'closeGamepadSafe'
--                   .
--
--     [C declaration]: @SDL_CloseGamepad@, defined at @SDL3\/SDL_gamepad.h 1616:34@
closeGamepad
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @'openGamepad'@.
  -> IO ()
closeGamepad = Unsafe.sDL_CloseGamepad

-- | Close a gamepad previously opened with @'openGamepad'@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openGamepad'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CloseGamepad@.
--                   The unsafe flavor is 'closeGamepad'
--                   .
--
--     [C declaration]: @SDL_CloseGamepad@, defined at @SDL3\/SDL_gamepad.h 1616:34@
closeGamepadSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @'openGamepad'@.
  -> IO ()
closeGamepadSafe = Safe.sDL_CloseGamepad

-- | Return the sfSymbolsName for a given button on a gamepad on Apple platforms.
--
--     [Returns]: the sfSymbolsName or NULL if the name can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadAppleSFSymbolsNameForAxis'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadAppleSFSymbolsNameForButton@.
--                   The safe flavor is 'getGamepadAppleSFSymbolsNameForButtonSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadAppleSFSymbolsNameForButton@, defined at @SDL3\/SDL_gamepad.h 1632:42@
getGamepadAppleSFSymbolsNameForButton
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button on the gamepad.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadAppleSFSymbolsNameForButton =
  Unsafe.sDL_GetGamepadAppleSFSymbolsNameForButton

-- | Return the sfSymbolsName for a given button on a gamepad on Apple platforms.
--
--     [Returns]: the sfSymbolsName or NULL if the name can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadAppleSFSymbolsNameForAxis'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadAppleSFSymbolsNameForButton@.
--                   The unsafe flavor is 'getGamepadAppleSFSymbolsNameForButton'
--                   .
--
--     [C declaration]: @SDL_GetGamepadAppleSFSymbolsNameForButton@, defined at @SDL3\/SDL_gamepad.h 1632:42@
getGamepadAppleSFSymbolsNameForButtonSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button on the gamepad.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadAppleSFSymbolsNameForButtonSafe =
  Safe.sDL_GetGamepadAppleSFSymbolsNameForButton

-- | Return the sfSymbolsName for a given axis on a gamepad on Apple platforms.
--
--     [Returns]: the sfSymbolsName or NULL if the name can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadAppleSFSymbolsNameForButton'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGamepadAppleSFSymbolsNameForAxis@.
--                   The safe flavor is 'getGamepadAppleSFSymbolsNameForAxisSafe'
--                   .
--
--     [C declaration]: @SDL_GetGamepadAppleSFSymbolsNameForAxis@, defined at @SDL3\/SDL_gamepad.h 1647:42@
getGamepadAppleSFSymbolsNameForAxis
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL_GamepadAxis
  -- ^
  --
  --           [@axis@]: an axis on the gamepad.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadAppleSFSymbolsNameForAxis =
  Unsafe.sDL_GetGamepadAppleSFSymbolsNameForAxis

-- | Return the sfSymbolsName for a given axis on a gamepad on Apple platforms.
--
--     [Returns]: the sfSymbolsName or NULL if the name can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGamepadAppleSFSymbolsNameForButton'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGamepadAppleSFSymbolsNameForAxis@.
--                   The unsafe flavor is 'getGamepadAppleSFSymbolsNameForAxis'
--                   .
--
--     [C declaration]: @SDL_GetGamepadAppleSFSymbolsNameForAxis@, defined at @SDL3\/SDL_gamepad.h 1647:42@
getGamepadAppleSFSymbolsNameForAxisSafe
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL_GamepadAxis
  -- ^
  --
  --           [@axis@]: an axis on the gamepad.
  -> IO (PtrConst.PtrConst BG.CChar)
getGamepadAppleSFSymbolsNameForAxisSafe =
  Safe.sDL_GetGamepadAppleSFSymbolsNameForAxis

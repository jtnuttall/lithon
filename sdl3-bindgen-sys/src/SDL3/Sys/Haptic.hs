{-# LANGUAGE PatternSynonyms #-}

-- | The SDL haptic subsystem manages haptic (force feedback) devices.
--
--     The basic usage is as follows:
--
--     * Initialize the subsystem (SDL_INIT_HAPTIC).
--
--     * Open a haptic device.
--
--     * @'openHaptic'@ to open from index.
--
--     * @'openHapticFromJoystick'@ to open from an existing joystick.
--
--     * Create an effect ('SDL_HapticEffect').
--
--     * Upload the effect with @'createHapticEffect'@.
--
--     * Run the effect with @'runHapticEffect'@.
--
--     * (optional) Free the effect with @'destroyHapticEffect'@.
--
--     * Close the haptic device with @'closeHaptic'@.
--
--     Simple rumble example:
--
--     @
--     SDL_Haptic *haptic = NULL;
--
--     \/\/ Open the device
--     SDL_HapticID *haptics = SDL_GetHaptics(NULL);
--     if (haptics) {
--         haptic = SDL_OpenHaptic(haptics[0]);
--         SDL_free(haptics);
--     }
--     if (haptic == NULL)
--        return;
--
--     \/\/ Initialize simple rumble
--     if (!SDL_InitHapticRumble(haptic))
--        return;
--
--     \/\/ Play effect at 50% strength for 2 seconds
--     if (!SDL_PlayHapticRumble(haptic, 0.5, 2000))
--        return;
--     SDL_Delay(2000);
--
--     \/\/ Clean up
--     SDL_CloseHaptic(haptic);
--     @
--
--     Complete example:
--
--     @
--     bool test_haptic(SDL_Joystick *joystick)
--     {
--        SDL_Haptic *haptic;
--        SDL_HapticEffect effect;
--        SDL_HapticEffectID effect_id;
--
--        \/\/ Open the device
--        haptic = SDL_OpenHapticFromJoystick(joystick);
--        if (haptic == NULL) return false; \/\/ Most likely joystick isn\'t haptic
--
--        \/\/ See if it can do sine waves
--        if ((SDL_GetHapticFeatures(haptic) & SDL_HAPTIC_SINE)==0) {
--           SDL_CloseHaptic(haptic); \/\/ No sine effect
--           return false;
--        }
--
--        \/\/ Create the effect
--        SDL_memset(&effect, 0, sizeof(SDL_HapticEffect)); \/\/ 0 is safe default
--        effect.type = SDL_HAPTIC_SINE;
--        effect.periodic.direction.type = SDL_HAPTIC_POLAR; \/\/ Polar coordinates
--        effect.periodic.direction.dir[0] = 18000; \/\/ Force comes from south
--        effect.periodic.period = 1000; \/\/ 1000 ms
--        effect.periodic.magnitude = 20000; \/\/ 20000\/32767 strength
--        effect.periodic.length = 5000; \/\/ 5 seconds long
--        effect.periodic.attack_length = 1000; \/\/ Takes 1 second to get max strength
--        effect.periodic.fade_length = 1000; \/\/ Takes 1 second to fade away
--
--        \/\/ Upload the effect
--        effect_id = SDL_CreateHapticEffect(haptic, &effect);
--
--        \/\/ Test the effect
--        SDL_RunHapticEffect(haptic, effect_id, 1);
--        SDL_Delay(5000); \/\/ Wait for the effect to finish
--
--        \/\/ We destroy the effect, although closing the device also does this
--        SDL_DestroyHapticEffect(haptic, effect_id);
--
--        \/\/ Close the device
--        SDL_CloseHaptic(haptic);
--
--        return true; \/\/ Success
--     }
--     @
--
--     Note that the SDL haptic subsystem is not thread-safe. The haptic structure used to identify an SDL haptic.
--
--     @since 3.2.0
--
--     [See also]: 'openHaptic', 'openHapticFromJoystick', 'closeHaptic'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Haptic.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Haptic (
  module SDL3.Sys.Bindgen.Haptic,

  -- * Typed constants
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_POLAR,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_CARTESIAN,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_SPHERICAL,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_STEERING_AXIS,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_CONSTANT,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_SINE,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_SQUARE,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_TRIANGLE,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_SAWTOOTHUP,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_SAWTOOTHDOWN,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_RAMP,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_SPRING,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_DAMPER,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_INERTIA,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_FRICTION,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_LEFTRIGHT,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_RESERVED1,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_RESERVED2,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_RESERVED3,
  pattern SDL3.Sys.Haptic.SDL_HAPTIC_CUSTOM,

  -- * Function aliases
  SDL3.Sys.Haptic.getHaptics,
  SDL3.Sys.Haptic.getHapticsSafe,
  SDL3.Sys.Haptic.getHapticNameForID,
  SDL3.Sys.Haptic.getHapticNameForIDSafe,
  SDL3.Sys.Haptic.openHaptic,
  SDL3.Sys.Haptic.openHapticSafe,
  SDL3.Sys.Haptic.getHapticFromID,
  SDL3.Sys.Haptic.getHapticFromIDSafe,
  SDL3.Sys.Haptic.getHapticID,
  SDL3.Sys.Haptic.getHapticIDSafe,
  SDL3.Sys.Haptic.getHapticName,
  SDL3.Sys.Haptic.getHapticNameSafe,
  SDL3.Sys.Haptic.isMouseHaptic,
  SDL3.Sys.Haptic.isMouseHapticSafe,
  SDL3.Sys.Haptic.openHapticFromMouse,
  SDL3.Sys.Haptic.openHapticFromMouseSafe,
  SDL3.Sys.Haptic.isJoystickHaptic,
  SDL3.Sys.Haptic.isJoystickHapticSafe,
  SDL3.Sys.Haptic.openHapticFromJoystick,
  SDL3.Sys.Haptic.openHapticFromJoystickSafe,
  SDL3.Sys.Haptic.closeHaptic,
  SDL3.Sys.Haptic.closeHapticSafe,
  SDL3.Sys.Haptic.getMaxHapticEffects,
  SDL3.Sys.Haptic.getMaxHapticEffectsSafe,
  SDL3.Sys.Haptic.getMaxHapticEffectsPlaying,
  SDL3.Sys.Haptic.getMaxHapticEffectsPlayingSafe,
  SDL3.Sys.Haptic.getHapticFeatures,
  SDL3.Sys.Haptic.getHapticFeaturesSafe,
  SDL3.Sys.Haptic.getNumHapticAxes,
  SDL3.Sys.Haptic.getNumHapticAxesSafe,
  SDL3.Sys.Haptic.hapticEffectSupported,
  SDL3.Sys.Haptic.hapticEffectSupportedSafe,
  SDL3.Sys.Haptic.createHapticEffect,
  SDL3.Sys.Haptic.createHapticEffectSafe,
  SDL3.Sys.Haptic.updateHapticEffect,
  SDL3.Sys.Haptic.updateHapticEffectSafe,
  SDL3.Sys.Haptic.runHapticEffect,
  SDL3.Sys.Haptic.runHapticEffectSafe,
  SDL3.Sys.Haptic.stopHapticEffect,
  SDL3.Sys.Haptic.stopHapticEffectSafe,
  SDL3.Sys.Haptic.destroyHapticEffect,
  SDL3.Sys.Haptic.destroyHapticEffectSafe,
  SDL3.Sys.Haptic.getHapticEffectStatus,
  SDL3.Sys.Haptic.getHapticEffectStatusSafe,
  SDL3.Sys.Haptic.setHapticGain,
  SDL3.Sys.Haptic.setHapticGainSafe,
  SDL3.Sys.Haptic.setHapticAutocenter,
  SDL3.Sys.Haptic.setHapticAutocenterSafe,
  SDL3.Sys.Haptic.pauseHaptic,
  SDL3.Sys.Haptic.pauseHapticSafe,
  SDL3.Sys.Haptic.resumeHaptic,
  SDL3.Sys.Haptic.resumeHapticSafe,
  SDL3.Sys.Haptic.stopHapticEffects,
  SDL3.Sys.Haptic.stopHapticEffectsSafe,
  SDL3.Sys.Haptic.hapticRumbleSupported,
  SDL3.Sys.Haptic.hapticRumbleSupportedSafe,
  SDL3.Sys.Haptic.initHapticRumble,
  SDL3.Sys.Haptic.initHapticRumbleSafe,
  SDL3.Sys.Haptic.playHapticRumble,
  SDL3.Sys.Haptic.playHapticRumbleSafe,
  SDL3.Sys.Haptic.stopHapticRumble,
  SDL3.Sys.Haptic.stopHapticRumbleSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Haptic
import SDL3.Sys.Bindgen.Haptic.Safe qualified as Safe
import SDL3.Sys.Bindgen.Haptic.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Joystick qualified
import SDL3.Sys.Bindgen.Stdinc qualified

-- | Get a list of currently connected haptic devices.
--
--     [Returns]: a 0 terminated array of haptic device instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     @since 3.2.0
--
--     [See also]: 'openHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetHaptics@.
--                   The safe flavor is 'getHapticsSafe'
--                   .
--
--     [C declaration]: @SDL_GetHaptics@, defined at @SDL3\/SDL_haptic.h 975:44@
getHaptics
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of haptic devices returned, may be NULL.
  -> IO (BG.Ptr SDL_HapticID)
getHaptics = Unsafe.sDL_GetHaptics

-- | Get a list of currently connected haptic devices.
--
--     [Returns]: a 0 terminated array of haptic device instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     @since 3.2.0
--
--     [See also]: 'openHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetHaptics@.
--                   The unsafe flavor is 'getHaptics'
--                   .
--
--     [C declaration]: @SDL_GetHaptics@, defined at @SDL3\/SDL_haptic.h 975:44@
getHapticsSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of haptic devices returned, may be NULL.
  -> IO (BG.Ptr SDL_HapticID)
getHapticsSafe = Safe.sDL_GetHaptics

-- | Get the implementation dependent name of a haptic device.
--
--     This can be called before any haptic devices are opened.
--
--     [Returns]: the name of the selected haptic device. If no name can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getHapticName', 'openHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetHapticNameForID@.
--                   The safe flavor is 'getHapticNameForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetHapticNameForID@, defined at @SDL3\/SDL_haptic.h 992:42@
getHapticNameForID
  :: SDL_HapticID
  -- ^
  --
  --           [@instance_id@]: the haptic device instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getHapticNameForID = Unsafe.sDL_GetHapticNameForID

-- | Get the implementation dependent name of a haptic device.
--
--     This can be called before any haptic devices are opened.
--
--     [Returns]: the name of the selected haptic device. If no name can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getHapticName', 'openHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetHapticNameForID@.
--                   The unsafe flavor is 'getHapticNameForID'
--                   .
--
--     [C declaration]: @SDL_GetHapticNameForID@, defined at @SDL3\/SDL_haptic.h 992:42@
getHapticNameForIDSafe
  :: SDL_HapticID
  -- ^
  --
  --           [@instance_id@]: the haptic device instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getHapticNameForIDSafe = Safe.sDL_GetHapticNameForID

-- | Open a haptic device for use.
--
--     The index passed as an argument refers to the N\'th haptic device on this system.
--
--     When opening a haptic device, its gain will be set to maximum and autocenter will be disabled. To modify these values use @'setHapticGain'@ and @'setHapticAutocenter'@.
--
--     [Returns]: the device identifier or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeHaptic', 'getHaptics', 'openHapticFromJoystick', 'openHapticFromMouse', 'setHapticAutocenter', 'setHapticGain'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenHaptic@.
--                   The safe flavor is 'openHapticSafe'
--                   .
--
--     [C declaration]: @SDL_OpenHaptic@, defined at @SDL3\/SDL_haptic.h 1017:42@
openHaptic
  :: SDL_HapticID
  -- ^
  --
  --           [@instance_id@]: the haptic device instance ID.
  -> IO (BG.Ptr SDL_Haptic)
openHaptic = Unsafe.sDL_OpenHaptic

-- | Open a haptic device for use.
--
--     The index passed as an argument refers to the N\'th haptic device on this system.
--
--     When opening a haptic device, its gain will be set to maximum and autocenter will be disabled. To modify these values use @'setHapticGain'@ and @'setHapticAutocenter'@.
--
--     [Returns]: the device identifier or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeHaptic', 'getHaptics', 'openHapticFromJoystick', 'openHapticFromMouse', 'setHapticAutocenter', 'setHapticGain'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenHaptic@.
--                   The unsafe flavor is 'openHaptic'
--                   .
--
--     [C declaration]: @SDL_OpenHaptic@, defined at @SDL3\/SDL_haptic.h 1017:42@
openHapticSafe
  :: SDL_HapticID
  -- ^
  --
  --           [@instance_id@]: the haptic device instance ID.
  -> IO (BG.Ptr SDL_Haptic)
openHapticSafe = Safe.sDL_OpenHaptic

-- | Get the 'SDL_Haptic' associated with an instance ID, if it has been opened.
--
--     [Returns]: an 'SDL_Haptic' on success or NULL on failure or if it hasn\'t been opened yet; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetHapticFromID@.
--                   The safe flavor is 'getHapticFromIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetHapticFromID@, defined at @SDL3\/SDL_haptic.h 1029:42@
getHapticFromID
  :: SDL_HapticID
  -- ^
  --
  --           [@instance_id@]: the instance ID to get the 'SDL_Haptic' for.
  -> IO (BG.Ptr SDL_Haptic)
getHapticFromID = Unsafe.sDL_GetHapticFromID

-- | Get the 'SDL_Haptic' associated with an instance ID, if it has been opened.
--
--     [Returns]: an 'SDL_Haptic' on success or NULL on failure or if it hasn\'t been opened yet; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetHapticFromID@.
--                   The unsafe flavor is 'getHapticFromID'
--                   .
--
--     [C declaration]: @SDL_GetHapticFromID@, defined at @SDL3\/SDL_haptic.h 1029:42@
getHapticFromIDSafe
  :: SDL_HapticID
  -- ^
  --
  --           [@instance_id@]: the instance ID to get the 'SDL_Haptic' for.
  -> IO (BG.Ptr SDL_Haptic)
getHapticFromIDSafe = Safe.sDL_GetHapticFromID

-- | Get the instance ID of an opened haptic device.
--
--     [Returns]: the instance ID of the specified haptic device on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetHapticID@.
--                   The safe flavor is 'getHapticIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetHapticID@, defined at @SDL3\/SDL_haptic.h 1040:42@
getHapticID
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> IO SDL_HapticID
getHapticID = Unsafe.sDL_GetHapticID

-- | Get the instance ID of an opened haptic device.
--
--     [Returns]: the instance ID of the specified haptic device on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetHapticID@.
--                   The unsafe flavor is 'getHapticID'
--                   .
--
--     [C declaration]: @SDL_GetHapticID@, defined at @SDL3\/SDL_haptic.h 1040:42@
getHapticIDSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> IO SDL_HapticID
getHapticIDSafe = Safe.sDL_GetHapticID

-- | Get the implementation dependent name of a haptic device.
--
--     [Returns]: the name of the selected haptic device. If no name can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getHapticNameForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetHapticName@.
--                   The safe flavor is 'getHapticNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetHapticName@, defined at @SDL3\/SDL_haptic.h 1054:42@
getHapticName
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' obtained from 'SDL3.Sys.Joystick.openJoystick'.
  -> IO (PtrConst.PtrConst BG.CChar)
getHapticName = Unsafe.sDL_GetHapticName

-- | Get the implementation dependent name of a haptic device.
--
--     [Returns]: the name of the selected haptic device. If no name can be found, this function returns NULL; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getHapticNameForID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetHapticName@.
--                   The unsafe flavor is 'getHapticName'
--                   .
--
--     [C declaration]: @SDL_GetHapticName@, defined at @SDL3\/SDL_haptic.h 1054:42@
getHapticNameSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' obtained from 'SDL3.Sys.Joystick.openJoystick'.
  -> IO (PtrConst.PtrConst BG.CChar)
getHapticNameSafe = Safe.sDL_GetHapticName

-- | Query whether or not the current mouse has haptic capabilities.
--
--     [Returns]: true if the mouse is haptic or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'openHapticFromMouse'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IsMouseHaptic@.
--                   The safe flavor is 'isMouseHapticSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsMouseHaptic@, defined at @SDL3\/SDL_haptic.h 1065:34@
isMouseHaptic :: IO Bool
isMouseHaptic =
  fmap CBool.toBool Unsafe.sDL_IsMouseHaptic

-- | Query whether or not the current mouse has haptic capabilities.
--
--     [Returns]: true if the mouse is haptic or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'openHapticFromMouse'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IsMouseHaptic@.
--                   The unsafe flavor is 'isMouseHaptic'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsMouseHaptic@, defined at @SDL3\/SDL_haptic.h 1065:34@
isMouseHapticSafe :: IO Bool
isMouseHapticSafe =
  fmap CBool.toBool Safe.sDL_IsMouseHaptic

-- | Try to open a haptic device from the current mouse.
--
--     [Returns]: the haptic device identifier or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeHaptic', 'isMouseHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenHapticFromMouse@.
--                   The safe flavor is 'openHapticFromMouseSafe'
--                   .
--
--     [C declaration]: @SDL_OpenHapticFromMouse@, defined at @SDL3\/SDL_haptic.h 1078:42@
openHapticFromMouse :: IO (BG.Ptr SDL_Haptic)
openHapticFromMouse = Unsafe.sDL_OpenHapticFromMouse

-- | Try to open a haptic device from the current mouse.
--
--     [Returns]: the haptic device identifier or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeHaptic', 'isMouseHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenHapticFromMouse@.
--                   The unsafe flavor is 'openHapticFromMouse'
--                   .
--
--     [C declaration]: @SDL_OpenHapticFromMouse@, defined at @SDL3\/SDL_haptic.h 1078:42@
openHapticFromMouseSafe :: IO (BG.Ptr SDL_Haptic)
openHapticFromMouseSafe =
  Safe.sDL_OpenHapticFromMouse

-- | Query if a joystick has haptic features.
--
--     [Returns]: true if the joystick is haptic or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'openHapticFromJoystick'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IsJoystickHaptic@.
--                   The safe flavor is 'isJoystickHapticSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsJoystickHaptic@, defined at @SDL3\/SDL_haptic.h 1090:34@
isJoystickHaptic
  :: BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the SDL_Joystick to test for haptic capabilities.
  -> IO Bool
isJoystickHaptic =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_IsJoystickHaptic x00)

-- | Query if a joystick has haptic features.
--
--     [Returns]: true if the joystick is haptic or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'openHapticFromJoystick'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IsJoystickHaptic@.
--                   The unsafe flavor is 'isJoystickHaptic'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsJoystickHaptic@, defined at @SDL3\/SDL_haptic.h 1090:34@
isJoystickHapticSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the SDL_Joystick to test for haptic capabilities.
  -> IO Bool
isJoystickHapticSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_IsJoystickHaptic x00)

-- | Open a haptic device for use from a joystick device.
--
--     You must still close the haptic device separately. It will not be closed with the joystick.
--
--     When opened from a joystick you should first close the haptic device before closing the joystick device. If not, on some implementations the haptic device will also get unallocated and you\'ll be unable to use force feedback on that device.
--
--     [Returns]: a valid haptic device identifier on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeHaptic', 'isJoystickHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenHapticFromJoystick@.
--                   The safe flavor is 'openHapticFromJoystickSafe'
--                   .
--
--     [C declaration]: @SDL_OpenHapticFromJoystick@, defined at @SDL3\/SDL_haptic.h 1112:42@
openHapticFromJoystick
  :: BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the SDL_Joystick to create a haptic device from.
  -> IO (BG.Ptr SDL_Haptic)
openHapticFromJoystick =
  Unsafe.sDL_OpenHapticFromJoystick

-- | Open a haptic device for use from a joystick device.
--
--     You must still close the haptic device separately. It will not be closed with the joystick.
--
--     When opened from a joystick you should first close the haptic device before closing the joystick device. If not, on some implementations the haptic device will also get unallocated and you\'ll be unable to use force feedback on that device.
--
--     [Returns]: a valid haptic device identifier on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeHaptic', 'isJoystickHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenHapticFromJoystick@.
--                   The unsafe flavor is 'openHapticFromJoystick'
--                   .
--
--     [C declaration]: @SDL_OpenHapticFromJoystick@, defined at @SDL3\/SDL_haptic.h 1112:42@
openHapticFromJoystickSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the SDL_Joystick to create a haptic device from.
  -> IO (BG.Ptr SDL_Haptic)
openHapticFromJoystickSafe =
  Safe.sDL_OpenHapticFromJoystick

-- | Close a haptic device previously opened with @'openHaptic'@.
--
--     @since 3.2.0
--
--     [See also]: 'openHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CloseHaptic@.
--                   The safe flavor is 'closeHapticSafe'
--                   .
--
--     [C declaration]: @SDL_CloseHaptic@, defined at @SDL3\/SDL_haptic.h 1123:34@
closeHaptic
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to close.
  -> IO ()
closeHaptic = Unsafe.sDL_CloseHaptic

-- | Close a haptic device previously opened with @'openHaptic'@.
--
--     @since 3.2.0
--
--     [See also]: 'openHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CloseHaptic@.
--                   The unsafe flavor is 'closeHaptic'
--                   .
--
--     [C declaration]: @SDL_CloseHaptic@, defined at @SDL3\/SDL_haptic.h 1123:34@
closeHapticSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to close.
  -> IO ()
closeHapticSafe = Safe.sDL_CloseHaptic

-- | Get the number of effects a haptic device can store.
--
--     On some platforms this isn\'t fully supported, and therefore is an approximation. Always check to see if your created effect was actually created and do not rely solely on @'getMaxHapticEffects'@.
--
--     [Returns]: the number of effects the haptic device can store or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getMaxHapticEffectsPlaying', 'getHapticFeatures'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetMaxHapticEffects@.
--                   The safe flavor is 'getMaxHapticEffectsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetMaxHapticEffects@, defined at @SDL3\/SDL_haptic.h 1141:33@
getMaxHapticEffects
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> IO BG.Int32
getMaxHapticEffects =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetMaxHapticEffects x00)

-- | Get the number of effects a haptic device can store.
--
--     On some platforms this isn\'t fully supported, and therefore is an approximation. Always check to see if your created effect was actually created and do not rely solely on @'getMaxHapticEffects'@.
--
--     [Returns]: the number of effects the haptic device can store or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getMaxHapticEffectsPlaying', 'getHapticFeatures'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetMaxHapticEffects@.
--                   The unsafe flavor is 'getMaxHapticEffects'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetMaxHapticEffects@, defined at @SDL3\/SDL_haptic.h 1141:33@
getMaxHapticEffectsSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> IO BG.Int32
getMaxHapticEffectsSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetMaxHapticEffects x00)

-- | Get the number of effects a haptic device can play at the same time.
--
--     This is not supported on all platforms, but will always return a value.
--
--     [Returns]: the number of effects the haptic device can play at the same time or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getMaxHapticEffects', 'getHapticFeatures'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetMaxHapticEffectsPlaying@.
--                   The safe flavor is 'getMaxHapticEffectsPlayingSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetMaxHapticEffectsPlaying@, defined at @SDL3\/SDL_haptic.h 1157:33@
getMaxHapticEffectsPlaying
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query maximum playing effects.
  -> IO BG.Int32
getMaxHapticEffectsPlaying =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetMaxHapticEffectsPlaying x00)

-- | Get the number of effects a haptic device can play at the same time.
--
--     This is not supported on all platforms, but will always return a value.
--
--     [Returns]: the number of effects the haptic device can play at the same time or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getMaxHapticEffects', 'getHapticFeatures'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetMaxHapticEffectsPlaying@.
--                   The unsafe flavor is 'getMaxHapticEffectsPlaying'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetMaxHapticEffectsPlaying@, defined at @SDL3\/SDL_haptic.h 1157:33@
getMaxHapticEffectsPlayingSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query maximum playing effects.
  -> IO BG.Int32
getMaxHapticEffectsPlayingSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetMaxHapticEffectsPlaying x00)

-- | Get the haptic device\'s supported features in bitwise manner.
--
--     [Returns]: a list of supported haptic features in bitwise manner (OR\'d), or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'hapticEffectSupported', 'getMaxHapticEffects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetHapticFeatures@.
--                   The safe flavor is 'getHapticFeaturesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetHapticFeatures@, defined at @SDL3\/SDL_haptic.h 1171:36@
getHapticFeatures
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> IO BG.Word32
getHapticFeatures =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetHapticFeatures x00)

-- | Get the haptic device\'s supported features in bitwise manner.
--
--     [Returns]: a list of supported haptic features in bitwise manner (OR\'d), or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'hapticEffectSupported', 'getMaxHapticEffects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetHapticFeatures@.
--                   The unsafe flavor is 'getHapticFeatures'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetHapticFeatures@, defined at @SDL3\/SDL_haptic.h 1171:36@
getHapticFeaturesSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> IO BG.Word32
getHapticFeaturesSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetHapticFeatures x00)

-- | Get the number of haptic axes the device has.
--
--     The number of haptic axes might be useful if working with the 'SDL_HapticDirection' effect.
--
--     [Returns]: the number of axes on success or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumHapticAxes@.
--                   The safe flavor is 'getNumHapticAxesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumHapticAxes@, defined at @SDL3\/SDL_haptic.h 1185:33@
getNumHapticAxes
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> IO BG.Int32
getNumHapticAxes =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetNumHapticAxes x00)

-- | Get the number of haptic axes the device has.
--
--     The number of haptic axes might be useful if working with the 'SDL_HapticDirection' effect.
--
--     [Returns]: the number of axes on success or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumHapticAxes@.
--                   The unsafe flavor is 'getNumHapticAxes'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumHapticAxes@, defined at @SDL3\/SDL_haptic.h 1185:33@
getNumHapticAxesSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> IO BG.Int32
getNumHapticAxesSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetNumHapticAxes x00)

-- | Check to see if an effect is supported by a haptic device.
--
--     [Returns]: true if the effect is supported or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'createHapticEffect', 'getHapticFeatures'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HapticEffectSupported@.
--                   The safe flavor is 'hapticEffectSupportedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HapticEffectSupported@, defined at @SDL3\/SDL_haptic.h 1199:34@
hapticEffectSupported
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> PtrConst.PtrConst SDL_HapticEffect
  -- ^
  --
  --           [@effect@]: the desired effect to query.
  -> IO Bool
hapticEffectSupported =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_HapticEffectSupported x00 x11)

-- | Check to see if an effect is supported by a haptic device.
--
--     [Returns]: true if the effect is supported or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'createHapticEffect', 'getHapticFeatures'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HapticEffectSupported@.
--                   The unsafe flavor is 'hapticEffectSupported'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HapticEffectSupported@, defined at @SDL3\/SDL_haptic.h 1199:34@
hapticEffectSupportedSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> PtrConst.PtrConst SDL_HapticEffect
  -- ^
  --
  --           [@effect@]: the desired effect to query.
  -> IO Bool
hapticEffectSupportedSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_HapticEffectSupported x00 x11)

-- | Create a new haptic effect on a specified device.
--
--     [Returns]: the ID of the effect on success or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'destroyHapticEffect', 'runHapticEffect', 'updateHapticEffect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateHapticEffect@.
--                   The safe flavor is 'createHapticEffectSafe'
--                   .
--
--     [C declaration]: @SDL_CreateHapticEffect@, defined at @SDL3\/SDL_haptic.h 1216:48@
createHapticEffect
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: an 'SDL_Haptic' device to create the effect on.
  -> PtrConst.PtrConst SDL_HapticEffect
  -- ^
  --
  --           [@effect@]: an 'SDL_HapticEffect' structure containing the properties of the effect to create.
  -> IO SDL_HapticEffectID
createHapticEffect = Unsafe.sDL_CreateHapticEffect

-- | Create a new haptic effect on a specified device.
--
--     [Returns]: the ID of the effect on success or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'destroyHapticEffect', 'runHapticEffect', 'updateHapticEffect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateHapticEffect@.
--                   The unsafe flavor is 'createHapticEffect'
--                   .
--
--     [C declaration]: @SDL_CreateHapticEffect@, defined at @SDL3\/SDL_haptic.h 1216:48@
createHapticEffectSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: an 'SDL_Haptic' device to create the effect on.
  -> PtrConst.PtrConst SDL_HapticEffect
  -- ^
  --
  --           [@effect@]: an 'SDL_HapticEffect' structure containing the properties of the effect to create.
  -> IO SDL_HapticEffectID
createHapticEffectSafe = Safe.sDL_CreateHapticEffect

-- | Update the properties of an effect.
--
--     Can be used dynamically, although behavior when dynamically changing direction may be strange. Specifically the effect may re-upload itself and start playing from the start. You also cannot change the type either when running @'updateHapticEffect'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'createHapticEffect', 'runHapticEffect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UpdateHapticEffect@.
--                   The safe flavor is 'updateHapticEffectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UpdateHapticEffect@, defined at @SDL3\/SDL_haptic.h 1238:34@
updateHapticEffect
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device that has the effect.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the identifier of the effect to update.
  -> PtrConst.PtrConst SDL_HapticEffect
  -- ^
  --
  --           [@data@]: an 'SDL_HapticEffect' structure containing the new effect properties to use.
  -> IO Bool
updateHapticEffect =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_UpdateHapticEffect x00 x11 x22)

-- | Update the properties of an effect.
--
--     Can be used dynamically, although behavior when dynamically changing direction may be strange. Specifically the effect may re-upload itself and start playing from the start. You also cannot change the type either when running @'updateHapticEffect'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'createHapticEffect', 'runHapticEffect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UpdateHapticEffect@.
--                   The unsafe flavor is 'updateHapticEffect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UpdateHapticEffect@, defined at @SDL3\/SDL_haptic.h 1238:34@
updateHapticEffectSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device that has the effect.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the identifier of the effect to update.
  -> PtrConst.PtrConst SDL_HapticEffect
  -- ^
  --
  --           [@data@]: an 'SDL_HapticEffect' structure containing the new effect properties to use.
  -> IO Bool
updateHapticEffectSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_UpdateHapticEffect x00 x11 x22)

-- | Run the haptic effect on its associated haptic device.
--
--     To repeat the effect over and over indefinitely, set @iterations@ to @'sDL_HAPTIC_INFINITY'@. (Repeats the envelope - attack and fade.) To make one instance of the effect last indefinitely (so the effect does not fade), set the effect\'s @length@ in its structure\/union to @'sDL_HAPTIC_INFINITY'@ instead.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getHapticEffectStatus', 'stopHapticEffect', 'stopHapticEffects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RunHapticEffect@.
--                   The safe flavor is 'runHapticEffectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RunHapticEffect@, defined at @SDL3\/SDL_haptic.h 1262:34@
runHapticEffect
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to run the effect on.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the ID of the haptic effect to run.
  -> BG.Word32
  -- ^
  --
  --           [@iterations@]: the number of iterations to run the effect; use @'sDL_HAPTIC_INFINITY'@ to repeat forever.
  -> IO Bool
runHapticEffect =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_RunHapticEffect x00 x11 (Coerce.coerce x22))

-- | Run the haptic effect on its associated haptic device.
--
--     To repeat the effect over and over indefinitely, set @iterations@ to @'sDL_HAPTIC_INFINITY'@. (Repeats the envelope - attack and fade.) To make one instance of the effect last indefinitely (so the effect does not fade), set the effect\'s @length@ in its structure\/union to @'sDL_HAPTIC_INFINITY'@ instead.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getHapticEffectStatus', 'stopHapticEffect', 'stopHapticEffects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RunHapticEffect@.
--                   The unsafe flavor is 'runHapticEffect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RunHapticEffect@, defined at @SDL3\/SDL_haptic.h 1262:34@
runHapticEffectSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to run the effect on.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the ID of the haptic effect to run.
  -> BG.Word32
  -- ^
  --
  --           [@iterations@]: the number of iterations to run the effect; use @'sDL_HAPTIC_INFINITY'@ to repeat forever.
  -> IO Bool
runHapticEffectSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_RunHapticEffect x00 x11 (Coerce.coerce x22))

-- | Stop the haptic effect on its associated haptic device.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'runHapticEffect', 'stopHapticEffects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_StopHapticEffect@.
--                   The safe flavor is 'stopHapticEffectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StopHapticEffect@, defined at @SDL3\/SDL_haptic.h 1277:34@
stopHapticEffect
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to stop the effect on.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the ID of the haptic effect to stop.
  -> IO Bool
stopHapticEffect =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_StopHapticEffect x00 x11)

-- | Stop the haptic effect on its associated haptic device.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'runHapticEffect', 'stopHapticEffects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_StopHapticEffect@.
--                   The unsafe flavor is 'stopHapticEffect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StopHapticEffect@, defined at @SDL3\/SDL_haptic.h 1277:34@
stopHapticEffectSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to stop the effect on.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the ID of the haptic effect to stop.
  -> IO Bool
stopHapticEffectSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_StopHapticEffect x00 x11)

-- | Destroy a haptic effect on the device.
--
--     This will stop the effect if it\'s running. Effects are automatically destroyed when the device is closed.
--
--     @since 3.2.0
--
--     [See also]: 'createHapticEffect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyHapticEffect@.
--                   The safe flavor is 'destroyHapticEffectSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyHapticEffect@, defined at @SDL3\/SDL_haptic.h 1292:34@
destroyHapticEffect
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to destroy the effect on.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the ID of the haptic effect to destroy.
  -> IO ()
destroyHapticEffect = Unsafe.sDL_DestroyHapticEffect

-- | Destroy a haptic effect on the device.
--
--     This will stop the effect if it\'s running. Effects are automatically destroyed when the device is closed.
--
--     @since 3.2.0
--
--     [See also]: 'createHapticEffect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyHapticEffect@.
--                   The unsafe flavor is 'destroyHapticEffect'
--                   .
--
--     [C declaration]: @SDL_DestroyHapticEffect@, defined at @SDL3\/SDL_haptic.h 1292:34@
destroyHapticEffectSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to destroy the effect on.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the ID of the haptic effect to destroy.
  -> IO ()
destroyHapticEffectSafe =
  Safe.sDL_DestroyHapticEffect

-- | Get the status of the current effect on the specified haptic device.
--
--     Device must support the SDL_HAPTIC_STATUS feature.
--
--     [Returns]: true if it is playing, false if it isn\'t playing or haptic status isn\'t supported.
--
--     @since 3.2.0
--
--     [See also]: 'getHapticFeatures'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetHapticEffectStatus@.
--                   The safe flavor is 'getHapticEffectStatusSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetHapticEffectStatus@, defined at @SDL3\/SDL_haptic.h 1308:34@
getHapticEffectStatus
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query for the effect status on.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the ID of the haptic effect to query its status.
  -> IO Bool
getHapticEffectStatus =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetHapticEffectStatus x00 x11)

-- | Get the status of the current effect on the specified haptic device.
--
--     Device must support the SDL_HAPTIC_STATUS feature.
--
--     [Returns]: true if it is playing, false if it isn\'t playing or haptic status isn\'t supported.
--
--     @since 3.2.0
--
--     [See also]: 'getHapticFeatures'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetHapticEffectStatus@.
--                   The unsafe flavor is 'getHapticEffectStatus'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetHapticEffectStatus@, defined at @SDL3\/SDL_haptic.h 1308:34@
getHapticEffectStatusSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query for the effect status on.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the ID of the haptic effect to query its status.
  -> IO Bool
getHapticEffectStatusSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetHapticEffectStatus x00 x11)

-- | Set the global gain of the specified haptic device.
--
--     Device must support the SDL_HAPTIC_GAIN feature.
--
--     The user may specify the maximum gain by setting the environment variable @SDL_HAPTIC_GAIN_MAX@ which should be between 0 and 100. All calls to @'setHapticGain'@ will scale linearly using @SDL_HAPTIC_GAIN_MAX@ as the maximum.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getHapticFeatures'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetHapticGain@.
--                   The safe flavor is 'setHapticGainSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetHapticGain@, defined at @SDL3\/SDL_haptic.h 1330:34@
setHapticGain
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to set the gain on.
  -> BG.Int32
  -- ^
  --
  --           [@gain@]: value to set the gain to, should be between 0 and 100 (0 - 100).
  -> IO Bool
setHapticGain =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetHapticGain x00 (Coerce.coerce x11))

-- | Set the global gain of the specified haptic device.
--
--     Device must support the SDL_HAPTIC_GAIN feature.
--
--     The user may specify the maximum gain by setting the environment variable @SDL_HAPTIC_GAIN_MAX@ which should be between 0 and 100. All calls to @'setHapticGain'@ will scale linearly using @SDL_HAPTIC_GAIN_MAX@ as the maximum.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getHapticFeatures'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetHapticGain@.
--                   The unsafe flavor is 'setHapticGain'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetHapticGain@, defined at @SDL3\/SDL_haptic.h 1330:34@
setHapticGainSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to set the gain on.
  -> BG.Int32
  -- ^
  --
  --           [@gain@]: value to set the gain to, should be between 0 and 100 (0 - 100).
  -> IO Bool
setHapticGainSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetHapticGain x00 (Coerce.coerce x11))

-- | Set the global autocenter of the device.
--
--     Autocenter should be between 0 and 100. Setting it to 0 will disable autocentering.
--
--     Device must support the SDL_HAPTIC_AUTOCENTER feature.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getHapticFeatures'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetHapticAutocenter@.
--                   The safe flavor is 'setHapticAutocenterSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetHapticAutocenter@, defined at @SDL3\/SDL_haptic.h 1349:34@
setHapticAutocenter
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to set autocentering on.
  -> BG.Int32
  -- ^
  --
  --           [@autocenter@]: value to set autocenter to (0-100).
  -> IO Bool
setHapticAutocenter =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetHapticAutocenter x00 (Coerce.coerce x11))

-- | Set the global autocenter of the device.
--
--     Autocenter should be between 0 and 100. Setting it to 0 will disable autocentering.
--
--     Device must support the SDL_HAPTIC_AUTOCENTER feature.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getHapticFeatures'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetHapticAutocenter@.
--                   The unsafe flavor is 'setHapticAutocenter'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetHapticAutocenter@, defined at @SDL3\/SDL_haptic.h 1349:34@
setHapticAutocenterSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to set autocentering on.
  -> BG.Int32
  -- ^
  --
  --           [@autocenter@]: value to set autocenter to (0-100).
  -> IO Bool
setHapticAutocenterSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetHapticAutocenter x00 (Coerce.coerce x11))

-- | Pause a haptic device.
--
--     Device must support the @'sDL_HAPTIC_PAUSE'@ feature. Call @'resumeHaptic'@ to resume playback.
--
--     Do not modify the effects nor add new ones while the device is paused. That can cause all sorts of weird errors.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'resumeHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PauseHaptic@.
--                   The safe flavor is 'pauseHapticSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PauseHaptic@, defined at @SDL3\/SDL_haptic.h 1368:34@
pauseHaptic
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to pause.
  -> IO Bool
pauseHaptic =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_PauseHaptic x00)

-- | Pause a haptic device.
--
--     Device must support the @'sDL_HAPTIC_PAUSE'@ feature. Call @'resumeHaptic'@ to resume playback.
--
--     Do not modify the effects nor add new ones while the device is paused. That can cause all sorts of weird errors.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'resumeHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PauseHaptic@.
--                   The unsafe flavor is 'pauseHaptic'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PauseHaptic@, defined at @SDL3\/SDL_haptic.h 1368:34@
pauseHapticSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to pause.
  -> IO Bool
pauseHapticSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_PauseHaptic x00)

-- | Resume a haptic device.
--
--     Call to unpause after @'pauseHaptic'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'pauseHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ResumeHaptic@.
--                   The safe flavor is 'resumeHapticSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ResumeHaptic@, defined at @SDL3\/SDL_haptic.h 1383:34@
resumeHaptic
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to unpause.
  -> IO Bool
resumeHaptic =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_ResumeHaptic x00)

-- | Resume a haptic device.
--
--     Call to unpause after @'pauseHaptic'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'pauseHaptic'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ResumeHaptic@.
--                   The unsafe flavor is 'resumeHaptic'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ResumeHaptic@, defined at @SDL3\/SDL_haptic.h 1383:34@
resumeHapticSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to unpause.
  -> IO Bool
resumeHapticSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_ResumeHaptic x00)

-- | Stop all the currently playing effects on a haptic device.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'runHapticEffect', 'stopHapticEffects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_StopHapticEffects@.
--                   The safe flavor is 'stopHapticEffectsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StopHapticEffects@, defined at @SDL3\/SDL_haptic.h 1397:34@
stopHapticEffects
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to stop.
  -> IO Bool
stopHapticEffects =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_StopHapticEffects x00)

-- | Stop all the currently playing effects on a haptic device.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'runHapticEffect', 'stopHapticEffects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_StopHapticEffects@.
--                   The unsafe flavor is 'stopHapticEffects'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StopHapticEffects@, defined at @SDL3\/SDL_haptic.h 1397:34@
stopHapticEffectsSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to stop.
  -> IO Bool
stopHapticEffectsSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_StopHapticEffects x00)

-- | Check whether rumble is supported on a haptic device.
--
--     [Returns]: true if the effect is supported or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'initHapticRumble'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HapticRumbleSupported@.
--                   The safe flavor is 'hapticRumbleSupportedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HapticRumbleSupported@, defined at @SDL3\/SDL_haptic.h 1409:34@
hapticRumbleSupported
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: haptic device to check for rumble support.
  -> IO Bool
hapticRumbleSupported =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_HapticRumbleSupported x00)

-- | Check whether rumble is supported on a haptic device.
--
--     [Returns]: true if the effect is supported or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'initHapticRumble'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HapticRumbleSupported@.
--                   The unsafe flavor is 'hapticRumbleSupported'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HapticRumbleSupported@, defined at @SDL3\/SDL_haptic.h 1409:34@
hapticRumbleSupportedSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: haptic device to check for rumble support.
  -> IO Bool
hapticRumbleSupportedSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_HapticRumbleSupported x00)

-- | Initialize a haptic device for simple rumble playback.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'playHapticRumble', 'stopHapticRumble', 'hapticRumbleSupported'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_InitHapticRumble@.
--                   The safe flavor is 'initHapticRumbleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_InitHapticRumble@, defined at @SDL3\/SDL_haptic.h 1424:34@
initHapticRumble
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the haptic device to initialize for simple rumble playback.
  -> IO Bool
initHapticRumble =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_InitHapticRumble x00)

-- | Initialize a haptic device for simple rumble playback.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'playHapticRumble', 'stopHapticRumble', 'hapticRumbleSupported'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_InitHapticRumble@.
--                   The unsafe flavor is 'initHapticRumble'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_InitHapticRumble@, defined at @SDL3\/SDL_haptic.h 1424:34@
initHapticRumbleSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the haptic device to initialize for simple rumble playback.
  -> IO Bool
initHapticRumbleSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_InitHapticRumble x00)

-- | Run a simple rumble effect on a haptic device.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'initHapticRumble', 'stopHapticRumble'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PlayHapticRumble@.
--                   The safe flavor is 'playHapticRumbleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PlayHapticRumble@, defined at @SDL3\/SDL_haptic.h 1440:34@
playHapticRumble
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the haptic device to play the rumble effect on.
  -> Float
  -- ^
  --
  --           [@strength@]: strength of the rumble to play as a 0-1 float value.
  -> BG.Word32
  -- ^
  --
  --           [@length@]: length of the rumble to play in milliseconds.
  -> IO Bool
playHapticRumble =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_PlayHapticRumble x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Run a simple rumble effect on a haptic device.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'initHapticRumble', 'stopHapticRumble'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PlayHapticRumble@.
--                   The unsafe flavor is 'playHapticRumble'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PlayHapticRumble@, defined at @SDL3\/SDL_haptic.h 1440:34@
playHapticRumbleSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the haptic device to play the rumble effect on.
  -> Float
  -- ^
  --
  --           [@strength@]: strength of the rumble to play as a 0-1 float value.
  -> BG.Word32
  -- ^
  --
  --           [@length@]: length of the rumble to play in milliseconds.
  -> IO Bool
playHapticRumbleSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_PlayHapticRumble x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Stop the simple rumble on a haptic device.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'playHapticRumble'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_StopHapticRumble@.
--                   The safe flavor is 'stopHapticRumbleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StopHapticRumble@, defined at @SDL3\/SDL_haptic.h 1453:34@
stopHapticRumble
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the haptic device to stop the rumble effect on.
  -> IO Bool
stopHapticRumble =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_StopHapticRumble x00)

-- | Stop the simple rumble on a haptic device.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'playHapticRumble'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_StopHapticRumble@.
--                   The unsafe flavor is 'stopHapticRumble'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StopHapticRumble@, defined at @SDL3\/SDL_haptic.h 1453:34@
stopHapticRumbleSafe
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the haptic device to stop the rumble effect on.
  -> IO Bool
stopHapticRumbleSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_StopHapticRumble x00)

-- | Typed constant for macro @SDL_HAPTIC_POLAR@.
pattern SDL_HAPTIC_POLAR :: SDL_HapticDirectionType
pattern SDL_HAPTIC_POLAR = SDL_HapticDirectionType 0

-- | Typed constant for macro @SDL_HAPTIC_CARTESIAN@.
pattern SDL_HAPTIC_CARTESIAN :: SDL_HapticDirectionType
pattern SDL_HAPTIC_CARTESIAN = SDL_HapticDirectionType 1

-- | Typed constant for macro @SDL_HAPTIC_SPHERICAL@.
pattern SDL_HAPTIC_SPHERICAL :: SDL_HapticDirectionType
pattern SDL_HAPTIC_SPHERICAL = SDL_HapticDirectionType 2

-- | Typed constant for macro @SDL_HAPTIC_STEERING_AXIS@.
pattern SDL_HAPTIC_STEERING_AXIS :: SDL_HapticDirectionType
pattern SDL_HAPTIC_STEERING_AXIS = SDL_HapticDirectionType 3

-- | Typed constant for macro @SDL_HAPTIC_CONSTANT@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_CONSTANT :: SDL_HapticEffectType
pattern SDL_HAPTIC_CONSTANT = SDL_HapticEffectType 0x0001

-- | Typed constant for macro @SDL_HAPTIC_SINE@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_SINE :: SDL_HapticEffectType
pattern SDL_HAPTIC_SINE = SDL_HapticEffectType 0x0002

-- | Typed constant for macro @SDL_HAPTIC_SQUARE@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_SQUARE :: SDL_HapticEffectType
pattern SDL_HAPTIC_SQUARE = SDL_HapticEffectType 0x0004

-- | Typed constant for macro @SDL_HAPTIC_TRIANGLE@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_TRIANGLE :: SDL_HapticEffectType
pattern SDL_HAPTIC_TRIANGLE = SDL_HapticEffectType 0x0008

-- | Typed constant for macro @SDL_HAPTIC_SAWTOOTHUP@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_SAWTOOTHUP :: SDL_HapticEffectType
pattern SDL_HAPTIC_SAWTOOTHUP = SDL_HapticEffectType 0x0010

-- | Typed constant for macro @SDL_HAPTIC_SAWTOOTHDOWN@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_SAWTOOTHDOWN :: SDL_HapticEffectType
pattern SDL_HAPTIC_SAWTOOTHDOWN = SDL_HapticEffectType 0x0020

-- | Typed constant for macro @SDL_HAPTIC_RAMP@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_RAMP :: SDL_HapticEffectType
pattern SDL_HAPTIC_RAMP = SDL_HapticEffectType 0x0040

-- | Typed constant for macro @SDL_HAPTIC_SPRING@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_SPRING :: SDL_HapticEffectType
pattern SDL_HAPTIC_SPRING = SDL_HapticEffectType 0x0080

-- | Typed constant for macro @SDL_HAPTIC_DAMPER@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_DAMPER :: SDL_HapticEffectType
pattern SDL_HAPTIC_DAMPER = SDL_HapticEffectType 0x0100

-- | Typed constant for macro @SDL_HAPTIC_INERTIA@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_INERTIA :: SDL_HapticEffectType
pattern SDL_HAPTIC_INERTIA = SDL_HapticEffectType 0x0200

-- | Typed constant for macro @SDL_HAPTIC_FRICTION@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_FRICTION :: SDL_HapticEffectType
pattern SDL_HAPTIC_FRICTION = SDL_HapticEffectType 0x0400

-- | Typed constant for macro @SDL_HAPTIC_LEFTRIGHT@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_LEFTRIGHT :: SDL_HapticEffectType
pattern SDL_HAPTIC_LEFTRIGHT = SDL_HapticEffectType 0x0800

-- | Typed constant for macro @SDL_HAPTIC_RESERVED1@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_RESERVED1 :: SDL_HapticEffectType
pattern SDL_HAPTIC_RESERVED1 = SDL_HapticEffectType 0x1000

-- | Typed constant for macro @SDL_HAPTIC_RESERVED2@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_RESERVED2 :: SDL_HapticEffectType
pattern SDL_HAPTIC_RESERVED2 = SDL_HapticEffectType 0x2000

-- | Typed constant for macro @SDL_HAPTIC_RESERVED3@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_RESERVED3 :: SDL_HapticEffectType
pattern SDL_HAPTIC_RESERVED3 = SDL_HapticEffectType 0x4000

-- | Typed constant for macro @SDL_HAPTIC_CUSTOM@. Combine with @.|.@ from "Data.Bits".
pattern SDL_HAPTIC_CUSTOM :: SDL_HapticEffectType
pattern SDL_HAPTIC_CUSTOM = SDL_HapticEffectType 0x8000

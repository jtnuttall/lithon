{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Haptic.Unsafe (
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_GetHaptics,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_GetHapticNameForID,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_OpenHaptic,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_GetHapticFromID,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_GetHapticID,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_GetHapticName,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_IsMouseHaptic,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_OpenHapticFromMouse,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_IsJoystickHaptic,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_OpenHapticFromJoystick,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_CloseHaptic,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_GetMaxHapticEffects,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_GetMaxHapticEffectsPlaying,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_GetHapticFeatures,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_GetNumHapticAxes,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_HapticEffectSupported,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_CreateHapticEffect,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_UpdateHapticEffect,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_RunHapticEffect,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_StopHapticEffect,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_DestroyHapticEffect,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_GetHapticEffectStatus,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_SetHapticGain,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_SetHapticAutocenter,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_PauseHaptic,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_ResumeHaptic,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_StopHapticEffects,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_HapticRumbleSupported,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_InitHapticRumble,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_PlayHapticRumble,
  SDL3.Sys.Bindgen.Haptic.Unsafe.sDL_StopHapticRumble,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Haptic
import SDL3.Sys.Bindgen.Joystick qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_haptic.h>"
         , "SDL_HapticID *hs_bindgen_9144fd217aed3644 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetHaptics)(arg1);"
         , "}"
         , "char const *hs_bindgen_0bc6c8aa0c9268ef ("
         , "  SDL_HapticID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetHapticNameForID)(arg1);"
         , "}"
         , "SDL_Haptic *hs_bindgen_e145a39ad8de4588 ("
         , "  SDL_HapticID arg1"
         , ")"
         , "{"
         , "  return (SDL_OpenHaptic)(arg1);"
         , "}"
         , "SDL_Haptic *hs_bindgen_3eb0e70beaf705a6 ("
         , "  SDL_HapticID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetHapticFromID)(arg1);"
         , "}"
         , "SDL_HapticID hs_bindgen_733c1ac4379b685f ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetHapticID)(arg1);"
         , "}"
         , "char const *hs_bindgen_65ea37324067e4e8 ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetHapticName)(arg1);"
         , "}"
         , "_Bool hs_bindgen_7f6b487ecec1bdc7 (void)"
         , "{"
         , "  return (SDL_IsMouseHaptic)();"
         , "}"
         , "SDL_Haptic *hs_bindgen_fdfe5c61a81c94fd (void)"
         , "{"
         , "  return (SDL_OpenHapticFromMouse)();"
         , "}"
         , "_Bool hs_bindgen_136048137b058f4b ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_IsJoystickHaptic)(arg1);"
         , "}"
         , "SDL_Haptic *hs_bindgen_1ee4f9bee2fcd4f3 ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_OpenHapticFromJoystick)(arg1);"
         , "}"
         , "void hs_bindgen_5dc34bbc05254c40 ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  (SDL_CloseHaptic)(arg1);"
         , "}"
         , "signed int hs_bindgen_5cd0622005566196 ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetMaxHapticEffects)(arg1);"
         , "}"
         , "signed int hs_bindgen_ed10e8124384dcc6 ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetMaxHapticEffectsPlaying)(arg1);"
         , "}"
         , "Uint32 hs_bindgen_53effd9f65bf5118 ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetHapticFeatures)(arg1);"
         , "}"
         , "signed int hs_bindgen_fc1fa543654842e5 ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetNumHapticAxes)(arg1);"
         , "}"
         , "_Bool hs_bindgen_ddf7667b0951f535 ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_HapticEffectSupported)(arg1, arg2);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_HapticEffectID;"
         , "#endif"
         , "SDL_HapticEffectID hs_bindgen_8b8594cfaa325bcf ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateHapticEffect)(arg1, arg2);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_HapticEffectID;"
         , "#endif"
         , "_Bool hs_bindgen_9a5d65efc573a34d ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffectID arg2,"
         , "  SDL_HapticEffect const *arg3"
         , ")"
         , "{"
         , "  return (SDL_UpdateHapticEffect)(arg1, arg2, arg3);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_HapticEffectID;"
         , "#endif"
         , "_Bool hs_bindgen_a491b2976f3c0e2a ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffectID arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return (SDL_RunHapticEffect)(arg1, arg2, arg3);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_HapticEffectID;"
         , "#endif"
         , "_Bool hs_bindgen_a1ba32f8ccf55d38 ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffectID arg2"
         , ")"
         , "{"
         , "  return (SDL_StopHapticEffect)(arg1, arg2);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_HapticEffectID;"
         , "#endif"
         , "void hs_bindgen_2cf548acecd92e79 ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffectID arg2"
         , ")"
         , "{"
         , "  (SDL_DestroyHapticEffect)(arg1, arg2);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_HapticEffectID;"
         , "#endif"
         , "_Bool hs_bindgen_a77bda94890e1c73 ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffectID arg2"
         , ")"
         , "{"
         , "  return (SDL_GetHapticEffectStatus)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_206db73edc8fadd4 ("
         , "  SDL_Haptic *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_SetHapticGain)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_f0b69ddce282f135 ("
         , "  SDL_Haptic *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_SetHapticAutocenter)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_98b65e257f12670a ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return (SDL_PauseHaptic)(arg1);"
         , "}"
         , "_Bool hs_bindgen_d54e536e172fdf2a ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return (SDL_ResumeHaptic)(arg1);"
         , "}"
         , "_Bool hs_bindgen_10f2c8457cada0f1 ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return (SDL_StopHapticEffects)(arg1);"
         , "}"
         , "_Bool hs_bindgen_0b0f01d261871ca4 ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return (SDL_HapticRumbleSupported)(arg1);"
         , "}"
         , "_Bool hs_bindgen_1d3609585fc8a6db ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return (SDL_InitHapticRumble)(arg1);"
         , "}"
         , "_Bool hs_bindgen_9a900e80b5933810 ("
         , "  SDL_Haptic *arg1,"
         , "  float arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return (SDL_PlayHapticRumble)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_8eb60197e5125e42 ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return (SDL_StopHapticRumble)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHaptics@
foreign import ccall unsafe "hs_bindgen_9144fd217aed3644"
  hs_bindgen_9144fd217aed3644_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHaptics@
hs_bindgen_9144fd217aed3644
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL_HapticID)
hs_bindgen_9144fd217aed3644 =
  BG.fromFFIType hs_bindgen_9144fd217aed3644_base

-- | Get a list of currently connected haptic devices.
--
--     [Returns]: a 0 terminated array of haptic device instance IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenHaptic'
--
--     [C declaration]: @SDL_GetHaptics@, defined at @SDL3\/SDL_haptic.h 975:44@
sDL_GetHaptics
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of haptic devices returned, may be NULL.
  -> IO (BG.Ptr SDL_HapticID)
sDL_GetHaptics = hs_bindgen_9144fd217aed3644

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHapticNameForID@
foreign import ccall unsafe "hs_bindgen_0bc6c8aa0c9268ef"
  hs_bindgen_0bc6c8aa0c9268ef_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHapticNameForID@
hs_bindgen_0bc6c8aa0c9268ef
  :: SDL_HapticID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_0bc6c8aa0c9268ef =
  BG.fromFFIType hs_bindgen_0bc6c8aa0c9268ef_base

-- | Get the implementation dependent name of a haptic device.
--
--     This can be called before any haptic devices are opened.
--
--     [Returns]: the name of the selected haptic device. If no name can be found, this function returns NULL; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticName', 'sDL_OpenHaptic'
--
--     [C declaration]: @SDL_GetHapticNameForID@, defined at @SDL3\/SDL_haptic.h 992:42@
sDL_GetHapticNameForID
  :: SDL_HapticID
  -- ^
  --
  --           [@instance_id@]: the haptic device instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetHapticNameForID = hs_bindgen_0bc6c8aa0c9268ef

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_OpenHaptic@
foreign import ccall unsafe "hs_bindgen_e145a39ad8de4588"
  hs_bindgen_e145a39ad8de4588_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_OpenHaptic@
hs_bindgen_e145a39ad8de4588
  :: SDL_HapticID
  -> IO (BG.Ptr SDL_Haptic)
hs_bindgen_e145a39ad8de4588 =
  BG.fromFFIType hs_bindgen_e145a39ad8de4588_base

-- | Open a haptic device for use.
--
--     The index passed as an argument refers to the N\'th haptic device on this system.
--
--     When opening a haptic device, its gain will be set to maximum and autocenter will be disabled. To modify these values use @SDL_SetHapticGain()@ and @SDL_SetHapticAutocenter()@.
--
--     [Returns]: the device identifier or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseHaptic', 'sDL_GetHaptics', 'sDL_OpenHapticFromJoystick', 'sDL_OpenHapticFromMouse', 'sDL_SetHapticAutocenter', 'sDL_SetHapticGain'
--
--     [C declaration]: @SDL_OpenHaptic@, defined at @SDL3\/SDL_haptic.h 1017:42@
sDL_OpenHaptic
  :: SDL_HapticID
  -- ^
  --
  --           [@instance_id@]: the haptic device instance ID.
  -> IO (BG.Ptr SDL_Haptic)
sDL_OpenHaptic = hs_bindgen_e145a39ad8de4588

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHapticFromID@
foreign import ccall unsafe "hs_bindgen_3eb0e70beaf705a6"
  hs_bindgen_3eb0e70beaf705a6_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHapticFromID@
hs_bindgen_3eb0e70beaf705a6
  :: SDL_HapticID
  -> IO (BG.Ptr SDL_Haptic)
hs_bindgen_3eb0e70beaf705a6 =
  BG.fromFFIType hs_bindgen_3eb0e70beaf705a6_base

-- | Get the 'SDL_Haptic' associated with an instance ID, if it has been opened.
--
--     [Returns]: an 'SDL_Haptic' on success or NULL on failure or if it hasn\'t been opened yet; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetHapticFromID@, defined at @SDL3\/SDL_haptic.h 1029:42@
sDL_GetHapticFromID
  :: SDL_HapticID
  -- ^
  --
  --           [@instance_id@]: the instance ID to get the 'SDL_Haptic' for.
  -> IO (BG.Ptr SDL_Haptic)
sDL_GetHapticFromID = hs_bindgen_3eb0e70beaf705a6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHapticID@
foreign import ccall unsafe "hs_bindgen_733c1ac4379b685f"
  hs_bindgen_733c1ac4379b685f_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHapticID@
hs_bindgen_733c1ac4379b685f
  :: BG.Ptr SDL_Haptic
  -> IO SDL_HapticID
hs_bindgen_733c1ac4379b685f =
  BG.fromFFIType hs_bindgen_733c1ac4379b685f_base

-- | Get the instance ID of an opened haptic device.
--
--     [Returns]: the instance ID of the specified haptic device on success or 0 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetHapticID@, defined at @SDL3\/SDL_haptic.h 1040:42@
sDL_GetHapticID
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> IO SDL_HapticID
sDL_GetHapticID = hs_bindgen_733c1ac4379b685f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHapticName@
foreign import ccall unsafe "hs_bindgen_65ea37324067e4e8"
  hs_bindgen_65ea37324067e4e8_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHapticName@
hs_bindgen_65ea37324067e4e8
  :: BG.Ptr SDL_Haptic
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_65ea37324067e4e8 =
  BG.fromFFIType hs_bindgen_65ea37324067e4e8_base

-- | Get the implementation dependent name of a haptic device.
--
--     [Returns]: the name of the selected haptic device. If no name can be found, this function returns NULL; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticNameForID'
--
--     [C declaration]: @SDL_GetHapticName@, defined at @SDL3\/SDL_haptic.h 1054:42@
sDL_GetHapticName
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' obtained from SDL_OpenJoystick().
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetHapticName = hs_bindgen_65ea37324067e4e8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_IsMouseHaptic@
foreign import ccall unsafe "hs_bindgen_7f6b487ecec1bdc7"
  hs_bindgen_7f6b487ecec1bdc7_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_IsMouseHaptic@
hs_bindgen_7f6b487ecec1bdc7 :: IO BG.CBool
hs_bindgen_7f6b487ecec1bdc7 =
  BG.fromFFIType hs_bindgen_7f6b487ecec1bdc7_base

-- | Query whether or not the current mouse has haptic capabilities.
--
--     [Returns]: true if the mouse is haptic or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenHapticFromMouse'
--
--     [C declaration]: @SDL_IsMouseHaptic@, defined at @SDL3\/SDL_haptic.h 1065:34@
sDL_IsMouseHaptic :: IO BG.CBool
sDL_IsMouseHaptic = hs_bindgen_7f6b487ecec1bdc7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_OpenHapticFromMouse@
foreign import ccall unsafe "hs_bindgen_fdfe5c61a81c94fd"
  hs_bindgen_fdfe5c61a81c94fd_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_OpenHapticFromMouse@
hs_bindgen_fdfe5c61a81c94fd :: IO (BG.Ptr SDL_Haptic)
hs_bindgen_fdfe5c61a81c94fd =
  BG.fromFFIType hs_bindgen_fdfe5c61a81c94fd_base

-- | Try to open a haptic device from the current mouse.
--
--     [Returns]: the haptic device identifier or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseHaptic', 'sDL_IsMouseHaptic'
--
--     [C declaration]: @SDL_OpenHapticFromMouse@, defined at @SDL3\/SDL_haptic.h 1078:42@
sDL_OpenHapticFromMouse :: IO (BG.Ptr SDL_Haptic)
sDL_OpenHapticFromMouse = hs_bindgen_fdfe5c61a81c94fd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_IsJoystickHaptic@
foreign import ccall unsafe "hs_bindgen_136048137b058f4b"
  hs_bindgen_136048137b058f4b_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_IsJoystickHaptic@
hs_bindgen_136048137b058f4b
  :: BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick
  -> IO BG.CBool
hs_bindgen_136048137b058f4b =
  BG.fromFFIType hs_bindgen_136048137b058f4b_base

-- | Query if a joystick has haptic features.
--
--     [Returns]: true if the joystick is haptic or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenHapticFromJoystick'
--
--     [C declaration]: @SDL_IsJoystickHaptic@, defined at @SDL3\/SDL_haptic.h 1090:34@
sDL_IsJoystickHaptic
  :: BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the SDL_Joystick to test for haptic capabilities.
  -> IO BG.CBool
sDL_IsJoystickHaptic = hs_bindgen_136048137b058f4b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_OpenHapticFromJoystick@
foreign import ccall unsafe "hs_bindgen_1ee4f9bee2fcd4f3"
  hs_bindgen_1ee4f9bee2fcd4f3_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_OpenHapticFromJoystick@
hs_bindgen_1ee4f9bee2fcd4f3
  :: BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick
  -> IO (BG.Ptr SDL_Haptic)
hs_bindgen_1ee4f9bee2fcd4f3 =
  BG.fromFFIType hs_bindgen_1ee4f9bee2fcd4f3_base

-- | Open a haptic device for use from a joystick device.
--
--     You must still close the haptic device separately. It will not be closed with the joystick.
--
--     When opened from a joystick you should first close the haptic device before closing the joystick device. If not, on some implementations the haptic device will also get unallocated and you\'ll be unable to use force feedback on that device.
--
--     [Returns]: a valid haptic device identifier on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseHaptic', 'sDL_IsJoystickHaptic'
--
--     [C declaration]: @SDL_OpenHapticFromJoystick@, defined at @SDL3\/SDL_haptic.h 1112:42@
sDL_OpenHapticFromJoystick
  :: BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the SDL_Joystick to create a haptic device from.
  -> IO (BG.Ptr SDL_Haptic)
sDL_OpenHapticFromJoystick =
  hs_bindgen_1ee4f9bee2fcd4f3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_CloseHaptic@
foreign import ccall unsafe "hs_bindgen_5dc34bbc05254c40"
  hs_bindgen_5dc34bbc05254c40_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_CloseHaptic@
hs_bindgen_5dc34bbc05254c40
  :: BG.Ptr SDL_Haptic
  -> IO ()
hs_bindgen_5dc34bbc05254c40 =
  BG.fromFFIType hs_bindgen_5dc34bbc05254c40_base

-- | Close a haptic device previously opened with @SDL_OpenHaptic()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenHaptic'
--
--     [C declaration]: @SDL_CloseHaptic@, defined at @SDL3\/SDL_haptic.h 1123:34@
sDL_CloseHaptic
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to close.
  -> IO ()
sDL_CloseHaptic = hs_bindgen_5dc34bbc05254c40

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetMaxHapticEffects@
foreign import ccall unsafe "hs_bindgen_5cd0622005566196"
  hs_bindgen_5cd0622005566196_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetMaxHapticEffects@
hs_bindgen_5cd0622005566196
  :: BG.Ptr SDL_Haptic
  -> IO BG.CInt
hs_bindgen_5cd0622005566196 =
  BG.fromFFIType hs_bindgen_5cd0622005566196_base

-- | Get the number of effects a haptic device can store.
--
--     On some platforms this isn\'t fully supported, and therefore is an approximation. Always check to see if your created effect was actually created and do not rely solely on @SDL_GetMaxHapticEffects()@.
--
--     [Returns]: the number of effects the haptic device can store or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetMaxHapticEffectsPlaying', 'sDL_GetHapticFeatures'
--
--     [C declaration]: @SDL_GetMaxHapticEffects@, defined at @SDL3\/SDL_haptic.h 1141:33@
sDL_GetMaxHapticEffects
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> IO BG.CInt
sDL_GetMaxHapticEffects = hs_bindgen_5cd0622005566196

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetMaxHapticEffectsPlaying@
foreign import ccall unsafe "hs_bindgen_ed10e8124384dcc6"
  hs_bindgen_ed10e8124384dcc6_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetMaxHapticEffectsPlaying@
hs_bindgen_ed10e8124384dcc6
  :: BG.Ptr SDL_Haptic
  -> IO BG.CInt
hs_bindgen_ed10e8124384dcc6 =
  BG.fromFFIType hs_bindgen_ed10e8124384dcc6_base

-- | Get the number of effects a haptic device can play at the same time.
--
--     This is not supported on all platforms, but will always return a value.
--
--     [Returns]: the number of effects the haptic device can play at the same time or -1 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetMaxHapticEffects', 'sDL_GetHapticFeatures'
--
--     [C declaration]: @SDL_GetMaxHapticEffectsPlaying@, defined at @SDL3\/SDL_haptic.h 1157:33@
sDL_GetMaxHapticEffectsPlaying
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query maximum playing effects.
  -> IO BG.CInt
sDL_GetMaxHapticEffectsPlaying =
  hs_bindgen_ed10e8124384dcc6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHapticFeatures@
foreign import ccall unsafe "hs_bindgen_53effd9f65bf5118"
  hs_bindgen_53effd9f65bf5118_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHapticFeatures@
hs_bindgen_53effd9f65bf5118
  :: BG.Ptr SDL_Haptic
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_53effd9f65bf5118 =
  BG.fromFFIType hs_bindgen_53effd9f65bf5118_base

-- | Get the haptic device\'s supported features in bitwise manner.
--
--     [Returns]: a list of supported haptic features in bitwise manner (OR\'d), or 0 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HapticEffectSupported', 'sDL_GetMaxHapticEffects'
--
--     [C declaration]: @SDL_GetHapticFeatures@, defined at @SDL3\/SDL_haptic.h 1171:36@
sDL_GetHapticFeatures
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
sDL_GetHapticFeatures = hs_bindgen_53effd9f65bf5118

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetNumHapticAxes@
foreign import ccall unsafe "hs_bindgen_fc1fa543654842e5"
  hs_bindgen_fc1fa543654842e5_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetNumHapticAxes@
hs_bindgen_fc1fa543654842e5
  :: BG.Ptr SDL_Haptic
  -> IO BG.CInt
hs_bindgen_fc1fa543654842e5 =
  BG.fromFFIType hs_bindgen_fc1fa543654842e5_base

-- | Get the number of haptic axes the device has.
--
--     The number of haptic axes might be useful if working with the 'SDL_HapticDirection' effect.
--
--     [Returns]: the number of axes on success or -1 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetNumHapticAxes@, defined at @SDL3\/SDL_haptic.h 1185:33@
sDL_GetNumHapticAxes
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> IO BG.CInt
sDL_GetNumHapticAxes = hs_bindgen_fc1fa543654842e5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_HapticEffectSupported@
foreign import ccall unsafe "hs_bindgen_ddf7667b0951f535"
  hs_bindgen_ddf7667b0951f535_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_HapticEffectSupported@
hs_bindgen_ddf7667b0951f535
  :: BG.Ptr SDL_Haptic
  -> PtrConst.PtrConst SDL_HapticEffect
  -> IO BG.CBool
hs_bindgen_ddf7667b0951f535 =
  BG.fromFFIType hs_bindgen_ddf7667b0951f535_base

-- | Check to see if an effect is supported by a haptic device.
--
--     [Returns]: true if the effect is supported or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateHapticEffect', 'sDL_GetHapticFeatures'
--
--     [C declaration]: @SDL_HapticEffectSupported@, defined at @SDL3\/SDL_haptic.h 1199:34@
sDL_HapticEffectSupported
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query.
  -> PtrConst.PtrConst SDL_HapticEffect
  -- ^
  --
  --           [@effect@]: the desired effect to query.
  -> IO BG.CBool
sDL_HapticEffectSupported =
  hs_bindgen_ddf7667b0951f535

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_CreateHapticEffect@
foreign import ccall unsafe "hs_bindgen_8b8594cfaa325bcf"
  hs_bindgen_8b8594cfaa325bcf_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_CreateHapticEffect@
hs_bindgen_8b8594cfaa325bcf
  :: BG.Ptr SDL_Haptic
  -> PtrConst.PtrConst SDL_HapticEffect
  -> IO SDL_HapticEffectID
hs_bindgen_8b8594cfaa325bcf =
  BG.fromFFIType hs_bindgen_8b8594cfaa325bcf_base

-- | Create a new haptic effect on a specified device.
--
--     [Returns]: the ID of the effect on success or -1 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroyHapticEffect', 'sDL_RunHapticEffect', 'sDL_UpdateHapticEffect'
--
--     [C declaration]: @SDL_CreateHapticEffect@, defined at @SDL3\/SDL_haptic.h 1216:48@
sDL_CreateHapticEffect
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: an 'SDL_Haptic' device to create the effect on.
  -> PtrConst.PtrConst SDL_HapticEffect
  -- ^
  --
  --           [@effect@]: an 'SDL_HapticEffect' structure containing the properties of the effect to create.
  -> IO SDL_HapticEffectID
sDL_CreateHapticEffect = hs_bindgen_8b8594cfaa325bcf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_UpdateHapticEffect@
foreign import ccall unsafe "hs_bindgen_9a5d65efc573a34d"
  hs_bindgen_9a5d65efc573a34d_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_UpdateHapticEffect@
hs_bindgen_9a5d65efc573a34d
  :: BG.Ptr SDL_Haptic
  -> SDL_HapticEffectID
  -> PtrConst.PtrConst SDL_HapticEffect
  -> IO BG.CBool
hs_bindgen_9a5d65efc573a34d =
  BG.fromFFIType hs_bindgen_9a5d65efc573a34d_base

-- | Update the properties of an effect.
--
--     Can be used dynamically, although behavior when dynamically changing direction may be strange. Specifically the effect may re-upload itself and start playing from the start. You also cannot change the type either when running @SDL_UpdateHapticEffect()@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateHapticEffect', 'sDL_RunHapticEffect'
--
--     [C declaration]: @SDL_UpdateHapticEffect@, defined at @SDL3\/SDL_haptic.h 1238:34@
sDL_UpdateHapticEffect
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
  -> IO BG.CBool
sDL_UpdateHapticEffect = hs_bindgen_9a5d65efc573a34d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_RunHapticEffect@
foreign import ccall unsafe "hs_bindgen_a491b2976f3c0e2a"
  hs_bindgen_a491b2976f3c0e2a_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_RunHapticEffect@
hs_bindgen_a491b2976f3c0e2a
  :: BG.Ptr SDL_Haptic
  -> SDL_HapticEffectID
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_a491b2976f3c0e2a =
  BG.fromFFIType hs_bindgen_a491b2976f3c0e2a_base

-- | Run the haptic effect on its associated haptic device.
--
--     To repeat the effect over and over indefinitely, set @iterations@ to @'sDL_HAPTIC_INFINITY'@. (Repeats the envelope - attack and fade.) To make one instance of the effect last indefinitely (so the effect does not fade), set the effect\'s @length@ in its structure\/union to @'sDL_HAPTIC_INFINITY'@ instead.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticEffectStatus', 'sDL_StopHapticEffect', 'sDL_StopHapticEffects'
--
--     [C declaration]: @SDL_RunHapticEffect@, defined at @SDL3\/SDL_haptic.h 1262:34@
sDL_RunHapticEffect
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to run the effect on.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the ID of the haptic effect to run.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@iterations@]: the number of iterations to run the effect; use @'sDL_HAPTIC_INFINITY'@ to repeat forever.
  -> IO BG.CBool
sDL_RunHapticEffect = hs_bindgen_a491b2976f3c0e2a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_StopHapticEffect@
foreign import ccall unsafe "hs_bindgen_a1ba32f8ccf55d38"
  hs_bindgen_a1ba32f8ccf55d38_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_StopHapticEffect@
hs_bindgen_a1ba32f8ccf55d38
  :: BG.Ptr SDL_Haptic
  -> SDL_HapticEffectID
  -> IO BG.CBool
hs_bindgen_a1ba32f8ccf55d38 =
  BG.fromFFIType hs_bindgen_a1ba32f8ccf55d38_base

-- | Stop the haptic effect on its associated haptic device.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RunHapticEffect', 'sDL_StopHapticEffects'
--
--     [C declaration]: @SDL_StopHapticEffect@, defined at @SDL3\/SDL_haptic.h 1277:34@
sDL_StopHapticEffect
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to stop the effect on.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the ID of the haptic effect to stop.
  -> IO BG.CBool
sDL_StopHapticEffect = hs_bindgen_a1ba32f8ccf55d38

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_DestroyHapticEffect@
foreign import ccall unsafe "hs_bindgen_2cf548acecd92e79"
  hs_bindgen_2cf548acecd92e79_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_DestroyHapticEffect@
hs_bindgen_2cf548acecd92e79
  :: BG.Ptr SDL_Haptic
  -> SDL_HapticEffectID
  -> IO ()
hs_bindgen_2cf548acecd92e79 =
  BG.fromFFIType hs_bindgen_2cf548acecd92e79_base

-- | Destroy a haptic effect on the device.
--
--     This will stop the effect if it\'s running. Effects are automatically destroyed when the device is closed.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateHapticEffect'
--
--     [C declaration]: @SDL_DestroyHapticEffect@, defined at @SDL3\/SDL_haptic.h 1292:34@
sDL_DestroyHapticEffect
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to destroy the effect on.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the ID of the haptic effect to destroy.
  -> IO ()
sDL_DestroyHapticEffect = hs_bindgen_2cf548acecd92e79

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHapticEffectStatus@
foreign import ccall unsafe "hs_bindgen_a77bda94890e1c73"
  hs_bindgen_a77bda94890e1c73_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_GetHapticEffectStatus@
hs_bindgen_a77bda94890e1c73
  :: BG.Ptr SDL_Haptic
  -> SDL_HapticEffectID
  -> IO BG.CBool
hs_bindgen_a77bda94890e1c73 =
  BG.fromFFIType hs_bindgen_a77bda94890e1c73_base

-- | Get the status of the current effect on the specified haptic device.
--
--     Device must support the SDL_HAPTIC_STATUS feature.
--
--     [Returns]: true if it is playing, false if it isn\'t playing or haptic status isn\'t supported.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticFeatures'
--
--     [C declaration]: @SDL_GetHapticEffectStatus@, defined at @SDL3\/SDL_haptic.h 1308:34@
sDL_GetHapticEffectStatus
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to query for the effect status on.
  -> SDL_HapticEffectID
  -- ^
  --
  --           [@effect@]: the ID of the haptic effect to query its status.
  -> IO BG.CBool
sDL_GetHapticEffectStatus =
  hs_bindgen_a77bda94890e1c73

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_SetHapticGain@
foreign import ccall unsafe "hs_bindgen_206db73edc8fadd4"
  hs_bindgen_206db73edc8fadd4_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_SetHapticGain@
hs_bindgen_206db73edc8fadd4
  :: BG.Ptr SDL_Haptic
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_206db73edc8fadd4 =
  BG.fromFFIType hs_bindgen_206db73edc8fadd4_base

-- | Set the global gain of the specified haptic device.
--
--     Device must support the SDL_HAPTIC_GAIN feature.
--
--     The user may specify the maximum gain by setting the environment variable @SDL_HAPTIC_GAIN_MAX@ which should be between 0 and 100. All calls to @SDL_SetHapticGain()@ will scale linearly using @SDL_HAPTIC_GAIN_MAX@ as the maximum.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticFeatures'
--
--     [C declaration]: @SDL_SetHapticGain@, defined at @SDL3\/SDL_haptic.h 1330:34@
sDL_SetHapticGain
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to set the gain on.
  -> BG.CInt
  -- ^
  --
  --           [@gain@]: value to set the gain to, should be between 0 and 100 (0 - 100).
  -> IO BG.CBool
sDL_SetHapticGain = hs_bindgen_206db73edc8fadd4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_SetHapticAutocenter@
foreign import ccall unsafe "hs_bindgen_f0b69ddce282f135"
  hs_bindgen_f0b69ddce282f135_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_SetHapticAutocenter@
hs_bindgen_f0b69ddce282f135
  :: BG.Ptr SDL_Haptic
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_f0b69ddce282f135 =
  BG.fromFFIType hs_bindgen_f0b69ddce282f135_base

-- | Set the global autocenter of the device.
--
--     Autocenter should be between 0 and 100. Setting it to 0 will disable autocentering.
--
--     Device must support the SDL_HAPTIC_AUTOCENTER feature.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticFeatures'
--
--     [C declaration]: @SDL_SetHapticAutocenter@, defined at @SDL3\/SDL_haptic.h 1349:34@
sDL_SetHapticAutocenter
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to set autocentering on.
  -> BG.CInt
  -- ^
  --
  --           [@autocenter@]: value to set autocenter to (0-100).
  -> IO BG.CBool
sDL_SetHapticAutocenter = hs_bindgen_f0b69ddce282f135

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_PauseHaptic@
foreign import ccall unsafe "hs_bindgen_98b65e257f12670a"
  hs_bindgen_98b65e257f12670a_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_PauseHaptic@
hs_bindgen_98b65e257f12670a
  :: BG.Ptr SDL_Haptic
  -> IO BG.CBool
hs_bindgen_98b65e257f12670a =
  BG.fromFFIType hs_bindgen_98b65e257f12670a_base

-- | Pause a haptic device.
--
--     Device must support the @'sDL_HAPTIC_PAUSE'@ feature. Call @SDL_ResumeHaptic()@ to resume playback.
--
--     Do not modify the effects nor add new ones while the device is paused. That can cause all sorts of weird errors.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ResumeHaptic'
--
--     [C declaration]: @SDL_PauseHaptic@, defined at @SDL3\/SDL_haptic.h 1368:34@
sDL_PauseHaptic
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to pause.
  -> IO BG.CBool
sDL_PauseHaptic = hs_bindgen_98b65e257f12670a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_ResumeHaptic@
foreign import ccall unsafe "hs_bindgen_d54e536e172fdf2a"
  hs_bindgen_d54e536e172fdf2a_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_ResumeHaptic@
hs_bindgen_d54e536e172fdf2a
  :: BG.Ptr SDL_Haptic
  -> IO BG.CBool
hs_bindgen_d54e536e172fdf2a =
  BG.fromFFIType hs_bindgen_d54e536e172fdf2a_base

-- | Resume a haptic device.
--
--     Call to unpause after @SDL_PauseHaptic()@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PauseHaptic'
--
--     [C declaration]: @SDL_ResumeHaptic@, defined at @SDL3\/SDL_haptic.h 1383:34@
sDL_ResumeHaptic
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to unpause.
  -> IO BG.CBool
sDL_ResumeHaptic = hs_bindgen_d54e536e172fdf2a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_StopHapticEffects@
foreign import ccall unsafe "hs_bindgen_10f2c8457cada0f1"
  hs_bindgen_10f2c8457cada0f1_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_StopHapticEffects@
hs_bindgen_10f2c8457cada0f1
  :: BG.Ptr SDL_Haptic
  -> IO BG.CBool
hs_bindgen_10f2c8457cada0f1 =
  BG.fromFFIType hs_bindgen_10f2c8457cada0f1_base

-- | Stop all the currently playing effects on a haptic device.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RunHapticEffect', 'sDL_StopHapticEffects'
--
--     [C declaration]: @SDL_StopHapticEffects@, defined at @SDL3\/SDL_haptic.h 1397:34@
sDL_StopHapticEffects
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the 'SDL_Haptic' device to stop.
  -> IO BG.CBool
sDL_StopHapticEffects = hs_bindgen_10f2c8457cada0f1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_HapticRumbleSupported@
foreign import ccall unsafe "hs_bindgen_0b0f01d261871ca4"
  hs_bindgen_0b0f01d261871ca4_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_HapticRumbleSupported@
hs_bindgen_0b0f01d261871ca4
  :: BG.Ptr SDL_Haptic
  -> IO BG.CBool
hs_bindgen_0b0f01d261871ca4 =
  BG.fromFFIType hs_bindgen_0b0f01d261871ca4_base

-- | Check whether rumble is supported on a haptic device.
--
--     [Returns]: true if the effect is supported or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_InitHapticRumble'
--
--     [C declaration]: @SDL_HapticRumbleSupported@, defined at @SDL3\/SDL_haptic.h 1409:34@
sDL_HapticRumbleSupported
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: haptic device to check for rumble support.
  -> IO BG.CBool
sDL_HapticRumbleSupported =
  hs_bindgen_0b0f01d261871ca4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_InitHapticRumble@
foreign import ccall unsafe "hs_bindgen_1d3609585fc8a6db"
  hs_bindgen_1d3609585fc8a6db_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_InitHapticRumble@
hs_bindgen_1d3609585fc8a6db
  :: BG.Ptr SDL_Haptic
  -> IO BG.CBool
hs_bindgen_1d3609585fc8a6db =
  BG.fromFFIType hs_bindgen_1d3609585fc8a6db_base

-- | Initialize a haptic device for simple rumble playback.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PlayHapticRumble', 'sDL_StopHapticRumble', 'sDL_HapticRumbleSupported'
--
--     [C declaration]: @SDL_InitHapticRumble@, defined at @SDL3\/SDL_haptic.h 1424:34@
sDL_InitHapticRumble
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the haptic device to initialize for simple rumble playback.
  -> IO BG.CBool
sDL_InitHapticRumble = hs_bindgen_1d3609585fc8a6db

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_PlayHapticRumble@
foreign import ccall unsafe "hs_bindgen_9a900e80b5933810"
  hs_bindgen_9a900e80b5933810_base
    :: BG.Ptr BG.Void
    -> Float
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_PlayHapticRumble@
hs_bindgen_9a900e80b5933810
  :: BG.Ptr SDL_Haptic
  -> BG.CFloat
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_9a900e80b5933810 =
  BG.fromFFIType hs_bindgen_9a900e80b5933810_base

-- | Run a simple rumble effect on a haptic device.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_InitHapticRumble', 'sDL_StopHapticRumble'
--
--     [C declaration]: @SDL_PlayHapticRumble@, defined at @SDL3\/SDL_haptic.h 1440:34@
sDL_PlayHapticRumble
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the haptic device to play the rumble effect on.
  -> BG.CFloat
  -- ^
  --
  --           [@strength@]: strength of the rumble to play as a 0-1 float value.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@length@]: length of the rumble to play in milliseconds.
  -> IO BG.CBool
sDL_PlayHapticRumble = hs_bindgen_9a900e80b5933810

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_StopHapticRumble@
foreign import ccall unsafe "hs_bindgen_8eb60197e5125e42"
  hs_bindgen_8eb60197e5125e42_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_Unsafe_SDL_StopHapticRumble@
hs_bindgen_8eb60197e5125e42
  :: BG.Ptr SDL_Haptic
  -> IO BG.CBool
hs_bindgen_8eb60197e5125e42 =
  BG.fromFFIType hs_bindgen_8eb60197e5125e42_base

-- | Stop the simple rumble on a haptic device.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PlayHapticRumble'
--
--     [C declaration]: @SDL_StopHapticRumble@, defined at @SDL3\/SDL_haptic.h 1453:34@
sDL_StopHapticRumble
  :: BG.Ptr SDL_Haptic
  -- ^
  --
  --           [@haptic@]: the haptic device to stop the rumble effect on.
  -> IO BG.CBool
sDL_StopHapticRumble = hs_bindgen_8eb60197e5125e42

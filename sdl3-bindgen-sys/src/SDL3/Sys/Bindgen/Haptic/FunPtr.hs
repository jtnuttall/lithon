{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Haptic.FunPtr (
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_GetHaptics,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_GetHapticNameForID,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_OpenHaptic,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_GetHapticFromID,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_GetHapticID,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_GetHapticName,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_IsMouseHaptic,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_OpenHapticFromMouse,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_IsJoystickHaptic,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_OpenHapticFromJoystick,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_CloseHaptic,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_GetMaxHapticEffects,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_GetMaxHapticEffectsPlaying,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_GetHapticFeatures,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_GetNumHapticAxes,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_HapticEffectSupported,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_CreateHapticEffect,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_UpdateHapticEffect,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_RunHapticEffect,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_StopHapticEffect,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_DestroyHapticEffect,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_GetHapticEffectStatus,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_SetHapticGain,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_SetHapticAutocenter,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_PauseHaptic,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_ResumeHaptic,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_StopHapticEffects,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_HapticRumbleSupported,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_InitHapticRumble,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_PlayHapticRumble,
  SDL3.Sys.Bindgen.Haptic.FunPtr.sDL_StopHapticRumble,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHaptics */"
         , "__attribute__ ((const))"
         , "SDL_HapticID *(*hs_bindgen_d1b059ba233bbd57 (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetHaptics;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticNameForID */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_001c4531a8b9b26b (void)) ("
         , "  SDL_HapticID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetHapticNameForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_OpenHaptic */"
         , "__attribute__ ((const))"
         , "SDL_Haptic *(*hs_bindgen_90101d520a764d47 (void)) ("
         , "  SDL_HapticID arg1"
         , ")"
         , "{"
         , "  return &SDL_OpenHaptic;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticFromID */"
         , "__attribute__ ((const))"
         , "SDL_Haptic *(*hs_bindgen_3a7e21ae2b159d8e (void)) ("
         , "  SDL_HapticID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetHapticFromID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticID */"
         , "__attribute__ ((const))"
         , "SDL_HapticID (*hs_bindgen_13f07892e26e3cf7 (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetHapticID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_85514e3e9f32e1c1 (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetHapticName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_IsMouseHaptic */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_65b6f3b19cf6ac88 (void)) (void)"
         , "{"
         , "  return &SDL_IsMouseHaptic;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_OpenHapticFromMouse */"
         , "__attribute__ ((const))"
         , "SDL_Haptic *(*hs_bindgen_b758521fa797c2c0 (void)) (void)"
         , "{"
         , "  return &SDL_OpenHapticFromMouse;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_IsJoystickHaptic */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_67654cd95ff86143 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_IsJoystickHaptic;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_OpenHapticFromJoystick */"
         , "__attribute__ ((const))"
         , "SDL_Haptic *(*hs_bindgen_fc6652b37d40c658 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_OpenHapticFromJoystick;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_CloseHaptic */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_6b737e2ed08a147c (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_CloseHaptic;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetMaxHapticEffects */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_31a97143613121ea (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetMaxHapticEffects;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetMaxHapticEffectsPlaying */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_f659a245012233bf (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetMaxHapticEffectsPlaying;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticFeatures */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_dbbb380d4518b29f (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetHapticFeatures;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetNumHapticAxes */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_da903e5d3b66ca38 (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetNumHapticAxes;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_HapticEffectSupported */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e66937f5ebbed3b2 (void)) ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_HapticEffectSupported;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_HapticEffectID;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_CreateHapticEffect */"
         , "__attribute__ ((const))"
         , "SDL_HapticEffectID (*hs_bindgen_4f599110559e7af3 (void)) ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateHapticEffect;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_HapticEffectID;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_UpdateHapticEffect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6d9817b120393c0f (void)) ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffectID arg2,"
         , "  SDL_HapticEffect const *arg3"
         , ")"
         , "{"
         , "  return &SDL_UpdateHapticEffect;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_HapticEffectID;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_RunHapticEffect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a02a57984673b21e (void)) ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffectID arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return &SDL_RunHapticEffect;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_HapticEffectID;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_StopHapticEffect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_30eca5319f79857b (void)) ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffectID arg2"
         , ")"
         , "{"
         , "  return &SDL_StopHapticEffect;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_HapticEffectID;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_DestroyHapticEffect */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_ac32175b5d132b5c (void)) ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffectID arg2"
         , ")"
         , "{"
         , "  return &SDL_DestroyHapticEffect;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_HapticEffectID;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticEffectStatus */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c5abea2492dab75a (void)) ("
         , "  SDL_Haptic *arg1,"
         , "  SDL_HapticEffectID arg2"
         , ")"
         , "{"
         , "  return &SDL_GetHapticEffectStatus;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_SetHapticGain */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2c6528b48cffc964 (void)) ("
         , "  SDL_Haptic *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_SetHapticGain;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_SetHapticAutocenter */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_568d338611d0f80d (void)) ("
         , "  SDL_Haptic *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_SetHapticAutocenter;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_PauseHaptic */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2300eaaf5179d227 (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_PauseHaptic;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_ResumeHaptic */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d1b63d6dd09df218 (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_ResumeHaptic;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_StopHapticEffects */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_5cc314419a9f2703 (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_StopHapticEffects;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_HapticRumbleSupported */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_62fc953aa6c9d61a (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_HapticRumbleSupported;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_InitHapticRumble */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7d0705a7e6ebb724 (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_InitHapticRumble;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_PlayHapticRumble */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_41c52ad08dc2e874 (void)) ("
         , "  SDL_Haptic *arg1,"
         , "  float arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return &SDL_PlayHapticRumble;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_StopHapticRumble */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e3ee0b83eaad3e1f (void)) ("
         , "  SDL_Haptic *arg1"
         , ")"
         , "{"
         , "  return &SDL_StopHapticRumble;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHaptics@
foreign import ccall unsafe "hs_bindgen_d1b059ba233bbd57"
  hs_bindgen_d1b059ba233bbd57_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHaptics@
hs_bindgen_d1b059ba233bbd57 :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_HapticID)))
hs_bindgen_d1b059ba233bbd57 =
  BG.fromFFIType hs_bindgen_d1b059ba233bbd57_base

{-# NOINLINE sDL_GetHaptics #-}

-- | Get a list of currently connected haptic devices.
--
--     [@count@]: a pointer filled in with the number of haptic devices returned, may be NULL.
--
--     [Returns]: a 0 terminated array of haptic device instance IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenHaptic'
--
--     [C declaration]: @SDL_GetHaptics@, defined at @SDL3\/SDL_haptic.h 975:44@
sDL_GetHaptics :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_HapticID))
sDL_GetHaptics =
  BG.unsafePerformIO hs_bindgen_d1b059ba233bbd57

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticNameForID@
foreign import ccall unsafe "hs_bindgen_001c4531a8b9b26b"
  hs_bindgen_001c4531a8b9b26b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticNameForID@
hs_bindgen_001c4531a8b9b26b :: IO (BG.FunPtr (SDL_HapticID -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_001c4531a8b9b26b =
  BG.fromFFIType hs_bindgen_001c4531a8b9b26b_base

{-# NOINLINE sDL_GetHapticNameForID #-}

-- | Get the implementation dependent name of a haptic device.
--
--     This can be called before any haptic devices are opened.
--
--     [@instance_id@]: the haptic device instance ID.
--
--     [Returns]: the name of the selected haptic device. If no name can be found, this function returns NULL; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticName', 'sDL_OpenHaptic'
--
--     [C declaration]: @SDL_GetHapticNameForID@, defined at @SDL3\/SDL_haptic.h 992:42@
sDL_GetHapticNameForID :: BG.FunPtr (SDL_HapticID -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetHapticNameForID =
  BG.unsafePerformIO hs_bindgen_001c4531a8b9b26b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_OpenHaptic@
foreign import ccall unsafe "hs_bindgen_90101d520a764d47"
  hs_bindgen_90101d520a764d47_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_OpenHaptic@
hs_bindgen_90101d520a764d47 :: IO (BG.FunPtr (SDL_HapticID -> IO (BG.Ptr SDL_Haptic)))
hs_bindgen_90101d520a764d47 =
  BG.fromFFIType hs_bindgen_90101d520a764d47_base

{-# NOINLINE sDL_OpenHaptic #-}

-- | Open a haptic device for use.
--
--     The index passed as an argument refers to the N\'th haptic device on this system.
--
--     When opening a haptic device, its gain will be set to maximum and autocenter will be disabled. To modify these values use @SDL_SetHapticGain()@ and @SDL_SetHapticAutocenter()@.
--
--     [@instance_id@]: the haptic device instance ID.
--
--     [Returns]: the device identifier or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseHaptic', 'sDL_GetHaptics', 'sDL_OpenHapticFromJoystick', 'sDL_OpenHapticFromMouse', 'sDL_SetHapticAutocenter', 'sDL_SetHapticGain'
--
--     [C declaration]: @SDL_OpenHaptic@, defined at @SDL3\/SDL_haptic.h 1017:42@
sDL_OpenHaptic :: BG.FunPtr (SDL_HapticID -> IO (BG.Ptr SDL_Haptic))
sDL_OpenHaptic =
  BG.unsafePerformIO hs_bindgen_90101d520a764d47

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticFromID@
foreign import ccall unsafe "hs_bindgen_3a7e21ae2b159d8e"
  hs_bindgen_3a7e21ae2b159d8e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticFromID@
hs_bindgen_3a7e21ae2b159d8e :: IO (BG.FunPtr (SDL_HapticID -> IO (BG.Ptr SDL_Haptic)))
hs_bindgen_3a7e21ae2b159d8e =
  BG.fromFFIType hs_bindgen_3a7e21ae2b159d8e_base

{-# NOINLINE sDL_GetHapticFromID #-}

-- | Get the 'SDL_Haptic' associated with an instance ID, if it has been opened.
--
--     [@instance_id@]: the instance ID to get the 'SDL_Haptic' for.
--
--     [Returns]: an 'SDL_Haptic' on success or NULL on failure or if it hasn\'t been opened yet; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetHapticFromID@, defined at @SDL3\/SDL_haptic.h 1029:42@
sDL_GetHapticFromID :: BG.FunPtr (SDL_HapticID -> IO (BG.Ptr SDL_Haptic))
sDL_GetHapticFromID =
  BG.unsafePerformIO hs_bindgen_3a7e21ae2b159d8e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticID@
foreign import ccall unsafe "hs_bindgen_13f07892e26e3cf7"
  hs_bindgen_13f07892e26e3cf7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticID@
hs_bindgen_13f07892e26e3cf7 :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO SDL_HapticID))
hs_bindgen_13f07892e26e3cf7 =
  BG.fromFFIType hs_bindgen_13f07892e26e3cf7_base

{-# NOINLINE sDL_GetHapticID #-}

-- | Get the instance ID of an opened haptic device.
--
--     [@haptic@]: the 'SDL_Haptic' device to query.
--
--     [Returns]: the instance ID of the specified haptic device on success or 0 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetHapticID@, defined at @SDL3\/SDL_haptic.h 1040:42@
sDL_GetHapticID :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO SDL_HapticID)
sDL_GetHapticID =
  BG.unsafePerformIO hs_bindgen_13f07892e26e3cf7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticName@
foreign import ccall unsafe "hs_bindgen_85514e3e9f32e1c1"
  hs_bindgen_85514e3e9f32e1c1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticName@
hs_bindgen_85514e3e9f32e1c1 :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_85514e3e9f32e1c1 =
  BG.fromFFIType hs_bindgen_85514e3e9f32e1c1_base

{-# NOINLINE sDL_GetHapticName #-}

-- | Get the implementation dependent name of a haptic device.
--
--     [@haptic@]: the 'SDL_Haptic' obtained from SDL_OpenJoystick().
--
--     [Returns]: the name of the selected haptic device. If no name can be found, this function returns NULL; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticNameForID'
--
--     [C declaration]: @SDL_GetHapticName@, defined at @SDL3\/SDL_haptic.h 1054:42@
sDL_GetHapticName :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetHapticName =
  BG.unsafePerformIO hs_bindgen_85514e3e9f32e1c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_IsMouseHaptic@
foreign import ccall unsafe "hs_bindgen_65b6f3b19cf6ac88"
  hs_bindgen_65b6f3b19cf6ac88_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_IsMouseHaptic@
hs_bindgen_65b6f3b19cf6ac88 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_65b6f3b19cf6ac88 =
  BG.fromFFIType hs_bindgen_65b6f3b19cf6ac88_base

{-# NOINLINE sDL_IsMouseHaptic #-}

-- | Query whether or not the current mouse has haptic capabilities.
--
--     [Returns]: true if the mouse is haptic or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenHapticFromMouse'
--
--     [C declaration]: @SDL_IsMouseHaptic@, defined at @SDL3\/SDL_haptic.h 1065:34@
sDL_IsMouseHaptic :: BG.FunPtr (IO BG.CBool)
sDL_IsMouseHaptic =
  BG.unsafePerformIO hs_bindgen_65b6f3b19cf6ac88

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_OpenHapticFromMouse@
foreign import ccall unsafe "hs_bindgen_b758521fa797c2c0"
  hs_bindgen_b758521fa797c2c0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_OpenHapticFromMouse@
hs_bindgen_b758521fa797c2c0 :: IO (BG.FunPtr (IO (BG.Ptr SDL_Haptic)))
hs_bindgen_b758521fa797c2c0 =
  BG.fromFFIType hs_bindgen_b758521fa797c2c0_base

{-# NOINLINE sDL_OpenHapticFromMouse #-}

-- | Try to open a haptic device from the current mouse.
--
--     [Returns]: the haptic device identifier or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseHaptic', 'sDL_IsMouseHaptic'
--
--     [C declaration]: @SDL_OpenHapticFromMouse@, defined at @SDL3\/SDL_haptic.h 1078:42@
sDL_OpenHapticFromMouse :: BG.FunPtr (IO (BG.Ptr SDL_Haptic))
sDL_OpenHapticFromMouse =
  BG.unsafePerformIO hs_bindgen_b758521fa797c2c0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_IsJoystickHaptic@
foreign import ccall unsafe "hs_bindgen_67654cd95ff86143"
  hs_bindgen_67654cd95ff86143_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_IsJoystickHaptic@
hs_bindgen_67654cd95ff86143
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick -> IO BG.CBool))
hs_bindgen_67654cd95ff86143 =
  BG.fromFFIType hs_bindgen_67654cd95ff86143_base

{-# NOINLINE sDL_IsJoystickHaptic #-}

-- | Query if a joystick has haptic features.
--
--     [@joystick@]: the SDL_Joystick to test for haptic capabilities.
--
--     [Returns]: true if the joystick is haptic or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenHapticFromJoystick'
--
--     [C declaration]: @SDL_IsJoystickHaptic@, defined at @SDL3\/SDL_haptic.h 1090:34@
sDL_IsJoystickHaptic :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick -> IO BG.CBool)
sDL_IsJoystickHaptic =
  BG.unsafePerformIO hs_bindgen_67654cd95ff86143

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_OpenHapticFromJoystick@
foreign import ccall unsafe "hs_bindgen_fc6652b37d40c658"
  hs_bindgen_fc6652b37d40c658_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_OpenHapticFromJoystick@
hs_bindgen_fc6652b37d40c658
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick -> IO (BG.Ptr SDL_Haptic)))
hs_bindgen_fc6652b37d40c658 =
  BG.fromFFIType hs_bindgen_fc6652b37d40c658_base

{-# NOINLINE sDL_OpenHapticFromJoystick #-}

-- | Open a haptic device for use from a joystick device.
--
--     You must still close the haptic device separately. It will not be closed with the joystick.
--
--     When opened from a joystick you should first close the haptic device before closing the joystick device. If not, on some implementations the haptic device will also get unallocated and you\'ll be unable to use force feedback on that device.
--
--     [@joystick@]: the SDL_Joystick to create a haptic device from.
--
--     [Returns]: a valid haptic device identifier on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseHaptic', 'sDL_IsJoystickHaptic'
--
--     [C declaration]: @SDL_OpenHapticFromJoystick@, defined at @SDL3\/SDL_haptic.h 1112:42@
sDL_OpenHapticFromJoystick
  :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick -> IO (BG.Ptr SDL_Haptic))
sDL_OpenHapticFromJoystick =
  BG.unsafePerformIO hs_bindgen_fc6652b37d40c658

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_CloseHaptic@
foreign import ccall unsafe "hs_bindgen_6b737e2ed08a147c"
  hs_bindgen_6b737e2ed08a147c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_CloseHaptic@
hs_bindgen_6b737e2ed08a147c :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO ()))
hs_bindgen_6b737e2ed08a147c =
  BG.fromFFIType hs_bindgen_6b737e2ed08a147c_base

{-# NOINLINE sDL_CloseHaptic #-}

-- | Close a haptic device previously opened with @SDL_OpenHaptic()@.
--
--     [@haptic@]: the 'SDL_Haptic' device to close.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenHaptic'
--
--     [C declaration]: @SDL_CloseHaptic@, defined at @SDL3\/SDL_haptic.h 1123:34@
sDL_CloseHaptic :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO ())
sDL_CloseHaptic =
  BG.unsafePerformIO hs_bindgen_6b737e2ed08a147c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetMaxHapticEffects@
foreign import ccall unsafe "hs_bindgen_31a97143613121ea"
  hs_bindgen_31a97143613121ea_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetMaxHapticEffects@
hs_bindgen_31a97143613121ea :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CInt))
hs_bindgen_31a97143613121ea =
  BG.fromFFIType hs_bindgen_31a97143613121ea_base

{-# NOINLINE sDL_GetMaxHapticEffects #-}

-- | Get the number of effects a haptic device can store.
--
--     On some platforms this isn\'t fully supported, and therefore is an approximation. Always check to see if your created effect was actually created and do not rely solely on @SDL_GetMaxHapticEffects()@.
--
--     [@haptic@]: the 'SDL_Haptic' device to query.
--
--     [Returns]: the number of effects the haptic device can store or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetMaxHapticEffectsPlaying', 'sDL_GetHapticFeatures'
--
--     [C declaration]: @SDL_GetMaxHapticEffects@, defined at @SDL3\/SDL_haptic.h 1141:33@
sDL_GetMaxHapticEffects :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CInt)
sDL_GetMaxHapticEffects =
  BG.unsafePerformIO hs_bindgen_31a97143613121ea

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetMaxHapticEffectsPlaying@
foreign import ccall unsafe "hs_bindgen_f659a245012233bf"
  hs_bindgen_f659a245012233bf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetMaxHapticEffectsPlaying@
hs_bindgen_f659a245012233bf :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CInt))
hs_bindgen_f659a245012233bf =
  BG.fromFFIType hs_bindgen_f659a245012233bf_base

{-# NOINLINE sDL_GetMaxHapticEffectsPlaying #-}

-- | Get the number of effects a haptic device can play at the same time.
--
--     This is not supported on all platforms, but will always return a value.
--
--     [@haptic@]: the 'SDL_Haptic' device to query maximum playing effects.
--
--     [Returns]: the number of effects the haptic device can play at the same time or -1 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetMaxHapticEffects', 'sDL_GetHapticFeatures'
--
--     [C declaration]: @SDL_GetMaxHapticEffectsPlaying@, defined at @SDL3\/SDL_haptic.h 1157:33@
sDL_GetMaxHapticEffectsPlaying :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CInt)
sDL_GetMaxHapticEffectsPlaying =
  BG.unsafePerformIO hs_bindgen_f659a245012233bf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticFeatures@
foreign import ccall unsafe "hs_bindgen_dbbb380d4518b29f"
  hs_bindgen_dbbb380d4518b29f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticFeatures@
hs_bindgen_dbbb380d4518b29f
  :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO SDL3.Sys.Bindgen.Stdinc.Uint32))
hs_bindgen_dbbb380d4518b29f =
  BG.fromFFIType hs_bindgen_dbbb380d4518b29f_base

{-# NOINLINE sDL_GetHapticFeatures #-}

-- | Get the haptic device\'s supported features in bitwise manner.
--
--     [@haptic@]: the 'SDL_Haptic' device to query.
--
--     [Returns]: a list of supported haptic features in bitwise manner (OR\'d), or 0 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HapticEffectSupported', 'sDL_GetMaxHapticEffects'
--
--     [C declaration]: @SDL_GetHapticFeatures@, defined at @SDL3\/SDL_haptic.h 1171:36@
sDL_GetHapticFeatures :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
sDL_GetHapticFeatures =
  BG.unsafePerformIO hs_bindgen_dbbb380d4518b29f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetNumHapticAxes@
foreign import ccall unsafe "hs_bindgen_da903e5d3b66ca38"
  hs_bindgen_da903e5d3b66ca38_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetNumHapticAxes@
hs_bindgen_da903e5d3b66ca38 :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CInt))
hs_bindgen_da903e5d3b66ca38 =
  BG.fromFFIType hs_bindgen_da903e5d3b66ca38_base

{-# NOINLINE sDL_GetNumHapticAxes #-}

-- | Get the number of haptic axes the device has.
--
--     The number of haptic axes might be useful if working with the 'SDL_HapticDirection' effect.
--
--     [@haptic@]: the 'SDL_Haptic' device to query.
--
--     [Returns]: the number of axes on success or -1 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetNumHapticAxes@, defined at @SDL3\/SDL_haptic.h 1185:33@
sDL_GetNumHapticAxes :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CInt)
sDL_GetNumHapticAxes =
  BG.unsafePerformIO hs_bindgen_da903e5d3b66ca38

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_HapticEffectSupported@
foreign import ccall unsafe "hs_bindgen_e66937f5ebbed3b2"
  hs_bindgen_e66937f5ebbed3b2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_HapticEffectSupported@
hs_bindgen_e66937f5ebbed3b2
  :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> PtrConst.PtrConst SDL_HapticEffect -> IO BG.CBool))
hs_bindgen_e66937f5ebbed3b2 =
  BG.fromFFIType hs_bindgen_e66937f5ebbed3b2_base

{-# NOINLINE sDL_HapticEffectSupported #-}

-- | Check to see if an effect is supported by a haptic device.
--
--     [@haptic@]: the 'SDL_Haptic' device to query.
--
--     [@effect@]: the desired effect to query.
--
--     [Returns]: true if the effect is supported or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateHapticEffect', 'sDL_GetHapticFeatures'
--
--     [C declaration]: @SDL_HapticEffectSupported@, defined at @SDL3\/SDL_haptic.h 1199:34@
sDL_HapticEffectSupported
  :: BG.FunPtr (BG.Ptr SDL_Haptic -> PtrConst.PtrConst SDL_HapticEffect -> IO BG.CBool)
sDL_HapticEffectSupported =
  BG.unsafePerformIO hs_bindgen_e66937f5ebbed3b2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_CreateHapticEffect@
foreign import ccall unsafe "hs_bindgen_4f599110559e7af3"
  hs_bindgen_4f599110559e7af3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_CreateHapticEffect@
hs_bindgen_4f599110559e7af3
  :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> PtrConst.PtrConst SDL_HapticEffect -> IO SDL_HapticEffectID))
hs_bindgen_4f599110559e7af3 =
  BG.fromFFIType hs_bindgen_4f599110559e7af3_base

{-# NOINLINE sDL_CreateHapticEffect #-}

-- | Create a new haptic effect on a specified device.
--
--     [@haptic@]: an 'SDL_Haptic' device to create the effect on.
--
--     [@effect@]: an 'SDL_HapticEffect' structure containing the properties of the effect to create.
--
--     [Returns]: the ID of the effect on success or -1 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroyHapticEffect', 'sDL_RunHapticEffect', 'sDL_UpdateHapticEffect'
--
--     [C declaration]: @SDL_CreateHapticEffect@, defined at @SDL3\/SDL_haptic.h 1216:48@
sDL_CreateHapticEffect
  :: BG.FunPtr (BG.Ptr SDL_Haptic -> PtrConst.PtrConst SDL_HapticEffect -> IO SDL_HapticEffectID)
sDL_CreateHapticEffect =
  BG.unsafePerformIO hs_bindgen_4f599110559e7af3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_UpdateHapticEffect@
foreign import ccall unsafe "hs_bindgen_6d9817b120393c0f"
  hs_bindgen_6d9817b120393c0f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_UpdateHapticEffect@
hs_bindgen_6d9817b120393c0f
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Haptic -> SDL_HapticEffectID -> PtrConst.PtrConst SDL_HapticEffect -> IO BG.CBool)
       )
hs_bindgen_6d9817b120393c0f =
  BG.fromFFIType hs_bindgen_6d9817b120393c0f_base

{-# NOINLINE sDL_UpdateHapticEffect #-}

-- | Update the properties of an effect.
--
--     Can be used dynamically, although behavior when dynamically changing direction may be strange. Specifically the effect may re-upload itself and start playing from the start. You also cannot change the type either when running @SDL_UpdateHapticEffect()@.
--
--     [@haptic@]: the 'SDL_Haptic' device that has the effect.
--
--     [@effect@]: the identifier of the effect to update.
--
--     [@data@]: an 'SDL_HapticEffect' structure containing the new effect properties to use.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateHapticEffect', 'sDL_RunHapticEffect'
--
--     [C declaration]: @SDL_UpdateHapticEffect@, defined at @SDL3\/SDL_haptic.h 1238:34@
sDL_UpdateHapticEffect
  :: BG.FunPtr
       (BG.Ptr SDL_Haptic -> SDL_HapticEffectID -> PtrConst.PtrConst SDL_HapticEffect -> IO BG.CBool)
sDL_UpdateHapticEffect =
  BG.unsafePerformIO hs_bindgen_6d9817b120393c0f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_RunHapticEffect@
foreign import ccall unsafe "hs_bindgen_a02a57984673b21e"
  hs_bindgen_a02a57984673b21e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_RunHapticEffect@
hs_bindgen_a02a57984673b21e
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Haptic -> SDL_HapticEffectID -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_a02a57984673b21e =
  BG.fromFFIType hs_bindgen_a02a57984673b21e_base

{-# NOINLINE sDL_RunHapticEffect #-}

-- | Run the haptic effect on its associated haptic device.
--
--     To repeat the effect over and over indefinitely, set @iterations@ to @'sDL_HAPTIC_INFINITY'@. (Repeats the envelope - attack and fade.) To make one instance of the effect last indefinitely (so the effect does not fade), set the effect\'s @length@ in its structure\/union to @'sDL_HAPTIC_INFINITY'@ instead.
--
--     [@haptic@]: the 'SDL_Haptic' device to run the effect on.
--
--     [@effect@]: the ID of the haptic effect to run.
--
--     [@iterations@]: the number of iterations to run the effect; use @'sDL_HAPTIC_INFINITY'@ to repeat forever.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticEffectStatus', 'sDL_StopHapticEffect', 'sDL_StopHapticEffects'
--
--     [C declaration]: @SDL_RunHapticEffect@, defined at @SDL3\/SDL_haptic.h 1262:34@
sDL_RunHapticEffect
  :: BG.FunPtr (BG.Ptr SDL_Haptic -> SDL_HapticEffectID -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_RunHapticEffect =
  BG.unsafePerformIO hs_bindgen_a02a57984673b21e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_StopHapticEffect@
foreign import ccall unsafe "hs_bindgen_30eca5319f79857b"
  hs_bindgen_30eca5319f79857b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_StopHapticEffect@
hs_bindgen_30eca5319f79857b
  :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> SDL_HapticEffectID -> IO BG.CBool))
hs_bindgen_30eca5319f79857b =
  BG.fromFFIType hs_bindgen_30eca5319f79857b_base

{-# NOINLINE sDL_StopHapticEffect #-}

-- | Stop the haptic effect on its associated haptic device.
--
--     [@haptic@]: the 'SDL_Haptic' device to stop the effect on.
--
--     [@effect@]: the ID of the haptic effect to stop.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RunHapticEffect', 'sDL_StopHapticEffects'
--
--     [C declaration]: @SDL_StopHapticEffect@, defined at @SDL3\/SDL_haptic.h 1277:34@
sDL_StopHapticEffect :: BG.FunPtr (BG.Ptr SDL_Haptic -> SDL_HapticEffectID -> IO BG.CBool)
sDL_StopHapticEffect =
  BG.unsafePerformIO hs_bindgen_30eca5319f79857b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_DestroyHapticEffect@
foreign import ccall unsafe "hs_bindgen_ac32175b5d132b5c"
  hs_bindgen_ac32175b5d132b5c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_DestroyHapticEffect@
hs_bindgen_ac32175b5d132b5c :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> SDL_HapticEffectID -> IO ()))
hs_bindgen_ac32175b5d132b5c =
  BG.fromFFIType hs_bindgen_ac32175b5d132b5c_base

{-# NOINLINE sDL_DestroyHapticEffect #-}

-- | Destroy a haptic effect on the device.
--
--     This will stop the effect if it\'s running. Effects are automatically destroyed when the device is closed.
--
--     [@haptic@]: the 'SDL_Haptic' device to destroy the effect on.
--
--     [@effect@]: the ID of the haptic effect to destroy.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateHapticEffect'
--
--     [C declaration]: @SDL_DestroyHapticEffect@, defined at @SDL3\/SDL_haptic.h 1292:34@
sDL_DestroyHapticEffect :: BG.FunPtr (BG.Ptr SDL_Haptic -> SDL_HapticEffectID -> IO ())
sDL_DestroyHapticEffect =
  BG.unsafePerformIO hs_bindgen_ac32175b5d132b5c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticEffectStatus@
foreign import ccall unsafe "hs_bindgen_c5abea2492dab75a"
  hs_bindgen_c5abea2492dab75a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_GetHapticEffectStatus@
hs_bindgen_c5abea2492dab75a
  :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> SDL_HapticEffectID -> IO BG.CBool))
hs_bindgen_c5abea2492dab75a =
  BG.fromFFIType hs_bindgen_c5abea2492dab75a_base

{-# NOINLINE sDL_GetHapticEffectStatus #-}

-- | Get the status of the current effect on the specified haptic device.
--
--     Device must support the SDL_HAPTIC_STATUS feature.
--
--     [@haptic@]: the 'SDL_Haptic' device to query for the effect status on.
--
--     [@effect@]: the ID of the haptic effect to query its status.
--
--     [Returns]: true if it is playing, false if it isn\'t playing or haptic status isn\'t supported.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticFeatures'
--
--     [C declaration]: @SDL_GetHapticEffectStatus@, defined at @SDL3\/SDL_haptic.h 1308:34@
sDL_GetHapticEffectStatus :: BG.FunPtr (BG.Ptr SDL_Haptic -> SDL_HapticEffectID -> IO BG.CBool)
sDL_GetHapticEffectStatus =
  BG.unsafePerformIO hs_bindgen_c5abea2492dab75a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_SetHapticGain@
foreign import ccall unsafe "hs_bindgen_2c6528b48cffc964"
  hs_bindgen_2c6528b48cffc964_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_SetHapticGain@
hs_bindgen_2c6528b48cffc964 :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> BG.CInt -> IO BG.CBool))
hs_bindgen_2c6528b48cffc964 =
  BG.fromFFIType hs_bindgen_2c6528b48cffc964_base

{-# NOINLINE sDL_SetHapticGain #-}

-- | Set the global gain of the specified haptic device.
--
--     Device must support the SDL_HAPTIC_GAIN feature.
--
--     The user may specify the maximum gain by setting the environment variable @SDL_HAPTIC_GAIN_MAX@ which should be between 0 and 100. All calls to @SDL_SetHapticGain()@ will scale linearly using @SDL_HAPTIC_GAIN_MAX@ as the maximum.
--
--     [@haptic@]: the 'SDL_Haptic' device to set the gain on.
--
--     [@gain@]: value to set the gain to, should be between 0 and 100 (0 - 100).
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticFeatures'
--
--     [C declaration]: @SDL_SetHapticGain@, defined at @SDL3\/SDL_haptic.h 1330:34@
sDL_SetHapticGain :: BG.FunPtr (BG.Ptr SDL_Haptic -> BG.CInt -> IO BG.CBool)
sDL_SetHapticGain =
  BG.unsafePerformIO hs_bindgen_2c6528b48cffc964

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_SetHapticAutocenter@
foreign import ccall unsafe "hs_bindgen_568d338611d0f80d"
  hs_bindgen_568d338611d0f80d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_SetHapticAutocenter@
hs_bindgen_568d338611d0f80d :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> BG.CInt -> IO BG.CBool))
hs_bindgen_568d338611d0f80d =
  BG.fromFFIType hs_bindgen_568d338611d0f80d_base

{-# NOINLINE sDL_SetHapticAutocenter #-}

-- | Set the global autocenter of the device.
--
--     Autocenter should be between 0 and 100. Setting it to 0 will disable autocentering.
--
--     Device must support the SDL_HAPTIC_AUTOCENTER feature.
--
--     [@haptic@]: the 'SDL_Haptic' device to set autocentering on.
--
--     [@autocenter@]: value to set autocenter to (0-100).
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticFeatures'
--
--     [C declaration]: @SDL_SetHapticAutocenter@, defined at @SDL3\/SDL_haptic.h 1349:34@
sDL_SetHapticAutocenter :: BG.FunPtr (BG.Ptr SDL_Haptic -> BG.CInt -> IO BG.CBool)
sDL_SetHapticAutocenter =
  BG.unsafePerformIO hs_bindgen_568d338611d0f80d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_PauseHaptic@
foreign import ccall unsafe "hs_bindgen_2300eaaf5179d227"
  hs_bindgen_2300eaaf5179d227_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_PauseHaptic@
hs_bindgen_2300eaaf5179d227 :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CBool))
hs_bindgen_2300eaaf5179d227 =
  BG.fromFFIType hs_bindgen_2300eaaf5179d227_base

{-# NOINLINE sDL_PauseHaptic #-}

-- | Pause a haptic device.
--
--     Device must support the @'sDL_HAPTIC_PAUSE'@ feature. Call @SDL_ResumeHaptic()@ to resume playback.
--
--     Do not modify the effects nor add new ones while the device is paused. That can cause all sorts of weird errors.
--
--     [@haptic@]: the 'SDL_Haptic' device to pause.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ResumeHaptic'
--
--     [C declaration]: @SDL_PauseHaptic@, defined at @SDL3\/SDL_haptic.h 1368:34@
sDL_PauseHaptic :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CBool)
sDL_PauseHaptic =
  BG.unsafePerformIO hs_bindgen_2300eaaf5179d227

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_ResumeHaptic@
foreign import ccall unsafe "hs_bindgen_d1b63d6dd09df218"
  hs_bindgen_d1b63d6dd09df218_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_ResumeHaptic@
hs_bindgen_d1b63d6dd09df218 :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CBool))
hs_bindgen_d1b63d6dd09df218 =
  BG.fromFFIType hs_bindgen_d1b63d6dd09df218_base

{-# NOINLINE sDL_ResumeHaptic #-}

-- | Resume a haptic device.
--
--     Call to unpause after @SDL_PauseHaptic()@.
--
--     [@haptic@]: the 'SDL_Haptic' device to unpause.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PauseHaptic'
--
--     [C declaration]: @SDL_ResumeHaptic@, defined at @SDL3\/SDL_haptic.h 1383:34@
sDL_ResumeHaptic :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CBool)
sDL_ResumeHaptic =
  BG.unsafePerformIO hs_bindgen_d1b63d6dd09df218

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_StopHapticEffects@
foreign import ccall unsafe "hs_bindgen_5cc314419a9f2703"
  hs_bindgen_5cc314419a9f2703_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_StopHapticEffects@
hs_bindgen_5cc314419a9f2703 :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CBool))
hs_bindgen_5cc314419a9f2703 =
  BG.fromFFIType hs_bindgen_5cc314419a9f2703_base

{-# NOINLINE sDL_StopHapticEffects #-}

-- | Stop all the currently playing effects on a haptic device.
--
--     [@haptic@]: the 'SDL_Haptic' device to stop.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RunHapticEffect', 'sDL_StopHapticEffects'
--
--     [C declaration]: @SDL_StopHapticEffects@, defined at @SDL3\/SDL_haptic.h 1397:34@
sDL_StopHapticEffects :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CBool)
sDL_StopHapticEffects =
  BG.unsafePerformIO hs_bindgen_5cc314419a9f2703

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_HapticRumbleSupported@
foreign import ccall unsafe "hs_bindgen_62fc953aa6c9d61a"
  hs_bindgen_62fc953aa6c9d61a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_HapticRumbleSupported@
hs_bindgen_62fc953aa6c9d61a :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CBool))
hs_bindgen_62fc953aa6c9d61a =
  BG.fromFFIType hs_bindgen_62fc953aa6c9d61a_base

{-# NOINLINE sDL_HapticRumbleSupported #-}

-- | Check whether rumble is supported on a haptic device.
--
--     [@haptic@]: haptic device to check for rumble support.
--
--     [Returns]: true if the effect is supported or false if it isn\'t.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_InitHapticRumble'
--
--     [C declaration]: @SDL_HapticRumbleSupported@, defined at @SDL3\/SDL_haptic.h 1409:34@
sDL_HapticRumbleSupported :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CBool)
sDL_HapticRumbleSupported =
  BG.unsafePerformIO hs_bindgen_62fc953aa6c9d61a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_InitHapticRumble@
foreign import ccall unsafe "hs_bindgen_7d0705a7e6ebb724"
  hs_bindgen_7d0705a7e6ebb724_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_InitHapticRumble@
hs_bindgen_7d0705a7e6ebb724 :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CBool))
hs_bindgen_7d0705a7e6ebb724 =
  BG.fromFFIType hs_bindgen_7d0705a7e6ebb724_base

{-# NOINLINE sDL_InitHapticRumble #-}

-- | Initialize a haptic device for simple rumble playback.
--
--     [@haptic@]: the haptic device to initialize for simple rumble playback.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PlayHapticRumble', 'sDL_StopHapticRumble', 'sDL_HapticRumbleSupported'
--
--     [C declaration]: @SDL_InitHapticRumble@, defined at @SDL3\/SDL_haptic.h 1424:34@
sDL_InitHapticRumble :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CBool)
sDL_InitHapticRumble =
  BG.unsafePerformIO hs_bindgen_7d0705a7e6ebb724

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_PlayHapticRumble@
foreign import ccall unsafe "hs_bindgen_41c52ad08dc2e874"
  hs_bindgen_41c52ad08dc2e874_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_PlayHapticRumble@
hs_bindgen_41c52ad08dc2e874
  :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> BG.CFloat -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_41c52ad08dc2e874 =
  BG.fromFFIType hs_bindgen_41c52ad08dc2e874_base

{-# NOINLINE sDL_PlayHapticRumble #-}

-- | Run a simple rumble effect on a haptic device.
--
--     [@haptic@]: the haptic device to play the rumble effect on.
--
--     [@strength@]: strength of the rumble to play as a 0-1 float value.
--
--     [@length@]: length of the rumble to play in milliseconds.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_InitHapticRumble', 'sDL_StopHapticRumble'
--
--     [C declaration]: @SDL_PlayHapticRumble@, defined at @SDL3\/SDL_haptic.h 1440:34@
sDL_PlayHapticRumble
  :: BG.FunPtr (BG.Ptr SDL_Haptic -> BG.CFloat -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_PlayHapticRumble =
  BG.unsafePerformIO hs_bindgen_41c52ad08dc2e874

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_StopHapticRumble@
foreign import ccall unsafe "hs_bindgen_e3ee0b83eaad3e1f"
  hs_bindgen_e3ee0b83eaad3e1f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Haptic_get_SDL_StopHapticRumble@
hs_bindgen_e3ee0b83eaad3e1f :: IO (BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CBool))
hs_bindgen_e3ee0b83eaad3e1f =
  BG.fromFFIType hs_bindgen_e3ee0b83eaad3e1f_base

{-# NOINLINE sDL_StopHapticRumble #-}

-- | Stop the simple rumble on a haptic device.
--
--     [@haptic@]: the haptic device to stop the rumble effect on.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PlayHapticRumble'
--
--     [C declaration]: @SDL_StopHapticRumble@, defined at @SDL3\/SDL_haptic.h 1453:34@
sDL_StopHapticRumble :: BG.FunPtr (BG.Ptr SDL_Haptic -> IO BG.CBool)
sDL_StopHapticRumble =
  BG.unsafePerformIO hs_bindgen_e3ee0b83eaad3e1f

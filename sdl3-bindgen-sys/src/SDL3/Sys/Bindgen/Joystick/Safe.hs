{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Joystick.Safe (
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_LockJoysticks,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_UnlockJoysticks,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_HasJoystick,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoysticks,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickNameForID,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickPathForID,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickPlayerIndexForID,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickGUIDForID,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickVendorForID,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickProductForID,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickProductVersionForID,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickTypeForID,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_OpenJoystick,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickFromID,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickFromPlayerIndex,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_AttachVirtualJoystick,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_DetachVirtualJoystick,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_IsJoystickVirtual,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_SetJoystickVirtualAxis,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_SetJoystickVirtualBall,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_SetJoystickVirtualButton,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_SetJoystickVirtualHat,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_SetJoystickVirtualTouchpad,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_SendJoystickVirtualSensorData,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickProperties,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickName,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickPath,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickPlayerIndex,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_SetJoystickPlayerIndex,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickGUID,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickVendor,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickProduct,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickProductVersion,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickFirmwareVersion,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickSerial,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickType,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickGUIDInfo,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_JoystickConnected,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickID,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetNumJoystickAxes,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetNumJoystickBalls,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetNumJoystickHats,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetNumJoystickButtons,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_SetJoystickEventsEnabled,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_JoystickEventsEnabled,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_UpdateJoysticks,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickAxis,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickAxisInitialState,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickBall,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickHat,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickButton,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_RumbleJoystick,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_RumbleJoystickTriggers,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_SetJoystickLED,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_SendJoystickEffect,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_CloseJoystick,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickConnectionState,
  SDL3.Sys.Bindgen.Joystick.Safe.sDL_GetJoystickPowerInfo,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Guid qualified
import SDL3.Sys.Bindgen.Joystick
import SDL3.Sys.Bindgen.Power qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Sensor qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_joystick.h>"
         , "void hs_bindgen_19b2fb0e1aa23b4e (void)"
         , "{"
         , "  (SDL_LockJoysticks)();"
         , "}"
         , "void hs_bindgen_1e385ec73db339ad (void)"
         , "{"
         , "  (SDL_UnlockJoysticks)();"
         , "}"
         , "_Bool hs_bindgen_35e62bce1113cd99 (void)"
         , "{"
         , "  return (SDL_HasJoystick)();"
         , "}"
         , "SDL_JoystickID *hs_bindgen_a648e48d15a7195e ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoysticks)(arg1);"
         , "}"
         , "char const *hs_bindgen_25173d20a8c29264 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickNameForID)(arg1);"
         , "}"
         , "char const *hs_bindgen_bdd23d794dc05a80 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickPathForID)(arg1);"
         , "}"
         , "signed int hs_bindgen_79f42832d2cd073a ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickPlayerIndexForID)(arg1);"
         , "}"
         , "void hs_bindgen_f9a989144ab124be ("
         , "  SDL_JoystickID arg1,"
         , "  SDL_GUID *arg2"
         , ")"
         , "{"
         , "  *arg2 = (SDL_GetJoystickGUIDForID)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_eadbde2ef191eb5b ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickVendorForID)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_bb593396127cd149 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickProductForID)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_44e1a599dadd0805 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickProductVersionForID)(arg1);"
         , "}"
         , "SDL_JoystickType hs_bindgen_336781da50ffa73f ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickTypeForID)(arg1);"
         , "}"
         , "SDL_Joystick *hs_bindgen_a95f6ee451f3128f ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_OpenJoystick)(arg1);"
         , "}"
         , "SDL_Joystick *hs_bindgen_8b8e060d989b32c5 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickFromID)(arg1);"
         , "}"
         , "SDL_Joystick *hs_bindgen_435b2937a9d773b0 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickFromPlayerIndex)(arg1);"
         , "}"
         , "SDL_JoystickID hs_bindgen_9b992b621bc9d228 ("
         , "  SDL_VirtualJoystickDesc const *arg1"
         , ")"
         , "{"
         , "  return (SDL_AttachVirtualJoystick)(arg1);"
         , "}"
         , "_Bool hs_bindgen_95f96ae58c7060c5 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_DetachVirtualJoystick)(arg1);"
         , "}"
         , "_Bool hs_bindgen_b4d6fc0d358b2610 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_IsJoystickVirtual)(arg1);"
         , "}"
         , "_Bool hs_bindgen_950280d1c0af9b76 ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  Sint16 arg3"
         , ")"
         , "{"
         , "  return (SDL_SetJoystickVirtualAxis)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_ebe45871302400bf ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  Sint16 arg3,"
         , "  Sint16 arg4"
         , ")"
         , "{"
         , "  return (SDL_SetJoystickVirtualBall)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_943b4ea8f02f7dfb ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return (SDL_SetJoystickVirtualButton)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_466a950a48c1bafe ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  Uint8 arg3"
         , ")"
         , "{"
         , "  return (SDL_SetJoystickVirtualHat)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_520069e80ffda161 ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  _Bool arg4,"
         , "  float arg5,"
         , "  float arg6,"
         , "  float arg7"
         , ")"
         , "{"
         , "  return (SDL_SetJoystickVirtualTouchpad)(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
         , "}"
         , "_Bool hs_bindgen_502da6838ce8a4f8 ("
         , "  SDL_Joystick *arg1,"
         , "  SDL_SensorType arg2,"
         , "  Uint64 arg3,"
         , "  float const *arg4,"
         , "  signed int arg5"
         , ")"
         , "{"
         , "  return (SDL_SendJoystickVirtualSensorData)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "SDL_PropertiesID hs_bindgen_0e41310a58070b5c ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickProperties)(arg1);"
         , "}"
         , "char const *hs_bindgen_a9e087059d7ddd66 ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickName)(arg1);"
         , "}"
         , "char const *hs_bindgen_33ba12816518ab07 ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickPath)(arg1);"
         , "}"
         , "signed int hs_bindgen_3f3bef7e45cb79c2 ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickPlayerIndex)(arg1);"
         , "}"
         , "_Bool hs_bindgen_24bf75158e208f66 ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_SetJoystickPlayerIndex)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_9d48edfe80deea21 ("
         , "  SDL_Joystick *arg1,"
         , "  SDL_GUID *arg2"
         , ")"
         , "{"
         , "  *arg2 = (SDL_GetJoystickGUID)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_58e23abd1321767d ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickVendor)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_a1a810fac491b03c ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickProduct)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_ffcb72c6f02c76c7 ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickProductVersion)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_990e53211d186662 ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickFirmwareVersion)(arg1);"
         , "}"
         , "char const *hs_bindgen_b1bfb007ec57169c ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickSerial)(arg1);"
         , "}"
         , "SDL_JoystickType hs_bindgen_4bbfdbe521ae4448 ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickType)(arg1);"
         , "}"
         , "void hs_bindgen_ac4457e1668303cb ("
         , "  SDL_GUID *arg1,"
         , "  Uint16 *arg2,"
         , "  Uint16 *arg3,"
         , "  Uint16 *arg4,"
         , "  Uint16 *arg5"
         , ")"
         , "{"
         , "  (SDL_GetJoystickGUIDInfo)(*arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_fd1547f6643cd55d ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_JoystickConnected)(arg1);"
         , "}"
         , "SDL_JoystickID hs_bindgen_e792f601776227ad ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickID)(arg1);"
         , "}"
         , "signed int hs_bindgen_eb5cf1b5a80cb490 ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetNumJoystickAxes)(arg1);"
         , "}"
         , "signed int hs_bindgen_e856e95bf561b58f ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetNumJoystickBalls)(arg1);"
         , "}"
         , "signed int hs_bindgen_14f7806c41b802cb ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetNumJoystickHats)(arg1);"
         , "}"
         , "signed int hs_bindgen_737397e3a398beb9 ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetNumJoystickButtons)(arg1);"
         , "}"
         , "void hs_bindgen_ed51a1754ff9d6c7 ("
         , "  _Bool arg1"
         , ")"
         , "{"
         , "  (SDL_SetJoystickEventsEnabled)(arg1);"
         , "}"
         , "_Bool hs_bindgen_86ece04390ea5953 (void)"
         , "{"
         , "  return (SDL_JoystickEventsEnabled)();"
         , "}"
         , "void hs_bindgen_277bf35db967cb76 (void)"
         , "{"
         , "  (SDL_UpdateJoysticks)();"
         , "}"
         , "Sint16 hs_bindgen_5ffa383d290b6a82 ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickAxis)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_427de097dfec8d31 ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  Sint16 *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickAxisInitialState)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_aee21b71d3004e03 ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  signed int *arg3,"
         , "  signed int *arg4"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickBall)(arg1, arg2, arg3, arg4);"
         , "}"
         , "Uint8 hs_bindgen_03a81f7b52479c1f ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickHat)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_066ace0739b36572 ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickButton)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_7e8a72caa95f2c2b ("
         , "  SDL_Joystick *arg1,"
         , "  Uint16 arg2,"
         , "  Uint16 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return (SDL_RumbleJoystick)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_301092a71603b81a ("
         , "  SDL_Joystick *arg1,"
         , "  Uint16 arg2,"
         , "  Uint16 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return (SDL_RumbleJoystickTriggers)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_8b94c1cbb487385b ("
         , "  SDL_Joystick *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return (SDL_SetJoystickLED)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_f7e59a6e5bb608fe ("
         , "  SDL_Joystick *arg1,"
         , "  void const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SendJoystickEffect)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_ea0c624f184dccba ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  (SDL_CloseJoystick)(arg1);"
         , "}"
         , "SDL_JoystickConnectionState hs_bindgen_08992afe945eb606 ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickConnectionState)(arg1);"
         , "}"
         , "SDL_PowerState hs_bindgen_8bfbd5889037e579 ("
         , "  SDL_Joystick *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetJoystickPowerInfo)(arg1, arg2);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_LockJoysticks@
foreign import ccall safe "hs_bindgen_19b2fb0e1aa23b4e"
  hs_bindgen_19b2fb0e1aa23b4e_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_LockJoysticks@
hs_bindgen_19b2fb0e1aa23b4e :: IO ()
hs_bindgen_19b2fb0e1aa23b4e =
  BG.fromFFIType hs_bindgen_19b2fb0e1aa23b4e_base

-- | Locking for atomic access to the joystick API.
--
--     The SDL joystick functions are thread-safe, however you can lock the joysticks while processing to guarantee that the joystick list won\'t change and joystick and gamepad events will not be delivered.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_LockJoysticks@, defined at @SDL3\/SDL_joystick.h 189:34@
sDL_LockJoysticks :: IO ()
sDL_LockJoysticks = hs_bindgen_19b2fb0e1aa23b4e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_UnlockJoysticks@
foreign import ccall safe "hs_bindgen_1e385ec73db339ad"
  hs_bindgen_1e385ec73db339ad_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_UnlockJoysticks@
hs_bindgen_1e385ec73db339ad :: IO ()
hs_bindgen_1e385ec73db339ad =
  BG.fromFFIType hs_bindgen_1e385ec73db339ad_base

-- | Unlocking for atomic access to the joystick API.
--
--     [Thread safety]: This should be called from the same thread that called @SDL_LockJoysticks()@.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UnlockJoysticks@, defined at @SDL3\/SDL_joystick.h 199:34@
sDL_UnlockJoysticks :: IO ()
sDL_UnlockJoysticks = hs_bindgen_1e385ec73db339ad

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_HasJoystick@
foreign import ccall safe "hs_bindgen_35e62bce1113cd99"
  hs_bindgen_35e62bce1113cd99_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_HasJoystick@
hs_bindgen_35e62bce1113cd99 :: IO BG.CBool
hs_bindgen_35e62bce1113cd99 =
  BG.fromFFIType hs_bindgen_35e62bce1113cd99_base

-- | Return whether a joystick is currently connected.
--
--     [Returns]: true if a joystick is connected, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoysticks'
--
--     [C declaration]: @SDL_HasJoystick@, defined at @SDL3\/SDL_joystick.h 212:34@
sDL_HasJoystick :: IO BG.CBool
sDL_HasJoystick = hs_bindgen_35e62bce1113cd99

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoysticks@
foreign import ccall safe "hs_bindgen_a648e48d15a7195e"
  hs_bindgen_a648e48d15a7195e_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoysticks@
hs_bindgen_a648e48d15a7195e
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL_JoystickID)
hs_bindgen_a648e48d15a7195e =
  BG.fromFFIType hs_bindgen_a648e48d15a7195e_base

-- | Get a list of currently connected joysticks.
--
--     [Returns]: a 0 terminated array of joystick instance IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasJoystick', 'sDL_OpenJoystick'
--
--     [C declaration]: @SDL_GetJoysticks@, defined at @SDL3\/SDL_joystick.h 230:46@
sDL_GetJoysticks
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of joysticks returned, may be NULL.
  -> IO (BG.Ptr SDL_JoystickID)
sDL_GetJoysticks = hs_bindgen_a648e48d15a7195e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickNameForID@
foreign import ccall safe "hs_bindgen_25173d20a8c29264"
  hs_bindgen_25173d20a8c29264_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickNameForID@
hs_bindgen_25173d20a8c29264
  :: SDL_JoystickID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_25173d20a8c29264 =
  BG.fromFFIType hs_bindgen_25173d20a8c29264_base

-- | Get the implementation dependent name of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [Returns]: the name of the selected joystick. If no name can be found, this function returns NULL; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickName', 'sDL_GetJoysticks'
--
--     [C declaration]: @SDL_GetJoystickNameForID@, defined at @SDL3\/SDL_joystick.h 248:42@
sDL_GetJoystickNameForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetJoystickNameForID =
  hs_bindgen_25173d20a8c29264

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickPathForID@
foreign import ccall safe "hs_bindgen_bdd23d794dc05a80"
  hs_bindgen_bdd23d794dc05a80_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickPathForID@
hs_bindgen_bdd23d794dc05a80
  :: SDL_JoystickID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_bdd23d794dc05a80 =
  BG.fromFFIType hs_bindgen_bdd23d794dc05a80_base

-- | Get the implementation dependent path of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [Returns]: the path of the selected joystick. If no path can be found, this function returns NULL; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickPath', 'sDL_GetJoysticks'
--
--     [C declaration]: @SDL_GetJoystickPathForID@, defined at @SDL3\/SDL_joystick.h 266:42@
sDL_GetJoystickPathForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetJoystickPathForID =
  hs_bindgen_bdd23d794dc05a80

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickPlayerIndexForID@
foreign import ccall safe "hs_bindgen_79f42832d2cd073a"
  hs_bindgen_79f42832d2cd073a_base
    :: BG.Word32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickPlayerIndexForID@
hs_bindgen_79f42832d2cd073a
  :: SDL_JoystickID
  -> IO BG.CInt
hs_bindgen_79f42832d2cd073a =
  BG.fromFFIType hs_bindgen_79f42832d2cd073a_base

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
--     [See also]: 'sDL_GetJoystickPlayerIndex', 'sDL_GetJoysticks'
--
--     [C declaration]: @SDL_GetJoystickPlayerIndexForID@, defined at @SDL3\/SDL_joystick.h 283:33@
sDL_GetJoystickPlayerIndexForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.CInt
sDL_GetJoystickPlayerIndexForID =
  hs_bindgen_79f42832d2cd073a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickGUIDForID@
foreign import ccall safe "hs_bindgen_f9a989144ab124be"
  hs_bindgen_f9a989144ab124be_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickGUIDForID@
hs_bindgen_f9a989144ab124be
  :: SDL_JoystickID
  -> BG.Ptr SDL3.Sys.Bindgen.Guid.SDL_GUID
  -> IO ()
hs_bindgen_f9a989144ab124be =
  BG.fromFFIType hs_bindgen_f9a989144ab124be_base

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
--     [See also]: 'sDL_GetJoystickGUID', SDL_GUIDToString
--
--     [C declaration]: @SDL_GetJoystickGUIDForID@, defined at @SDL3\/SDL_joystick.h 301:38@
sDL_GetJoystickGUIDForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID
sDL_GetJoystickGUIDForID =
  \instance_id0 ->
    BG.allocaAndPeek
      ( \res1 ->
          hs_bindgen_f9a989144ab124be instance_id0 res1
      )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickVendorForID@
foreign import ccall safe "hs_bindgen_eadbde2ef191eb5b"
  hs_bindgen_eadbde2ef191eb5b_base
    :: BG.Word32
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickVendorForID@
hs_bindgen_eadbde2ef191eb5b
  :: SDL_JoystickID
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_eadbde2ef191eb5b =
  BG.fromFFIType hs_bindgen_eadbde2ef191eb5b_base

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
--     [See also]: 'sDL_GetJoystickVendor', 'sDL_GetJoysticks'
--
--     [C declaration]: @SDL_GetJoystickVendorForID@, defined at @SDL3\/SDL_joystick.h 320:36@
sDL_GetJoystickVendorForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetJoystickVendorForID =
  hs_bindgen_eadbde2ef191eb5b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickProductForID@
foreign import ccall safe "hs_bindgen_bb593396127cd149"
  hs_bindgen_bb593396127cd149_base
    :: BG.Word32
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickProductForID@
hs_bindgen_bb593396127cd149
  :: SDL_JoystickID
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_bb593396127cd149 =
  BG.fromFFIType hs_bindgen_bb593396127cd149_base

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
--     [See also]: 'sDL_GetJoystickProduct', 'sDL_GetJoysticks'
--
--     [C declaration]: @SDL_GetJoystickProductForID@, defined at @SDL3\/SDL_joystick.h 339:36@
sDL_GetJoystickProductForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetJoystickProductForID =
  hs_bindgen_bb593396127cd149

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickProductVersionForID@
foreign import ccall safe "hs_bindgen_44e1a599dadd0805"
  hs_bindgen_44e1a599dadd0805_base
    :: BG.Word32
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickProductVersionForID@
hs_bindgen_44e1a599dadd0805
  :: SDL_JoystickID
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_44e1a599dadd0805 =
  BG.fromFFIType hs_bindgen_44e1a599dadd0805_base

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
--     [See also]: 'sDL_GetJoystickProductVersion', 'sDL_GetJoysticks'
--
--     [C declaration]: @SDL_GetJoystickProductVersionForID@, defined at @SDL3\/SDL_joystick.h 358:36@
sDL_GetJoystickProductVersionForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetJoystickProductVersionForID =
  hs_bindgen_44e1a599dadd0805

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickTypeForID@
foreign import ccall safe "hs_bindgen_336781da50ffa73f"
  hs_bindgen_336781da50ffa73f_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickTypeForID@
hs_bindgen_336781da50ffa73f
  :: SDL_JoystickID
  -> IO SDL_JoystickType
hs_bindgen_336781da50ffa73f =
  BG.fromFFIType hs_bindgen_336781da50ffa73f_base

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
--     [See also]: 'sDL_GetJoystickType', 'sDL_GetJoysticks'
--
--     [C declaration]: @SDL_GetJoystickTypeForID@, defined at @SDL3\/SDL_joystick.h 377:46@
sDL_GetJoystickTypeForID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL_JoystickType
sDL_GetJoystickTypeForID =
  hs_bindgen_336781da50ffa73f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_OpenJoystick@
foreign import ccall safe "hs_bindgen_a95f6ee451f3128f"
  hs_bindgen_a95f6ee451f3128f_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_OpenJoystick@
hs_bindgen_a95f6ee451f3128f
  :: SDL_JoystickID
  -> IO (BG.Ptr SDL_Joystick)
hs_bindgen_a95f6ee451f3128f =
  BG.fromFFIType hs_bindgen_a95f6ee451f3128f_base

-- | Open a joystick for use.
--
--     The joystick subsystem must be initialized before a joystick can be opened for use.
--
--     [Returns]: a joystick identifier or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseJoystick'
--
--     [C declaration]: @SDL_OpenJoystick@, defined at @SDL3\/SDL_joystick.h 395:44@
sDL_OpenJoystick
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (BG.Ptr SDL_Joystick)
sDL_OpenJoystick = hs_bindgen_a95f6ee451f3128f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickFromID@
foreign import ccall safe "hs_bindgen_8b8e060d989b32c5"
  hs_bindgen_8b8e060d989b32c5_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickFromID@
hs_bindgen_8b8e060d989b32c5
  :: SDL_JoystickID
  -> IO (BG.Ptr SDL_Joystick)
hs_bindgen_8b8e060d989b32c5 =
  BG.fromFFIType hs_bindgen_8b8e060d989b32c5_base

-- | Get the 'SDL_Joystick' associated with an instance ID, if it has been opened.
--
--     [Returns]: an 'SDL_Joystick' on success or NULL on failure or if it hasn\'t been opened yet; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickFromID@, defined at @SDL3\/SDL_joystick.h 408:44@
sDL_GetJoystickFromID
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the instance ID to get the 'SDL_Joystick' for.
  -> IO (BG.Ptr SDL_Joystick)
sDL_GetJoystickFromID = hs_bindgen_8b8e060d989b32c5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickFromPlayerIndex@
foreign import ccall safe "hs_bindgen_435b2937a9d773b0"
  hs_bindgen_435b2937a9d773b0_base
    :: BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickFromPlayerIndex@
hs_bindgen_435b2937a9d773b0
  :: BG.CInt
  -> IO (BG.Ptr SDL_Joystick)
hs_bindgen_435b2937a9d773b0 =
  BG.fromFFIType hs_bindgen_435b2937a9d773b0_base

-- | Get the 'SDL_Joystick' associated with a player index.
--
--     [Returns]: an 'SDL_Joystick' on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickPlayerIndex', 'sDL_SetJoystickPlayerIndex'
--
--     [C declaration]: @SDL_GetJoystickFromPlayerIndex@, defined at @SDL3\/SDL_joystick.h 424:44@
sDL_GetJoystickFromPlayerIndex
  :: BG.CInt
  -- ^
  --
  --           [@player_index@]: the player index to get the 'SDL_Joystick' for.
  -> IO (BG.Ptr SDL_Joystick)
sDL_GetJoystickFromPlayerIndex =
  hs_bindgen_435b2937a9d773b0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_AttachVirtualJoystick@
foreign import ccall safe "hs_bindgen_9b992b621bc9d228"
  hs_bindgen_9b992b621bc9d228_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_AttachVirtualJoystick@
hs_bindgen_9b992b621bc9d228
  :: PtrConst.PtrConst SDL_VirtualJoystickDesc
  -> IO SDL_JoystickID
hs_bindgen_9b992b621bc9d228 =
  BG.fromFFIType hs_bindgen_9b992b621bc9d228_base

-- | Attach a new virtual joystick.
--
--     Apps can create virtual joysticks, that exist without hardware directly backing them, and have program-supplied inputs. Once attached, a virtual joystick looks like any other joystick that SDL can access. These can be used to make other things look like joysticks, or provide pre-recorded input, etc.
--
--     Once attached, the app can send joystick inputs to the new virtual joystick using @SDL_SetJoystickVirtualAxis()@, etc.
--
--     When no longer needed, the virtual joystick can be removed by calling @SDL_DetachVirtualJoystick()@.
--
--     [Returns]: the joystick instance ID, or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DetachVirtualJoystick', 'sDL_SetJoystickVirtualAxis', 'sDL_SetJoystickVirtualButton', 'sDL_SetJoystickVirtualBall', 'sDL_SetJoystickVirtualHat', 'sDL_SetJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     [C declaration]: @SDL_AttachVirtualJoystick@, defined at @SDL3\/SDL_joystick.h 539:44@
sDL_AttachVirtualJoystick
  :: PtrConst.PtrConst SDL_VirtualJoystickDesc
  -- ^
  --
  --           [@desc@]: joystick description, initialized using SDL_INIT_INTERFACE().
  -> IO SDL_JoystickID
sDL_AttachVirtualJoystick =
  hs_bindgen_9b992b621bc9d228

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_DetachVirtualJoystick@
foreign import ccall safe "hs_bindgen_95f96ae58c7060c5"
  hs_bindgen_95f96ae58c7060c5_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_DetachVirtualJoystick@
hs_bindgen_95f96ae58c7060c5
  :: SDL_JoystickID
  -> IO BG.CBool
hs_bindgen_95f96ae58c7060c5 =
  BG.fromFFIType hs_bindgen_95f96ae58c7060c5_base

-- | Detach a virtual joystick.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AttachVirtualJoystick'
--
--     [C declaration]: @SDL_DetachVirtualJoystick@, defined at @SDL3\/SDL_joystick.h 555:34@
sDL_DetachVirtualJoystick
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID, previously returned from @SDL_AttachVirtualJoystick()@.
  -> IO BG.CBool
sDL_DetachVirtualJoystick =
  hs_bindgen_95f96ae58c7060c5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_IsJoystickVirtual@
foreign import ccall safe "hs_bindgen_b4d6fc0d358b2610"
  hs_bindgen_b4d6fc0d358b2610_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_IsJoystickVirtual@
hs_bindgen_b4d6fc0d358b2610
  :: SDL_JoystickID
  -> IO BG.CBool
hs_bindgen_b4d6fc0d358b2610 =
  BG.fromFFIType hs_bindgen_b4d6fc0d358b2610_base

-- | Query whether or not a joystick is virtual.
--
--     [Returns]: true if the joystick is virtual, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_IsJoystickVirtual@, defined at @SDL3\/SDL_joystick.h 567:34@
sDL_IsJoystickVirtual
  :: SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.CBool
sDL_IsJoystickVirtual = hs_bindgen_b4d6fc0d358b2610

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickVirtualAxis@
foreign import ccall safe "hs_bindgen_950280d1c0af9b76"
  hs_bindgen_950280d1c0af9b76_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int16
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickVirtualAxis@
hs_bindgen_950280d1c0af9b76
  :: BG.Ptr SDL_Joystick
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Stdinc.Sint16
  -> IO BG.CBool
hs_bindgen_950280d1c0af9b76 =
  BG.fromFFIType hs_bindgen_950280d1c0af9b76_base

-- | Set the state of an axis on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to SDL_UpdateJoysticks, which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout, SDL_WaitEvent.
--
--     Note that when sending trigger axes, you should scale the value to the full range of Sint16. For example, a trigger at rest would have the value of @'sDL_JOYSTICK_AXIS_MIN'@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetJoystickVirtualButton', 'sDL_SetJoystickVirtualBall', 'sDL_SetJoystickVirtualHat', 'sDL_SetJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     [C declaration]: @SDL_SetJoystickVirtualAxis@, defined at @SDL3\/SDL_joystick.h 598:34@
sDL_SetJoystickVirtualAxis
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.CInt
  -- ^
  --
  --           [@axis@]: the index of the axis on the virtual joystick to update.
  -> SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@value@]: the new value for the specified axis.
  -> IO BG.CBool
sDL_SetJoystickVirtualAxis =
  hs_bindgen_950280d1c0af9b76

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickVirtualBall@
foreign import ccall safe "hs_bindgen_ebe45871302400bf"
  hs_bindgen_ebe45871302400bf_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int16
    -> BG.Int16
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickVirtualBall@
hs_bindgen_ebe45871302400bf
  :: BG.Ptr SDL_Joystick
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Stdinc.Sint16
  -> SDL3.Sys.Bindgen.Stdinc.Sint16
  -> IO BG.CBool
hs_bindgen_ebe45871302400bf =
  BG.fromFFIType hs_bindgen_ebe45871302400bf_base

-- | Generate ball motion on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to SDL_UpdateJoysticks, which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout, SDL_WaitEvent.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetJoystickVirtualAxis', 'sDL_SetJoystickVirtualButton', 'sDL_SetJoystickVirtualHat', 'sDL_SetJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     [C declaration]: @SDL_SetJoystickVirtualBall@, defined at @SDL3\/SDL_joystick.h 626:34@
sDL_SetJoystickVirtualBall
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.CInt
  -- ^
  --
  --           [@ball@]: the index of the ball on the virtual joystick to update.
  -> SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@xrel@]: the relative motion on the X axis.
  -> SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@yrel@]: the relative motion on the Y axis.
  -> IO BG.CBool
sDL_SetJoystickVirtualBall =
  hs_bindgen_ebe45871302400bf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickVirtualButton@
foreign import ccall safe "hs_bindgen_943b4ea8f02f7dfb"
  hs_bindgen_943b4ea8f02f7dfb_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickVirtualButton@
hs_bindgen_943b4ea8f02f7dfb
  :: BG.Ptr SDL_Joystick
  -> BG.CInt
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_943b4ea8f02f7dfb =
  BG.fromFFIType hs_bindgen_943b4ea8f02f7dfb_base

-- | Set the state of a button on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to SDL_UpdateJoysticks, which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout, SDL_WaitEvent.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetJoystickVirtualAxis', 'sDL_SetJoystickVirtualBall', 'sDL_SetJoystickVirtualHat', 'sDL_SetJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     [C declaration]: @SDL_SetJoystickVirtualButton@, defined at @SDL3\/SDL_joystick.h 653:34@
sDL_SetJoystickVirtualButton
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.CInt
  -- ^
  --
  --           [@button@]: the index of the button on the virtual joystick to update.
  -> BG.CBool
  -- ^
  --
  --           [@down@]: true if the button is pressed, false otherwise.
  -> IO BG.CBool
sDL_SetJoystickVirtualButton =
  hs_bindgen_943b4ea8f02f7dfb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickVirtualHat@
foreign import ccall safe "hs_bindgen_466a950a48c1bafe"
  hs_bindgen_466a950a48c1bafe_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickVirtualHat@
hs_bindgen_466a950a48c1bafe
  :: BG.Ptr SDL_Joystick
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_466a950a48c1bafe =
  BG.fromFFIType hs_bindgen_466a950a48c1bafe_base

-- | Set the state of a hat on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to SDL_UpdateJoysticks, which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout, SDL_WaitEvent.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetJoystickVirtualAxis', 'sDL_SetJoystickVirtualButton', 'sDL_SetJoystickVirtualBall', 'sDL_SetJoystickVirtualTouchpad', SDL_SetJoystickVirtualSensorData
--
--     [C declaration]: @SDL_SetJoystickVirtualHat@, defined at @SDL3\/SDL_joystick.h 680:34@
sDL_SetJoystickVirtualHat
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.CInt
  -- ^
  --
  --           [@hat@]: the index of the hat on the virtual joystick to update.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@value@]: the new value for the specified hat.
  -> IO BG.CBool
sDL_SetJoystickVirtualHat =
  hs_bindgen_466a950a48c1bafe

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickVirtualTouchpad@
foreign import ccall safe "hs_bindgen_520069e80ffda161"
  hs_bindgen_520069e80ffda161_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Word8
    -> Float
    -> Float
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickVirtualTouchpad@
hs_bindgen_520069e80ffda161
  :: BG.Ptr SDL_Joystick
  -> BG.CInt
  -> BG.CInt
  -> BG.CBool
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_520069e80ffda161 =
  BG.fromFFIType hs_bindgen_520069e80ffda161_base

-- | Set touchpad finger state on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to SDL_UpdateJoysticks, which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout, SDL_WaitEvent.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetJoystickVirtualAxis', 'sDL_SetJoystickVirtualButton', 'sDL_SetJoystickVirtualBall', 'sDL_SetJoystickVirtualHat', SDL_SetJoystickVirtualSensorData
--
--     [C declaration]: @SDL_SetJoystickVirtualTouchpad@, defined at @SDL3\/SDL_joystick.h 714:34@
sDL_SetJoystickVirtualTouchpad
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> BG.CInt
  -- ^
  --
  --           [@touchpad@]: the index of the touchpad on the virtual joystick to update.
  -> BG.CInt
  -- ^
  --
  --           [@finger@]: the index of the finger on the touchpad to set.
  -> BG.CBool
  -- ^
  --
  --           [@down@]: true if the finger is pressed, false if the finger is released.
  -> BG.CFloat
  -- ^
  --
  --           [@x@]: the x coordinate of the finger on the touchpad, normalized 0 to 1, with the origin in the upper left.
  -> BG.CFloat
  -- ^
  --
  --           [@y@]: the y coordinate of the finger on the touchpad, normalized 0 to 1, with the origin in the upper left.
  -> BG.CFloat
  -- ^
  --
  --           [@pressure@]: the pressure of the finger.
  -> IO BG.CBool
sDL_SetJoystickVirtualTouchpad =
  hs_bindgen_520069e80ffda161

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SendJoystickVirtualSensorData@
foreign import ccall safe "hs_bindgen_502da6838ce8a4f8"
  hs_bindgen_502da6838ce8a4f8_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Word64
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SendJoystickVirtualSensorData@
hs_bindgen_502da6838ce8a4f8
  :: BG.Ptr SDL_Joystick
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -> PtrConst.PtrConst BG.CFloat
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_502da6838ce8a4f8 =
  BG.fromFFIType hs_bindgen_502da6838ce8a4f8_base

-- | Send a sensor update for an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to SDL_UpdateJoysticks, which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout, SDL_WaitEvent.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetJoystickVirtualAxis', 'sDL_SetJoystickVirtualButton', 'sDL_SetJoystickVirtualBall', 'sDL_SetJoystickVirtualHat', 'sDL_SetJoystickVirtualTouchpad'
--
--     [C declaration]: @SDL_SendJoystickVirtualSensorData@, defined at @SDL3\/SDL_joystick.h 744:34@
sDL_SendJoystickVirtualSensorData
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the virtual joystick on which to set state.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of the sensor on the virtual joystick to update.
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@sensor_timestamp@]: a 64-bit timestamp in nanoseconds associated with the sensor reading.
  -> PtrConst.PtrConst BG.CFloat
  -- ^
  --
  --           [@data@]: the data associated with the sensor reading.
  -> BG.CInt
  -- ^
  --
  --           [@num_values@]: the number of values pointed to by @data@.
  -> IO BG.CBool
sDL_SendJoystickVirtualSensorData =
  hs_bindgen_502da6838ce8a4f8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickProperties@
foreign import ccall safe "hs_bindgen_0e41310a58070b5c"
  hs_bindgen_0e41310a58070b5c_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickProperties@
hs_bindgen_0e41310a58070b5c
  :: BG.Ptr SDL_Joystick
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_0e41310a58070b5c =
  BG.fromFFIType hs_bindgen_0e41310a58070b5c_base

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
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickProperties@, defined at @SDL3\/SDL_joystick.h 770:46@
sDL_GetJoystickProperties
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_GetJoystickProperties =
  hs_bindgen_0e41310a58070b5c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickName@
foreign import ccall safe "hs_bindgen_a9e087059d7ddd66"
  hs_bindgen_a9e087059d7ddd66_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickName@
hs_bindgen_a9e087059d7ddd66
  :: BG.Ptr SDL_Joystick
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_a9e087059d7ddd66 =
  BG.fromFFIType hs_bindgen_a9e087059d7ddd66_base

-- | Get the implementation dependent name of a joystick.
--
--     [Returns]: the name of the selected joystick. If no name can be found, this function returns NULL; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickNameForID'
--
--     [C declaration]: @SDL_GetJoystickName@, defined at @SDL3\/SDL_joystick.h 791:42@
sDL_GetJoystickName
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetJoystickName = hs_bindgen_a9e087059d7ddd66

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickPath@
foreign import ccall safe "hs_bindgen_33ba12816518ab07"
  hs_bindgen_33ba12816518ab07_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickPath@
hs_bindgen_33ba12816518ab07
  :: BG.Ptr SDL_Joystick
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_33ba12816518ab07 =
  BG.fromFFIType hs_bindgen_33ba12816518ab07_base

-- | Get the implementation dependent path of a joystick.
--
--     [Returns]: the path of the selected joystick. If no path can be found, this function returns NULL; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickPathForID'
--
--     [C declaration]: @SDL_GetJoystickPath@, defined at @SDL3\/SDL_joystick.h 806:42@
sDL_GetJoystickPath
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetJoystickPath = hs_bindgen_33ba12816518ab07

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickPlayerIndex@
foreign import ccall safe "hs_bindgen_3f3bef7e45cb79c2"
  hs_bindgen_3f3bef7e45cb79c2_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickPlayerIndex@
hs_bindgen_3f3bef7e45cb79c2
  :: BG.Ptr SDL_Joystick
  -> IO BG.CInt
hs_bindgen_3f3bef7e45cb79c2 =
  BG.fromFFIType hs_bindgen_3f3bef7e45cb79c2_base

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
--     [See also]: 'sDL_SetJoystickPlayerIndex'
--
--     [C declaration]: @SDL_GetJoystickPlayerIndex@, defined at @SDL3\/SDL_joystick.h 823:33@
sDL_GetJoystickPlayerIndex
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
  -> IO BG.CInt
sDL_GetJoystickPlayerIndex =
  hs_bindgen_3f3bef7e45cb79c2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickPlayerIndex@
foreign import ccall safe "hs_bindgen_24bf75158e208f66"
  hs_bindgen_24bf75158e208f66_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickPlayerIndex@
hs_bindgen_24bf75158e208f66
  :: BG.Ptr SDL_Joystick
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_24bf75158e208f66 =
  BG.fromFFIType hs_bindgen_24bf75158e208f66_base

-- | Set the player index of an opened joystick.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickPlayerIndex'
--
--     [C declaration]: @SDL_SetJoystickPlayerIndex@, defined at @SDL3\/SDL_joystick.h 840:34@
sDL_SetJoystickPlayerIndex
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
  -> BG.CInt
  -- ^
  --
  --           [@player_index@]: player index to assign to this joystick, or -1 to clear the player index and turn off player LEDs.
  -> IO BG.CBool
sDL_SetJoystickPlayerIndex =
  hs_bindgen_24bf75158e208f66

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickGUID@
foreign import ccall safe "hs_bindgen_9d48edfe80deea21"
  hs_bindgen_9d48edfe80deea21_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickGUID@
hs_bindgen_9d48edfe80deea21
  :: BG.Ptr SDL_Joystick
  -> BG.Ptr SDL3.Sys.Bindgen.Guid.SDL_GUID
  -> IO ()
hs_bindgen_9d48edfe80deea21 =
  BG.fromFFIType hs_bindgen_9d48edfe80deea21_base

-- | Get the implementation-dependent GUID for the joystick.
--
--     This function requires an open joystick.
--
--     [Returns]: the GUID of the given joystick. If called on an invalid index, this function returns a zero GUID; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickGUIDForID', SDL_GUIDToString
--
--     [C declaration]: @SDL_GetJoystickGUID@, defined at @SDL3\/SDL_joystick.h 859:38@
sDL_GetJoystickGUID
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
  -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID
sDL_GetJoystickGUID =
  \joystick0 ->
    BG.allocaAndPeek
      ( \res1 ->
          hs_bindgen_9d48edfe80deea21 joystick0 res1
      )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickVendor@
foreign import ccall safe "hs_bindgen_58e23abd1321767d"
  hs_bindgen_58e23abd1321767d_base
    :: BG.Ptr BG.Void
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickVendor@
hs_bindgen_58e23abd1321767d
  :: BG.Ptr SDL_Joystick
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_58e23abd1321767d =
  BG.fromFFIType hs_bindgen_58e23abd1321767d_base

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
--     [See also]: 'sDL_GetJoystickVendorForID'
--
--     [C declaration]: @SDL_GetJoystickVendor@, defined at @SDL3\/SDL_joystick.h 875:36@
sDL_GetJoystickVendor
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetJoystickVendor = hs_bindgen_58e23abd1321767d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickProduct@
foreign import ccall safe "hs_bindgen_a1a810fac491b03c"
  hs_bindgen_a1a810fac491b03c_base
    :: BG.Ptr BG.Void
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickProduct@
hs_bindgen_a1a810fac491b03c
  :: BG.Ptr SDL_Joystick
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_a1a810fac491b03c =
  BG.fromFFIType hs_bindgen_a1a810fac491b03c_base

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
--     [See also]: 'sDL_GetJoystickProductForID'
--
--     [C declaration]: @SDL_GetJoystickProduct@, defined at @SDL3\/SDL_joystick.h 891:36@
sDL_GetJoystickProduct
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetJoystickProduct = hs_bindgen_a1a810fac491b03c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickProductVersion@
foreign import ccall safe "hs_bindgen_ffcb72c6f02c76c7"
  hs_bindgen_ffcb72c6f02c76c7_base
    :: BG.Ptr BG.Void
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickProductVersion@
hs_bindgen_ffcb72c6f02c76c7
  :: BG.Ptr SDL_Joystick
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_ffcb72c6f02c76c7 =
  BG.fromFFIType hs_bindgen_ffcb72c6f02c76c7_base

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
--     [See also]: 'sDL_GetJoystickProductVersionForID'
--
--     [C declaration]: @SDL_GetJoystickProductVersion@, defined at @SDL3\/SDL_joystick.h 907:36@
sDL_GetJoystickProductVersion
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetJoystickProductVersion =
  hs_bindgen_ffcb72c6f02c76c7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickFirmwareVersion@
foreign import ccall safe "hs_bindgen_990e53211d186662"
  hs_bindgen_990e53211d186662_base
    :: BG.Ptr BG.Void
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickFirmwareVersion@
hs_bindgen_990e53211d186662
  :: BG.Ptr SDL_Joystick
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_990e53211d186662 =
  BG.fromFFIType hs_bindgen_990e53211d186662_base

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
--     [C declaration]: @SDL_GetJoystickFirmwareVersion@, defined at @SDL3\/SDL_joystick.h 922:36@
sDL_GetJoystickFirmwareVersion
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetJoystickFirmwareVersion =
  hs_bindgen_990e53211d186662

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickSerial@
foreign import ccall safe "hs_bindgen_b1bfb007ec57169c"
  hs_bindgen_b1bfb007ec57169c_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickSerial@
hs_bindgen_b1bfb007ec57169c
  :: BG.Ptr SDL_Joystick
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_b1bfb007ec57169c =
  BG.fromFFIType hs_bindgen_b1bfb007ec57169c_base

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
--     [C declaration]: @SDL_GetJoystickSerial@, defined at @SDL3\/SDL_joystick.h 937:42@
sDL_GetJoystickSerial
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetJoystickSerial = hs_bindgen_b1bfb007ec57169c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickType@
foreign import ccall safe "hs_bindgen_4bbfdbe521ae4448"
  hs_bindgen_4bbfdbe521ae4448_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickType@
hs_bindgen_4bbfdbe521ae4448
  :: BG.Ptr SDL_Joystick
  -> IO SDL_JoystickType
hs_bindgen_4bbfdbe521ae4448 =
  BG.fromFFIType hs_bindgen_4bbfdbe521ae4448_base

-- | Get the type of an opened joystick.
--
--     [Returns]: the 'SDL_JoystickType' of the selected joystick.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickTypeForID'
--
--     [C declaration]: @SDL_GetJoystickType@, defined at @SDL3\/SDL_joystick.h 951:46@
sDL_GetJoystickType
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
  -> IO SDL_JoystickType
sDL_GetJoystickType = hs_bindgen_4bbfdbe521ae4448

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickGUIDInfo@
foreign import ccall safe "hs_bindgen_ac4457e1668303cb"
  hs_bindgen_ac4457e1668303cb_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickGUIDInfo@
hs_bindgen_ac4457e1668303cb
  :: BG.Ptr SDL3.Sys.Bindgen.Guid.SDL_GUID
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -> IO ()
hs_bindgen_ac4457e1668303cb =
  BG.fromFFIType hs_bindgen_ac4457e1668303cb_base

-- | Get the device information encoded in a SDL_GUID structure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickGUIDForID'
--
--     [C declaration]: @SDL_GetJoystickGUIDInfo@, defined at @SDL3\/SDL_joystick.h 972:34@
sDL_GetJoystickGUIDInfo
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
sDL_GetJoystickGUIDInfo =
  \guid0 ->
    \vendor1 ->
      \product2 ->
        \version3 ->
          \crc164 ->
            BG.with
              guid0
              ( \guid5 ->
                  hs_bindgen_ac4457e1668303cb guid5 vendor1 product2 version3 crc164
              )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_JoystickConnected@
foreign import ccall safe "hs_bindgen_fd1547f6643cd55d"
  hs_bindgen_fd1547f6643cd55d_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_JoystickConnected@
hs_bindgen_fd1547f6643cd55d
  :: BG.Ptr SDL_Joystick
  -> IO BG.CBool
hs_bindgen_fd1547f6643cd55d =
  BG.fromFFIType hs_bindgen_fd1547f6643cd55d_base

-- | Get the status of a specified joystick.
--
--     [Returns]: true if the joystick has been opened, false if it has not; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_JoystickConnected@, defined at @SDL3\/SDL_joystick.h 985:34@
sDL_JoystickConnected
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to query.
  -> IO BG.CBool
sDL_JoystickConnected = hs_bindgen_fd1547f6643cd55d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickID@
foreign import ccall safe "hs_bindgen_e792f601776227ad"
  hs_bindgen_e792f601776227ad_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickID@
hs_bindgen_e792f601776227ad
  :: BG.Ptr SDL_Joystick
  -> IO SDL_JoystickID
hs_bindgen_e792f601776227ad =
  BG.fromFFIType hs_bindgen_e792f601776227ad_base

-- | Get the instance ID of an opened joystick.
--
--     [Returns]: the instance ID of the specified joystick on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickID@, defined at @SDL3\/SDL_joystick.h 998:44@
sDL_GetJoystickID
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO SDL_JoystickID
sDL_GetJoystickID = hs_bindgen_e792f601776227ad

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetNumJoystickAxes@
foreign import ccall safe "hs_bindgen_eb5cf1b5a80cb490"
  hs_bindgen_eb5cf1b5a80cb490_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetNumJoystickAxes@
hs_bindgen_eb5cf1b5a80cb490
  :: BG.Ptr SDL_Joystick
  -> IO BG.CInt
hs_bindgen_eb5cf1b5a80cb490 =
  BG.fromFFIType hs_bindgen_eb5cf1b5a80cb490_base

-- | Get the number of general axis controls on a joystick.
--
--     Often, the directional pad on a game controller will either look like 4 separate buttons or a POV hat, and not axes, but all of this is up to the device and platform.
--
--     [Returns]: the number of axis controls\/number of axes on success or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickAxis', 'sDL_GetNumJoystickBalls', 'sDL_GetNumJoystickButtons', 'sDL_GetNumJoystickHats'
--
--     [C declaration]: @SDL_GetNumJoystickAxes@, defined at @SDL3\/SDL_joystick.h 1020:33@
sDL_GetNumJoystickAxes
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO BG.CInt
sDL_GetNumJoystickAxes = hs_bindgen_eb5cf1b5a80cb490

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetNumJoystickBalls@
foreign import ccall safe "hs_bindgen_e856e95bf561b58f"
  hs_bindgen_e856e95bf561b58f_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetNumJoystickBalls@
hs_bindgen_e856e95bf561b58f
  :: BG.Ptr SDL_Joystick
  -> IO BG.CInt
hs_bindgen_e856e95bf561b58f =
  BG.fromFFIType hs_bindgen_e856e95bf561b58f_base

-- | Get the number of trackballs on a joystick.
--
--     Joystick trackballs have only relative motion events associated with them and their state cannot be polled.
--
--     Most joysticks do not have trackballs.
--
--     [Returns]: the number of trackballs on success or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickBall', 'sDL_GetNumJoystickAxes', 'sDL_GetNumJoystickButtons', 'sDL_GetNumJoystickHats'
--
--     [C declaration]: @SDL_GetNumJoystickBalls@, defined at @SDL3\/SDL_joystick.h 1043:33@
sDL_GetNumJoystickBalls
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO BG.CInt
sDL_GetNumJoystickBalls = hs_bindgen_e856e95bf561b58f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetNumJoystickHats@
foreign import ccall safe "hs_bindgen_14f7806c41b802cb"
  hs_bindgen_14f7806c41b802cb_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetNumJoystickHats@
hs_bindgen_14f7806c41b802cb
  :: BG.Ptr SDL_Joystick
  -> IO BG.CInt
hs_bindgen_14f7806c41b802cb =
  BG.fromFFIType hs_bindgen_14f7806c41b802cb_base

-- | Get the number of POV hats on a joystick.
--
--     [Returns]: the number of POV hats on success or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickHat', 'sDL_GetNumJoystickAxes', 'sDL_GetNumJoystickBalls', 'sDL_GetNumJoystickButtons'
--
--     [C declaration]: @SDL_GetNumJoystickHats@, defined at @SDL3\/SDL_joystick.h 1061:33@
sDL_GetNumJoystickHats
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO BG.CInt
sDL_GetNumJoystickHats = hs_bindgen_14f7806c41b802cb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetNumJoystickButtons@
foreign import ccall safe "hs_bindgen_737397e3a398beb9"
  hs_bindgen_737397e3a398beb9_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetNumJoystickButtons@
hs_bindgen_737397e3a398beb9
  :: BG.Ptr SDL_Joystick
  -> IO BG.CInt
hs_bindgen_737397e3a398beb9 =
  BG.fromFFIType hs_bindgen_737397e3a398beb9_base

-- | Get the number of buttons on a joystick.
--
--     [Returns]: the number of buttons on success or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickButton', 'sDL_GetNumJoystickAxes', 'sDL_GetNumJoystickBalls', 'sDL_GetNumJoystickHats'
--
--     [C declaration]: @SDL_GetNumJoystickButtons@, defined at @SDL3\/SDL_joystick.h 1079:33@
sDL_GetNumJoystickButtons
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> IO BG.CInt
sDL_GetNumJoystickButtons =
  hs_bindgen_737397e3a398beb9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickEventsEnabled@
foreign import ccall safe "hs_bindgen_ed51a1754ff9d6c7"
  hs_bindgen_ed51a1754ff9d6c7_base
    :: BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickEventsEnabled@
hs_bindgen_ed51a1754ff9d6c7
  :: BG.CBool
  -> IO ()
hs_bindgen_ed51a1754ff9d6c7 =
  BG.fromFFIType hs_bindgen_ed51a1754ff9d6c7_base

-- | Set the state of joystick event processing.
--
--     If joystick events are disabled, you must call @SDL_UpdateJoysticks()@ yourself and check the state of the joystick when you want joystick information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_JoystickEventsEnabled', 'sDL_UpdateJoysticks'
--
--     [C declaration]: @SDL_SetJoystickEventsEnabled@, defined at @SDL3\/SDL_joystick.h 1097:34@
sDL_SetJoystickEventsEnabled
  :: BG.CBool
  -- ^
  --
  --           [@enabled@]: whether to process joystick events or not.
  -> IO ()
sDL_SetJoystickEventsEnabled =
  hs_bindgen_ed51a1754ff9d6c7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_JoystickEventsEnabled@
foreign import ccall safe "hs_bindgen_86ece04390ea5953"
  hs_bindgen_86ece04390ea5953_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_JoystickEventsEnabled@
hs_bindgen_86ece04390ea5953 :: IO BG.CBool
hs_bindgen_86ece04390ea5953 =
  BG.fromFFIType hs_bindgen_86ece04390ea5953_base

-- | Query the state of joystick event processing.
--
--     If joystick events are disabled, you must call @SDL_UpdateJoysticks()@ yourself and check the state of the joystick when you want joystick information.
--
--     [Returns]: true if joystick events are being processed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetJoystickEventsEnabled'
--
--     [C declaration]: @SDL_JoystickEventsEnabled@, defined at @SDL3\/SDL_joystick.h 1114:34@
sDL_JoystickEventsEnabled :: IO BG.CBool
sDL_JoystickEventsEnabled =
  hs_bindgen_86ece04390ea5953

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_UpdateJoysticks@
foreign import ccall safe "hs_bindgen_277bf35db967cb76"
  hs_bindgen_277bf35db967cb76_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_UpdateJoysticks@
hs_bindgen_277bf35db967cb76 :: IO ()
hs_bindgen_277bf35db967cb76 =
  BG.fromFFIType hs_bindgen_277bf35db967cb76_base

-- | Update the current state of the open joysticks.
--
--     This is called automatically by the event loop if any joystick events are enabled.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UpdateJoysticks@, defined at @SDL3\/SDL_joystick.h 1126:34@
sDL_UpdateJoysticks :: IO ()
sDL_UpdateJoysticks = hs_bindgen_277bf35db967cb76

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickAxis@
foreign import ccall safe "hs_bindgen_5ffa383d290b6a82"
  hs_bindgen_5ffa383d290b6a82_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickAxis@
hs_bindgen_5ffa383d290b6a82
  :: BG.Ptr SDL_Joystick
  -> BG.CInt
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint16
hs_bindgen_5ffa383d290b6a82 =
  BG.fromFFIType hs_bindgen_5ffa383d290b6a82_base

-- | Get the current state of an axis control on a joystick.
--
--     SDL makes no promises about what part of the joystick any given axis refers to. Your game should have some sort of configuration UI to let users specify what each axis should be bound to. Alternately, SDL\'s higher-level Game Controller API makes a great effort to apply order to this lower-level interface, so you know that a specific axis is the \"left thumb stick,\" etc.
--
--     The value returned by @SDL_GetJoystickAxis()@ is a signed integer (-32768 to 32767) representing the current position of the axis. It may be necessary to impose certain tolerances on these values to account for jitter.
--
--     [Returns]: a 16-bit signed integer representing the current position of the axis or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetNumJoystickAxes'
--
--     [C declaration]: @SDL_GetJoystickAxis@, defined at @SDL3\/SDL_joystick.h 1152:36@
sDL_GetJoystickAxis
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> BG.CInt
  -- ^
  --
  --           [@axis@]: the axis to query; the axis indices start at index 0.
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint16
sDL_GetJoystickAxis = hs_bindgen_5ffa383d290b6a82

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickAxisInitialState@
foreign import ccall safe "hs_bindgen_427de097dfec8d31"
  hs_bindgen_427de097dfec8d31_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickAxisInitialState@
hs_bindgen_427de097dfec8d31
  :: BG.Ptr SDL_Joystick
  -> BG.CInt
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16
  -> IO BG.CBool
hs_bindgen_427de097dfec8d31 =
  BG.fromFFIType hs_bindgen_427de097dfec8d31_base

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
--     [C declaration]: @SDL_GetJoystickAxisInitialState@, defined at @SDL3\/SDL_joystick.h 1170:34@
sDL_GetJoystickAxisInitialState
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> BG.CInt
  -- ^
  --
  --           [@axis@]: the axis to query; the axis indices start at index 0.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@state@]: upon return, the initial value is supplied here.
  -> IO BG.CBool
sDL_GetJoystickAxisInitialState =
  hs_bindgen_427de097dfec8d31

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickBall@
foreign import ccall safe "hs_bindgen_aee21b71d3004e03"
  hs_bindgen_aee21b71d3004e03_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickBall@
hs_bindgen_aee21b71d3004e03
  :: BG.Ptr SDL_Joystick
  -> BG.CInt
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_aee21b71d3004e03 =
  BG.fromFFIType hs_bindgen_aee21b71d3004e03_base

-- | Get the ball axis change since the last poll.
--
--     Trackballs can only return relative motion since the last call to @SDL_GetJoystickBall()@, these motion deltas are placed into @dx@ and @dy@.
--
--     Most joysticks do not have trackballs.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetNumJoystickBalls'
--
--     [C declaration]: @SDL_GetJoystickBall@, defined at @SDL3\/SDL_joystick.h 1193:34@
sDL_GetJoystickBall
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the 'SDL_Joystick' to query.
  -> BG.CInt
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
  -> IO BG.CBool
sDL_GetJoystickBall = hs_bindgen_aee21b71d3004e03

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickHat@
foreign import ccall safe "hs_bindgen_03a81f7b52479c1f"
  hs_bindgen_03a81f7b52479c1f_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickHat@
hs_bindgen_03a81f7b52479c1f
  :: BG.Ptr SDL_Joystick
  -> BG.CInt
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint8
hs_bindgen_03a81f7b52479c1f =
  BG.fromFFIType hs_bindgen_03a81f7b52479c1f_base

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
--     [See also]: 'sDL_GetNumJoystickHats'
--
--     [C declaration]: @SDL_GetJoystickHat@, defined at @SDL3\/SDL_joystick.h 1210:35@
sDL_GetJoystickHat
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> BG.CInt
  -- ^
  --
  --           [@hat@]: the hat index to get the state from; indices start at index 0.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint8
sDL_GetJoystickHat = hs_bindgen_03a81f7b52479c1f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickButton@
foreign import ccall safe "hs_bindgen_066ace0739b36572"
  hs_bindgen_066ace0739b36572_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickButton@
hs_bindgen_066ace0739b36572
  :: BG.Ptr SDL_Joystick
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_066ace0739b36572 =
  BG.fromFFIType hs_bindgen_066ace0739b36572_base

-- | Get the current state of a button on a joystick.
--
--     [Returns]: true if the button is pressed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetNumJoystickButtons'
--
--     [C declaration]: @SDL_GetJoystickButton@, defined at @SDL3\/SDL_joystick.h 1236:34@
sDL_GetJoystickButton
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
  -> BG.CInt
  -- ^
  --
  --           [@button@]: the button index to get the state from; indices start at index 0.
  -> IO BG.CBool
sDL_GetJoystickButton = hs_bindgen_066ace0739b36572

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_RumbleJoystick@
foreign import ccall safe "hs_bindgen_7e8a72caa95f2c2b"
  hs_bindgen_7e8a72caa95f2c2b_base
    :: BG.Ptr BG.Void
    -> BG.Word16
    -> BG.Word16
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_RumbleJoystick@
hs_bindgen_7e8a72caa95f2c2b
  :: BG.Ptr SDL_Joystick
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_7e8a72caa95f2c2b =
  BG.fromFFIType hs_bindgen_7e8a72caa95f2c2b_base

-- | Start a rumble effect.
--
--     Each call to this function cancels any previous rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     This function requires you to process SDL events or call @SDL_UpdateJoysticks()@ to update rumble state.
--
--     [Returns]: true, or false if rumble isn\'t supported on this joystick.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RumbleJoystick@, defined at @SDL3\/SDL_joystick.h 1259:34@
sDL_RumbleJoystick
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to vibrate.
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@low_frequency_rumble@]: the intensity of the low frequency (left) rumble motor, from 0 to 0xFFFF.
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@high_frequency_rumble@]: the intensity of the high frequency (right) rumble motor, from 0 to 0xFFFF.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@duration_ms@]: the duration of the rumble effect, in milliseconds.
  -> IO BG.CBool
sDL_RumbleJoystick = hs_bindgen_7e8a72caa95f2c2b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_RumbleJoystickTriggers@
foreign import ccall safe "hs_bindgen_301092a71603b81a"
  hs_bindgen_301092a71603b81a_base
    :: BG.Ptr BG.Void
    -> BG.Word16
    -> BG.Word16
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_RumbleJoystickTriggers@
hs_bindgen_301092a71603b81a
  :: BG.Ptr SDL_Joystick
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_301092a71603b81a =
  BG.fromFFIType hs_bindgen_301092a71603b81a_base

-- | Start a rumble effect in the joystick\'s triggers.
--
--     Each call to this function cancels any previous trigger rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     Note that this is rumbling of the /triggers/ and not the game controller as a whole. This is currently only supported on Xbox One controllers. If you want the (more common) whole-controller rumble, use @SDL_RumbleJoystick()@ instead.
--
--     This function requires you to process SDL events or call @SDL_UpdateJoysticks()@ to update rumble state.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RumbleJoystick'
--
--     [C declaration]: @SDL_RumbleJoystickTriggers@, defined at @SDL3\/SDL_joystick.h 1290:34@
sDL_RumbleJoystickTriggers
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to vibrate.
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@left_rumble@]: the intensity of the left trigger rumble motor, from 0 to 0xFFFF.
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@right_rumble@]: the intensity of the right trigger rumble motor, from 0 to 0xFFFF.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@duration_ms@]: the duration of the rumble effect, in milliseconds.
  -> IO BG.CBool
sDL_RumbleJoystickTriggers =
  hs_bindgen_301092a71603b81a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickLED@
foreign import ccall safe "hs_bindgen_8b94c1cbb487385b"
  hs_bindgen_8b94c1cbb487385b_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SetJoystickLED@
hs_bindgen_8b94c1cbb487385b
  :: BG.Ptr SDL_Joystick
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_8b94c1cbb487385b =
  BG.fromFFIType hs_bindgen_8b94c1cbb487385b_base

-- | Update a joystick\'s LED color.
--
--     An example of a joystick LED is the light on the back of a PlayStation 4\'s DualShock 4 controller.
--
--     For joysticks with a single color LED, the maximum of the RGB values will be used as the LED brightness.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetJoystickLED@, defined at @SDL3\/SDL_joystick.h 1312:34@
sDL_SetJoystickLED
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to update.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@red@]: the intensity of the red LED.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@green@]: the intensity of the green LED.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@blue@]: the intensity of the blue LED.
  -> IO BG.CBool
sDL_SetJoystickLED = hs_bindgen_8b94c1cbb487385b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SendJoystickEffect@
foreign import ccall safe "hs_bindgen_f7e59a6e5bb608fe"
  hs_bindgen_f7e59a6e5bb608fe_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_SendJoystickEffect@
hs_bindgen_f7e59a6e5bb608fe
  :: BG.Ptr SDL_Joystick
  -> PtrConst.PtrConst BG.Void
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_f7e59a6e5bb608fe =
  BG.fromFFIType hs_bindgen_f7e59a6e5bb608fe_base

-- | Send a joystick specific effect packet.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SendJoystickEffect@, defined at @SDL3\/SDL_joystick.h 1327:34@
sDL_SendJoystickEffect
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to affect.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to send to the joystick.
  -> BG.CInt
  -- ^
  --
  --           [@size@]: the size of the data to send to the joystick.
  -> IO BG.CBool
sDL_SendJoystickEffect = hs_bindgen_f7e59a6e5bb608fe

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_CloseJoystick@
foreign import ccall safe "hs_bindgen_ea0c624f184dccba"
  hs_bindgen_ea0c624f184dccba_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_CloseJoystick@
hs_bindgen_ea0c624f184dccba
  :: BG.Ptr SDL_Joystick
  -> IO ()
hs_bindgen_ea0c624f184dccba =
  BG.fromFFIType hs_bindgen_ea0c624f184dccba_base

-- | Close a joystick previously opened with @SDL_OpenJoystick()@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenJoystick'
--
--     [C declaration]: @SDL_CloseJoystick@, defined at @SDL3\/SDL_joystick.h 1340:34@
sDL_CloseJoystick
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick device to close.
  -> IO ()
sDL_CloseJoystick = hs_bindgen_ea0c624f184dccba

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickConnectionState@
foreign import ccall safe "hs_bindgen_08992afe945eb606"
  hs_bindgen_08992afe945eb606_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickConnectionState@
hs_bindgen_08992afe945eb606
  :: BG.Ptr SDL_Joystick
  -> IO SDL_JoystickConnectionState
hs_bindgen_08992afe945eb606 =
  BG.fromFFIType hs_bindgen_08992afe945eb606_base

-- | Get the connection state of a joystick.
--
--     [Returns]: the connection state on success or @SDL_JOYSTICK_CONNECTION_INVALID@ on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickConnectionState@, defined at @SDL3\/SDL_joystick.h 1354:57@
sDL_GetJoystickConnectionState
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to query.
  -> IO SDL_JoystickConnectionState
sDL_GetJoystickConnectionState =
  hs_bindgen_08992afe945eb606

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickPowerInfo@
foreign import ccall safe "hs_bindgen_8bfbd5889037e579"
  hs_bindgen_8bfbd5889037e579_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_Safe_SDL_GetJoystickPowerInfo@
hs_bindgen_8bfbd5889037e579
  :: BG.Ptr SDL_Joystick
  -> BG.Ptr BG.CInt
  -> IO SDL3.Sys.Bindgen.Power.SDL_PowerState
hs_bindgen_8bfbd5889037e579 =
  BG.fromFFIType hs_bindgen_8bfbd5889037e579_base

-- | Get the battery state of a joystick.
--
--     You should never take a battery status as absolute truth. Batteries (especially failing batteries) are delicate hardware, and the values reported here are best estimates based on what that hardware reports. It\'s not uncommon for older batteries to lose stored power much faster than it reports, or completely drain when reporting it has 20 percent left, etc.
--
--     [Returns]: the current battery state or @SDL_POWERSTATE_ERROR@ on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickPowerInfo@, defined at @SDL3\/SDL_joystick.h 1377:44@
sDL_GetJoystickPowerInfo
  :: BG.Ptr SDL_Joystick
  -- ^
  --
  --           [@joystick@]: the joystick to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@percent@]: a pointer filled in with the percentage of battery life left, between 0 and 100, or NULL to ignore. This will be filled in with -1 we can\'t determine a value or there is no battery.
  -> IO SDL3.Sys.Bindgen.Power.SDL_PowerState
sDL_GetJoystickPowerInfo =
  hs_bindgen_8bfbd5889037e579

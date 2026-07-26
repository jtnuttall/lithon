{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Joystick.FunPtr (
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_LockJoysticks,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_UnlockJoysticks,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_HasJoystick,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoysticks,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickNameForID,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickPathForID,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickPlayerIndexForID,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickGUIDForID,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickVendorForID,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickProductForID,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickProductVersionForID,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickTypeForID,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_OpenJoystick,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickFromID,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickFromPlayerIndex,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_AttachVirtualJoystick,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_DetachVirtualJoystick,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_IsJoystickVirtual,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_SetJoystickVirtualAxis,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_SetJoystickVirtualBall,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_SetJoystickVirtualButton,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_SetJoystickVirtualHat,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_SetJoystickVirtualTouchpad,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_SendJoystickVirtualSensorData,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickProperties,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickName,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickPath,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickPlayerIndex,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_SetJoystickPlayerIndex,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickGUID,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickVendor,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickProduct,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickProductVersion,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickFirmwareVersion,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickSerial,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickType,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickGUIDInfo,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_JoystickConnected,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickID,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetNumJoystickAxes,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetNumJoystickBalls,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetNumJoystickHats,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetNumJoystickButtons,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_SetJoystickEventsEnabled,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_JoystickEventsEnabled,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_UpdateJoysticks,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickAxis,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickAxisInitialState,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickBall,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickHat,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickButton,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_RumbleJoystick,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_RumbleJoystickTriggers,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_SetJoystickLED,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_SendJoystickEffect,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_CloseJoystick,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickConnectionState,
  SDL3.Sys.Bindgen.Joystick.FunPtr.sDL_GetJoystickPowerInfo,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_LockJoysticks */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_114e63986aa83034 (void)) (void)"
         , "{"
         , "  return &SDL_LockJoysticks;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_UnlockJoysticks */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_08af331be04bcfc6 (void)) (void)"
         , "{"
         , "  return &SDL_UnlockJoysticks;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_HasJoystick */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_43b30c46c7a64c3f (void)) (void)"
         , "{"
         , "  return &SDL_HasJoystick;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoysticks */"
         , "__attribute__ ((const))"
         , "SDL_JoystickID *(*hs_bindgen_8980d2e00276c32b (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoysticks;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickNameForID */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_609608d63d9b62ea (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickNameForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPathForID */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_5ac5dcd7fcf6852e (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickPathForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPlayerIndexForID */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_cba85122d2af347d (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickPlayerIndexForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickGUIDForID */"
         , "__attribute__ ((const))"
         , "SDL_GUID (*hs_bindgen_449e28b8e0e67e88 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickGUIDForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickVendorForID */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_44ce4b8a7fdf6cbf (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickVendorForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProductForID */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_820a9291485cee97 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickProductForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProductVersionForID */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_3a0e1d9bde47f0ff (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickProductVersionForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickTypeForID */"
         , "__attribute__ ((const))"
         , "SDL_JoystickType (*hs_bindgen_a20dfde681f6caa0 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickTypeForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_OpenJoystick */"
         , "__attribute__ ((const))"
         , "SDL_Joystick *(*hs_bindgen_c7b5fbf5268defc4 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_OpenJoystick;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickFromID */"
         , "__attribute__ ((const))"
         , "SDL_Joystick *(*hs_bindgen_e1dd196b7b6820f0 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickFromID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickFromPlayerIndex */"
         , "__attribute__ ((const))"
         , "SDL_Joystick *(*hs_bindgen_557bcf514d2319d8 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickFromPlayerIndex;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_AttachVirtualJoystick */"
         , "__attribute__ ((const))"
         , "SDL_JoystickID (*hs_bindgen_1ad626510c8533e6 (void)) ("
         , "  SDL_VirtualJoystickDesc const *arg1"
         , ")"
         , "{"
         , "  return &SDL_AttachVirtualJoystick;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_DetachVirtualJoystick */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_cce198ac8f90dd3d (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_DetachVirtualJoystick;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_IsJoystickVirtual */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f63774bb7235f389 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_IsJoystickVirtual;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualAxis */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_25ad7457e11fdfc6 (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  Sint16 arg3"
         , ")"
         , "{"
         , "  return &SDL_SetJoystickVirtualAxis;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualBall */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_883279d52c622be7 (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  Sint16 arg3,"
         , "  Sint16 arg4"
         , ")"
         , "{"
         , "  return &SDL_SetJoystickVirtualBall;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualButton */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c874e2ca8a04d63f (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return &SDL_SetJoystickVirtualButton;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualHat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c1356b5e756048fc (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  Uint8 arg3"
         , ")"
         , "{"
         , "  return &SDL_SetJoystickVirtualHat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualTouchpad */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_170b87771a92a148 (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  _Bool arg4,"
         , "  float arg5,"
         , "  float arg6,"
         , "  float arg7"
         , ")"
         , "{"
         , "  return &SDL_SetJoystickVirtualTouchpad;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SendJoystickVirtualSensorData */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_5c51fdc7918227aa (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  SDL_SensorType arg2,"
         , "  Uint64 arg3,"
         , "  float const *arg4,"
         , "  signed int arg5"
         , ")"
         , "{"
         , "  return &SDL_SendJoystickVirtualSensorData;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_9c72e51496d953ec (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_6d93bd8000de4d74 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPath */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_2e7828c53ff173b7 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickPath;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPlayerIndex */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_63f024097bd9c12b (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickPlayerIndex;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickPlayerIndex */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_258294b3081be5f1 (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_SetJoystickPlayerIndex;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickGUID */"
         , "__attribute__ ((const))"
         , "SDL_GUID (*hs_bindgen_aea836abf82f48b9 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickGUID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickVendor */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_9cd3279f0e0ca747 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickVendor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProduct */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_22acb36edfbd0e8c (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickProduct;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProductVersion */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_0bae3c3de11e8bcd (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickProductVersion;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickFirmwareVersion */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_38f91890f6c8dd34 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickFirmwareVersion;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickSerial */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_a8489b391d128726 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickSerial;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickType */"
         , "__attribute__ ((const))"
         , "SDL_JoystickType (*hs_bindgen_27fa723927645a5b (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickType;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickGUIDInfo */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_43f734d8766d207f (void)) ("
         , "  SDL_GUID arg1,"
         , "  Uint16 *arg2,"
         , "  Uint16 *arg3,"
         , "  Uint16 *arg4,"
         , "  Uint16 *arg5"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickGUIDInfo;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_JoystickConnected */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_34fe2e0cf303a75f (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_JoystickConnected;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickID */"
         , "__attribute__ ((const))"
         , "SDL_JoystickID (*hs_bindgen_db36c45c44877744 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetNumJoystickAxes */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_c743dc688bb6eabd (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetNumJoystickAxes;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetNumJoystickBalls */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_948af313b23a1c65 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetNumJoystickBalls;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetNumJoystickHats */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_2bfa757cb6822a72 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetNumJoystickHats;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetNumJoystickButtons */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_a91d035d49fdc8d2 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetNumJoystickButtons;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickEventsEnabled */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_33fbade22db04a59 (void)) ("
         , "  _Bool arg1"
         , ")"
         , "{"
         , "  return &SDL_SetJoystickEventsEnabled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_JoystickEventsEnabled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ddd93029215cfd37 (void)) (void)"
         , "{"
         , "  return &SDL_JoystickEventsEnabled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_UpdateJoysticks */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_fab2d264eddcaffa (void)) (void)"
         , "{"
         , "  return &SDL_UpdateJoysticks;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickAxis */"
         , "__attribute__ ((const))"
         , "Sint16 (*hs_bindgen_f60a6cb5f1d09a81 (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickAxis;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickAxisInitialState */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c09eb5cfd016adfb (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  Sint16 *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickAxisInitialState;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickBall */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ea4bd75fcfd7173a (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2,"
         , "  signed int *arg3,"
         , "  signed int *arg4"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickBall;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickHat */"
         , "__attribute__ ((const))"
         , "Uint8 (*hs_bindgen_79462e0207a041dd (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickHat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickButton */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8db4e8a6fc998c72 (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickButton;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_RumbleJoystick */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_01a69fecc103bd0a (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  Uint16 arg2,"
         , "  Uint16 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_RumbleJoystick;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_RumbleJoystickTriggers */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9190634ce5c1726f (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  Uint16 arg2,"
         , "  Uint16 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_RumbleJoystickTriggers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickLED */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a99b95fd254e2484 (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return &SDL_SetJoystickLED;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SendJoystickEffect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2552aba22a4e5237 (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  void const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_SendJoystickEffect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_CloseJoystick */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_85ce86bc3120d0c6 (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_CloseJoystick;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickConnectionState */"
         , "__attribute__ ((const))"
         , "SDL_JoystickConnectionState (*hs_bindgen_47061e113b50ffdc (void)) ("
         , "  SDL_Joystick *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickConnectionState;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPowerInfo */"
         , "__attribute__ ((const))"
         , "SDL_PowerState (*hs_bindgen_cf314c27d59c09a1 (void)) ("
         , "  SDL_Joystick *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetJoystickPowerInfo;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_LockJoysticks@
foreign import ccall unsafe "hs_bindgen_114e63986aa83034"
  hs_bindgen_114e63986aa83034_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_LockJoysticks@
hs_bindgen_114e63986aa83034 :: IO (BG.FunPtr (IO ()))
hs_bindgen_114e63986aa83034 =
  BG.fromFFIType hs_bindgen_114e63986aa83034_base

{-# NOINLINE sDL_LockJoysticks #-}

-- | Locking for atomic access to the joystick API.
--
--     The SDL joystick functions are thread-safe, however you can lock the joysticks while processing to guarantee that the joystick list won\'t change and joystick and gamepad events will not be delivered.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_LockJoysticks@, defined at @SDL3\/SDL_joystick.h 189:34@
sDL_LockJoysticks :: BG.FunPtr (IO ())
sDL_LockJoysticks =
  BG.unsafePerformIO hs_bindgen_114e63986aa83034

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_UnlockJoysticks@
foreign import ccall unsafe "hs_bindgen_08af331be04bcfc6"
  hs_bindgen_08af331be04bcfc6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_UnlockJoysticks@
hs_bindgen_08af331be04bcfc6 :: IO (BG.FunPtr (IO ()))
hs_bindgen_08af331be04bcfc6 =
  BG.fromFFIType hs_bindgen_08af331be04bcfc6_base

{-# NOINLINE sDL_UnlockJoysticks #-}

-- | Unlocking for atomic access to the joystick API.
--
--     [Thread safety]: This should be called from the same thread that called @SDL_LockJoysticks()@.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UnlockJoysticks@, defined at @SDL3\/SDL_joystick.h 199:34@
sDL_UnlockJoysticks :: BG.FunPtr (IO ())
sDL_UnlockJoysticks =
  BG.unsafePerformIO hs_bindgen_08af331be04bcfc6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_HasJoystick@
foreign import ccall unsafe "hs_bindgen_43b30c46c7a64c3f"
  hs_bindgen_43b30c46c7a64c3f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_HasJoystick@
hs_bindgen_43b30c46c7a64c3f :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_43b30c46c7a64c3f =
  BG.fromFFIType hs_bindgen_43b30c46c7a64c3f_base

{-# NOINLINE sDL_HasJoystick #-}

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
sDL_HasJoystick :: BG.FunPtr (IO BG.CBool)
sDL_HasJoystick =
  BG.unsafePerformIO hs_bindgen_43b30c46c7a64c3f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoysticks@
foreign import ccall unsafe "hs_bindgen_8980d2e00276c32b"
  hs_bindgen_8980d2e00276c32b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoysticks@
hs_bindgen_8980d2e00276c32b :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_JoystickID)))
hs_bindgen_8980d2e00276c32b =
  BG.fromFFIType hs_bindgen_8980d2e00276c32b_base

{-# NOINLINE sDL_GetJoysticks #-}

-- | Get a list of currently connected joysticks.
--
--     [@count@]: a pointer filled in with the number of joysticks returned, may be NULL.
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
sDL_GetJoysticks :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_JoystickID))
sDL_GetJoysticks =
  BG.unsafePerformIO hs_bindgen_8980d2e00276c32b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickNameForID@
foreign import ccall unsafe "hs_bindgen_609608d63d9b62ea"
  hs_bindgen_609608d63d9b62ea_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickNameForID@
hs_bindgen_609608d63d9b62ea :: IO (BG.FunPtr (SDL_JoystickID -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_609608d63d9b62ea =
  BG.fromFFIType hs_bindgen_609608d63d9b62ea_base

{-# NOINLINE sDL_GetJoystickNameForID #-}

-- | Get the implementation dependent name of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [@instance_id@]: the joystick instance ID.
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
sDL_GetJoystickNameForID :: BG.FunPtr (SDL_JoystickID -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetJoystickNameForID =
  BG.unsafePerformIO hs_bindgen_609608d63d9b62ea

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPathForID@
foreign import ccall unsafe "hs_bindgen_5ac5dcd7fcf6852e"
  hs_bindgen_5ac5dcd7fcf6852e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPathForID@
hs_bindgen_5ac5dcd7fcf6852e :: IO (BG.FunPtr (SDL_JoystickID -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_5ac5dcd7fcf6852e =
  BG.fromFFIType hs_bindgen_5ac5dcd7fcf6852e_base

{-# NOINLINE sDL_GetJoystickPathForID #-}

-- | Get the implementation dependent path of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [@instance_id@]: the joystick instance ID.
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
sDL_GetJoystickPathForID :: BG.FunPtr (SDL_JoystickID -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetJoystickPathForID =
  BG.unsafePerformIO hs_bindgen_5ac5dcd7fcf6852e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPlayerIndexForID@
foreign import ccall unsafe "hs_bindgen_cba85122d2af347d"
  hs_bindgen_cba85122d2af347d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPlayerIndexForID@
hs_bindgen_cba85122d2af347d :: IO (BG.FunPtr (SDL_JoystickID -> IO BG.CInt))
hs_bindgen_cba85122d2af347d =
  BG.fromFFIType hs_bindgen_cba85122d2af347d_base

{-# NOINLINE sDL_GetJoystickPlayerIndexForID #-}

-- | Get the player index of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [@instance_id@]: the joystick instance ID.
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
sDL_GetJoystickPlayerIndexForID :: BG.FunPtr (SDL_JoystickID -> IO BG.CInt)
sDL_GetJoystickPlayerIndexForID =
  BG.unsafePerformIO hs_bindgen_cba85122d2af347d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickGUIDForID@
foreign import ccall unsafe "hs_bindgen_449e28b8e0e67e88"
  hs_bindgen_449e28b8e0e67e88_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickGUIDForID@
hs_bindgen_449e28b8e0e67e88 :: IO (BG.FunPtr (SDL_JoystickID -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID))
hs_bindgen_449e28b8e0e67e88 =
  BG.fromFFIType hs_bindgen_449e28b8e0e67e88_base

{-# NOINLINE sDL_GetJoystickGUIDForID #-}

-- | Get the implementation-dependent GUID of a joystick.
--
--     This can be called before any joysticks are opened.
--
--     [@instance_id@]: the joystick instance ID.
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
sDL_GetJoystickGUIDForID :: BG.FunPtr (SDL_JoystickID -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID)
sDL_GetJoystickGUIDForID =
  BG.unsafePerformIO hs_bindgen_449e28b8e0e67e88

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickVendorForID@
foreign import ccall unsafe "hs_bindgen_44ce4b8a7fdf6cbf"
  hs_bindgen_44ce4b8a7fdf6cbf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickVendorForID@
hs_bindgen_44ce4b8a7fdf6cbf :: IO (BG.FunPtr (SDL_JoystickID -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_44ce4b8a7fdf6cbf =
  BG.fromFFIType hs_bindgen_44ce4b8a7fdf6cbf_base

{-# NOINLINE sDL_GetJoystickVendorForID #-}

-- | Get the USB vendor ID of a joystick, if available.
--
--     This can be called before any joysticks are opened. If the vendor ID isn\'t available this function returns 0.
--
--     [@instance_id@]: the joystick instance ID.
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
sDL_GetJoystickVendorForID :: BG.FunPtr (SDL_JoystickID -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetJoystickVendorForID =
  BG.unsafePerformIO hs_bindgen_44ce4b8a7fdf6cbf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProductForID@
foreign import ccall unsafe "hs_bindgen_820a9291485cee97"
  hs_bindgen_820a9291485cee97_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProductForID@
hs_bindgen_820a9291485cee97 :: IO (BG.FunPtr (SDL_JoystickID -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_820a9291485cee97 =
  BG.fromFFIType hs_bindgen_820a9291485cee97_base

{-# NOINLINE sDL_GetJoystickProductForID #-}

-- | Get the USB product ID of a joystick, if available.
--
--     This can be called before any joysticks are opened. If the product ID isn\'t available this function returns 0.
--
--     [@instance_id@]: the joystick instance ID.
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
sDL_GetJoystickProductForID :: BG.FunPtr (SDL_JoystickID -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetJoystickProductForID =
  BG.unsafePerformIO hs_bindgen_820a9291485cee97

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProductVersionForID@
foreign import ccall unsafe "hs_bindgen_3a0e1d9bde47f0ff"
  hs_bindgen_3a0e1d9bde47f0ff_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProductVersionForID@
hs_bindgen_3a0e1d9bde47f0ff :: IO (BG.FunPtr (SDL_JoystickID -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_3a0e1d9bde47f0ff =
  BG.fromFFIType hs_bindgen_3a0e1d9bde47f0ff_base

{-# NOINLINE sDL_GetJoystickProductVersionForID #-}

-- | Get the product version of a joystick, if available.
--
--     This can be called before any joysticks are opened. If the product version isn\'t available this function returns 0.
--
--     [@instance_id@]: the joystick instance ID.
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
  :: BG.FunPtr (SDL_JoystickID -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetJoystickProductVersionForID =
  BG.unsafePerformIO hs_bindgen_3a0e1d9bde47f0ff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickTypeForID@
foreign import ccall unsafe "hs_bindgen_a20dfde681f6caa0"
  hs_bindgen_a20dfde681f6caa0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickTypeForID@
hs_bindgen_a20dfde681f6caa0 :: IO (BG.FunPtr (SDL_JoystickID -> IO SDL_JoystickType))
hs_bindgen_a20dfde681f6caa0 =
  BG.fromFFIType hs_bindgen_a20dfde681f6caa0_base

{-# NOINLINE sDL_GetJoystickTypeForID #-}

-- | Get the type of a joystick, if available.
--
--     This can be called before any joysticks are opened.
--
--     [@instance_id@]: the joystick instance ID.
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
sDL_GetJoystickTypeForID :: BG.FunPtr (SDL_JoystickID -> IO SDL_JoystickType)
sDL_GetJoystickTypeForID =
  BG.unsafePerformIO hs_bindgen_a20dfde681f6caa0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_OpenJoystick@
foreign import ccall unsafe "hs_bindgen_c7b5fbf5268defc4"
  hs_bindgen_c7b5fbf5268defc4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_OpenJoystick@
hs_bindgen_c7b5fbf5268defc4 :: IO (BG.FunPtr (SDL_JoystickID -> IO (BG.Ptr SDL_Joystick)))
hs_bindgen_c7b5fbf5268defc4 =
  BG.fromFFIType hs_bindgen_c7b5fbf5268defc4_base

{-# NOINLINE sDL_OpenJoystick #-}

-- | Open a joystick for use.
--
--     The joystick subsystem must be initialized before a joystick can be opened for use.
--
--     [@instance_id@]: the joystick instance ID.
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
sDL_OpenJoystick :: BG.FunPtr (SDL_JoystickID -> IO (BG.Ptr SDL_Joystick))
sDL_OpenJoystick =
  BG.unsafePerformIO hs_bindgen_c7b5fbf5268defc4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickFromID@
foreign import ccall unsafe "hs_bindgen_e1dd196b7b6820f0"
  hs_bindgen_e1dd196b7b6820f0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickFromID@
hs_bindgen_e1dd196b7b6820f0 :: IO (BG.FunPtr (SDL_JoystickID -> IO (BG.Ptr SDL_Joystick)))
hs_bindgen_e1dd196b7b6820f0 =
  BG.fromFFIType hs_bindgen_e1dd196b7b6820f0_base

{-# NOINLINE sDL_GetJoystickFromID #-}

-- | Get the 'SDL_Joystick' associated with an instance ID, if it has been opened.
--
--     [@instance_id@]: the instance ID to get the 'SDL_Joystick' for.
--
--     [Returns]: an 'SDL_Joystick' on success or NULL on failure or if it hasn\'t been opened yet; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickFromID@, defined at @SDL3\/SDL_joystick.h 408:44@
sDL_GetJoystickFromID :: BG.FunPtr (SDL_JoystickID -> IO (BG.Ptr SDL_Joystick))
sDL_GetJoystickFromID =
  BG.unsafePerformIO hs_bindgen_e1dd196b7b6820f0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickFromPlayerIndex@
foreign import ccall unsafe "hs_bindgen_557bcf514d2319d8"
  hs_bindgen_557bcf514d2319d8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickFromPlayerIndex@
hs_bindgen_557bcf514d2319d8 :: IO (BG.FunPtr (BG.CInt -> IO (BG.Ptr SDL_Joystick)))
hs_bindgen_557bcf514d2319d8 =
  BG.fromFFIType hs_bindgen_557bcf514d2319d8_base

{-# NOINLINE sDL_GetJoystickFromPlayerIndex #-}

-- | Get the 'SDL_Joystick' associated with a player index.
--
--     [@player_index@]: the player index to get the 'SDL_Joystick' for.
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
sDL_GetJoystickFromPlayerIndex :: BG.FunPtr (BG.CInt -> IO (BG.Ptr SDL_Joystick))
sDL_GetJoystickFromPlayerIndex =
  BG.unsafePerformIO hs_bindgen_557bcf514d2319d8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_AttachVirtualJoystick@
foreign import ccall unsafe "hs_bindgen_1ad626510c8533e6"
  hs_bindgen_1ad626510c8533e6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_AttachVirtualJoystick@
hs_bindgen_1ad626510c8533e6
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL_VirtualJoystickDesc -> IO SDL_JoystickID))
hs_bindgen_1ad626510c8533e6 =
  BG.fromFFIType hs_bindgen_1ad626510c8533e6_base

{-# NOINLINE sDL_AttachVirtualJoystick #-}

-- | Attach a new virtual joystick.
--
--     Apps can create virtual joysticks, that exist without hardware directly backing them, and have program-supplied inputs. Once attached, a virtual joystick looks like any other joystick that SDL can access. These can be used to make other things look like joysticks, or provide pre-recorded input, etc.
--
--     Once attached, the app can send joystick inputs to the new virtual joystick using @SDL_SetJoystickVirtualAxis()@, etc.
--
--     When no longer needed, the virtual joystick can be removed by calling @SDL_DetachVirtualJoystick()@.
--
--     [@desc@]: joystick description, initialized using SDL_INIT_INTERFACE().
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
  :: BG.FunPtr (PtrConst.PtrConst SDL_VirtualJoystickDesc -> IO SDL_JoystickID)
sDL_AttachVirtualJoystick =
  BG.unsafePerformIO hs_bindgen_1ad626510c8533e6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_DetachVirtualJoystick@
foreign import ccall unsafe "hs_bindgen_cce198ac8f90dd3d"
  hs_bindgen_cce198ac8f90dd3d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_DetachVirtualJoystick@
hs_bindgen_cce198ac8f90dd3d :: IO (BG.FunPtr (SDL_JoystickID -> IO BG.CBool))
hs_bindgen_cce198ac8f90dd3d =
  BG.fromFFIType hs_bindgen_cce198ac8f90dd3d_base

{-# NOINLINE sDL_DetachVirtualJoystick #-}

-- | Detach a virtual joystick.
--
--     [@instance_id@]: the joystick instance ID, previously returned from @SDL_AttachVirtualJoystick()@.
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
sDL_DetachVirtualJoystick :: BG.FunPtr (SDL_JoystickID -> IO BG.CBool)
sDL_DetachVirtualJoystick =
  BG.unsafePerformIO hs_bindgen_cce198ac8f90dd3d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_IsJoystickVirtual@
foreign import ccall unsafe "hs_bindgen_f63774bb7235f389"
  hs_bindgen_f63774bb7235f389_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_IsJoystickVirtual@
hs_bindgen_f63774bb7235f389 :: IO (BG.FunPtr (SDL_JoystickID -> IO BG.CBool))
hs_bindgen_f63774bb7235f389 =
  BG.fromFFIType hs_bindgen_f63774bb7235f389_base

{-# NOINLINE sDL_IsJoystickVirtual #-}

-- | Query whether or not a joystick is virtual.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: true if the joystick is virtual, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_IsJoystickVirtual@, defined at @SDL3\/SDL_joystick.h 567:34@
sDL_IsJoystickVirtual :: BG.FunPtr (SDL_JoystickID -> IO BG.CBool)
sDL_IsJoystickVirtual =
  BG.unsafePerformIO hs_bindgen_f63774bb7235f389

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualAxis@
foreign import ccall unsafe "hs_bindgen_25ad7457e11fdfc6"
  hs_bindgen_25ad7457e11fdfc6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualAxis@
hs_bindgen_25ad7457e11fdfc6
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> SDL3.Sys.Bindgen.Stdinc.Sint16 -> IO BG.CBool))
hs_bindgen_25ad7457e11fdfc6 =
  BG.fromFFIType hs_bindgen_25ad7457e11fdfc6_base

{-# NOINLINE sDL_SetJoystickVirtualAxis #-}

-- | Set the state of an axis on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to SDL_UpdateJoysticks, which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout, SDL_WaitEvent.
--
--     Note that when sending trigger axes, you should scale the value to the full range of Sint16. For example, a trigger at rest would have the value of @'sDL_JOYSTICK_AXIS_MIN'@.
--
--     [@joystick@]: the virtual joystick on which to set state.
--
--     [@axis@]: the index of the axis on the virtual joystick to update.
--
--     [@value@]: the new value for the specified axis.
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
  :: BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> SDL3.Sys.Bindgen.Stdinc.Sint16 -> IO BG.CBool)
sDL_SetJoystickVirtualAxis =
  BG.unsafePerformIO hs_bindgen_25ad7457e11fdfc6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualBall@
foreign import ccall unsafe "hs_bindgen_883279d52c622be7"
  hs_bindgen_883279d52c622be7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualBall@
hs_bindgen_883279d52c622be7
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Joystick
             -> BG.CInt
             -> SDL3.Sys.Bindgen.Stdinc.Sint16
             -> SDL3.Sys.Bindgen.Stdinc.Sint16
             -> IO BG.CBool
           )
       )
hs_bindgen_883279d52c622be7 =
  BG.fromFFIType hs_bindgen_883279d52c622be7_base

{-# NOINLINE sDL_SetJoystickVirtualBall #-}

-- | Generate ball motion on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to SDL_UpdateJoysticks, which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout, SDL_WaitEvent.
--
--     [@joystick@]: the virtual joystick on which to set state.
--
--     [@ball@]: the index of the ball on the virtual joystick to update.
--
--     [@xrel@]: the relative motion on the X axis.
--
--     [@yrel@]: the relative motion on the Y axis.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Joystick
         -> BG.CInt
         -> SDL3.Sys.Bindgen.Stdinc.Sint16
         -> SDL3.Sys.Bindgen.Stdinc.Sint16
         -> IO BG.CBool
       )
sDL_SetJoystickVirtualBall =
  BG.unsafePerformIO hs_bindgen_883279d52c622be7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualButton@
foreign import ccall unsafe "hs_bindgen_c874e2ca8a04d63f"
  hs_bindgen_c874e2ca8a04d63f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualButton@
hs_bindgen_c874e2ca8a04d63f
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> BG.CBool -> IO BG.CBool))
hs_bindgen_c874e2ca8a04d63f =
  BG.fromFFIType hs_bindgen_c874e2ca8a04d63f_base

{-# NOINLINE sDL_SetJoystickVirtualButton #-}

-- | Set the state of a button on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to SDL_UpdateJoysticks, which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout, SDL_WaitEvent.
--
--     [@joystick@]: the virtual joystick on which to set state.
--
--     [@button@]: the index of the button on the virtual joystick to update.
--
--     [@down@]: true if the button is pressed, false otherwise.
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
  :: BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> BG.CBool -> IO BG.CBool)
sDL_SetJoystickVirtualButton =
  BG.unsafePerformIO hs_bindgen_c874e2ca8a04d63f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualHat@
foreign import ccall unsafe "hs_bindgen_c1356b5e756048fc"
  hs_bindgen_c1356b5e756048fc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualHat@
hs_bindgen_c1356b5e756048fc
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool))
hs_bindgen_c1356b5e756048fc =
  BG.fromFFIType hs_bindgen_c1356b5e756048fc_base

{-# NOINLINE sDL_SetJoystickVirtualHat #-}

-- | Set the state of a hat on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to SDL_UpdateJoysticks, which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout, SDL_WaitEvent.
--
--     [@joystick@]: the virtual joystick on which to set state.
--
--     [@hat@]: the index of the hat on the virtual joystick to update.
--
--     [@value@]: the new value for the specified hat.
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
  :: BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool)
sDL_SetJoystickVirtualHat =
  BG.unsafePerformIO hs_bindgen_c1356b5e756048fc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualTouchpad@
foreign import ccall unsafe "hs_bindgen_170b87771a92a148"
  hs_bindgen_170b87771a92a148_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickVirtualTouchpad@
hs_bindgen_170b87771a92a148
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Joystick
             -> BG.CInt
             -> BG.CInt
             -> BG.CBool
             -> BG.CFloat
             -> BG.CFloat
             -> BG.CFloat
             -> IO BG.CBool
           )
       )
hs_bindgen_170b87771a92a148 =
  BG.fromFFIType hs_bindgen_170b87771a92a148_base

{-# NOINLINE sDL_SetJoystickVirtualTouchpad #-}

-- | Set touchpad finger state on an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to SDL_UpdateJoysticks, which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout, SDL_WaitEvent.
--
--     [@joystick@]: the virtual joystick on which to set state.
--
--     [@touchpad@]: the index of the touchpad on the virtual joystick to update.
--
--     [@finger@]: the index of the finger on the touchpad to set.
--
--     [@down@]: true if the finger is pressed, false if the finger is released.
--
--     [@x@]: the x coordinate of the finger on the touchpad, normalized 0 to 1, with the origin in the upper left.
--
--     [@y@]: the y coordinate of the finger on the touchpad, normalized 0 to 1, with the origin in the upper left.
--
--     [@pressure@]: the pressure of the finger.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Joystick
         -> BG.CInt
         -> BG.CInt
         -> BG.CBool
         -> BG.CFloat
         -> BG.CFloat
         -> BG.CFloat
         -> IO BG.CBool
       )
sDL_SetJoystickVirtualTouchpad =
  BG.unsafePerformIO hs_bindgen_170b87771a92a148

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SendJoystickVirtualSensorData@
foreign import ccall unsafe "hs_bindgen_5c51fdc7918227aa"
  hs_bindgen_5c51fdc7918227aa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SendJoystickVirtualSensorData@
hs_bindgen_5c51fdc7918227aa
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Joystick
             -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
             -> SDL3.Sys.Bindgen.Stdinc.Uint64
             -> PtrConst.PtrConst BG.CFloat
             -> BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_5c51fdc7918227aa =
  BG.fromFFIType hs_bindgen_5c51fdc7918227aa_base

{-# NOINLINE sDL_SendJoystickVirtualSensorData #-}

-- | Send a sensor update for an opened virtual joystick.
--
--     Please note that values set here will not be applied until the next call to SDL_UpdateJoysticks, which can either be called directly, or can be called indirectly through various other SDL APIs, including, but not limited to the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout, SDL_WaitEvent.
--
--     [@joystick@]: the virtual joystick on which to set state.
--
--     [@type@]: the type of the sensor on the virtual joystick to update.
--
--     [@sensor_timestamp@]: a 64-bit timestamp in nanoseconds associated with the sensor reading.
--
--     [@data@]: the data associated with the sensor reading.
--
--     [@num_values@]: the number of values pointed to by @data@.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Joystick
         -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
         -> SDL3.Sys.Bindgen.Stdinc.Uint64
         -> PtrConst.PtrConst BG.CFloat
         -> BG.CInt
         -> IO BG.CBool
       )
sDL_SendJoystickVirtualSensorData =
  BG.unsafePerformIO hs_bindgen_5c51fdc7918227aa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProperties@
foreign import ccall unsafe "hs_bindgen_9c72e51496d953ec"
  hs_bindgen_9c72e51496d953ec_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProperties@
hs_bindgen_9c72e51496d953ec
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_9c72e51496d953ec =
  BG.fromFFIType hs_bindgen_9c72e51496d953ec_base

{-# NOINLINE sDL_GetJoystickProperties #-}

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
--     [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickProperties@, defined at @SDL3\/SDL_joystick.h 770:46@
sDL_GetJoystickProperties
  :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetJoystickProperties =
  BG.unsafePerformIO hs_bindgen_9c72e51496d953ec

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickName@
foreign import ccall unsafe "hs_bindgen_6d93bd8000de4d74"
  hs_bindgen_6d93bd8000de4d74_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickName@
hs_bindgen_6d93bd8000de4d74
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_6d93bd8000de4d74 =
  BG.fromFFIType hs_bindgen_6d93bd8000de4d74_base

{-# NOINLINE sDL_GetJoystickName #-}

-- | Get the implementation dependent name of a joystick.
--
--     [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
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
sDL_GetJoystickName :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetJoystickName =
  BG.unsafePerformIO hs_bindgen_6d93bd8000de4d74

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPath@
foreign import ccall unsafe "hs_bindgen_2e7828c53ff173b7"
  hs_bindgen_2e7828c53ff173b7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPath@
hs_bindgen_2e7828c53ff173b7
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_2e7828c53ff173b7 =
  BG.fromFFIType hs_bindgen_2e7828c53ff173b7_base

{-# NOINLINE sDL_GetJoystickPath #-}

-- | Get the implementation dependent path of a joystick.
--
--     [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
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
sDL_GetJoystickPath :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetJoystickPath =
  BG.unsafePerformIO hs_bindgen_2e7828c53ff173b7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPlayerIndex@
foreign import ccall unsafe "hs_bindgen_63f024097bd9c12b"
  hs_bindgen_63f024097bd9c12b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPlayerIndex@
hs_bindgen_63f024097bd9c12b :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO BG.CInt))
hs_bindgen_63f024097bd9c12b =
  BG.fromFFIType hs_bindgen_63f024097bd9c12b_base

{-# NOINLINE sDL_GetJoystickPlayerIndex #-}

-- | Get the player index of an opened joystick.
--
--     For XInput controllers this returns the XInput user index. Many joysticks will not be able to supply this information.
--
--     [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
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
sDL_GetJoystickPlayerIndex :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO BG.CInt)
sDL_GetJoystickPlayerIndex =
  BG.unsafePerformIO hs_bindgen_63f024097bd9c12b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickPlayerIndex@
foreign import ccall unsafe "hs_bindgen_258294b3081be5f1"
  hs_bindgen_258294b3081be5f1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickPlayerIndex@
hs_bindgen_258294b3081be5f1 :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> IO BG.CBool))
hs_bindgen_258294b3081be5f1 =
  BG.fromFFIType hs_bindgen_258294b3081be5f1_base

{-# NOINLINE sDL_SetJoystickPlayerIndex #-}

-- | Set the player index of an opened joystick.
--
--     [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
--
--     [@player_index@]: player index to assign to this joystick, or -1 to clear the player index and turn off player LEDs.
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
sDL_SetJoystickPlayerIndex :: BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> IO BG.CBool)
sDL_SetJoystickPlayerIndex =
  BG.unsafePerformIO hs_bindgen_258294b3081be5f1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickGUID@
foreign import ccall unsafe "hs_bindgen_aea836abf82f48b9"
  hs_bindgen_aea836abf82f48b9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickGUID@
hs_bindgen_aea836abf82f48b9
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID))
hs_bindgen_aea836abf82f48b9 =
  BG.fromFFIType hs_bindgen_aea836abf82f48b9_base

{-# NOINLINE sDL_GetJoystickGUID #-}

-- | Get the implementation-dependent GUID for the joystick.
--
--     This function requires an open joystick.
--
--     [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
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
sDL_GetJoystickGUID :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID)
sDL_GetJoystickGUID =
  BG.unsafePerformIO hs_bindgen_aea836abf82f48b9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickVendor@
foreign import ccall unsafe "hs_bindgen_9cd3279f0e0ca747"
  hs_bindgen_9cd3279f0e0ca747_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickVendor@
hs_bindgen_9cd3279f0e0ca747
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_9cd3279f0e0ca747 =
  BG.fromFFIType hs_bindgen_9cd3279f0e0ca747_base

{-# NOINLINE sDL_GetJoystickVendor #-}

-- | Get the USB vendor ID of an opened joystick, if available.
--
--     If the vendor ID isn\'t available this function returns 0.
--
--     [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
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
sDL_GetJoystickVendor :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetJoystickVendor =
  BG.unsafePerformIO hs_bindgen_9cd3279f0e0ca747

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProduct@
foreign import ccall unsafe "hs_bindgen_22acb36edfbd0e8c"
  hs_bindgen_22acb36edfbd0e8c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProduct@
hs_bindgen_22acb36edfbd0e8c
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_22acb36edfbd0e8c =
  BG.fromFFIType hs_bindgen_22acb36edfbd0e8c_base

{-# NOINLINE sDL_GetJoystickProduct #-}

-- | Get the USB product ID of an opened joystick, if available.
--
--     If the product ID isn\'t available this function returns 0.
--
--     [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
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
sDL_GetJoystickProduct :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetJoystickProduct =
  BG.unsafePerformIO hs_bindgen_22acb36edfbd0e8c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProductVersion@
foreign import ccall unsafe "hs_bindgen_0bae3c3de11e8bcd"
  hs_bindgen_0bae3c3de11e8bcd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickProductVersion@
hs_bindgen_0bae3c3de11e8bcd
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_0bae3c3de11e8bcd =
  BG.fromFFIType hs_bindgen_0bae3c3de11e8bcd_base

{-# NOINLINE sDL_GetJoystickProductVersion #-}

-- | Get the product version of an opened joystick, if available.
--
--     If the product version isn\'t available this function returns 0.
--
--     [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
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
  :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetJoystickProductVersion =
  BG.unsafePerformIO hs_bindgen_0bae3c3de11e8bcd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickFirmwareVersion@
foreign import ccall unsafe "hs_bindgen_38f91890f6c8dd34"
  hs_bindgen_38f91890f6c8dd34_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickFirmwareVersion@
hs_bindgen_38f91890f6c8dd34
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_38f91890f6c8dd34 =
  BG.fromFFIType hs_bindgen_38f91890f6c8dd34_base

{-# NOINLINE sDL_GetJoystickFirmwareVersion #-}

-- | Get the firmware version of an opened joystick, if available.
--
--     If the firmware version isn\'t available this function returns 0.
--
--     [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
--
--     [Returns]: the firmware version of the selected joystick, or 0 if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickFirmwareVersion@, defined at @SDL3\/SDL_joystick.h 922:36@
sDL_GetJoystickFirmwareVersion
  :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetJoystickFirmwareVersion =
  BG.unsafePerformIO hs_bindgen_38f91890f6c8dd34

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickSerial@
foreign import ccall unsafe "hs_bindgen_a8489b391d128726"
  hs_bindgen_a8489b391d128726_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickSerial@
hs_bindgen_a8489b391d128726
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_a8489b391d128726 =
  BG.fromFFIType hs_bindgen_a8489b391d128726_base

{-# NOINLINE sDL_GetJoystickSerial #-}

-- | Get the serial number of an opened joystick, if available.
--
--     Returns the serial number of the joystick, or NULL if it is not available.
--
--     [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
--
--     [Returns]: the serial number of the selected joystick, or NULL if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickSerial@, defined at @SDL3\/SDL_joystick.h 937:42@
sDL_GetJoystickSerial :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetJoystickSerial =
  BG.unsafePerformIO hs_bindgen_a8489b391d128726

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickType@
foreign import ccall unsafe "hs_bindgen_27fa723927645a5b"
  hs_bindgen_27fa723927645a5b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickType@
hs_bindgen_27fa723927645a5b :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL_JoystickType))
hs_bindgen_27fa723927645a5b =
  BG.fromFFIType hs_bindgen_27fa723927645a5b_base

{-# NOINLINE sDL_GetJoystickType #-}

-- | Get the type of an opened joystick.
--
--     [@joystick@]: the 'SDL_Joystick' obtained from @SDL_OpenJoystick()@.
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
sDL_GetJoystickType :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL_JoystickType)
sDL_GetJoystickType =
  BG.unsafePerformIO hs_bindgen_27fa723927645a5b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickGUIDInfo@
foreign import ccall unsafe "hs_bindgen_43f734d8766d207f"
  hs_bindgen_43f734d8766d207f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickGUIDInfo@
hs_bindgen_43f734d8766d207f
  :: IO
       ( BG.FunPtr
           ( SDL3.Sys.Bindgen.Guid.SDL_GUID
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
             -> IO ()
           )
       )
hs_bindgen_43f734d8766d207f =
  BG.fromFFIType hs_bindgen_43f734d8766d207f_base

{-# NOINLINE sDL_GetJoystickGUIDInfo #-}

-- | Get the device information encoded in a SDL_GUID structure.
--
--     [@guid@]: the SDL_GUID you wish to get info about.
--
--     [@vendor@]: a pointer filled in with the device VID, or 0 if not available.
--
--     [@product@]: a pointer filled in with the device PID, or 0 if not available.
--
--     [@version@]: a pointer filled in with the device version, or 0 if not available.
--
--     [@crc16@]: a pointer filled in with a CRC used to distinguish different products with the same VID\/PID, or 0 if not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetJoystickGUIDForID'
--
--     [C declaration]: @SDL_GetJoystickGUIDInfo@, defined at @SDL3\/SDL_joystick.h 972:34@
sDL_GetJoystickGUIDInfo
  :: BG.FunPtr
       ( SDL3.Sys.Bindgen.Guid.SDL_GUID
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
         -> IO ()
       )
sDL_GetJoystickGUIDInfo =
  BG.unsafePerformIO hs_bindgen_43f734d8766d207f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_JoystickConnected@
foreign import ccall unsafe "hs_bindgen_34fe2e0cf303a75f"
  hs_bindgen_34fe2e0cf303a75f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_JoystickConnected@
hs_bindgen_34fe2e0cf303a75f :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO BG.CBool))
hs_bindgen_34fe2e0cf303a75f =
  BG.fromFFIType hs_bindgen_34fe2e0cf303a75f_base

{-# NOINLINE sDL_JoystickConnected #-}

-- | Get the status of a specified joystick.
--
--     [@joystick@]: the joystick to query.
--
--     [Returns]: true if the joystick has been opened, false if it has not; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_JoystickConnected@, defined at @SDL3\/SDL_joystick.h 985:34@
sDL_JoystickConnected :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO BG.CBool)
sDL_JoystickConnected =
  BG.unsafePerformIO hs_bindgen_34fe2e0cf303a75f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickID@
foreign import ccall unsafe "hs_bindgen_db36c45c44877744"
  hs_bindgen_db36c45c44877744_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickID@
hs_bindgen_db36c45c44877744 :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL_JoystickID))
hs_bindgen_db36c45c44877744 =
  BG.fromFFIType hs_bindgen_db36c45c44877744_base

{-# NOINLINE sDL_GetJoystickID #-}

-- | Get the instance ID of an opened joystick.
--
--     [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
--
--     [Returns]: the instance ID of the specified joystick on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickID@, defined at @SDL3\/SDL_joystick.h 998:44@
sDL_GetJoystickID :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL_JoystickID)
sDL_GetJoystickID =
  BG.unsafePerformIO hs_bindgen_db36c45c44877744

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetNumJoystickAxes@
foreign import ccall unsafe "hs_bindgen_c743dc688bb6eabd"
  hs_bindgen_c743dc688bb6eabd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetNumJoystickAxes@
hs_bindgen_c743dc688bb6eabd :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO BG.CInt))
hs_bindgen_c743dc688bb6eabd =
  BG.fromFFIType hs_bindgen_c743dc688bb6eabd_base

{-# NOINLINE sDL_GetNumJoystickAxes #-}

-- | Get the number of general axis controls on a joystick.
--
--     Often, the directional pad on a game controller will either look like 4 separate buttons or a POV hat, and not axes, but all of this is up to the device and platform.
--
--     [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
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
sDL_GetNumJoystickAxes :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO BG.CInt)
sDL_GetNumJoystickAxes =
  BG.unsafePerformIO hs_bindgen_c743dc688bb6eabd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetNumJoystickBalls@
foreign import ccall unsafe "hs_bindgen_948af313b23a1c65"
  hs_bindgen_948af313b23a1c65_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetNumJoystickBalls@
hs_bindgen_948af313b23a1c65 :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO BG.CInt))
hs_bindgen_948af313b23a1c65 =
  BG.fromFFIType hs_bindgen_948af313b23a1c65_base

{-# NOINLINE sDL_GetNumJoystickBalls #-}

-- | Get the number of trackballs on a joystick.
--
--     Joystick trackballs have only relative motion events associated with them and their state cannot be polled.
--
--     Most joysticks do not have trackballs.
--
--     [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
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
sDL_GetNumJoystickBalls :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO BG.CInt)
sDL_GetNumJoystickBalls =
  BG.unsafePerformIO hs_bindgen_948af313b23a1c65

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetNumJoystickHats@
foreign import ccall unsafe "hs_bindgen_2bfa757cb6822a72"
  hs_bindgen_2bfa757cb6822a72_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetNumJoystickHats@
hs_bindgen_2bfa757cb6822a72 :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO BG.CInt))
hs_bindgen_2bfa757cb6822a72 =
  BG.fromFFIType hs_bindgen_2bfa757cb6822a72_base

{-# NOINLINE sDL_GetNumJoystickHats #-}

-- | Get the number of POV hats on a joystick.
--
--     [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
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
sDL_GetNumJoystickHats :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO BG.CInt)
sDL_GetNumJoystickHats =
  BG.unsafePerformIO hs_bindgen_2bfa757cb6822a72

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetNumJoystickButtons@
foreign import ccall unsafe "hs_bindgen_a91d035d49fdc8d2"
  hs_bindgen_a91d035d49fdc8d2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetNumJoystickButtons@
hs_bindgen_a91d035d49fdc8d2 :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO BG.CInt))
hs_bindgen_a91d035d49fdc8d2 =
  BG.fromFFIType hs_bindgen_a91d035d49fdc8d2_base

{-# NOINLINE sDL_GetNumJoystickButtons #-}

-- | Get the number of buttons on a joystick.
--
--     [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
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
sDL_GetNumJoystickButtons :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO BG.CInt)
sDL_GetNumJoystickButtons =
  BG.unsafePerformIO hs_bindgen_a91d035d49fdc8d2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickEventsEnabled@
foreign import ccall unsafe "hs_bindgen_33fbade22db04a59"
  hs_bindgen_33fbade22db04a59_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickEventsEnabled@
hs_bindgen_33fbade22db04a59 :: IO (BG.FunPtr (BG.CBool -> IO ()))
hs_bindgen_33fbade22db04a59 =
  BG.fromFFIType hs_bindgen_33fbade22db04a59_base

{-# NOINLINE sDL_SetJoystickEventsEnabled #-}

-- | Set the state of joystick event processing.
--
--     If joystick events are disabled, you must call @SDL_UpdateJoysticks()@ yourself and check the state of the joystick when you want joystick information.
--
--     [@enabled@]: whether to process joystick events or not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_JoystickEventsEnabled', 'sDL_UpdateJoysticks'
--
--     [C declaration]: @SDL_SetJoystickEventsEnabled@, defined at @SDL3\/SDL_joystick.h 1097:34@
sDL_SetJoystickEventsEnabled :: BG.FunPtr (BG.CBool -> IO ())
sDL_SetJoystickEventsEnabled =
  BG.unsafePerformIO hs_bindgen_33fbade22db04a59

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_JoystickEventsEnabled@
foreign import ccall unsafe "hs_bindgen_ddd93029215cfd37"
  hs_bindgen_ddd93029215cfd37_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_JoystickEventsEnabled@
hs_bindgen_ddd93029215cfd37 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_ddd93029215cfd37 =
  BG.fromFFIType hs_bindgen_ddd93029215cfd37_base

{-# NOINLINE sDL_JoystickEventsEnabled #-}

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
sDL_JoystickEventsEnabled :: BG.FunPtr (IO BG.CBool)
sDL_JoystickEventsEnabled =
  BG.unsafePerformIO hs_bindgen_ddd93029215cfd37

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_UpdateJoysticks@
foreign import ccall unsafe "hs_bindgen_fab2d264eddcaffa"
  hs_bindgen_fab2d264eddcaffa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_UpdateJoysticks@
hs_bindgen_fab2d264eddcaffa :: IO (BG.FunPtr (IO ()))
hs_bindgen_fab2d264eddcaffa =
  BG.fromFFIType hs_bindgen_fab2d264eddcaffa_base

{-# NOINLINE sDL_UpdateJoysticks #-}

-- | Update the current state of the open joysticks.
--
--     This is called automatically by the event loop if any joystick events are enabled.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UpdateJoysticks@, defined at @SDL3\/SDL_joystick.h 1126:34@
sDL_UpdateJoysticks :: BG.FunPtr (IO ())
sDL_UpdateJoysticks =
  BG.unsafePerformIO hs_bindgen_fab2d264eddcaffa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickAxis@
foreign import ccall unsafe "hs_bindgen_f60a6cb5f1d09a81"
  hs_bindgen_f60a6cb5f1d09a81_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickAxis@
hs_bindgen_f60a6cb5f1d09a81
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> IO SDL3.Sys.Bindgen.Stdinc.Sint16))
hs_bindgen_f60a6cb5f1d09a81 =
  BG.fromFFIType hs_bindgen_f60a6cb5f1d09a81_base

{-# NOINLINE sDL_GetJoystickAxis #-}

-- | Get the current state of an axis control on a joystick.
--
--     SDL makes no promises about what part of the joystick any given axis refers to. Your game should have some sort of configuration UI to let users specify what each axis should be bound to. Alternately, SDL\'s higher-level Game Controller API makes a great effort to apply order to this lower-level interface, so you know that a specific axis is the \"left thumb stick,\" etc.
--
--     The value returned by @SDL_GetJoystickAxis()@ is a signed integer (-32768 to 32767) representing the current position of the axis. It may be necessary to impose certain tolerances on these values to account for jitter.
--
--     [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
--
--     [@axis@]: the axis to query; the axis indices start at index 0.
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
  :: BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> IO SDL3.Sys.Bindgen.Stdinc.Sint16)
sDL_GetJoystickAxis =
  BG.unsafePerformIO hs_bindgen_f60a6cb5f1d09a81

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickAxisInitialState@
foreign import ccall unsafe "hs_bindgen_c09eb5cfd016adfb"
  hs_bindgen_c09eb5cfd016adfb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickAxisInitialState@
hs_bindgen_c09eb5cfd016adfb
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16 -> IO BG.CBool))
hs_bindgen_c09eb5cfd016adfb =
  BG.fromFFIType hs_bindgen_c09eb5cfd016adfb_base

{-# NOINLINE sDL_GetJoystickAxisInitialState #-}

-- | Get the initial state of an axis control on a joystick.
--
--     The state is a value ranging from -32768 to 32767.
--
--     The axis indices start at index 0.
--
--     [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
--
--     [@axis@]: the axis to query; the axis indices start at index 0.
--
--     [@state@]: upon return, the initial value is supplied here.
--
--     [Returns]: true if this axis has any initial value, or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickAxisInitialState@, defined at @SDL3\/SDL_joystick.h 1170:34@
sDL_GetJoystickAxisInitialState
  :: BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16 -> IO BG.CBool)
sDL_GetJoystickAxisInitialState =
  BG.unsafePerformIO hs_bindgen_c09eb5cfd016adfb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickBall@
foreign import ccall unsafe "hs_bindgen_ea4bd75fcfd7173a"
  hs_bindgen_ea4bd75fcfd7173a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickBall@
hs_bindgen_ea4bd75fcfd7173a
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_ea4bd75fcfd7173a =
  BG.fromFFIType hs_bindgen_ea4bd75fcfd7173a_base

{-# NOINLINE sDL_GetJoystickBall #-}

-- | Get the ball axis change since the last poll.
--
--     Trackballs can only return relative motion since the last call to @SDL_GetJoystickBall()@, these motion deltas are placed into @dx@ and @dy@.
--
--     Most joysticks do not have trackballs.
--
--     [@joystick@]: the 'SDL_Joystick' to query.
--
--     [@ball@]: the ball index to query; ball indices start at index 0.
--
--     [@dx@]: stores the difference in the x axis position since the last poll.
--
--     [@dy@]: stores the difference in the y axis position since the last poll.
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
  :: BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GetJoystickBall =
  BG.unsafePerformIO hs_bindgen_ea4bd75fcfd7173a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickHat@
foreign import ccall unsafe "hs_bindgen_79462e0207a041dd"
  hs_bindgen_79462e0207a041dd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickHat@
hs_bindgen_79462e0207a041dd
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> IO SDL3.Sys.Bindgen.Stdinc.Uint8))
hs_bindgen_79462e0207a041dd =
  BG.fromFFIType hs_bindgen_79462e0207a041dd_base

{-# NOINLINE sDL_GetJoystickHat #-}

-- | Get the current state of a POV hat on a joystick.
--
--     The returned value will be one of the @SDL_HAT_*@ values.
--
--     [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
--
--     [@hat@]: the hat index to get the state from; indices start at index 0.
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
sDL_GetJoystickHat :: BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> IO SDL3.Sys.Bindgen.Stdinc.Uint8)
sDL_GetJoystickHat =
  BG.unsafePerformIO hs_bindgen_79462e0207a041dd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickButton@
foreign import ccall unsafe "hs_bindgen_8db4e8a6fc998c72"
  hs_bindgen_8db4e8a6fc998c72_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickButton@
hs_bindgen_8db4e8a6fc998c72 :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> IO BG.CBool))
hs_bindgen_8db4e8a6fc998c72 =
  BG.fromFFIType hs_bindgen_8db4e8a6fc998c72_base

{-# NOINLINE sDL_GetJoystickButton #-}

-- | Get the current state of a button on a joystick.
--
--     [@joystick@]: an 'SDL_Joystick' structure containing joystick information.
--
--     [@button@]: the button index to get the state from; indices start at index 0.
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
sDL_GetJoystickButton :: BG.FunPtr (BG.Ptr SDL_Joystick -> BG.CInt -> IO BG.CBool)
sDL_GetJoystickButton =
  BG.unsafePerformIO hs_bindgen_8db4e8a6fc998c72

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_RumbleJoystick@
foreign import ccall unsafe "hs_bindgen_01a69fecc103bd0a"
  hs_bindgen_01a69fecc103bd0a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_RumbleJoystick@
hs_bindgen_01a69fecc103bd0a
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Joystick
             -> SDL3.Sys.Bindgen.Stdinc.Uint16
             -> SDL3.Sys.Bindgen.Stdinc.Uint16
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_01a69fecc103bd0a =
  BG.fromFFIType hs_bindgen_01a69fecc103bd0a_base

{-# NOINLINE sDL_RumbleJoystick #-}

-- | Start a rumble effect.
--
--     Each call to this function cancels any previous rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     This function requires you to process SDL events or call @SDL_UpdateJoysticks()@ to update rumble state.
--
--     [@joystick@]: the joystick to vibrate.
--
--     [@low_frequency_rumble@]: the intensity of the low frequency (left) rumble motor, from 0 to 0xFFFF.
--
--     [@high_frequency_rumble@]: the intensity of the high frequency (right) rumble motor, from 0 to 0xFFFF.
--
--     [@duration_ms@]: the duration of the rumble effect, in milliseconds.
--
--     [Returns]: true, or false if rumble isn\'t supported on this joystick.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RumbleJoystick@, defined at @SDL3\/SDL_joystick.h 1259:34@
sDL_RumbleJoystick
  :: BG.FunPtr
       ( BG.Ptr SDL_Joystick
         -> SDL3.Sys.Bindgen.Stdinc.Uint16
         -> SDL3.Sys.Bindgen.Stdinc.Uint16
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_RumbleJoystick =
  BG.unsafePerformIO hs_bindgen_01a69fecc103bd0a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_RumbleJoystickTriggers@
foreign import ccall unsafe "hs_bindgen_9190634ce5c1726f"
  hs_bindgen_9190634ce5c1726f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_RumbleJoystickTriggers@
hs_bindgen_9190634ce5c1726f
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Joystick
             -> SDL3.Sys.Bindgen.Stdinc.Uint16
             -> SDL3.Sys.Bindgen.Stdinc.Uint16
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_9190634ce5c1726f =
  BG.fromFFIType hs_bindgen_9190634ce5c1726f_base

{-# NOINLINE sDL_RumbleJoystickTriggers #-}

-- | Start a rumble effect in the joystick\'s triggers.
--
--     Each call to this function cancels any previous trigger rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     Note that this is rumbling of the /triggers/ and not the game controller as a whole. This is currently only supported on Xbox One controllers. If you want the (more common) whole-controller rumble, use @SDL_RumbleJoystick()@ instead.
--
--     This function requires you to process SDL events or call @SDL_UpdateJoysticks()@ to update rumble state.
--
--     [@joystick@]: the joystick to vibrate.
--
--     [@left_rumble@]: the intensity of the left trigger rumble motor, from 0 to 0xFFFF.
--
--     [@right_rumble@]: the intensity of the right trigger rumble motor, from 0 to 0xFFFF.
--
--     [@duration_ms@]: the duration of the rumble effect, in milliseconds.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Joystick
         -> SDL3.Sys.Bindgen.Stdinc.Uint16
         -> SDL3.Sys.Bindgen.Stdinc.Uint16
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_RumbleJoystickTriggers =
  BG.unsafePerformIO hs_bindgen_9190634ce5c1726f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickLED@
foreign import ccall unsafe "hs_bindgen_a99b95fd254e2484"
  hs_bindgen_a99b95fd254e2484_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SetJoystickLED@
hs_bindgen_a99b95fd254e2484
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Joystick
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO BG.CBool
           )
       )
hs_bindgen_a99b95fd254e2484 =
  BG.fromFFIType hs_bindgen_a99b95fd254e2484_base

{-# NOINLINE sDL_SetJoystickLED #-}

-- | Update a joystick\'s LED color.
--
--     An example of a joystick LED is the light on the back of a PlayStation 4\'s DualShock 4 controller.
--
--     For joysticks with a single color LED, the maximum of the RGB values will be used as the LED brightness.
--
--     [@joystick@]: the joystick to update.
--
--     [@red@]: the intensity of the red LED.
--
--     [@green@]: the intensity of the green LED.
--
--     [@blue@]: the intensity of the blue LED.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetJoystickLED@, defined at @SDL3\/SDL_joystick.h 1312:34@
sDL_SetJoystickLED
  :: BG.FunPtr
       ( BG.Ptr SDL_Joystick
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO BG.CBool
       )
sDL_SetJoystickLED =
  BG.unsafePerformIO hs_bindgen_a99b95fd254e2484

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SendJoystickEffect@
foreign import ccall unsafe "hs_bindgen_2552aba22a4e5237"
  hs_bindgen_2552aba22a4e5237_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_SendJoystickEffect@
hs_bindgen_2552aba22a4e5237
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO BG.CBool))
hs_bindgen_2552aba22a4e5237 =
  BG.fromFFIType hs_bindgen_2552aba22a4e5237_base

{-# NOINLINE sDL_SendJoystickEffect #-}

-- | Send a joystick specific effect packet.
--
--     [@joystick@]: the joystick to affect.
--
--     [@data@]: the data to send to the joystick.
--
--     [@size@]: the size of the data to send to the joystick.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SendJoystickEffect@, defined at @SDL3\/SDL_joystick.h 1327:34@
sDL_SendJoystickEffect
  :: BG.FunPtr (BG.Ptr SDL_Joystick -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO BG.CBool)
sDL_SendJoystickEffect =
  BG.unsafePerformIO hs_bindgen_2552aba22a4e5237

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_CloseJoystick@
foreign import ccall unsafe "hs_bindgen_85ce86bc3120d0c6"
  hs_bindgen_85ce86bc3120d0c6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_CloseJoystick@
hs_bindgen_85ce86bc3120d0c6 :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO ()))
hs_bindgen_85ce86bc3120d0c6 =
  BG.fromFFIType hs_bindgen_85ce86bc3120d0c6_base

{-# NOINLINE sDL_CloseJoystick #-}

-- | Close a joystick previously opened with @SDL_OpenJoystick()@.
--
--     [@joystick@]: the joystick device to close.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenJoystick'
--
--     [C declaration]: @SDL_CloseJoystick@, defined at @SDL3\/SDL_joystick.h 1340:34@
sDL_CloseJoystick :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO ())
sDL_CloseJoystick =
  BG.unsafePerformIO hs_bindgen_85ce86bc3120d0c6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickConnectionState@
foreign import ccall unsafe "hs_bindgen_47061e113b50ffdc"
  hs_bindgen_47061e113b50ffdc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickConnectionState@
hs_bindgen_47061e113b50ffdc
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL_JoystickConnectionState))
hs_bindgen_47061e113b50ffdc =
  BG.fromFFIType hs_bindgen_47061e113b50ffdc_base

{-# NOINLINE sDL_GetJoystickConnectionState #-}

-- | Get the connection state of a joystick.
--
--     [@joystick@]: the joystick to query.
--
--     [Returns]: the connection state on success or @SDL_JOYSTICK_CONNECTION_INVALID@ on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickConnectionState@, defined at @SDL3\/SDL_joystick.h 1354:57@
sDL_GetJoystickConnectionState :: BG.FunPtr (BG.Ptr SDL_Joystick -> IO SDL_JoystickConnectionState)
sDL_GetJoystickConnectionState =
  BG.unsafePerformIO hs_bindgen_47061e113b50ffdc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPowerInfo@
foreign import ccall unsafe "hs_bindgen_cf314c27d59c09a1"
  hs_bindgen_cf314c27d59c09a1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Joystick_get_SDL_GetJoystickPowerInfo@
hs_bindgen_cf314c27d59c09a1
  :: IO (BG.FunPtr (BG.Ptr SDL_Joystick -> BG.Ptr BG.CInt -> IO SDL3.Sys.Bindgen.Power.SDL_PowerState))
hs_bindgen_cf314c27d59c09a1 =
  BG.fromFFIType hs_bindgen_cf314c27d59c09a1_base

{-# NOINLINE sDL_GetJoystickPowerInfo #-}

-- | Get the battery state of a joystick.
--
--     You should never take a battery status as absolute truth. Batteries (especially failing batteries) are delicate hardware, and the values reported here are best estimates based on what that hardware reports. It\'s not uncommon for older batteries to lose stored power much faster than it reports, or completely drain when reporting it has 20 percent left, etc.
--
--     [@joystick@]: the joystick to query.
--
--     [@percent@]: a pointer filled in with the percentage of battery life left, between 0 and 100, or NULL to ignore. This will be filled in with -1 we can\'t determine a value or there is no battery.
--
--     [Returns]: the current battery state or @SDL_POWERSTATE_ERROR@ on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetJoystickPowerInfo@, defined at @SDL3\/SDL_joystick.h 1377:44@
sDL_GetJoystickPowerInfo
  :: BG.FunPtr (BG.Ptr SDL_Joystick -> BG.Ptr BG.CInt -> IO SDL3.Sys.Bindgen.Power.SDL_PowerState)
sDL_GetJoystickPowerInfo =
  BG.unsafePerformIO hs_bindgen_cf314c27d59c09a1

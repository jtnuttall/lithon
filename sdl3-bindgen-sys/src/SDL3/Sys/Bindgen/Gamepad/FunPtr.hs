{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Gamepad.FunPtr (
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_AddGamepadMapping,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_AddGamepadMappingsFromIO,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_AddGamepadMappingsFromFile,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_ReloadGamepadMappings,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadMappings,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadMappingForGUID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadMapping,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_SetGamepadMapping,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_HasGamepad,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepads,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_IsGamepad,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadNameForID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadPathForID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadPlayerIndexForID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadGUIDForID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadVendorForID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadProductForID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadProductVersionForID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadTypeForID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetRealGamepadTypeForID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadMappingForID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_OpenGamepad,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadFromID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadFromPlayerIndex,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadProperties,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadID,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadName,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadPath,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadType,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetRealGamepadType,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadPlayerIndex,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_SetGamepadPlayerIndex,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadVendor,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadProduct,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadProductVersion,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadFirmwareVersion,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadSerial,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadSteamHandle,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadConnectionState,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadPowerInfo,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GamepadConnected,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadJoystick,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_SetGamepadEventsEnabled,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GamepadEventsEnabled,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadBindings,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_UpdateGamepads,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadTypeFromString,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadStringForType,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadAxisFromString,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadStringForAxis,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GamepadHasAxis,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadAxis,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadButtonFromString,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadStringForButton,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GamepadHasButton,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadButton,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadButtonLabelForType,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadButtonLabel,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetNumGamepadTouchpads,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetNumGamepadTouchpadFingers,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadTouchpadFinger,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GamepadHasSensor,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_SetGamepadSensorEnabled,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GamepadSensorEnabled,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadSensorDataRate,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadSensorData,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_RumbleGamepad,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_RumbleGamepadTriggers,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_SetGamepadLED,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_SendGamepadEffect,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_CloseGamepad,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadAppleSFSymbolsNameForButton,
  SDL3.Sys.Bindgen.Gamepad.FunPtr.sDL_GetGamepadAppleSFSymbolsNameForAxis,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Gamepad
import SDL3.Sys.Bindgen.Guid qualified
import SDL3.Sys.Bindgen.Iostream qualified
import SDL3.Sys.Bindgen.Joystick qualified
import SDL3.Sys.Bindgen.Power qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Sensor qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_gamepad.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_AddGamepadMapping */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_f56db84bc08d998c (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_AddGamepadMapping;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_AddGamepadMappingsFromIO */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_a541948e617e6e63 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_AddGamepadMappingsFromIO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_AddGamepadMappingsFromFile */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_41978012228f1faa (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_AddGamepadMappingsFromFile;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_ReloadGamepadMappings */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4df07d31710d5cb5 (void)) (void)"
         , "{"
         , "  return &SDL_ReloadGamepadMappings;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadMappings */"
         , "__attribute__ ((const))"
         , "char **(*hs_bindgen_eeb3cc137ed4da1e (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadMappings;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadMappingForGUID */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_676f8bee7fec25e8 (void)) ("
         , "  SDL_GUID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadMappingForGUID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadMapping */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_330564406990299e (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadMapping;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadMapping */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f7235f6f99c772ca (void)) ("
         , "  SDL_JoystickID arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetGamepadMapping;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_HasGamepad */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_171b935423ed7323 (void)) (void)"
         , "{"
         , "  return &SDL_HasGamepad;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepads */"
         , "__attribute__ ((const))"
         , "SDL_JoystickID *(*hs_bindgen_095806a9813b5184 (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepads;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_IsGamepad */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d37b79b846feea5a (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_IsGamepad;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadNameForID */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_4149d7834c57d24c (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadNameForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPathForID */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_e6466e1cd168d223 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadPathForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPlayerIndexForID */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_2b10ba6f8bda9f40 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadPlayerIndexForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadGUIDForID */"
         , "__attribute__ ((const))"
         , "SDL_GUID (*hs_bindgen_a8f30b2ab2c4c03d (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadGUIDForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadVendorForID */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_1c8946f34d79c303 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadVendorForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProductForID */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_edfc500830dad203 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadProductForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProductVersionForID */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_ccbc199841dd7663 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadProductVersionForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadTypeForID */"
         , "__attribute__ ((const))"
         , "SDL_GamepadType (*hs_bindgen_a56519061f425d2d (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadTypeForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetRealGamepadTypeForID */"
         , "__attribute__ ((const))"
         , "SDL_GamepadType (*hs_bindgen_ea844fcc269b3863 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetRealGamepadTypeForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadMappingForID */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_3a88aaf2c38a542b (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadMappingForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_OpenGamepad */"
         , "__attribute__ ((const))"
         , "SDL_Gamepad *(*hs_bindgen_d2263d27295e9ca6 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_OpenGamepad;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadFromID */"
         , "__attribute__ ((const))"
         , "SDL_Gamepad *(*hs_bindgen_a2eccf4e721a7b78 (void)) ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadFromID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadFromPlayerIndex */"
         , "__attribute__ ((const))"
         , "SDL_Gamepad *(*hs_bindgen_d5762153bda1c5a2 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadFromPlayerIndex;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_f6b1c3e515df26bf (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadID */"
         , "__attribute__ ((const))"
         , "SDL_JoystickID (*hs_bindgen_aeb6f834f1bb9bba (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_a6ba120e3c657e82 (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPath */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_25cf3224bc5505cc (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadPath;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadType */"
         , "__attribute__ ((const))"
         , "SDL_GamepadType (*hs_bindgen_131b0de798357722 (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadType;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetRealGamepadType */"
         , "__attribute__ ((const))"
         , "SDL_GamepadType (*hs_bindgen_299f836c8b95a4d8 (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetRealGamepadType;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPlayerIndex */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_c48d71502b4eef8f (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadPlayerIndex;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadPlayerIndex */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_90716136f5deb4d3 (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_SetGamepadPlayerIndex;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadVendor */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_ffa764d02a95dc96 (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadVendor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProduct */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_22ebf47a7ce663ce (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadProduct;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProductVersion */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_cb998d733e296e5c (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadProductVersion;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadFirmwareVersion */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_dddc5b49b1eab050 (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadFirmwareVersion;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadSerial */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_ee2ba2bdd8e4e8f4 (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadSerial;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadSteamHandle */"
         , "__attribute__ ((const))"
         , "Uint64 (*hs_bindgen_3f35ecfbc73c387c (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadSteamHandle;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadConnectionState */"
         , "__attribute__ ((const))"
         , "SDL_JoystickConnectionState (*hs_bindgen_53909ff1f2a38eeb (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadConnectionState;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPowerInfo */"
         , "__attribute__ ((const))"
         , "SDL_PowerState (*hs_bindgen_c9db854f84cfdf17 (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadPowerInfo;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadConnected */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f53e7088d703eb0d (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GamepadConnected;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadJoystick */"
         , "__attribute__ ((const))"
         , "SDL_Joystick *(*hs_bindgen_437957a44b873407 (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadJoystick;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadEventsEnabled */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_bd360bbccf8e02d1 (void)) ("
         , "  _Bool arg1"
         , ")"
         , "{"
         , "  return &SDL_SetGamepadEventsEnabled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadEventsEnabled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_495749302a88fada (void)) (void)"
         , "{"
         , "  return &SDL_GamepadEventsEnabled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadBindings */"
         , "__attribute__ ((const))"
         , "SDL_GamepadBinding **(*hs_bindgen_3bbe8c4408199173 (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadBindings;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_UpdateGamepads */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_3029fdebe260ad88 (void)) (void)"
         , "{"
         , "  return &SDL_UpdateGamepads;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadTypeFromString */"
         , "__attribute__ ((const))"
         , "SDL_GamepadType (*hs_bindgen_919d1827bf3ece38 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadTypeFromString;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadStringForType */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_e0a2bc0194ece97f (void)) ("
         , "  SDL_GamepadType arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadStringForType;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadAxisFromString */"
         , "__attribute__ ((const))"
         , "SDL_GamepadAxis (*hs_bindgen_3e2dae12c3051365 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadAxisFromString;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadStringForAxis */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_4979edfa77e4fc76 (void)) ("
         , "  SDL_GamepadAxis arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadStringForAxis;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadHasAxis */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3ea6abfb2ca9a69e (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadAxis arg2"
         , ")"
         , "{"
         , "  return &SDL_GamepadHasAxis;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadAxis */"
         , "__attribute__ ((const))"
         , "Sint16 (*hs_bindgen_a8dfd9fddde7c51f (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadAxis arg2"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadAxis;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadButtonFromString */"
         , "__attribute__ ((const))"
         , "SDL_GamepadButton (*hs_bindgen_aacf61245766bd7f (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadButtonFromString;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadStringForButton */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_e28b377b66d430c7 (void)) ("
         , "  SDL_GamepadButton arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadStringForButton;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadHasButton */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_915b6e8126454256 (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadButton arg2"
         , ")"
         , "{"
         , "  return &SDL_GamepadHasButton;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadButton */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f63603565928dd6d (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadButton arg2"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadButton;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadButtonLabelForType */"
         , "__attribute__ ((const))"
         , "SDL_GamepadButtonLabel (*hs_bindgen_5d5da36c408f3ed5 (void)) ("
         , "  SDL_GamepadType arg1,"
         , "  SDL_GamepadButton arg2"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadButtonLabelForType;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadButtonLabel */"
         , "__attribute__ ((const))"
         , "SDL_GamepadButtonLabel (*hs_bindgen_6c96bb1d7ac32853 (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadButton arg2"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadButtonLabel;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetNumGamepadTouchpads */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_de275259788d26ed (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetNumGamepadTouchpads;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetNumGamepadTouchpadFingers */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_acaeb05c5893aeba (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_GetNumGamepadTouchpadFingers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadTouchpadFinger */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4408908532932c4e (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  _Bool *arg4,"
         , "  float *arg5,"
         , "  float *arg6,"
         , "  float *arg7"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadTouchpadFinger;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadHasSensor */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_041741220ac7e52d (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_SensorType arg2"
         , ")"
         , "{"
         , "  return &SDL_GamepadHasSensor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadSensorEnabled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_04571bb432b35b67 (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_SensorType arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return &SDL_SetGamepadSensorEnabled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadSensorEnabled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_98c53abf20c77167 (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_SensorType arg2"
         , ")"
         , "{"
         , "  return &SDL_GamepadSensorEnabled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadSensorDataRate */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_b6592bd554a6f989 (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_SensorType arg2"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadSensorDataRate;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadSensorData */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9753ce47b936d3ec (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_SensorType arg2,"
         , "  float *arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadSensorData;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_RumbleGamepad */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_66c29b053dd2103a (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  Uint16 arg2,"
         , "  Uint16 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_RumbleGamepad;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_RumbleGamepadTriggers */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d96d791857c3d06b (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  Uint16 arg2,"
         , "  Uint16 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_RumbleGamepadTriggers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadLED */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fb1de1463dc236a8 (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return &SDL_SetGamepadLED;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SendGamepadEffect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_5961396a3fadcac6 (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  void const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_SendGamepadEffect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_CloseGamepad */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_599bdf2afa4631b2 (void)) ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return &SDL_CloseGamepad;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadAppleSFSymbolsNameForButton */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_901b303b0d647ea4 (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadButton arg2"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadAppleSFSymbolsNameForButton;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadAppleSFSymbolsNameForAxis */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_0f564808a8b0fec7 (void)) ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadAxis arg2"
         , ")"
         , "{"
         , "  return &SDL_GetGamepadAppleSFSymbolsNameForAxis;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_AddGamepadMapping@
foreign import ccall unsafe "hs_bindgen_f56db84bc08d998c"
  hs_bindgen_f56db84bc08d998c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_AddGamepadMapping@
hs_bindgen_f56db84bc08d998c :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CInt))
hs_bindgen_f56db84bc08d998c =
  BG.fromFFIType hs_bindgen_f56db84bc08d998c_base

{-# NOINLINE sDL_AddGamepadMapping #-}

-- | Add support for gamepads that SDL is unaware of or change the binding of an existing gamepad.
--
--     The mapping string has the format \"GUID,name,mapping\", where GUID is the string value from SDL_GUIDToString(), name is the human readable string for the device and mappings are gamepad mappings to joystick ones. Under Windows there is a reserved GUID of \"xinput\" that covers all XInput devices. The mapping format for joystick is:
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
--     [@mapping@]: the mapping string.
--
--     [Returns]: 1 if a new mapping is added, 0 if an existing mapping is updated, -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddGamepadMappingsFromFile', 'sDL_AddGamepadMappingsFromIO', 'sDL_GetGamepadMapping', 'sDL_GetGamepadMappingForGUID', SDL_HINT_GAMECONTROLLERCONFIG, SDL_HINT_GAMECONTROLLERCONFIG_FILE, SDL_EVENT_GAMEPAD_ADDED
--
--     [C declaration]: @SDL_AddGamepadMapping@, defined at @SDL3\/SDL_gamepad.h 346:33@
sDL_AddGamepadMapping :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CInt)
sDL_AddGamepadMapping =
  BG.unsafePerformIO hs_bindgen_f56db84bc08d998c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_AddGamepadMappingsFromIO@
foreign import ccall unsafe "hs_bindgen_a541948e617e6e63"
  hs_bindgen_a541948e617e6e63_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_AddGamepadMappingsFromIO@
hs_bindgen_a541948e617e6e63
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream -> BG.CBool -> IO BG.CInt))
hs_bindgen_a541948e617e6e63 =
  BG.fromFFIType hs_bindgen_a541948e617e6e63_base

{-# NOINLINE sDL_AddGamepadMappingsFromIO #-}

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
--     [@src@]: the data stream for the mappings to be added.
--
--     [@closeio@]: if true, calls SDL_CloseIO() on @src@ before returning, even in the case of an error.
--
--     [Returns]: the number of mappings added or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddGamepadMapping', 'sDL_AddGamepadMappingsFromFile', 'sDL_GetGamepadMapping', 'sDL_GetGamepadMappingForGUID', SDL_HINT_GAMECONTROLLERCONFIG, SDL_HINT_GAMECONTROLLERCONFIG_FILE, SDL_EVENT_GAMEPAD_ADDED
--
--     [C declaration]: @SDL_AddGamepadMappingsFromIO@, defined at @SDL3\/SDL_gamepad.h 386:33@
sDL_AddGamepadMappingsFromIO
  :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream -> BG.CBool -> IO BG.CInt)
sDL_AddGamepadMappingsFromIO =
  BG.unsafePerformIO hs_bindgen_a541948e617e6e63

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_AddGamepadMappingsFromFile@
foreign import ccall unsafe "hs_bindgen_41978012228f1faa"
  hs_bindgen_41978012228f1faa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_AddGamepadMappingsFromFile@
hs_bindgen_41978012228f1faa :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CInt))
hs_bindgen_41978012228f1faa =
  BG.fromFFIType hs_bindgen_41978012228f1faa_base

{-# NOINLINE sDL_AddGamepadMappingsFromFile #-}

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
--     [@file@]: the mappings file to load.
--
--     [Returns]: the number of mappings added or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddGamepadMapping', 'sDL_AddGamepadMappingsFromIO', 'sDL_GetGamepadMapping', 'sDL_GetGamepadMappingForGUID', SDL_HINT_GAMECONTROLLERCONFIG, SDL_HINT_GAMECONTROLLERCONFIG_FILE, SDL_EVENT_GAMEPAD_ADDED
--
--     [C declaration]: @SDL_AddGamepadMappingsFromFile@, defined at @SDL3\/SDL_gamepad.h 420:33@
sDL_AddGamepadMappingsFromFile :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CInt)
sDL_AddGamepadMappingsFromFile =
  BG.unsafePerformIO hs_bindgen_41978012228f1faa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_ReloadGamepadMappings@
foreign import ccall unsafe "hs_bindgen_4df07d31710d5cb5"
  hs_bindgen_4df07d31710d5cb5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_ReloadGamepadMappings@
hs_bindgen_4df07d31710d5cb5 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_4df07d31710d5cb5 =
  BG.fromFFIType hs_bindgen_4df07d31710d5cb5_base

{-# NOINLINE sDL_ReloadGamepadMappings #-}

-- | Reinitialize the SDL mapping database to its initial state.
--
--     This will generate gamepad events as needed if device mappings change.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReloadGamepadMappings@, defined at @SDL3\/SDL_gamepad.h 434:34@
sDL_ReloadGamepadMappings :: BG.FunPtr (IO BG.CBool)
sDL_ReloadGamepadMappings =
  BG.unsafePerformIO hs_bindgen_4df07d31710d5cb5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadMappings@
foreign import ccall unsafe "hs_bindgen_eeb3cc137ed4da1e"
  hs_bindgen_eeb3cc137ed4da1e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadMappings@
hs_bindgen_eeb3cc137ed4da1e :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr BG.CChar))))
hs_bindgen_eeb3cc137ed4da1e =
  BG.fromFFIType hs_bindgen_eeb3cc137ed4da1e_base

{-# NOINLINE sDL_GetGamepadMappings #-}

-- | Get the current gamepad mappings.
--
--     [@count@]: a pointer filled in with the number of mappings returned, can be NULL.
--
--     [Returns]: an array of the mapping strings, NULL-terminated, or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadMappings@, defined at @SDL3\/SDL_gamepad.h 450:37@
sDL_GetGamepadMappings :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr BG.CChar)))
sDL_GetGamepadMappings =
  BG.unsafePerformIO hs_bindgen_eeb3cc137ed4da1e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadMappingForGUID@
foreign import ccall unsafe "hs_bindgen_676f8bee7fec25e8"
  hs_bindgen_676f8bee7fec25e8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadMappingForGUID@
hs_bindgen_676f8bee7fec25e8
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Guid.SDL_GUID -> IO (BG.Ptr BG.CChar)))
hs_bindgen_676f8bee7fec25e8 =
  BG.fromFFIType hs_bindgen_676f8bee7fec25e8_base

{-# NOINLINE sDL_GetGamepadMappingForGUID #-}

-- | Get the gamepad mapping string for a given GUID.
--
--     [@guid@]: a structure containing the GUID for which a mapping is desired.
--
--     [Returns]: a mapping string or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_GetJoystickGUIDForID, SDL_GetJoystickGUID
--
--     [C declaration]: @SDL_GetGamepadMappingForGUID@, defined at @SDL3\/SDL_gamepad.h 467:36@
sDL_GetGamepadMappingForGUID :: BG.FunPtr (SDL3.Sys.Bindgen.Guid.SDL_GUID -> IO (BG.Ptr BG.CChar))
sDL_GetGamepadMappingForGUID =
  BG.unsafePerformIO hs_bindgen_676f8bee7fec25e8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadMapping@
foreign import ccall unsafe "hs_bindgen_330564406990299e"
  hs_bindgen_330564406990299e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadMapping@
hs_bindgen_330564406990299e :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO (BG.Ptr BG.CChar)))
hs_bindgen_330564406990299e =
  BG.fromFFIType hs_bindgen_330564406990299e_base

{-# NOINLINE sDL_GetGamepadMapping #-}

-- | Get the current mapping of a gamepad.
--
--     Details about mappings are discussed with @SDL_AddGamepadMapping()@.
--
--     [@gamepad@]: the gamepad you want to get the current mapping for.
--
--     [Returns]: a string that has the gamepad\'s mapping or NULL if no mapping is available; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddGamepadMapping', 'sDL_GetGamepadMappingForID', 'sDL_GetGamepadMappingForGUID', 'sDL_SetGamepadMapping'
--
--     [C declaration]: @SDL_GetGamepadMapping@, defined at @SDL3\/SDL_gamepad.h 488:36@
sDL_GetGamepadMapping :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO (BG.Ptr BG.CChar))
sDL_GetGamepadMapping =
  BG.unsafePerformIO hs_bindgen_330564406990299e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadMapping@
foreign import ccall unsafe "hs_bindgen_f7235f6f99c772ca"
  hs_bindgen_f7235f6f99c772ca_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadMapping@
hs_bindgen_f7235f6f99c772ca
  :: IO
       (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_f7235f6f99c772ca =
  BG.fromFFIType hs_bindgen_f7235f6f99c772ca_base

{-# NOINLINE sDL_SetGamepadMapping #-}

-- | Set the current mapping of a joystick or gamepad.
--
--     Details about mappings are discussed with @SDL_AddGamepadMapping()@.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [@mapping@]: the mapping to use for this device, or NULL to clear the mapping.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddGamepadMapping', 'sDL_GetGamepadMapping'
--
--     [C declaration]: @SDL_SetGamepadMapping@, defined at @SDL3\/SDL_gamepad.h 508:34@
sDL_SetGamepadMapping
  :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_SetGamepadMapping =
  BG.unsafePerformIO hs_bindgen_f7235f6f99c772ca

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_HasGamepad@
foreign import ccall unsafe "hs_bindgen_171b935423ed7323"
  hs_bindgen_171b935423ed7323_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_HasGamepad@
hs_bindgen_171b935423ed7323 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_171b935423ed7323 =
  BG.fromFFIType hs_bindgen_171b935423ed7323_base

{-# NOINLINE sDL_HasGamepad #-}

-- | Return whether a gamepad is currently connected.
--
--     [Returns]: true if a gamepad is connected, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_HasGamepad@, defined at @SDL3\/SDL_gamepad.h 521:34@
sDL_HasGamepad :: BG.FunPtr (IO BG.CBool)
sDL_HasGamepad =
  BG.unsafePerformIO hs_bindgen_171b935423ed7323

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepads@
foreign import ccall unsafe "hs_bindgen_095806a9813b5184"
  hs_bindgen_095806a9813b5184_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepads@
hs_bindgen_095806a9813b5184
  :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)))
hs_bindgen_095806a9813b5184 =
  BG.fromFFIType hs_bindgen_095806a9813b5184_base

{-# NOINLINE sDL_GetGamepads #-}

-- | Get a list of currently connected gamepads.
--
--     [@count@]: a pointer filled in with the number of gamepads returned, may be NULL.
--
--     [Returns]: a 0 terminated array of joystick instance IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasGamepad', 'sDL_OpenGamepad'
--
--     [C declaration]: @SDL_GetGamepads@, defined at @SDL3\/SDL_gamepad.h 539:46@
sDL_GetGamepads
  :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_JoystickID))
sDL_GetGamepads =
  BG.unsafePerformIO hs_bindgen_095806a9813b5184

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_IsGamepad@
foreign import ccall unsafe "hs_bindgen_d37b79b846feea5a"
  hs_bindgen_d37b79b846feea5a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_IsGamepad@
hs_bindgen_d37b79b846feea5a
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO BG.CBool))
hs_bindgen_d37b79b846feea5a =
  BG.fromFFIType hs_bindgen_d37b79b846feea5a_base

{-# NOINLINE sDL_IsGamepad #-}

-- | Check if the given joystick is supported by the gamepad interface.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: true if the given joystick is supported by the gamepad interface, false if it isn\'t or it\'s an invalid index.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_GetJoysticks, 'sDL_OpenGamepad'
--
--     [C declaration]: @SDL_IsGamepad@, defined at @SDL3\/SDL_gamepad.h 555:34@
sDL_IsGamepad :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO BG.CBool)
sDL_IsGamepad =
  BG.unsafePerformIO hs_bindgen_d37b79b846feea5a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadNameForID@
foreign import ccall unsafe "hs_bindgen_4149d7834c57d24c"
  hs_bindgen_4149d7834c57d24c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadNameForID@
hs_bindgen_4149d7834c57d24c
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_4149d7834c57d24c =
  BG.fromFFIType hs_bindgen_4149d7834c57d24c_base

{-# NOINLINE sDL_GetGamepadNameForID #-}

-- | Get the implementation dependent name of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: the name of the selected gamepad. If no name can be found, this function returns NULL; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadName', 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_GetGamepadNameForID@, defined at @SDL3\/SDL_gamepad.h 573:42@
sDL_GetGamepadNameForID
  :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetGamepadNameForID =
  BG.unsafePerformIO hs_bindgen_4149d7834c57d24c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPathForID@
foreign import ccall unsafe "hs_bindgen_e6466e1cd168d223"
  hs_bindgen_e6466e1cd168d223_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPathForID@
hs_bindgen_e6466e1cd168d223
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_e6466e1cd168d223 =
  BG.fromFFIType hs_bindgen_e6466e1cd168d223_base

{-# NOINLINE sDL_GetGamepadPathForID #-}

-- | Get the implementation dependent path of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: the path of the selected gamepad. If no path can be found, this function returns NULL; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadPath', 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_GetGamepadPathForID@, defined at @SDL3\/SDL_gamepad.h 591:42@
sDL_GetGamepadPathForID
  :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetGamepadPathForID =
  BG.unsafePerformIO hs_bindgen_e6466e1cd168d223

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPlayerIndexForID@
foreign import ccall unsafe "hs_bindgen_2b10ba6f8bda9f40"
  hs_bindgen_2b10ba6f8bda9f40_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPlayerIndexForID@
hs_bindgen_2b10ba6f8bda9f40
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO BG.CInt))
hs_bindgen_2b10ba6f8bda9f40 =
  BG.fromFFIType hs_bindgen_2b10ba6f8bda9f40_base

{-# NOINLINE sDL_GetGamepadPlayerIndexForID #-}

-- | Get the player index of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: the player index of a gamepad, or -1 if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadPlayerIndex', 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_GetGamepadPlayerIndexForID@, defined at @SDL3\/SDL_gamepad.h 608:33@
sDL_GetGamepadPlayerIndexForID :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO BG.CInt)
sDL_GetGamepadPlayerIndexForID =
  BG.unsafePerformIO hs_bindgen_2b10ba6f8bda9f40

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadGUIDForID@
foreign import ccall unsafe "hs_bindgen_a8f30b2ab2c4c03d"
  hs_bindgen_a8f30b2ab2c4c03d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadGUIDForID@
hs_bindgen_a8f30b2ab2c4c03d
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID))
hs_bindgen_a8f30b2ab2c4c03d =
  BG.fromFFIType hs_bindgen_a8f30b2ab2c4c03d_base

{-# NOINLINE sDL_GetGamepadGUIDForID #-}

-- | Get the implementation-dependent GUID of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: the GUID of the selected gamepad. If called on an invalid index, this function returns a zero GUID.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_GUIDToString, 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_GetGamepadGUIDForID@, defined at @SDL3\/SDL_gamepad.h 626:38@
sDL_GetGamepadGUIDForID
  :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID)
sDL_GetGamepadGUIDForID =
  BG.unsafePerformIO hs_bindgen_a8f30b2ab2c4c03d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadVendorForID@
foreign import ccall unsafe "hs_bindgen_1c8946f34d79c303"
  hs_bindgen_1c8946f34d79c303_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadVendorForID@
hs_bindgen_1c8946f34d79c303
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_1c8946f34d79c303 =
  BG.fromFFIType hs_bindgen_1c8946f34d79c303_base

{-# NOINLINE sDL_GetGamepadVendorForID #-}

-- | Get the USB vendor ID of a gamepad, if available.
--
--     This can be called before any gamepads are opened. If the vendor ID isn\'t available this function returns 0.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: the USB vendor ID of the selected gamepad. If called on an invalid index, this function returns zero.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadVendor', 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_GetGamepadVendorForID@, defined at @SDL3\/SDL_gamepad.h 645:36@
sDL_GetGamepadVendorForID
  :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetGamepadVendorForID =
  BG.unsafePerformIO hs_bindgen_1c8946f34d79c303

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProductForID@
foreign import ccall unsafe "hs_bindgen_edfc500830dad203"
  hs_bindgen_edfc500830dad203_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProductForID@
hs_bindgen_edfc500830dad203
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_edfc500830dad203 =
  BG.fromFFIType hs_bindgen_edfc500830dad203_base

{-# NOINLINE sDL_GetGamepadProductForID #-}

-- | Get the USB product ID of a gamepad, if available.
--
--     This can be called before any gamepads are opened. If the product ID isn\'t available this function returns 0.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: the USB product ID of the selected gamepad. If called on an invalid index, this function returns zero.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadProduct', 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_GetGamepadProductForID@, defined at @SDL3\/SDL_gamepad.h 664:36@
sDL_GetGamepadProductForID
  :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetGamepadProductForID =
  BG.unsafePerformIO hs_bindgen_edfc500830dad203

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProductVersionForID@
foreign import ccall unsafe "hs_bindgen_ccbc199841dd7663"
  hs_bindgen_ccbc199841dd7663_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProductVersionForID@
hs_bindgen_ccbc199841dd7663
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_ccbc199841dd7663 =
  BG.fromFFIType hs_bindgen_ccbc199841dd7663_base

{-# NOINLINE sDL_GetGamepadProductVersionForID #-}

-- | Get the product version of a gamepad, if available.
--
--     This can be called before any gamepads are opened. If the product version isn\'t available this function returns 0.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: the product version of the selected gamepad. If called on an invalid index, this function returns zero.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadProductVersion', 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_GetGamepadProductVersionForID@, defined at @SDL3\/SDL_gamepad.h 683:36@
sDL_GetGamepadProductVersionForID
  :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetGamepadProductVersionForID =
  BG.unsafePerformIO hs_bindgen_ccbc199841dd7663

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadTypeForID@
foreign import ccall unsafe "hs_bindgen_a56519061f425d2d"
  hs_bindgen_a56519061f425d2d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadTypeForID@
hs_bindgen_a56519061f425d2d
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO SDL_GamepadType))
hs_bindgen_a56519061f425d2d =
  BG.fromFFIType hs_bindgen_a56519061f425d2d_base

{-# NOINLINE sDL_GetGamepadTypeForID #-}

-- | Get the type of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: the gamepad type.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadType', 'sDL_GetGamepads', 'sDL_GetRealGamepadTypeForID'
--
--     [C declaration]: @SDL_GetGamepadTypeForID@, defined at @SDL3\/SDL_gamepad.h 701:45@
sDL_GetGamepadTypeForID
  :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO SDL_GamepadType)
sDL_GetGamepadTypeForID =
  BG.unsafePerformIO hs_bindgen_a56519061f425d2d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetRealGamepadTypeForID@
foreign import ccall unsafe "hs_bindgen_ea844fcc269b3863"
  hs_bindgen_ea844fcc269b3863_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetRealGamepadTypeForID@
hs_bindgen_ea844fcc269b3863
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO SDL_GamepadType))
hs_bindgen_ea844fcc269b3863 =
  BG.fromFFIType hs_bindgen_ea844fcc269b3863_base

{-# NOINLINE sDL_GetRealGamepadTypeForID #-}

-- | Get the type of a gamepad, ignoring any mapping override.
--
--     This can be called before any gamepads are opened.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: the gamepad type.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadTypeForID', 'sDL_GetGamepads', 'sDL_GetRealGamepadType'
--
--     [C declaration]: @SDL_GetRealGamepadTypeForID@, defined at @SDL3\/SDL_gamepad.h 719:45@
sDL_GetRealGamepadTypeForID
  :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO SDL_GamepadType)
sDL_GetRealGamepadTypeForID =
  BG.unsafePerformIO hs_bindgen_ea844fcc269b3863

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadMappingForID@
foreign import ccall unsafe "hs_bindgen_3a88aaf2c38a542b"
  hs_bindgen_3a88aaf2c38a542b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadMappingForID@
hs_bindgen_3a88aaf2c38a542b
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO (BG.Ptr BG.CChar)))
hs_bindgen_3a88aaf2c38a542b =
  BG.fromFFIType hs_bindgen_3a88aaf2c38a542b_base

{-# NOINLINE sDL_GetGamepadMappingForID #-}

-- | Get the mapping of a gamepad.
--
--     This can be called before any gamepads are opened.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: the mapping string. Returns NULL if no mapping is available. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepads', 'sDL_GetGamepadMapping'
--
--     [C declaration]: @SDL_GetGamepadMappingForID@, defined at @SDL3\/SDL_gamepad.h 737:36@
sDL_GetGamepadMappingForID
  :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO (BG.Ptr BG.CChar))
sDL_GetGamepadMappingForID =
  BG.unsafePerformIO hs_bindgen_3a88aaf2c38a542b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_OpenGamepad@
foreign import ccall unsafe "hs_bindgen_d2263d27295e9ca6"
  hs_bindgen_d2263d27295e9ca6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_OpenGamepad@
hs_bindgen_d2263d27295e9ca6
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO (BG.Ptr SDL_Gamepad)))
hs_bindgen_d2263d27295e9ca6 =
  BG.fromFFIType hs_bindgen_d2263d27295e9ca6_base

{-# NOINLINE sDL_OpenGamepad #-}

-- | Open a gamepad for use.
--
--     [@instance_id@]: the joystick instance ID.
--
--     [Returns]: a gamepad identifier or NULL if an error occurred; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseGamepad', 'sDL_IsGamepad'
--
--     [C declaration]: @SDL_OpenGamepad@, defined at @SDL3\/SDL_gamepad.h 753:43@
sDL_OpenGamepad :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO (BG.Ptr SDL_Gamepad))
sDL_OpenGamepad =
  BG.unsafePerformIO hs_bindgen_d2263d27295e9ca6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadFromID@
foreign import ccall unsafe "hs_bindgen_a2eccf4e721a7b78"
  hs_bindgen_a2eccf4e721a7b78_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadFromID@
hs_bindgen_a2eccf4e721a7b78
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO (BG.Ptr SDL_Gamepad)))
hs_bindgen_a2eccf4e721a7b78 =
  BG.fromFFIType hs_bindgen_a2eccf4e721a7b78_base

{-# NOINLINE sDL_GetGamepadFromID #-}

-- | Get the 'SDL_Gamepad' associated with a joystick instance ID, if it has been opened.
--
--     [@instance_id@]: the joystick instance ID of the gamepad.
--
--     [Returns]: an 'SDL_Gamepad' on success or NULL on failure or if it hasn\'t been opened yet; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadFromID@, defined at @SDL3\/SDL_gamepad.h 767:43@
sDL_GetGamepadFromID
  :: BG.FunPtr (SDL3.Sys.Bindgen.Joystick.SDL_JoystickID -> IO (BG.Ptr SDL_Gamepad))
sDL_GetGamepadFromID =
  BG.unsafePerformIO hs_bindgen_a2eccf4e721a7b78

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadFromPlayerIndex@
foreign import ccall unsafe "hs_bindgen_d5762153bda1c5a2"
  hs_bindgen_d5762153bda1c5a2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadFromPlayerIndex@
hs_bindgen_d5762153bda1c5a2 :: IO (BG.FunPtr (BG.CInt -> IO (BG.Ptr SDL_Gamepad)))
hs_bindgen_d5762153bda1c5a2 =
  BG.fromFFIType hs_bindgen_d5762153bda1c5a2_base

{-# NOINLINE sDL_GetGamepadFromPlayerIndex #-}

-- | Get the 'SDL_Gamepad' associated with a player index.
--
--     [@player_index@]: the player index, which different from the instance ID.
--
--     [Returns]: the 'SDL_Gamepad' associated with a player index.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadPlayerIndex', 'sDL_SetGamepadPlayerIndex'
--
--     [C declaration]: @SDL_GetGamepadFromPlayerIndex@, defined at @SDL3\/SDL_gamepad.h 782:43@
sDL_GetGamepadFromPlayerIndex :: BG.FunPtr (BG.CInt -> IO (BG.Ptr SDL_Gamepad))
sDL_GetGamepadFromPlayerIndex =
  BG.unsafePerformIO hs_bindgen_d5762153bda1c5a2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProperties@
foreign import ccall unsafe "hs_bindgen_f6b1c3e515df26bf"
  hs_bindgen_f6b1c3e515df26bf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProperties@
hs_bindgen_f6b1c3e515df26bf
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_f6b1c3e515df26bf =
  BG.fromFFIType hs_bindgen_f6b1c3e515df26bf_base

{-# NOINLINE sDL_GetGamepadProperties #-}

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
--     [@gamepad@]: a gamepad identifier previously returned by @SDL_OpenGamepad()@.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadProperties@, defined at @SDL3\/SDL_gamepad.h 811:46@
sDL_GetGamepadProperties
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetGamepadProperties =
  BG.unsafePerformIO hs_bindgen_f6b1c3e515df26bf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadID@
foreign import ccall unsafe "hs_bindgen_aeb6f834f1bb9bba"
  hs_bindgen_aeb6f834f1bb9bba_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadID@
hs_bindgen_aeb6f834f1bb9bba
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Joystick.SDL_JoystickID))
hs_bindgen_aeb6f834f1bb9bba =
  BG.fromFFIType hs_bindgen_aeb6f834f1bb9bba_base

{-# NOINLINE sDL_GetGamepadID #-}

-- | Get the instance ID of an opened gamepad.
--
--     [@gamepad@]: a gamepad identifier previously returned by @SDL_OpenGamepad()@.
--
--     [Returns]: the instance ID of the specified gamepad on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadID@, defined at @SDL3\/SDL_gamepad.h 831:44@
sDL_GetGamepadID :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
sDL_GetGamepadID =
  BG.unsafePerformIO hs_bindgen_aeb6f834f1bb9bba

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadName@
foreign import ccall unsafe "hs_bindgen_a6ba120e3c657e82"
  hs_bindgen_a6ba120e3c657e82_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadName@
hs_bindgen_a6ba120e3c657e82
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_a6ba120e3c657e82 =
  BG.fromFFIType hs_bindgen_a6ba120e3c657e82_base

{-# NOINLINE sDL_GetGamepadName #-}

-- | Get the implementation-dependent name for an opened gamepad.
--
--     [@gamepad@]: a gamepad identifier previously returned by @SDL_OpenGamepad()@.
--
--     [Returns]: the implementation dependent name for the gamepad, or NULL if there is no name or the identifier passed is invalid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadNameForID'
--
--     [C declaration]: @SDL_GetGamepadName@, defined at @SDL3\/SDL_gamepad.h 847:42@
sDL_GetGamepadName :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetGamepadName =
  BG.unsafePerformIO hs_bindgen_a6ba120e3c657e82

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPath@
foreign import ccall unsafe "hs_bindgen_25cf3224bc5505cc"
  hs_bindgen_25cf3224bc5505cc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPath@
hs_bindgen_25cf3224bc5505cc
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_25cf3224bc5505cc =
  BG.fromFFIType hs_bindgen_25cf3224bc5505cc_base

{-# NOINLINE sDL_GetGamepadPath #-}

-- | Get the implementation-dependent path for an opened gamepad.
--
--     [@gamepad@]: a gamepad identifier previously returned by @SDL_OpenGamepad()@.
--
--     [Returns]: the implementation dependent path for the gamepad, or NULL if there is no path or the identifier passed is invalid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadPathForID'
--
--     [C declaration]: @SDL_GetGamepadPath@, defined at @SDL3\/SDL_gamepad.h 863:42@
sDL_GetGamepadPath :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetGamepadPath =
  BG.unsafePerformIO hs_bindgen_25cf3224bc5505cc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadType@
foreign import ccall unsafe "hs_bindgen_131b0de798357722"
  hs_bindgen_131b0de798357722_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadType@
hs_bindgen_131b0de798357722 :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL_GamepadType))
hs_bindgen_131b0de798357722 =
  BG.fromFFIType hs_bindgen_131b0de798357722_base

{-# NOINLINE sDL_GetGamepadType #-}

-- | Get the type of an opened gamepad.
--
--     [@gamepad@]: the gamepad object to query.
--
--     [Returns]: the gamepad type, or SDL_GAMEPAD_TYPE_UNKNOWN if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadTypeForID'
--
--     [C declaration]: @SDL_GetGamepadType@, defined at @SDL3\/SDL_gamepad.h 878:45@
sDL_GetGamepadType :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL_GamepadType)
sDL_GetGamepadType =
  BG.unsafePerformIO hs_bindgen_131b0de798357722

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetRealGamepadType@
foreign import ccall unsafe "hs_bindgen_299f836c8b95a4d8"
  hs_bindgen_299f836c8b95a4d8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetRealGamepadType@
hs_bindgen_299f836c8b95a4d8 :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL_GamepadType))
hs_bindgen_299f836c8b95a4d8 =
  BG.fromFFIType hs_bindgen_299f836c8b95a4d8_base

{-# NOINLINE sDL_GetRealGamepadType #-}

-- | Get the type of an opened gamepad, ignoring any mapping override.
--
--     [@gamepad@]: the gamepad object to query.
--
--     [Returns]: the gamepad type, or SDL_GAMEPAD_TYPE_UNKNOWN if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRealGamepadTypeForID'
--
--     [C declaration]: @SDL_GetRealGamepadType@, defined at @SDL3\/SDL_gamepad.h 893:45@
sDL_GetRealGamepadType :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL_GamepadType)
sDL_GetRealGamepadType =
  BG.unsafePerformIO hs_bindgen_299f836c8b95a4d8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPlayerIndex@
foreign import ccall unsafe "hs_bindgen_c48d71502b4eef8f"
  hs_bindgen_c48d71502b4eef8f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPlayerIndex@
hs_bindgen_c48d71502b4eef8f :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO BG.CInt))
hs_bindgen_c48d71502b4eef8f =
  BG.fromFFIType hs_bindgen_c48d71502b4eef8f_base

{-# NOINLINE sDL_GetGamepadPlayerIndex #-}

-- | Get the player index of an opened gamepad.
--
--     For XInput gamepads this returns the XInput user index.
--
--     [@gamepad@]: the gamepad object to query.
--
--     [Returns]: the player index for gamepad, or -1 if it\'s not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetGamepadPlayerIndex'
--
--     [C declaration]: @SDL_GetGamepadPlayerIndex@, defined at @SDL3\/SDL_gamepad.h 909:33@
sDL_GetGamepadPlayerIndex :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO BG.CInt)
sDL_GetGamepadPlayerIndex =
  BG.unsafePerformIO hs_bindgen_c48d71502b4eef8f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadPlayerIndex@
foreign import ccall unsafe "hs_bindgen_90716136f5deb4d3"
  hs_bindgen_90716136f5deb4d3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadPlayerIndex@
hs_bindgen_90716136f5deb4d3 :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> BG.CInt -> IO BG.CBool))
hs_bindgen_90716136f5deb4d3 =
  BG.fromFFIType hs_bindgen_90716136f5deb4d3_base

{-# NOINLINE sDL_SetGamepadPlayerIndex #-}

-- | Set the player index of an opened gamepad.
--
--     [@gamepad@]: the gamepad object to adjust.
--
--     [@player_index@]: player index to assign to this gamepad, or -1 to clear the player index and turn off player LEDs.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadPlayerIndex'
--
--     [C declaration]: @SDL_SetGamepadPlayerIndex@, defined at @SDL3\/SDL_gamepad.h 926:34@
sDL_SetGamepadPlayerIndex :: BG.FunPtr (BG.Ptr SDL_Gamepad -> BG.CInt -> IO BG.CBool)
sDL_SetGamepadPlayerIndex =
  BG.unsafePerformIO hs_bindgen_90716136f5deb4d3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadVendor@
foreign import ccall unsafe "hs_bindgen_ffa764d02a95dc96"
  hs_bindgen_ffa764d02a95dc96_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadVendor@
hs_bindgen_ffa764d02a95dc96
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_ffa764d02a95dc96 =
  BG.fromFFIType hs_bindgen_ffa764d02a95dc96_base

{-# NOINLINE sDL_GetGamepadVendor #-}

-- | Get the USB vendor ID of an opened gamepad, if available.
--
--     If the vendor ID isn\'t available this function returns 0.
--
--     [@gamepad@]: the gamepad object to query.
--
--     [Returns]: the USB vendor ID, or zero if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadVendorForID'
--
--     [C declaration]: @SDL_GetGamepadVendor@, defined at @SDL3\/SDL_gamepad.h 942:36@
sDL_GetGamepadVendor :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetGamepadVendor =
  BG.unsafePerformIO hs_bindgen_ffa764d02a95dc96

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProduct@
foreign import ccall unsafe "hs_bindgen_22ebf47a7ce663ce"
  hs_bindgen_22ebf47a7ce663ce_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProduct@
hs_bindgen_22ebf47a7ce663ce
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_22ebf47a7ce663ce =
  BG.fromFFIType hs_bindgen_22ebf47a7ce663ce_base

{-# NOINLINE sDL_GetGamepadProduct #-}

-- | Get the USB product ID of an opened gamepad, if available.
--
--     If the product ID isn\'t available this function returns 0.
--
--     [@gamepad@]: the gamepad object to query.
--
--     [Returns]: the USB product ID, or zero if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadProductForID'
--
--     [C declaration]: @SDL_GetGamepadProduct@, defined at @SDL3\/SDL_gamepad.h 958:36@
sDL_GetGamepadProduct :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetGamepadProduct =
  BG.unsafePerformIO hs_bindgen_22ebf47a7ce663ce

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProductVersion@
foreign import ccall unsafe "hs_bindgen_cb998d733e296e5c"
  hs_bindgen_cb998d733e296e5c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadProductVersion@
hs_bindgen_cb998d733e296e5c
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_cb998d733e296e5c =
  BG.fromFFIType hs_bindgen_cb998d733e296e5c_base

{-# NOINLINE sDL_GetGamepadProductVersion #-}

-- | Get the product version of an opened gamepad, if available.
--
--     If the product version isn\'t available this function returns 0.
--
--     [@gamepad@]: the gamepad object to query.
--
--     [Returns]: the USB product version, or zero if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadProductVersionForID'
--
--     [C declaration]: @SDL_GetGamepadProductVersion@, defined at @SDL3\/SDL_gamepad.h 974:36@
sDL_GetGamepadProductVersion :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetGamepadProductVersion =
  BG.unsafePerformIO hs_bindgen_cb998d733e296e5c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadFirmwareVersion@
foreign import ccall unsafe "hs_bindgen_dddc5b49b1eab050"
  hs_bindgen_dddc5b49b1eab050_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadFirmwareVersion@
hs_bindgen_dddc5b49b1eab050
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_dddc5b49b1eab050 =
  BG.fromFFIType hs_bindgen_dddc5b49b1eab050_base

{-# NOINLINE sDL_GetGamepadFirmwareVersion #-}

-- | Get the firmware version of an opened gamepad, if available.
--
--     If the firmware version isn\'t available this function returns 0.
--
--     [@gamepad@]: the gamepad object to query.
--
--     [Returns]: the gamepad firmware version, or zero if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadFirmwareVersion@, defined at @SDL3\/SDL_gamepad.h 988:36@
sDL_GetGamepadFirmwareVersion :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
sDL_GetGamepadFirmwareVersion =
  BG.unsafePerformIO hs_bindgen_dddc5b49b1eab050

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadSerial@
foreign import ccall unsafe "hs_bindgen_ee2ba2bdd8e4e8f4"
  hs_bindgen_ee2ba2bdd8e4e8f4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadSerial@
hs_bindgen_ee2ba2bdd8e4e8f4
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_ee2ba2bdd8e4e8f4 =
  BG.fromFFIType hs_bindgen_ee2ba2bdd8e4e8f4_base

{-# NOINLINE sDL_GetGamepadSerial #-}

-- | Get the serial number of an opened gamepad, if available.
--
--     Returns the serial number of the gamepad, or NULL if it is not available.
--
--     [@gamepad@]: the gamepad object to query.
--
--     [Returns]: the serial number, or NULL if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadSerial@, defined at @SDL3\/SDL_gamepad.h 1002:42@
sDL_GetGamepadSerial :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetGamepadSerial =
  BG.unsafePerformIO hs_bindgen_ee2ba2bdd8e4e8f4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadSteamHandle@
foreign import ccall unsafe "hs_bindgen_3f35ecfbc73c387c"
  hs_bindgen_3f35ecfbc73c387c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadSteamHandle@
hs_bindgen_3f35ecfbc73c387c
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Stdinc.Uint64))
hs_bindgen_3f35ecfbc73c387c =
  BG.fromFFIType hs_bindgen_3f35ecfbc73c387c_base

{-# NOINLINE sDL_GetGamepadSteamHandle #-}

-- | Get the Steam Input handle of an opened gamepad, if available.
--
--     Returns an InputHandle_t for the gamepad that can be used with Steam Input API: [https:\/\/partner.steamgames.com\/doc\/api\/ISteamInput](https://partner.steamgames.com/doc/api/ISteamInput)
--
--     [@gamepad@]: the gamepad object to query.
--
--     [Returns]: the gamepad handle, or 0 if unavailable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadSteamHandle@, defined at @SDL3\/SDL_gamepad.h 1017:36@
sDL_GetGamepadSteamHandle :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Stdinc.Uint64)
sDL_GetGamepadSteamHandle =
  BG.unsafePerformIO hs_bindgen_3f35ecfbc73c387c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadConnectionState@
foreign import ccall unsafe "hs_bindgen_53909ff1f2a38eeb"
  hs_bindgen_53909ff1f2a38eeb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadConnectionState@
hs_bindgen_53909ff1f2a38eeb
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Joystick.SDL_JoystickConnectionState))
hs_bindgen_53909ff1f2a38eeb =
  BG.fromFFIType hs_bindgen_53909ff1f2a38eeb_base

{-# NOINLINE sDL_GetGamepadConnectionState #-}

-- | Get the connection state of a gamepad.
--
--     [@gamepad@]: the gamepad object to query.
--
--     [Returns]: the connection state on success or @SDL_JOYSTICK_CONNECTION_INVALID@ on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadConnectionState@, defined at @SDL3\/SDL_gamepad.h 1031:57@
sDL_GetGamepadConnectionState
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO SDL3.Sys.Bindgen.Joystick.SDL_JoystickConnectionState)
sDL_GetGamepadConnectionState =
  BG.unsafePerformIO hs_bindgen_53909ff1f2a38eeb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPowerInfo@
foreign import ccall unsafe "hs_bindgen_c9db854f84cfdf17"
  hs_bindgen_c9db854f84cfdf17_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadPowerInfo@
hs_bindgen_c9db854f84cfdf17
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> BG.Ptr BG.CInt -> IO SDL3.Sys.Bindgen.Power.SDL_PowerState))
hs_bindgen_c9db854f84cfdf17 =
  BG.fromFFIType hs_bindgen_c9db854f84cfdf17_base

{-# NOINLINE sDL_GetGamepadPowerInfo #-}

-- | Get the battery state of a gamepad.
--
--     You should never take a battery status as absolute truth. Batteries (especially failing batteries) are delicate hardware, and the values reported here are best estimates based on what that hardware reports. It\'s not uncommon for older batteries to lose stored power much faster than it reports, or completely drain when reporting it has 20 percent left, etc.
--
--     [@gamepad@]: the gamepad object to query.
--
--     [@percent@]: a pointer filled in with the percentage of battery life left, between 0 and 100, or NULL to ignore. This will be filled in with -1 we can\'t determine a value or there is no battery.
--
--     [Returns]: the current battery state.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadPowerInfo@, defined at @SDL3\/SDL_gamepad.h 1053:44@
sDL_GetGamepadPowerInfo
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> BG.Ptr BG.CInt -> IO SDL3.Sys.Bindgen.Power.SDL_PowerState)
sDL_GetGamepadPowerInfo =
  BG.unsafePerformIO hs_bindgen_c9db854f84cfdf17

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadConnected@
foreign import ccall unsafe "hs_bindgen_f53e7088d703eb0d"
  hs_bindgen_f53e7088d703eb0d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadConnected@
hs_bindgen_f53e7088d703eb0d :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO BG.CBool))
hs_bindgen_f53e7088d703eb0d =
  BG.fromFFIType hs_bindgen_f53e7088d703eb0d_base

{-# NOINLINE sDL_GamepadConnected #-}

-- | Check if a gamepad has been opened and is currently connected.
--
--     [@gamepad@]: a gamepad identifier previously returned by @SDL_OpenGamepad()@.
--
--     [Returns]: true if the gamepad has been opened and is currently connected, or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GamepadConnected@, defined at @SDL3\/SDL_gamepad.h 1067:34@
sDL_GamepadConnected :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO BG.CBool)
sDL_GamepadConnected =
  BG.unsafePerformIO hs_bindgen_f53e7088d703eb0d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadJoystick@
foreign import ccall unsafe "hs_bindgen_437957a44b873407"
  hs_bindgen_437957a44b873407_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadJoystick@
hs_bindgen_437957a44b873407
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick)))
hs_bindgen_437957a44b873407 =
  BG.fromFFIType hs_bindgen_437957a44b873407_base

{-# NOINLINE sDL_GetGamepadJoystick #-}

-- | Get the underlying joystick from a gamepad.
--
--     This function will give you a SDL_Joystick object, which allows you to use the SDL_Joystick functions with a 'SDL_Gamepad' object. This would be useful for getting a joystick\'s position at any given time, even if it hasn\'t moved (moving it would produce an event, which would have the axis\' value).
--
--     The pointer returned is owned by the 'SDL_Gamepad'. You should not call SDL_CloseJoystick() on it, for example, since doing so will likely cause SDL to crash.
--
--     [@gamepad@]: the gamepad object that you want to get a joystick from.
--
--     [Returns]: an SDL_Joystick object, or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadJoystick@, defined at @SDL3\/SDL_gamepad.h 1089:44@
sDL_GetGamepadJoystick
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick))
sDL_GetGamepadJoystick =
  BG.unsafePerformIO hs_bindgen_437957a44b873407

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadEventsEnabled@
foreign import ccall unsafe "hs_bindgen_bd360bbccf8e02d1"
  hs_bindgen_bd360bbccf8e02d1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadEventsEnabled@
hs_bindgen_bd360bbccf8e02d1 :: IO (BG.FunPtr (BG.CBool -> IO ()))
hs_bindgen_bd360bbccf8e02d1 =
  BG.fromFFIType hs_bindgen_bd360bbccf8e02d1_base

{-# NOINLINE sDL_SetGamepadEventsEnabled #-}

-- | Set the state of gamepad event processing.
--
--     If gamepad events are disabled, you must call @SDL_UpdateGamepads()@ yourself and check the state of the gamepad when you want gamepad information.
--
--     [@enabled@]: whether to process gamepad events or not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GamepadEventsEnabled', 'sDL_UpdateGamepads'
--
--     [C declaration]: @SDL_SetGamepadEventsEnabled@, defined at @SDL3\/SDL_gamepad.h 1106:34@
sDL_SetGamepadEventsEnabled :: BG.FunPtr (BG.CBool -> IO ())
sDL_SetGamepadEventsEnabled =
  BG.unsafePerformIO hs_bindgen_bd360bbccf8e02d1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadEventsEnabled@
foreign import ccall unsafe "hs_bindgen_495749302a88fada"
  hs_bindgen_495749302a88fada_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadEventsEnabled@
hs_bindgen_495749302a88fada :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_495749302a88fada =
  BG.fromFFIType hs_bindgen_495749302a88fada_base

{-# NOINLINE sDL_GamepadEventsEnabled #-}

-- | Query the state of gamepad event processing.
--
--     If gamepad events are disabled, you must call @SDL_UpdateGamepads()@ yourself and check the state of the gamepad when you want gamepad information.
--
--     [Returns]: true if gamepad events are being processed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetGamepadEventsEnabled'
--
--     [C declaration]: @SDL_GamepadEventsEnabled@, defined at @SDL3\/SDL_gamepad.h 1122:34@
sDL_GamepadEventsEnabled :: BG.FunPtr (IO BG.CBool)
sDL_GamepadEventsEnabled =
  BG.unsafePerformIO hs_bindgen_495749302a88fada

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadBindings@
foreign import ccall unsafe "hs_bindgen_3bbe8c4408199173"
  hs_bindgen_3bbe8c4408199173_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadBindings@
hs_bindgen_3bbe8c4408199173
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr SDL_GamepadBinding))))
hs_bindgen_3bbe8c4408199173 =
  BG.fromFFIType hs_bindgen_3bbe8c4408199173_base

{-# NOINLINE sDL_GetGamepadBindings #-}

-- | Get the SDL joystick layer bindings for a gamepad.
--
--     [@gamepad@]: a gamepad.
--
--     [@count@]: a pointer filled in with the number of bindings returned.
--
--     [Returns]: a NULL terminated array of pointers to bindings or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadBindings@, defined at @SDL3\/SDL_gamepad.h 1138:51@
sDL_GetGamepadBindings
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr SDL_GamepadBinding)))
sDL_GetGamepadBindings =
  BG.unsafePerformIO hs_bindgen_3bbe8c4408199173

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_UpdateGamepads@
foreign import ccall unsafe "hs_bindgen_3029fdebe260ad88"
  hs_bindgen_3029fdebe260ad88_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_UpdateGamepads@
hs_bindgen_3029fdebe260ad88 :: IO (BG.FunPtr (IO ()))
hs_bindgen_3029fdebe260ad88 =
  BG.fromFFIType hs_bindgen_3029fdebe260ad88_base

{-# NOINLINE sDL_UpdateGamepads #-}

-- | Manually pump gamepad updates if not using the loop.
--
--     This function is called automatically by the event loop if events are enabled. Under such circumstances, it will not be necessary to call this function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UpdateGamepads@, defined at @SDL3\/SDL_gamepad.h 1151:34@
sDL_UpdateGamepads :: BG.FunPtr (IO ())
sDL_UpdateGamepads =
  BG.unsafePerformIO hs_bindgen_3029fdebe260ad88

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadTypeFromString@
foreign import ccall unsafe "hs_bindgen_919d1827bf3ece38"
  hs_bindgen_919d1827bf3ece38_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadTypeFromString@
hs_bindgen_919d1827bf3ece38 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL_GamepadType))
hs_bindgen_919d1827bf3ece38 =
  BG.fromFFIType hs_bindgen_919d1827bf3ece38_base

{-# NOINLINE sDL_GetGamepadTypeFromString #-}

-- | Convert a string into 'SDL_GamepadType' enum.
--
--     This function is called internally to translate 'SDL_Gamepad' mapping strings for the underlying joystick device into the consistent 'SDL_Gamepad' mapping. You do not normally need to call this function unless you are parsing 'SDL_Gamepad' mappings in your own code.
--
--     [@str@]: string representing a 'SDL_GamepadType' type.
--
--     [Returns]: the 'SDL_GamepadType' enum corresponding to the input string, or @SDL_GAMEPAD_TYPE_UNKNOWN@ if no match was found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadStringForType'
--
--     [C declaration]: @SDL_GetGamepadTypeFromString@, defined at @SDL3\/SDL_gamepad.h 1171:45@
sDL_GetGamepadTypeFromString :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL_GamepadType)
sDL_GetGamepadTypeFromString =
  BG.unsafePerformIO hs_bindgen_919d1827bf3ece38

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadStringForType@
foreign import ccall unsafe "hs_bindgen_e0a2bc0194ece97f"
  hs_bindgen_e0a2bc0194ece97f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadStringForType@
hs_bindgen_e0a2bc0194ece97f :: IO (BG.FunPtr (SDL_GamepadType -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_e0a2bc0194ece97f =
  BG.fromFFIType hs_bindgen_e0a2bc0194ece97f_base

{-# NOINLINE sDL_GetGamepadStringForType #-}

-- | Convert from an 'SDL_GamepadType' enum to a string.
--
--     [@type@]: an enum value for a given 'SDL_GamepadType'.
--
--     [Returns]: a string for the given type, or NULL if an invalid type is specified. The string returned is of the format used by 'SDL_Gamepad' mapping strings.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadTypeFromString'
--
--     [C declaration]: @SDL_GetGamepadStringForType@, defined at @SDL3\/SDL_gamepad.h 1187:42@
sDL_GetGamepadStringForType :: BG.FunPtr (SDL_GamepadType -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetGamepadStringForType =
  BG.unsafePerformIO hs_bindgen_e0a2bc0194ece97f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadAxisFromString@
foreign import ccall unsafe "hs_bindgen_3e2dae12c3051365"
  hs_bindgen_3e2dae12c3051365_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadAxisFromString@
hs_bindgen_3e2dae12c3051365 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL_GamepadAxis))
hs_bindgen_3e2dae12c3051365 =
  BG.fromFFIType hs_bindgen_3e2dae12c3051365_base

{-# NOINLINE sDL_GetGamepadAxisFromString #-}

-- | Convert a string into 'SDL_GamepadAxis' enum.
--
--     This function is called internally to translate 'SDL_Gamepad' mapping strings for the underlying joystick device into the consistent 'SDL_Gamepad' mapping. You do not normally need to call this function unless you are parsing 'SDL_Gamepad' mappings in your own code.
--
--     Note specially that \"righttrigger\" and \"lefttrigger\" map to @SDL_GAMEPAD_AXIS_RIGHT_TRIGGER@ and @SDL_GAMEPAD_AXIS_LEFT_TRIGGER@, respectively.
--
--     [@str@]: string representing a 'SDL_Gamepad' axis.
--
--     [Returns]: the 'SDL_GamepadAxis' enum corresponding to the input string, or @SDL_GAMEPAD_AXIS_INVALID@ if no match was found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadStringForAxis'
--
--     [C declaration]: @SDL_GetGamepadAxisFromString@, defined at @SDL3\/SDL_gamepad.h 1211:45@
sDL_GetGamepadAxisFromString :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL_GamepadAxis)
sDL_GetGamepadAxisFromString =
  BG.unsafePerformIO hs_bindgen_3e2dae12c3051365

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadStringForAxis@
foreign import ccall unsafe "hs_bindgen_4979edfa77e4fc76"
  hs_bindgen_4979edfa77e4fc76_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadStringForAxis@
hs_bindgen_4979edfa77e4fc76 :: IO (BG.FunPtr (SDL_GamepadAxis -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_4979edfa77e4fc76 =
  BG.fromFFIType hs_bindgen_4979edfa77e4fc76_base

{-# NOINLINE sDL_GetGamepadStringForAxis #-}

-- | Convert from an 'SDL_GamepadAxis' enum to a string.
--
--     [@axis@]: an enum value for a given 'SDL_GamepadAxis'.
--
--     [Returns]: a string for the given axis, or NULL if an invalid axis is specified. The string returned is of the format used by 'SDL_Gamepad' mapping strings.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadAxisFromString'
--
--     [C declaration]: @SDL_GetGamepadStringForAxis@, defined at @SDL3\/SDL_gamepad.h 1227:42@
sDL_GetGamepadStringForAxis :: BG.FunPtr (SDL_GamepadAxis -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetGamepadStringForAxis =
  BG.unsafePerformIO hs_bindgen_4979edfa77e4fc76

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadHasAxis@
foreign import ccall unsafe "hs_bindgen_3ea6abfb2ca9a69e"
  hs_bindgen_3ea6abfb2ca9a69e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadHasAxis@
hs_bindgen_3ea6abfb2ca9a69e :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadAxis -> IO BG.CBool))
hs_bindgen_3ea6abfb2ca9a69e =
  BG.fromFFIType hs_bindgen_3ea6abfb2ca9a69e_base

{-# NOINLINE sDL_GamepadHasAxis #-}

-- | Query whether a gamepad has a given axis.
--
--     This merely reports whether the gamepad\'s mapping defined this axis, as that is all the information SDL has about the physical device.
--
--     [@gamepad@]: a gamepad.
--
--     [@axis@]: an axis enum value (an 'SDL_GamepadAxis' value).
--
--     [Returns]: true if the gamepad has this axis, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GamepadHasButton', 'sDL_GetGamepadAxis'
--
--     [C declaration]: @SDL_GamepadHasAxis@, defined at @SDL3\/SDL_gamepad.h 1246:34@
sDL_GamepadHasAxis :: BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadAxis -> IO BG.CBool)
sDL_GamepadHasAxis =
  BG.unsafePerformIO hs_bindgen_3ea6abfb2ca9a69e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadAxis@
foreign import ccall unsafe "hs_bindgen_a8dfd9fddde7c51f"
  hs_bindgen_a8dfd9fddde7c51f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadAxis@
hs_bindgen_a8dfd9fddde7c51f
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadAxis -> IO SDL3.Sys.Bindgen.Stdinc.Sint16))
hs_bindgen_a8dfd9fddde7c51f =
  BG.fromFFIType hs_bindgen_a8dfd9fddde7c51f_base

{-# NOINLINE sDL_GetGamepadAxis #-}

-- | Get the current state of an axis control on a gamepad.
--
--     The axis indices start at index 0.
--
--     For thumbsticks, the state is a value ranging from -32768 (up\/left) to 32767 (down\/right).
--
--     Triggers range from 0 when released to 32767 when fully pressed, and never return a negative value. Note that this differs from the value reported by the lower-level SDL_GetJoystickAxis(), which normally uses the full range.
--
--     Note that for invalid gamepads or axes, this will return 0. Zero is also a valid value in normal operation; usually it means a centered axis.
--
--     [@gamepad@]: a gamepad.
--
--     [@axis@]: an axis index (one of the 'SDL_GamepadAxis' values).
--
--     [Returns]: axis state.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GamepadHasAxis', 'sDL_GetGamepadButton'
--
--     [C declaration]: @SDL_GetGamepadAxis@, defined at @SDL3\/SDL_gamepad.h 1274:36@
sDL_GetGamepadAxis
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadAxis -> IO SDL3.Sys.Bindgen.Stdinc.Sint16)
sDL_GetGamepadAxis =
  BG.unsafePerformIO hs_bindgen_a8dfd9fddde7c51f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadButtonFromString@
foreign import ccall unsafe "hs_bindgen_aacf61245766bd7f"
  hs_bindgen_aacf61245766bd7f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadButtonFromString@
hs_bindgen_aacf61245766bd7f :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL_GamepadButton))
hs_bindgen_aacf61245766bd7f =
  BG.fromFFIType hs_bindgen_aacf61245766bd7f_base

{-# NOINLINE sDL_GetGamepadButtonFromString #-}

-- | Convert a string into an 'SDL_GamepadButton' enum.
--
--     This function is called internally to translate 'SDL_Gamepad' mapping strings for the underlying joystick device into the consistent 'SDL_Gamepad' mapping. You do not normally need to call this function unless you are parsing 'SDL_Gamepad' mappings in your own code.
--
--     [@str@]: string representing a 'SDL_Gamepad' button.
--
--     [Returns]: the 'SDL_GamepadButton' enum corresponding to the input string, or @SDL_GAMEPAD_BUTTON_INVALID@ if no match was found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadStringForButton'
--
--     [C declaration]: @SDL_GetGamepadButtonFromString@, defined at @SDL3\/SDL_gamepad.h 1294:47@
sDL_GetGamepadButtonFromString :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL_GamepadButton)
sDL_GetGamepadButtonFromString =
  BG.unsafePerformIO hs_bindgen_aacf61245766bd7f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadStringForButton@
foreign import ccall unsafe "hs_bindgen_e28b377b66d430c7"
  hs_bindgen_e28b377b66d430c7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadStringForButton@
hs_bindgen_e28b377b66d430c7 :: IO (BG.FunPtr (SDL_GamepadButton -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_e28b377b66d430c7 =
  BG.fromFFIType hs_bindgen_e28b377b66d430c7_base

{-# NOINLINE sDL_GetGamepadStringForButton #-}

-- | Convert from an 'SDL_GamepadButton' enum to a string.
--
--     [@button@]: an enum value for a given 'SDL_GamepadButton'.
--
--     [Returns]: a string for the given button, or NULL if an invalid button is specified. The string returned is of the format used by 'SDL_Gamepad' mapping strings.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadButtonFromString'
--
--     [C declaration]: @SDL_GetGamepadStringForButton@, defined at @SDL3\/SDL_gamepad.h 1310:42@
sDL_GetGamepadStringForButton :: BG.FunPtr (SDL_GamepadButton -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetGamepadStringForButton =
  BG.unsafePerformIO hs_bindgen_e28b377b66d430c7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadHasButton@
foreign import ccall unsafe "hs_bindgen_915b6e8126454256"
  hs_bindgen_915b6e8126454256_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadHasButton@
hs_bindgen_915b6e8126454256
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadButton -> IO BG.CBool))
hs_bindgen_915b6e8126454256 =
  BG.fromFFIType hs_bindgen_915b6e8126454256_base

{-# NOINLINE sDL_GamepadHasButton #-}

-- | Query whether a gamepad has a given button.
--
--     This merely reports whether the gamepad\'s mapping defined this button, as that is all the information SDL has about the physical device.
--
--     [@gamepad@]: a gamepad.
--
--     [@button@]: a button enum value (an 'SDL_GamepadButton' value).
--
--     [Returns]: true if the gamepad has this button, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GamepadHasAxis'
--
--     [C declaration]: @SDL_GamepadHasButton@, defined at @SDL3\/SDL_gamepad.h 1328:34@
sDL_GamepadHasButton :: BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadButton -> IO BG.CBool)
sDL_GamepadHasButton =
  BG.unsafePerformIO hs_bindgen_915b6e8126454256

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadButton@
foreign import ccall unsafe "hs_bindgen_f63603565928dd6d"
  hs_bindgen_f63603565928dd6d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadButton@
hs_bindgen_f63603565928dd6d
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadButton -> IO BG.CBool))
hs_bindgen_f63603565928dd6d =
  BG.fromFFIType hs_bindgen_f63603565928dd6d_base

{-# NOINLINE sDL_GetGamepadButton #-}

-- | Get the current state of a button on a gamepad.
--
--     [@gamepad@]: a gamepad.
--
--     [@button@]: a button index (one of the 'SDL_GamepadButton' values).
--
--     [Returns]: true if the button is pressed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GamepadHasButton', 'sDL_GetGamepadAxis'
--
--     [C declaration]: @SDL_GetGamepadButton@, defined at @SDL3\/SDL_gamepad.h 1344:34@
sDL_GetGamepadButton :: BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadButton -> IO BG.CBool)
sDL_GetGamepadButton =
  BG.unsafePerformIO hs_bindgen_f63603565928dd6d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadButtonLabelForType@
foreign import ccall unsafe "hs_bindgen_5d5da36c408f3ed5"
  hs_bindgen_5d5da36c408f3ed5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadButtonLabelForType@
hs_bindgen_5d5da36c408f3ed5
  :: IO (BG.FunPtr (SDL_GamepadType -> SDL_GamepadButton -> IO SDL_GamepadButtonLabel))
hs_bindgen_5d5da36c408f3ed5 =
  BG.fromFFIType hs_bindgen_5d5da36c408f3ed5_base

{-# NOINLINE sDL_GetGamepadButtonLabelForType #-}

-- | Get the label of a button on a gamepad.
--
--     [@type@]: the type of gamepad to check.
--
--     [@button@]: a button index (one of the 'SDL_GamepadButton' values).
--
--     [Returns]: the 'SDL_GamepadButtonLabel' enum corresponding to the button label.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadButtonLabel'
--
--     [C declaration]: @SDL_GetGamepadButtonLabelForType@, defined at @SDL3\/SDL_gamepad.h 1359:52@
sDL_GetGamepadButtonLabelForType
  :: BG.FunPtr (SDL_GamepadType -> SDL_GamepadButton -> IO SDL_GamepadButtonLabel)
sDL_GetGamepadButtonLabelForType =
  BG.unsafePerformIO hs_bindgen_5d5da36c408f3ed5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadButtonLabel@
foreign import ccall unsafe "hs_bindgen_6c96bb1d7ac32853"
  hs_bindgen_6c96bb1d7ac32853_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadButtonLabel@
hs_bindgen_6c96bb1d7ac32853
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadButton -> IO SDL_GamepadButtonLabel))
hs_bindgen_6c96bb1d7ac32853 =
  BG.fromFFIType hs_bindgen_6c96bb1d7ac32853_base

{-# NOINLINE sDL_GetGamepadButtonLabel #-}

-- | Get the label of a button on a gamepad.
--
--     [@gamepad@]: a gamepad.
--
--     [@button@]: a button index (one of the 'SDL_GamepadButton' values).
--
--     [Returns]: the 'SDL_GamepadButtonLabel' enum corresponding to the button label.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadButtonLabelForType'
--
--     [C declaration]: @SDL_GetGamepadButtonLabel@, defined at @SDL3\/SDL_gamepad.h 1374:52@
sDL_GetGamepadButtonLabel
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadButton -> IO SDL_GamepadButtonLabel)
sDL_GetGamepadButtonLabel =
  BG.unsafePerformIO hs_bindgen_6c96bb1d7ac32853

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetNumGamepadTouchpads@
foreign import ccall unsafe "hs_bindgen_de275259788d26ed"
  hs_bindgen_de275259788d26ed_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetNumGamepadTouchpads@
hs_bindgen_de275259788d26ed :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO BG.CInt))
hs_bindgen_de275259788d26ed =
  BG.fromFFIType hs_bindgen_de275259788d26ed_base

{-# NOINLINE sDL_GetNumGamepadTouchpads #-}

-- | Get the number of touchpads on a gamepad.
--
--     [@gamepad@]: a gamepad.
--
--     [Returns]: number of touchpads.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetNumGamepadTouchpadFingers'
--
--     [C declaration]: @SDL_GetNumGamepadTouchpads@, defined at @SDL3\/SDL_gamepad.h 1388:33@
sDL_GetNumGamepadTouchpads :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO BG.CInt)
sDL_GetNumGamepadTouchpads =
  BG.unsafePerformIO hs_bindgen_de275259788d26ed

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetNumGamepadTouchpadFingers@
foreign import ccall unsafe "hs_bindgen_acaeb05c5893aeba"
  hs_bindgen_acaeb05c5893aeba_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetNumGamepadTouchpadFingers@
hs_bindgen_acaeb05c5893aeba :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> BG.CInt -> IO BG.CInt))
hs_bindgen_acaeb05c5893aeba =
  BG.fromFFIType hs_bindgen_acaeb05c5893aeba_base

{-# NOINLINE sDL_GetNumGamepadTouchpadFingers #-}

-- | Get the number of supported simultaneous fingers on a touchpad on a game gamepad.
--
--     [@gamepad@]: a gamepad.
--
--     [@touchpad@]: a touchpad.
--
--     [Returns]: number of supported simultaneous fingers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadTouchpadFinger', 'sDL_GetNumGamepadTouchpads'
--
--     [C declaration]: @SDL_GetNumGamepadTouchpadFingers@, defined at @SDL3\/SDL_gamepad.h 1405:33@
sDL_GetNumGamepadTouchpadFingers :: BG.FunPtr (BG.Ptr SDL_Gamepad -> BG.CInt -> IO BG.CInt)
sDL_GetNumGamepadTouchpadFingers =
  BG.unsafePerformIO hs_bindgen_acaeb05c5893aeba

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadTouchpadFinger@
foreign import ccall unsafe "hs_bindgen_4408908532932c4e"
  hs_bindgen_4408908532932c4e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadTouchpadFinger@
hs_bindgen_4408908532932c4e
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Gamepad
             -> BG.CInt
             -> BG.CInt
             -> BG.Ptr BG.CBool
             -> BG.Ptr BG.CFloat
             -> BG.Ptr BG.CFloat
             -> BG.Ptr BG.CFloat
             -> IO BG.CBool
           )
       )
hs_bindgen_4408908532932c4e =
  BG.fromFFIType hs_bindgen_4408908532932c4e_base

{-# NOINLINE sDL_GetGamepadTouchpadFinger #-}

-- | Get the current state of a finger on a touchpad on a gamepad.
--
--     [@gamepad@]: a gamepad.
--
--     [@touchpad@]: a touchpad.
--
--     [@finger@]: a finger.
--
--     [@down@]: a pointer filled with true if the finger is down, false otherwise, may be NULL.
--
--     [@x@]: a pointer filled with the x position, normalized 0 to 1, with the origin in the upper left, may be NULL.
--
--     [@y@]: a pointer filled with the y position, normalized 0 to 1, with the origin in the upper left, may be NULL.
--
--     [@pressure@]: a pointer filled with pressure value, may be NULL.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetNumGamepadTouchpadFingers'
--
--     [C declaration]: @SDL_GetGamepadTouchpadFinger@, defined at @SDL3\/SDL_gamepad.h 1429:34@
sDL_GetGamepadTouchpadFinger
  :: BG.FunPtr
       ( BG.Ptr SDL_Gamepad
         -> BG.CInt
         -> BG.CInt
         -> BG.Ptr BG.CBool
         -> BG.Ptr BG.CFloat
         -> BG.Ptr BG.CFloat
         -> BG.Ptr BG.CFloat
         -> IO BG.CBool
       )
sDL_GetGamepadTouchpadFinger =
  BG.unsafePerformIO hs_bindgen_4408908532932c4e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadHasSensor@
foreign import ccall unsafe "hs_bindgen_041741220ac7e52d"
  hs_bindgen_041741220ac7e52d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadHasSensor@
hs_bindgen_041741220ac7e52d
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType -> IO BG.CBool))
hs_bindgen_041741220ac7e52d =
  BG.fromFFIType hs_bindgen_041741220ac7e52d_base

{-# NOINLINE sDL_GamepadHasSensor #-}

-- | Return whether a gamepad has a particular sensor.
--
--     [@gamepad@]: the gamepad to query.
--
--     [@type@]: the type of sensor to query.
--
--     [Returns]: true if the sensor exists, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadSensorData', 'sDL_GetGamepadSensorDataRate', 'sDL_SetGamepadSensorEnabled'
--
--     [C declaration]: @SDL_GamepadHasSensor@, defined at @SDL3\/SDL_gamepad.h 1446:34@
sDL_GamepadHasSensor
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType -> IO BG.CBool)
sDL_GamepadHasSensor =
  BG.unsafePerformIO hs_bindgen_041741220ac7e52d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadSensorEnabled@
foreign import ccall unsafe "hs_bindgen_04571bb432b35b67"
  hs_bindgen_04571bb432b35b67_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadSensorEnabled@
hs_bindgen_04571bb432b35b67
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType -> BG.CBool -> IO BG.CBool))
hs_bindgen_04571bb432b35b67 =
  BG.fromFFIType hs_bindgen_04571bb432b35b67_base

{-# NOINLINE sDL_SetGamepadSensorEnabled #-}

-- | Set whether data reporting for a gamepad sensor is enabled.
--
--     [@gamepad@]: the gamepad to update.
--
--     [@type@]: the type of sensor to enable\/disable.
--
--     [@enabled@]: whether data reporting should be enabled.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GamepadHasSensor', 'sDL_GamepadSensorEnabled'
--
--     [C declaration]: @SDL_SetGamepadSensorEnabled@, defined at @SDL3\/SDL_gamepad.h 1464:34@
sDL_SetGamepadSensorEnabled
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType -> BG.CBool -> IO BG.CBool)
sDL_SetGamepadSensorEnabled =
  BG.unsafePerformIO hs_bindgen_04571bb432b35b67

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadSensorEnabled@
foreign import ccall unsafe "hs_bindgen_98c53abf20c77167"
  hs_bindgen_98c53abf20c77167_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GamepadSensorEnabled@
hs_bindgen_98c53abf20c77167
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType -> IO BG.CBool))
hs_bindgen_98c53abf20c77167 =
  BG.fromFFIType hs_bindgen_98c53abf20c77167_base

{-# NOINLINE sDL_GamepadSensorEnabled #-}

-- | Query whether sensor data reporting is enabled for a gamepad.
--
--     [@gamepad@]: the gamepad to query.
--
--     [@type@]: the type of sensor to query.
--
--     [Returns]: true if the sensor is enabled, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetGamepadSensorEnabled'
--
--     [C declaration]: @SDL_GamepadSensorEnabled@, defined at @SDL3\/SDL_gamepad.h 1479:34@
sDL_GamepadSensorEnabled
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType -> IO BG.CBool)
sDL_GamepadSensorEnabled =
  BG.unsafePerformIO hs_bindgen_98c53abf20c77167

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadSensorDataRate@
foreign import ccall unsafe "hs_bindgen_b6592bd554a6f989"
  hs_bindgen_b6592bd554a6f989_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadSensorDataRate@
hs_bindgen_b6592bd554a6f989
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType -> IO BG.CFloat))
hs_bindgen_b6592bd554a6f989 =
  BG.fromFFIType hs_bindgen_b6592bd554a6f989_base

{-# NOINLINE sDL_GetGamepadSensorDataRate #-}

-- | Get the data rate (number of events per second) of a gamepad sensor.
--
--     [@gamepad@]: the gamepad to query.
--
--     [@type@]: the type of sensor to query.
--
--     [Returns]: the data rate, or 0.0f if the data rate is not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadSensorDataRate@, defined at @SDL3\/SDL_gamepad.h 1492:35@
sDL_GetGamepadSensorDataRate
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType -> IO BG.CFloat)
sDL_GetGamepadSensorDataRate =
  BG.unsafePerformIO hs_bindgen_b6592bd554a6f989

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadSensorData@
foreign import ccall unsafe "hs_bindgen_9753ce47b936d3ec"
  hs_bindgen_9753ce47b936d3ec_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadSensorData@
hs_bindgen_9753ce47b936d3ec
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Gamepad
             -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
             -> BG.Ptr BG.CFloat
             -> BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_9753ce47b936d3ec =
  BG.fromFFIType hs_bindgen_9753ce47b936d3ec_base

{-# NOINLINE sDL_GetGamepadSensorData #-}

-- | Get the current state of a gamepad sensor.
--
--     The number of values and interpretation of the data is sensor dependent. See the remarks in SDL_SensorType for details for each type of sensor.
--
--     [@gamepad@]: the gamepad to query.
--
--     [@type@]: the type of sensor to query.
--
--     [@data@]: a pointer filled with the current sensor state.
--
--     [@num_values@]: the number of values to write to data.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadSensorData@, defined at @SDL3\/SDL_gamepad.h 1511:34@
sDL_GetGamepadSensorData
  :: BG.FunPtr
       ( BG.Ptr SDL_Gamepad
         -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
         -> BG.Ptr BG.CFloat
         -> BG.CInt
         -> IO BG.CBool
       )
sDL_GetGamepadSensorData =
  BG.unsafePerformIO hs_bindgen_9753ce47b936d3ec

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_RumbleGamepad@
foreign import ccall unsafe "hs_bindgen_66c29b053dd2103a"
  hs_bindgen_66c29b053dd2103a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_RumbleGamepad@
hs_bindgen_66c29b053dd2103a
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Gamepad
             -> SDL3.Sys.Bindgen.Stdinc.Uint16
             -> SDL3.Sys.Bindgen.Stdinc.Uint16
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_66c29b053dd2103a =
  BG.fromFFIType hs_bindgen_66c29b053dd2103a_base

{-# NOINLINE sDL_RumbleGamepad #-}

-- | Start a rumble effect on a gamepad.
--
--     Each call to this function cancels any previous rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     This function requires you to process SDL events or call SDL_UpdateJoysticks() to update rumble state.
--
--     [@gamepad@]: the gamepad to vibrate.
--
--     [@low_frequency_rumble@]: the intensity of the low frequency (left) rumble motor, from 0 to 0xFFFF.
--
--     [@high_frequency_rumble@]: the intensity of the high frequency (right) rumble motor, from 0 to 0xFFFF.
--
--     [@duration_ms@]: the duration of the rumble effect, in milliseconds.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RumbleGamepad@, defined at @SDL3\/SDL_gamepad.h 1535:34@
sDL_RumbleGamepad
  :: BG.FunPtr
       ( BG.Ptr SDL_Gamepad
         -> SDL3.Sys.Bindgen.Stdinc.Uint16
         -> SDL3.Sys.Bindgen.Stdinc.Uint16
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_RumbleGamepad =
  BG.unsafePerformIO hs_bindgen_66c29b053dd2103a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_RumbleGamepadTriggers@
foreign import ccall unsafe "hs_bindgen_d96d791857c3d06b"
  hs_bindgen_d96d791857c3d06b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_RumbleGamepadTriggers@
hs_bindgen_d96d791857c3d06b
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Gamepad
             -> SDL3.Sys.Bindgen.Stdinc.Uint16
             -> SDL3.Sys.Bindgen.Stdinc.Uint16
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_d96d791857c3d06b =
  BG.fromFFIType hs_bindgen_d96d791857c3d06b_base

{-# NOINLINE sDL_RumbleGamepadTriggers #-}

-- | Start a rumble effect in the gamepad\'s triggers.
--
--     Each call to this function cancels any previous trigger rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     Note that this is rumbling of the /triggers/ and not the gamepad as a whole. This is currently only supported on Xbox One gamepads. If you want the (more common) whole-gamepad rumble, use @SDL_RumbleGamepad()@ instead.
--
--     This function requires you to process SDL events or call SDL_UpdateJoysticks() to update rumble state.
--
--     [@gamepad@]: the gamepad to vibrate.
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
--     [See also]: 'sDL_RumbleGamepad'
--
--     [C declaration]: @SDL_RumbleGamepadTriggers@, defined at @SDL3\/SDL_gamepad.h 1565:34@
sDL_RumbleGamepadTriggers
  :: BG.FunPtr
       ( BG.Ptr SDL_Gamepad
         -> SDL3.Sys.Bindgen.Stdinc.Uint16
         -> SDL3.Sys.Bindgen.Stdinc.Uint16
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_RumbleGamepadTriggers =
  BG.unsafePerformIO hs_bindgen_d96d791857c3d06b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadLED@
foreign import ccall unsafe "hs_bindgen_fb1de1463dc236a8"
  hs_bindgen_fb1de1463dc236a8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SetGamepadLED@
hs_bindgen_fb1de1463dc236a8
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Gamepad
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO BG.CBool
           )
       )
hs_bindgen_fb1de1463dc236a8 =
  BG.fromFFIType hs_bindgen_fb1de1463dc236a8_base

{-# NOINLINE sDL_SetGamepadLED #-}

-- | Update a gamepad\'s LED color.
--
--     An example of a joystick LED is the light on the back of a PlayStation 4\'s DualShock 4 controller.
--
--     For gamepads with a single color LED, the maximum of the RGB values will be used as the LED brightness.
--
--     [@gamepad@]: the gamepad to update.
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
--     [C declaration]: @SDL_SetGamepadLED@, defined at @SDL3\/SDL_gamepad.h 1587:34@
sDL_SetGamepadLED
  :: BG.FunPtr
       ( BG.Ptr SDL_Gamepad
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO BG.CBool
       )
sDL_SetGamepadLED =
  BG.unsafePerformIO hs_bindgen_fb1de1463dc236a8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SendGamepadEffect@
foreign import ccall unsafe "hs_bindgen_5961396a3fadcac6"
  hs_bindgen_5961396a3fadcac6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_SendGamepadEffect@
hs_bindgen_5961396a3fadcac6
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO BG.CBool))
hs_bindgen_5961396a3fadcac6 =
  BG.fromFFIType hs_bindgen_5961396a3fadcac6_base

{-# NOINLINE sDL_SendGamepadEffect #-}

-- | Send a gamepad specific effect packet.
--
--     [@gamepad@]: the gamepad to affect.
--
--     [@data@]: the data to send to the gamepad.
--
--     [@size@]: the size of the data to send to the gamepad.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SendGamepadEffect@, defined at @SDL3\/SDL_gamepad.h 1602:34@
sDL_SendGamepadEffect
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO BG.CBool)
sDL_SendGamepadEffect =
  BG.unsafePerformIO hs_bindgen_5961396a3fadcac6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_CloseGamepad@
foreign import ccall unsafe "hs_bindgen_599bdf2afa4631b2"
  hs_bindgen_599bdf2afa4631b2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_CloseGamepad@
hs_bindgen_599bdf2afa4631b2 :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> IO ()))
hs_bindgen_599bdf2afa4631b2 =
  BG.fromFFIType hs_bindgen_599bdf2afa4631b2_base

{-# NOINLINE sDL_CloseGamepad #-}

-- | Close a gamepad previously opened with @SDL_OpenGamepad()@.
--
--     [@gamepad@]: a gamepad identifier previously returned by @SDL_OpenGamepad()@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenGamepad'
--
--     [C declaration]: @SDL_CloseGamepad@, defined at @SDL3\/SDL_gamepad.h 1616:34@
sDL_CloseGamepad :: BG.FunPtr (BG.Ptr SDL_Gamepad -> IO ())
sDL_CloseGamepad =
  BG.unsafePerformIO hs_bindgen_599bdf2afa4631b2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadAppleSFSymbolsNameForButton@
foreign import ccall unsafe "hs_bindgen_901b303b0d647ea4"
  hs_bindgen_901b303b0d647ea4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadAppleSFSymbolsNameForButton@
hs_bindgen_901b303b0d647ea4
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadButton -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_901b303b0d647ea4 =
  BG.fromFFIType hs_bindgen_901b303b0d647ea4_base

{-# NOINLINE sDL_GetGamepadAppleSFSymbolsNameForButton #-}

-- | Return the sfSymbolsName for a given button on a gamepad on Apple platforms.
--
--     [@gamepad@]: the gamepad to query.
--
--     [@button@]: a button on the gamepad.
--
--     [Returns]: the sfSymbolsName or NULL if the name can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadAppleSFSymbolsNameForAxis'
--
--     [C declaration]: @SDL_GetGamepadAppleSFSymbolsNameForButton@, defined at @SDL3\/SDL_gamepad.h 1632:42@
sDL_GetGamepadAppleSFSymbolsNameForButton
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadButton -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetGamepadAppleSFSymbolsNameForButton =
  BG.unsafePerformIO hs_bindgen_901b303b0d647ea4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadAppleSFSymbolsNameForAxis@
foreign import ccall unsafe "hs_bindgen_0f564808a8b0fec7"
  hs_bindgen_0f564808a8b0fec7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_get_SDL_GetGamepadAppleSFSymbolsNameForAxis@
hs_bindgen_0f564808a8b0fec7
  :: IO (BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadAxis -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_0f564808a8b0fec7 =
  BG.fromFFIType hs_bindgen_0f564808a8b0fec7_base

{-# NOINLINE sDL_GetGamepadAppleSFSymbolsNameForAxis #-}

-- | Return the sfSymbolsName for a given axis on a gamepad on Apple platforms.
--
--     [@gamepad@]: the gamepad to query.
--
--     [@axis@]: an axis on the gamepad.
--
--     [Returns]: the sfSymbolsName or NULL if the name can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGamepadAppleSFSymbolsNameForButton'
--
--     [C declaration]: @SDL_GetGamepadAppleSFSymbolsNameForAxis@, defined at @SDL3\/SDL_gamepad.h 1647:42@
sDL_GetGamepadAppleSFSymbolsNameForAxis
  :: BG.FunPtr (BG.Ptr SDL_Gamepad -> SDL_GamepadAxis -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetGamepadAppleSFSymbolsNameForAxis =
  BG.unsafePerformIO hs_bindgen_0f564808a8b0fec7

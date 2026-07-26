{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Gamepad.Safe (
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_AddGamepadMapping,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_AddGamepadMappingsFromIO,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_AddGamepadMappingsFromFile,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_ReloadGamepadMappings,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadMappings,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadMappingForGUID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadMapping,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_SetGamepadMapping,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_HasGamepad,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepads,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_IsGamepad,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadNameForID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadPathForID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadPlayerIndexForID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadGUIDForID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadVendorForID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadProductForID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadProductVersionForID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadTypeForID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetRealGamepadTypeForID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadMappingForID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_OpenGamepad,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadFromID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadFromPlayerIndex,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadProperties,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadID,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadName,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadPath,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadType,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetRealGamepadType,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadPlayerIndex,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_SetGamepadPlayerIndex,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadVendor,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadProduct,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadProductVersion,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadFirmwareVersion,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadSerial,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadSteamHandle,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadConnectionState,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadPowerInfo,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GamepadConnected,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadJoystick,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_SetGamepadEventsEnabled,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GamepadEventsEnabled,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadBindings,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_UpdateGamepads,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadTypeFromString,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadStringForType,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadAxisFromString,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadStringForAxis,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GamepadHasAxis,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadAxis,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadButtonFromString,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadStringForButton,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GamepadHasButton,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadButton,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadButtonLabelForType,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadButtonLabel,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetNumGamepadTouchpads,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetNumGamepadTouchpadFingers,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadTouchpadFinger,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GamepadHasSensor,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_SetGamepadSensorEnabled,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GamepadSensorEnabled,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadSensorDataRate,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadSensorData,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_RumbleGamepad,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_RumbleGamepadTriggers,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_SetGamepadLED,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_SendGamepadEffect,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_CloseGamepad,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadAppleSFSymbolsNameForButton,
  SDL3.Sys.Bindgen.Gamepad.Safe.sDL_GetGamepadAppleSFSymbolsNameForAxis,
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
         , "signed int hs_bindgen_bfecaa94b4bb559c ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_AddGamepadMapping)(arg1);"
         , "}"
         , "signed int hs_bindgen_353a6b5bd096f6c7 ("
         , "  SDL_IOStream *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_AddGamepadMappingsFromIO)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_614bba8a883d270a ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_AddGamepadMappingsFromFile)(arg1);"
         , "}"
         , "_Bool hs_bindgen_31760265cd8832be (void)"
         , "{"
         , "  return (SDL_ReloadGamepadMappings)();"
         , "}"
         , "char **hs_bindgen_81df6a54918d3add ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadMappings)(arg1);"
         , "}"
         , "char *hs_bindgen_896f29e315329343 ("
         , "  SDL_GUID *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadMappingForGUID)(*arg1);"
         , "}"
         , "char *hs_bindgen_5d0f77ae41093626 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadMapping)(arg1);"
         , "}"
         , "_Bool hs_bindgen_cc4c1668ad855e48 ("
         , "  SDL_JoystickID arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetGamepadMapping)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_ead7e9bae6cc8b6c (void)"
         , "{"
         , "  return (SDL_HasGamepad)();"
         , "}"
         , "SDL_JoystickID *hs_bindgen_421fff3e92caf69d ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepads)(arg1);"
         , "}"
         , "_Bool hs_bindgen_9b50cb92bd86f924 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_IsGamepad)(arg1);"
         , "}"
         , "char const *hs_bindgen_6a86daab9ce329fa ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadNameForID)(arg1);"
         , "}"
         , "char const *hs_bindgen_e0c61c43c91c2ad5 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadPathForID)(arg1);"
         , "}"
         , "signed int hs_bindgen_9e9627ec0fb95c91 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadPlayerIndexForID)(arg1);"
         , "}"
         , "void hs_bindgen_894e3d306a7238d1 ("
         , "  SDL_JoystickID arg1,"
         , "  SDL_GUID *arg2"
         , ")"
         , "{"
         , "  *arg2 = (SDL_GetGamepadGUIDForID)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_e7c705655b3a7874 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadVendorForID)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_4e686291196aa2c3 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadProductForID)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_1ccf92ac47175916 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadProductVersionForID)(arg1);"
         , "}"
         , "SDL_GamepadType hs_bindgen_40fe0886e7b4ca2b ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadTypeForID)(arg1);"
         , "}"
         , "SDL_GamepadType hs_bindgen_ce2f9a72f07740df ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetRealGamepadTypeForID)(arg1);"
         , "}"
         , "char *hs_bindgen_35f90517327ebff6 ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadMappingForID)(arg1);"
         , "}"
         , "SDL_Gamepad *hs_bindgen_7a69f326fc28f33f ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_OpenGamepad)(arg1);"
         , "}"
         , "SDL_Gamepad *hs_bindgen_4439659d3691bcae ("
         , "  SDL_JoystickID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadFromID)(arg1);"
         , "}"
         , "SDL_Gamepad *hs_bindgen_9fa3f1ff076954bb ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadFromPlayerIndex)(arg1);"
         , "}"
         , "SDL_PropertiesID hs_bindgen_f9762d299959cd11 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadProperties)(arg1);"
         , "}"
         , "SDL_JoystickID hs_bindgen_88d41ce44a0eaed7 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadID)(arg1);"
         , "}"
         , "char const *hs_bindgen_a897dca974b53f52 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadName)(arg1);"
         , "}"
         , "char const *hs_bindgen_94e78977a2626634 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadPath)(arg1);"
         , "}"
         , "SDL_GamepadType hs_bindgen_9bee20d3afd78c1c ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadType)(arg1);"
         , "}"
         , "SDL_GamepadType hs_bindgen_991d5e997600b0ae ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetRealGamepadType)(arg1);"
         , "}"
         , "signed int hs_bindgen_9092bfb7b9ba5238 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadPlayerIndex)(arg1);"
         , "}"
         , "_Bool hs_bindgen_d6c6ba326b1b08b5 ("
         , "  SDL_Gamepad *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_SetGamepadPlayerIndex)(arg1, arg2);"
         , "}"
         , "Uint16 hs_bindgen_b499336f8c368df7 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadVendor)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_6795759ef7183633 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadProduct)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_aad1976ca8def689 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadProductVersion)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_9c5cbeb562bcb1a7 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadFirmwareVersion)(arg1);"
         , "}"
         , "char const *hs_bindgen_d5f06aeaa91c80e0 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadSerial)(arg1);"
         , "}"
         , "Uint64 hs_bindgen_67b2a6827bcd3e6d ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadSteamHandle)(arg1);"
         , "}"
         , "SDL_JoystickConnectionState hs_bindgen_51ab18aa239a2b97 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadConnectionState)(arg1);"
         , "}"
         , "SDL_PowerState hs_bindgen_9ac35ffbdb9db2d8 ("
         , "  SDL_Gamepad *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadPowerInfo)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_ceb9282898627775 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GamepadConnected)(arg1);"
         , "}"
         , "SDL_Joystick *hs_bindgen_c1e15069e5f0b3b4 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadJoystick)(arg1);"
         , "}"
         , "void hs_bindgen_aa68cf392dbe1717 ("
         , "  _Bool arg1"
         , ")"
         , "{"
         , "  (SDL_SetGamepadEventsEnabled)(arg1);"
         , "}"
         , "_Bool hs_bindgen_cd08b36ef0436bc1 (void)"
         , "{"
         , "  return (SDL_GamepadEventsEnabled)();"
         , "}"
         , "SDL_GamepadBinding **hs_bindgen_213ad716fb12ea93 ("
         , "  SDL_Gamepad *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadBindings)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_0006fa783d3b66ec (void)"
         , "{"
         , "  (SDL_UpdateGamepads)();"
         , "}"
         , "SDL_GamepadType hs_bindgen_793ab6d7edd0a66d ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadTypeFromString)(arg1);"
         , "}"
         , "char const *hs_bindgen_d426a8b3d196baf4 ("
         , "  SDL_GamepadType arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadStringForType)(arg1);"
         , "}"
         , "SDL_GamepadAxis hs_bindgen_5a9d122ea5094f40 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadAxisFromString)(arg1);"
         , "}"
         , "char const *hs_bindgen_9cbed523522c86f2 ("
         , "  SDL_GamepadAxis arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadStringForAxis)(arg1);"
         , "}"
         , "_Bool hs_bindgen_6d87cb6c759a128e ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadAxis arg2"
         , ")"
         , "{"
         , "  return (SDL_GamepadHasAxis)(arg1, arg2);"
         , "}"
         , "Sint16 hs_bindgen_d4e206062bf3a0b7 ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadAxis arg2"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadAxis)(arg1, arg2);"
         , "}"
         , "SDL_GamepadButton hs_bindgen_3d3d13260e5bf752 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadButtonFromString)(arg1);"
         , "}"
         , "char const *hs_bindgen_7d3134eb357b2911 ("
         , "  SDL_GamepadButton arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadStringForButton)(arg1);"
         , "}"
         , "_Bool hs_bindgen_835e151fd6fbdcd9 ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadButton arg2"
         , ")"
         , "{"
         , "  return (SDL_GamepadHasButton)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_930a123ab5a67173 ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadButton arg2"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadButton)(arg1, arg2);"
         , "}"
         , "SDL_GamepadButtonLabel hs_bindgen_3a07981024fde2b9 ("
         , "  SDL_GamepadType arg1,"
         , "  SDL_GamepadButton arg2"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadButtonLabelForType)(arg1, arg2);"
         , "}"
         , "SDL_GamepadButtonLabel hs_bindgen_80f031ee04caea84 ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadButton arg2"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadButtonLabel)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_65d4ab0a10c0f69e ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetNumGamepadTouchpads)(arg1);"
         , "}"
         , "signed int hs_bindgen_d33ef1d9882dcbad ("
         , "  SDL_Gamepad *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_GetNumGamepadTouchpadFingers)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_225a3688e71f439f ("
         , "  SDL_Gamepad *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  _Bool *arg4,"
         , "  float *arg5,"
         , "  float *arg6,"
         , "  float *arg7"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadTouchpadFinger)(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
         , "}"
         , "_Bool hs_bindgen_1b3239ce64af9f86 ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_SensorType arg2"
         , ")"
         , "{"
         , "  return (SDL_GamepadHasSensor)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_3e3fc29af15c71c1 ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_SensorType arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return (SDL_SetGamepadSensorEnabled)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_826f084dc9c761ff ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_SensorType arg2"
         , ")"
         , "{"
         , "  return (SDL_GamepadSensorEnabled)(arg1, arg2);"
         , "}"
         , "float hs_bindgen_69751d524bc7ba71 ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_SensorType arg2"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadSensorDataRate)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_2c02178932dc8e57 ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_SensorType arg2,"
         , "  float *arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadSensorData)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_36f6edc2de497d1f ("
         , "  SDL_Gamepad *arg1,"
         , "  Uint16 arg2,"
         , "  Uint16 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return (SDL_RumbleGamepad)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_1ab471fbae93c977 ("
         , "  SDL_Gamepad *arg1,"
         , "  Uint16 arg2,"
         , "  Uint16 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return (SDL_RumbleGamepadTriggers)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_99951861ed614368 ("
         , "  SDL_Gamepad *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return (SDL_SetGamepadLED)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_0a60e2e403cd6afc ("
         , "  SDL_Gamepad *arg1,"
         , "  void const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SendGamepadEffect)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_7615a65af389a834 ("
         , "  SDL_Gamepad *arg1"
         , ")"
         , "{"
         , "  (SDL_CloseGamepad)(arg1);"
         , "}"
         , "char const *hs_bindgen_99f1aa16515a60df ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadButton arg2"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadAppleSFSymbolsNameForButton)(arg1, arg2);"
         , "}"
         , "char const *hs_bindgen_076ad522cfc3e68e ("
         , "  SDL_Gamepad *arg1,"
         , "  SDL_GamepadAxis arg2"
         , ")"
         , "{"
         , "  return (SDL_GetGamepadAppleSFSymbolsNameForAxis)(arg1, arg2);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_AddGamepadMapping@
foreign import ccall safe "hs_bindgen_bfecaa94b4bb559c"
  hs_bindgen_bfecaa94b4bb559c_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_AddGamepadMapping@
hs_bindgen_bfecaa94b4bb559c
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CInt
hs_bindgen_bfecaa94b4bb559c =
  BG.fromFFIType hs_bindgen_bfecaa94b4bb559c_base

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
--     [Returns]: 1 if a new mapping is added, 0 if an existing mapping is updated, -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddGamepadMappingsFromFile', 'sDL_AddGamepadMappingsFromIO', 'sDL_GetGamepadMapping', 'sDL_GetGamepadMappingForGUID', SDL_HINT_GAMECONTROLLERCONFIG, SDL_HINT_GAMECONTROLLERCONFIG_FILE, SDL_EVENT_GAMEPAD_ADDED
--
--     [C declaration]: @SDL_AddGamepadMapping@, defined at @SDL3\/SDL_gamepad.h 346:33@
sDL_AddGamepadMapping
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mapping@]: the mapping string.
  -> IO BG.CInt
sDL_AddGamepadMapping = hs_bindgen_bfecaa94b4bb559c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_AddGamepadMappingsFromIO@
foreign import ccall safe "hs_bindgen_353a6b5bd096f6c7"
  hs_bindgen_353a6b5bd096f6c7_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_AddGamepadMappingsFromIO@
hs_bindgen_353a6b5bd096f6c7
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -> BG.CBool
  -> IO BG.CInt
hs_bindgen_353a6b5bd096f6c7 =
  BG.fromFFIType hs_bindgen_353a6b5bd096f6c7_base

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
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data stream for the mappings to be added.
  -> BG.CBool
  -- ^
  --
  --           [@closeio@]: if true, calls SDL_CloseIO() on @src@ before returning, even in the case of an error.
  -> IO BG.CInt
sDL_AddGamepadMappingsFromIO =
  hs_bindgen_353a6b5bd096f6c7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_AddGamepadMappingsFromFile@
foreign import ccall safe "hs_bindgen_614bba8a883d270a"
  hs_bindgen_614bba8a883d270a_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_AddGamepadMappingsFromFile@
hs_bindgen_614bba8a883d270a
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CInt
hs_bindgen_614bba8a883d270a =
  BG.fromFFIType hs_bindgen_614bba8a883d270a_base

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
--     [Returns]: the number of mappings added or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddGamepadMapping', 'sDL_AddGamepadMappingsFromIO', 'sDL_GetGamepadMapping', 'sDL_GetGamepadMappingForGUID', SDL_HINT_GAMECONTROLLERCONFIG, SDL_HINT_GAMECONTROLLERCONFIG_FILE, SDL_EVENT_GAMEPAD_ADDED
--
--     [C declaration]: @SDL_AddGamepadMappingsFromFile@, defined at @SDL3\/SDL_gamepad.h 420:33@
sDL_AddGamepadMappingsFromFile
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the mappings file to load.
  -> IO BG.CInt
sDL_AddGamepadMappingsFromFile =
  hs_bindgen_614bba8a883d270a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_ReloadGamepadMappings@
foreign import ccall safe "hs_bindgen_31760265cd8832be"
  hs_bindgen_31760265cd8832be_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_ReloadGamepadMappings@
hs_bindgen_31760265cd8832be :: IO BG.CBool
hs_bindgen_31760265cd8832be =
  BG.fromFFIType hs_bindgen_31760265cd8832be_base

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
sDL_ReloadGamepadMappings :: IO BG.CBool
sDL_ReloadGamepadMappings =
  hs_bindgen_31760265cd8832be

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadMappings@
foreign import ccall safe "hs_bindgen_81df6a54918d3add"
  hs_bindgen_81df6a54918d3add_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadMappings@
hs_bindgen_81df6a54918d3add
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
hs_bindgen_81df6a54918d3add =
  BG.fromFFIType hs_bindgen_81df6a54918d3add_base

-- | Get the current gamepad mappings.
--
--     [Returns]: an array of the mapping strings, NULL-terminated, or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadMappings@, defined at @SDL3\/SDL_gamepad.h 450:37@
sDL_GetGamepadMappings
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of mappings returned, can be NULL.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
sDL_GetGamepadMappings = hs_bindgen_81df6a54918d3add

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadMappingForGUID@
foreign import ccall safe "hs_bindgen_896f29e315329343"
  hs_bindgen_896f29e315329343_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadMappingForGUID@
hs_bindgen_896f29e315329343
  :: BG.Ptr SDL3.Sys.Bindgen.Guid.SDL_GUID
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_896f29e315329343 =
  BG.fromFFIType hs_bindgen_896f29e315329343_base

-- | Get the gamepad mapping string for a given GUID.
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
sDL_GetGamepadMappingForGUID
  :: SDL3.Sys.Bindgen.Guid.SDL_GUID
  -- ^
  --
  --           [@guid@]: a structure containing the GUID for which a mapping is desired.
  -> IO (BG.Ptr BG.CChar)
sDL_GetGamepadMappingForGUID =
  \guid0 ->
    BG.with
      guid0
      ( \guid1 ->
          hs_bindgen_896f29e315329343 guid1
      )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadMapping@
foreign import ccall safe "hs_bindgen_5d0f77ae41093626"
  hs_bindgen_5d0f77ae41093626_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadMapping@
hs_bindgen_5d0f77ae41093626
  :: BG.Ptr SDL_Gamepad
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_5d0f77ae41093626 =
  BG.fromFFIType hs_bindgen_5d0f77ae41093626_base

-- | Get the current mapping of a gamepad.
--
--     Details about mappings are discussed with @SDL_AddGamepadMapping()@.
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
sDL_GetGamepadMapping
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad you want to get the current mapping for.
  -> IO (BG.Ptr BG.CChar)
sDL_GetGamepadMapping = hs_bindgen_5d0f77ae41093626

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_SetGamepadMapping@
foreign import ccall safe "hs_bindgen_cc4c1668ad855e48"
  hs_bindgen_cc4c1668ad855e48_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_SetGamepadMapping@
hs_bindgen_cc4c1668ad855e48
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_cc4c1668ad855e48 =
  BG.fromFFIType hs_bindgen_cc4c1668ad855e48_base

-- | Set the current mapping of a joystick or gamepad.
--
--     Details about mappings are discussed with @SDL_AddGamepadMapping()@.
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
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mapping@]: the mapping to use for this device, or NULL to clear the mapping.
  -> IO BG.CBool
sDL_SetGamepadMapping = hs_bindgen_cc4c1668ad855e48

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_HasGamepad@
foreign import ccall safe "hs_bindgen_ead7e9bae6cc8b6c"
  hs_bindgen_ead7e9bae6cc8b6c_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_HasGamepad@
hs_bindgen_ead7e9bae6cc8b6c :: IO BG.CBool
hs_bindgen_ead7e9bae6cc8b6c =
  BG.fromFFIType hs_bindgen_ead7e9bae6cc8b6c_base

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
sDL_HasGamepad :: IO BG.CBool
sDL_HasGamepad = hs_bindgen_ead7e9bae6cc8b6c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepads@
foreign import ccall safe "hs_bindgen_421fff3e92caf69d"
  hs_bindgen_421fff3e92caf69d_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepads@
hs_bindgen_421fff3e92caf69d
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
hs_bindgen_421fff3e92caf69d =
  BG.fromFFIType hs_bindgen_421fff3e92caf69d_base

-- | Get a list of currently connected gamepads.
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
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of gamepads returned, may be NULL.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_JoystickID)
sDL_GetGamepads = hs_bindgen_421fff3e92caf69d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_IsGamepad@
foreign import ccall safe "hs_bindgen_9b50cb92bd86f924"
  hs_bindgen_9b50cb92bd86f924_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_IsGamepad@
hs_bindgen_9b50cb92bd86f924
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> IO BG.CBool
hs_bindgen_9b50cb92bd86f924 =
  BG.fromFFIType hs_bindgen_9b50cb92bd86f924_base

-- | Check if the given joystick is supported by the gamepad interface.
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
sDL_IsGamepad
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.CBool
sDL_IsGamepad = hs_bindgen_9b50cb92bd86f924

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadNameForID@
foreign import ccall safe "hs_bindgen_6a86daab9ce329fa"
  hs_bindgen_6a86daab9ce329fa_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadNameForID@
hs_bindgen_6a86daab9ce329fa
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_6a86daab9ce329fa =
  BG.fromFFIType hs_bindgen_6a86daab9ce329fa_base

-- | Get the implementation dependent name of a gamepad.
--
--     This can be called before any gamepads are opened.
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
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetGamepadNameForID = hs_bindgen_6a86daab9ce329fa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadPathForID@
foreign import ccall safe "hs_bindgen_e0c61c43c91c2ad5"
  hs_bindgen_e0c61c43c91c2ad5_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadPathForID@
hs_bindgen_e0c61c43c91c2ad5
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_e0c61c43c91c2ad5 =
  BG.fromFFIType hs_bindgen_e0c61c43c91c2ad5_base

-- | Get the implementation dependent path of a gamepad.
--
--     This can be called before any gamepads are opened.
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
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetGamepadPathForID = hs_bindgen_e0c61c43c91c2ad5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadPlayerIndexForID@
foreign import ccall safe "hs_bindgen_9e9627ec0fb95c91"
  hs_bindgen_9e9627ec0fb95c91_base
    :: BG.Word32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadPlayerIndexForID@
hs_bindgen_9e9627ec0fb95c91
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> IO BG.CInt
hs_bindgen_9e9627ec0fb95c91 =
  BG.fromFFIType hs_bindgen_9e9627ec0fb95c91_base

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
--     [See also]: 'sDL_GetGamepadPlayerIndex', 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_GetGamepadPlayerIndexForID@, defined at @SDL3\/SDL_gamepad.h 608:33@
sDL_GetGamepadPlayerIndexForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO BG.CInt
sDL_GetGamepadPlayerIndexForID =
  hs_bindgen_9e9627ec0fb95c91

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadGUIDForID@
foreign import ccall safe "hs_bindgen_894e3d306a7238d1"
  hs_bindgen_894e3d306a7238d1_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadGUIDForID@
hs_bindgen_894e3d306a7238d1
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> BG.Ptr SDL3.Sys.Bindgen.Guid.SDL_GUID
  -> IO ()
hs_bindgen_894e3d306a7238d1 =
  BG.fromFFIType hs_bindgen_894e3d306a7238d1_base

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
--     [See also]: SDL_GUIDToString, 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_GetGamepadGUIDForID@, defined at @SDL3\/SDL_gamepad.h 626:38@
sDL_GetGamepadGUIDForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL3.Sys.Bindgen.Guid.SDL_GUID
sDL_GetGamepadGUIDForID =
  \instance_id0 ->
    BG.allocaAndPeek
      ( \res1 ->
          hs_bindgen_894e3d306a7238d1 instance_id0 res1
      )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadVendorForID@
foreign import ccall safe "hs_bindgen_e7c705655b3a7874"
  hs_bindgen_e7c705655b3a7874_base
    :: BG.Word32
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadVendorForID@
hs_bindgen_e7c705655b3a7874
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_e7c705655b3a7874 =
  BG.fromFFIType hs_bindgen_e7c705655b3a7874_base

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
--     [See also]: 'sDL_GetGamepadVendor', 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_GetGamepadVendorForID@, defined at @SDL3\/SDL_gamepad.h 645:36@
sDL_GetGamepadVendorForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetGamepadVendorForID =
  hs_bindgen_e7c705655b3a7874

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadProductForID@
foreign import ccall safe "hs_bindgen_4e686291196aa2c3"
  hs_bindgen_4e686291196aa2c3_base
    :: BG.Word32
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadProductForID@
hs_bindgen_4e686291196aa2c3
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_4e686291196aa2c3 =
  BG.fromFFIType hs_bindgen_4e686291196aa2c3_base

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
--     [See also]: 'sDL_GetGamepadProduct', 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_GetGamepadProductForID@, defined at @SDL3\/SDL_gamepad.h 664:36@
sDL_GetGamepadProductForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetGamepadProductForID =
  hs_bindgen_4e686291196aa2c3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadProductVersionForID@
foreign import ccall safe "hs_bindgen_1ccf92ac47175916"
  hs_bindgen_1ccf92ac47175916_base
    :: BG.Word32
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadProductVersionForID@
hs_bindgen_1ccf92ac47175916
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_1ccf92ac47175916 =
  BG.fromFFIType hs_bindgen_1ccf92ac47175916_base

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
--     [See also]: 'sDL_GetGamepadProductVersion', 'sDL_GetGamepads'
--
--     [C declaration]: @SDL_GetGamepadProductVersionForID@, defined at @SDL3\/SDL_gamepad.h 683:36@
sDL_GetGamepadProductVersionForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetGamepadProductVersionForID =
  hs_bindgen_1ccf92ac47175916

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadTypeForID@
foreign import ccall safe "hs_bindgen_40fe0886e7b4ca2b"
  hs_bindgen_40fe0886e7b4ca2b_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadTypeForID@
hs_bindgen_40fe0886e7b4ca2b
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> IO SDL_GamepadType
hs_bindgen_40fe0886e7b4ca2b =
  BG.fromFFIType hs_bindgen_40fe0886e7b4ca2b_base

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
--     [See also]: 'sDL_GetGamepadType', 'sDL_GetGamepads', 'sDL_GetRealGamepadTypeForID'
--
--     [C declaration]: @SDL_GetGamepadTypeForID@, defined at @SDL3\/SDL_gamepad.h 701:45@
sDL_GetGamepadTypeForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL_GamepadType
sDL_GetGamepadTypeForID = hs_bindgen_40fe0886e7b4ca2b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetRealGamepadTypeForID@
foreign import ccall safe "hs_bindgen_ce2f9a72f07740df"
  hs_bindgen_ce2f9a72f07740df_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetRealGamepadTypeForID@
hs_bindgen_ce2f9a72f07740df
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> IO SDL_GamepadType
hs_bindgen_ce2f9a72f07740df =
  BG.fromFFIType hs_bindgen_ce2f9a72f07740df_base

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
--     [See also]: 'sDL_GetGamepadTypeForID', 'sDL_GetGamepads', 'sDL_GetRealGamepadType'
--
--     [C declaration]: @SDL_GetRealGamepadTypeForID@, defined at @SDL3\/SDL_gamepad.h 719:45@
sDL_GetRealGamepadTypeForID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO SDL_GamepadType
sDL_GetRealGamepadTypeForID =
  hs_bindgen_ce2f9a72f07740df

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadMappingForID@
foreign import ccall safe "hs_bindgen_35f90517327ebff6"
  hs_bindgen_35f90517327ebff6_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadMappingForID@
hs_bindgen_35f90517327ebff6
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_35f90517327ebff6 =
  BG.fromFFIType hs_bindgen_35f90517327ebff6_base

-- | Get the mapping of a gamepad.
--
--     This can be called before any gamepads are opened.
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
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (BG.Ptr BG.CChar)
sDL_GetGamepadMappingForID =
  hs_bindgen_35f90517327ebff6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_OpenGamepad@
foreign import ccall safe "hs_bindgen_7a69f326fc28f33f"
  hs_bindgen_7a69f326fc28f33f_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_OpenGamepad@
hs_bindgen_7a69f326fc28f33f
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> IO (BG.Ptr SDL_Gamepad)
hs_bindgen_7a69f326fc28f33f =
  BG.fromFFIType hs_bindgen_7a69f326fc28f33f_base

-- | Open a gamepad for use.
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
sDL_OpenGamepad
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID.
  -> IO (BG.Ptr SDL_Gamepad)
sDL_OpenGamepad = hs_bindgen_7a69f326fc28f33f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadFromID@
foreign import ccall safe "hs_bindgen_4439659d3691bcae"
  hs_bindgen_4439659d3691bcae_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadFromID@
hs_bindgen_4439659d3691bcae
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -> IO (BG.Ptr SDL_Gamepad)
hs_bindgen_4439659d3691bcae =
  BG.fromFFIType hs_bindgen_4439659d3691bcae_base

-- | Get the 'SDL_Gamepad' associated with a joystick instance ID, if it has been opened.
--
--     [Returns]: an 'SDL_Gamepad' on success or NULL on failure or if it hasn\'t been opened yet; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadFromID@, defined at @SDL3\/SDL_gamepad.h 767:43@
sDL_GetGamepadFromID
  :: SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
  -- ^
  --
  --           [@instance_id@]: the joystick instance ID of the gamepad.
  -> IO (BG.Ptr SDL_Gamepad)
sDL_GetGamepadFromID = hs_bindgen_4439659d3691bcae

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadFromPlayerIndex@
foreign import ccall safe "hs_bindgen_9fa3f1ff076954bb"
  hs_bindgen_9fa3f1ff076954bb_base
    :: BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadFromPlayerIndex@
hs_bindgen_9fa3f1ff076954bb
  :: BG.CInt
  -> IO (BG.Ptr SDL_Gamepad)
hs_bindgen_9fa3f1ff076954bb =
  BG.fromFFIType hs_bindgen_9fa3f1ff076954bb_base

-- | Get the 'SDL_Gamepad' associated with a player index.
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
sDL_GetGamepadFromPlayerIndex
  :: BG.CInt
  -- ^
  --
  --           [@player_index@]: the player index, which different from the instance ID.
  -> IO (BG.Ptr SDL_Gamepad)
sDL_GetGamepadFromPlayerIndex =
  hs_bindgen_9fa3f1ff076954bb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadProperties@
foreign import ccall safe "hs_bindgen_f9762d299959cd11"
  hs_bindgen_f9762d299959cd11_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadProperties@
hs_bindgen_f9762d299959cd11
  :: BG.Ptr SDL_Gamepad
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_f9762d299959cd11 =
  BG.fromFFIType hs_bindgen_f9762d299959cd11_base

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
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadProperties@, defined at @SDL3\/SDL_gamepad.h 811:46@
sDL_GetGamepadProperties
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @SDL_OpenGamepad()@.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_GetGamepadProperties =
  hs_bindgen_f9762d299959cd11

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadID@
foreign import ccall safe "hs_bindgen_88d41ce44a0eaed7"
  hs_bindgen_88d41ce44a0eaed7_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadID@
hs_bindgen_88d41ce44a0eaed7
  :: BG.Ptr SDL_Gamepad
  -> IO SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
hs_bindgen_88d41ce44a0eaed7 =
  BG.fromFFIType hs_bindgen_88d41ce44a0eaed7_base

-- | Get the instance ID of an opened gamepad.
--
--     [Returns]: the instance ID of the specified gamepad on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadID@, defined at @SDL3\/SDL_gamepad.h 831:44@
sDL_GetGamepadID
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @SDL_OpenGamepad()@.
  -> IO SDL3.Sys.Bindgen.Joystick.SDL_JoystickID
sDL_GetGamepadID = hs_bindgen_88d41ce44a0eaed7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadName@
foreign import ccall safe "hs_bindgen_a897dca974b53f52"
  hs_bindgen_a897dca974b53f52_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadName@
hs_bindgen_a897dca974b53f52
  :: BG.Ptr SDL_Gamepad
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_a897dca974b53f52 =
  BG.fromFFIType hs_bindgen_a897dca974b53f52_base

-- | Get the implementation-dependent name for an opened gamepad.
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
sDL_GetGamepadName
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @SDL_OpenGamepad()@.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetGamepadName = hs_bindgen_a897dca974b53f52

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadPath@
foreign import ccall safe "hs_bindgen_94e78977a2626634"
  hs_bindgen_94e78977a2626634_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadPath@
hs_bindgen_94e78977a2626634
  :: BG.Ptr SDL_Gamepad
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_94e78977a2626634 =
  BG.fromFFIType hs_bindgen_94e78977a2626634_base

-- | Get the implementation-dependent path for an opened gamepad.
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
sDL_GetGamepadPath
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @SDL_OpenGamepad()@.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetGamepadPath = hs_bindgen_94e78977a2626634

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadType@
foreign import ccall safe "hs_bindgen_9bee20d3afd78c1c"
  hs_bindgen_9bee20d3afd78c1c_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadType@
hs_bindgen_9bee20d3afd78c1c
  :: BG.Ptr SDL_Gamepad
  -> IO SDL_GamepadType
hs_bindgen_9bee20d3afd78c1c =
  BG.fromFFIType hs_bindgen_9bee20d3afd78c1c_base

-- | Get the type of an opened gamepad.
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
sDL_GetGamepadType
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL_GamepadType
sDL_GetGamepadType = hs_bindgen_9bee20d3afd78c1c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetRealGamepadType@
foreign import ccall safe "hs_bindgen_991d5e997600b0ae"
  hs_bindgen_991d5e997600b0ae_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetRealGamepadType@
hs_bindgen_991d5e997600b0ae
  :: BG.Ptr SDL_Gamepad
  -> IO SDL_GamepadType
hs_bindgen_991d5e997600b0ae =
  BG.fromFFIType hs_bindgen_991d5e997600b0ae_base

-- | Get the type of an opened gamepad, ignoring any mapping override.
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
sDL_GetRealGamepadType
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL_GamepadType
sDL_GetRealGamepadType = hs_bindgen_991d5e997600b0ae

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadPlayerIndex@
foreign import ccall safe "hs_bindgen_9092bfb7b9ba5238"
  hs_bindgen_9092bfb7b9ba5238_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadPlayerIndex@
hs_bindgen_9092bfb7b9ba5238
  :: BG.Ptr SDL_Gamepad
  -> IO BG.CInt
hs_bindgen_9092bfb7b9ba5238 =
  BG.fromFFIType hs_bindgen_9092bfb7b9ba5238_base

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
--     [See also]: 'sDL_SetGamepadPlayerIndex'
--
--     [C declaration]: @SDL_GetGamepadPlayerIndex@, defined at @SDL3\/SDL_gamepad.h 909:33@
sDL_GetGamepadPlayerIndex
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO BG.CInt
sDL_GetGamepadPlayerIndex =
  hs_bindgen_9092bfb7b9ba5238

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_SetGamepadPlayerIndex@
foreign import ccall safe "hs_bindgen_d6c6ba326b1b08b5"
  hs_bindgen_d6c6ba326b1b08b5_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_SetGamepadPlayerIndex@
hs_bindgen_d6c6ba326b1b08b5
  :: BG.Ptr SDL_Gamepad
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_d6c6ba326b1b08b5 =
  BG.fromFFIType hs_bindgen_d6c6ba326b1b08b5_base

-- | Set the player index of an opened gamepad.
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
sDL_SetGamepadPlayerIndex
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to adjust.
  -> BG.CInt
  -- ^
  --
  --           [@player_index@]: player index to assign to this gamepad, or -1 to clear the player index and turn off player LEDs.
  -> IO BG.CBool
sDL_SetGamepadPlayerIndex =
  hs_bindgen_d6c6ba326b1b08b5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadVendor@
foreign import ccall safe "hs_bindgen_b499336f8c368df7"
  hs_bindgen_b499336f8c368df7_base
    :: BG.Ptr BG.Void
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadVendor@
hs_bindgen_b499336f8c368df7
  :: BG.Ptr SDL_Gamepad
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_b499336f8c368df7 =
  BG.fromFFIType hs_bindgen_b499336f8c368df7_base

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
--     [See also]: 'sDL_GetGamepadVendorForID'
--
--     [C declaration]: @SDL_GetGamepadVendor@, defined at @SDL3\/SDL_gamepad.h 942:36@
sDL_GetGamepadVendor
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetGamepadVendor = hs_bindgen_b499336f8c368df7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadProduct@
foreign import ccall safe "hs_bindgen_6795759ef7183633"
  hs_bindgen_6795759ef7183633_base
    :: BG.Ptr BG.Void
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadProduct@
hs_bindgen_6795759ef7183633
  :: BG.Ptr SDL_Gamepad
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_6795759ef7183633 =
  BG.fromFFIType hs_bindgen_6795759ef7183633_base

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
--     [See also]: 'sDL_GetGamepadProductForID'
--
--     [C declaration]: @SDL_GetGamepadProduct@, defined at @SDL3\/SDL_gamepad.h 958:36@
sDL_GetGamepadProduct
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetGamepadProduct = hs_bindgen_6795759ef7183633

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadProductVersion@
foreign import ccall safe "hs_bindgen_aad1976ca8def689"
  hs_bindgen_aad1976ca8def689_base
    :: BG.Ptr BG.Void
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadProductVersion@
hs_bindgen_aad1976ca8def689
  :: BG.Ptr SDL_Gamepad
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_aad1976ca8def689 =
  BG.fromFFIType hs_bindgen_aad1976ca8def689_base

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
--     [See also]: 'sDL_GetGamepadProductVersionForID'
--
--     [C declaration]: @SDL_GetGamepadProductVersion@, defined at @SDL3\/SDL_gamepad.h 974:36@
sDL_GetGamepadProductVersion
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetGamepadProductVersion =
  hs_bindgen_aad1976ca8def689

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadFirmwareVersion@
foreign import ccall safe "hs_bindgen_9c5cbeb562bcb1a7"
  hs_bindgen_9c5cbeb562bcb1a7_base
    :: BG.Ptr BG.Void
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadFirmwareVersion@
hs_bindgen_9c5cbeb562bcb1a7
  :: BG.Ptr SDL_Gamepad
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_9c5cbeb562bcb1a7 =
  BG.fromFFIType hs_bindgen_9c5cbeb562bcb1a7_base

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
--     [C declaration]: @SDL_GetGamepadFirmwareVersion@, defined at @SDL3\/SDL_gamepad.h 988:36@
sDL_GetGamepadFirmwareVersion
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
sDL_GetGamepadFirmwareVersion =
  hs_bindgen_9c5cbeb562bcb1a7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadSerial@
foreign import ccall safe "hs_bindgen_d5f06aeaa91c80e0"
  hs_bindgen_d5f06aeaa91c80e0_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadSerial@
hs_bindgen_d5f06aeaa91c80e0
  :: BG.Ptr SDL_Gamepad
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_d5f06aeaa91c80e0 =
  BG.fromFFIType hs_bindgen_d5f06aeaa91c80e0_base

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
--     [C declaration]: @SDL_GetGamepadSerial@, defined at @SDL3\/SDL_gamepad.h 1002:42@
sDL_GetGamepadSerial
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetGamepadSerial = hs_bindgen_d5f06aeaa91c80e0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadSteamHandle@
foreign import ccall safe "hs_bindgen_67b2a6827bcd3e6d"
  hs_bindgen_67b2a6827bcd3e6d_base
    :: BG.Ptr BG.Void
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadSteamHandle@
hs_bindgen_67b2a6827bcd3e6d
  :: BG.Ptr SDL_Gamepad
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_67b2a6827bcd3e6d =
  BG.fromFFIType hs_bindgen_67b2a6827bcd3e6d_base

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
--     [C declaration]: @SDL_GetGamepadSteamHandle@, defined at @SDL3\/SDL_gamepad.h 1017:36@
sDL_GetGamepadSteamHandle
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
sDL_GetGamepadSteamHandle =
  hs_bindgen_67b2a6827bcd3e6d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadConnectionState@
foreign import ccall safe "hs_bindgen_51ab18aa239a2b97"
  hs_bindgen_51ab18aa239a2b97_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadConnectionState@
hs_bindgen_51ab18aa239a2b97
  :: BG.Ptr SDL_Gamepad
  -> IO SDL3.Sys.Bindgen.Joystick.SDL_JoystickConnectionState
hs_bindgen_51ab18aa239a2b97 =
  BG.fromFFIType hs_bindgen_51ab18aa239a2b97_base

-- | Get the connection state of a gamepad.
--
--     [Returns]: the connection state on success or @SDL_JOYSTICK_CONNECTION_INVALID@ on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadConnectionState@, defined at @SDL3\/SDL_gamepad.h 1031:57@
sDL_GetGamepadConnectionState
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> IO SDL3.Sys.Bindgen.Joystick.SDL_JoystickConnectionState
sDL_GetGamepadConnectionState =
  hs_bindgen_51ab18aa239a2b97

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadPowerInfo@
foreign import ccall safe "hs_bindgen_9ac35ffbdb9db2d8"
  hs_bindgen_9ac35ffbdb9db2d8_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadPowerInfo@
hs_bindgen_9ac35ffbdb9db2d8
  :: BG.Ptr SDL_Gamepad
  -> BG.Ptr BG.CInt
  -> IO SDL3.Sys.Bindgen.Power.SDL_PowerState
hs_bindgen_9ac35ffbdb9db2d8 =
  BG.fromFFIType hs_bindgen_9ac35ffbdb9db2d8_base

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
--     [C declaration]: @SDL_GetGamepadPowerInfo@, defined at @SDL3\/SDL_gamepad.h 1053:44@
sDL_GetGamepadPowerInfo
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@percent@]: a pointer filled in with the percentage of battery life left, between 0 and 100, or NULL to ignore. This will be filled in with -1 we can\'t determine a value or there is no battery.
  -> IO SDL3.Sys.Bindgen.Power.SDL_PowerState
sDL_GetGamepadPowerInfo = hs_bindgen_9ac35ffbdb9db2d8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GamepadConnected@
foreign import ccall safe "hs_bindgen_ceb9282898627775"
  hs_bindgen_ceb9282898627775_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GamepadConnected@
hs_bindgen_ceb9282898627775
  :: BG.Ptr SDL_Gamepad
  -> IO BG.CBool
hs_bindgen_ceb9282898627775 =
  BG.fromFFIType hs_bindgen_ceb9282898627775_base

-- | Check if a gamepad has been opened and is currently connected.
--
--     [Returns]: true if the gamepad has been opened and is currently connected, or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GamepadConnected@, defined at @SDL3\/SDL_gamepad.h 1067:34@
sDL_GamepadConnected
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @SDL_OpenGamepad()@.
  -> IO BG.CBool
sDL_GamepadConnected = hs_bindgen_ceb9282898627775

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadJoystick@
foreign import ccall safe "hs_bindgen_c1e15069e5f0b3b4"
  hs_bindgen_c1e15069e5f0b3b4_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadJoystick@
hs_bindgen_c1e15069e5f0b3b4
  :: BG.Ptr SDL_Gamepad
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick)
hs_bindgen_c1e15069e5f0b3b4 =
  BG.fromFFIType hs_bindgen_c1e15069e5f0b3b4_base

-- | Get the underlying joystick from a gamepad.
--
--     This function will give you a SDL_Joystick object, which allows you to use the SDL_Joystick functions with a 'SDL_Gamepad' object. This would be useful for getting a joystick\'s position at any given time, even if it hasn\'t moved (moving it would produce an event, which would have the axis\' value).
--
--     The pointer returned is owned by the 'SDL_Gamepad'. You should not call SDL_CloseJoystick() on it, for example, since doing so will likely cause SDL to crash.
--
--     [Returns]: an SDL_Joystick object, or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadJoystick@, defined at @SDL3\/SDL_gamepad.h 1089:44@
sDL_GetGamepadJoystick
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad object that you want to get a joystick from.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Joystick.SDL_Joystick)
sDL_GetGamepadJoystick = hs_bindgen_c1e15069e5f0b3b4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_SetGamepadEventsEnabled@
foreign import ccall safe "hs_bindgen_aa68cf392dbe1717"
  hs_bindgen_aa68cf392dbe1717_base
    :: BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_SetGamepadEventsEnabled@
hs_bindgen_aa68cf392dbe1717
  :: BG.CBool
  -> IO ()
hs_bindgen_aa68cf392dbe1717 =
  BG.fromFFIType hs_bindgen_aa68cf392dbe1717_base

-- | Set the state of gamepad event processing.
--
--     If gamepad events are disabled, you must call @SDL_UpdateGamepads()@ yourself and check the state of the gamepad when you want gamepad information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GamepadEventsEnabled', 'sDL_UpdateGamepads'
--
--     [C declaration]: @SDL_SetGamepadEventsEnabled@, defined at @SDL3\/SDL_gamepad.h 1106:34@
sDL_SetGamepadEventsEnabled
  :: BG.CBool
  -- ^
  --
  --           [@enabled@]: whether to process gamepad events or not.
  -> IO ()
sDL_SetGamepadEventsEnabled =
  hs_bindgen_aa68cf392dbe1717

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GamepadEventsEnabled@
foreign import ccall safe "hs_bindgen_cd08b36ef0436bc1"
  hs_bindgen_cd08b36ef0436bc1_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GamepadEventsEnabled@
hs_bindgen_cd08b36ef0436bc1 :: IO BG.CBool
hs_bindgen_cd08b36ef0436bc1 =
  BG.fromFFIType hs_bindgen_cd08b36ef0436bc1_base

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
sDL_GamepadEventsEnabled :: IO BG.CBool
sDL_GamepadEventsEnabled =
  hs_bindgen_cd08b36ef0436bc1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadBindings@
foreign import ccall safe "hs_bindgen_213ad716fb12ea93"
  hs_bindgen_213ad716fb12ea93_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadBindings@
hs_bindgen_213ad716fb12ea93
  :: BG.Ptr SDL_Gamepad
  -> BG.Ptr BG.CInt
  -> IO (BG.Ptr (BG.Ptr SDL_GamepadBinding))
hs_bindgen_213ad716fb12ea93 =
  BG.fromFFIType hs_bindgen_213ad716fb12ea93_base

-- | Get the SDL joystick layer bindings for a gamepad.
--
--     [Returns]: a NULL terminated array of pointers to bindings or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadBindings@, defined at @SDL3\/SDL_gamepad.h 1138:51@
sDL_GetGamepadBindings
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of bindings returned.
  -> IO (BG.Ptr (BG.Ptr SDL_GamepadBinding))
sDL_GetGamepadBindings = hs_bindgen_213ad716fb12ea93

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_UpdateGamepads@
foreign import ccall safe "hs_bindgen_0006fa783d3b66ec"
  hs_bindgen_0006fa783d3b66ec_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_UpdateGamepads@
hs_bindgen_0006fa783d3b66ec :: IO ()
hs_bindgen_0006fa783d3b66ec =
  BG.fromFFIType hs_bindgen_0006fa783d3b66ec_base

-- | Manually pump gamepad updates if not using the loop.
--
--     This function is called automatically by the event loop if events are enabled. Under such circumstances, it will not be necessary to call this function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UpdateGamepads@, defined at @SDL3\/SDL_gamepad.h 1151:34@
sDL_UpdateGamepads :: IO ()
sDL_UpdateGamepads = hs_bindgen_0006fa783d3b66ec

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadTypeFromString@
foreign import ccall safe "hs_bindgen_793ab6d7edd0a66d"
  hs_bindgen_793ab6d7edd0a66d_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadTypeFromString@
hs_bindgen_793ab6d7edd0a66d
  :: PtrConst.PtrConst BG.CChar
  -> IO SDL_GamepadType
hs_bindgen_793ab6d7edd0a66d =
  BG.fromFFIType hs_bindgen_793ab6d7edd0a66d_base

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
--     [See also]: 'sDL_GetGamepadStringForType'
--
--     [C declaration]: @SDL_GetGamepadTypeFromString@, defined at @SDL3\/SDL_gamepad.h 1171:45@
sDL_GetGamepadTypeFromString
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: string representing a 'SDL_GamepadType' type.
  -> IO SDL_GamepadType
sDL_GetGamepadTypeFromString =
  hs_bindgen_793ab6d7edd0a66d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadStringForType@
foreign import ccall safe "hs_bindgen_d426a8b3d196baf4"
  hs_bindgen_d426a8b3d196baf4_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadStringForType@
hs_bindgen_d426a8b3d196baf4
  :: SDL_GamepadType
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_d426a8b3d196baf4 =
  BG.fromFFIType hs_bindgen_d426a8b3d196baf4_base

-- | Convert from an 'SDL_GamepadType' enum to a string.
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
sDL_GetGamepadStringForType
  :: SDL_GamepadType
  -- ^
  --
  --           [@type@]: an enum value for a given 'SDL_GamepadType'.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetGamepadStringForType =
  hs_bindgen_d426a8b3d196baf4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadAxisFromString@
foreign import ccall safe "hs_bindgen_5a9d122ea5094f40"
  hs_bindgen_5a9d122ea5094f40_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadAxisFromString@
hs_bindgen_5a9d122ea5094f40
  :: PtrConst.PtrConst BG.CChar
  -> IO SDL_GamepadAxis
hs_bindgen_5a9d122ea5094f40 =
  BG.fromFFIType hs_bindgen_5a9d122ea5094f40_base

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
--     [See also]: 'sDL_GetGamepadStringForAxis'
--
--     [C declaration]: @SDL_GetGamepadAxisFromString@, defined at @SDL3\/SDL_gamepad.h 1211:45@
sDL_GetGamepadAxisFromString
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: string representing a 'SDL_Gamepad' axis.
  -> IO SDL_GamepadAxis
sDL_GetGamepadAxisFromString =
  hs_bindgen_5a9d122ea5094f40

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadStringForAxis@
foreign import ccall safe "hs_bindgen_9cbed523522c86f2"
  hs_bindgen_9cbed523522c86f2_base
    :: BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadStringForAxis@
hs_bindgen_9cbed523522c86f2
  :: SDL_GamepadAxis
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_9cbed523522c86f2 =
  BG.fromFFIType hs_bindgen_9cbed523522c86f2_base

-- | Convert from an 'SDL_GamepadAxis' enum to a string.
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
sDL_GetGamepadStringForAxis
  :: SDL_GamepadAxis
  -- ^
  --
  --           [@axis@]: an enum value for a given 'SDL_GamepadAxis'.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetGamepadStringForAxis =
  hs_bindgen_9cbed523522c86f2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GamepadHasAxis@
foreign import ccall safe "hs_bindgen_6d87cb6c759a128e"
  hs_bindgen_6d87cb6c759a128e_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GamepadHasAxis@
hs_bindgen_6d87cb6c759a128e
  :: BG.Ptr SDL_Gamepad
  -> SDL_GamepadAxis
  -> IO BG.CBool
hs_bindgen_6d87cb6c759a128e =
  BG.fromFFIType hs_bindgen_6d87cb6c759a128e_base

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
--     [See also]: 'sDL_GamepadHasButton', 'sDL_GetGamepadAxis'
--
--     [C declaration]: @SDL_GamepadHasAxis@, defined at @SDL3\/SDL_gamepad.h 1246:34@
sDL_GamepadHasAxis
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadAxis
  -- ^
  --
  --           [@axis@]: an axis enum value (an 'SDL_GamepadAxis' value).
  -> IO BG.CBool
sDL_GamepadHasAxis = hs_bindgen_6d87cb6c759a128e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadAxis@
foreign import ccall safe "hs_bindgen_d4e206062bf3a0b7"
  hs_bindgen_d4e206062bf3a0b7_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadAxis@
hs_bindgen_d4e206062bf3a0b7
  :: BG.Ptr SDL_Gamepad
  -> SDL_GamepadAxis
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint16
hs_bindgen_d4e206062bf3a0b7 =
  BG.fromFFIType hs_bindgen_d4e206062bf3a0b7_base

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
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadAxis
  -- ^
  --
  --           [@axis@]: an axis index (one of the 'SDL_GamepadAxis' values).
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint16
sDL_GetGamepadAxis = hs_bindgen_d4e206062bf3a0b7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadButtonFromString@
foreign import ccall safe "hs_bindgen_3d3d13260e5bf752"
  hs_bindgen_3d3d13260e5bf752_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadButtonFromString@
hs_bindgen_3d3d13260e5bf752
  :: PtrConst.PtrConst BG.CChar
  -> IO SDL_GamepadButton
hs_bindgen_3d3d13260e5bf752 =
  BG.fromFFIType hs_bindgen_3d3d13260e5bf752_base

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
--     [See also]: 'sDL_GetGamepadStringForButton'
--
--     [C declaration]: @SDL_GetGamepadButtonFromString@, defined at @SDL3\/SDL_gamepad.h 1294:47@
sDL_GetGamepadButtonFromString
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: string representing a 'SDL_Gamepad' button.
  -> IO SDL_GamepadButton
sDL_GetGamepadButtonFromString =
  hs_bindgen_3d3d13260e5bf752

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadStringForButton@
foreign import ccall safe "hs_bindgen_7d3134eb357b2911"
  hs_bindgen_7d3134eb357b2911_base
    :: BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadStringForButton@
hs_bindgen_7d3134eb357b2911
  :: SDL_GamepadButton
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_7d3134eb357b2911 =
  BG.fromFFIType hs_bindgen_7d3134eb357b2911_base

-- | Convert from an 'SDL_GamepadButton' enum to a string.
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
sDL_GetGamepadStringForButton
  :: SDL_GamepadButton
  -- ^
  --
  --           [@button@]: an enum value for a given 'SDL_GamepadButton'.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetGamepadStringForButton =
  hs_bindgen_7d3134eb357b2911

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GamepadHasButton@
foreign import ccall safe "hs_bindgen_835e151fd6fbdcd9"
  hs_bindgen_835e151fd6fbdcd9_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GamepadHasButton@
hs_bindgen_835e151fd6fbdcd9
  :: BG.Ptr SDL_Gamepad
  -> SDL_GamepadButton
  -> IO BG.CBool
hs_bindgen_835e151fd6fbdcd9 =
  BG.fromFFIType hs_bindgen_835e151fd6fbdcd9_base

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
--     [See also]: 'sDL_GamepadHasAxis'
--
--     [C declaration]: @SDL_GamepadHasButton@, defined at @SDL3\/SDL_gamepad.h 1328:34@
sDL_GamepadHasButton
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button enum value (an 'SDL_GamepadButton' value).
  -> IO BG.CBool
sDL_GamepadHasButton = hs_bindgen_835e151fd6fbdcd9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadButton@
foreign import ccall safe "hs_bindgen_930a123ab5a67173"
  hs_bindgen_930a123ab5a67173_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadButton@
hs_bindgen_930a123ab5a67173
  :: BG.Ptr SDL_Gamepad
  -> SDL_GamepadButton
  -> IO BG.CBool
hs_bindgen_930a123ab5a67173 =
  BG.fromFFIType hs_bindgen_930a123ab5a67173_base

-- | Get the current state of a button on a gamepad.
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
sDL_GetGamepadButton
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button index (one of the 'SDL_GamepadButton' values).
  -> IO BG.CBool
sDL_GetGamepadButton = hs_bindgen_930a123ab5a67173

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadButtonLabelForType@
foreign import ccall safe "hs_bindgen_3a07981024fde2b9"
  hs_bindgen_3a07981024fde2b9_base
    :: BG.Word32
    -> BG.Int32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadButtonLabelForType@
hs_bindgen_3a07981024fde2b9
  :: SDL_GamepadType
  -> SDL_GamepadButton
  -> IO SDL_GamepadButtonLabel
hs_bindgen_3a07981024fde2b9 =
  BG.fromFFIType hs_bindgen_3a07981024fde2b9_base

-- | Get the label of a button on a gamepad.
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
  :: SDL_GamepadType
  -- ^
  --
  --           [@type@]: the type of gamepad to check.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button index (one of the 'SDL_GamepadButton' values).
  -> IO SDL_GamepadButtonLabel
sDL_GetGamepadButtonLabelForType =
  hs_bindgen_3a07981024fde2b9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadButtonLabel@
foreign import ccall safe "hs_bindgen_80f031ee04caea84"
  hs_bindgen_80f031ee04caea84_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadButtonLabel@
hs_bindgen_80f031ee04caea84
  :: BG.Ptr SDL_Gamepad
  -> SDL_GamepadButton
  -> IO SDL_GamepadButtonLabel
hs_bindgen_80f031ee04caea84 =
  BG.fromFFIType hs_bindgen_80f031ee04caea84_base

-- | Get the label of a button on a gamepad.
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
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button index (one of the 'SDL_GamepadButton' values).
  -> IO SDL_GamepadButtonLabel
sDL_GetGamepadButtonLabel =
  hs_bindgen_80f031ee04caea84

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetNumGamepadTouchpads@
foreign import ccall safe "hs_bindgen_65d4ab0a10c0f69e"
  hs_bindgen_65d4ab0a10c0f69e_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetNumGamepadTouchpads@
hs_bindgen_65d4ab0a10c0f69e
  :: BG.Ptr SDL_Gamepad
  -> IO BG.CInt
hs_bindgen_65d4ab0a10c0f69e =
  BG.fromFFIType hs_bindgen_65d4ab0a10c0f69e_base

-- | Get the number of touchpads on a gamepad.
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
sDL_GetNumGamepadTouchpads
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> IO BG.CInt
sDL_GetNumGamepadTouchpads =
  hs_bindgen_65d4ab0a10c0f69e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetNumGamepadTouchpadFingers@
foreign import ccall safe "hs_bindgen_d33ef1d9882dcbad"
  hs_bindgen_d33ef1d9882dcbad_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetNumGamepadTouchpadFingers@
hs_bindgen_d33ef1d9882dcbad
  :: BG.Ptr SDL_Gamepad
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_d33ef1d9882dcbad =
  BG.fromFFIType hs_bindgen_d33ef1d9882dcbad_base

-- | Get the number of supported simultaneous fingers on a touchpad on a game gamepad.
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
sDL_GetNumGamepadTouchpadFingers
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> BG.CInt
  -- ^
  --
  --           [@touchpad@]: a touchpad.
  -> IO BG.CInt
sDL_GetNumGamepadTouchpadFingers =
  hs_bindgen_d33ef1d9882dcbad

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadTouchpadFinger@
foreign import ccall safe "hs_bindgen_225a3688e71f439f"
  hs_bindgen_225a3688e71f439f_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadTouchpadFinger@
hs_bindgen_225a3688e71f439f
  :: BG.Ptr SDL_Gamepad
  -> BG.CInt
  -> BG.CInt
  -> BG.Ptr BG.CBool
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_225a3688e71f439f =
  BG.fromFFIType hs_bindgen_225a3688e71f439f_base

-- | Get the current state of a finger on a touchpad on a gamepad.
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
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad.
  -> BG.CInt
  -- ^
  --
  --           [@touchpad@]: a touchpad.
  -> BG.CInt
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
  -> IO BG.CBool
sDL_GetGamepadTouchpadFinger =
  hs_bindgen_225a3688e71f439f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GamepadHasSensor@
foreign import ccall safe "hs_bindgen_1b3239ce64af9f86"
  hs_bindgen_1b3239ce64af9f86_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GamepadHasSensor@
hs_bindgen_1b3239ce64af9f86
  :: BG.Ptr SDL_Gamepad
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -> IO BG.CBool
hs_bindgen_1b3239ce64af9f86 =
  BG.fromFFIType hs_bindgen_1b3239ce64af9f86_base

-- | Return whether a gamepad has a particular sensor.
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
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to query.
  -> IO BG.CBool
sDL_GamepadHasSensor = hs_bindgen_1b3239ce64af9f86

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_SetGamepadSensorEnabled@
foreign import ccall safe "hs_bindgen_3e3fc29af15c71c1"
  hs_bindgen_3e3fc29af15c71c1_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_SetGamepadSensorEnabled@
hs_bindgen_3e3fc29af15c71c1
  :: BG.Ptr SDL_Gamepad
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_3e3fc29af15c71c1 =
  BG.fromFFIType hs_bindgen_3e3fc29af15c71c1_base

-- | Set whether data reporting for a gamepad sensor is enabled.
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
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to update.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to enable\/disable.
  -> BG.CBool
  -- ^
  --
  --           [@enabled@]: whether data reporting should be enabled.
  -> IO BG.CBool
sDL_SetGamepadSensorEnabled =
  hs_bindgen_3e3fc29af15c71c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GamepadSensorEnabled@
foreign import ccall safe "hs_bindgen_826f084dc9c761ff"
  hs_bindgen_826f084dc9c761ff_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GamepadSensorEnabled@
hs_bindgen_826f084dc9c761ff
  :: BG.Ptr SDL_Gamepad
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -> IO BG.CBool
hs_bindgen_826f084dc9c761ff =
  BG.fromFFIType hs_bindgen_826f084dc9c761ff_base

-- | Query whether sensor data reporting is enabled for a gamepad.
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
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to query.
  -> IO BG.CBool
sDL_GamepadSensorEnabled =
  hs_bindgen_826f084dc9c761ff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadSensorDataRate@
foreign import ccall safe "hs_bindgen_69751d524bc7ba71"
  hs_bindgen_69751d524bc7ba71_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadSensorDataRate@
hs_bindgen_69751d524bc7ba71
  :: BG.Ptr SDL_Gamepad
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -> IO BG.CFloat
hs_bindgen_69751d524bc7ba71 =
  BG.fromFFIType hs_bindgen_69751d524bc7ba71_base

-- | Get the data rate (number of events per second) of a gamepad sensor.
--
--     [Returns]: the data rate, or 0.0f if the data rate is not available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadSensorDataRate@, defined at @SDL3\/SDL_gamepad.h 1492:35@
sDL_GetGamepadSensorDataRate
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -- ^
  --
  --           [@type@]: the type of sensor to query.
  -> IO BG.CFloat
sDL_GetGamepadSensorDataRate =
  hs_bindgen_69751d524bc7ba71

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadSensorData@
foreign import ccall safe "hs_bindgen_2c02178932dc8e57"
  hs_bindgen_2c02178932dc8e57_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadSensorData@
hs_bindgen_2c02178932dc8e57
  :: BG.Ptr SDL_Gamepad
  -> SDL3.Sys.Bindgen.Sensor.SDL_SensorType
  -> BG.Ptr BG.CFloat
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_2c02178932dc8e57 =
  BG.fromFFIType hs_bindgen_2c02178932dc8e57_base

-- | Get the current state of a gamepad sensor.
--
--     The number of values and interpretation of the data is sensor dependent. See the remarks in SDL_SensorType for details for each type of sensor.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGamepadSensorData@, defined at @SDL3\/SDL_gamepad.h 1511:34@
sDL_GetGamepadSensorData
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
  -> BG.CInt
  -- ^
  --
  --           [@num_values@]: the number of values to write to data.
  -> IO BG.CBool
sDL_GetGamepadSensorData =
  hs_bindgen_2c02178932dc8e57

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_RumbleGamepad@
foreign import ccall safe "hs_bindgen_36f6edc2de497d1f"
  hs_bindgen_36f6edc2de497d1f_base
    :: BG.Ptr BG.Void
    -> BG.Word16
    -> BG.Word16
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_RumbleGamepad@
hs_bindgen_36f6edc2de497d1f
  :: BG.Ptr SDL_Gamepad
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_36f6edc2de497d1f =
  BG.fromFFIType hs_bindgen_36f6edc2de497d1f_base

-- | Start a rumble effect on a gamepad.
--
--     Each call to this function cancels any previous rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     This function requires you to process SDL events or call SDL_UpdateJoysticks() to update rumble state.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RumbleGamepad@, defined at @SDL3\/SDL_gamepad.h 1535:34@
sDL_RumbleGamepad
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to vibrate.
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
sDL_RumbleGamepad = hs_bindgen_36f6edc2de497d1f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_RumbleGamepadTriggers@
foreign import ccall safe "hs_bindgen_1ab471fbae93c977"
  hs_bindgen_1ab471fbae93c977_base
    :: BG.Ptr BG.Void
    -> BG.Word16
    -> BG.Word16
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_RumbleGamepadTriggers@
hs_bindgen_1ab471fbae93c977
  :: BG.Ptr SDL_Gamepad
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_1ab471fbae93c977 =
  BG.fromFFIType hs_bindgen_1ab471fbae93c977_base

-- | Start a rumble effect in the gamepad\'s triggers.
--
--     Each call to this function cancels any previous trigger rumble effect, and calling it with 0 intensity stops any rumbling.
--
--     Note that this is rumbling of the /triggers/ and not the gamepad as a whole. This is currently only supported on Xbox One gamepads. If you want the (more common) whole-gamepad rumble, use @SDL_RumbleGamepad()@ instead.
--
--     This function requires you to process SDL events or call SDL_UpdateJoysticks() to update rumble state.
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
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to vibrate.
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
sDL_RumbleGamepadTriggers =
  hs_bindgen_1ab471fbae93c977

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_SetGamepadLED@
foreign import ccall safe "hs_bindgen_99951861ed614368"
  hs_bindgen_99951861ed614368_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_SetGamepadLED@
hs_bindgen_99951861ed614368
  :: BG.Ptr SDL_Gamepad
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_99951861ed614368 =
  BG.fromFFIType hs_bindgen_99951861ed614368_base

-- | Update a gamepad\'s LED color.
--
--     An example of a joystick LED is the light on the back of a PlayStation 4\'s DualShock 4 controller.
--
--     For gamepads with a single color LED, the maximum of the RGB values will be used as the LED brightness.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetGamepadLED@, defined at @SDL3\/SDL_gamepad.h 1587:34@
sDL_SetGamepadLED
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to update.
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
sDL_SetGamepadLED = hs_bindgen_99951861ed614368

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_SendGamepadEffect@
foreign import ccall safe "hs_bindgen_0a60e2e403cd6afc"
  hs_bindgen_0a60e2e403cd6afc_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_SendGamepadEffect@
hs_bindgen_0a60e2e403cd6afc
  :: BG.Ptr SDL_Gamepad
  -> PtrConst.PtrConst BG.Void
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_0a60e2e403cd6afc =
  BG.fromFFIType hs_bindgen_0a60e2e403cd6afc_base

-- | Send a gamepad specific effect packet.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SendGamepadEffect@, defined at @SDL3\/SDL_gamepad.h 1602:34@
sDL_SendGamepadEffect
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to affect.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to send to the gamepad.
  -> BG.CInt
  -- ^
  --
  --           [@size@]: the size of the data to send to the gamepad.
  -> IO BG.CBool
sDL_SendGamepadEffect = hs_bindgen_0a60e2e403cd6afc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_CloseGamepad@
foreign import ccall safe "hs_bindgen_7615a65af389a834"
  hs_bindgen_7615a65af389a834_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_CloseGamepad@
hs_bindgen_7615a65af389a834
  :: BG.Ptr SDL_Gamepad
  -> IO ()
hs_bindgen_7615a65af389a834 =
  BG.fromFFIType hs_bindgen_7615a65af389a834_base

-- | Close a gamepad previously opened with @SDL_OpenGamepad()@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenGamepad'
--
--     [C declaration]: @SDL_CloseGamepad@, defined at @SDL3\/SDL_gamepad.h 1616:34@
sDL_CloseGamepad
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: a gamepad identifier previously returned by @SDL_OpenGamepad()@.
  -> IO ()
sDL_CloseGamepad = hs_bindgen_7615a65af389a834

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadAppleSFSymbolsNameForButton@
foreign import ccall safe "hs_bindgen_99f1aa16515a60df"
  hs_bindgen_99f1aa16515a60df_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadAppleSFSymbolsNameForButton@
hs_bindgen_99f1aa16515a60df
  :: BG.Ptr SDL_Gamepad
  -> SDL_GamepadButton
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_99f1aa16515a60df =
  BG.fromFFIType hs_bindgen_99f1aa16515a60df_base

-- | Return the sfSymbolsName for a given button on a gamepad on Apple platforms.
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
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL_GamepadButton
  -- ^
  --
  --           [@button@]: a button on the gamepad.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetGamepadAppleSFSymbolsNameForButton =
  hs_bindgen_99f1aa16515a60df

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadAppleSFSymbolsNameForAxis@
foreign import ccall safe "hs_bindgen_076ad522cfc3e68e"
  hs_bindgen_076ad522cfc3e68e_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gamepad_Safe_SDL_GetGamepadAppleSFSymbolsNameForAxis@
hs_bindgen_076ad522cfc3e68e
  :: BG.Ptr SDL_Gamepad
  -> SDL_GamepadAxis
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_076ad522cfc3e68e =
  BG.fromFFIType hs_bindgen_076ad522cfc3e68e_base

-- | Return the sfSymbolsName for a given axis on a gamepad on Apple platforms.
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
  :: BG.Ptr SDL_Gamepad
  -- ^
  --
  --           [@gamepad@]: the gamepad to query.
  -> SDL_GamepadAxis
  -- ^
  --
  --           [@axis@]: an axis on the gamepad.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetGamepadAppleSFSymbolsNameForAxis =
  hs_bindgen_076ad522cfc3e68e

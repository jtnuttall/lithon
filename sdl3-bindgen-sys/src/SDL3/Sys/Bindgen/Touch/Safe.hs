{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Touch.Safe (
  SDL3.Sys.Bindgen.Touch.Safe.sDL_GetTouchDevices,
  SDL3.Sys.Bindgen.Touch.Safe.sDL_GetTouchDeviceName,
  SDL3.Sys.Bindgen.Touch.Safe.sDL_GetTouchDeviceType,
  SDL3.Sys.Bindgen.Touch.Safe.sDL_GetTouchFingers,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Touch

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_touch.h>"
         , "SDL_TouchID *hs_bindgen_5bb90a8e6a2a7744 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTouchDevices)(arg1);"
         , "}"
         , "char const *hs_bindgen_8215300124d28f2f ("
         , "  SDL_TouchID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTouchDeviceName)(arg1);"
         , "}"
         , "SDL_TouchDeviceType hs_bindgen_a494e81cbe4e8c2f ("
         , "  SDL_TouchID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTouchDeviceType)(arg1);"
         , "}"
         , "SDL_Finger **hs_bindgen_ea3a929a9ac35739 ("
         , "  SDL_TouchID arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetTouchFingers)(arg1, arg2);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_Safe_SDL_GetTouchDevices@
foreign import ccall safe "hs_bindgen_5bb90a8e6a2a7744"
  hs_bindgen_5bb90a8e6a2a7744_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_Safe_SDL_GetTouchDevices@
hs_bindgen_5bb90a8e6a2a7744
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL_TouchID)
hs_bindgen_5bb90a8e6a2a7744 =
  BG.fromFFIType hs_bindgen_5bb90a8e6a2a7744_base

-- | Get a list of registered touch devices.
--
--     On some platforms SDL first sees the touch device if it was actually used. Therefore the returned list might be empty, although devices are available. After using all devices at least once the number will be correct.
--
--     [Returns]: a 0 terminated array of touch device IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTouchDevices@, defined at @SDL3\/SDL_touch.h 140:43@
sDL_GetTouchDevices
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of devices returned, may be NULL.
  -> IO (BG.Ptr SDL_TouchID)
sDL_GetTouchDevices = hs_bindgen_5bb90a8e6a2a7744

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_Safe_SDL_GetTouchDeviceName@
foreign import ccall safe "hs_bindgen_8215300124d28f2f"
  hs_bindgen_8215300124d28f2f_base
    :: BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_Safe_SDL_GetTouchDeviceName@
hs_bindgen_8215300124d28f2f
  :: SDL_TouchID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_8215300124d28f2f =
  BG.fromFFIType hs_bindgen_8215300124d28f2f_base

-- | Get the touch device name as reported from the driver.
--
--     [Returns]: touch device name, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTouchDeviceName@, defined at @SDL3\/SDL_touch.h 151:42@
sDL_GetTouchDeviceName
  :: SDL_TouchID
  -- ^
  --
  --           [@touchID@]: the touch device instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetTouchDeviceName = hs_bindgen_8215300124d28f2f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_Safe_SDL_GetTouchDeviceType@
foreign import ccall safe "hs_bindgen_a494e81cbe4e8c2f"
  hs_bindgen_a494e81cbe4e8c2f_base
    :: BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_Safe_SDL_GetTouchDeviceType@
hs_bindgen_a494e81cbe4e8c2f
  :: SDL_TouchID
  -> IO SDL_TouchDeviceType
hs_bindgen_a494e81cbe4e8c2f =
  BG.fromFFIType hs_bindgen_a494e81cbe4e8c2f_base

-- | Get the type of the given touch device.
--
--     [Returns]: touch device type.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTouchDeviceType@, defined at @SDL3\/SDL_touch.h 161:49@
sDL_GetTouchDeviceType
  :: SDL_TouchID
  -- ^
  --
  --           [@touchID@]: the ID of a touch device.
  -> IO SDL_TouchDeviceType
sDL_GetTouchDeviceType = hs_bindgen_a494e81cbe4e8c2f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_Safe_SDL_GetTouchFingers@
foreign import ccall safe "hs_bindgen_ea3a929a9ac35739"
  hs_bindgen_ea3a929a9ac35739_base
    :: BG.Word64
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_Safe_SDL_GetTouchFingers@
hs_bindgen_ea3a929a9ac35739
  :: SDL_TouchID
  -> BG.Ptr BG.CInt
  -> IO (BG.Ptr (BG.Ptr SDL_Finger))
hs_bindgen_ea3a929a9ac35739 =
  BG.fromFFIType hs_bindgen_ea3a929a9ac35739_base

-- | Get a list of active fingers for a given touch device.
--
--     [Returns]: a NULL terminated array of 'SDL_Finger' pointers or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTouchFingers@, defined at @SDL3\/SDL_touch.h 176:43@
sDL_GetTouchFingers
  :: SDL_TouchID
  -- ^
  --
  --           [@touchID@]: the ID of a touch device.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of fingers returned, can be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_Finger))
sDL_GetTouchFingers = hs_bindgen_ea3a929a9ac35739

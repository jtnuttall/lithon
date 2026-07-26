{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Touch.FunPtr (
  SDL3.Sys.Bindgen.Touch.FunPtr.sDL_GetTouchDevices,
  SDL3.Sys.Bindgen.Touch.FunPtr.sDL_GetTouchDeviceName,
  SDL3.Sys.Bindgen.Touch.FunPtr.sDL_GetTouchDeviceType,
  SDL3.Sys.Bindgen.Touch.FunPtr.sDL_GetTouchFingers,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Touch

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_touch.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Touch_get_SDL_GetTouchDevices */"
         , "__attribute__ ((const))"
         , "SDL_TouchID *(*hs_bindgen_d990cfdd3ce3b935 (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTouchDevices;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Touch_get_SDL_GetTouchDeviceName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_a221ea688dfb8835 (void)) ("
         , "  SDL_TouchID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTouchDeviceName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Touch_get_SDL_GetTouchDeviceType */"
         , "__attribute__ ((const))"
         , "SDL_TouchDeviceType (*hs_bindgen_41907e6474c07d6d (void)) ("
         , "  SDL_TouchID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTouchDeviceType;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Touch_get_SDL_GetTouchFingers */"
         , "__attribute__ ((const))"
         , "SDL_Finger **(*hs_bindgen_7edabe47405f9352 (void)) ("
         , "  SDL_TouchID arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetTouchFingers;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_get_SDL_GetTouchDevices@
foreign import ccall unsafe "hs_bindgen_d990cfdd3ce3b935"
  hs_bindgen_d990cfdd3ce3b935_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_get_SDL_GetTouchDevices@
hs_bindgen_d990cfdd3ce3b935 :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_TouchID)))
hs_bindgen_d990cfdd3ce3b935 =
  BG.fromFFIType hs_bindgen_d990cfdd3ce3b935_base

{-# NOINLINE sDL_GetTouchDevices #-}

-- | Get a list of registered touch devices.
--
--     On some platforms SDL first sees the touch device if it was actually used. Therefore the returned list might be empty, although devices are available. After using all devices at least once the number will be correct.
--
--     [@count@]: a pointer filled in with the number of devices returned, may be NULL.
--
--     [Returns]: a 0 terminated array of touch device IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTouchDevices@, defined at @SDL3\/SDL_touch.h 140:43@
sDL_GetTouchDevices :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_TouchID))
sDL_GetTouchDevices =
  BG.unsafePerformIO hs_bindgen_d990cfdd3ce3b935

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_get_SDL_GetTouchDeviceName@
foreign import ccall unsafe "hs_bindgen_a221ea688dfb8835"
  hs_bindgen_a221ea688dfb8835_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_get_SDL_GetTouchDeviceName@
hs_bindgen_a221ea688dfb8835 :: IO (BG.FunPtr (SDL_TouchID -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_a221ea688dfb8835 =
  BG.fromFFIType hs_bindgen_a221ea688dfb8835_base

{-# NOINLINE sDL_GetTouchDeviceName #-}

-- | Get the touch device name as reported from the driver.
--
--     [@touchID@]: the touch device instance ID.
--
--     [Returns]: touch device name, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTouchDeviceName@, defined at @SDL3\/SDL_touch.h 151:42@
sDL_GetTouchDeviceName :: BG.FunPtr (SDL_TouchID -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetTouchDeviceName =
  BG.unsafePerformIO hs_bindgen_a221ea688dfb8835

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_get_SDL_GetTouchDeviceType@
foreign import ccall unsafe "hs_bindgen_41907e6474c07d6d"
  hs_bindgen_41907e6474c07d6d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_get_SDL_GetTouchDeviceType@
hs_bindgen_41907e6474c07d6d :: IO (BG.FunPtr (SDL_TouchID -> IO SDL_TouchDeviceType))
hs_bindgen_41907e6474c07d6d =
  BG.fromFFIType hs_bindgen_41907e6474c07d6d_base

{-# NOINLINE sDL_GetTouchDeviceType #-}

-- | Get the type of the given touch device.
--
--     [@touchID@]: the ID of a touch device.
--
--     [Returns]: touch device type.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTouchDeviceType@, defined at @SDL3\/SDL_touch.h 161:49@
sDL_GetTouchDeviceType :: BG.FunPtr (SDL_TouchID -> IO SDL_TouchDeviceType)
sDL_GetTouchDeviceType =
  BG.unsafePerformIO hs_bindgen_41907e6474c07d6d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_get_SDL_GetTouchFingers@
foreign import ccall unsafe "hs_bindgen_7edabe47405f9352"
  hs_bindgen_7edabe47405f9352_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Touch_get_SDL_GetTouchFingers@
hs_bindgen_7edabe47405f9352
  :: IO (BG.FunPtr (SDL_TouchID -> BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr SDL_Finger))))
hs_bindgen_7edabe47405f9352 =
  BG.fromFFIType hs_bindgen_7edabe47405f9352_base

{-# NOINLINE sDL_GetTouchFingers #-}

-- | Get a list of active fingers for a given touch device.
--
--     [@touchID@]: the ID of a touch device.
--
--     [@count@]: a pointer filled in with the number of fingers returned, can be NULL.
--
--     [Returns]: a NULL terminated array of 'SDL_Finger' pointers or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTouchFingers@, defined at @SDL3\/SDL_touch.h 176:43@
sDL_GetTouchFingers :: BG.FunPtr (SDL_TouchID -> BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr SDL_Finger)))
sDL_GetTouchFingers =
  BG.unsafePerformIO hs_bindgen_7edabe47405f9352

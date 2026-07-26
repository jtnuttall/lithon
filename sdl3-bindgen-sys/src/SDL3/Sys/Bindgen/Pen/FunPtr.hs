{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Pen.FunPtr (
  SDL3.Sys.Bindgen.Pen.FunPtr.sDL_GetPenDeviceType,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Pen

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_pen.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_PenDeviceType;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Pen_get_SDL_GetPenDeviceType */"
         , "__attribute__ ((const))"
         , "SDL_PenDeviceType (*hs_bindgen_bcd57304ca37ccf0 (void)) ("
         , "  SDL_PenID arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_GetPenDeviceType;"
         , "#else"
         , "  SDL_SetError(\"SDL_GetPenDeviceType requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pen_get_SDL_GetPenDeviceType@
foreign import ccall unsafe "hs_bindgen_bcd57304ca37ccf0"
  hs_bindgen_bcd57304ca37ccf0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pen_get_SDL_GetPenDeviceType@
hs_bindgen_bcd57304ca37ccf0 :: IO (BG.FunPtr (SDL_PenID -> IO SDL_PenDeviceType))
hs_bindgen_bcd57304ca37ccf0 =
  BG.fromFFIType hs_bindgen_bcd57304ca37ccf0_base

{-# NOINLINE sDL_GetPenDeviceType #-}

-- | Get the device type of the given pen.
--
--     Many platforms do not supply this information, so an app must always be prepared to get an SDL_PEN_DEVICE_TYPE_UNKNOWN result.
--
--     [@instance_id@]: the pen instance ID.
--
--     [Returns]: the device type of the given pen, or SDL_PEN_DEVICE_TYPE_INVALID on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetPenDeviceType@, defined at @SDL3\/SDL_pen.h 189:47@
sDL_GetPenDeviceType :: BG.FunPtr (SDL_PenID -> IO SDL_PenDeviceType)
sDL_GetPenDeviceType =
  BG.unsafePerformIO hs_bindgen_bcd57304ca37ccf0

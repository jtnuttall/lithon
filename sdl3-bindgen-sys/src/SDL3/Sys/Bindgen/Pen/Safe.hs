{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Pen.Safe (
  SDL3.Sys.Bindgen.Pen.Safe.sDL_GetPenDeviceType,
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
         , "SDL_PenDeviceType hs_bindgen_051a74548d70e8b1 ("
         , "  SDL_PenID arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetPenDeviceType)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_GetPenDeviceType requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pen_Safe_SDL_GetPenDeviceType@
foreign import ccall safe "hs_bindgen_051a74548d70e8b1"
  hs_bindgen_051a74548d70e8b1_base
    :: BG.Word32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pen_Safe_SDL_GetPenDeviceType@
hs_bindgen_051a74548d70e8b1
  :: SDL_PenID
  -> IO SDL_PenDeviceType
hs_bindgen_051a74548d70e8b1 =
  BG.fromFFIType hs_bindgen_051a74548d70e8b1_base

-- | Get the device type of the given pen.
--
--     Many platforms do not supply this information, so an app must always be prepared to get an SDL_PEN_DEVICE_TYPE_UNKNOWN result.
--
--     [Returns]: the device type of the given pen, or SDL_PEN_DEVICE_TYPE_INVALID on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetPenDeviceType@, defined at @SDL3\/SDL_pen.h 189:47@
sDL_GetPenDeviceType
  :: SDL_PenID
  -- ^
  --
  --           [@instance_id@]: the pen instance ID.
  -> IO SDL_PenDeviceType
sDL_GetPenDeviceType = hs_bindgen_051a74548d70e8b1

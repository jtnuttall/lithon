{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Endian.Safe (
  SDL3.Sys.Bindgen.Endian.Safe.sDL_SwapFloat,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_endian.h>"
         , "float hs_bindgen_3b15c524a04a103e ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_SwapFloat)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Endian_Safe_SDL_SwapFloat@
foreign import ccall safe "hs_bindgen_3b15c524a04a103e"
  hs_bindgen_3b15c524a04a103e_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Endian_Safe_SDL_SwapFloat@
hs_bindgen_3b15c524a04a103e
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_3b15c524a04a103e =
  BG.fromFFIType hs_bindgen_3b15c524a04a103e_base

-- | Byte-swap a floating point number.
--
--     This will always byte-swap the value, whether it\'s currently in the native byteorder of the system or not. You should use SDL_SwapFloatLE or SDL_SwapFloatBE instead, in most cases.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [Returns]: x, with its bytes in the opposite endian order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SwapFloat@, defined at @SDL3\/SDL_endian.h 408:24@
sDL_SwapFloat
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: the value to byte-swap.
  -> IO BG.CFloat
sDL_SwapFloat = hs_bindgen_3b15c524a04a103e

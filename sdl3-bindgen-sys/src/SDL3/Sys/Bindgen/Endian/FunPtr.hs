{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Endian.FunPtr (
  SDL3.Sys.Bindgen.Endian.FunPtr.sDL_SwapFloat,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_endian.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Endian_get_SDL_SwapFloat */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_a0e501e24aab59b4 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_SwapFloat;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Endian_get_SDL_SwapFloat@
foreign import ccall unsafe "hs_bindgen_a0e501e24aab59b4"
  hs_bindgen_a0e501e24aab59b4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Endian_get_SDL_SwapFloat@
hs_bindgen_a0e501e24aab59b4 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_a0e501e24aab59b4 =
  BG.fromFFIType hs_bindgen_a0e501e24aab59b4_base

{-# NOINLINE sDL_SwapFloat #-}

-- | Byte-swap a floating point number.
--
--     This will always byte-swap the value, whether it\'s currently in the native byteorder of the system or not. You should use SDL_SwapFloatLE or SDL_SwapFloatBE instead, in most cases.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [@x@]: the value to byte-swap.
--
--     [Returns]: x, with its bytes in the opposite endian order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SwapFloat@, defined at @SDL3\/SDL_endian.h 408:24@
sDL_SwapFloat :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_SwapFloat =
  BG.unsafePerformIO hs_bindgen_a0e501e24aab59b4

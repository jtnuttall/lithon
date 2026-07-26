{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Bits.FunPtr (
  SDL3.Sys.Bindgen.Bits.FunPtr.sDL_MostSignificantBitIndex32,
  SDL3.Sys.Bindgen.Bits.FunPtr.sDL_HasExactlyOneBitSet32,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_bits.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Bits_get_SDL_MostSignificantBitIndex32 */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_ef0d609239e2f97c (void)) ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return &SDL_MostSignificantBitIndex32;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Bits_get_SDL_HasExactlyOneBitSet32 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_424cf674227955df (void)) ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return &SDL_HasExactlyOneBitSet32;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Bits_get_SDL_MostSignificantBitIndex32@
foreign import ccall unsafe "hs_bindgen_ef0d609239e2f97c"
  hs_bindgen_ef0d609239e2f97c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Bits_get_SDL_MostSignificantBitIndex32@
hs_bindgen_ef0d609239e2f97c :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CInt))
hs_bindgen_ef0d609239e2f97c =
  BG.fromFFIType hs_bindgen_ef0d609239e2f97c_base

{-# NOINLINE sDL_MostSignificantBitIndex32 #-}

-- | [C declaration]: @SDL_MostSignificantBitIndex32@, defined at @SDL3\/SDL_bits.h 66:22@
sDL_MostSignificantBitIndex32 :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CInt)
sDL_MostSignificantBitIndex32 =
  BG.unsafePerformIO hs_bindgen_ef0d609239e2f97c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Bits_get_SDL_HasExactlyOneBitSet32@
foreign import ccall unsafe "hs_bindgen_424cf674227955df"
  hs_bindgen_424cf674227955df_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Bits_get_SDL_HasExactlyOneBitSet32@
hs_bindgen_424cf674227955df :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_424cf674227955df =
  BG.fromFFIType hs_bindgen_424cf674227955df_base

{-# NOINLINE sDL_HasExactlyOneBitSet32 #-}

-- | Determine if a unsigned 32-bit value has exactly one bit set.
--
--     If there are no bits set (@x@ is zero), or more than one bit set, this returns false. If any one bit is exclusively set, this returns true.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [@x@]: the 32-bit value to examine.
--
--     [Returns]: true if exactly one bit is set in @x@, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_HasExactlyOneBitSet32@, defined at @SDL3\/SDL_bits.h 133:23@
sDL_HasExactlyOneBitSet32 :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_HasExactlyOneBitSet32 =
  BG.unsafePerformIO hs_bindgen_424cf674227955df

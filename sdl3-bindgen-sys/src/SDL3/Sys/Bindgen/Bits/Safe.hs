{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Bits.Safe (
  SDL3.Sys.Bindgen.Bits.Safe.sDL_MostSignificantBitIndex32,
  SDL3.Sys.Bindgen.Bits.Safe.sDL_HasExactlyOneBitSet32,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_bits.h>"
         , "signed int hs_bindgen_456d262a9d645a2c ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return (SDL_MostSignificantBitIndex32)(arg1);"
         , "}"
         , "_Bool hs_bindgen_f02b1182f4d7fd03 ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return (SDL_HasExactlyOneBitSet32)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Bits_Safe_SDL_MostSignificantBitIndex32@
foreign import ccall safe "hs_bindgen_456d262a9d645a2c"
  hs_bindgen_456d262a9d645a2c_base
    :: BG.Word32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Bits_Safe_SDL_MostSignificantBitIndex32@
hs_bindgen_456d262a9d645a2c
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CInt
hs_bindgen_456d262a9d645a2c =
  BG.fromFFIType hs_bindgen_456d262a9d645a2c_base

-- | [C declaration]: @SDL_MostSignificantBitIndex32@, defined at @SDL3\/SDL_bits.h 66:22@
sDL_MostSignificantBitIndex32
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @x@
  -> IO BG.CInt
sDL_MostSignificantBitIndex32 =
  hs_bindgen_456d262a9d645a2c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Bits_Safe_SDL_HasExactlyOneBitSet32@
foreign import ccall safe "hs_bindgen_f02b1182f4d7fd03"
  hs_bindgen_f02b1182f4d7fd03_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Bits_Safe_SDL_HasExactlyOneBitSet32@
hs_bindgen_f02b1182f4d7fd03
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_f02b1182f4d7fd03 =
  BG.fromFFIType hs_bindgen_f02b1182f4d7fd03_base

-- | Determine if a unsigned 32-bit value has exactly one bit set.
--
--     If there are no bits set (@x@ is zero), or more than one bit set, this returns false. If any one bit is exclusively set, this returns true.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [Returns]: true if exactly one bit is set in @x@, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_HasExactlyOneBitSet32@, defined at @SDL3\/SDL_bits.h 133:23@
sDL_HasExactlyOneBitSet32
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@x@]: the 32-bit value to examine.
  -> IO BG.CBool
sDL_HasExactlyOneBitSet32 =
  hs_bindgen_f02b1182f4d7fd03

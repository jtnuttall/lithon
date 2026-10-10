{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.StdincShims.FunPtr (
  SDL3.Sys.Bindgen.StdincShims.FunPtr.lithon_SDL_FOURCC,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#define SDL_SLOW_MEMCPY"
         , "#define SDL_SLOW_MEMMOVE"
         , "#define SDL_SLOW_MEMSET"
         , "#include <sdl3-bindgen-sys/SDL_stdinc_shims.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.StdincShims_get_lithon_SDL_FOURCC */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_be790970a60241f5 (void)) ("
         , "  Uint8 arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return &lithon_SDL_FOURCC;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.StdincShims_get_lithon_SDL_FOURCC@
foreign import ccall unsafe "hs_bindgen_be790970a60241f5"
  hs_bindgen_be790970a60241f5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.StdincShims_get_lithon_SDL_FOURCC@
hs_bindgen_be790970a60241f5
  :: IO
       ( BG.FunPtr
           ( SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
           )
       )
hs_bindgen_be790970a60241f5 =
  fmap BG.fromFFIType hs_bindgen_be790970a60241f5_base

{-# NOINLINE lithon_SDL_FOURCC #-}

-- | Define a four character code as a Uint32.
--
--     The SDL_FOURCC macro as a function.
--
--     [@a@]: the first ASCII character.
--
--     [@b@]: the second ASCII character.
--
--     [@c@]: the third ASCII character.
--
--     [@d@]: the fourth ASCII character.
--
--     [Returns]: the four characters converted into a Uint32, one character per-byte.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_FOURCC@, defined at @sdl3-bindgen-sys\/SDL_stdinc_shims.h 40:26@
lithon_SDL_FOURCC
  :: BG.FunPtr
       ( SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
       )
lithon_SDL_FOURCC =
  BG.unsafePerformIO hs_bindgen_be790970a60241f5

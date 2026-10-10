{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.SurfaceShims.Safe (
  SDL3.Sys.Bindgen.SurfaceShims.Safe.lithon_SDL_MUSTLOCK,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Surface qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#define SDL_SLOW_MEMCPY"
         , "#define SDL_SLOW_MEMMOVE"
         , "#define SDL_SLOW_MEMSET"
         , "#include <sdl3-bindgen-sys/SDL_surface_shims.h>"
         , "_Bool hs_bindgen_6956b0b35f4810d3 ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_MUSTLOCK)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.SurfaceShims_Safe_lithon_SDL_MUSTLOCK@
foreign import ccall safe "hs_bindgen_6956b0b35f4810d3"
  hs_bindgen_6956b0b35f4810d3_base
    :: BG.Ptr BG.Void
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.SurfaceShims_Safe_lithon_SDL_MUSTLOCK@
hs_bindgen_6956b0b35f4810d3
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> IO BG.CBool
hs_bindgen_6956b0b35f4810d3 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_6956b0b35f4810d3_base (BG.toFFIType x0))

-- | Determine whether a surface needs to be locked before its pixels are accessed.
--
--     The SDL_MUSTLOCK macro as a function.
--
--     [Returns]: true if the surface must be locked with SDL_LockSurface before its pixels are read or written, false otherwise.
--
--     @since 3.2.0
--
--     [See also]: SDL_LockSurface, SDL_UnlockSurface
--
--     [C declaration]: @lithon_SDL_MUSTLOCK@, defined at @sdl3-bindgen-sys\/SDL_surface_shims.h 39:24@
lithon_SDL_MUSTLOCK
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@surface@]: the SDL_Surface to check.
  -> IO BG.CBool
lithon_SDL_MUSTLOCK = hs_bindgen_6956b0b35f4810d3

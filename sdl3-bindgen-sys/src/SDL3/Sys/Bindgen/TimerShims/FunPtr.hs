{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.TimerShims.FunPtr (
  SDL3.Sys.Bindgen.TimerShims.FunPtr.lithon_SDL_SECONDS_TO_NS,
  SDL3.Sys.Bindgen.TimerShims.FunPtr.lithon_SDL_MS_TO_NS,
  SDL3.Sys.Bindgen.TimerShims.FunPtr.lithon_SDL_US_TO_NS,
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
         , "#include <sdl3-bindgen-sys/SDL_timer_shims.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_get_lithon_SDL_SECONDS_TO_NS */"
         , "__attribute__ ((const))"
         , "Uint64 (*hs_bindgen_bb4a7cef88282955 (void)) ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_SECONDS_TO_NS;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_get_lithon_SDL_MS_TO_NS */"
         , "__attribute__ ((const))"
         , "Uint64 (*hs_bindgen_e0cb179de29f3904 (void)) ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_MS_TO_NS;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_get_lithon_SDL_US_TO_NS */"
         , "__attribute__ ((const))"
         , "Uint64 (*hs_bindgen_258f5234969dea47 (void)) ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_US_TO_NS;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_get_lithon_SDL_SECONDS_TO_NS@
foreign import ccall unsafe "hs_bindgen_bb4a7cef88282955"
  hs_bindgen_bb4a7cef88282955_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_get_lithon_SDL_SECONDS_TO_NS@
hs_bindgen_bb4a7cef88282955
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64))
hs_bindgen_bb4a7cef88282955 =
  fmap BG.fromFFIType hs_bindgen_bb4a7cef88282955_base

{-# NOINLINE lithon_SDL_SECONDS_TO_NS #-}

-- | Convert seconds to nanoseconds.
--
--     The SDL_SECONDS_TO_NS macro as a function. This only converts whole numbers, not fractional seconds.
--
--     [@s@]: the number of seconds to convert.
--
--     [Returns]: @s@, expressed in nanoseconds.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_SECONDS_TO_NS@, defined at @sdl3-bindgen-sys\/SDL_timer_shims.h 37:26@
lithon_SDL_SECONDS_TO_NS
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64)
lithon_SDL_SECONDS_TO_NS =
  BG.unsafePerformIO hs_bindgen_bb4a7cef88282955

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_get_lithon_SDL_MS_TO_NS@
foreign import ccall unsafe "hs_bindgen_e0cb179de29f3904"
  hs_bindgen_e0cb179de29f3904_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_get_lithon_SDL_MS_TO_NS@
hs_bindgen_e0cb179de29f3904
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64))
hs_bindgen_e0cb179de29f3904 =
  fmap BG.fromFFIType hs_bindgen_e0cb179de29f3904_base

{-# NOINLINE lithon_SDL_MS_TO_NS #-}

-- | Convert milliseconds to nanoseconds.
--
--     The SDL_MS_TO_NS macro as a function. This only converts whole numbers, not fractional milliseconds.
--
--     [@ms@]: the number of milliseconds to convert.
--
--     [Returns]: @ms@, expressed in nanoseconds.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_MS_TO_NS@, defined at @sdl3-bindgen-sys\/SDL_timer_shims.h 55:26@
lithon_SDL_MS_TO_NS
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64)
lithon_SDL_MS_TO_NS =
  BG.unsafePerformIO hs_bindgen_e0cb179de29f3904

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_get_lithon_SDL_US_TO_NS@
foreign import ccall unsafe "hs_bindgen_258f5234969dea47"
  hs_bindgen_258f5234969dea47_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_get_lithon_SDL_US_TO_NS@
hs_bindgen_258f5234969dea47
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64))
hs_bindgen_258f5234969dea47 =
  fmap BG.fromFFIType hs_bindgen_258f5234969dea47_base

{-# NOINLINE lithon_SDL_US_TO_NS #-}

-- | Convert microseconds to nanoseconds.
--
--     The SDL_US_TO_NS macro as a function. This only converts whole numbers, not fractional microseconds.
--
--     [@us@]: the number of microseconds to convert.
--
--     [Returns]: @us@, expressed in nanoseconds.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_US_TO_NS@, defined at @sdl3-bindgen-sys\/SDL_timer_shims.h 73:26@
lithon_SDL_US_TO_NS
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64)
lithon_SDL_US_TO_NS =
  BG.unsafePerformIO hs_bindgen_258f5234969dea47

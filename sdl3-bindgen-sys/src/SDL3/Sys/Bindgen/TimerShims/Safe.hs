{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.TimerShims.Safe (
  SDL3.Sys.Bindgen.TimerShims.Safe.lithon_SDL_SECONDS_TO_NS,
  SDL3.Sys.Bindgen.TimerShims.Safe.lithon_SDL_MS_TO_NS,
  SDL3.Sys.Bindgen.TimerShims.Safe.lithon_SDL_US_TO_NS,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.LibC qualified
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
         , "Uint64 hs_bindgen_50109c3230bdd074 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_SECONDS_TO_NS)(arg1);"
         , "}"
         , "Uint64 hs_bindgen_d8988511c30941de ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_MS_TO_NS)(arg1);"
         , "}"
         , "Uint64 hs_bindgen_7ebf8cc80dec18d5 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_US_TO_NS)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_Safe_lithon_SDL_SECONDS_TO_NS@
foreign import ccall safe "hs_bindgen_50109c3230bdd074"
  hs_bindgen_50109c3230bdd074_base
    :: HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_Safe_lithon_SDL_SECONDS_TO_NS@
hs_bindgen_50109c3230bdd074
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_50109c3230bdd074 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_50109c3230bdd074_base (BG.toFFIType x0))

-- | Convert seconds to nanoseconds.
--
--     The SDL_SECONDS_TO_NS macro as a function. This only converts whole numbers, not fractional seconds.
--
--     [Returns]: @s@, expressed in nanoseconds.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_SECONDS_TO_NS@, defined at @sdl3-bindgen-sys\/SDL_timer_shims.h 37:26@
lithon_SDL_SECONDS_TO_NS
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@s@]: the number of seconds to convert.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
lithon_SDL_SECONDS_TO_NS =
  hs_bindgen_50109c3230bdd074

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_Safe_lithon_SDL_MS_TO_NS@
foreign import ccall safe "hs_bindgen_d8988511c30941de"
  hs_bindgen_d8988511c30941de_base
    :: HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_Safe_lithon_SDL_MS_TO_NS@
hs_bindgen_d8988511c30941de
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_d8988511c30941de =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_d8988511c30941de_base (BG.toFFIType x0))

-- | Convert milliseconds to nanoseconds.
--
--     The SDL_MS_TO_NS macro as a function. This only converts whole numbers, not fractional milliseconds.
--
--     [Returns]: @ms@, expressed in nanoseconds.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_MS_TO_NS@, defined at @sdl3-bindgen-sys\/SDL_timer_shims.h 55:26@
lithon_SDL_MS_TO_NS
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@ms@]: the number of milliseconds to convert.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
lithon_SDL_MS_TO_NS = hs_bindgen_d8988511c30941de

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_Safe_lithon_SDL_US_TO_NS@
foreign import ccall safe "hs_bindgen_7ebf8cc80dec18d5"
  hs_bindgen_7ebf8cc80dec18d5_base
    :: HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_Safe_lithon_SDL_US_TO_NS@
hs_bindgen_7ebf8cc80dec18d5
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_7ebf8cc80dec18d5 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_7ebf8cc80dec18d5_base (BG.toFFIType x0))

-- | Convert microseconds to nanoseconds.
--
--     The SDL_US_TO_NS macro as a function. This only converts whole numbers, not fractional microseconds.
--
--     [Returns]: @us@, expressed in nanoseconds.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_US_TO_NS@, defined at @sdl3-bindgen-sys\/SDL_timer_shims.h 73:26@
lithon_SDL_US_TO_NS
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@us@]: the number of microseconds to convert.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
lithon_SDL_US_TO_NS = hs_bindgen_7ebf8cc80dec18d5

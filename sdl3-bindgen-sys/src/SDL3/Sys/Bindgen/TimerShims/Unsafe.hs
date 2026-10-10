{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.TimerShims.Unsafe (
  SDL3.Sys.Bindgen.TimerShims.Unsafe.lithon_SDL_SECONDS_TO_NS,
  SDL3.Sys.Bindgen.TimerShims.Unsafe.lithon_SDL_MS_TO_NS,
  SDL3.Sys.Bindgen.TimerShims.Unsafe.lithon_SDL_US_TO_NS,
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
         , "Uint64 hs_bindgen_0447cf08139ac18b ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_SECONDS_TO_NS)(arg1);"
         , "}"
         , "Uint64 hs_bindgen_5f508296550393f9 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_MS_TO_NS)(arg1);"
         , "}"
         , "Uint64 hs_bindgen_70ba6a3967e18243 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_US_TO_NS)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_Unsafe_lithon_SDL_SECONDS_TO_NS@
foreign import ccall unsafe "hs_bindgen_0447cf08139ac18b"
  hs_bindgen_0447cf08139ac18b_base
    :: HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_Unsafe_lithon_SDL_SECONDS_TO_NS@
hs_bindgen_0447cf08139ac18b
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_0447cf08139ac18b =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_0447cf08139ac18b_base (BG.toFFIType x0))

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
  hs_bindgen_0447cf08139ac18b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_Unsafe_lithon_SDL_MS_TO_NS@
foreign import ccall unsafe "hs_bindgen_5f508296550393f9"
  hs_bindgen_5f508296550393f9_base
    :: HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_Unsafe_lithon_SDL_MS_TO_NS@
hs_bindgen_5f508296550393f9
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_5f508296550393f9 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_5f508296550393f9_base (BG.toFFIType x0))

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
lithon_SDL_MS_TO_NS = hs_bindgen_5f508296550393f9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_Unsafe_lithon_SDL_US_TO_NS@
foreign import ccall unsafe "hs_bindgen_70ba6a3967e18243"
  hs_bindgen_70ba6a3967e18243_base
    :: HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.TimerShims_Unsafe_lithon_SDL_US_TO_NS@
hs_bindgen_70ba6a3967e18243
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_70ba6a3967e18243 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_70ba6a3967e18243_base (BG.toFFIType x0))

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
lithon_SDL_US_TO_NS = hs_bindgen_70ba6a3967e18243

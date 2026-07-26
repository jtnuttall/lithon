{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Power.FunPtr (
  SDL3.Sys.Bindgen.Power.FunPtr.sDL_GetPowerInfo,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Power

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_power.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Power_get_SDL_GetPowerInfo */"
         , "__attribute__ ((const))"
         , "SDL_PowerState (*hs_bindgen_ccc542a5396280c2 (void)) ("
         , "  signed int *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetPowerInfo;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Power_get_SDL_GetPowerInfo@
foreign import ccall unsafe "hs_bindgen_ccc542a5396280c2"
  hs_bindgen_ccc542a5396280c2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Power_get_SDL_GetPowerInfo@
hs_bindgen_ccc542a5396280c2
  :: IO (BG.FunPtr (BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO SDL_PowerState))
hs_bindgen_ccc542a5396280c2 =
  BG.fromFFIType hs_bindgen_ccc542a5396280c2_base

{-# NOINLINE sDL_GetPowerInfo #-}

-- | Get the current power supply details.
--
--     You should never take a battery status as absolute truth. Batteries (especially failing batteries) are delicate hardware, and the values reported here are best estimates based on what that hardware reports. It\'s not uncommon for older batteries to lose stored power much faster than it reports, or completely drain when reporting it has 20 percent left, etc.
--
--     Battery status can change at any time; if you are concerned with power state, you should call this function frequently, and perhaps ignore changes until they seem to be stable for a few seconds.
--
--     It\'s possible a platform can only report battery percentage or time left but not both.
--
--     On some platforms, retrieving power supply details might be expensive. If you want to display continuous status you could call this function every minute or so.
--
--     [@seconds@]: a pointer filled in with the seconds of battery life left, or NULL to ignore. This will be filled in with -1 if we can\'t determine a value or there is no battery.
--
--     [@percent@]: a pointer filled in with the percentage of battery life left, between 0 and 100, or NULL to ignore. This will be filled in with -1 when we can\'t determine a value or there is no battery.
--
--     [Returns]: the current battery state or @SDL_POWERSTATE_ERROR@ on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetPowerInfo@, defined at @SDL3\/SDL_power.h 100:44@
sDL_GetPowerInfo :: BG.FunPtr (BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO SDL_PowerState)
sDL_GetPowerInfo =
  BG.unsafePerformIO hs_bindgen_ccc542a5396280c2

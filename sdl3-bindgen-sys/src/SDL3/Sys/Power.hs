-- | SDL power management routines.
--
--     There is a single function in this category: @'getPowerInfo'@.
--
--     This function is useful for games on the go. This allows an app to know if it\'s running on a draining battery, which can be useful if the app wants to reduce processing, or perhaps framerate, to extend the duration of the battery\'s charge. Perhaps the app just wants to show a battery meter when fullscreen, or alert the user when the power is getting extremely low, so they can save their game. The basic state for the system\'s power supply.
--
--     These are results returned by @'getPowerInfo'@.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Power.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Power (
  module SDL3.Sys.Bindgen.Power,

  -- * Function aliases
  SDL3.Sys.Power.getPowerInfo,
  SDL3.Sys.Power.getPowerInfoSafe,
)
where

import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Power
import SDL3.Sys.Bindgen.Power.Safe qualified as Safe
import SDL3.Sys.Bindgen.Power.Unsafe qualified as Unsafe

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
--     [Returns]: the current battery state or @SDL_POWERSTATE_ERROR@ on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPowerInfo@.
--                   The safe flavor is 'getPowerInfoSafe'
--                   .
--
--     [C declaration]: @SDL_GetPowerInfo@, defined at @SDL3\/SDL_power.h 100:44@
getPowerInfo
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@seconds@]: a pointer filled in with the seconds of battery life left, or NULL to ignore. This will be filled in with -1 if we can\'t determine a value or there is no battery.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@percent@]: a pointer filled in with the percentage of battery life left, between 0 and 100, or NULL to ignore. This will be filled in with -1 when we can\'t determine a value or there is no battery.
  -> IO SDL_PowerState
getPowerInfo = Unsafe.sDL_GetPowerInfo

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
--     [Returns]: the current battery state or @SDL_POWERSTATE_ERROR@ on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPowerInfo@.
--                   The unsafe flavor is 'getPowerInfo'
--                   .
--
--     [C declaration]: @SDL_GetPowerInfo@, defined at @SDL3\/SDL_power.h 100:44@
getPowerInfoSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@seconds@]: a pointer filled in with the seconds of battery life left, or NULL to ignore. This will be filled in with -1 if we can\'t determine a value or there is no battery.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@percent@]: a pointer filled in with the percentage of battery life left, between 0 and 100, or NULL to ignore. This will be filled in with -1 when we can\'t determine a value or there is no battery.
  -> IO SDL_PowerState
getPowerInfoSafe = Safe.sDL_GetPowerInfo

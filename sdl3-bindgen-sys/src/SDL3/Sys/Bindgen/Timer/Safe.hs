{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Timer.Safe (
  SDL3.Sys.Bindgen.Timer.Safe.sDL_GetTicks,
  SDL3.Sys.Bindgen.Timer.Safe.sDL_GetTicksNS,
  SDL3.Sys.Bindgen.Timer.Safe.sDL_GetPerformanceCounter,
  SDL3.Sys.Bindgen.Timer.Safe.sDL_GetPerformanceFrequency,
  SDL3.Sys.Bindgen.Timer.Safe.sDL_Delay,
  SDL3.Sys.Bindgen.Timer.Safe.sDL_DelayNS,
  SDL3.Sys.Bindgen.Timer.Safe.sDL_DelayPrecise,
  SDL3.Sys.Bindgen.Timer.Safe.sDL_AddTimer,
  SDL3.Sys.Bindgen.Timer.Safe.sDL_AddTimerNS,
  SDL3.Sys.Bindgen.Timer.Safe.sDL_RemoveTimer,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Timer

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_timer.h>"
         , "Uint64 hs_bindgen_c6153618a018e856 (void)"
         , "{"
         , "  return (SDL_GetTicks)();"
         , "}"
         , "Uint64 hs_bindgen_47e2e360ac6e112d (void)"
         , "{"
         , "  return (SDL_GetTicksNS)();"
         , "}"
         , "Uint64 hs_bindgen_e58f7e74d5dfd2f6 (void)"
         , "{"
         , "  return (SDL_GetPerformanceCounter)();"
         , "}"
         , "Uint64 hs_bindgen_3a4825ac03082c11 (void)"
         , "{"
         , "  return (SDL_GetPerformanceFrequency)();"
         , "}"
         , "void hs_bindgen_8754cd6d3f04ccff ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  (SDL_Delay)(arg1);"
         , "}"
         , "void hs_bindgen_4581488a34fdd3e7 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  (SDL_DelayNS)(arg1);"
         , "}"
         , "void hs_bindgen_19457ba0f1d978a7 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  (SDL_DelayPrecise)(arg1);"
         , "}"
         , "SDL_TimerID hs_bindgen_1eb4863b9e459f9b ("
         , "  Uint32 arg1,"
         , "  SDL_TimerCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_AddTimer)(arg1, arg2, arg3);"
         , "}"
         , "SDL_TimerID hs_bindgen_04843533c2eea6bf ("
         , "  Uint64 arg1,"
         , "  SDL_NSTimerCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_AddTimerNS)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_3794f4416b9527ed ("
         , "  SDL_TimerID arg1"
         , ")"
         , "{"
         , "  return (SDL_RemoveTimer)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_GetTicks@
foreign import ccall safe "hs_bindgen_c6153618a018e856"
  hs_bindgen_c6153618a018e856_base
    :: IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_GetTicks@
hs_bindgen_c6153618a018e856 :: IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_c6153618a018e856 =
  BG.fromFFIType hs_bindgen_c6153618a018e856_base

-- | Get the number of milliseconds that have elapsed since the SDL library initialization.
--
--     [Returns]: an unsigned 64‑bit integer that represents the number of milliseconds that have elapsed since the SDL library was initialized (typically via a call to SDL_Init).
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTicksNS'
--
--     [C declaration]: @SDL_GetTicks@, defined at @SDL3\/SDL_timer.h 201:36@
sDL_GetTicks :: IO SDL3.Sys.Bindgen.Stdinc.Uint64
sDL_GetTicks = hs_bindgen_c6153618a018e856

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_GetTicksNS@
foreign import ccall safe "hs_bindgen_47e2e360ac6e112d"
  hs_bindgen_47e2e360ac6e112d_base
    :: IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_GetTicksNS@
hs_bindgen_47e2e360ac6e112d :: IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_47e2e360ac6e112d =
  BG.fromFFIType hs_bindgen_47e2e360ac6e112d_base

-- | Get the number of nanoseconds since SDL library initialization.
--
--     [Returns]: an unsigned 64-bit value representing the number of nanoseconds since the SDL library initialized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTicksNS@, defined at @SDL3\/SDL_timer.h 213:36@
sDL_GetTicksNS :: IO SDL3.Sys.Bindgen.Stdinc.Uint64
sDL_GetTicksNS = hs_bindgen_47e2e360ac6e112d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_GetPerformanceCounter@
foreign import ccall safe "hs_bindgen_e58f7e74d5dfd2f6"
  hs_bindgen_e58f7e74d5dfd2f6_base
    :: IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_GetPerformanceCounter@
hs_bindgen_e58f7e74d5dfd2f6 :: IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_e58f7e74d5dfd2f6 =
  BG.fromFFIType hs_bindgen_e58f7e74d5dfd2f6_base

-- | Get the current value of the high resolution counter.
--
--     This function is typically used for profiling.
--
--     The counter values are only meaningful relative to each other. Differences between values can be converted to times by using @SDL_GetPerformanceFrequency()@.
--
--     [Returns]: the current counter value.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPerformanceFrequency'
--
--     [C declaration]: @SDL_GetPerformanceCounter@, defined at @SDL3\/SDL_timer.h 232:36@
sDL_GetPerformanceCounter :: IO SDL3.Sys.Bindgen.Stdinc.Uint64
sDL_GetPerformanceCounter =
  hs_bindgen_e58f7e74d5dfd2f6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_GetPerformanceFrequency@
foreign import ccall safe "hs_bindgen_3a4825ac03082c11"
  hs_bindgen_3a4825ac03082c11_base
    :: IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_GetPerformanceFrequency@
hs_bindgen_3a4825ac03082c11 :: IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_3a4825ac03082c11 =
  BG.fromFFIType hs_bindgen_3a4825ac03082c11_base

-- | Get the count per second of the high resolution counter.
--
--     [Returns]: a platform-specific count per second.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPerformanceCounter'
--
--     [C declaration]: @SDL_GetPerformanceFrequency@, defined at @SDL3\/SDL_timer.h 245:36@
sDL_GetPerformanceFrequency :: IO SDL3.Sys.Bindgen.Stdinc.Uint64
sDL_GetPerformanceFrequency =
  hs_bindgen_3a4825ac03082c11

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_Delay@
foreign import ccall safe "hs_bindgen_8754cd6d3f04ccff"
  hs_bindgen_8754cd6d3f04ccff_base
    :: BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_Delay@
hs_bindgen_8754cd6d3f04ccff
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_8754cd6d3f04ccff =
  BG.fromFFIType hs_bindgen_8754cd6d3f04ccff_base

-- | Wait a specified number of milliseconds before returning.
--
--     This function waits a specified number of milliseconds before returning. It waits at least the specified time, but possibly longer due to OS scheduling.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DelayNS', 'sDL_DelayPrecise'
--
--     [C declaration]: @SDL_Delay@, defined at @SDL3\/SDL_timer.h 263:34@
sDL_Delay
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@ms@]: the number of milliseconds to delay.
  -> IO ()
sDL_Delay = hs_bindgen_8754cd6d3f04ccff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_DelayNS@
foreign import ccall safe "hs_bindgen_4581488a34fdd3e7"
  hs_bindgen_4581488a34fdd3e7_base
    :: BG.Word64
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_DelayNS@
hs_bindgen_4581488a34fdd3e7
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO ()
hs_bindgen_4581488a34fdd3e7 =
  BG.fromFFIType hs_bindgen_4581488a34fdd3e7_base

-- | Wait a specified number of nanoseconds before returning.
--
--     This function waits a specified number of nanoseconds before returning. It waits at least the specified time, but possibly longer due to OS scheduling.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Delay', 'sDL_DelayPrecise'
--
--     [C declaration]: @SDL_DelayNS@, defined at @SDL3\/SDL_timer.h 281:34@
sDL_DelayNS
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@ns@]: the number of nanoseconds to delay.
  -> IO ()
sDL_DelayNS = hs_bindgen_4581488a34fdd3e7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_DelayPrecise@
foreign import ccall safe "hs_bindgen_19457ba0f1d978a7"
  hs_bindgen_19457ba0f1d978a7_base
    :: BG.Word64
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_DelayPrecise@
hs_bindgen_19457ba0f1d978a7
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO ()
hs_bindgen_19457ba0f1d978a7 =
  BG.fromFFIType hs_bindgen_19457ba0f1d978a7_base

-- | Wait a specified number of nanoseconds before returning.
--
--     This function waits a specified number of nanoseconds before returning. It will attempt to wait as close to the requested time as possible, busy waiting if necessary, but could return later due to OS scheduling.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Delay', 'sDL_DelayNS'
--
--     [C declaration]: @SDL_DelayPrecise@, defined at @SDL3\/SDL_timer.h 299:34@
sDL_DelayPrecise
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@ns@]: the number of nanoseconds to delay.
  -> IO ()
sDL_DelayPrecise = hs_bindgen_19457ba0f1d978a7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_AddTimer@
foreign import ccall safe "hs_bindgen_1eb4863b9e459f9b"
  hs_bindgen_1eb4863b9e459f9b_base
    :: BG.Word32
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_AddTimer@
hs_bindgen_1eb4863b9e459f9b
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL_TimerCallback
  -> BG.Ptr BG.Void
  -> IO SDL_TimerID
hs_bindgen_1eb4863b9e459f9b =
  BG.fromFFIType hs_bindgen_1eb4863b9e459f9b_base

-- | Call a callback function at a future time.
--
--     The callback function is passed the current timer interval and the user supplied parameter from the @SDL_AddTimer()@ call and should return the next timer interval. If the value returned from the callback is 0, the timer is canceled and will be removed.
--
--     The callback is run on a separate thread, and for short timeouts can potentially be called before this function returns.
--
--     Timers take into account the amount of time it took to execute the callback. For example, if the callback took 250 ms to execute and returned 1000 (ms), the timer would only wait another 750 ms before its next iteration.
--
--     Timing may be inexact due to OS scheduling. Be sure to note the current time with @SDL_GetTicksNS()@ or @SDL_GetPerformanceCounter()@ in case your callback needs to adjust for variances.
--
--     [Returns]: a timer ID or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddTimerNS', 'sDL_RemoveTimer'
--
--     [C declaration]: @SDL_AddTimer@, defined at @SDL3\/SDL_timer.h 368:41@
sDL_AddTimer
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@interval@]: the timer delay, in milliseconds, passed to @callback@.
  -> SDL_TimerCallback
  -- ^
  --
  --           [@callback@]: the 'SDL_TimerCallback' function to call when the specified @interval@ elapses.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @callback@.
  -> IO SDL_TimerID
sDL_AddTimer = hs_bindgen_1eb4863b9e459f9b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_AddTimerNS@
foreign import ccall safe "hs_bindgen_04843533c2eea6bf"
  hs_bindgen_04843533c2eea6bf_base
    :: BG.Word64
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_AddTimerNS@
hs_bindgen_04843533c2eea6bf
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> SDL_NSTimerCallback
  -> BG.Ptr BG.Void
  -> IO SDL_TimerID
hs_bindgen_04843533c2eea6bf =
  BG.fromFFIType hs_bindgen_04843533c2eea6bf_base

-- | Call a callback function at a future time.
--
--     The callback function is passed the current timer interval and the user supplied parameter from the @SDL_AddTimerNS()@ call and should return the next timer interval. If the value returned from the callback is 0, the timer is canceled and will be removed.
--
--     The callback is run on a separate thread, and for short timeouts can potentially be called before this function returns.
--
--     Timers take into account the amount of time it took to execute the callback. For example, if the callback took 250 ns to execute and returned 1000 (ns), the timer would only wait another 750 ns before its next iteration.
--
--     Timing may be inexact due to OS scheduling. Be sure to note the current time with @SDL_GetTicksNS()@ or @SDL_GetPerformanceCounter()@ in case your callback needs to adjust for variances.
--
--     [Returns]: a timer ID or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddTimer', 'sDL_RemoveTimer'
--
--     [C declaration]: @SDL_AddTimerNS@, defined at @SDL3\/SDL_timer.h 430:41@
sDL_AddTimerNS
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@interval@]: the timer delay, in nanoseconds, passed to @callback@.
  -> SDL_NSTimerCallback
  -- ^
  --
  --           [@callback@]: the 'SDL_TimerCallback' function to call when the specified @interval@ elapses.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @callback@.
  -> IO SDL_TimerID
sDL_AddTimerNS = hs_bindgen_04843533c2eea6bf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_RemoveTimer@
foreign import ccall safe "hs_bindgen_3794f4416b9527ed"
  hs_bindgen_3794f4416b9527ed_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Safe_SDL_RemoveTimer@
hs_bindgen_3794f4416b9527ed
  :: SDL_TimerID
  -> IO BG.CBool
hs_bindgen_3794f4416b9527ed =
  BG.fromFFIType hs_bindgen_3794f4416b9527ed_base

-- | Remove a timer created with @SDL_AddTimer()@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddTimer'
--
--     [C declaration]: @SDL_RemoveTimer@, defined at @SDL3\/SDL_timer.h 445:34@
sDL_RemoveTimer
  :: SDL_TimerID
  -- ^
  --
  --           [@id@]: the ID of the timer to remove.
  -> IO BG.CBool
sDL_RemoveTimer = hs_bindgen_3794f4416b9527ed

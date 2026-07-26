{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Timer.Unsafe (
  SDL3.Sys.Bindgen.Timer.Unsafe.sDL_GetTicks,
  SDL3.Sys.Bindgen.Timer.Unsafe.sDL_GetTicksNS,
  SDL3.Sys.Bindgen.Timer.Unsafe.sDL_GetPerformanceCounter,
  SDL3.Sys.Bindgen.Timer.Unsafe.sDL_GetPerformanceFrequency,
  SDL3.Sys.Bindgen.Timer.Unsafe.sDL_Delay,
  SDL3.Sys.Bindgen.Timer.Unsafe.sDL_DelayNS,
  SDL3.Sys.Bindgen.Timer.Unsafe.sDL_DelayPrecise,
  SDL3.Sys.Bindgen.Timer.Unsafe.sDL_AddTimer,
  SDL3.Sys.Bindgen.Timer.Unsafe.sDL_AddTimerNS,
  SDL3.Sys.Bindgen.Timer.Unsafe.sDL_RemoveTimer,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Timer

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_timer.h>"
         , "Uint64 hs_bindgen_048639750b48f695 (void)"
         , "{"
         , "  return (SDL_GetTicks)();"
         , "}"
         , "Uint64 hs_bindgen_5bd68dc01ceb08e8 (void)"
         , "{"
         , "  return (SDL_GetTicksNS)();"
         , "}"
         , "Uint64 hs_bindgen_8d8e0f9377cfcf7d (void)"
         , "{"
         , "  return (SDL_GetPerformanceCounter)();"
         , "}"
         , "Uint64 hs_bindgen_6775fe97a579d8be (void)"
         , "{"
         , "  return (SDL_GetPerformanceFrequency)();"
         , "}"
         , "void hs_bindgen_1b1b86e10ec2a52a ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  (SDL_Delay)(arg1);"
         , "}"
         , "void hs_bindgen_8bb71f8de5a6570c ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  (SDL_DelayNS)(arg1);"
         , "}"
         , "void hs_bindgen_ec69e98c6a717d75 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  (SDL_DelayPrecise)(arg1);"
         , "}"
         , "SDL_TimerID hs_bindgen_14f66e216435c762 ("
         , "  Uint32 arg1,"
         , "  SDL_TimerCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_AddTimer)(arg1, arg2, arg3);"
         , "}"
         , "SDL_TimerID hs_bindgen_a0b2068e0ed2278f ("
         , "  Uint64 arg1,"
         , "  SDL_NSTimerCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_AddTimerNS)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_55aee2089fbaec7e ("
         , "  SDL_TimerID arg1"
         , ")"
         , "{"
         , "  return (SDL_RemoveTimer)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_GetTicks@
foreign import ccall unsafe "hs_bindgen_048639750b48f695"
  hs_bindgen_048639750b48f695_base
    :: IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_GetTicks@
hs_bindgen_048639750b48f695 :: IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_048639750b48f695 =
  BG.fromFFIType hs_bindgen_048639750b48f695_base

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
sDL_GetTicks = hs_bindgen_048639750b48f695

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_GetTicksNS@
foreign import ccall unsafe "hs_bindgen_5bd68dc01ceb08e8"
  hs_bindgen_5bd68dc01ceb08e8_base
    :: IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_GetTicksNS@
hs_bindgen_5bd68dc01ceb08e8 :: IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_5bd68dc01ceb08e8 =
  BG.fromFFIType hs_bindgen_5bd68dc01ceb08e8_base

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
sDL_GetTicksNS = hs_bindgen_5bd68dc01ceb08e8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_GetPerformanceCounter@
foreign import ccall unsafe "hs_bindgen_8d8e0f9377cfcf7d"
  hs_bindgen_8d8e0f9377cfcf7d_base
    :: IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_GetPerformanceCounter@
hs_bindgen_8d8e0f9377cfcf7d :: IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_8d8e0f9377cfcf7d =
  BG.fromFFIType hs_bindgen_8d8e0f9377cfcf7d_base

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
  hs_bindgen_8d8e0f9377cfcf7d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_GetPerformanceFrequency@
foreign import ccall unsafe "hs_bindgen_6775fe97a579d8be"
  hs_bindgen_6775fe97a579d8be_base
    :: IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_GetPerformanceFrequency@
hs_bindgen_6775fe97a579d8be :: IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_6775fe97a579d8be =
  BG.fromFFIType hs_bindgen_6775fe97a579d8be_base

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
  hs_bindgen_6775fe97a579d8be

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_Delay@
foreign import ccall unsafe "hs_bindgen_1b1b86e10ec2a52a"
  hs_bindgen_1b1b86e10ec2a52a_base
    :: BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_Delay@
hs_bindgen_1b1b86e10ec2a52a
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_1b1b86e10ec2a52a =
  BG.fromFFIType hs_bindgen_1b1b86e10ec2a52a_base

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
sDL_Delay = hs_bindgen_1b1b86e10ec2a52a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_DelayNS@
foreign import ccall unsafe "hs_bindgen_8bb71f8de5a6570c"
  hs_bindgen_8bb71f8de5a6570c_base
    :: BG.Word64
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_DelayNS@
hs_bindgen_8bb71f8de5a6570c
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO ()
hs_bindgen_8bb71f8de5a6570c =
  BG.fromFFIType hs_bindgen_8bb71f8de5a6570c_base

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
sDL_DelayNS = hs_bindgen_8bb71f8de5a6570c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_DelayPrecise@
foreign import ccall unsafe "hs_bindgen_ec69e98c6a717d75"
  hs_bindgen_ec69e98c6a717d75_base
    :: BG.Word64
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_DelayPrecise@
hs_bindgen_ec69e98c6a717d75
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO ()
hs_bindgen_ec69e98c6a717d75 =
  BG.fromFFIType hs_bindgen_ec69e98c6a717d75_base

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
sDL_DelayPrecise = hs_bindgen_ec69e98c6a717d75

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_AddTimer@
foreign import ccall unsafe "hs_bindgen_14f66e216435c762"
  hs_bindgen_14f66e216435c762_base
    :: BG.Word32
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_AddTimer@
hs_bindgen_14f66e216435c762
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL_TimerCallback
  -> BG.Ptr BG.Void
  -> IO SDL_TimerID
hs_bindgen_14f66e216435c762 =
  BG.fromFFIType hs_bindgen_14f66e216435c762_base

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
sDL_AddTimer = hs_bindgen_14f66e216435c762

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_AddTimerNS@
foreign import ccall unsafe "hs_bindgen_a0b2068e0ed2278f"
  hs_bindgen_a0b2068e0ed2278f_base
    :: BG.Word64
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_AddTimerNS@
hs_bindgen_a0b2068e0ed2278f
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> SDL_NSTimerCallback
  -> BG.Ptr BG.Void
  -> IO SDL_TimerID
hs_bindgen_a0b2068e0ed2278f =
  BG.fromFFIType hs_bindgen_a0b2068e0ed2278f_base

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
sDL_AddTimerNS = hs_bindgen_a0b2068e0ed2278f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_RemoveTimer@
foreign import ccall unsafe "hs_bindgen_55aee2089fbaec7e"
  hs_bindgen_55aee2089fbaec7e_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_Unsafe_SDL_RemoveTimer@
hs_bindgen_55aee2089fbaec7e
  :: SDL_TimerID
  -> IO BG.CBool
hs_bindgen_55aee2089fbaec7e =
  BG.fromFFIType hs_bindgen_55aee2089fbaec7e_base

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
sDL_RemoveTimer = hs_bindgen_55aee2089fbaec7e

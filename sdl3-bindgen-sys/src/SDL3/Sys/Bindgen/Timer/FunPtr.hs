{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Timer.FunPtr (
  SDL3.Sys.Bindgen.Timer.FunPtr.sDL_GetTicks,
  SDL3.Sys.Bindgen.Timer.FunPtr.sDL_GetTicksNS,
  SDL3.Sys.Bindgen.Timer.FunPtr.sDL_GetPerformanceCounter,
  SDL3.Sys.Bindgen.Timer.FunPtr.sDL_GetPerformanceFrequency,
  SDL3.Sys.Bindgen.Timer.FunPtr.sDL_Delay,
  SDL3.Sys.Bindgen.Timer.FunPtr.sDL_DelayNS,
  SDL3.Sys.Bindgen.Timer.FunPtr.sDL_DelayPrecise,
  SDL3.Sys.Bindgen.Timer.FunPtr.sDL_AddTimer,
  SDL3.Sys.Bindgen.Timer.FunPtr.sDL_AddTimerNS,
  SDL3.Sys.Bindgen.Timer.FunPtr.sDL_RemoveTimer,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Timer

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_timer.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_GetTicks */"
         , "__attribute__ ((const))"
         , "Uint64 (*hs_bindgen_b002c533def7d6e4 (void)) (void)"
         , "{"
         , "  return &SDL_GetTicks;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_GetTicksNS */"
         , "__attribute__ ((const))"
         , "Uint64 (*hs_bindgen_b11474f76c0aba2f (void)) (void)"
         , "{"
         , "  return &SDL_GetTicksNS;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_GetPerformanceCounter */"
         , "__attribute__ ((const))"
         , "Uint64 (*hs_bindgen_2b2a93de1b59846d (void)) (void)"
         , "{"
         , "  return &SDL_GetPerformanceCounter;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_GetPerformanceFrequency */"
         , "__attribute__ ((const))"
         , "Uint64 (*hs_bindgen_4255230676734c7d (void)) (void)"
         , "{"
         , "  return &SDL_GetPerformanceFrequency;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_Delay */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_84b99149e32b080f (void)) ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return &SDL_Delay;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_DelayNS */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_1a329c57b5bdd945 (void)) ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return &SDL_DelayNS;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_DelayPrecise */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_f88afdd785f29344 (void)) ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return &SDL_DelayPrecise;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_AddTimer */"
         , "__attribute__ ((const))"
         , "SDL_TimerID (*hs_bindgen_fd3519e258872841 (void)) ("
         , "  Uint32 arg1,"
         , "  SDL_TimerCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_AddTimer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_AddTimerNS */"
         , "__attribute__ ((const))"
         , "SDL_TimerID (*hs_bindgen_de4009388b75ebae (void)) ("
         , "  Uint64 arg1,"
         , "  SDL_NSTimerCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_AddTimerNS;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_RemoveTimer */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_837b4956d1a9314e (void)) ("
         , "  SDL_TimerID arg1"
         , ")"
         , "{"
         , "  return &SDL_RemoveTimer;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_GetTicks@
foreign import ccall unsafe "hs_bindgen_b002c533def7d6e4"
  hs_bindgen_b002c533def7d6e4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_GetTicks@
hs_bindgen_b002c533def7d6e4 :: IO (BG.FunPtr (IO SDL3.Sys.Bindgen.Stdinc.Uint64))
hs_bindgen_b002c533def7d6e4 =
  BG.fromFFIType hs_bindgen_b002c533def7d6e4_base

{-# NOINLINE sDL_GetTicks #-}

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
sDL_GetTicks :: BG.FunPtr (IO SDL3.Sys.Bindgen.Stdinc.Uint64)
sDL_GetTicks =
  BG.unsafePerformIO hs_bindgen_b002c533def7d6e4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_GetTicksNS@
foreign import ccall unsafe "hs_bindgen_b11474f76c0aba2f"
  hs_bindgen_b11474f76c0aba2f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_GetTicksNS@
hs_bindgen_b11474f76c0aba2f :: IO (BG.FunPtr (IO SDL3.Sys.Bindgen.Stdinc.Uint64))
hs_bindgen_b11474f76c0aba2f =
  BG.fromFFIType hs_bindgen_b11474f76c0aba2f_base

{-# NOINLINE sDL_GetTicksNS #-}

-- | Get the number of nanoseconds since SDL library initialization.
--
--     [Returns]: an unsigned 64-bit value representing the number of nanoseconds since the SDL library initialized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTicksNS@, defined at @SDL3\/SDL_timer.h 213:36@
sDL_GetTicksNS :: BG.FunPtr (IO SDL3.Sys.Bindgen.Stdinc.Uint64)
sDL_GetTicksNS =
  BG.unsafePerformIO hs_bindgen_b11474f76c0aba2f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_GetPerformanceCounter@
foreign import ccall unsafe "hs_bindgen_2b2a93de1b59846d"
  hs_bindgen_2b2a93de1b59846d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_GetPerformanceCounter@
hs_bindgen_2b2a93de1b59846d :: IO (BG.FunPtr (IO SDL3.Sys.Bindgen.Stdinc.Uint64))
hs_bindgen_2b2a93de1b59846d =
  BG.fromFFIType hs_bindgen_2b2a93de1b59846d_base

{-# NOINLINE sDL_GetPerformanceCounter #-}

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
sDL_GetPerformanceCounter :: BG.FunPtr (IO SDL3.Sys.Bindgen.Stdinc.Uint64)
sDL_GetPerformanceCounter =
  BG.unsafePerformIO hs_bindgen_2b2a93de1b59846d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_GetPerformanceFrequency@
foreign import ccall unsafe "hs_bindgen_4255230676734c7d"
  hs_bindgen_4255230676734c7d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_GetPerformanceFrequency@
hs_bindgen_4255230676734c7d :: IO (BG.FunPtr (IO SDL3.Sys.Bindgen.Stdinc.Uint64))
hs_bindgen_4255230676734c7d =
  BG.fromFFIType hs_bindgen_4255230676734c7d_base

{-# NOINLINE sDL_GetPerformanceFrequency #-}

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
sDL_GetPerformanceFrequency :: BG.FunPtr (IO SDL3.Sys.Bindgen.Stdinc.Uint64)
sDL_GetPerformanceFrequency =
  BG.unsafePerformIO hs_bindgen_4255230676734c7d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_Delay@
foreign import ccall unsafe "hs_bindgen_84b99149e32b080f"
  hs_bindgen_84b99149e32b080f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_Delay@
hs_bindgen_84b99149e32b080f :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO ()))
hs_bindgen_84b99149e32b080f =
  BG.fromFFIType hs_bindgen_84b99149e32b080f_base

{-# NOINLINE sDL_Delay #-}

-- | Wait a specified number of milliseconds before returning.
--
--     This function waits a specified number of milliseconds before returning. It waits at least the specified time, but possibly longer due to OS scheduling.
--
--     [@ms@]: the number of milliseconds to delay.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DelayNS', 'sDL_DelayPrecise'
--
--     [C declaration]: @SDL_Delay@, defined at @SDL3\/SDL_timer.h 263:34@
sDL_Delay :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO ())
sDL_Delay =
  BG.unsafePerformIO hs_bindgen_84b99149e32b080f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_DelayNS@
foreign import ccall unsafe "hs_bindgen_1a329c57b5bdd945"
  hs_bindgen_1a329c57b5bdd945_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_DelayNS@
hs_bindgen_1a329c57b5bdd945 :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO ()))
hs_bindgen_1a329c57b5bdd945 =
  BG.fromFFIType hs_bindgen_1a329c57b5bdd945_base

{-# NOINLINE sDL_DelayNS #-}

-- | Wait a specified number of nanoseconds before returning.
--
--     This function waits a specified number of nanoseconds before returning. It waits at least the specified time, but possibly longer due to OS scheduling.
--
--     [@ns@]: the number of nanoseconds to delay.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Delay', 'sDL_DelayPrecise'
--
--     [C declaration]: @SDL_DelayNS@, defined at @SDL3\/SDL_timer.h 281:34@
sDL_DelayNS :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO ())
sDL_DelayNS =
  BG.unsafePerformIO hs_bindgen_1a329c57b5bdd945

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_DelayPrecise@
foreign import ccall unsafe "hs_bindgen_f88afdd785f29344"
  hs_bindgen_f88afdd785f29344_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_DelayPrecise@
hs_bindgen_f88afdd785f29344 :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO ()))
hs_bindgen_f88afdd785f29344 =
  BG.fromFFIType hs_bindgen_f88afdd785f29344_base

{-# NOINLINE sDL_DelayPrecise #-}

-- | Wait a specified number of nanoseconds before returning.
--
--     This function waits a specified number of nanoseconds before returning. It will attempt to wait as close to the requested time as possible, busy waiting if necessary, but could return later due to OS scheduling.
--
--     [@ns@]: the number of nanoseconds to delay.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Delay', 'sDL_DelayNS'
--
--     [C declaration]: @SDL_DelayPrecise@, defined at @SDL3\/SDL_timer.h 299:34@
sDL_DelayPrecise :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO ())
sDL_DelayPrecise =
  BG.unsafePerformIO hs_bindgen_f88afdd785f29344

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_AddTimer@
foreign import ccall unsafe "hs_bindgen_fd3519e258872841"
  hs_bindgen_fd3519e258872841_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_AddTimer@
hs_bindgen_fd3519e258872841
  :: IO
       (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> SDL_TimerCallback -> BG.Ptr BG.Void -> IO SDL_TimerID))
hs_bindgen_fd3519e258872841 =
  BG.fromFFIType hs_bindgen_fd3519e258872841_base

{-# NOINLINE sDL_AddTimer #-}

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
--     [@interval@]: the timer delay, in milliseconds, passed to @callback@.
--
--     [@callback@]: the 'SDL_TimerCallback' function to call when the specified @interval@ elapses.
--
--     [@userdata@]: a pointer that is passed to @callback@.
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
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> SDL_TimerCallback -> BG.Ptr BG.Void -> IO SDL_TimerID)
sDL_AddTimer =
  BG.unsafePerformIO hs_bindgen_fd3519e258872841

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_AddTimerNS@
foreign import ccall unsafe "hs_bindgen_de4009388b75ebae"
  hs_bindgen_de4009388b75ebae_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_AddTimerNS@
hs_bindgen_de4009388b75ebae
  :: IO
       ( BG.FunPtr
           (SDL3.Sys.Bindgen.Stdinc.Uint64 -> SDL_NSTimerCallback -> BG.Ptr BG.Void -> IO SDL_TimerID)
       )
hs_bindgen_de4009388b75ebae =
  BG.fromFFIType hs_bindgen_de4009388b75ebae_base

{-# NOINLINE sDL_AddTimerNS #-}

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
--     [@interval@]: the timer delay, in nanoseconds, passed to @callback@.
--
--     [@callback@]: the 'SDL_TimerCallback' function to call when the specified @interval@ elapses.
--
--     [@userdata@]: a pointer that is passed to @callback@.
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
  :: BG.FunPtr
       (SDL3.Sys.Bindgen.Stdinc.Uint64 -> SDL_NSTimerCallback -> BG.Ptr BG.Void -> IO SDL_TimerID)
sDL_AddTimerNS =
  BG.unsafePerformIO hs_bindgen_de4009388b75ebae

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_RemoveTimer@
foreign import ccall unsafe "hs_bindgen_837b4956d1a9314e"
  hs_bindgen_837b4956d1a9314e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Timer_get_SDL_RemoveTimer@
hs_bindgen_837b4956d1a9314e :: IO (BG.FunPtr (SDL_TimerID -> IO BG.CBool))
hs_bindgen_837b4956d1a9314e =
  BG.fromFFIType hs_bindgen_837b4956d1a9314e_base

{-# NOINLINE sDL_RemoveTimer #-}

-- | Remove a timer created with @SDL_AddTimer()@.
--
--     [@id@]: the ID of the timer to remove.
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
sDL_RemoveTimer :: BG.FunPtr (SDL_TimerID -> IO BG.CBool)
sDL_RemoveTimer =
  BG.unsafePerformIO hs_bindgen_837b4956d1a9314e

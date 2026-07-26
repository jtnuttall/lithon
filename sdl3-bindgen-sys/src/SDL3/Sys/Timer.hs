-- | SDL provides time management functionality. It is useful for dealing with (usually) small durations of time.
--
--     This is not to be confused with /calendar time/ management, which is provided by [CategoryTime](https:\/\/wiki.libsdl.org\/SDL3\/CategoryTime).
--
--     This category covers measuring time elapsed (@'getTicks'@, @'getPerformanceCounter'@), putting a thread to sleep for a certain amount of time (@'delay'@, @'delayNS'@, @'delayPrecise'@), and firing a callback function after a certain amount of time has elapsed (@'addTimer'@, etc).
--
--     There are also useful macros to convert between time units, like @SDL_SECONDS_TO_NS()@ and such. Number of milliseconds in a second.
--
--     This is always 1000.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Timer.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Timer (
  module SDL3.Sys.Bindgen.Timer,

  -- * Function aliases
  SDL3.Sys.Timer.getTicks,
  SDL3.Sys.Timer.getTicksNS,
  SDL3.Sys.Timer.getPerformanceCounter,
  SDL3.Sys.Timer.getPerformanceFrequency,
  SDL3.Sys.Timer.delay,
  SDL3.Sys.Timer.delaySafe,
  SDL3.Sys.Timer.delayNS,
  SDL3.Sys.Timer.delayNSSafe,
  SDL3.Sys.Timer.delayPrecise,
  SDL3.Sys.Timer.delayPreciseSafe,
  SDL3.Sys.Timer.addTimer,
  SDL3.Sys.Timer.addTimerSafe,
  SDL3.Sys.Timer.addTimerNS,
  SDL3.Sys.Timer.addTimerNSSafe,
  SDL3.Sys.Timer.removeTimer,
  SDL3.Sys.Timer.removeTimerSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Timer
import SDL3.Sys.Bindgen.Timer.Safe qualified as Safe
import SDL3.Sys.Bindgen.Timer.Unsafe qualified as Unsafe

-- | Get the number of milliseconds that have elapsed since the SDL library initialization.
--
--     [Returns]: an unsigned 64‑bit integer that represents the number of milliseconds that have elapsed since the SDL library was initialized (typically via a call to SDL_Init).
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTicksNS'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTicks@.
--                   The safe import is not exported
--                   : reads a monotonic clock value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTicks@, defined at @SDL3\/SDL_timer.h 201:36@
getTicks :: IO BG.Word64
getTicks = fmap Coerce.coerce Unsafe.sDL_GetTicks

-- | Get the number of nanoseconds since SDL library initialization.
--
--     [Returns]: an unsigned 64-bit value representing the number of nanoseconds since the SDL library initialized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTicksNS@.
--                   The safe import is not exported
--                   : reads a monotonic clock value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTicksNS@, defined at @SDL3\/SDL_timer.h 213:36@
getTicksNS :: IO BG.Word64
getTicksNS = fmap Coerce.coerce Unsafe.sDL_GetTicksNS

-- | Get the current value of the high resolution counter.
--
--     This function is typically used for profiling.
--
--     The counter values are only meaningful relative to each other. Differences between values can be converted to times by using @'getPerformanceFrequency'@.
--
--     [Returns]: the current counter value.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPerformanceFrequency'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPerformanceCounter@.
--                   The safe import is not exported
--                   : reads a monotonic clock value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetPerformanceCounter@, defined at @SDL3\/SDL_timer.h 232:36@
getPerformanceCounter :: IO BG.Word64
getPerformanceCounter =
  fmap Coerce.coerce Unsafe.sDL_GetPerformanceCounter

-- | Get the count per second of the high resolution counter.
--
--     [Returns]: a platform-specific count per second.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPerformanceCounter'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPerformanceFrequency@.
--                   The safe import is not exported
--                   : reads a monotonic clock value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetPerformanceFrequency@, defined at @SDL3\/SDL_timer.h 245:36@
getPerformanceFrequency :: IO BG.Word64
getPerformanceFrequency =
  fmap Coerce.coerce Unsafe.sDL_GetPerformanceFrequency

-- | Wait a specified number of milliseconds before returning.
--
--     This function waits a specified number of milliseconds before returning. It waits at least the specified time, but possibly longer due to OS scheduling.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'delayNS', 'delayPrecise'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Delay@.
--                   The safe flavor is 'delaySafe'
--                   : sleeps the OS thread; an unsafe call stalls every capability and GC for the duration.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_Delay@, defined at @SDL3\/SDL_timer.h 263:34@
delay
  :: BG.Word32
  -- ^
  --
  --           [@ms@]: the number of milliseconds to delay.
  -> IO ()
delay = \x00 -> Unsafe.sDL_Delay (Coerce.coerce x00)

-- | Wait a specified number of milliseconds before returning.
--
--     This function waits a specified number of milliseconds before returning. It waits at least the specified time, but possibly longer due to OS scheduling.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'delayNS', 'delayPrecise'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Delay@.
--                   The unsafe flavor is 'delay'
--                   : sleeps the OS thread; an unsafe call stalls every capability and GC for the duration.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_Delay@, defined at @SDL3\/SDL_timer.h 263:34@
delaySafe
  :: BG.Word32
  -- ^
  --
  --           [@ms@]: the number of milliseconds to delay.
  -> IO ()
delaySafe =
  \x00 -> Safe.sDL_Delay (Coerce.coerce x00)

-- | Wait a specified number of nanoseconds before returning.
--
--     This function waits a specified number of nanoseconds before returning. It waits at least the specified time, but possibly longer due to OS scheduling.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'delay', 'delayPrecise'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DelayNS@.
--                   The safe flavor is 'delayNSSafe'
--                   : sleeps the OS thread; an unsafe call stalls every capability and GC for the duration.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DelayNS@, defined at @SDL3\/SDL_timer.h 281:34@
delayNS
  :: BG.Word64
  -- ^
  --
  --           [@ns@]: the number of nanoseconds to delay.
  -> IO ()
delayNS =
  \x00 -> Unsafe.sDL_DelayNS (Coerce.coerce x00)

-- | Wait a specified number of nanoseconds before returning.
--
--     This function waits a specified number of nanoseconds before returning. It waits at least the specified time, but possibly longer due to OS scheduling.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'delay', 'delayPrecise'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DelayNS@.
--                   The unsafe flavor is 'delayNS'
--                   : sleeps the OS thread; an unsafe call stalls every capability and GC for the duration.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DelayNS@, defined at @SDL3\/SDL_timer.h 281:34@
delayNSSafe
  :: BG.Word64
  -- ^
  --
  --           [@ns@]: the number of nanoseconds to delay.
  -> IO ()
delayNSSafe =
  \x00 -> Safe.sDL_DelayNS (Coerce.coerce x00)

-- | Wait a specified number of nanoseconds before returning.
--
--     This function waits a specified number of nanoseconds before returning. It will attempt to wait as close to the requested time as possible, busy waiting if necessary, but could return later due to OS scheduling.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'delay', 'delayNS'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DelayPrecise@.
--                   The safe flavor is 'delayPreciseSafe'
--                   : sleeps the OS thread; an unsafe call stalls every capability and GC for the duration.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DelayPrecise@, defined at @SDL3\/SDL_timer.h 299:34@
delayPrecise
  :: BG.Word64
  -- ^
  --
  --           [@ns@]: the number of nanoseconds to delay.
  -> IO ()
delayPrecise =
  \x00 -> Unsafe.sDL_DelayPrecise (Coerce.coerce x00)

-- | Wait a specified number of nanoseconds before returning.
--
--     This function waits a specified number of nanoseconds before returning. It will attempt to wait as close to the requested time as possible, busy waiting if necessary, but could return later due to OS scheduling.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'delay', 'delayNS'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DelayPrecise@.
--                   The unsafe flavor is 'delayPrecise'
--                   : sleeps the OS thread; an unsafe call stalls every capability and GC for the duration.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DelayPrecise@, defined at @SDL3\/SDL_timer.h 299:34@
delayPreciseSafe
  :: BG.Word64
  -- ^
  --
  --           [@ns@]: the number of nanoseconds to delay.
  -> IO ()
delayPreciseSafe =
  \x00 -> Safe.sDL_DelayPrecise (Coerce.coerce x00)

-- | Call a callback function at a future time.
--
--     The callback function is passed the current timer interval and the user supplied parameter from the @'addTimer'@ call and should return the next timer interval. If the value returned from the callback is 0, the timer is canceled and will be removed.
--
--     The callback is run on a separate thread, and for short timeouts can potentially be called before this function returns.
--
--     Timers take into account the amount of time it took to execute the callback. For example, if the callback took 250 ms to execute and returned 1000 (ms), the timer would only wait another 750 ms before its next iteration.
--
--     Timing may be inexact due to OS scheduling. Be sure to note the current time with @'getTicksNS'@ or @'getPerformanceCounter'@ in case your callback needs to adjust for variances.
--
--     [Returns]: a timer ID or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addTimerNS', 'removeTimer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AddTimer@.
--                   The safe flavor is 'addTimerSafe'
--                   : registration; the timer fires on SDL\'s timer thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddTimer@, defined at @SDL3\/SDL_timer.h 368:41@
addTimer
  :: BG.Word32
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
addTimer =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_AddTimer (Coerce.coerce x00) x11 x22

-- | Call a callback function at a future time.
--
--     The callback function is passed the current timer interval and the user supplied parameter from the @'addTimer'@ call and should return the next timer interval. If the value returned from the callback is 0, the timer is canceled and will be removed.
--
--     The callback is run on a separate thread, and for short timeouts can potentially be called before this function returns.
--
--     Timers take into account the amount of time it took to execute the callback. For example, if the callback took 250 ms to execute and returned 1000 (ms), the timer would only wait another 750 ms before its next iteration.
--
--     Timing may be inexact due to OS scheduling. Be sure to note the current time with @'getTicksNS'@ or @'getPerformanceCounter'@ in case your callback needs to adjust for variances.
--
--     [Returns]: a timer ID or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addTimerNS', 'removeTimer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AddTimer@.
--                   The unsafe flavor is 'addTimer'
--                   : registration; the timer fires on SDL\'s timer thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddTimer@, defined at @SDL3\/SDL_timer.h 368:41@
addTimerSafe
  :: BG.Word32
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
addTimerSafe =
  \x00 ->
    \x11 ->
      \x22 -> Safe.sDL_AddTimer (Coerce.coerce x00) x11 x22

-- | Call a callback function at a future time.
--
--     The callback function is passed the current timer interval and the user supplied parameter from the @'addTimerNS'@ call and should return the next timer interval. If the value returned from the callback is 0, the timer is canceled and will be removed.
--
--     The callback is run on a separate thread, and for short timeouts can potentially be called before this function returns.
--
--     Timers take into account the amount of time it took to execute the callback. For example, if the callback took 250 ns to execute and returned 1000 (ns), the timer would only wait another 750 ns before its next iteration.
--
--     Timing may be inexact due to OS scheduling. Be sure to note the current time with @'getTicksNS'@ or @'getPerformanceCounter'@ in case your callback needs to adjust for variances.
--
--     [Returns]: a timer ID or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addTimer', 'removeTimer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AddTimerNS@.
--                   The safe flavor is 'addTimerNSSafe'
--                   : registration; the timer fires on SDL\'s timer thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddTimerNS@, defined at @SDL3\/SDL_timer.h 430:41@
addTimerNS
  :: BG.Word64
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
addTimerNS =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_AddTimerNS (Coerce.coerce x00) x11 x22

-- | Call a callback function at a future time.
--
--     The callback function is passed the current timer interval and the user supplied parameter from the @'addTimerNS'@ call and should return the next timer interval. If the value returned from the callback is 0, the timer is canceled and will be removed.
--
--     The callback is run on a separate thread, and for short timeouts can potentially be called before this function returns.
--
--     Timers take into account the amount of time it took to execute the callback. For example, if the callback took 250 ns to execute and returned 1000 (ns), the timer would only wait another 750 ns before its next iteration.
--
--     Timing may be inexact due to OS scheduling. Be sure to note the current time with @'getTicksNS'@ or @'getPerformanceCounter'@ in case your callback needs to adjust for variances.
--
--     [Returns]: a timer ID or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addTimer', 'removeTimer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AddTimerNS@.
--                   The unsafe flavor is 'addTimerNS'
--                   : registration; the timer fires on SDL\'s timer thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddTimerNS@, defined at @SDL3\/SDL_timer.h 430:41@
addTimerNSSafe
  :: BG.Word64
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
addTimerNSSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.sDL_AddTimerNS (Coerce.coerce x00) x11 x22

-- | Remove a timer created with @'addTimer'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addTimer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RemoveTimer@.
--                   The safe flavor is 'removeTimerSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RemoveTimer@, defined at @SDL3\/SDL_timer.h 445:34@
removeTimer
  :: SDL_TimerID
  -- ^
  --
  --           [@id@]: the ID of the timer to remove.
  -> IO Bool
removeTimer =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_RemoveTimer x00)

-- | Remove a timer created with @'addTimer'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addTimer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RemoveTimer@.
--                   The unsafe flavor is 'removeTimer'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RemoveTimer@, defined at @SDL3\/SDL_timer.h 445:34@
removeTimerSafe
  :: SDL_TimerID
  -- ^
  --
  --           [@id@]: the ID of the timer to remove.
  -> IO Bool
removeTimerSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_RemoveTimer x00)

-- | SDL realtime clock and date\/time routines.
--
--     There are two data types that are used in this category: SDL_Time, which represents the nanoseconds since a specific moment (an \"epoch\"), and 'SDL_DateTime', which breaks time down into human-understandable components: years, months, days, hours, etc.
--
--     Much of the functionality is involved in converting those two types to other useful forms. A structure holding a calendar date and time broken down into its components.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Time.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Time (
  module SDL3.Sys.Bindgen.Time,

  -- * Function aliases
  SDL3.Sys.Time.getDateTimeLocalePreferences,
  SDL3.Sys.Time.getDateTimeLocalePreferencesSafe,
  SDL3.Sys.Time.getCurrentTime,
  SDL3.Sys.Time.getCurrentTimeSafe,
  SDL3.Sys.Time.timeToDateTime,
  SDL3.Sys.Time.timeToDateTimeSafe,
  SDL3.Sys.Time.dateTimeToTime,
  SDL3.Sys.Time.dateTimeToTimeSafe,
  SDL3.Sys.Time.timeToWindows,
  SDL3.Sys.Time.timeToWindowsSafe,
  SDL3.Sys.Time.timeFromWindows,
  SDL3.Sys.Time.timeFromWindowsSafe,
  SDL3.Sys.Time.getDaysInMonth,
  SDL3.Sys.Time.getDaysInMonthSafe,
  SDL3.Sys.Time.getDayOfYear,
  SDL3.Sys.Time.getDayOfYearSafe,
  SDL3.Sys.Time.getDayOfWeek,
  SDL3.Sys.Time.getDayOfWeekSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Time
import SDL3.Sys.Bindgen.Time.Safe qualified as Safe
import SDL3.Sys.Bindgen.Time.Unsafe qualified as Unsafe

-- | Gets the current preferred date and time format for the system locale.
--
--     This might be a \"slow\" call that has to query the operating system. It\'s best to ask for this once and save the results. However, the preferred formats can change, usually because the user has changed a system preference outside of your program.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDateTimeLocalePreferences@.
--                   The safe flavor is 'getDateTimeLocalePreferencesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDateTimeLocalePreferences@, defined at @SDL3\/SDL_time.h 113:34@
getDateTimeLocalePreferences
  :: BG.Ptr SDL_DateFormat
  -- ^
  --
  --           [@dateFormat@]: a pointer to the 'SDL_DateFormat' to hold the returned date format, may be NULL.
  -> BG.Ptr SDL_TimeFormat
  -- ^
  --
  --           [@timeFormat@]: a pointer to the 'SDL_TimeFormat' to hold the returned time format, may be NULL.
  -> IO Bool
getDateTimeLocalePreferences =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetDateTimeLocalePreferences x00 x11)

-- | Gets the current preferred date and time format for the system locale.
--
--     This might be a \"slow\" call that has to query the operating system. It\'s best to ask for this once and save the results. However, the preferred formats can change, usually because the user has changed a system preference outside of your program.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDateTimeLocalePreferences@.
--                   The unsafe flavor is 'getDateTimeLocalePreferences'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDateTimeLocalePreferences@, defined at @SDL3\/SDL_time.h 113:34@
getDateTimeLocalePreferencesSafe
  :: BG.Ptr SDL_DateFormat
  -- ^
  --
  --           [@dateFormat@]: a pointer to the 'SDL_DateFormat' to hold the returned date format, may be NULL.
  -> BG.Ptr SDL_TimeFormat
  -- ^
  --
  --           [@timeFormat@]: a pointer to the 'SDL_TimeFormat' to hold the returned time format, may be NULL.
  -> IO Bool
getDateTimeLocalePreferencesSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetDateTimeLocalePreferences x00 x11)

-- | Gets the current value of the system realtime clock in nanoseconds since Jan 1, 1970 in Universal Coordinated Time (UTC).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCurrentTime@.
--                   The safe flavor is 'getCurrentTimeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetCurrentTime@, defined at @SDL3\/SDL_time.h 127:34@
getCurrentTime
  :: BG.Ptr SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^
  --
  --           [@ticks@]: the SDL_Time to hold the returned tick count.
  -> IO Bool
getCurrentTime =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GetCurrentTime x00)

-- | Gets the current value of the system realtime clock in nanoseconds since Jan 1, 1970 in Universal Coordinated Time (UTC).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCurrentTime@.
--                   The unsafe flavor is 'getCurrentTime'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetCurrentTime@, defined at @SDL3\/SDL_time.h 127:34@
getCurrentTimeSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^
  --
  --           [@ticks@]: the SDL_Time to hold the returned tick count.
  -> IO Bool
getCurrentTimeSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GetCurrentTime x00)

-- | Converts an SDL_Time in nanoseconds since the epoch to a calendar time in the 'SDL_DateTime' format.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_TimeToDateTime@.
--                   The safe flavor is 'timeToDateTimeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TimeToDateTime@, defined at @SDL3\/SDL_time.h 145:34@
timeToDateTime
  :: SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^
  --
  --           [@ticks@]: the SDL_Time to be converted.
  -> BG.Ptr SDL_DateTime
  -- ^
  --
  --           [@dt@]: the resulting 'SDL_DateTime'.
  -> Bool
  -- ^
  --
  --           [@localTime@]: the resulting 'SDL_DateTime' will be expressed in local time if true, otherwise it will be in Universal Coordinated Time (UTC).
  -> IO Bool
timeToDateTime =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_TimeToDateTime x00 x11 (CBool.fromBool x22))

-- | Converts an SDL_Time in nanoseconds since the epoch to a calendar time in the 'SDL_DateTime' format.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_TimeToDateTime@.
--                   The unsafe flavor is 'timeToDateTime'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TimeToDateTime@, defined at @SDL3\/SDL_time.h 145:34@
timeToDateTimeSafe
  :: SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^
  --
  --           [@ticks@]: the SDL_Time to be converted.
  -> BG.Ptr SDL_DateTime
  -- ^
  --
  --           [@dt@]: the resulting 'SDL_DateTime'.
  -> Bool
  -- ^
  --
  --           [@localTime@]: the resulting 'SDL_DateTime' will be expressed in local time if true, otherwise it will be in Universal Coordinated Time (UTC).
  -> IO Bool
timeToDateTimeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_TimeToDateTime x00 x11 (CBool.fromBool x22))

-- | Converts a calendar time to an SDL_Time in nanoseconds since the epoch.
--
--     This function ignores the day_of_week member of the 'SDL_DateTime' struct, so it may remain unset.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DateTimeToTime@.
--                   The safe flavor is 'dateTimeToTimeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DateTimeToTime@, defined at @SDL3\/SDL_time.h 162:34@
dateTimeToTime
  :: PtrConst.PtrConst SDL_DateTime
  -- ^
  --
  --           [@dt@]: the source 'SDL_DateTime'.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^
  --
  --           [@ticks@]: the resulting SDL_Time.
  -> IO Bool
dateTimeToTime =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_DateTimeToTime x00 x11)

-- | Converts a calendar time to an SDL_Time in nanoseconds since the epoch.
--
--     This function ignores the day_of_week member of the 'SDL_DateTime' struct, so it may remain unset.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DateTimeToTime@.
--                   The unsafe flavor is 'dateTimeToTime'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DateTimeToTime@, defined at @SDL3\/SDL_time.h 162:34@
dateTimeToTimeSafe
  :: PtrConst.PtrConst SDL_DateTime
  -- ^
  --
  --           [@dt@]: the source 'SDL_DateTime'.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^
  --
  --           [@ticks@]: the resulting SDL_Time.
  -> IO Bool
dateTimeToTimeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_DateTimeToTime x00 x11)

-- | Converts an SDL time into a Windows FILETIME (100-nanosecond intervals since January 1, 1601).
--
--     This function fills in the two 32-bit values of the FILETIME structure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_TimeToWindows@.
--                   The safe flavor is 'timeToWindowsSafe'
--                   .
--
--     [C declaration]: @SDL_TimeToWindows@, defined at @SDL3\/SDL_time.h 180:34@
timeToWindows
  :: SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^
  --
  --           [@ticks@]: the time to convert.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@dwLowDateTime@]: a pointer filled in with the low portion of the Windows FILETIME value.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@dwHighDateTime@]: a pointer filled in with the high portion of the Windows FILETIME value.
  -> IO ()
timeToWindows = Unsafe.sDL_TimeToWindows

-- | Converts an SDL time into a Windows FILETIME (100-nanosecond intervals since January 1, 1601).
--
--     This function fills in the two 32-bit values of the FILETIME structure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_TimeToWindows@.
--                   The unsafe flavor is 'timeToWindows'
--                   .
--
--     [C declaration]: @SDL_TimeToWindows@, defined at @SDL3\/SDL_time.h 180:34@
timeToWindowsSafe
  :: SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^
  --
  --           [@ticks@]: the time to convert.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@dwLowDateTime@]: a pointer filled in with the low portion of the Windows FILETIME value.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@dwHighDateTime@]: a pointer filled in with the high portion of the Windows FILETIME value.
  -> IO ()
timeToWindowsSafe = Safe.sDL_TimeToWindows

-- | Converts a Windows FILETIME (100-nanosecond intervals since January 1, 1601) to an SDL time.
--
--     This function takes the two 32-bit values of the FILETIME structure as parameters.
--
--     [Returns]: the converted SDL time.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_TimeFromWindows@.
--                   The safe flavor is 'timeFromWindowsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TimeFromWindows@, defined at @SDL3\/SDL_time.h 197:38@
timeFromWindows
  :: BG.Word32
  -- ^
  --
  --           [@dwLowDateTime@]: the low portion of the Windows FILETIME value.
  -> BG.Word32
  -- ^
  --
  --           [@dwHighDateTime@]: the high portion of the Windows FILETIME value.
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_Time
timeFromWindows =
  \x00 ->
    \x11 ->
      Unsafe.sDL_TimeFromWindows (Coerce.coerce x00) (Coerce.coerce x11)

-- | Converts a Windows FILETIME (100-nanosecond intervals since January 1, 1601) to an SDL time.
--
--     This function takes the two 32-bit values of the FILETIME structure as parameters.
--
--     [Returns]: the converted SDL time.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_TimeFromWindows@.
--                   The unsafe flavor is 'timeFromWindows'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TimeFromWindows@, defined at @SDL3\/SDL_time.h 197:38@
timeFromWindowsSafe
  :: BG.Word32
  -- ^
  --
  --           [@dwLowDateTime@]: the low portion of the Windows FILETIME value.
  -> BG.Word32
  -- ^
  --
  --           [@dwHighDateTime@]: the high portion of the Windows FILETIME value.
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_Time
timeFromWindowsSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_TimeFromWindows (Coerce.coerce x00) (Coerce.coerce x11)

-- | Get the number of days in a month for a given year.
--
--     [Returns]: the number of days in the requested month or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDaysInMonth@.
--                   The safe flavor is 'getDaysInMonthSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDaysInMonth@, defined at @SDL3\/SDL_time.h 211:33@
getDaysInMonth
  :: BG.Int32
  -- ^
  --
  --           [@year@]: the year.
  -> BG.Int32
  -- ^
  --
  --           [@month@]: the month [1-12].
  -> IO BG.Int32
getDaysInMonth =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_GetDaysInMonth (Coerce.coerce x00) (Coerce.coerce x11))

-- | Get the number of days in a month for a given year.
--
--     [Returns]: the number of days in the requested month or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDaysInMonth@.
--                   The unsafe flavor is 'getDaysInMonth'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDaysInMonth@, defined at @SDL3\/SDL_time.h 211:33@
getDaysInMonthSafe
  :: BG.Int32
  -- ^
  --
  --           [@year@]: the year.
  -> BG.Int32
  -- ^
  --
  --           [@month@]: the month [1-12].
  -> IO BG.Int32
getDaysInMonthSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_GetDaysInMonth (Coerce.coerce x00) (Coerce.coerce x11))

-- | Get the day of year for a calendar date.
--
--     [Returns]: the day of year [0-365] if the date is valid or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDayOfYear@.
--                   The safe flavor is 'getDayOfYearSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDayOfYear@, defined at @SDL3\/SDL_time.h 226:33@
getDayOfYear
  :: BG.Int32
  -- ^
  --
  --           [@year@]: the year component of the date.
  -> BG.Int32
  -- ^
  --
  --           [@month@]: the month component of the date.
  -> BG.Int32
  -- ^
  --
  --           [@day@]: the day component of the date.
  -> IO BG.Int32
getDayOfYear =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap
          Coerce.coerce
          (Unsafe.sDL_GetDayOfYear (Coerce.coerce x00) (Coerce.coerce x11) (Coerce.coerce x22))

-- | Get the day of year for a calendar date.
--
--     [Returns]: the day of year [0-365] if the date is valid or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDayOfYear@.
--                   The unsafe flavor is 'getDayOfYear'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDayOfYear@, defined at @SDL3\/SDL_time.h 226:33@
getDayOfYearSafe
  :: BG.Int32
  -- ^
  --
  --           [@year@]: the year component of the date.
  -> BG.Int32
  -- ^
  --
  --           [@month@]: the month component of the date.
  -> BG.Int32
  -- ^
  --
  --           [@day@]: the day component of the date.
  -> IO BG.Int32
getDayOfYearSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap
          Coerce.coerce
          (Safe.sDL_GetDayOfYear (Coerce.coerce x00) (Coerce.coerce x11) (Coerce.coerce x22))

-- | Get the day of week for a calendar date.
--
--     [Returns]: a value between 0 and 6 (0 being Sunday) if the date is valid or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDayOfWeek@.
--                   The safe flavor is 'getDayOfWeekSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDayOfWeek@, defined at @SDL3\/SDL_time.h 241:33@
getDayOfWeek
  :: BG.Int32
  -- ^
  --
  --           [@year@]: the year component of the date.
  -> BG.Int32
  -- ^
  --
  --           [@month@]: the month component of the date.
  -> BG.Int32
  -- ^
  --
  --           [@day@]: the day component of the date.
  -> IO BG.Int32
getDayOfWeek =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap
          Coerce.coerce
          (Unsafe.sDL_GetDayOfWeek (Coerce.coerce x00) (Coerce.coerce x11) (Coerce.coerce x22))

-- | Get the day of week for a calendar date.
--
--     [Returns]: a value between 0 and 6 (0 being Sunday) if the date is valid or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDayOfWeek@.
--                   The unsafe flavor is 'getDayOfWeek'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDayOfWeek@, defined at @SDL3\/SDL_time.h 241:33@
getDayOfWeekSafe
  :: BG.Int32
  -- ^
  --
  --           [@year@]: the year component of the date.
  -> BG.Int32
  -- ^
  --
  --           [@month@]: the month component of the date.
  -> BG.Int32
  -- ^
  --
  --           [@day@]: the day component of the date.
  -> IO BG.Int32
getDayOfWeekSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap
          Coerce.coerce
          (Safe.sDL_GetDayOfWeek (Coerce.coerce x00) (Coerce.coerce x11) (Coerce.coerce x22))

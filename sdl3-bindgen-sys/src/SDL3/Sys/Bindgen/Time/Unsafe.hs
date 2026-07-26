{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Time.Unsafe (
  SDL3.Sys.Bindgen.Time.Unsafe.sDL_GetDateTimeLocalePreferences,
  SDL3.Sys.Bindgen.Time.Unsafe.sDL_GetCurrentTime,
  SDL3.Sys.Bindgen.Time.Unsafe.sDL_TimeToDateTime,
  SDL3.Sys.Bindgen.Time.Unsafe.sDL_DateTimeToTime,
  SDL3.Sys.Bindgen.Time.Unsafe.sDL_TimeToWindows,
  SDL3.Sys.Bindgen.Time.Unsafe.sDL_TimeFromWindows,
  SDL3.Sys.Bindgen.Time.Unsafe.sDL_GetDaysInMonth,
  SDL3.Sys.Bindgen.Time.Unsafe.sDL_GetDayOfYear,
  SDL3.Sys.Bindgen.Time.Unsafe.sDL_GetDayOfWeek,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Time

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_time.h>"
         , "_Bool hs_bindgen_3432fa094bde3d31 ("
         , "  SDL_DateFormat *arg1,"
         , "  SDL_TimeFormat *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetDateTimeLocalePreferences)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_8783e8faf159e5f6 ("
         , "  SDL_Time *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetCurrentTime)(arg1);"
         , "}"
         , "_Bool hs_bindgen_fd32d59b7aff0779 ("
         , "  SDL_Time arg1,"
         , "  SDL_DateTime *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return (SDL_TimeToDateTime)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_f67b5047c1f40868 ("
         , "  SDL_DateTime const *arg1,"
         , "  SDL_Time *arg2"
         , ")"
         , "{"
         , "  return (SDL_DateTimeToTime)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_073c7d3a9fd7c54d ("
         , "  SDL_Time arg1,"
         , "  Uint32 *arg2,"
         , "  Uint32 *arg3"
         , ")"
         , "{"
         , "  (SDL_TimeToWindows)(arg1, arg2, arg3);"
         , "}"
         , "SDL_Time hs_bindgen_450903725dfdb0ee ("
         , "  Uint32 arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return (SDL_TimeFromWindows)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_81cc8f2d17acfd75 ("
         , "  signed int arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_GetDaysInMonth)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_02c2e878757c0925 ("
         , "  signed int arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_GetDayOfYear)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_9583fd9571c78f9c ("
         , "  signed int arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_GetDayOfWeek)(arg1, arg2, arg3);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_GetDateTimeLocalePreferences@
foreign import ccall unsafe "hs_bindgen_3432fa094bde3d31"
  hs_bindgen_3432fa094bde3d31_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_GetDateTimeLocalePreferences@
hs_bindgen_3432fa094bde3d31
  :: BG.Ptr SDL_DateFormat
  -> BG.Ptr SDL_TimeFormat
  -> IO BG.CBool
hs_bindgen_3432fa094bde3d31 =
  BG.fromFFIType hs_bindgen_3432fa094bde3d31_base

-- | Gets the current preferred date and time format for the system locale.
--
--     This might be a \"slow\" call that has to query the operating system. It\'s best to ask for this once and save the results. However, the preferred formats can change, usually because the user has changed a system preference outside of your program.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDateTimeLocalePreferences@, defined at @SDL3\/SDL_time.h 113:34@
sDL_GetDateTimeLocalePreferences
  :: BG.Ptr SDL_DateFormat
  -- ^
  --
  --           [@dateFormat@]: a pointer to the 'SDL_DateFormat' to hold the returned date format, may be NULL.
  -> BG.Ptr SDL_TimeFormat
  -- ^
  --
  --           [@timeFormat@]: a pointer to the 'SDL_TimeFormat' to hold the returned time format, may be NULL.
  -> IO BG.CBool
sDL_GetDateTimeLocalePreferences =
  hs_bindgen_3432fa094bde3d31

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_GetCurrentTime@
foreign import ccall unsafe "hs_bindgen_8783e8faf159e5f6"
  hs_bindgen_8783e8faf159e5f6_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_GetCurrentTime@
hs_bindgen_8783e8faf159e5f6
  :: BG.Ptr SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -> IO BG.CBool
hs_bindgen_8783e8faf159e5f6 =
  BG.fromFFIType hs_bindgen_8783e8faf159e5f6_base

-- | Gets the current value of the system realtime clock in nanoseconds since Jan 1, 1970 in Universal Coordinated Time (UTC).
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetCurrentTime@, defined at @SDL3\/SDL_time.h 127:34@
sDL_GetCurrentTime
  :: BG.Ptr SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^
  --
  --           [@ticks@]: the SDL_Time to hold the returned tick count.
  -> IO BG.CBool
sDL_GetCurrentTime = hs_bindgen_8783e8faf159e5f6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_TimeToDateTime@
foreign import ccall unsafe "hs_bindgen_fd32d59b7aff0779"
  hs_bindgen_fd32d59b7aff0779_base
    :: BG.Int64
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_TimeToDateTime@
hs_bindgen_fd32d59b7aff0779
  :: SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -> BG.Ptr SDL_DateTime
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_fd32d59b7aff0779 =
  BG.fromFFIType hs_bindgen_fd32d59b7aff0779_base

-- | Converts an SDL_Time in nanoseconds since the epoch to a calendar time in the 'SDL_DateTime' format.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_TimeToDateTime@, defined at @SDL3\/SDL_time.h 145:34@
sDL_TimeToDateTime
  :: SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^
  --
  --           [@ticks@]: the SDL_Time to be converted.
  -> BG.Ptr SDL_DateTime
  -- ^
  --
  --           [@dt@]: the resulting 'SDL_DateTime'.
  -> BG.CBool
  -- ^
  --
  --           [@localTime@]: the resulting 'SDL_DateTime' will be expressed in local time if true, otherwise it will be in Universal Coordinated Time (UTC).
  -> IO BG.CBool
sDL_TimeToDateTime = hs_bindgen_fd32d59b7aff0779

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_DateTimeToTime@
foreign import ccall unsafe "hs_bindgen_f67b5047c1f40868"
  hs_bindgen_f67b5047c1f40868_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_DateTimeToTime@
hs_bindgen_f67b5047c1f40868
  :: PtrConst.PtrConst SDL_DateTime
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -> IO BG.CBool
hs_bindgen_f67b5047c1f40868 =
  BG.fromFFIType hs_bindgen_f67b5047c1f40868_base

-- | Converts a calendar time to an SDL_Time in nanoseconds since the epoch.
--
--     This function ignores the day_of_week member of the 'SDL_DateTime' struct, so it may remain unset.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DateTimeToTime@, defined at @SDL3\/SDL_time.h 162:34@
sDL_DateTimeToTime
  :: PtrConst.PtrConst SDL_DateTime
  -- ^
  --
  --           [@dt@]: the source 'SDL_DateTime'.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^
  --
  --           [@ticks@]: the resulting SDL_Time.
  -> IO BG.CBool
sDL_DateTimeToTime = hs_bindgen_f67b5047c1f40868

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_TimeToWindows@
foreign import ccall unsafe "hs_bindgen_073c7d3a9fd7c54d"
  hs_bindgen_073c7d3a9fd7c54d_base
    :: BG.Int64
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_TimeToWindows@
hs_bindgen_073c7d3a9fd7c54d
  :: SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_073c7d3a9fd7c54d =
  BG.fromFFIType hs_bindgen_073c7d3a9fd7c54d_base

-- | Converts an SDL time into a Windows FILETIME (100-nanosecond intervals since January 1, 1601).
--
--     This function fills in the two 32-bit values of the FILETIME structure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_TimeToWindows@, defined at @SDL3\/SDL_time.h 180:34@
sDL_TimeToWindows
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
sDL_TimeToWindows = hs_bindgen_073c7d3a9fd7c54d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_TimeFromWindows@
foreign import ccall unsafe "hs_bindgen_450903725dfdb0ee"
  hs_bindgen_450903725dfdb0ee_base
    :: BG.Word32
    -> BG.Word32
    -> IO BG.Int64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_TimeFromWindows@
hs_bindgen_450903725dfdb0ee
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_Time
hs_bindgen_450903725dfdb0ee =
  BG.fromFFIType hs_bindgen_450903725dfdb0ee_base

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
--     [C declaration]: @SDL_TimeFromWindows@, defined at @SDL3\/SDL_time.h 197:38@
sDL_TimeFromWindows
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@dwLowDateTime@]: the low portion of the Windows FILETIME value.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@dwHighDateTime@]: the high portion of the Windows FILETIME value.
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_Time
sDL_TimeFromWindows = hs_bindgen_450903725dfdb0ee

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_GetDaysInMonth@
foreign import ccall unsafe "hs_bindgen_81cc8f2d17acfd75"
  hs_bindgen_81cc8f2d17acfd75_base
    :: BG.Int32
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_GetDaysInMonth@
hs_bindgen_81cc8f2d17acfd75
  :: BG.CInt
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_81cc8f2d17acfd75 =
  BG.fromFFIType hs_bindgen_81cc8f2d17acfd75_base

-- | Get the number of days in a month for a given year.
--
--     [Returns]: the number of days in the requested month or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDaysInMonth@, defined at @SDL3\/SDL_time.h 211:33@
sDL_GetDaysInMonth
  :: BG.CInt
  -- ^
  --
  --           [@year@]: the year.
  -> BG.CInt
  -- ^
  --
  --           [@month@]: the month [1-12].
  -> IO BG.CInt
sDL_GetDaysInMonth = hs_bindgen_81cc8f2d17acfd75

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_GetDayOfYear@
foreign import ccall unsafe "hs_bindgen_02c2e878757c0925"
  hs_bindgen_02c2e878757c0925_base
    :: BG.Int32
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_GetDayOfYear@
hs_bindgen_02c2e878757c0925
  :: BG.CInt
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_02c2e878757c0925 =
  BG.fromFFIType hs_bindgen_02c2e878757c0925_base

-- | Get the day of year for a calendar date.
--
--     [Returns]: the day of year [0-365] if the date is valid or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDayOfYear@, defined at @SDL3\/SDL_time.h 226:33@
sDL_GetDayOfYear
  :: BG.CInt
  -- ^
  --
  --           [@year@]: the year component of the date.
  -> BG.CInt
  -- ^
  --
  --           [@month@]: the month component of the date.
  -> BG.CInt
  -- ^
  --
  --           [@day@]: the day component of the date.
  -> IO BG.CInt
sDL_GetDayOfYear = hs_bindgen_02c2e878757c0925

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_GetDayOfWeek@
foreign import ccall unsafe "hs_bindgen_9583fd9571c78f9c"
  hs_bindgen_9583fd9571c78f9c_base
    :: BG.Int32
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_Unsafe_SDL_GetDayOfWeek@
hs_bindgen_9583fd9571c78f9c
  :: BG.CInt
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_9583fd9571c78f9c =
  BG.fromFFIType hs_bindgen_9583fd9571c78f9c_base

-- | Get the day of week for a calendar date.
--
--     [Returns]: a value between 0 and 6 (0 being Sunday) if the date is valid or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDayOfWeek@, defined at @SDL3\/SDL_time.h 241:33@
sDL_GetDayOfWeek
  :: BG.CInt
  -- ^
  --
  --           [@year@]: the year component of the date.
  -> BG.CInt
  -- ^
  --
  --           [@month@]: the month component of the date.
  -> BG.CInt
  -- ^
  --
  --           [@day@]: the day component of the date.
  -> IO BG.CInt
sDL_GetDayOfWeek = hs_bindgen_9583fd9571c78f9c

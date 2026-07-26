{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Time.FunPtr (
  SDL3.Sys.Bindgen.Time.FunPtr.sDL_GetDateTimeLocalePreferences,
  SDL3.Sys.Bindgen.Time.FunPtr.sDL_GetCurrentTime,
  SDL3.Sys.Bindgen.Time.FunPtr.sDL_TimeToDateTime,
  SDL3.Sys.Bindgen.Time.FunPtr.sDL_DateTimeToTime,
  SDL3.Sys.Bindgen.Time.FunPtr.sDL_TimeToWindows,
  SDL3.Sys.Bindgen.Time.FunPtr.sDL_TimeFromWindows,
  SDL3.Sys.Bindgen.Time.FunPtr.sDL_GetDaysInMonth,
  SDL3.Sys.Bindgen.Time.FunPtr.sDL_GetDayOfYear,
  SDL3.Sys.Bindgen.Time.FunPtr.sDL_GetDayOfWeek,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetDateTimeLocalePreferences */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_652b921a3c9bf987 (void)) ("
         , "  SDL_DateFormat *arg1,"
         , "  SDL_TimeFormat *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetDateTimeLocalePreferences;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetCurrentTime */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2e0928febd227948 (void)) ("
         , "  SDL_Time *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetCurrentTime;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_TimeToDateTime */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ccc14802da98ebc1 (void)) ("
         , "  SDL_Time arg1,"
         , "  SDL_DateTime *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return &SDL_TimeToDateTime;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_DateTimeToTime */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6a3b281635772606 (void)) ("
         , "  SDL_DateTime const *arg1,"
         , "  SDL_Time *arg2"
         , ")"
         , "{"
         , "  return &SDL_DateTimeToTime;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_TimeToWindows */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_06ec16aebabe56e2 (void)) ("
         , "  SDL_Time arg1,"
         , "  Uint32 *arg2,"
         , "  Uint32 *arg3"
         , ")"
         , "{"
         , "  return &SDL_TimeToWindows;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_TimeFromWindows */"
         , "__attribute__ ((const))"
         , "SDL_Time (*hs_bindgen_c98ae78917a45694 (void)) ("
         , "  Uint32 arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return &SDL_TimeFromWindows;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetDaysInMonth */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_53993d062e70ae21 (void)) ("
         , "  signed int arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_GetDaysInMonth;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetDayOfYear */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_040f71197ea113df (void)) ("
         , "  signed int arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_GetDayOfYear;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetDayOfWeek */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_6d1532a314d875ae (void)) ("
         , "  signed int arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_GetDayOfWeek;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetDateTimeLocalePreferences@
foreign import ccall unsafe "hs_bindgen_652b921a3c9bf987"
  hs_bindgen_652b921a3c9bf987_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetDateTimeLocalePreferences@
hs_bindgen_652b921a3c9bf987
  :: IO (BG.FunPtr (BG.Ptr SDL_DateFormat -> BG.Ptr SDL_TimeFormat -> IO BG.CBool))
hs_bindgen_652b921a3c9bf987 =
  BG.fromFFIType hs_bindgen_652b921a3c9bf987_base

{-# NOINLINE sDL_GetDateTimeLocalePreferences #-}

-- | Gets the current preferred date and time format for the system locale.
--
--     This might be a \"slow\" call that has to query the operating system. It\'s best to ask for this once and save the results. However, the preferred formats can change, usually because the user has changed a system preference outside of your program.
--
--     [@dateFormat@]: a pointer to the 'SDL_DateFormat' to hold the returned date format, may be NULL.
--
--     [@timeFormat@]: a pointer to the 'SDL_TimeFormat' to hold the returned time format, may be NULL.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDateTimeLocalePreferences@, defined at @SDL3\/SDL_time.h 113:34@
sDL_GetDateTimeLocalePreferences
  :: BG.FunPtr (BG.Ptr SDL_DateFormat -> BG.Ptr SDL_TimeFormat -> IO BG.CBool)
sDL_GetDateTimeLocalePreferences =
  BG.unsafePerformIO hs_bindgen_652b921a3c9bf987

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetCurrentTime@
foreign import ccall unsafe "hs_bindgen_2e0928febd227948"
  hs_bindgen_2e0928febd227948_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetCurrentTime@
hs_bindgen_2e0928febd227948
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.SDL_Time -> IO BG.CBool))
hs_bindgen_2e0928febd227948 =
  BG.fromFFIType hs_bindgen_2e0928febd227948_base

{-# NOINLINE sDL_GetCurrentTime #-}

-- | Gets the current value of the system realtime clock in nanoseconds since Jan 1, 1970 in Universal Coordinated Time (UTC).
--
--     [@ticks@]: the SDL_Time to hold the returned tick count.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetCurrentTime@, defined at @SDL3\/SDL_time.h 127:34@
sDL_GetCurrentTime :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.SDL_Time -> IO BG.CBool)
sDL_GetCurrentTime =
  BG.unsafePerformIO hs_bindgen_2e0928febd227948

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_TimeToDateTime@
foreign import ccall unsafe "hs_bindgen_ccc14802da98ebc1"
  hs_bindgen_ccc14802da98ebc1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_TimeToDateTime@
hs_bindgen_ccc14802da98ebc1
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.SDL_Time -> BG.Ptr SDL_DateTime -> BG.CBool -> IO BG.CBool))
hs_bindgen_ccc14802da98ebc1 =
  BG.fromFFIType hs_bindgen_ccc14802da98ebc1_base

{-# NOINLINE sDL_TimeToDateTime #-}

-- | Converts an SDL_Time in nanoseconds since the epoch to a calendar time in the 'SDL_DateTime' format.
--
--     [@ticks@]: the SDL_Time to be converted.
--
--     [@dt@]: the resulting 'SDL_DateTime'.
--
--     [@localTime@]: the resulting 'SDL_DateTime' will be expressed in local time if true, otherwise it will be in Universal Coordinated Time (UTC).
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_TimeToDateTime@, defined at @SDL3\/SDL_time.h 145:34@
sDL_TimeToDateTime
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.SDL_Time -> BG.Ptr SDL_DateTime -> BG.CBool -> IO BG.CBool)
sDL_TimeToDateTime =
  BG.unsafePerformIO hs_bindgen_ccc14802da98ebc1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_DateTimeToTime@
foreign import ccall unsafe "hs_bindgen_6a3b281635772606"
  hs_bindgen_6a3b281635772606_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_DateTimeToTime@
hs_bindgen_6a3b281635772606
  :: IO
       (BG.FunPtr (PtrConst.PtrConst SDL_DateTime -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.SDL_Time -> IO BG.CBool))
hs_bindgen_6a3b281635772606 =
  BG.fromFFIType hs_bindgen_6a3b281635772606_base

{-# NOINLINE sDL_DateTimeToTime #-}

-- | Converts a calendar time to an SDL_Time in nanoseconds since the epoch.
--
--     This function ignores the day_of_week member of the 'SDL_DateTime' struct, so it may remain unset.
--
--     [@dt@]: the source 'SDL_DateTime'.
--
--     [@ticks@]: the resulting SDL_Time.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DateTimeToTime@, defined at @SDL3\/SDL_time.h 162:34@
sDL_DateTimeToTime
  :: BG.FunPtr (PtrConst.PtrConst SDL_DateTime -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.SDL_Time -> IO BG.CBool)
sDL_DateTimeToTime =
  BG.unsafePerformIO hs_bindgen_6a3b281635772606

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_TimeToWindows@
foreign import ccall unsafe "hs_bindgen_06ec16aebabe56e2"
  hs_bindgen_06ec16aebabe56e2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_TimeToWindows@
hs_bindgen_06ec16aebabe56e2
  :: IO
       ( BG.FunPtr
           ( SDL3.Sys.Bindgen.Stdinc.SDL_Time
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_06ec16aebabe56e2 =
  BG.fromFFIType hs_bindgen_06ec16aebabe56e2_base

{-# NOINLINE sDL_TimeToWindows #-}

-- | Converts an SDL time into a Windows FILETIME (100-nanosecond intervals since January 1, 1601).
--
--     This function fills in the two 32-bit values of the FILETIME structure.
--
--     [@ticks@]: the time to convert.
--
--     [@dwLowDateTime@]: a pointer filled in with the low portion of the Windows FILETIME value.
--
--     [@dwHighDateTime@]: a pointer filled in with the high portion of the Windows FILETIME value.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_TimeToWindows@, defined at @SDL3\/SDL_time.h 180:34@
sDL_TimeToWindows
  :: BG.FunPtr
       ( SDL3.Sys.Bindgen.Stdinc.SDL_Time
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_TimeToWindows =
  BG.unsafePerformIO hs_bindgen_06ec16aebabe56e2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_TimeFromWindows@
foreign import ccall unsafe "hs_bindgen_c98ae78917a45694"
  hs_bindgen_c98ae78917a45694_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_TimeFromWindows@
hs_bindgen_c98ae78917a45694
  :: IO
       ( BG.FunPtr
           ( SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO SDL3.Sys.Bindgen.Stdinc.SDL_Time
           )
       )
hs_bindgen_c98ae78917a45694 =
  BG.fromFFIType hs_bindgen_c98ae78917a45694_base

{-# NOINLINE sDL_TimeFromWindows #-}

-- | Converts a Windows FILETIME (100-nanosecond intervals since January 1, 1601) to an SDL time.
--
--     This function takes the two 32-bit values of the FILETIME structure as parameters.
--
--     [@dwLowDateTime@]: the low portion of the Windows FILETIME value.
--
--     [@dwHighDateTime@]: the high portion of the Windows FILETIME value.
--
--     [Returns]: the converted SDL time.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_TimeFromWindows@, defined at @SDL3\/SDL_time.h 197:38@
sDL_TimeFromWindows
  :: BG.FunPtr
       ( SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO SDL3.Sys.Bindgen.Stdinc.SDL_Time
       )
sDL_TimeFromWindows =
  BG.unsafePerformIO hs_bindgen_c98ae78917a45694

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetDaysInMonth@
foreign import ccall unsafe "hs_bindgen_53993d062e70ae21"
  hs_bindgen_53993d062e70ae21_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetDaysInMonth@
hs_bindgen_53993d062e70ae21 :: IO (BG.FunPtr (BG.CInt -> BG.CInt -> IO BG.CInt))
hs_bindgen_53993d062e70ae21 =
  BG.fromFFIType hs_bindgen_53993d062e70ae21_base

{-# NOINLINE sDL_GetDaysInMonth #-}

-- | Get the number of days in a month for a given year.
--
--     [@year@]: the year.
--
--     [@month@]: the month [1-12].
--
--     [Returns]: the number of days in the requested month or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDaysInMonth@, defined at @SDL3\/SDL_time.h 211:33@
sDL_GetDaysInMonth :: BG.FunPtr (BG.CInt -> BG.CInt -> IO BG.CInt)
sDL_GetDaysInMonth =
  BG.unsafePerformIO hs_bindgen_53993d062e70ae21

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetDayOfYear@
foreign import ccall unsafe "hs_bindgen_040f71197ea113df"
  hs_bindgen_040f71197ea113df_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetDayOfYear@
hs_bindgen_040f71197ea113df :: IO (BG.FunPtr (BG.CInt -> BG.CInt -> BG.CInt -> IO BG.CInt))
hs_bindgen_040f71197ea113df =
  BG.fromFFIType hs_bindgen_040f71197ea113df_base

{-# NOINLINE sDL_GetDayOfYear #-}

-- | Get the day of year for a calendar date.
--
--     [@year@]: the year component of the date.
--
--     [@month@]: the month component of the date.
--
--     [@day@]: the day component of the date.
--
--     [Returns]: the day of year [0-365] if the date is valid or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDayOfYear@, defined at @SDL3\/SDL_time.h 226:33@
sDL_GetDayOfYear :: BG.FunPtr (BG.CInt -> BG.CInt -> BG.CInt -> IO BG.CInt)
sDL_GetDayOfYear =
  BG.unsafePerformIO hs_bindgen_040f71197ea113df

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetDayOfWeek@
foreign import ccall unsafe "hs_bindgen_6d1532a314d875ae"
  hs_bindgen_6d1532a314d875ae_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Time_get_SDL_GetDayOfWeek@
hs_bindgen_6d1532a314d875ae :: IO (BG.FunPtr (BG.CInt -> BG.CInt -> BG.CInt -> IO BG.CInt))
hs_bindgen_6d1532a314d875ae =
  BG.fromFFIType hs_bindgen_6d1532a314d875ae_base

{-# NOINLINE sDL_GetDayOfWeek #-}

-- | Get the day of week for a calendar date.
--
--     [@year@]: the year component of the date.
--
--     [@month@]: the month component of the date.
--
--     [@day@]: the day component of the date.
--
--     [Returns]: a value between 0 and 6 (0 being Sunday) if the date is valid or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDayOfWeek@, defined at @SDL3\/SDL_time.h 241:33@
sDL_GetDayOfWeek :: BG.FunPtr (BG.CInt -> BG.CInt -> BG.CInt -> IO BG.CInt)
sDL_GetDayOfWeek =
  BG.unsafePerformIO hs_bindgen_6d1532a314d875ae

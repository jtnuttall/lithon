{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Log.FunPtr (
  SDL3.Sys.Bindgen.Log.FunPtr.sDL_SetLogPriorities,
  SDL3.Sys.Bindgen.Log.FunPtr.sDL_SetLogPriority,
  SDL3.Sys.Bindgen.Log.FunPtr.sDL_GetLogPriority,
  SDL3.Sys.Bindgen.Log.FunPtr.sDL_ResetLogPriorities,
  SDL3.Sys.Bindgen.Log.FunPtr.sDL_SetLogPriorityPrefix,
  SDL3.Sys.Bindgen.Log.FunPtr.sDL_GetDefaultLogOutputFunction,
  SDL3.Sys.Bindgen.Log.FunPtr.sDL_GetLogOutputFunction,
  SDL3.Sys.Bindgen.Log.FunPtr.sDL_SetLogOutputFunction,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Log

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_log.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_SetLogPriorities */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_53f49172bb06fac5 (void)) ("
         , "  SDL_LogPriority arg1"
         , ")"
         , "{"
         , "  return &SDL_SetLogPriorities;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_SetLogPriority */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_efaec8fe88879163 (void)) ("
         , "  signed int arg1,"
         , "  SDL_LogPriority arg2"
         , ")"
         , "{"
         , "  return &SDL_SetLogPriority;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_GetLogPriority */"
         , "__attribute__ ((const))"
         , "SDL_LogPriority (*hs_bindgen_0a5edd280b63c817 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_GetLogPriority;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_ResetLogPriorities */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_a50e52f5fe769c57 (void)) (void)"
         , "{"
         , "  return &SDL_ResetLogPriorities;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_SetLogPriorityPrefix */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_69bb7de79ceb0d36 (void)) ("
         , "  SDL_LogPriority arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetLogPriorityPrefix;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_GetDefaultLogOutputFunction */"
         , "__attribute__ ((const))"
         , "SDL_LogOutputFunction (*hs_bindgen_48e509121cb8d650 (void)) (void)"
         , "{"
         , "  return &SDL_GetDefaultLogOutputFunction;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_GetLogOutputFunction */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_ae4995884c29f0d4 (void)) ("
         , "  SDL_LogOutputFunction *arg1,"
         , "  void **arg2"
         , ")"
         , "{"
         , "  return &SDL_GetLogOutputFunction;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_SetLogOutputFunction */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_b53e5cacb1899dae (void)) ("
         , "  SDL_LogOutputFunction arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetLogOutputFunction;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_SetLogPriorities@
foreign import ccall unsafe "hs_bindgen_53f49172bb06fac5"
  hs_bindgen_53f49172bb06fac5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_SetLogPriorities@
hs_bindgen_53f49172bb06fac5 :: IO (BG.FunPtr (SDL_LogPriority -> IO ()))
hs_bindgen_53f49172bb06fac5 =
  BG.fromFFIType hs_bindgen_53f49172bb06fac5_base

{-# NOINLINE sDL_SetLogPriorities #-}

-- | Set the priority of all log categories.
--
--     [@priority@]: the 'SDL_LogPriority' to assign.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ResetLogPriorities', 'sDL_SetLogPriority'
--
--     [C declaration]: @SDL_SetLogPriorities@, defined at @SDL3\/SDL_log.h 156:34@
sDL_SetLogPriorities :: BG.FunPtr (SDL_LogPriority -> IO ())
sDL_SetLogPriorities =
  BG.unsafePerformIO hs_bindgen_53f49172bb06fac5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_SetLogPriority@
foreign import ccall unsafe "hs_bindgen_efaec8fe88879163"
  hs_bindgen_efaec8fe88879163_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_SetLogPriority@
hs_bindgen_efaec8fe88879163 :: IO (BG.FunPtr (BG.CInt -> SDL_LogPriority -> IO ()))
hs_bindgen_efaec8fe88879163 =
  BG.fromFFIType hs_bindgen_efaec8fe88879163_base

{-# NOINLINE sDL_SetLogPriority #-}

-- | Set the priority of a particular log category.
--
--     [@category@]: the category to assign a priority to.
--
--     [@priority@]: the 'SDL_LogPriority' to assign.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetLogPriority', 'sDL_ResetLogPriorities', 'sDL_SetLogPriorities'
--
--     [C declaration]: @SDL_SetLogPriority@, defined at @SDL3\/SDL_log.h 172:34@
sDL_SetLogPriority :: BG.FunPtr (BG.CInt -> SDL_LogPriority -> IO ())
sDL_SetLogPriority =
  BG.unsafePerformIO hs_bindgen_efaec8fe88879163

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_GetLogPriority@
foreign import ccall unsafe "hs_bindgen_0a5edd280b63c817"
  hs_bindgen_0a5edd280b63c817_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_GetLogPriority@
hs_bindgen_0a5edd280b63c817 :: IO (BG.FunPtr (BG.CInt -> IO SDL_LogPriority))
hs_bindgen_0a5edd280b63c817 =
  BG.fromFFIType hs_bindgen_0a5edd280b63c817_base

{-# NOINLINE sDL_GetLogPriority #-}

-- | Get the priority of a particular log category.
--
--     [@category@]: the category to query.
--
--     [Returns]: the 'SDL_LogPriority' for the requested category.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetLogPriority'
--
--     [C declaration]: @SDL_GetLogPriority@, defined at @SDL3\/SDL_log.h 186:45@
sDL_GetLogPriority :: BG.FunPtr (BG.CInt -> IO SDL_LogPriority)
sDL_GetLogPriority =
  BG.unsafePerformIO hs_bindgen_0a5edd280b63c817

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_ResetLogPriorities@
foreign import ccall unsafe "hs_bindgen_a50e52f5fe769c57"
  hs_bindgen_a50e52f5fe769c57_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_ResetLogPriorities@
hs_bindgen_a50e52f5fe769c57 :: IO (BG.FunPtr (IO ()))
hs_bindgen_a50e52f5fe769c57 =
  BG.fromFFIType hs_bindgen_a50e52f5fe769c57_base

{-# NOINLINE sDL_ResetLogPriorities #-}

-- | Reset all priorities to default.
--
--     This is called by SDL_Quit().
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetLogPriorities', 'sDL_SetLogPriority'
--
--     [C declaration]: @SDL_ResetLogPriorities@, defined at @SDL3\/SDL_log.h 200:34@
sDL_ResetLogPriorities :: BG.FunPtr (IO ())
sDL_ResetLogPriorities =
  BG.unsafePerformIO hs_bindgen_a50e52f5fe769c57

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_SetLogPriorityPrefix@
foreign import ccall unsafe "hs_bindgen_69bb7de79ceb0d36"
  hs_bindgen_69bb7de79ceb0d36_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_SetLogPriorityPrefix@
hs_bindgen_69bb7de79ceb0d36
  :: IO (BG.FunPtr (SDL_LogPriority -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_69bb7de79ceb0d36 =
  BG.fromFFIType hs_bindgen_69bb7de79ceb0d36_base

{-# NOINLINE sDL_SetLogPriorityPrefix #-}

-- | Set the text prepended to log messages of a given priority.
--
--     By default SDL_LOG_PRIORITY_INFO and below have no prefix, and SDL_LOG_PRIORITY_WARN and higher have a prefix showing their priority, e.g. \"WARNING: \".
--
--     This function makes a copy of its string argument, __prefix__, so it is not necessary to keep the value of __prefix__ alive after the call returns.
--
--     [@priority@]: the 'SDL_LogPriority' to modify.
--
--     [@prefix@]: the prefix to use for that log priority, or NULL to use no prefix.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetLogPriorities', 'sDL_SetLogPriority'
--
--     [C declaration]: @SDL_SetLogPriorityPrefix@, defined at @SDL3\/SDL_log.h 225:34@
sDL_SetLogPriorityPrefix :: BG.FunPtr (SDL_LogPriority -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_SetLogPriorityPrefix =
  BG.unsafePerformIO hs_bindgen_69bb7de79ceb0d36

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_GetDefaultLogOutputFunction@
foreign import ccall unsafe "hs_bindgen_48e509121cb8d650"
  hs_bindgen_48e509121cb8d650_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_GetDefaultLogOutputFunction@
hs_bindgen_48e509121cb8d650 :: IO (BG.FunPtr (IO SDL_LogOutputFunction))
hs_bindgen_48e509121cb8d650 =
  BG.fromFFIType hs_bindgen_48e509121cb8d650_base

{-# NOINLINE sDL_GetDefaultLogOutputFunction #-}

-- | Get the default log output function.
--
--     [Returns]: the default log output callback.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetLogOutputFunction', 'sDL_GetLogOutputFunction'
--
--     [C declaration]: @SDL_GetDefaultLogOutputFunction@, defined at @SDL3\/SDL_log.h 499:51@
sDL_GetDefaultLogOutputFunction :: BG.FunPtr (IO SDL_LogOutputFunction)
sDL_GetDefaultLogOutputFunction =
  BG.unsafePerformIO hs_bindgen_48e509121cb8d650

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_GetLogOutputFunction@
foreign import ccall unsafe "hs_bindgen_ae4995884c29f0d4"
  hs_bindgen_ae4995884c29f0d4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_GetLogOutputFunction@
hs_bindgen_ae4995884c29f0d4
  :: IO (BG.FunPtr (BG.Ptr SDL_LogOutputFunction -> BG.Ptr (BG.Ptr BG.Void) -> IO ()))
hs_bindgen_ae4995884c29f0d4 =
  BG.fromFFIType hs_bindgen_ae4995884c29f0d4_base

{-# NOINLINE sDL_GetLogOutputFunction #-}

-- | Get the current log output function.
--
--     [@callback@]: an 'SDL_LogOutputFunction' filled in with the current log callback.
--
--     [@userdata@]: a pointer filled in with the pointer that is passed to @callback@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDefaultLogOutputFunction', 'sDL_SetLogOutputFunction'
--
--     [C declaration]: @SDL_GetLogOutputFunction@, defined at @SDL3\/SDL_log.h 516:34@
sDL_GetLogOutputFunction
  :: BG.FunPtr (BG.Ptr SDL_LogOutputFunction -> BG.Ptr (BG.Ptr BG.Void) -> IO ())
sDL_GetLogOutputFunction =
  BG.unsafePerformIO hs_bindgen_ae4995884c29f0d4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_SetLogOutputFunction@
foreign import ccall unsafe "hs_bindgen_b53e5cacb1899dae"
  hs_bindgen_b53e5cacb1899dae_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_get_SDL_SetLogOutputFunction@
hs_bindgen_b53e5cacb1899dae :: IO (BG.FunPtr (SDL_LogOutputFunction -> BG.Ptr BG.Void -> IO ()))
hs_bindgen_b53e5cacb1899dae =
  BG.fromFFIType hs_bindgen_b53e5cacb1899dae_base

{-# NOINLINE sDL_SetLogOutputFunction #-}

-- | Replace the default log output function with one of your own.
--
--     [@callback@]: an 'SDL_LogOutputFunction' to call instead of the default.
--
--     [@userdata@]: a pointer that is passed to @callback@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDefaultLogOutputFunction', 'sDL_GetLogOutputFunction'
--
--     [C declaration]: @SDL_SetLogOutputFunction@, defined at @SDL3\/SDL_log.h 531:34@
sDL_SetLogOutputFunction :: BG.FunPtr (SDL_LogOutputFunction -> BG.Ptr BG.Void -> IO ())
sDL_SetLogOutputFunction =
  BG.unsafePerformIO hs_bindgen_b53e5cacb1899dae

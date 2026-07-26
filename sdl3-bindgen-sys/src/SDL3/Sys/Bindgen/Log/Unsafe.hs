{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Log.Unsafe (
  SDL3.Sys.Bindgen.Log.Unsafe.sDL_SetLogPriorities,
  SDL3.Sys.Bindgen.Log.Unsafe.sDL_SetLogPriority,
  SDL3.Sys.Bindgen.Log.Unsafe.sDL_GetLogPriority,
  SDL3.Sys.Bindgen.Log.Unsafe.sDL_ResetLogPriorities,
  SDL3.Sys.Bindgen.Log.Unsafe.sDL_SetLogPriorityPrefix,
  SDL3.Sys.Bindgen.Log.Unsafe.sDL_GetDefaultLogOutputFunction,
  SDL3.Sys.Bindgen.Log.Unsafe.sDL_GetLogOutputFunction,
  SDL3.Sys.Bindgen.Log.Unsafe.sDL_SetLogOutputFunction,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Log

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_log.h>"
         , "void hs_bindgen_f026d42937d04ed8 ("
         , "  SDL_LogPriority arg1"
         , ")"
         , "{"
         , "  (SDL_SetLogPriorities)(arg1);"
         , "}"
         , "void hs_bindgen_e0acc30fc32ccc59 ("
         , "  signed int arg1,"
         , "  SDL_LogPriority arg2"
         , ")"
         , "{"
         , "  (SDL_SetLogPriority)(arg1, arg2);"
         , "}"
         , "SDL_LogPriority hs_bindgen_7b5c14a42af4d447 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_GetLogPriority)(arg1);"
         , "}"
         , "void hs_bindgen_dea89eef989102db (void)"
         , "{"
         , "  (SDL_ResetLogPriorities)();"
         , "}"
         , "_Bool hs_bindgen_27cf84b222a7e17b ("
         , "  SDL_LogPriority arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetLogPriorityPrefix)(arg1, arg2);"
         , "}"
         , "SDL_LogOutputFunction hs_bindgen_513e0ffa6c24153a (void)"
         , "{"
         , "  return (SDL_GetDefaultLogOutputFunction)();"
         , "}"
         , "void hs_bindgen_acd55da6463a4da5 ("
         , "  SDL_LogOutputFunction *arg1,"
         , "  void **arg2"
         , ")"
         , "{"
         , "  (SDL_GetLogOutputFunction)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_70ca4187e3666373 ("
         , "  SDL_LogOutputFunction arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  (SDL_SetLogOutputFunction)(arg1, arg2);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_SetLogPriorities@
foreign import ccall unsafe "hs_bindgen_f026d42937d04ed8"
  hs_bindgen_f026d42937d04ed8_base
    :: BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_SetLogPriorities@
hs_bindgen_f026d42937d04ed8
  :: SDL_LogPriority
  -> IO ()
hs_bindgen_f026d42937d04ed8 =
  BG.fromFFIType hs_bindgen_f026d42937d04ed8_base

-- | Set the priority of all log categories.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ResetLogPriorities', 'sDL_SetLogPriority'
--
--     [C declaration]: @SDL_SetLogPriorities@, defined at @SDL3\/SDL_log.h 156:34@
sDL_SetLogPriorities
  :: SDL_LogPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_LogPriority' to assign.
  -> IO ()
sDL_SetLogPriorities = hs_bindgen_f026d42937d04ed8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_SetLogPriority@
foreign import ccall unsafe "hs_bindgen_e0acc30fc32ccc59"
  hs_bindgen_e0acc30fc32ccc59_base
    :: BG.Int32
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_SetLogPriority@
hs_bindgen_e0acc30fc32ccc59
  :: BG.CInt
  -> SDL_LogPriority
  -> IO ()
hs_bindgen_e0acc30fc32ccc59 =
  BG.fromFFIType hs_bindgen_e0acc30fc32ccc59_base

-- | Set the priority of a particular log category.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetLogPriority', 'sDL_ResetLogPriorities', 'sDL_SetLogPriorities'
--
--     [C declaration]: @SDL_SetLogPriority@, defined at @SDL3\/SDL_log.h 172:34@
sDL_SetLogPriority
  :: BG.CInt
  -- ^
  --
  --           [@category@]: the category to assign a priority to.
  -> SDL_LogPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_LogPriority' to assign.
  -> IO ()
sDL_SetLogPriority = hs_bindgen_e0acc30fc32ccc59

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_GetLogPriority@
foreign import ccall unsafe "hs_bindgen_7b5c14a42af4d447"
  hs_bindgen_7b5c14a42af4d447_base
    :: BG.Int32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_GetLogPriority@
hs_bindgen_7b5c14a42af4d447
  :: BG.CInt
  -> IO SDL_LogPriority
hs_bindgen_7b5c14a42af4d447 =
  BG.fromFFIType hs_bindgen_7b5c14a42af4d447_base

-- | Get the priority of a particular log category.
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
sDL_GetLogPriority
  :: BG.CInt
  -- ^
  --
  --           [@category@]: the category to query.
  -> IO SDL_LogPriority
sDL_GetLogPriority = hs_bindgen_7b5c14a42af4d447

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_ResetLogPriorities@
foreign import ccall unsafe "hs_bindgen_dea89eef989102db"
  hs_bindgen_dea89eef989102db_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_ResetLogPriorities@
hs_bindgen_dea89eef989102db :: IO ()
hs_bindgen_dea89eef989102db =
  BG.fromFFIType hs_bindgen_dea89eef989102db_base

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
sDL_ResetLogPriorities :: IO ()
sDL_ResetLogPriorities = hs_bindgen_dea89eef989102db

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_SetLogPriorityPrefix@
foreign import ccall unsafe "hs_bindgen_27cf84b222a7e17b"
  hs_bindgen_27cf84b222a7e17b_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_SetLogPriorityPrefix@
hs_bindgen_27cf84b222a7e17b
  :: SDL_LogPriority
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_27cf84b222a7e17b =
  BG.fromFFIType hs_bindgen_27cf84b222a7e17b_base

-- | Set the text prepended to log messages of a given priority.
--
--     By default SDL_LOG_PRIORITY_INFO and below have no prefix, and SDL_LOG_PRIORITY_WARN and higher have a prefix showing their priority, e.g. \"WARNING: \".
--
--     This function makes a copy of its string argument, __prefix__, so it is not necessary to keep the value of __prefix__ alive after the call returns.
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
sDL_SetLogPriorityPrefix
  :: SDL_LogPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_LogPriority' to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@prefix@]: the prefix to use for that log priority, or NULL to use no prefix.
  -> IO BG.CBool
sDL_SetLogPriorityPrefix =
  hs_bindgen_27cf84b222a7e17b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_GetDefaultLogOutputFunction@
foreign import ccall unsafe "hs_bindgen_513e0ffa6c24153a"
  hs_bindgen_513e0ffa6c24153a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_GetDefaultLogOutputFunction@
hs_bindgen_513e0ffa6c24153a :: IO SDL_LogOutputFunction
hs_bindgen_513e0ffa6c24153a =
  BG.fromFFIType hs_bindgen_513e0ffa6c24153a_base

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
sDL_GetDefaultLogOutputFunction :: IO SDL_LogOutputFunction
sDL_GetDefaultLogOutputFunction =
  hs_bindgen_513e0ffa6c24153a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_GetLogOutputFunction@
foreign import ccall unsafe "hs_bindgen_acd55da6463a4da5"
  hs_bindgen_acd55da6463a4da5_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_GetLogOutputFunction@
hs_bindgen_acd55da6463a4da5
  :: BG.Ptr SDL_LogOutputFunction
  -> BG.Ptr (BG.Ptr BG.Void)
  -> IO ()
hs_bindgen_acd55da6463a4da5 =
  BG.fromFFIType hs_bindgen_acd55da6463a4da5_base

-- | Get the current log output function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDefaultLogOutputFunction', 'sDL_SetLogOutputFunction'
--
--     [C declaration]: @SDL_GetLogOutputFunction@, defined at @SDL3\/SDL_log.h 516:34@
sDL_GetLogOutputFunction
  :: BG.Ptr SDL_LogOutputFunction
  -- ^
  --
  --           [@callback@]: an 'SDL_LogOutputFunction' filled in with the current log callback.
  -> BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@userdata@]: a pointer filled in with the pointer that is passed to @callback@.
  -> IO ()
sDL_GetLogOutputFunction =
  hs_bindgen_acd55da6463a4da5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_SetLogOutputFunction@
foreign import ccall unsafe "hs_bindgen_70ca4187e3666373"
  hs_bindgen_70ca4187e3666373_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Log_Unsafe_SDL_SetLogOutputFunction@
hs_bindgen_70ca4187e3666373
  :: SDL_LogOutputFunction
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_70ca4187e3666373 =
  BG.fromFFIType hs_bindgen_70ca4187e3666373_base

-- | Replace the default log output function with one of your own.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDefaultLogOutputFunction', 'sDL_GetLogOutputFunction'
--
--     [C declaration]: @SDL_SetLogOutputFunction@, defined at @SDL3\/SDL_log.h 531:34@
sDL_SetLogOutputFunction
  :: SDL_LogOutputFunction
  -- ^
  --
  --           [@callback@]: an 'SDL_LogOutputFunction' to call instead of the default.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @callback@.
  -> IO ()
sDL_SetLogOutputFunction =
  hs_bindgen_70ca4187e3666373

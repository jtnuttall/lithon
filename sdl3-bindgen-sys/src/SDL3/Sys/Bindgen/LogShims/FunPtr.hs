{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.LogShims.FunPtr (
  SDL3.Sys.Bindgen.LogShims.FunPtr.lithon_SDL_Log,
  SDL3.Sys.Bindgen.LogShims.FunPtr.lithon_SDL_LogTrace,
  SDL3.Sys.Bindgen.LogShims.FunPtr.lithon_SDL_LogVerbose,
  SDL3.Sys.Bindgen.LogShims.FunPtr.lithon_SDL_LogDebug,
  SDL3.Sys.Bindgen.LogShims.FunPtr.lithon_SDL_LogInfo,
  SDL3.Sys.Bindgen.LogShims.FunPtr.lithon_SDL_LogWarn,
  SDL3.Sys.Bindgen.LogShims.FunPtr.lithon_SDL_LogError,
  SDL3.Sys.Bindgen.LogShims.FunPtr.lithon_SDL_LogCritical,
  SDL3.Sys.Bindgen.LogShims.FunPtr.lithon_SDL_LogMessage,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Log qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#define SDL_SLOW_MEMCPY"
         , "#define SDL_SLOW_MEMMOVE"
         , "#define SDL_SLOW_MEMSET"
         , "#include <sdl3-bindgen-sys/SDL_log_shims.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_Log */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_02d6bdbfbebbbca7 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_Log;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogTrace */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_b031cd617cf2187e (void)) ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &lithon_SDL_LogTrace;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogVerbose */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_01baad23ee654b8f (void)) ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &lithon_SDL_LogVerbose;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogDebug */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_08084e27beae5e62 (void)) ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &lithon_SDL_LogDebug;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogInfo */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_f187e83788791148 (void)) ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &lithon_SDL_LogInfo;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogWarn */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_9f1fe5bc35ab0a46 (void)) ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &lithon_SDL_LogWarn;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogError */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_30365de711cd7fc7 (void)) ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &lithon_SDL_LogError;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogCritical */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_eeabb1c88587b99c (void)) ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &lithon_SDL_LogCritical;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogMessage */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_ef67c4a50a42a453 (void)) ("
         , "  signed int arg1,"
         , "  SDL_LogPriority arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return &lithon_SDL_LogMessage;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_Log@
foreign import ccall unsafe "hs_bindgen_02d6bdbfbebbbca7"
  hs_bindgen_02d6bdbfbebbbca7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_Log@
hs_bindgen_02d6bdbfbebbbca7 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_02d6bdbfbebbbca7 =
  fmap BG.fromFFIType hs_bindgen_02d6bdbfbebbbca7_base

{-# NOINLINE lithon_SDL_Log #-}

-- | Log a message with SDL_LOG_CATEGORY_APPLICATION and SDL_LOG_PRIORITY_INFO.
--
--     A fixed-arity shim over the variadic SDL_Log: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [@message@]: the message to log, in UTF-8.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_Log@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 39:24@
lithon_SDL_Log :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO ())
lithon_SDL_Log =
  BG.unsafePerformIO hs_bindgen_02d6bdbfbebbbca7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogTrace@
foreign import ccall unsafe "hs_bindgen_b031cd617cf2187e"
  hs_bindgen_b031cd617cf2187e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogTrace@
hs_bindgen_b031cd617cf2187e :: IO (BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_b031cd617cf2187e =
  fmap BG.fromFFIType hs_bindgen_b031cd617cf2187e_base

{-# NOINLINE lithon_SDL_LogTrace #-}

-- | Log a message with SDL_LOG_PRIORITY_TRACE.
--
--     A fixed-arity shim over the variadic SDL_LogTrace: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [@category@]: the category of the message.
--
--     [@message@]: the message to log, in UTF-8.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogTrace@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 60:24@
lithon_SDL_LogTrace :: BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ())
lithon_SDL_LogTrace =
  BG.unsafePerformIO hs_bindgen_b031cd617cf2187e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogVerbose@
foreign import ccall unsafe "hs_bindgen_01baad23ee654b8f"
  hs_bindgen_01baad23ee654b8f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogVerbose@
hs_bindgen_01baad23ee654b8f :: IO (BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_01baad23ee654b8f =
  fmap BG.fromFFIType hs_bindgen_01baad23ee654b8f_base

{-# NOINLINE lithon_SDL_LogVerbose #-}

-- | Log a message with SDL_LOG_PRIORITY_VERBOSE.
--
--     A fixed-arity shim over the variadic SDL_LogVerbose: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [@category@]: the category of the message.
--
--     [@message@]: the message to log, in UTF-8.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogVerbose@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 81:24@
lithon_SDL_LogVerbose :: BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ())
lithon_SDL_LogVerbose =
  BG.unsafePerformIO hs_bindgen_01baad23ee654b8f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogDebug@
foreign import ccall unsafe "hs_bindgen_08084e27beae5e62"
  hs_bindgen_08084e27beae5e62_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogDebug@
hs_bindgen_08084e27beae5e62 :: IO (BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_08084e27beae5e62 =
  fmap BG.fromFFIType hs_bindgen_08084e27beae5e62_base

{-# NOINLINE lithon_SDL_LogDebug #-}

-- | Log a message with SDL_LOG_PRIORITY_DEBUG.
--
--     A fixed-arity shim over the variadic SDL_LogDebug: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [@category@]: the category of the message.
--
--     [@message@]: the message to log, in UTF-8.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogDebug@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 102:24@
lithon_SDL_LogDebug :: BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ())
lithon_SDL_LogDebug =
  BG.unsafePerformIO hs_bindgen_08084e27beae5e62

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogInfo@
foreign import ccall unsafe "hs_bindgen_f187e83788791148"
  hs_bindgen_f187e83788791148_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogInfo@
hs_bindgen_f187e83788791148 :: IO (BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_f187e83788791148 =
  fmap BG.fromFFIType hs_bindgen_f187e83788791148_base

{-# NOINLINE lithon_SDL_LogInfo #-}

-- | Log a message with SDL_LOG_PRIORITY_INFO.
--
--     A fixed-arity shim over the variadic SDL_LogInfo: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [@category@]: the category of the message.
--
--     [@message@]: the message to log, in UTF-8.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogInfo@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 123:24@
lithon_SDL_LogInfo :: BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ())
lithon_SDL_LogInfo =
  BG.unsafePerformIO hs_bindgen_f187e83788791148

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogWarn@
foreign import ccall unsafe "hs_bindgen_9f1fe5bc35ab0a46"
  hs_bindgen_9f1fe5bc35ab0a46_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogWarn@
hs_bindgen_9f1fe5bc35ab0a46 :: IO (BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_9f1fe5bc35ab0a46 =
  fmap BG.fromFFIType hs_bindgen_9f1fe5bc35ab0a46_base

{-# NOINLINE lithon_SDL_LogWarn #-}

-- | Log a message with SDL_LOG_PRIORITY_WARN.
--
--     A fixed-arity shim over the variadic SDL_LogWarn: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [@category@]: the category of the message.
--
--     [@message@]: the message to log, in UTF-8.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogWarn@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 144:24@
lithon_SDL_LogWarn :: BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ())
lithon_SDL_LogWarn =
  BG.unsafePerformIO hs_bindgen_9f1fe5bc35ab0a46

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogError@
foreign import ccall unsafe "hs_bindgen_30365de711cd7fc7"
  hs_bindgen_30365de711cd7fc7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogError@
hs_bindgen_30365de711cd7fc7 :: IO (BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_30365de711cd7fc7 =
  fmap BG.fromFFIType hs_bindgen_30365de711cd7fc7_base

{-# NOINLINE lithon_SDL_LogError #-}

-- | Log a message with SDL_LOG_PRIORITY_ERROR.
--
--     A fixed-arity shim over the variadic SDL_LogError: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [@category@]: the category of the message.
--
--     [@message@]: the message to log, in UTF-8.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogError@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 165:24@
lithon_SDL_LogError :: BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ())
lithon_SDL_LogError =
  BG.unsafePerformIO hs_bindgen_30365de711cd7fc7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogCritical@
foreign import ccall unsafe "hs_bindgen_eeabb1c88587b99c"
  hs_bindgen_eeabb1c88587b99c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogCritical@
hs_bindgen_eeabb1c88587b99c :: IO (BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_eeabb1c88587b99c =
  fmap BG.fromFFIType hs_bindgen_eeabb1c88587b99c_base

{-# NOINLINE lithon_SDL_LogCritical #-}

-- | Log a message with SDL_LOG_PRIORITY_CRITICAL.
--
--     A fixed-arity shim over the variadic SDL_LogCritical: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [@category@]: the category of the message.
--
--     [@message@]: the message to log, in UTF-8.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogCritical@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 186:24@
lithon_SDL_LogCritical :: BG.FunPtr (BG.CInt -> PtrConst.PtrConst BG.CChar -> IO ())
lithon_SDL_LogCritical =
  BG.unsafePerformIO hs_bindgen_eeabb1c88587b99c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogMessage@
foreign import ccall unsafe "hs_bindgen_ef67c4a50a42a453"
  hs_bindgen_ef67c4a50a42a453_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_get_lithon_SDL_LogMessage@
hs_bindgen_ef67c4a50a42a453
  :: IO
       (BG.FunPtr (BG.CInt -> SDL3.Sys.Bindgen.Log.SDL_LogPriority -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_ef67c4a50a42a453 =
  fmap BG.fromFFIType hs_bindgen_ef67c4a50a42a453_base

{-# NOINLINE lithon_SDL_LogMessage #-}

-- | Log a message with the specified category and priority.
--
--     A fixed-arity shim over the variadic SDL_LogMessage: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [@category@]: the category of the message.
--
--     [@priority@]: the priority of the message.
--
--     [@message@]: the message to log, in UTF-8.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_SetLogOutputFunction, SDL_SetLogPriority
--
--     [C declaration]: @lithon_SDL_LogMessage@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 209:24@
lithon_SDL_LogMessage
  :: BG.FunPtr (BG.CInt -> SDL3.Sys.Bindgen.Log.SDL_LogPriority -> PtrConst.PtrConst BG.CChar -> IO ())
lithon_SDL_LogMessage =
  BG.unsafePerformIO hs_bindgen_ef67c4a50a42a453

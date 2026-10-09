{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.LogShims.Unsafe (
  SDL3.Sys.Bindgen.LogShims.Unsafe.lithon_SDL_Log,
  SDL3.Sys.Bindgen.LogShims.Unsafe.lithon_SDL_LogTrace,
  SDL3.Sys.Bindgen.LogShims.Unsafe.lithon_SDL_LogVerbose,
  SDL3.Sys.Bindgen.LogShims.Unsafe.lithon_SDL_LogDebug,
  SDL3.Sys.Bindgen.LogShims.Unsafe.lithon_SDL_LogInfo,
  SDL3.Sys.Bindgen.LogShims.Unsafe.lithon_SDL_LogWarn,
  SDL3.Sys.Bindgen.LogShims.Unsafe.lithon_SDL_LogError,
  SDL3.Sys.Bindgen.LogShims.Unsafe.lithon_SDL_LogCritical,
  SDL3.Sys.Bindgen.LogShims.Unsafe.lithon_SDL_LogMessage,
)
where

import Prelude (IO)

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified
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
         , "void hs_bindgen_8dfd7b8bce88ad39 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  (lithon_SDL_Log)(arg1);"
         , "}"
         , "void hs_bindgen_a7827e45bd90cb5f ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogTrace)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_ca6920acb1e64cad ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogVerbose)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_4974933fe657d7e9 ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogDebug)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_fe8c851bf2e61192 ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogInfo)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_0319cb2ab6ab63fe ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogWarn)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_2d4be7c76c8e7b9f ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogError)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_32798034ebddbe4a ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogCritical)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_fff93b576b3812cd ("
         , "  signed int arg1,"
         , "  SDL_LogPriority arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  (lithon_SDL_LogMessage)(arg1, arg2, arg3);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_Log@
foreign import ccall unsafe "hs_bindgen_8dfd7b8bce88ad39"
  hs_bindgen_8dfd7b8bce88ad39_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_Log@
hs_bindgen_8dfd7b8bce88ad39
  :: PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_8dfd7b8bce88ad39 =
  \x0 ->
    hs_bindgen_8dfd7b8bce88ad39_base (BG.toFFIType x0)

-- | Log a message with SDL_LOG_CATEGORY_APPLICATION and SDL_LOG_PRIORITY_INFO.
--
--     A fixed-arity shim over the variadic SDL_Log: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_Log@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 39:24@
lithon_SDL_Log
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
lithon_SDL_Log = hs_bindgen_8dfd7b8bce88ad39

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogTrace@
foreign import ccall unsafe "hs_bindgen_a7827e45bd90cb5f"
  hs_bindgen_a7827e45bd90cb5f_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogTrace@
hs_bindgen_a7827e45bd90cb5f
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_a7827e45bd90cb5f =
  \x0 ->
    \x1 ->
      hs_bindgen_a7827e45bd90cb5f_base (BG.toFFIType x0) (BG.toFFIType x1)

-- | Log a message with SDL_LOG_PRIORITY_TRACE.
--
--     A fixed-arity shim over the variadic SDL_LogTrace: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogTrace@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 60:24@
lithon_SDL_LogTrace
  :: BG.CInt
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
lithon_SDL_LogTrace = hs_bindgen_a7827e45bd90cb5f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogVerbose@
foreign import ccall unsafe "hs_bindgen_ca6920acb1e64cad"
  hs_bindgen_ca6920acb1e64cad_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogVerbose@
hs_bindgen_ca6920acb1e64cad
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_ca6920acb1e64cad =
  \x0 ->
    \x1 ->
      hs_bindgen_ca6920acb1e64cad_base (BG.toFFIType x0) (BG.toFFIType x1)

-- | Log a message with SDL_LOG_PRIORITY_VERBOSE.
--
--     A fixed-arity shim over the variadic SDL_LogVerbose: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogVerbose@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 81:24@
lithon_SDL_LogVerbose
  :: BG.CInt
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
lithon_SDL_LogVerbose = hs_bindgen_ca6920acb1e64cad

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogDebug@
foreign import ccall unsafe "hs_bindgen_4974933fe657d7e9"
  hs_bindgen_4974933fe657d7e9_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogDebug@
hs_bindgen_4974933fe657d7e9
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_4974933fe657d7e9 =
  \x0 ->
    \x1 ->
      hs_bindgen_4974933fe657d7e9_base (BG.toFFIType x0) (BG.toFFIType x1)

-- | Log a message with SDL_LOG_PRIORITY_DEBUG.
--
--     A fixed-arity shim over the variadic SDL_LogDebug: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogDebug@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 102:24@
lithon_SDL_LogDebug
  :: BG.CInt
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
lithon_SDL_LogDebug = hs_bindgen_4974933fe657d7e9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogInfo@
foreign import ccall unsafe "hs_bindgen_fe8c851bf2e61192"
  hs_bindgen_fe8c851bf2e61192_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogInfo@
hs_bindgen_fe8c851bf2e61192
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_fe8c851bf2e61192 =
  \x0 ->
    \x1 ->
      hs_bindgen_fe8c851bf2e61192_base (BG.toFFIType x0) (BG.toFFIType x1)

-- | Log a message with SDL_LOG_PRIORITY_INFO.
--
--     A fixed-arity shim over the variadic SDL_LogInfo: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogInfo@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 123:24@
lithon_SDL_LogInfo
  :: BG.CInt
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
lithon_SDL_LogInfo = hs_bindgen_fe8c851bf2e61192

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogWarn@
foreign import ccall unsafe "hs_bindgen_0319cb2ab6ab63fe"
  hs_bindgen_0319cb2ab6ab63fe_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogWarn@
hs_bindgen_0319cb2ab6ab63fe
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_0319cb2ab6ab63fe =
  \x0 ->
    \x1 ->
      hs_bindgen_0319cb2ab6ab63fe_base (BG.toFFIType x0) (BG.toFFIType x1)

-- | Log a message with SDL_LOG_PRIORITY_WARN.
--
--     A fixed-arity shim over the variadic SDL_LogWarn: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogWarn@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 144:24@
lithon_SDL_LogWarn
  :: BG.CInt
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
lithon_SDL_LogWarn = hs_bindgen_0319cb2ab6ab63fe

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogError@
foreign import ccall unsafe "hs_bindgen_2d4be7c76c8e7b9f"
  hs_bindgen_2d4be7c76c8e7b9f_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogError@
hs_bindgen_2d4be7c76c8e7b9f
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_2d4be7c76c8e7b9f =
  \x0 ->
    \x1 ->
      hs_bindgen_2d4be7c76c8e7b9f_base (BG.toFFIType x0) (BG.toFFIType x1)

-- | Log a message with SDL_LOG_PRIORITY_ERROR.
--
--     A fixed-arity shim over the variadic SDL_LogError: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogError@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 165:24@
lithon_SDL_LogError
  :: BG.CInt
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
lithon_SDL_LogError = hs_bindgen_2d4be7c76c8e7b9f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogCritical@
foreign import ccall unsafe "hs_bindgen_32798034ebddbe4a"
  hs_bindgen_32798034ebddbe4a_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogCritical@
hs_bindgen_32798034ebddbe4a
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_32798034ebddbe4a =
  \x0 ->
    \x1 ->
      hs_bindgen_32798034ebddbe4a_base (BG.toFFIType x0) (BG.toFFIType x1)

-- | Log a message with SDL_LOG_PRIORITY_CRITICAL.
--
--     A fixed-arity shim over the variadic SDL_LogCritical: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LogMessage
--
--     [C declaration]: @lithon_SDL_LogCritical@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 186:24@
lithon_SDL_LogCritical
  :: BG.CInt
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
lithon_SDL_LogCritical = hs_bindgen_32798034ebddbe4a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogMessage@
foreign import ccall unsafe "hs_bindgen_fff93b576b3812cd"
  hs_bindgen_fff93b576b3812cd_base
    :: BG.CInt
    -> HsBindgen.Runtime.Support.CUInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Unsafe_lithon_SDL_LogMessage@
hs_bindgen_fff93b576b3812cd
  :: BG.CInt
  -> SDL3.Sys.Bindgen.Log.SDL_LogPriority
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_fff93b576b3812cd =
  \x0 ->
    \x1 ->
      \x2 ->
        hs_bindgen_fff93b576b3812cd_base (BG.toFFIType x0) (BG.toFFIType x1) (BG.toFFIType x2)

-- | Log a message with the specified category and priority.
--
--     A fixed-arity shim over the variadic SDL_LogMessage: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_SetLogOutputFunction, SDL_SetLogPriority
--
--     [C declaration]: @lithon_SDL_LogMessage@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 209:24@
lithon_SDL_LogMessage
  :: BG.CInt
  -- ^
  --
  --           [@category@]: the category of the message.
  -> SDL3.Sys.Bindgen.Log.SDL_LogPriority
  -- ^
  --
  --           [@priority@]: the priority of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
lithon_SDL_LogMessage = hs_bindgen_fff93b576b3812cd

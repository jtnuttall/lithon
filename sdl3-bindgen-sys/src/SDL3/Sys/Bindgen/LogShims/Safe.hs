{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.LogShims.Safe (
  SDL3.Sys.Bindgen.LogShims.Safe.lithon_SDL_Log,
  SDL3.Sys.Bindgen.LogShims.Safe.lithon_SDL_LogTrace,
  SDL3.Sys.Bindgen.LogShims.Safe.lithon_SDL_LogVerbose,
  SDL3.Sys.Bindgen.LogShims.Safe.lithon_SDL_LogDebug,
  SDL3.Sys.Bindgen.LogShims.Safe.lithon_SDL_LogInfo,
  SDL3.Sys.Bindgen.LogShims.Safe.lithon_SDL_LogWarn,
  SDL3.Sys.Bindgen.LogShims.Safe.lithon_SDL_LogError,
  SDL3.Sys.Bindgen.LogShims.Safe.lithon_SDL_LogCritical,
  SDL3.Sys.Bindgen.LogShims.Safe.lithon_SDL_LogMessage,
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
         , "void hs_bindgen_77328bf34cbcb12f ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  (lithon_SDL_Log)(arg1);"
         , "}"
         , "void hs_bindgen_c27ac2cf8645cf4e ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogTrace)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_fb7600f02da152c8 ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogVerbose)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_f148577846776bf9 ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogDebug)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_2768f1e0951fcadc ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogInfo)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_66494b86233d6dcb ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogWarn)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_572ce25309240a20 ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogError)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_05cdf92f853bb365 ("
         , "  signed int arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (lithon_SDL_LogCritical)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_a30cd534dfc5a717 ("
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

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_Log@
foreign import ccall safe "hs_bindgen_77328bf34cbcb12f"
  hs_bindgen_77328bf34cbcb12f_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_Log@
hs_bindgen_77328bf34cbcb12f
  :: PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_77328bf34cbcb12f =
  \x0 ->
    hs_bindgen_77328bf34cbcb12f_base (BG.toFFIType x0)

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
lithon_SDL_Log = hs_bindgen_77328bf34cbcb12f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogTrace@
foreign import ccall safe "hs_bindgen_c27ac2cf8645cf4e"
  hs_bindgen_c27ac2cf8645cf4e_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogTrace@
hs_bindgen_c27ac2cf8645cf4e
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_c27ac2cf8645cf4e =
  \x0 ->
    \x1 ->
      hs_bindgen_c27ac2cf8645cf4e_base (BG.toFFIType x0) (BG.toFFIType x1)

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
lithon_SDL_LogTrace = hs_bindgen_c27ac2cf8645cf4e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogVerbose@
foreign import ccall safe "hs_bindgen_fb7600f02da152c8"
  hs_bindgen_fb7600f02da152c8_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogVerbose@
hs_bindgen_fb7600f02da152c8
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_fb7600f02da152c8 =
  \x0 ->
    \x1 ->
      hs_bindgen_fb7600f02da152c8_base (BG.toFFIType x0) (BG.toFFIType x1)

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
lithon_SDL_LogVerbose = hs_bindgen_fb7600f02da152c8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogDebug@
foreign import ccall safe "hs_bindgen_f148577846776bf9"
  hs_bindgen_f148577846776bf9_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogDebug@
hs_bindgen_f148577846776bf9
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_f148577846776bf9 =
  \x0 ->
    \x1 ->
      hs_bindgen_f148577846776bf9_base (BG.toFFIType x0) (BG.toFFIType x1)

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
lithon_SDL_LogDebug = hs_bindgen_f148577846776bf9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogInfo@
foreign import ccall safe "hs_bindgen_2768f1e0951fcadc"
  hs_bindgen_2768f1e0951fcadc_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogInfo@
hs_bindgen_2768f1e0951fcadc
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_2768f1e0951fcadc =
  \x0 ->
    \x1 ->
      hs_bindgen_2768f1e0951fcadc_base (BG.toFFIType x0) (BG.toFFIType x1)

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
lithon_SDL_LogInfo = hs_bindgen_2768f1e0951fcadc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogWarn@
foreign import ccall safe "hs_bindgen_66494b86233d6dcb"
  hs_bindgen_66494b86233d6dcb_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogWarn@
hs_bindgen_66494b86233d6dcb
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_66494b86233d6dcb =
  \x0 ->
    \x1 ->
      hs_bindgen_66494b86233d6dcb_base (BG.toFFIType x0) (BG.toFFIType x1)

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
lithon_SDL_LogWarn = hs_bindgen_66494b86233d6dcb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogError@
foreign import ccall safe "hs_bindgen_572ce25309240a20"
  hs_bindgen_572ce25309240a20_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogError@
hs_bindgen_572ce25309240a20
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_572ce25309240a20 =
  \x0 ->
    \x1 ->
      hs_bindgen_572ce25309240a20_base (BG.toFFIType x0) (BG.toFFIType x1)

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
lithon_SDL_LogError = hs_bindgen_572ce25309240a20

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogCritical@
foreign import ccall safe "hs_bindgen_05cdf92f853bb365"
  hs_bindgen_05cdf92f853bb365_base
    :: BG.CInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogCritical@
hs_bindgen_05cdf92f853bb365
  :: BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_05cdf92f853bb365 =
  \x0 ->
    \x1 ->
      hs_bindgen_05cdf92f853bb365_base (BG.toFFIType x0) (BG.toFFIType x1)

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
lithon_SDL_LogCritical = hs_bindgen_05cdf92f853bb365

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogMessage@
foreign import ccall safe "hs_bindgen_a30cd534dfc5a717"
  hs_bindgen_a30cd534dfc5a717_base
    :: BG.CInt
    -> HsBindgen.Runtime.Support.CUInt
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.LogShims_Safe_lithon_SDL_LogMessage@
hs_bindgen_a30cd534dfc5a717
  :: BG.CInt
  -> SDL3.Sys.Bindgen.Log.SDL_LogPriority
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_a30cd534dfc5a717 =
  \x0 ->
    \x1 ->
      \x2 ->
        hs_bindgen_a30cd534dfc5a717_base (BG.toFFIType x0) (BG.toFFIType x1) (BG.toFFIType x2)

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
lithon_SDL_LogMessage = hs_bindgen_a30cd534dfc5a717

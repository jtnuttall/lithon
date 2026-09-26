{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

module Mpv.Sys.Bindgen.Client (
  Mpv.Sys.Bindgen.Client.mPV_MAKE_VERSION,
  Mpv.Sys.Bindgen.Client.mPV_CLIENT_API_VERSION,
  Mpv.Sys.Bindgen.Client.mPV_ENABLE_DEPRECATED,
  Mpv.Sys.Bindgen.Client.Mpv_handle,
  Mpv.Sys.Bindgen.Client.Mpv_error (..),
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_SUCCESS,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_EVENT_QUEUE_FULL,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_NOMEM,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_UNINITIALIZED,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_INVALID_PARAMETER,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_OPTION_NOT_FOUND,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_OPTION_FORMAT,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_OPTION_ERROR,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_PROPERTY_NOT_FOUND,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_PROPERTY_FORMAT,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_PROPERTY_UNAVAILABLE,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_PROPERTY_ERROR,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_COMMAND,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_LOADING_FAILED,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_AO_INIT_FAILED,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_VO_INIT_FAILED,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_NOTHING_TO_PLAY,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_UNKNOWN_FORMAT,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_UNSUPPORTED,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_NOT_IMPLEMENTED,
  pattern Mpv.Sys.Bindgen.Client.MPV_ERROR_GENERIC,
  Mpv.Sys.Bindgen.Client.Mpv_format (..),
  pattern Mpv.Sys.Bindgen.Client.MPV_FORMAT_NONE,
  pattern Mpv.Sys.Bindgen.Client.MPV_FORMAT_STRING,
  pattern Mpv.Sys.Bindgen.Client.MPV_FORMAT_OSD_STRING,
  pattern Mpv.Sys.Bindgen.Client.MPV_FORMAT_FLAG,
  pattern Mpv.Sys.Bindgen.Client.MPV_FORMAT_INT64,
  pattern Mpv.Sys.Bindgen.Client.MPV_FORMAT_DOUBLE,
  pattern Mpv.Sys.Bindgen.Client.MPV_FORMAT_NODE,
  pattern Mpv.Sys.Bindgen.Client.MPV_FORMAT_NODE_ARRAY,
  pattern Mpv.Sys.Bindgen.Client.MPV_FORMAT_NODE_MAP,
  pattern Mpv.Sys.Bindgen.Client.MPV_FORMAT_BYTE_ARRAY,
  Mpv.Sys.Bindgen.Client.Mpv_node_u (..),
  Mpv.Sys.Bindgen.Client.Mpv_node (..),
  Mpv.Sys.Bindgen.Client.Mpv_node_list (..),
  Mpv.Sys.Bindgen.Client.Mpv_byte_array (..),
  Mpv.Sys.Bindgen.Client.Mpv_event_id (..),
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_NONE,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_SHUTDOWN,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_LOG_MESSAGE,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_GET_PROPERTY_REPLY,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_SET_PROPERTY_REPLY,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_COMMAND_REPLY,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_START_FILE,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_END_FILE,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_FILE_LOADED,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_IDLE,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_TICK,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_CLIENT_MESSAGE,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_VIDEO_RECONFIG,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_AUDIO_RECONFIG,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_SEEK,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_PLAYBACK_RESTART,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_PROPERTY_CHANGE,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_QUEUE_OVERFLOW,
  pattern Mpv.Sys.Bindgen.Client.MPV_EVENT_HOOK,
  Mpv.Sys.Bindgen.Client.Mpv_event_property (..),
  Mpv.Sys.Bindgen.Client.Mpv_log_level (..),
  pattern Mpv.Sys.Bindgen.Client.MPV_LOG_LEVEL_NONE,
  pattern Mpv.Sys.Bindgen.Client.MPV_LOG_LEVEL_FATAL,
  pattern Mpv.Sys.Bindgen.Client.MPV_LOG_LEVEL_ERROR,
  pattern Mpv.Sys.Bindgen.Client.MPV_LOG_LEVEL_WARN,
  pattern Mpv.Sys.Bindgen.Client.MPV_LOG_LEVEL_INFO,
  pattern Mpv.Sys.Bindgen.Client.MPV_LOG_LEVEL_V,
  pattern Mpv.Sys.Bindgen.Client.MPV_LOG_LEVEL_DEBUG,
  pattern Mpv.Sys.Bindgen.Client.MPV_LOG_LEVEL_TRACE,
  Mpv.Sys.Bindgen.Client.Mpv_event_log_message (..),
  Mpv.Sys.Bindgen.Client.Mpv_end_file_reason (..),
  pattern Mpv.Sys.Bindgen.Client.MPV_END_FILE_REASON_EOF,
  pattern Mpv.Sys.Bindgen.Client.MPV_END_FILE_REASON_STOP,
  pattern Mpv.Sys.Bindgen.Client.MPV_END_FILE_REASON_QUIT,
  pattern Mpv.Sys.Bindgen.Client.MPV_END_FILE_REASON_ERROR,
  pattern Mpv.Sys.Bindgen.Client.MPV_END_FILE_REASON_REDIRECT,
  Mpv.Sys.Bindgen.Client.Mpv_event_start_file (..),
  Mpv.Sys.Bindgen.Client.Mpv_event_end_file (..),
  Mpv.Sys.Bindgen.Client.Mpv_event_client_message (..),
  Mpv.Sys.Bindgen.Client.Mpv_event_hook (..),
  Mpv.Sys.Bindgen.Client.Mpv_event_command (..),
  Mpv.Sys.Bindgen.Client.Mpv_event (..),
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import HsBindgen.Runtime.Union qualified as Union

-- | Mechanisms provided by this API
--
--     This API provides general control over mpv playback. It does not give you direct access to individual components of the player, only the whole thing. It\'s somewhat equivalent to MPlayer\'s slave mode. You can send commands, retrieve or set playback status or settings with properties, and receive events.
--
--     The API can be used in two ways: 1) Internally in mpv, to provide additional features to the command line player. Lua scripting uses this. (Currently there is no plugin API to get a client API handle in external user code. It has to be a fixed part of the player at compilation time.) 2) Using mpv as a library with @mpv_create()@. This basically allows embedding mpv in other applications.
--
--     Documentation
--
--     The libmpv C API is documented directly in this header. Note that most actual interaction with this player is done through options\/commands\/properties, which can be accessed through this API. Essentially everything is done with them, including loading a file, retrieving playback progress, and so on.
--
--     These are documented elsewhere:
--
--     * [http:\/\/mpv.io\/manual\/master\/\#options](http://mpv.io/manual/master/#options)
--
--     * [http:\/\/mpv.io\/manual\/master\/\#list-of-input-commands](http://mpv.io/manual/master/#list-of-input-commands)
--
--     * [http:\/\/mpv.io\/manual\/master\/\#properties](http://mpv.io/manual/master/#properties)
--
--     You can also look at the examples here:
--
--     * [https:\/\/github.com\/mpv-player\/mpv-examples\/tree\/master\/libmpv](https://github.com/mpv-player/mpv-examples/tree/master/libmpv)
--
--     Event loop
--
--     In general, the API user should run an event loop in order to receive events. This event loop should call @mpv_wait_event()@, which will return once a new mpv client API is available. It is also possible to integrate client API usage in other event loops (e.g. GUI toolkits) with the @mpv_set_wakeup_callback()@ function, and then polling for events by calling @mpv_wait_event()@ with a 0 timeout.
--
--     Note that the event loop is detached from the actual player. Not calling @mpv_wait_event()@ will not stop playback. It will eventually congest the event queue of your API handle, though.
--
--     Synchronous vs. asynchronous calls
--
--     The API allows both synchronous and asynchronous calls. Synchronous calls have to wait until the playback core is ready, which currently can take an unbounded time (e.g. if network is slow or unresponsive). Asynchronous calls just queue operations as requests, and return the result of the operation as events.
--
--     Asynchronous calls
--
--     The client API includes asynchronous functions. These allow you to send requests instantly, and get replies as events at a later point. The requests are made with functions carrying the _async suffix, and replies are returned by @mpv_wait_event()@ (interleaved with the normal event stream).
--
--     A 64 bit userdata value is used to allow the user to associate requests with replies. The value is passed as reply_userdata parameter to the request function. The reply to the request will have the reply mpv_event->reply_userdata field set to the same value as the reply_userdata parameter of the corresponding request.
--
--     This userdata value is arbitrary and is never interpreted by the API. Note that the userdata value 0 is also allowed, but then the client must be careful not accidentally interpret the mpv_event->reply_userdata if an event is not a reply. (For non-replies, this field is set to 0.)
--
--     Asynchronous calls may be reordered in arbitrarily with other synchronous and asynchronous calls. If you want a guaranteed order, you need to wait until asynchronous calls report completion before doing the next call.
--
--     See also the section \"Asynchronous command details\" in the manpage.
--
--     Multithreading
--
--     The client API is generally fully thread-safe, unless otherwise noted. Currently, there is no real advantage in using more than 1 thread to access the client API, since everything is serialized through a single lock in the playback core.
--
--     Basic environment requirements
--
--     This documents basic requirements on the C environment. This is especially important if mpv is used as library with @mpv_create()@.
--
--     * The LC_NUMERIC locale category must be set to \"C\". If your program calls setlocale(), be sure not to use LC_ALL, or if you do, reset LC_NUMERIC to its sane default: setlocale(LC_NUMERIC, \"C\").
--
--     * If a X11 based VO is used, mpv will set the xlib error handler. This error handler is process-wide, and there\'s no proper way to share it with other xlib users within the same process. This might confuse GUI toolkits.
--
--     * mpv uses some other libraries that are not library-safe, such as Fribidi (used through libass), ALSA, FFmpeg, and possibly more.
--
--     * The FPU precision must be set at least to double precision.
--
--     * On Windows, mpv will call timeBeginPeriod(1).
--
--     * On memory exhaustion, mpv will kill the process.
--
--     * In certain cases, mpv may start sub processes (such as with the ytdl wrapper script).
--
--     * Using UNIX IPC (off by default) will override the SIGPIPE signal handler, and set it to SIG_IGN. Some invocations of the \"subprocess\" command will also do that.
--
--     * mpv may start sub processes, so overriding SIGCHLD, or waiting on all PIDs (such as calling wait()) by the parent process or any other library within the process must be avoided. libmpv itself only waits for its own PIDs.
--
--     * If anything in the process registers signal handlers, they must set the SA_RESTART flag. Otherwise you WILL get random failures on signals.
--
--     Encoding of filenames
--
--     mpv uses UTF-8 everywhere.
--
--     On some platforms (like Linux), filenames actually do not have to be UTF-8; for this reason libmpv supports non-UTF-8 strings. libmpv uses what the kernel uses and does not recode filenames. At least on Linux, passing a string to libmpv is like passing a string to the fopen() function.
--
--     On Windows, filenames are always UTF-8, libmpv converts between UTF-8 and UTF-16 when using win32 API functions. libmpv never uses or accepts filenames in the local 8 bit encoding. It does not use fopen() either; it uses _wfopen().
--
--     On macOS, filenames and other strings taken\/returned by libmpv can have inconsistent unicode normalization. This can sometimes lead to problems. You have to hope for the best.
--
--     Also see the remarks for MPV_FORMAT_STRING.
--
--     Embedding the video window
--
--     Using the render API (in render.h) is recommended. This API requires you to create and maintain an OpenGL context, to which you can render video using a specific API call. This API does not include keyboard or mouse input directly.
--
--     There is an older way to embed the native mpv window into your own. You have to get the raw window handle, and set it as \"wid\" option. This works on X11, win32, and macOS only. It\'s much easier to use than the render API, but also has various problems.
--
--     Also see client API examples and the mpv manpage. There is an extensive discussion here: [https:\/\/github.com\/mpv-player\/mpv-examples\/tree\/master\/libmpv\#methods-of-embedding-the-video-window](https://github.com/mpv-player/mpv-examples/tree/master/libmpv#methods-of-embedding-the-video-window)
--
--     Compatibility
--
--     mpv development doesn\'t stand still, and changes to mpv internals as well as to its interface can cause compatibility issues to client API users.
--
--     The API is versioned (see MPV_CLIENT_API_VERSION), and changes to it are documented in DOCS\/client-api-changes.rst. The C API itself will probably remain compatible for a long time, but the functionality exposed by it could change more rapidly. For example, it\'s possible that options are renamed, or change the set of allowed values.
--
--     Defensive programming should be used to potentially deal with the fact that options, commands, and properties could disappear, change their value range, or change the underlying datatypes. It might be a good idea to prefer MPV_FORMAT_STRING over other types to decouple your code from potential mpv changes.
--
--     Also see: DOCS\/compatibility.rst
--
--     Future changes
--
--     This are the planned changes that will most likely be done on the next major bump of the library:
--
--     * remove all symbols that are marked as deprecated
--
--     * reassign enum numerical values to remove gaps
--
--     * disabling all events by default The version is incremented on each API change. The 16 lower bits form the minor version number, and the 16 higher bits the major version number. If the API becomes incompatible to previous versions, the major version number is incremented. This affects only C part, and not properties and options.
--
--     Every API bump is described in DOCS\/client-api-changes.rst
--
--     You can use @MPV_MAKE_VERSION()@ and compare the result with integer relational operators (\<, >, \<=, >=).
--
--     [C declaration]: @macro MPV_MAKE_VERSION@, defined at @mpv\/client.h 250:9@
mPV_MAKE_VERSION
  :: forall a0 b1
   . (C.Expr.HostPlatform.Bitwise (C.Expr.HostPlatform.ShiftRes a0) b1)
  => ( C.Expr.HostPlatform.Bitwise
         (C.Expr.HostPlatform.BitsRes (C.Expr.HostPlatform.ShiftRes a0) b1)
         BG.CULong
     )
  => (C.Expr.HostPlatform.Shift a0 BG.CInt)
  => a0
  -> b1
  -> C.Expr.HostPlatform.BitsRes
       (C.Expr.HostPlatform.BitsRes (C.Expr.HostPlatform.ShiftRes a0) b1)
       BG.CULong
mPV_MAKE_VERSION =
  \major0 ->
    \minor1 ->
      (C.Expr.HostPlatform..|.)
        ((C.Expr.HostPlatform..|.) ((C.Expr.HostPlatform.<<) major0 (16 :: BG.CInt)) minor1)
        (0 :: BG.CULong)

-- | [C declaration]: @macro MPV_CLIENT_API_VERSION@, defined at @mpv\/client.h 251:9@
mPV_CLIENT_API_VERSION :: BG.CULong
mPV_CLIENT_API_VERSION =
  mPV_MAKE_VERSION (2 :: BG.CInt) (5 :: BG.CInt)

-- | The API user is allowed to \"\#define MPV_ENABLE_DEPRECATED 0\" before including any libmpv headers. Then deprecated symbols will be excluded from the headers. (Of course, deprecated properties and commands and other functionality will still work.)
--
--     [C declaration]: @macro MPV_ENABLE_DEPRECATED@, defined at @mpv\/client.h 260:9@
mPV_ENABLE_DEPRECATED :: BG.CInt
mPV_ENABLE_DEPRECATED = (1 :: BG.CInt)

-- | Client context used by the client API. Every client has its own private handle.
--
--     [C declaration]: @struct mpv_handle@, defined at @mpv\/client.h 272:16@
data Mpv_handle

-- | List of error codes than can be returned by API functions. 0 and positive return values always mean success, negative values are always errors.
--
--     [C declaration]: @enum mpv_error@, defined at @mpv\/client.h 278:14@
newtype Mpv_error = Mpv_error
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize Mpv_error where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw Mpv_error where
  readRaw =
    \ptr0 ->
      pure Mpv_error
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw Mpv_error where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_error unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable Mpv_error instance BG.Storable Mpv_error

deriving via BG.CInt instance BG.Prim Mpv_error

instance CEnum.CEnum Mpv_error where
  type CEnumZ Mpv_error = BG.CInt

  toCEnum = Mpv_error

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (-20, BG.singleton "MPV_ERROR_GENERIC")
        , (-19, BG.singleton "MPV_ERROR_NOT_IMPLEMENTED")
        , (-18, BG.singleton "MPV_ERROR_UNSUPPORTED")
        , (-17, BG.singleton "MPV_ERROR_UNKNOWN_FORMAT")
        , (-16, BG.singleton "MPV_ERROR_NOTHING_TO_PLAY")
        , (-15, BG.singleton "MPV_ERROR_VO_INIT_FAILED")
        , (-14, BG.singleton "MPV_ERROR_AO_INIT_FAILED")
        , (-13, BG.singleton "MPV_ERROR_LOADING_FAILED")
        , (-12, BG.singleton "MPV_ERROR_COMMAND")
        , (-11, BG.singleton "MPV_ERROR_PROPERTY_ERROR")
        , (-10, BG.singleton "MPV_ERROR_PROPERTY_UNAVAILABLE")
        , (-9, BG.singleton "MPV_ERROR_PROPERTY_FORMAT")
        , (-8, BG.singleton "MPV_ERROR_PROPERTY_NOT_FOUND")
        , (-7, BG.singleton "MPV_ERROR_OPTION_ERROR")
        , (-6, BG.singleton "MPV_ERROR_OPTION_FORMAT")
        , (-5, BG.singleton "MPV_ERROR_OPTION_NOT_FOUND")
        , (-4, BG.singleton "MPV_ERROR_INVALID_PARAMETER")
        , (-3, BG.singleton "MPV_ERROR_UNINITIALIZED")
        , (-2, BG.singleton "MPV_ERROR_NOMEM")
        , (-1, BG.singleton "MPV_ERROR_EVENT_QUEUE_FULL")
        , (0, BG.singleton "MPV_ERROR_SUCCESS")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "Mpv_error"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "Mpv_error"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum Mpv_error where
  minDeclaredValue = MPV_ERROR_GENERIC

  maxDeclaredValue = MPV_ERROR_SUCCESS

instance Show Mpv_error where
  showsPrec = CEnum.shows

instance Read Mpv_error where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" Mpv_error ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_error{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr Mpv_error) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_error "unwrap" where
  type CFieldType Mpv_error "unwrap" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | No error happened (used to signal successful operation). Keep in mind that many API functions returning error codes can also return positive values, which also indicate success. API users can hardcode the fact that \">= 0\" means success.
--
--     [C declaration]: @MPV_ERROR_SUCCESS@, defined at @mpv\/client.h 285:5@
pattern MPV_ERROR_SUCCESS :: Mpv_error
pattern MPV_ERROR_SUCCESS = Mpv_error 0

-- | The event ringbuffer is full. This means the client is choked, and can\'t receive any events. This can happen when too many asynchronous requests have been made, but not answered. Probably never happens in practice, unless the mpv core is frozen for some reason, and the client keeps making asynchronous requests. (Bugs in the client API implementation could also trigger this, e.g. if events become \"lost\".)
--
--     [C declaration]: @MPV_ERROR_EVENT_QUEUE_FULL@, defined at @mpv\/client.h 294:5@
pattern MPV_ERROR_EVENT_QUEUE_FULL :: Mpv_error
pattern MPV_ERROR_EVENT_QUEUE_FULL = Mpv_error (-1)

-- | Memory allocation failed.
--
--     [C declaration]: @MPV_ERROR_NOMEM@, defined at @mpv\/client.h 298:5@
pattern MPV_ERROR_NOMEM :: Mpv_error
pattern MPV_ERROR_NOMEM = Mpv_error (-2)

-- | The mpv core wasn\'t configured and initialized yet. See the notes in @mpv_create()@.
--
--     [C declaration]: @MPV_ERROR_UNINITIALIZED@, defined at @mpv\/client.h 303:5@
pattern MPV_ERROR_UNINITIALIZED :: Mpv_error
pattern MPV_ERROR_UNINITIALIZED = Mpv_error (-3)

-- | Generic catch-all error if a parameter is set to an invalid or unsupported value. This is used if there is no better error code.
--
--     [C declaration]: @MPV_ERROR_INVALID_PARAMETER@, defined at @mpv\/client.h 308:5@
pattern MPV_ERROR_INVALID_PARAMETER :: Mpv_error
pattern MPV_ERROR_INVALID_PARAMETER = Mpv_error (-4)

-- | Trying to set an option that doesn\'t exist.
--
--     [C declaration]: @MPV_ERROR_OPTION_NOT_FOUND@, defined at @mpv\/client.h 312:5@
pattern MPV_ERROR_OPTION_NOT_FOUND :: Mpv_error
pattern MPV_ERROR_OPTION_NOT_FOUND = Mpv_error (-5)

-- | Trying to set an option using an unsupported MPV_FORMAT.
--
--     [C declaration]: @MPV_ERROR_OPTION_FORMAT@, defined at @mpv\/client.h 316:5@
pattern MPV_ERROR_OPTION_FORMAT :: Mpv_error
pattern MPV_ERROR_OPTION_FORMAT = Mpv_error (-6)

-- | Setting the option failed. Typically this happens if the provided option value could not be parsed.
--
--     [C declaration]: @MPV_ERROR_OPTION_ERROR@, defined at @mpv\/client.h 321:5@
pattern MPV_ERROR_OPTION_ERROR :: Mpv_error
pattern MPV_ERROR_OPTION_ERROR = Mpv_error (-7)

-- | The accessed property doesn\'t exist.
--
--     [C declaration]: @MPV_ERROR_PROPERTY_NOT_FOUND@, defined at @mpv\/client.h 325:5@
pattern MPV_ERROR_PROPERTY_NOT_FOUND :: Mpv_error
pattern MPV_ERROR_PROPERTY_NOT_FOUND = Mpv_error (-8)

-- | Trying to set or get a property using an unsupported MPV_FORMAT.
--
--     [C declaration]: @MPV_ERROR_PROPERTY_FORMAT@, defined at @mpv\/client.h 329:5@
pattern MPV_ERROR_PROPERTY_FORMAT :: Mpv_error
pattern MPV_ERROR_PROPERTY_FORMAT = Mpv_error (-9)

-- | The property exists, but is not available. This usually happens when the associated subsystem is not active, e.g. querying audio parameters while audio is disabled.
--
--     [C declaration]: @MPV_ERROR_PROPERTY_UNAVAILABLE@, defined at @mpv\/client.h 335:5@
pattern MPV_ERROR_PROPERTY_UNAVAILABLE :: Mpv_error
pattern MPV_ERROR_PROPERTY_UNAVAILABLE = Mpv_error (-10)

-- | Error setting or getting a property.
--
--     [C declaration]: @MPV_ERROR_PROPERTY_ERROR@, defined at @mpv\/client.h 339:5@
pattern MPV_ERROR_PROPERTY_ERROR :: Mpv_error
pattern MPV_ERROR_PROPERTY_ERROR = Mpv_error (-11)

-- | General error when running a command with mpv_command and similar.
--
--     [C declaration]: @MPV_ERROR_COMMAND@, defined at @mpv\/client.h 343:5@
pattern MPV_ERROR_COMMAND :: Mpv_error
pattern MPV_ERROR_COMMAND = Mpv_error (-12)

-- | Generic error on loading (usually used with @mpv_event_end_file.error@).
--
--     [C declaration]: @MPV_ERROR_LOADING_FAILED@, defined at @mpv\/client.h 347:5@
pattern MPV_ERROR_LOADING_FAILED :: Mpv_error
pattern MPV_ERROR_LOADING_FAILED = Mpv_error (-13)

-- | Initializing the audio output failed.
--
--     [C declaration]: @MPV_ERROR_AO_INIT_FAILED@, defined at @mpv\/client.h 351:5@
pattern MPV_ERROR_AO_INIT_FAILED :: Mpv_error
pattern MPV_ERROR_AO_INIT_FAILED = Mpv_error (-14)

-- | Initializing the video output failed.
--
--     [C declaration]: @MPV_ERROR_VO_INIT_FAILED@, defined at @mpv\/client.h 355:5@
pattern MPV_ERROR_VO_INIT_FAILED :: Mpv_error
pattern MPV_ERROR_VO_INIT_FAILED = Mpv_error (-15)

-- | There was no audio or video data to play. This also happens if the file was recognized, but did not contain any audio or video streams, or no streams were selected.
--
--     [C declaration]: @MPV_ERROR_NOTHING_TO_PLAY@, defined at @mpv\/client.h 361:5@
pattern MPV_ERROR_NOTHING_TO_PLAY :: Mpv_error
pattern MPV_ERROR_NOTHING_TO_PLAY = Mpv_error (-16)

-- | When trying to load the file, the file format could not be determined, or the file was too broken to open it.
--
--     [C declaration]: @MPV_ERROR_UNKNOWN_FORMAT@, defined at @mpv\/client.h 366:5@
pattern MPV_ERROR_UNKNOWN_FORMAT :: Mpv_error
pattern MPV_ERROR_UNKNOWN_FORMAT = Mpv_error (-17)

-- | Generic error for signaling that certain system requirements are not fulfilled.
--
--     [C declaration]: @MPV_ERROR_UNSUPPORTED@, defined at @mpv\/client.h 371:5@
pattern MPV_ERROR_UNSUPPORTED :: Mpv_error
pattern MPV_ERROR_UNSUPPORTED = Mpv_error (-18)

-- | The API function which was called is a stub only.
--
--     [C declaration]: @MPV_ERROR_NOT_IMPLEMENTED@, defined at @mpv\/client.h 375:5@
pattern MPV_ERROR_NOT_IMPLEMENTED :: Mpv_error
pattern MPV_ERROR_NOT_IMPLEMENTED = Mpv_error (-19)

-- | Unspecified error.
--
--     [C declaration]: @MPV_ERROR_GENERIC@, defined at @mpv\/client.h 379:5@
pattern MPV_ERROR_GENERIC :: Mpv_error
pattern MPV_ERROR_GENERIC = Mpv_error (-20)

-- | Data format for options and properties. The API functions to get\/set properties and options support multiple formats, and this enum describes them.
--
--     [C declaration]: @enum mpv_format@, defined at @mpv\/client.h 630:14@
newtype Mpv_format = Mpv_format
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize Mpv_format where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw Mpv_format where
  readRaw =
    \ptr0 ->
      pure Mpv_format
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw Mpv_format where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_format unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable Mpv_format instance BG.Storable Mpv_format

deriving via BG.CUInt instance BG.Prim Mpv_format

instance CEnum.CEnum Mpv_format where
  type CEnumZ Mpv_format = BG.CUInt

  toCEnum = Mpv_format

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "MPV_FORMAT_NONE")
        , (1, BG.singleton "MPV_FORMAT_STRING")
        , (2, BG.singleton "MPV_FORMAT_OSD_STRING")
        , (3, BG.singleton "MPV_FORMAT_FLAG")
        , (4, BG.singleton "MPV_FORMAT_INT64")
        , (5, BG.singleton "MPV_FORMAT_DOUBLE")
        , (6, BG.singleton "MPV_FORMAT_NODE")
        , (7, BG.singleton "MPV_FORMAT_NODE_ARRAY")
        , (8, BG.singleton "MPV_FORMAT_NODE_MAP")
        , (9, BG.singleton "MPV_FORMAT_BYTE_ARRAY")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "Mpv_format"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "Mpv_format"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum Mpv_format where
  minDeclaredValue = MPV_FORMAT_NONE

  maxDeclaredValue = MPV_FORMAT_BYTE_ARRAY

instance Show Mpv_format where
  showsPrec = CEnum.shows

instance Read Mpv_format where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" Mpv_format ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_format{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr Mpv_format) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_format "unwrap" where
  type CFieldType Mpv_format "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Invalid. Sometimes used for empty values. This is always defined to 0, so a normal 0-init of 'Mpv_format' (or e.g. 'Mpv_node') is guaranteed to set this it to MPV_FORMAT_NONE (which makes some things saner as consequence).
--
--     [C declaration]: @MPV_FORMAT_NONE@, defined at @mpv\/client.h 636:5@
pattern MPV_FORMAT_NONE :: Mpv_format
pattern MPV_FORMAT_NONE = Mpv_format 0

-- | The basic type is char*. It returns the raw property string, like using \${=property} in input.conf (see input.rst).
--
--     NULL isn\'t an allowed value.
--
--     Warning: although the encoding is usually UTF-8, this is not always the case. File tags often store strings in some legacy codepage, and even filenames don\'t necessarily have to be in UTF-8 (at least on Linux). If you pass the strings to code that requires valid UTF-8, you have to sanitize it in some way. On Windows, filenames are always UTF-8, and libmpv converts between UTF-8 and UTF-16 when using win32 API functions. See the \"Encoding of filenames\" section for details.
--
--     Example for reading: char *result = NULL;
-- if (mpv_get_property(ctx, \"property\", MPV_FORMAT_STRING, &result) \< 0)
--     goto error;
-- printf(\"%s\\n\", result);
-- mpv_free(result);
--
--     Or just use @mpv_get_property_string()@.
--
--     Example for writing: char *value = \"the new value\";
-- \/\/ yep, you pass the address to the variable
-- \/\/ (needed for symmetry with other types and mpv_get_property)
-- mpv_set_property(ctx, \"property\", MPV_FORMAT_STRING, &value);
--
--     Or just use @mpv_set_property_string()@.
--
--     [C declaration]: @MPV_FORMAT_STRING@, defined at @mpv\/client.h 672:5@
pattern MPV_FORMAT_STRING :: Mpv_format
pattern MPV_FORMAT_STRING = Mpv_format 1

-- | The basic type is char*. It returns the OSD property string, like using \${property} in input.conf (see input.rst). In many cases, this is the same as the raw string, but in other cases it\'s formatted for display on OSD. It\'s intended to be human readable. Do not attempt to parse these strings.
--
--     Only valid when doing read access. The rest works like MPV_FORMAT_STRING.
--
--     [C declaration]: @MPV_FORMAT_OSD_STRING@, defined at @mpv\/client.h 682:5@
pattern MPV_FORMAT_OSD_STRING :: Mpv_format
pattern MPV_FORMAT_OSD_STRING = Mpv_format 2

-- | The basic type is int. The only allowed values are 0 (\"no\") and 1 (\"yes\").
--
--     Example for reading: int result;
-- if (mpv_get_property(ctx, \"property\", MPV_FORMAT_FLAG, &result) \< 0)
--     goto error;
-- printf(\"%s\\n\", result ? \"true\" : \"false\");
--
--     Example for writing: int flag = 1;
-- mpv_set_property(ctx, \"property\", MPV_FORMAT_FLAG, &flag);
--
--     [C declaration]: @MPV_FORMAT_FLAG@, defined at @mpv\/client.h 699:5@
pattern MPV_FORMAT_FLAG :: Mpv_format
pattern MPV_FORMAT_FLAG = Mpv_format 3

-- | The basic type is int64_t.
--
--     [C declaration]: @MPV_FORMAT_INT64@, defined at @mpv\/client.h 703:5@
pattern MPV_FORMAT_INT64 :: Mpv_format
pattern MPV_FORMAT_INT64 = Mpv_format 4

-- | The basic type is double.
--
--     [C declaration]: @MPV_FORMAT_DOUBLE@, defined at @mpv\/client.h 707:5@
pattern MPV_FORMAT_DOUBLE :: Mpv_format
pattern MPV_FORMAT_DOUBLE = Mpv_format 5

-- | The type is 'Mpv_node'.
--
--     For reading, you usually would pass a pointer to a stack-allocated 'Mpv_node' value to mpv, and when you\'re done you call mpv_free_node_contents(&node). You\'re expected not to write to the data - if you have to, copy it first (which you have to do manually).
--
--     For writing, you construct your own 'Mpv_node', and pass a pointer to the API. The API will never write to your data (and copy it if needed), so you\'re free to use any form of allocation or memory management you like.
--
--     Warning: when reading, always check the @mpv_node.format@ member. For example, properties might change their type in future versions of mpv, or sometimes even during runtime.
--
--     Example for reading: mpv_node result;
-- if (mpv_get_property(ctx, \"property\", MPV_FORMAT_NODE, &result) \< 0)
--     goto error;
-- printf(\"format=%d\\n\", (int)result.format);
-- mpv_free_node_contents(&result).
--
--     Example for writing: mpv_node value;
-- value.format = MPV_FORMAT_STRING;
-- value.u.string = \"hello\";
-- mpv_set_property(ctx, \"property\", MPV_FORMAT_NODE, &value);
--
--     [C declaration]: @MPV_FORMAT_NODE@, defined at @mpv\/client.h 740:5@
pattern MPV_FORMAT_NODE :: Mpv_format
pattern MPV_FORMAT_NODE = Mpv_format 6

-- | Used with 'Mpv_node' only. Can usually not be used directly.
--
--     [C declaration]: @MPV_FORMAT_NODE_ARRAY@, defined at @mpv\/client.h 744:5@
pattern MPV_FORMAT_NODE_ARRAY :: Mpv_format
pattern MPV_FORMAT_NODE_ARRAY = Mpv_format 7

-- | See MPV_FORMAT_NODE_ARRAY.
--
--     [C declaration]: @MPV_FORMAT_NODE_MAP@, defined at @mpv\/client.h 748:5@
pattern MPV_FORMAT_NODE_MAP :: Mpv_format
pattern MPV_FORMAT_NODE_MAP = Mpv_format 8

-- | A raw, untyped byte array. Only used only with 'Mpv_node', and only in some very specific situations. (Some commands use it.)
--
--     [C declaration]: @MPV_FORMAT_BYTE_ARRAY@, defined at @mpv\/client.h 753:5@
pattern MPV_FORMAT_BYTE_ARRAY :: Mpv_format
pattern MPV_FORMAT_BYTE_ARRAY = Mpv_format 9

-- | [C declaration]: @union \@mpv_node_u@, defined at @mpv\/client.h 765:5@
newtype Mpv_node_u = Mpv_node_u
  { unwrap :: BG.ByteArray
  }
  deriving stock (BG.Generic)

deriving via BG.SizedByteArray 8 8 instance Marshal.StaticSize Mpv_node_u

deriving via BG.SizedByteArray 8 8 instance Marshal.ReadRaw Mpv_node_u

deriving via BG.SizedByteArray 8 8 instance Marshal.WriteRaw Mpv_node_u

deriving via Marshal.EquivStorable Mpv_node_u instance BG.Storable Mpv_node_u

deriving via BG.SizedByteArray 8 8 instance Union.IsUnion Mpv_node_u

-- | [C declaration]: @string@, defined at @mpv\/client.h 766:15@
instance (ty ~ BG.Ptr BG.CChar) => BG.HasField "string" Mpv_node_u ty where
  getField = BG.getUnionPayload

-- | [C declaration]: @string@, defined at @mpv\/client.h 766:15@
instance
  (ty ~ BG.Ptr BG.CChar)
  => BG.CompatHasField.HasField "string" Mpv_node_u ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"string" x0)

instance
  (ty ~ BG.Ptr BG.CChar)
  => BG.HasField "string" (BG.Ptr Mpv_node_u) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"string")

instance HasCField.HasCField Mpv_node_u "string" where
  type CFieldType Mpv_node_u "string" = BG.Ptr BG.CChar

  offset# = \_ -> \_ -> 0

-- | valid if format==MPV_FORMAT_STRING
--
--     [C declaration]: @flag@, defined at @mpv\/client.h 767:13@
instance (ty ~ BG.CInt) => BG.HasField "flag" Mpv_node_u ty where
  getField = BG.getUnionPayload

-- | valid if format==MPV_FORMAT_STRING
--
--     [C declaration]: @flag@, defined at @mpv\/client.h 767:13@
instance (ty ~ BG.CInt) => BG.CompatHasField.HasField "flag" Mpv_node_u ty where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"flag" x0)

instance
  (ty ~ BG.CInt)
  => BG.HasField "flag" (BG.Ptr Mpv_node_u) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"flag")

instance HasCField.HasCField Mpv_node_u "flag" where
  type CFieldType Mpv_node_u "flag" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | valid if format==MPV_FORMAT_FLAG
--
--     [C declaration]: @int64@, defined at @mpv\/client.h 768:17@
instance
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.HasField "int64" Mpv_node_u ty
  where
  getField = BG.getUnionPayload

-- | valid if format==MPV_FORMAT_FLAG
--
--     [C declaration]: @int64@, defined at @mpv\/client.h 768:17@
instance
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.CompatHasField.HasField "int64" Mpv_node_u ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"int64" x0)

instance
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.HasField "int64" (BG.Ptr Mpv_node_u) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"int64")

instance HasCField.HasCField Mpv_node_u "int64" where
  type
    CFieldType Mpv_node_u "int64" =
      HsBindgen.Runtime.LibC.Int64

  offset# = \_ -> \_ -> 0

-- | valid if format==MPV_FORMAT_INT64
--
--     [C declaration]: @double_@, defined at @mpv\/client.h 769:16@
instance (ty ~ BG.CDouble) => BG.HasField "double_" Mpv_node_u ty where
  getField = BG.getUnionPayload

-- | valid if format==MPV_FORMAT_INT64
--
--     [C declaration]: @double_@, defined at @mpv\/client.h 769:16@
instance
  (ty ~ BG.CDouble)
  => BG.CompatHasField.HasField "double_" Mpv_node_u ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"double_" x0)

instance
  (ty ~ BG.CDouble)
  => BG.HasField "double_" (BG.Ptr Mpv_node_u) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"double_")

instance HasCField.HasCField Mpv_node_u "double_" where
  type CFieldType Mpv_node_u "double_" = BG.CDouble

  offset# = \_ -> \_ -> 0

-- | valid if format==MPV_FORMAT_DOUBLE valid if format==MPV_FORMAT_NODE_ARRAY or if format==MPV_FORMAT_NODE_MAP
--
--     [C declaration]: @list@, defined at @mpv\/client.h 774:31@
instance (ty ~ BG.Ptr Mpv_node_list) => BG.HasField "list" Mpv_node_u ty where
  getField = BG.getUnionPayload

-- | valid if format==MPV_FORMAT_DOUBLE valid if format==MPV_FORMAT_NODE_ARRAY or if format==MPV_FORMAT_NODE_MAP
--
--     [C declaration]: @list@, defined at @mpv\/client.h 774:31@
instance
  (ty ~ BG.Ptr Mpv_node_list)
  => BG.CompatHasField.HasField "list" Mpv_node_u ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"list" x0)

instance
  (ty ~ BG.Ptr Mpv_node_list)
  => BG.HasField "list" (BG.Ptr Mpv_node_u) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"list")

instance HasCField.HasCField Mpv_node_u "list" where
  type
    CFieldType Mpv_node_u "list" =
      BG.Ptr Mpv_node_list

  offset# = \_ -> \_ -> 0

-- | valid if format==MPV_FORMAT_BYTE_ARRAY
--
--     [C declaration]: @ba@, defined at @mpv\/client.h 778:32@
instance (ty ~ BG.Ptr Mpv_byte_array) => BG.HasField "ba" Mpv_node_u ty where
  getField = BG.getUnionPayload

-- | valid if format==MPV_FORMAT_BYTE_ARRAY
--
--     [C declaration]: @ba@, defined at @mpv\/client.h 778:32@
instance
  (ty ~ BG.Ptr Mpv_byte_array)
  => BG.CompatHasField.HasField "ba" Mpv_node_u ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"ba" x0)

instance
  (ty ~ BG.Ptr Mpv_byte_array)
  => BG.HasField "ba" (BG.Ptr Mpv_node_u) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"ba")

instance HasCField.HasCField Mpv_node_u "ba" where
  type
    CFieldType Mpv_node_u "ba" =
      BG.Ptr Mpv_byte_array

  offset# = \_ -> \_ -> 0

-- | Generic data storage.
--
--     If mpv writes this struct (e.g. via @mpv_get_property()@), you must not change the data. In some cases (@mpv_get_property()@), you have to free it with @mpv_free_node_contents()@. If you fill this struct yourself, you\'re also responsible for freeing it, and you must not call @mpv_free_node_contents()@.
--
--     [C declaration]: @struct mpv_node@, defined at @mpv\/client.h 764:16@
data Mpv_node = Mpv_node
  { u :: Mpv_node_u
  -- ^ [C declaration]: @u@, defined at @mpv\/client.h 779:7@
  , format :: Mpv_format
  -- ^ Type of the data stored in this struct. This value rules what members in the given union can be accessed. The following formats are currently defined to be allowed in 'Mpv_node':
  --
  --          MPV_FORMAT_STRING (u.string) MPV_FORMAT_FLAG (u.flag) MPV_FORMAT_INT64 (u.int64) MPV_FORMAT_DOUBLE (u.double_) MPV_FORMAT_NODE_ARRAY (u.list) MPV_FORMAT_NODE_MAP (u.list) MPV_FORMAT_BYTE_ARRAY (u.ba) MPV_FORMAT_NONE (no member)
  --
  --          If you encounter a value you don\'t know, you must not make any assumptions about the contents of union u.
  --
  --          [C declaration]: @format@, defined at @mpv\/client.h 797:16@
  }
  deriving stock (BG.Generic)

instance Marshal.StaticSize Mpv_node where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_node where
  readRaw =
    \ptr0 ->
      pure Mpv_node
        <*> HasCField.readRaw (BG.Proxy @"u") ptr0
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0

instance Marshal.WriteRaw Mpv_node where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_node u2 format3 ->
            HasCField.writeRaw (BG.Proxy @"u") ptr0 u2
              >> HasCField.writeRaw (BG.Proxy @"format") ptr0 format3

deriving via Marshal.EquivStorable Mpv_node instance BG.Storable Mpv_node

instance (ty ~ Mpv_node_u) => BG.CompatHasField.HasField "u" Mpv_node ty where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_node{u = y1, format = BG.getField @"format" x0}
      , BG.getField @"u" x0
      )

instance
  (ty ~ Mpv_node_u)
  => BG.HasField "u" (BG.Ptr Mpv_node) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"u")

instance HasCField.HasCField Mpv_node "u" where
  type CFieldType Mpv_node "u" = Mpv_node_u

  offset# = \_ -> \_ -> 0

instance
  (ty ~ Mpv_format)
  => BG.CompatHasField.HasField "format" Mpv_node ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_node{format = y1, u = BG.getField @"u" x0}
      , BG.getField @"format" x0
      )

instance
  (ty ~ Mpv_format)
  => BG.HasField "format" (BG.Ptr Mpv_node) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField Mpv_node "format" where
  type CFieldType Mpv_node "format" = Mpv_format

  offset# = \_ -> \_ -> 8

-- | (see 'Mpv_node')
--
--     [C declaration]: @struct mpv_node_list@, defined at @mpv\/client.h 803:16@
data Mpv_node_list = Mpv_node_list
  { num :: BG.CInt
  -- ^ Number of entries. Negative values are not allowed.
  --
  --          [C declaration]: @num@, defined at @mpv\/client.h 807:9@
  , values :: BG.Ptr Mpv_node
  -- ^ MPV_FORMAT_NODE_ARRAY: values[N] refers to value of the Nth item
  --
  --          MPV_FORMAT_NODE_MAP: values[N] refers to value of the Nth key\/value pair
  --
  --          If num > 0, values[0] to values[num-1] (inclusive) are valid. Otherwise, this can be NULL.
  --
  --          [C declaration]: @values@, defined at @mpv\/client.h 818:15@
  , keys :: BG.Ptr (BG.Ptr BG.CChar)
  -- ^ MPV_FORMAT_NODE_ARRAY: unused (typically NULL), access is not allowed
  --
  --          MPV_FORMAT_NODE_MAP: keys[N] refers to key of the Nth key\/value pair. If num > 0, keys[0] to keys[num-1] (inclusive) are valid. Otherwise, this can be NULL. The keys are in random order. The only guarantee is that keys[N] belongs to the value values[N]. NULL keys are not allowed.
  --
  --          [C declaration]: @keys@, defined at @mpv\/client.h 829:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_node_list where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_node_list where
  readRaw =
    \ptr0 ->
      pure Mpv_node_list
        <*> HasCField.readRaw (BG.Proxy @"num") ptr0
        <*> HasCField.readRaw (BG.Proxy @"values") ptr0
        <*> HasCField.readRaw (BG.Proxy @"keys") ptr0

instance Marshal.WriteRaw Mpv_node_list where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_node_list num2 values3 keys4 ->
            HasCField.writeRaw (BG.Proxy @"num") ptr0 num2
              >> HasCField.writeRaw (BG.Proxy @"values") ptr0 values3
              >> HasCField.writeRaw (BG.Proxy @"keys") ptr0 keys4

deriving via Marshal.EquivStorable Mpv_node_list instance BG.Storable Mpv_node_list

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "num" Mpv_node_list ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_node_list{num = y1, values = BG.getField @"values" x0, keys = BG.getField @"keys" x0}
      , BG.getField @"num" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "num" (BG.Ptr Mpv_node_list) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"num")

instance HasCField.HasCField Mpv_node_list "num" where
  type CFieldType Mpv_node_list "num" = BG.CInt

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.Ptr Mpv_node)
  => BG.CompatHasField.HasField "values" Mpv_node_list ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_node_list{values = y1, num = BG.getField @"num" x0, keys = BG.getField @"keys" x0}
      , BG.getField @"values" x0
      )

instance
  (ty ~ BG.Ptr Mpv_node)
  => BG.HasField "values" (BG.Ptr Mpv_node_list) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"values")

instance HasCField.HasCField Mpv_node_list "values" where
  type
    CFieldType Mpv_node_list "values" =
      BG.Ptr Mpv_node

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.Ptr (BG.Ptr BG.CChar))
  => BG.CompatHasField.HasField "keys" Mpv_node_list ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_node_list{keys = y1, num = BG.getField @"num" x0, values = BG.getField @"values" x0}
      , BG.getField @"keys" x0
      )

instance
  (ty ~ BG.Ptr (BG.Ptr BG.CChar))
  => BG.HasField "keys" (BG.Ptr Mpv_node_list) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"keys")

instance HasCField.HasCField Mpv_node_list "keys" where
  type
    CFieldType Mpv_node_list "keys" =
      BG.Ptr (BG.Ptr BG.CChar)

  offset# = \_ -> \_ -> 16

-- | (see 'Mpv_node')
--
--     [C declaration]: @struct mpv_byte_array@, defined at @mpv\/client.h 835:16@
data Mpv_byte_array = Mpv_byte_array
  { data' :: BG.Ptr BG.Void
  -- ^ Pointer to the data. In what format the data is stored is up to whatever uses MPV_FORMAT_BYTE_ARRAY.
  --
  --          [C declaration]: @data@, defined at @mpv\/client.h 840:11@
  , size :: HsBindgen.Runtime.LibC.CSize
  -- ^ Size of the data pointed to by ptr.
  --
  --          [C declaration]: @size@, defined at @mpv\/client.h 844:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_byte_array where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_byte_array where
  readRaw =
    \ptr0 ->
      pure Mpv_byte_array
        <*> HasCField.readRaw (BG.Proxy @"data'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"size") ptr0

instance Marshal.WriteRaw Mpv_byte_array where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_byte_array data'2 size3 ->
            HasCField.writeRaw (BG.Proxy @"data'") ptr0 data'2
              >> HasCField.writeRaw (BG.Proxy @"size") ptr0 size3

deriving via Marshal.EquivStorable Mpv_byte_array instance BG.Storable Mpv_byte_array

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "data'" Mpv_byte_array ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_byte_array{data' = y1, size = BG.getField @"size" x0}
      , BG.getField @"data'" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "data'" (BG.Ptr Mpv_byte_array) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data'")

instance HasCField.HasCField Mpv_byte_array "data'" where
  type
    CFieldType Mpv_byte_array "data'" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 0

instance
  (ty ~ HsBindgen.Runtime.LibC.CSize)
  => BG.CompatHasField.HasField "size" Mpv_byte_array ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_byte_array{size = y1, data' = BG.getField @"data'" x0}
      , BG.getField @"size" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.CSize)
  => BG.HasField "size" (BG.Ptr Mpv_byte_array) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"size")

instance HasCField.HasCField Mpv_byte_array "size" where
  type
    CFieldType Mpv_byte_array "size" =
      HsBindgen.Runtime.LibC.CSize

  offset# = \_ -> \_ -> 8

-- | [C declaration]: @enum mpv_event_id@, defined at @mpv\/client.h 1242:14@
newtype Mpv_event_id = Mpv_event_id
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize Mpv_event_id where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw Mpv_event_id where
  readRaw =
    \ptr0 ->
      pure Mpv_event_id
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw Mpv_event_id where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_event_id unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable Mpv_event_id instance BG.Storable Mpv_event_id

deriving via BG.CUInt instance BG.Prim Mpv_event_id

instance CEnum.CEnum Mpv_event_id where
  type CEnumZ Mpv_event_id = BG.CUInt

  toCEnum = Mpv_event_id

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "MPV_EVENT_NONE")
        , (1, BG.singleton "MPV_EVENT_SHUTDOWN")
        , (2, BG.singleton "MPV_EVENT_LOG_MESSAGE")
        , (3, BG.singleton "MPV_EVENT_GET_PROPERTY_REPLY")
        , (4, BG.singleton "MPV_EVENT_SET_PROPERTY_REPLY")
        , (5, BG.singleton "MPV_EVENT_COMMAND_REPLY")
        , (6, BG.singleton "MPV_EVENT_START_FILE")
        , (7, BG.singleton "MPV_EVENT_END_FILE")
        , (8, BG.singleton "MPV_EVENT_FILE_LOADED")
        , (11, BG.singleton "MPV_EVENT_IDLE")
        , (14, BG.singleton "MPV_EVENT_TICK")
        , (16, BG.singleton "MPV_EVENT_CLIENT_MESSAGE")
        , (17, BG.singleton "MPV_EVENT_VIDEO_RECONFIG")
        , (18, BG.singleton "MPV_EVENT_AUDIO_RECONFIG")
        , (20, BG.singleton "MPV_EVENT_SEEK")
        , (21, BG.singleton "MPV_EVENT_PLAYBACK_RESTART")
        , (22, BG.singleton "MPV_EVENT_PROPERTY_CHANGE")
        , (24, BG.singleton "MPV_EVENT_QUEUE_OVERFLOW")
        , (25, BG.singleton "MPV_EVENT_HOOK")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "Mpv_event_id"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "Mpv_event_id"

instance Show Mpv_event_id where
  showsPrec = CEnum.shows

instance Read Mpv_event_id where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" Mpv_event_id ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_id{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr Mpv_event_id) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_event_id "unwrap" where
  type CFieldType Mpv_event_id "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @MPV_EVENT_NONE@, defined at @mpv\/client.h 1246:5@
pattern MPV_EVENT_NONE :: Mpv_event_id
pattern MPV_EVENT_NONE = Mpv_event_id 0

-- | [C declaration]: @MPV_EVENT_SHUTDOWN@, defined at @mpv\/client.h 1253:5@
pattern MPV_EVENT_SHUTDOWN :: Mpv_event_id
pattern MPV_EVENT_SHUTDOWN = Mpv_event_id 1

-- | [C declaration]: @MPV_EVENT_LOG_MESSAGE@, defined at @mpv\/client.h 1257:5@
pattern MPV_EVENT_LOG_MESSAGE :: Mpv_event_id
pattern MPV_EVENT_LOG_MESSAGE = Mpv_event_id 2

-- | [C declaration]: @MPV_EVENT_GET_PROPERTY_REPLY@, defined at @mpv\/client.h 1262:5@
pattern MPV_EVENT_GET_PROPERTY_REPLY :: Mpv_event_id
pattern MPV_EVENT_GET_PROPERTY_REPLY = Mpv_event_id 3

-- | [C declaration]: @MPV_EVENT_SET_PROPERTY_REPLY@, defined at @mpv\/client.h 1267:5@
pattern MPV_EVENT_SET_PROPERTY_REPLY :: Mpv_event_id
pattern MPV_EVENT_SET_PROPERTY_REPLY = Mpv_event_id 4

-- | [C declaration]: @MPV_EVENT_COMMAND_REPLY@, defined at @mpv\/client.h 1272:5@
pattern MPV_EVENT_COMMAND_REPLY :: Mpv_event_id
pattern MPV_EVENT_COMMAND_REPLY = Mpv_event_id 5

-- | [C declaration]: @MPV_EVENT_START_FILE@, defined at @mpv\/client.h 1277:5@
pattern MPV_EVENT_START_FILE :: Mpv_event_id
pattern MPV_EVENT_START_FILE = Mpv_event_id 6

-- | [C declaration]: @MPV_EVENT_END_FILE@, defined at @mpv\/client.h 1282:5@
pattern MPV_EVENT_END_FILE :: Mpv_event_id
pattern MPV_EVENT_END_FILE = Mpv_event_id 7

-- | [C declaration]: @MPV_EVENT_FILE_LOADED@, defined at @mpv\/client.h 1287:5@
pattern MPV_EVENT_FILE_LOADED :: Mpv_event_id
pattern MPV_EVENT_FILE_LOADED = Mpv_event_id 8

-- | [C declaration]: @MPV_EVENT_IDLE@, defined at @mpv\/client.h 1301:5@
pattern MPV_EVENT_IDLE :: Mpv_event_id
pattern MPV_EVENT_IDLE = Mpv_event_id 11

-- | [C declaration]: @MPV_EVENT_TICK@, defined at @mpv\/client.h 1311:5@
pattern MPV_EVENT_TICK :: Mpv_event_id
pattern MPV_EVENT_TICK = Mpv_event_id 14

-- | [C declaration]: @MPV_EVENT_CLIENT_MESSAGE@, defined at @mpv\/client.h 1320:5@
pattern MPV_EVENT_CLIENT_MESSAGE :: Mpv_event_id
pattern MPV_EVENT_CLIENT_MESSAGE = Mpv_event_id 16

-- | [C declaration]: @MPV_EVENT_VIDEO_RECONFIG@, defined at @mpv\/client.h 1331:5@
pattern MPV_EVENT_VIDEO_RECONFIG :: Mpv_event_id
pattern MPV_EVENT_VIDEO_RECONFIG = Mpv_event_id 17

-- | [C declaration]: @MPV_EVENT_AUDIO_RECONFIG@, defined at @mpv\/client.h 1336:5@
pattern MPV_EVENT_AUDIO_RECONFIG :: Mpv_event_id
pattern MPV_EVENT_AUDIO_RECONFIG = Mpv_event_id 18

-- | [C declaration]: @MPV_EVENT_SEEK@, defined at @mpv\/client.h 1341:5@
pattern MPV_EVENT_SEEK :: Mpv_event_id
pattern MPV_EVENT_SEEK = Mpv_event_id 20

-- | [C declaration]: @MPV_EVENT_PLAYBACK_RESTART@, defined at @mpv\/client.h 1348:5@
pattern MPV_EVENT_PLAYBACK_RESTART :: Mpv_event_id
pattern MPV_EVENT_PLAYBACK_RESTART = Mpv_event_id 21

-- | [C declaration]: @MPV_EVENT_PROPERTY_CHANGE@, defined at @mpv\/client.h 1353:5@
pattern MPV_EVENT_PROPERTY_CHANGE :: Mpv_event_id
pattern MPV_EVENT_PROPERTY_CHANGE = Mpv_event_id 22

-- | [C declaration]: @MPV_EVENT_QUEUE_OVERFLOW@, defined at @mpv\/client.h 1363:5@
pattern MPV_EVENT_QUEUE_OVERFLOW :: Mpv_event_id
pattern MPV_EVENT_QUEUE_OVERFLOW = Mpv_event_id 24

-- | [C declaration]: @MPV_EVENT_HOOK@, defined at @mpv\/client.h 1370:5@
pattern MPV_EVENT_HOOK :: Mpv_event_id
pattern MPV_EVENT_HOOK = Mpv_event_id 25

-- | [C declaration]: @struct mpv_event_property@, defined at @mpv\/client.h 1390:16@
data Mpv_event_property = Mpv_event_property
  { name :: PtrConst.PtrConst BG.CChar
  -- ^ Name of the property.
  --
  --          [C declaration]: @name@, defined at @mpv\/client.h 1394:17@
  , format :: Mpv_format
  -- ^ Format of the data field in the same struct. See enum 'Mpv_format'. This is always the same format as the requested format, except when the property could not be retrieved (unavailable, or an error happened), in which case the format is MPV_FORMAT_NONE.
  --
  --          [C declaration]: @format@, defined at @mpv\/client.h 1401:16@
  , data' :: BG.Ptr BG.Void
  -- ^ Received property value. Depends on the format. This is like the pointer argument passed to @mpv_get_property()@.
  --
  --          For example, for MPV_FORMAT_STRING you get the string with:
  --
  --          char *value = *(char **)(event_property->data);
  --
  --          Note that this is set to NULL if retrieving the property failed (the format will be MPV_FORMAT_NONE).
  --
  --          [C declaration]: @data@, defined at @mpv\/client.h 1413:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_event_property where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_event_property where
  readRaw =
    \ptr0 ->
      pure Mpv_event_property
        <*> HasCField.readRaw (BG.Proxy @"name") ptr0
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data'") ptr0

instance Marshal.WriteRaw Mpv_event_property where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_event_property name2 format3 data'4 ->
            HasCField.writeRaw (BG.Proxy @"name") ptr0 name2
              >> HasCField.writeRaw (BG.Proxy @"format") ptr0 format3
              >> HasCField.writeRaw (BG.Proxy @"data'") ptr0 data'4

deriving via Marshal.EquivStorable Mpv_event_property instance BG.Storable Mpv_event_property

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "name" Mpv_event_property ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_property{name = y1, format = BG.getField @"format" x0, data' = BG.getField @"data'" x0}
      , BG.getField @"name" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "name" (BG.Ptr Mpv_event_property) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"name")

instance HasCField.HasCField Mpv_event_property "name" where
  type
    CFieldType Mpv_event_property "name" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 0

instance
  (ty ~ Mpv_format)
  => BG.CompatHasField.HasField "format" Mpv_event_property ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_property{format = y1, name = BG.getField @"name" x0, data' = BG.getField @"data'" x0}
      , BG.getField @"format" x0
      )

instance
  (ty ~ Mpv_format)
  => BG.HasField "format" (BG.Ptr Mpv_event_property) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField Mpv_event_property "format" where
  type
    CFieldType Mpv_event_property "format" =
      Mpv_format

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "data'" Mpv_event_property ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_property{data' = y1, name = BG.getField @"name" x0, format = BG.getField @"format" x0}
      , BG.getField @"data'" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "data'" (BG.Ptr Mpv_event_property) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data'")

instance HasCField.HasCField Mpv_event_property "data'" where
  type
    CFieldType Mpv_event_property "data'" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 16

-- | Numeric log levels. The lower the number, the more important the message is. MPV_LOG_LEVEL_NONE is never used when receiving messages. The string in the comment after the value is the name of the log level as used for the @mpv_request_log_messages()@ function. Unused numeric values are unused, but reserved for future use.
--
--     [C declaration]: @enum mpv_log_level@, defined at @mpv\/client.h 1423:14@
newtype Mpv_log_level = Mpv_log_level
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize Mpv_log_level where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw Mpv_log_level where
  readRaw =
    \ptr0 ->
      pure Mpv_log_level
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw Mpv_log_level where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_log_level unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable Mpv_log_level instance BG.Storable Mpv_log_level

deriving via BG.CUInt instance BG.Prim Mpv_log_level

instance CEnum.CEnum Mpv_log_level where
  type CEnumZ Mpv_log_level = BG.CUInt

  toCEnum = Mpv_log_level

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "MPV_LOG_LEVEL_NONE")
        , (10, BG.singleton "MPV_LOG_LEVEL_FATAL")
        , (20, BG.singleton "MPV_LOG_LEVEL_ERROR")
        , (30, BG.singleton "MPV_LOG_LEVEL_WARN")
        , (40, BG.singleton "MPV_LOG_LEVEL_INFO")
        , (50, BG.singleton "MPV_LOG_LEVEL_V")
        , (60, BG.singleton "MPV_LOG_LEVEL_DEBUG")
        , (70, BG.singleton "MPV_LOG_LEVEL_TRACE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "Mpv_log_level"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "Mpv_log_level"

instance Show Mpv_log_level where
  showsPrec = CEnum.shows

instance Read Mpv_log_level where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" Mpv_log_level ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_log_level{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr Mpv_log_level) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_log_level "unwrap" where
  type CFieldType Mpv_log_level "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @MPV_LOG_LEVEL_NONE@, defined at @mpv\/client.h 1424:5@
pattern MPV_LOG_LEVEL_NONE :: Mpv_log_level
pattern MPV_LOG_LEVEL_NONE = Mpv_log_level 0

-- | \"no\" - disable absolutely all messages
--
--     [C declaration]: @MPV_LOG_LEVEL_FATAL@, defined at @mpv\/client.h 1425:5@
pattern MPV_LOG_LEVEL_FATAL :: Mpv_log_level
pattern MPV_LOG_LEVEL_FATAL = Mpv_log_level 10

-- | \"fatal\" - critical\/aborting errors
--
--     [C declaration]: @MPV_LOG_LEVEL_ERROR@, defined at @mpv\/client.h 1426:5@
pattern MPV_LOG_LEVEL_ERROR :: Mpv_log_level
pattern MPV_LOG_LEVEL_ERROR = Mpv_log_level 20

-- | \"error\" - simple errors
--
--     [C declaration]: @MPV_LOG_LEVEL_WARN@, defined at @mpv\/client.h 1427:5@
pattern MPV_LOG_LEVEL_WARN :: Mpv_log_level
pattern MPV_LOG_LEVEL_WARN = Mpv_log_level 30

-- | \"warn\" - possible problems
--
--     [C declaration]: @MPV_LOG_LEVEL_INFO@, defined at @mpv\/client.h 1428:5@
pattern MPV_LOG_LEVEL_INFO :: Mpv_log_level
pattern MPV_LOG_LEVEL_INFO = Mpv_log_level 40

-- | \"info\" - informational message
--
--     [C declaration]: @MPV_LOG_LEVEL_V@, defined at @mpv\/client.h 1429:5@
pattern MPV_LOG_LEVEL_V :: Mpv_log_level
pattern MPV_LOG_LEVEL_V = Mpv_log_level 50

-- | \"v\" - noisy informational message
--
--     [C declaration]: @MPV_LOG_LEVEL_DEBUG@, defined at @mpv\/client.h 1430:5@
pattern MPV_LOG_LEVEL_DEBUG :: Mpv_log_level
pattern MPV_LOG_LEVEL_DEBUG = Mpv_log_level 60

-- | \"debug\" - very noisy technical information
--
--     [C declaration]: @MPV_LOG_LEVEL_TRACE@, defined at @mpv\/client.h 1431:5@
pattern MPV_LOG_LEVEL_TRACE :: Mpv_log_level
pattern MPV_LOG_LEVEL_TRACE = Mpv_log_level 70

-- | [C declaration]: @struct mpv_event_log_message@, defined at @mpv\/client.h 1434:16@
data Mpv_event_log_message = Mpv_event_log_message
  { prefix :: PtrConst.PtrConst BG.CChar
  -- ^ The module prefix, identifies the sender of the message. As a special case, if the message buffer overflows, this will be set to the string \"overflow\" (which doesn\'t appear as prefix otherwise), and the text field will contain an informative message.
  --
  --          [C declaration]: @prefix@, defined at @mpv\/client.h 1441:17@
  , level :: PtrConst.PtrConst BG.CChar
  -- ^ The log level as string. See @mpv_request_log_messages()@ for possible values. The level \"no\" is never used here.
  --
  --          [C declaration]: @level@, defined at @mpv\/client.h 1446:17@
  , text :: PtrConst.PtrConst BG.CChar
  -- ^ The log message. It consists of 1 line of text, and is terminated with a newline character. (Before API version 1.6, it could contain multiple or partial lines.)
  --
  --          [C declaration]: @text@, defined at @mpv\/client.h 1452:17@
  , log_level :: Mpv_log_level
  -- ^ The same contents as the level field, but as a numeric ID. Since API version 1.6.
  --
  --          [C declaration]: @log_level@, defined at @mpv\/client.h 1457:19@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_event_log_message where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_event_log_message where
  readRaw =
    \ptr0 ->
      pure Mpv_event_log_message
        <*> HasCField.readRaw (BG.Proxy @"prefix") ptr0
        <*> HasCField.readRaw (BG.Proxy @"level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"text") ptr0
        <*> HasCField.readRaw (BG.Proxy @"log_level") ptr0

instance Marshal.WriteRaw Mpv_event_log_message where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_event_log_message prefix2 level3 text4 log_level5 ->
            HasCField.writeRaw (BG.Proxy @"prefix") ptr0 prefix2
              >> HasCField.writeRaw (BG.Proxy @"level") ptr0 level3
              >> HasCField.writeRaw (BG.Proxy @"text") ptr0 text4
              >> HasCField.writeRaw (BG.Proxy @"log_level") ptr0 log_level5

deriving via Marshal.EquivStorable Mpv_event_log_message instance BG.Storable Mpv_event_log_message

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "prefix" Mpv_event_log_message ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_log_message
            { prefix = y1
            , level = BG.getField @"level" x0
            , text = BG.getField @"text" x0
            , log_level = BG.getField @"log_level" x0
            }
      , BG.getField @"prefix" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "prefix" (BG.Ptr Mpv_event_log_message) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"prefix")

instance HasCField.HasCField Mpv_event_log_message "prefix" where
  type
    CFieldType Mpv_event_log_message "prefix" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 0

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "level" Mpv_event_log_message ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_log_message
            { level = y1
            , prefix = BG.getField @"prefix" x0
            , text = BG.getField @"text" x0
            , log_level = BG.getField @"log_level" x0
            }
      , BG.getField @"level" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "level" (BG.Ptr Mpv_event_log_message) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"level")

instance HasCField.HasCField Mpv_event_log_message "level" where
  type
    CFieldType Mpv_event_log_message "level" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 8

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "text" Mpv_event_log_message ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_log_message
            { text = y1
            , prefix = BG.getField @"prefix" x0
            , level = BG.getField @"level" x0
            , log_level = BG.getField @"log_level" x0
            }
      , BG.getField @"text" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "text" (BG.Ptr Mpv_event_log_message) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"text")

instance HasCField.HasCField Mpv_event_log_message "text" where
  type
    CFieldType Mpv_event_log_message "text" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 16

instance
  (ty ~ Mpv_log_level)
  => BG.CompatHasField.HasField "log_level" Mpv_event_log_message ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_log_message
            { log_level = y1
            , prefix = BG.getField @"prefix" x0
            , level = BG.getField @"level" x0
            , text = BG.getField @"text" x0
            }
      , BG.getField @"log_level" x0
      )

instance
  (ty ~ Mpv_log_level)
  => BG.HasField "log_level" (BG.Ptr Mpv_event_log_message) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"log_level")

instance HasCField.HasCField Mpv_event_log_message "log_level" where
  type
    CFieldType Mpv_event_log_message "log_level" =
      Mpv_log_level

  offset# = \_ -> \_ -> 24

-- | Since API version 1.9.
--
--     [C declaration]: @enum mpv_end_file_reason@, defined at @mpv\/client.h 1461:14@
newtype Mpv_end_file_reason = Mpv_end_file_reason
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize Mpv_end_file_reason where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw Mpv_end_file_reason where
  readRaw =
    \ptr0 ->
      pure Mpv_end_file_reason
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw Mpv_end_file_reason where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_end_file_reason unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable Mpv_end_file_reason instance BG.Storable Mpv_end_file_reason

deriving via BG.CUInt instance BG.Prim Mpv_end_file_reason

instance CEnum.CEnum Mpv_end_file_reason where
  type CEnumZ Mpv_end_file_reason = BG.CUInt

  toCEnum = Mpv_end_file_reason

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "MPV_END_FILE_REASON_EOF")
        , (2, BG.singleton "MPV_END_FILE_REASON_STOP")
        , (3, BG.singleton "MPV_END_FILE_REASON_QUIT")
        , (4, BG.singleton "MPV_END_FILE_REASON_ERROR")
        , (5, BG.singleton "MPV_END_FILE_REASON_REDIRECT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "Mpv_end_file_reason"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "Mpv_end_file_reason"

instance Show Mpv_end_file_reason where
  showsPrec = CEnum.shows

instance Read Mpv_end_file_reason where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" Mpv_end_file_reason ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_end_file_reason{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr Mpv_end_file_reason) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_end_file_reason "unwrap" where
  type
    CFieldType Mpv_end_file_reason "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | The end of file was reached. Sometimes this may also happen on incomplete or corrupted files, or if the network connection was interrupted when playing a remote file. It also happens if the playback range was restricted with end or frames or similar.
--
--     [C declaration]: @MPV_END_FILE_REASON_EOF@, defined at @mpv\/client.h 1468:5@
pattern MPV_END_FILE_REASON_EOF :: Mpv_end_file_reason
pattern MPV_END_FILE_REASON_EOF = Mpv_end_file_reason 0

-- | Playback was stopped by an external action (e.g. playlist controls).
--
--     [C declaration]: @MPV_END_FILE_REASON_STOP@, defined at @mpv\/client.h 1472:5@
pattern MPV_END_FILE_REASON_STOP :: Mpv_end_file_reason
pattern MPV_END_FILE_REASON_STOP = Mpv_end_file_reason 2

-- | Playback was stopped by the quit command or player shutdown.
--
--     [C declaration]: @MPV_END_FILE_REASON_QUIT@, defined at @mpv\/client.h 1476:5@
pattern MPV_END_FILE_REASON_QUIT :: Mpv_end_file_reason
pattern MPV_END_FILE_REASON_QUIT = Mpv_end_file_reason 3

-- | Some kind of error happened that lead to playback abort. Does not necessarily happen on incomplete or broken files (in these cases, both MPV_END_FILE_REASON_ERROR or MPV_END_FILE_REASON_EOF are possible).
--
--     @mpv_event_end_file.error@ will be set.
--
--     [C declaration]: @MPV_END_FILE_REASON_ERROR@, defined at @mpv\/client.h 1484:5@
pattern MPV_END_FILE_REASON_ERROR :: Mpv_end_file_reason
pattern MPV_END_FILE_REASON_ERROR = Mpv_end_file_reason 4

-- | The file was a playlist or similar. When the playlist is read, its entries will be appended to the playlist after the entry of the current file, the entry of the current file is removed, and a MPV_EVENT_END_FILE event is sent with reason set to MPV_END_FILE_REASON_REDIRECT. Then playback continues with the playlist contents. Since API version 1.18.
--
--     [C declaration]: @MPV_END_FILE_REASON_REDIRECT@, defined at @mpv\/client.h 1493:5@
pattern MPV_END_FILE_REASON_REDIRECT :: Mpv_end_file_reason
pattern MPV_END_FILE_REASON_REDIRECT = Mpv_end_file_reason 5

-- | Since API version 1.108.
--
--     [C declaration]: @struct mpv_event_start_file@, defined at @mpv\/client.h 1497:16@
data Mpv_event_start_file = Mpv_event_start_file
  { playlist_entry_id :: HsBindgen.Runtime.LibC.Int64
  -- ^ Playlist entry ID of the file being loaded now.
  --
  --          [C declaration]: @playlist_entry_id@, defined at @mpv\/client.h 1501:13@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_event_start_file where
  staticSizeOf = \_ -> (8 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_event_start_file where
  readRaw =
    \ptr0 ->
      pure Mpv_event_start_file
        <*> HasCField.readRaw (BG.Proxy @"playlist_entry_id") ptr0

instance Marshal.WriteRaw Mpv_event_start_file where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_event_start_file playlist_entry_id2 ->
            HasCField.writeRaw (BG.Proxy @"playlist_entry_id") ptr0 playlist_entry_id2

deriving via Marshal.EquivStorable Mpv_event_start_file instance BG.Storable Mpv_event_start_file

instance
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.CompatHasField.HasField "playlist_entry_id" Mpv_event_start_file ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_start_file{playlist_entry_id = y1}
      , BG.getField @"playlist_entry_id" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.HasField "playlist_entry_id" (BG.Ptr Mpv_event_start_file) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"playlist_entry_id")

instance HasCField.HasCField Mpv_event_start_file "playlist_entry_id" where
  type
    CFieldType Mpv_event_start_file "playlist_entry_id" =
      HsBindgen.Runtime.LibC.Int64

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @struct mpv_event_end_file@, defined at @mpv\/client.h 1504:16@
data Mpv_event_end_file = Mpv_event_end_file
  { reason :: Mpv_end_file_reason
  -- ^ Corresponds to the values in enum 'Mpv_end_file_reason'.
  --
  --          Unknown values should be treated as unknown.
  --
  --          [C declaration]: @reason@, defined at @mpv\/client.h 1510:25@
  , error :: BG.CInt
  -- ^ If reason==MPV_END_FILE_REASON_ERROR, this contains a mpv error code (one of MPV_ERROR_...) giving an approximate reason why playback failed. In other cases, this field is 0 (no error). Since API version 1.9.
  --
  --          [C declaration]: @error@, defined at @mpv\/client.h 1517:9@
  , playlist_entry_id :: HsBindgen.Runtime.LibC.Int64
  -- ^ Playlist entry ID of the file that was being played or attempted to be played. This has the same value as the playlist_entry_id field in the corresponding 'Mpv_event_start_file' event. Since API version 1.108.
  --
  --          [C declaration]: @playlist_entry_id@, defined at @mpv\/client.h 1524:13@
  , playlist_insert_id :: HsBindgen.Runtime.LibC.Int64
  -- ^ If loading ended, because the playlist entry to be played was for example a playlist, and the current playlist entry is replaced with a number of other entries. This may happen at least with MPV_END_FILE_REASON_REDIRECT (other event types may use this for similar but different purposes in the future). In this case, playlist_insert_id will be set to the playlist entry ID of the first inserted entry, and playlist_insert_num_entries to the total number of inserted playlist entries. Note this in this specific case, the ID of the last inserted entry is playlist_insert_id+num-1. Beware that depending on circumstances, you may observe the new playlist entries before seeing the event (e.g. reading the \"playlist\" property or getting a property change notification before receiving the event). Since API version 1.108.
  --
  --          [C declaration]: @playlist_insert_id@, defined at @mpv\/client.h 1539:13@
  , playlist_insert_num_entries :: BG.CInt
  -- ^ See playlist_insert_id. Only non-0 if playlist_insert_id is valid. Never negative. Since API version 1.108.
  --
  --          [C declaration]: @playlist_insert_num_entries@, defined at @mpv\/client.h 1545:9@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_event_end_file where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_event_end_file where
  readRaw =
    \ptr0 ->
      pure Mpv_event_end_file
        <*> HasCField.readRaw (BG.Proxy @"reason") ptr0
        <*> HasCField.readRaw (BG.Proxy @"error") ptr0
        <*> HasCField.readRaw (BG.Proxy @"playlist_entry_id") ptr0
        <*> HasCField.readRaw (BG.Proxy @"playlist_insert_id") ptr0
        <*> HasCField.readRaw (BG.Proxy @"playlist_insert_num_entries") ptr0

instance Marshal.WriteRaw Mpv_event_end_file where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_event_end_file
            reason2
            error3
            playlist_entry_id4
            playlist_insert_id5
            playlist_insert_num_entries6 ->
              HasCField.writeRaw (BG.Proxy @"reason") ptr0 reason2
                >> HasCField.writeRaw (BG.Proxy @"error") ptr0 error3
                >> HasCField.writeRaw (BG.Proxy @"playlist_entry_id") ptr0 playlist_entry_id4
                >> HasCField.writeRaw (BG.Proxy @"playlist_insert_id") ptr0 playlist_insert_id5
                >> HasCField.writeRaw (BG.Proxy @"playlist_insert_num_entries") ptr0 playlist_insert_num_entries6

deriving via Marshal.EquivStorable Mpv_event_end_file instance BG.Storable Mpv_event_end_file

instance
  (ty ~ Mpv_end_file_reason)
  => BG.CompatHasField.HasField "reason" Mpv_event_end_file ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_end_file
            { reason = y1
            , error = BG.getField @"error" x0
            , playlist_entry_id = BG.getField @"playlist_entry_id" x0
            , playlist_insert_id = BG.getField @"playlist_insert_id" x0
            , playlist_insert_num_entries = BG.getField @"playlist_insert_num_entries" x0
            }
      , BG.getField @"reason" x0
      )

instance
  (ty ~ Mpv_end_file_reason)
  => BG.HasField "reason" (BG.Ptr Mpv_event_end_file) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reason")

instance HasCField.HasCField Mpv_event_end_file "reason" where
  type
    CFieldType Mpv_event_end_file "reason" =
      Mpv_end_file_reason

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "error" Mpv_event_end_file ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_end_file
            { error = y1
            , reason = BG.getField @"reason" x0
            , playlist_entry_id = BG.getField @"playlist_entry_id" x0
            , playlist_insert_id = BG.getField @"playlist_insert_id" x0
            , playlist_insert_num_entries = BG.getField @"playlist_insert_num_entries" x0
            }
      , BG.getField @"error" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "error" (BG.Ptr Mpv_event_end_file) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"error")

instance HasCField.HasCField Mpv_event_end_file "error" where
  type CFieldType Mpv_event_end_file "error" = BG.CInt

  offset# = \_ -> \_ -> 4

instance
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.CompatHasField.HasField "playlist_entry_id" Mpv_event_end_file ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_end_file
            { playlist_entry_id = y1
            , reason = BG.getField @"reason" x0
            , error = BG.getField @"error" x0
            , playlist_insert_id = BG.getField @"playlist_insert_id" x0
            , playlist_insert_num_entries = BG.getField @"playlist_insert_num_entries" x0
            }
      , BG.getField @"playlist_entry_id" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.HasField "playlist_entry_id" (BG.Ptr Mpv_event_end_file) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"playlist_entry_id")

instance HasCField.HasCField Mpv_event_end_file "playlist_entry_id" where
  type
    CFieldType Mpv_event_end_file "playlist_entry_id" =
      HsBindgen.Runtime.LibC.Int64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.CompatHasField.HasField "playlist_insert_id" Mpv_event_end_file ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_end_file
            { playlist_insert_id = y1
            , reason = BG.getField @"reason" x0
            , error = BG.getField @"error" x0
            , playlist_entry_id = BG.getField @"playlist_entry_id" x0
            , playlist_insert_num_entries = BG.getField @"playlist_insert_num_entries" x0
            }
      , BG.getField @"playlist_insert_id" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.HasField "playlist_insert_id" (BG.Ptr Mpv_event_end_file) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"playlist_insert_id")

instance HasCField.HasCField Mpv_event_end_file "playlist_insert_id" where
  type
    CFieldType Mpv_event_end_file "playlist_insert_id" =
      HsBindgen.Runtime.LibC.Int64

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "playlist_insert_num_entries" Mpv_event_end_file ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_end_file
            { playlist_insert_num_entries = y1
            , reason = BG.getField @"reason" x0
            , error = BG.getField @"error" x0
            , playlist_entry_id = BG.getField @"playlist_entry_id" x0
            , playlist_insert_id = BG.getField @"playlist_insert_id" x0
            }
      , BG.getField @"playlist_insert_num_entries" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "playlist_insert_num_entries" (BG.Ptr Mpv_event_end_file) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"playlist_insert_num_entries")

instance HasCField.HasCField Mpv_event_end_file "playlist_insert_num_entries" where
  type
    CFieldType Mpv_event_end_file "playlist_insert_num_entries" =
      BG.CInt

  offset# = \_ -> \_ -> 24

-- | [C declaration]: @struct mpv_event_client_message@, defined at @mpv\/client.h 1548:16@
data Mpv_event_client_message = Mpv_event_client_message
  { num_args :: BG.CInt
  -- ^ Arbitrary arguments chosen by the sender of the message. If num_args > 0, you can access args[0] through args[num_args - 1] (inclusive). What these arguments mean is up to the sender and receiver. None of the valid items are NULL.
  --
  --          [C declaration]: @num_args@, defined at @mpv\/client.h 1555:9@
  , args :: BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^ [C declaration]: @args@, defined at @mpv\/client.h 1556:18@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_event_client_message where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_event_client_message where
  readRaw =
    \ptr0 ->
      pure Mpv_event_client_message
        <*> HasCField.readRaw (BG.Proxy @"num_args") ptr0
        <*> HasCField.readRaw (BG.Proxy @"args") ptr0

instance Marshal.WriteRaw Mpv_event_client_message where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_event_client_message num_args2 args3 ->
            HasCField.writeRaw (BG.Proxy @"num_args") ptr0 num_args2
              >> HasCField.writeRaw (BG.Proxy @"args") ptr0 args3

deriving via
  Marshal.EquivStorable Mpv_event_client_message
  instance
    BG.Storable Mpv_event_client_message

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "num_args" Mpv_event_client_message ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_client_message{num_args = y1, args = BG.getField @"args" x0}
      , BG.getField @"num_args" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "num_args" (BG.Ptr Mpv_event_client_message) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"num_args")

instance HasCField.HasCField Mpv_event_client_message "num_args" where
  type
    CFieldType Mpv_event_client_message "num_args" =
      BG.CInt

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.Ptr (PtrConst.PtrConst BG.CChar))
  => BG.CompatHasField.HasField "args" Mpv_event_client_message ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_client_message{args = y1, num_args = BG.getField @"num_args" x0}
      , BG.getField @"args" x0
      )

instance
  (ty ~ BG.Ptr (PtrConst.PtrConst BG.CChar))
  => BG.HasField "args" (BG.Ptr Mpv_event_client_message) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"args")

instance HasCField.HasCField Mpv_event_client_message "args" where
  type
    CFieldType Mpv_event_client_message "args" =
      BG.Ptr (PtrConst.PtrConst BG.CChar)

  offset# = \_ -> \_ -> 8

-- | [C declaration]: @struct mpv_event_hook@, defined at @mpv\/client.h 1559:16@
data Mpv_event_hook = Mpv_event_hook
  { name :: PtrConst.PtrConst BG.CChar
  -- ^ The hook name as passed to @mpv_hook_add()@.
  --
  --          [C declaration]: @name@, defined at @mpv\/client.h 1563:17@
  , id :: HsBindgen.Runtime.LibC.Word64
  -- ^ Internal ID that must be passed to @mpv_hook_continue()@.
  --
  --          [C declaration]: @id@, defined at @mpv\/client.h 1567:14@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_event_hook where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_event_hook where
  readRaw =
    \ptr0 ->
      pure Mpv_event_hook
        <*> HasCField.readRaw (BG.Proxy @"name") ptr0
        <*> HasCField.readRaw (BG.Proxy @"id") ptr0

instance Marshal.WriteRaw Mpv_event_hook where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_event_hook name2 id3 ->
            HasCField.writeRaw (BG.Proxy @"name") ptr0 name2
              >> HasCField.writeRaw (BG.Proxy @"id") ptr0 id3

deriving via Marshal.EquivStorable Mpv_event_hook instance BG.Storable Mpv_event_hook

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "name" Mpv_event_hook ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_hook{name = y1, id = BG.getField @"id" x0}
      , BG.getField @"name" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "name" (BG.Ptr Mpv_event_hook) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"name")

instance HasCField.HasCField Mpv_event_hook "name" where
  type
    CFieldType Mpv_event_hook "name" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 0

instance
  (ty ~ HsBindgen.Runtime.LibC.Word64)
  => BG.CompatHasField.HasField "id" Mpv_event_hook ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_hook{id = y1, name = BG.getField @"name" x0}
      , BG.getField @"id" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Word64)
  => BG.HasField "id" (BG.Ptr Mpv_event_hook) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"id")

instance HasCField.HasCField Mpv_event_hook "id" where
  type
    CFieldType Mpv_event_hook "id" =
      HsBindgen.Runtime.LibC.Word64

  offset# = \_ -> \_ -> 8

-- | [C declaration]: @struct mpv_event_command@, defined at @mpv\/client.h 1571:16@
data Mpv_event_command = Mpv_event_command
  { result :: Mpv_node
  -- ^ Result data of the command. Note that success\/failure is signaled separately via @mpv_event.error@. This field is only for result data in case of success. Most commands leave it at MPV_FORMAT_NONE. Set to MPV_FORMAT_NONE on failure.
  --
  --          [C declaration]: @result@, defined at @mpv\/client.h 1578:14@
  }
  deriving stock (BG.Generic)

instance Marshal.StaticSize Mpv_event_command where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_event_command where
  readRaw =
    \ptr0 ->
      pure Mpv_event_command
        <*> HasCField.readRaw (BG.Proxy @"result") ptr0

instance Marshal.WriteRaw Mpv_event_command where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_event_command result2 ->
            HasCField.writeRaw (BG.Proxy @"result") ptr0 result2

deriving via Marshal.EquivStorable Mpv_event_command instance BG.Storable Mpv_event_command

instance
  (ty ~ Mpv_node)
  => BG.CompatHasField.HasField "result" Mpv_event_command ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event_command{result = y1}
      , BG.getField @"result" x0
      )

instance
  (ty ~ Mpv_node)
  => BG.HasField "result" (BG.Ptr Mpv_event_command) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"result")

instance HasCField.HasCField Mpv_event_command "result" where
  type CFieldType Mpv_event_command "result" = Mpv_node

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @struct mpv_event@, defined at @mpv\/client.h 1581:16@
data Mpv_event = Mpv_event
  { event_id :: Mpv_event_id
  -- ^ One of 'Mpv_event'. Keep in mind that later ABI compatible releases might add new event types. These should be ignored by the API user.
  --
  --          [C declaration]: @event_id@, defined at @mpv\/client.h 1586:18@
  , error :: BG.CInt
  -- ^ This is mainly used for events that are replies to (asynchronous) requests. It contains a status code, which is >= 0 on success, or \< 0 on error (a 'Mpv_error' value). Usually, this will be set if an asynchronous request fails. Used for: MPV_EVENT_GET_PROPERTY_REPLY MPV_EVENT_SET_PROPERTY_REPLY MPV_EVENT_COMMAND_REPLY
  --
  --          [C declaration]: @error@, defined at @mpv\/client.h 1597:9@
  , reply_userdata :: HsBindgen.Runtime.LibC.Word64
  -- ^ If the event is in reply to a request (made with this API and this API handle), this is set to the reply_userdata parameter of the request call. Otherwise, this field is 0. Used for: MPV_EVENT_GET_PROPERTY_REPLY MPV_EVENT_SET_PROPERTY_REPLY MPV_EVENT_COMMAND_REPLY MPV_EVENT_PROPERTY_CHANGE MPV_EVENT_HOOK
  --
  --          [C declaration]: @reply_userdata@, defined at @mpv\/client.h 1609:14@
  , data' :: BG.Ptr BG.Void
  -- ^ The meaning and contents of the data member depend on the event_id: MPV_EVENT_GET_PROPERTY_REPLY: mpv_event_property* MPV_EVENT_PROPERTY_CHANGE: mpv_event_property* MPV_EVENT_LOG_MESSAGE: mpv_event_log_message* MPV_EVENT_CLIENT_MESSAGE: mpv_event_client_message* MPV_EVENT_START_FILE: mpv_event_start_file* (since v1.108) MPV_EVENT_END_FILE: mpv_event_end_file* MPV_EVENT_HOOK: mpv_event_hook* MPV_EVENT_COMMAND_REPLY* mpv_event_command* other: NULL
  --
  --          Note: future enhancements might add new event structs for existing or new event types.
  --
  --          [C declaration]: @data@, defined at @mpv\/client.h 1625:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_event where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_event where
  readRaw =
    \ptr0 ->
      pure Mpv_event
        <*> HasCField.readRaw (BG.Proxy @"event_id") ptr0
        <*> HasCField.readRaw (BG.Proxy @"error") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reply_userdata") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data'") ptr0

instance Marshal.WriteRaw Mpv_event where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_event event_id2 error3 reply_userdata4 data'5 ->
            HasCField.writeRaw (BG.Proxy @"event_id") ptr0 event_id2
              >> HasCField.writeRaw (BG.Proxy @"error") ptr0 error3
              >> HasCField.writeRaw (BG.Proxy @"reply_userdata") ptr0 reply_userdata4
              >> HasCField.writeRaw (BG.Proxy @"data'") ptr0 data'5

deriving via Marshal.EquivStorable Mpv_event instance BG.Storable Mpv_event

instance
  (ty ~ Mpv_event_id)
  => BG.CompatHasField.HasField "event_id" Mpv_event ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event
            { event_id = y1
            , error = BG.getField @"error" x0
            , reply_userdata = BG.getField @"reply_userdata" x0
            , data' = BG.getField @"data'" x0
            }
      , BG.getField @"event_id" x0
      )

instance
  (ty ~ Mpv_event_id)
  => BG.HasField "event_id" (BG.Ptr Mpv_event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"event_id")

instance HasCField.HasCField Mpv_event "event_id" where
  type CFieldType Mpv_event "event_id" = Mpv_event_id

  offset# = \_ -> \_ -> 0

instance (ty ~ BG.CInt) => BG.CompatHasField.HasField "error" Mpv_event ty where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event
            { error = y1
            , event_id = BG.getField @"event_id" x0
            , reply_userdata = BG.getField @"reply_userdata" x0
            , data' = BG.getField @"data'" x0
            }
      , BG.getField @"error" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "error" (BG.Ptr Mpv_event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"error")

instance HasCField.HasCField Mpv_event "error" where
  type CFieldType Mpv_event "error" = BG.CInt

  offset# = \_ -> \_ -> 4

instance
  (ty ~ HsBindgen.Runtime.LibC.Word64)
  => BG.CompatHasField.HasField "reply_userdata" Mpv_event ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event
            { reply_userdata = y1
            , event_id = BG.getField @"event_id" x0
            , error = BG.getField @"error" x0
            , data' = BG.getField @"data'" x0
            }
      , BG.getField @"reply_userdata" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Word64)
  => BG.HasField "reply_userdata" (BG.Ptr Mpv_event) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"reply_userdata")

instance HasCField.HasCField Mpv_event "reply_userdata" where
  type
    CFieldType Mpv_event "reply_userdata" =
      HsBindgen.Runtime.LibC.Word64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "data'" Mpv_event ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_event
            { data' = y1
            , event_id = BG.getField @"event_id" x0
            , error = BG.getField @"error" x0
            , reply_userdata = BG.getField @"reply_userdata" x0
            }
      , BG.getField @"data'" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "data'" (BG.Ptr Mpv_event) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data'")

instance HasCField.HasCField Mpv_event "data'" where
  type CFieldType Mpv_event "data'" = BG.Ptr BG.Void

  offset# = \_ -> \_ -> 16

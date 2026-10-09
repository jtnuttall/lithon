{-# LANGUAGE NoImplicitPrelude #-}

-- | Core client API: handles, options, commands, properties, events.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @Mpv.Sys.Bindgen.Client.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "Mpv.Sys".
--
--     == Reading events
--
--     'Mpv_event' carries its payload behind an untyped pointer, the @data\'@ field (C\'s @data@): read @event_id@ first, then cast @data\'@ to a pointer to the struct that event documents ('Mpv_event_end_file' for 'MPV_EVENT_END_FILE', 'Mpv_event_property' for 'MPV_EVENT_PROPERTY_CHANGE', …; the other events leave it null). The event belongs to libmpv and stays valid until the next wait on the same handle. The @mpv-headless@ example in the repository shows the full idiom; 'waitEventSafe' and the @MPV_EVENT_*@ patterns live in this module.
module Mpv.Sys.Client (
  module Mpv.Sys.Bindgen.Client,

  -- * Function aliases
  Mpv.Sys.Client.errorString,
  Mpv.Sys.Client.free,
  Mpv.Sys.Client.clientName,
  Mpv.Sys.Client.clientId,
  Mpv.Sys.Client.create,
  Mpv.Sys.Client.createSafe,
  Mpv.Sys.Client.initialize,
  Mpv.Sys.Client.initializeSafe,
  Mpv.Sys.Client.destroy,
  Mpv.Sys.Client.destroySafe,
  Mpv.Sys.Client.terminateDestroy,
  Mpv.Sys.Client.terminateDestroySafe,
  Mpv.Sys.Client.createClient,
  Mpv.Sys.Client.createClientSafe,
  Mpv.Sys.Client.createWeakClient,
  Mpv.Sys.Client.createWeakClientSafe,
  Mpv.Sys.Client.loadConfigFile,
  Mpv.Sys.Client.loadConfigFileSafe,
  Mpv.Sys.Client.getTimeNs,
  Mpv.Sys.Client.getTimeUs,
  Mpv.Sys.Client.freeNodeContents,
  Mpv.Sys.Client.setOption,
  Mpv.Sys.Client.setOptionSafe,
  Mpv.Sys.Client.setOptionString,
  Mpv.Sys.Client.setOptionStringSafe,
  Mpv.Sys.Client.command,
  Mpv.Sys.Client.commandSafe,
  Mpv.Sys.Client.commandNode,
  Mpv.Sys.Client.commandNodeSafe,
  Mpv.Sys.Client.commandRet,
  Mpv.Sys.Client.commandRetSafe,
  Mpv.Sys.Client.commandString,
  Mpv.Sys.Client.commandStringSafe,
  Mpv.Sys.Client.commandAsync,
  Mpv.Sys.Client.commandAsyncSafe,
  Mpv.Sys.Client.commandNodeAsync,
  Mpv.Sys.Client.commandNodeAsyncSafe,
  Mpv.Sys.Client.abortAsyncCommand,
  Mpv.Sys.Client.abortAsyncCommandSafe,
  Mpv.Sys.Client.setProperty,
  Mpv.Sys.Client.setPropertySafe,
  Mpv.Sys.Client.setPropertyString,
  Mpv.Sys.Client.setPropertyStringSafe,
  Mpv.Sys.Client.delProperty,
  Mpv.Sys.Client.delPropertySafe,
  Mpv.Sys.Client.setPropertyAsync,
  Mpv.Sys.Client.setPropertyAsyncSafe,
  Mpv.Sys.Client.getProperty,
  Mpv.Sys.Client.getPropertySafe,
  Mpv.Sys.Client.getPropertyString,
  Mpv.Sys.Client.getPropertyStringSafe,
  Mpv.Sys.Client.getPropertyOsdString,
  Mpv.Sys.Client.getPropertyOsdStringSafe,
  Mpv.Sys.Client.getPropertyAsync,
  Mpv.Sys.Client.getPropertyAsyncSafe,
  Mpv.Sys.Client.observeProperty,
  Mpv.Sys.Client.observePropertySafe,
  Mpv.Sys.Client.unobserveProperty,
  Mpv.Sys.Client.unobservePropertySafe,
  Mpv.Sys.Client.eventName,
  Mpv.Sys.Client.eventToNode,
  Mpv.Sys.Client.requestEvent,
  Mpv.Sys.Client.requestEventSafe,
  Mpv.Sys.Client.requestLogMessages,
  Mpv.Sys.Client.requestLogMessagesSafe,
  Mpv.Sys.Client.waitEvent,
  Mpv.Sys.Client.waitEventSafe,
  Mpv.Sys.Client.wakeup,
  Mpv.Sys.Client.wakeupSafe,
  Mpv.Sys.Client.setWakeupCallbackSafe,
  Mpv.Sys.Client.waitAsyncRequests,
  Mpv.Sys.Client.waitAsyncRequestsSafe,
  Mpv.Sys.Client.hookAdd,
  Mpv.Sys.Client.hookAddSafe,
  Mpv.Sys.Client.hookContinue,
  Mpv.Sys.Client.hookContinueSafe,
  Mpv.Sys.Client.getWakeupPipe,
  Mpv.Sys.Client.getWakeupPipeSafe,
)
where

import Data.Coerce qualified as Coerce
import Prelude (Double, IO, fmap)

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import Mpv.Sys.Bindgen.Client
import Mpv.Sys.Bindgen.Client.Safe qualified as Safe
import Mpv.Sys.Bindgen.Client.Unsafe qualified as Unsafe

-- | Return a string describing the error. For unknown errors, the string \"unknown error\" is returned.
--
--     [Returns]: A static string describing the error. The string is completely static, i.e. doesn\'t need to be deallocated, and is valid forever.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_error_string@.
--                   The safe import is not exported
--                   : returns a static string; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_error_string@, defined at @mpv\/client.h 390:24@
errorString
  :: BG.Int32
  -- ^
  --
  --           [@error@]: error number, see enum 'Mpv_error'
  -> IO (PtrConst.PtrConst BG.CChar)
errorString =
  \x00 -> Unsafe.mpv_error_string (Coerce.coerce x00)

-- | General function to deallocate memory returned by some of the API functions. Call this only if it\'s explicitly documented as allowed. Calling this on mpv memory not owned by the caller will lead to undefined behavior.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_free@.
--                   The safe import is not exported
--                   : frees memory the API returned; cannot block or call back.
--
--     [C declaration]: @mpv_free@, defined at @mpv\/client.h 399:17@
free
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@data@]: A valid pointer returned by the API, or NULL.
  -> IO ()
free = Unsafe.mpv_free

-- | Return the name of this client handle. Every client has its own unique name, which is mostly used for user interface purposes.
--
--     [Returns]: The client name. The string is read-only and is valid until the 'Mpv_handle' is destroyed.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_client_name@.
--                   The safe import is not exported
--                   : reads a field of the handle; cannot block, lock, or call back.
--
--     [C declaration]: @mpv_client_name@, defined at @mpv\/client.h 408:24@
clientName
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO (PtrConst.PtrConst BG.CChar)
clientName = Unsafe.mpv_client_name

-- | Return the ID of this client handle. Every client has its own unique ID. This ID is never reused by the core, even if the 'Mpv_handle' at hand gets destroyed and new handles get allocated.
--
--     IDs are never 0 or negative.
--
--     Some mpv APIs (not necessarily all) accept a name in the form \"\@\<id>\" in addition of the proper @'clientName'@, where \"\<id>\" is the ID in decimal form (e.g. \"\@123\"). For example, the \"script-message-to\" command takes the client name as first argument, but also accepts the client ID formatted in this manner.
--
--     [Returns]: The client ID.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_client_id@.
--                   The safe import is not exported
--                   : reads a field of the handle; cannot block, lock, or call back.
--
--     [C declaration]: @mpv_client_id@, defined at @mpv\/client.h 425:20@
clientId
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO HsBindgen.Runtime.LibC.Int64
clientId = Unsafe.mpv_client_id

-- | Create a new mpv instance and an associated client API handle to control the mpv instance. This instance is in a pre-initialized state, and needs to be initialized to be actually used with most other API functions.
--
--     Some API functions will return MPV_ERROR_UNINITIALIZED in the uninitialized state. You can call @'setProperty'@ (or @'setPropertyString'@ and other variants, and before mpv 0.21.0 @'setOption'@ etc.) to set initial options. After this, call @'initialize'@ to start the player, and then use e.g. @'command'@ to start playback of a file.
--
--     The point of separating handle creation and actual initialization is that you can configure things which can\'t be changed during runtime.
--
--     Unlike the command line player, this will have initial settings suitable for embedding in applications. The following settings are different:
--
--     * stdin\/stdout\/stderr and the terminal will never be accessed. This is equivalent to setting the no-terminal option. (Technically, this also suppresses C signal handling.)
--
--     * No config files will be loaded. This is roughly equivalent to using config=no. Since libmpv 1.15, you can actually re-enable this option, which will make libmpv load config files during @'initialize'@. If you do this, you are strongly encouraged to set the \"config-dir\" option too. (Otherwise it will load the mpv command line player\'s config.) For example: mpv_set_option_string(mpv, \"config-dir\", \"\/my\/path\"); \/\/ set config root mpv_set_option_string(mpv, \"config\", \"yes\"); \/\/ enable config loading (call @'initialize'@ /after/ this)
--
--     * Idle mode is enabled, which means the playback core will enter idle mode if there are no more files to play on the internal playlist, instead of exiting. This is equivalent to the idle option.
--
--     * Disable parts of input handling.
--
--     * Most of the different settings can be viewed with the command line player by running \"mpv --show-profile=libmpv\".
--
--     All this assumes that API users want a mpv instance that is strictly isolated from the command line player\'s configuration, user settings, and so on. You can re-enable disabled features by setting the appropriate options.
--
--     The mpv command line parser is not available through this API, but you can set individual options with @'setProperty'@. Files for playback must be loaded with @'command'@ or others.
--
--     Note that you should avoid doing concurrent accesses on the uninitialized client handle. (Whether concurrent access is definitely allowed or not has yet to be decided.)
--
--     [Returns]: a new mpv client API handle. Returns NULL on error. Currently, this can happen in the following situations:
--                * out of memory
--                * LC_NUMERIC is not set to \"C\" (see general remarks)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_create@.
--                   The safe flavor is 'createSafe'
--                   : allocates a whole player core and starts its thread; nothing can be registered yet, so it cannot call back.
--
--     [C declaration]: @mpv_create@, defined at @mpv\/client.h 481:24@
create :: IO (BG.Ptr Mpv_handle)
create = Unsafe.mpv_create

-- | Create a new mpv instance and an associated client API handle to control the mpv instance. This instance is in a pre-initialized state, and needs to be initialized to be actually used with most other API functions.
--
--     Some API functions will return MPV_ERROR_UNINITIALIZED in the uninitialized state. You can call @'setProperty'@ (or @'setPropertyString'@ and other variants, and before mpv 0.21.0 @'setOption'@ etc.) to set initial options. After this, call @'initialize'@ to start the player, and then use e.g. @'command'@ to start playback of a file.
--
--     The point of separating handle creation and actual initialization is that you can configure things which can\'t be changed during runtime.
--
--     Unlike the command line player, this will have initial settings suitable for embedding in applications. The following settings are different:
--
--     * stdin\/stdout\/stderr and the terminal will never be accessed. This is equivalent to setting the no-terminal option. (Technically, this also suppresses C signal handling.)
--
--     * No config files will be loaded. This is roughly equivalent to using config=no. Since libmpv 1.15, you can actually re-enable this option, which will make libmpv load config files during @'initialize'@. If you do this, you are strongly encouraged to set the \"config-dir\" option too. (Otherwise it will load the mpv command line player\'s config.) For example: mpv_set_option_string(mpv, \"config-dir\", \"\/my\/path\"); \/\/ set config root mpv_set_option_string(mpv, \"config\", \"yes\"); \/\/ enable config loading (call @'initialize'@ /after/ this)
--
--     * Idle mode is enabled, which means the playback core will enter idle mode if there are no more files to play on the internal playlist, instead of exiting. This is equivalent to the idle option.
--
--     * Disable parts of input handling.
--
--     * Most of the different settings can be viewed with the command line player by running \"mpv --show-profile=libmpv\".
--
--     All this assumes that API users want a mpv instance that is strictly isolated from the command line player\'s configuration, user settings, and so on. You can re-enable disabled features by setting the appropriate options.
--
--     The mpv command line parser is not available through this API, but you can set individual options with @'setProperty'@. Files for playback must be loaded with @'command'@ or others.
--
--     Note that you should avoid doing concurrent accesses on the uninitialized client handle. (Whether concurrent access is definitely allowed or not has yet to be decided.)
--
--     [Returns]: a new mpv client API handle. Returns NULL on error. Currently, this can happen in the following situations:
--                * out of memory
--                * LC_NUMERIC is not set to \"C\" (see general remarks)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_create@.
--                   The unsafe flavor is 'create'
--                   : allocates a whole player core and starts its thread; nothing can be registered yet, so it cannot call back.
--
--     [C declaration]: @mpv_create@, defined at @mpv\/client.h 481:24@
createSafe :: IO (BG.Ptr Mpv_handle)
createSafe = Safe.mpv_create

-- | Initialize an uninitialized mpv instance. If the mpv instance is already running, an error is returned.
--
--     This function needs to be called to make full use of the client API if the client API handle was created with @'create'@.
--
--     Only the following options are required to be set /before/ @'initialize'@:
--
--     * options which are only read at initialization time:
--       * config
--       * config-dir
--       * input-conf
--       * load-scripts
--       * script
--       * player-operation-mode
--       * input-app-events (macOS)
--
--     * all encoding mode options
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_initialize@.
--                   The safe flavor is 'initializeSafe'
--                   : initializes the player on the calling thread (config files, scripts, force-window); prefer the Safe alias, an unsafe call stalls every capability and GC meanwhile.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_initialize@, defined at @mpv\/client.h 503:16@
initialize
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO BG.Int32
initialize =
  \x00 ->
    fmap Coerce.coerce (Unsafe.mpv_initialize x00)

-- | Initialize an uninitialized mpv instance. If the mpv instance is already running, an error is returned.
--
--     This function needs to be called to make full use of the client API if the client API handle was created with @'create'@.
--
--     Only the following options are required to be set /before/ @'initialize'@:
--
--     * options which are only read at initialization time:
--       * config
--       * config-dir
--       * input-conf
--       * load-scripts
--       * script
--       * player-operation-mode
--       * input-app-events (macOS)
--
--     * all encoding mode options
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_initialize@.
--                   The unsafe flavor is 'initialize'
--                   : initializes the player on the calling thread (config files, scripts, force-window); prefer the Safe alias, an unsafe call stalls every capability and GC meanwhile.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_initialize@, defined at @mpv\/client.h 503:16@
initializeSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO BG.Int32
initializeSafe =
  \x00 -> fmap Coerce.coerce (Safe.mpv_initialize x00)

-- | Disconnect and destroy the 'Mpv_handle'. ctx will be deallocated with this API call.
--
--     If the last 'Mpv_handle' is detached, the core player is destroyed. In addition, if there are only weak mpv_handles (such as created by @'createWeakClient'@ or internal scripts), these mpv_handles will be sent MPV_EVENT_SHUTDOWN. This function may block until these clients have responded to the shutdown event, and the core is finally destroyed.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_destroy@.
--                   The safe flavor is 'destroySafe'
--                   : blocks on pending async requests and, for the last strong handle, on core shutdown; prefer the Safe alias, an unsafe call stalls every capability and GC meanwhile.
--
--     [C declaration]: @mpv_destroy@, defined at @mpv\/client.h 515:17@
destroy
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO ()
destroy = Unsafe.mpv_destroy

-- | Disconnect and destroy the 'Mpv_handle'. ctx will be deallocated with this API call.
--
--     If the last 'Mpv_handle' is detached, the core player is destroyed. In addition, if there are only weak mpv_handles (such as created by @'createWeakClient'@ or internal scripts), these mpv_handles will be sent MPV_EVENT_SHUTDOWN. This function may block until these clients have responded to the shutdown event, and the core is finally destroyed.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_destroy@.
--                   The unsafe flavor is 'destroy'
--                   : blocks on pending async requests and, for the last strong handle, on core shutdown; prefer the Safe alias, an unsafe call stalls every capability and GC meanwhile.
--
--     [C declaration]: @mpv_destroy@, defined at @mpv\/client.h 515:17@
destroySafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO ()
destroySafe = Safe.mpv_destroy

-- | Similar to @'destroy'@, but brings the player and all clients down as well, and waits until all of them are destroyed. This function blocks. The advantage over @'destroy'@ is that while @'destroy'@ merely detaches the client handle from the player, this function quits the player, waits until all other clients are destroyed (i.e. all mpv_handles are detached), and also waits for the final termination of the player.
--
--     Since @'destroy'@ is called somewhere on the way, it\'s not safe to call other functions concurrently on the same context.
--
--     Since mpv client API version 1.29: The first call on any 'Mpv_handle' will block until the core is destroyed. This means it will wait until other 'Mpv_handle' have been destroyed. If you want asynchronous destruction, just run the \"quit\" command, and then react to the MPV_EVENT_SHUTDOWN event. If another 'Mpv_handle' already called @'terminateDestroy'@, this call will not actually block. It will destroy the 'Mpv_handle', and exit immediately, while other mpv_handles might still be uninitializing.
--
--     Before mpv client API version 1.29: If this is called on a 'Mpv_handle' that was not created with @'create'@, this function will merely send a quit command and then call @'destroy'@, without waiting for the actual shutdown.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_terminate_destroy@.
--                   The safe flavor is 'terminateDestroySafe'
--                   : quits the player and blocks until every other handle and the core are gone; prefer the Safe alias, an unsafe call stalls every capability and GC meanwhile.
--
--     [C declaration]: @mpv_terminate_destroy@, defined at @mpv\/client.h 542:17@
terminateDestroy
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO ()
terminateDestroy = Unsafe.mpv_terminate_destroy

-- | Similar to @'destroy'@, but brings the player and all clients down as well, and waits until all of them are destroyed. This function blocks. The advantage over @'destroy'@ is that while @'destroy'@ merely detaches the client handle from the player, this function quits the player, waits until all other clients are destroyed (i.e. all mpv_handles are detached), and also waits for the final termination of the player.
--
--     Since @'destroy'@ is called somewhere on the way, it\'s not safe to call other functions concurrently on the same context.
--
--     Since mpv client API version 1.29: The first call on any 'Mpv_handle' will block until the core is destroyed. This means it will wait until other 'Mpv_handle' have been destroyed. If you want asynchronous destruction, just run the \"quit\" command, and then react to the MPV_EVENT_SHUTDOWN event. If another 'Mpv_handle' already called @'terminateDestroy'@, this call will not actually block. It will destroy the 'Mpv_handle', and exit immediately, while other mpv_handles might still be uninitializing.
--
--     Before mpv client API version 1.29: If this is called on a 'Mpv_handle' that was not created with @'create'@, this function will merely send a quit command and then call @'destroy'@, without waiting for the actual shutdown.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_terminate_destroy@.
--                   The unsafe flavor is 'terminateDestroy'
--                   : quits the player and blocks until every other handle and the core are gone; prefer the Safe alias, an unsafe call stalls every capability and GC meanwhile.
--
--     [C declaration]: @mpv_terminate_destroy@, defined at @mpv\/client.h 542:17@
terminateDestroySafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO ()
terminateDestroySafe = Safe.mpv_terminate_destroy

-- | Create a new client handle connected to the same player core as ctx. This context has its own event queue, its own @'requestEvent'@ state, its own @'requestLogMessages'@ state, its own set of observed properties, and its own state for asynchronous operations. Otherwise, everything is shared.
--
--     This handle should be destroyed with @'destroy'@ if no longer needed. The core will live as long as there is at least 1 handle referencing it. Any handle can make the core quit, which will result in every handle receiving MPV_EVENT_SHUTDOWN.
--
--     This function can not be called before the main handle was initialized with @'initialize'@. The new handle is always initialized, unless ctx=NULL was passed.
--
--     [Returns]: a new handle, or NULL on error
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_create_client@.
--                   The safe flavor is 'createClientSafe'
--                   : takes the client-list lock, which mpv holds while running wakeup callbacks for broadcast events.
--
--     [C declaration]: @mpv_create_client@, defined at @mpv\/client.h 568:24@
createClient
  :: BG.Ptr Mpv_handle
  -- ^
  --
  --           [@ctx@]: Used to get the reference to the mpv core; handle-specific settings and parameters are not used. If NULL, this function behaves like @'create'@ (ignores name).
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The client name. This will be returned by @'clientName'@. If the name is already in use, or contains non-alphanumeric characters (other than \'_\'), the name is modified to fit. If NULL, an arbitrary name is automatically chosen.
  -> IO (BG.Ptr Mpv_handle)
createClient = Unsafe.mpv_create_client

-- | Create a new client handle connected to the same player core as ctx. This context has its own event queue, its own @'requestEvent'@ state, its own @'requestLogMessages'@ state, its own set of observed properties, and its own state for asynchronous operations. Otherwise, everything is shared.
--
--     This handle should be destroyed with @'destroy'@ if no longer needed. The core will live as long as there is at least 1 handle referencing it. Any handle can make the core quit, which will result in every handle receiving MPV_EVENT_SHUTDOWN.
--
--     This function can not be called before the main handle was initialized with @'initialize'@. The new handle is always initialized, unless ctx=NULL was passed.
--
--     [Returns]: a new handle, or NULL on error
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_create_client@.
--                   The unsafe flavor is 'createClient'
--                   : takes the client-list lock, which mpv holds while running wakeup callbacks for broadcast events.
--
--     [C declaration]: @mpv_create_client@, defined at @mpv\/client.h 568:24@
createClientSafe
  :: BG.Ptr Mpv_handle
  -- ^
  --
  --           [@ctx@]: Used to get the reference to the mpv core; handle-specific settings and parameters are not used. If NULL, this function behaves like @'create'@ (ignores name).
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The client name. This will be returned by @'clientName'@. If the name is already in use, or contains non-alphanumeric characters (other than \'_\'), the name is modified to fit. If NULL, an arbitrary name is automatically chosen.
  -> IO (BG.Ptr Mpv_handle)
createClientSafe = Safe.mpv_create_client

-- | This is the same as @'createClient'@, but the created 'Mpv_handle' is treated as a weak reference. If all mpv_handles referencing a core are weak references, the core is automatically destroyed. (This still goes through normal uninit of course. Effectively, if the last non-weak 'Mpv_handle' is destroyed, then the weak mpv_handles receive MPV_EVENT_SHUTDOWN and are asked to terminate as well.)
--
--     Note if you want to use this like refcounting: you have to be aware that @'terminateDestroy'@ /and/ @'destroy'@ for the last non-weak 'Mpv_handle' will block until all weak mpv_handles are destroyed.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_create_weak_client@.
--                   The safe flavor is 'createWeakClientSafe'
--                   : takes the client-list lock, which mpv holds while running wakeup callbacks for broadcast events.
--
--     [C declaration]: @mpv_create_weak_client@, defined at @mpv\/client.h 582:24@
createWeakClient
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @name@
  -> IO (BG.Ptr Mpv_handle)
createWeakClient = Unsafe.mpv_create_weak_client

-- | This is the same as @'createClient'@, but the created 'Mpv_handle' is treated as a weak reference. If all mpv_handles referencing a core are weak references, the core is automatically destroyed. (This still goes through normal uninit of course. Effectively, if the last non-weak 'Mpv_handle' is destroyed, then the weak mpv_handles receive MPV_EVENT_SHUTDOWN and are asked to terminate as well.)
--
--     Note if you want to use this like refcounting: you have to be aware that @'terminateDestroy'@ /and/ @'destroy'@ for the last non-weak 'Mpv_handle' will block until all weak mpv_handles are destroyed.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_create_weak_client@.
--                   The unsafe flavor is 'createWeakClient'
--                   : takes the client-list lock, which mpv holds while running wakeup callbacks for broadcast events.
--
--     [C declaration]: @mpv_create_weak_client@, defined at @mpv\/client.h 582:24@
createWeakClientSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @name@
  -> IO (BG.Ptr Mpv_handle)
createWeakClientSafe = Safe.mpv_create_weak_client

-- | Load a config file. This loads and parses the file, and sets every entry in the config file\'s default section as if @'setOptionString'@ is called.
--
--     The filename should be an absolute path. If it isn\'t, the actual path used is unspecified. (Note: an absolute path starts with \'\/\' on UNIX.) If the file wasn\'t found, MPV_ERROR_INVALID_PARAMETER is returned.
--
--     If a fatal error happens when parsing a config file, MPV_ERROR_OPTION_ERROR is returned. Errors when setting options as well as other types or errors are ignored (even if options do not exist). You can still try to capture the resulting error messages with @'requestLogMessages'@. Note that it\'s possible that some options were successfully set even if any of these errors happen.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_load_config_file@.
--                   The safe flavor is 'loadConfigFileSafe'
--                   : takes the core lock and parses the file on the calling thread (blocking file I\/O).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_load_config_file@, defined at @mpv\/client.h 602:16@
loadConfigFile
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@filename@]: absolute path to the config file on the local filesystem
  -> IO BG.Int32
loadConfigFile =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.mpv_load_config_file x00 x11)

-- | Load a config file. This loads and parses the file, and sets every entry in the config file\'s default section as if @'setOptionString'@ is called.
--
--     The filename should be an absolute path. If it isn\'t, the actual path used is unspecified. (Note: an absolute path starts with \'\/\' on UNIX.) If the file wasn\'t found, MPV_ERROR_INVALID_PARAMETER is returned.
--
--     If a fatal error happens when parsing a config file, MPV_ERROR_OPTION_ERROR is returned. Errors when setting options as well as other types or errors are ignored (even if options do not exist). You can still try to capture the resulting error messages with @'requestLogMessages'@. Note that it\'s possible that some options were successfully set even if any of these errors happen.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_load_config_file@.
--                   The unsafe flavor is 'loadConfigFile'
--                   : takes the core lock and parses the file on the calling thread (blocking file I\/O).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_load_config_file@, defined at @mpv\/client.h 602:16@
loadConfigFileSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@filename@]: absolute path to the config file on the local filesystem
  -> IO BG.Int32
loadConfigFileSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.mpv_load_config_file x00 x11)

-- | Return the internal time in nanoseconds. This has an arbitrary start offset, but will never wrap or go backwards.
--
--     Note that this is always the real time, and doesn\'t necessarily have to do with playback time. For example, playback could go faster or slower due to playback speed, or due to playback being paused. Use the \"time-pos\" property instead to get the playback status.
--
--     Unlike other libmpv APIs, this can be called at absolutely any time (even within wakeup callbacks), as long as the context is valid.
--
--     Safe to be called from mpv render API threads.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_get_time_ns@.
--                   The safe import is not exported
--                   : reads a monotonic clock value; cannot block, lock, or call back.
--
--     [C declaration]: @mpv_get_time_ns@, defined at @mpv\/client.h 618:20@
getTimeNs
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO HsBindgen.Runtime.LibC.Int64
getTimeNs = Unsafe.mpv_get_time_ns

-- | Same as 'getTimeNs' but in microseconds.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_get_time_us@.
--                   The safe import is not exported
--                   : reads a monotonic clock value; cannot block, lock, or call back.
--
--     [C declaration]: @mpv_get_time_us@, defined at @mpv\/client.h 623:20@
getTimeUs
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO HsBindgen.Runtime.LibC.Int64
getTimeUs = Unsafe.mpv_get_time_us

-- | Frees any data referenced by the node. It doesn\'t free the node itself. Call this only if the mpv client API set the node. If you constructed the node yourself (manually), you have to free it yourself.
--
--     If node->format is MPV_FORMAT_NONE, this call does nothing. Likewise, if the client API sets a node with this format, this function doesn\'t need to be called. (This is just a clarification that there\'s no danger of anything strange happening in these cases.)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_free_node_contents@.
--                   The safe import is not exported
--                   : frees the memory a node references; cannot block or call back.
--
--     [C declaration]: @mpv_free_node_contents@, defined at @mpv\/client.h 857:17@
freeNodeContents
  :: BG.Ptr Mpv_node
  -- ^ [C declaration]: @node@
  -> IO ()
freeNodeContents = Unsafe.mpv_free_node_contents

-- | Set an option. Note that you can\'t normally set options during runtime. It works in uninitialized state (see @'create'@), and in some cases in at runtime.
--
--     Using a format other than MPV_FORMAT_NODE is equivalent to constructing a 'Mpv_node' with the given format and data, and passing the 'Mpv_node' to this function.
--
--     Note: this is semi-deprecated. For most purposes, this is not needed anymore. Starting with mpv version 0.21.0 (version 1.23) most options can be set with @'setProperty'@ (and related functions), and even before @'initialize'@. In some obscure corner cases, using this function to set options might still be required (see \"Inconsistencies between options and properties\" in the manpage). Once these are resolved, the option setting functions might be fully deprecated.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_set_option@.
--                   The safe flavor is 'setOptionSafe'
--                   : takes the core lock (an unbounded wait, per client.h) and applies the option on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_set_option@, defined at @mpv\/client.h 883:16@
setOption
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: Option name. This is the same as on the mpv command line, but without the leading \"--\".
  -> Mpv_format
  -- ^
  --
  --           [@format@]: see enum 'Mpv_format'.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@data@]: /(input)/
  --                     Option value (according to the format).
  -> IO BG.Int32
setOption =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Unsafe.mpv_set_option x00 x11 x22 x33)

-- | Set an option. Note that you can\'t normally set options during runtime. It works in uninitialized state (see @'create'@), and in some cases in at runtime.
--
--     Using a format other than MPV_FORMAT_NODE is equivalent to constructing a 'Mpv_node' with the given format and data, and passing the 'Mpv_node' to this function.
--
--     Note: this is semi-deprecated. For most purposes, this is not needed anymore. Starting with mpv version 0.21.0 (version 1.23) most options can be set with @'setProperty'@ (and related functions), and even before @'initialize'@. In some obscure corner cases, using this function to set options might still be required (see \"Inconsistencies between options and properties\" in the manpage). Once these are resolved, the option setting functions might be fully deprecated.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_set_option@.
--                   The unsafe flavor is 'setOption'
--                   : takes the core lock (an unbounded wait, per client.h) and applies the option on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_set_option@, defined at @mpv\/client.h 883:16@
setOptionSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: Option name. This is the same as on the mpv command line, but without the leading \"--\".
  -> Mpv_format
  -- ^
  --
  --           [@format@]: see enum 'Mpv_format'.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@data@]: /(input)/
  --                     Option value (according to the format).
  -> IO BG.Int32
setOptionSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Safe.mpv_set_option x00 x11 x22 x33)

-- | Convenience function to set an option to a string value. This is like calling @'setOption'@ with MPV_FORMAT_STRING.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_set_option_string@.
--                   The safe flavor is 'setOptionStringSafe'
--                   : takes the core lock (an unbounded wait, per client.h) and applies the option on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_set_option_string@, defined at @mpv\/client.h 892:16@
setOptionString
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @name@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @data@
  -> IO BG.Int32
setOptionString =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.mpv_set_option_string x00 x11 x22)

-- | Convenience function to set an option to a string value. This is like calling @'setOption'@ with MPV_FORMAT_STRING.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_set_option_string@.
--                   The unsafe flavor is 'setOptionString'
--                   : takes the core lock (an unbounded wait, per client.h) and applies the option on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_set_option_string@, defined at @mpv\/client.h 892:16@
setOptionStringSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @name@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @data@
  -> IO BG.Int32
setOptionStringSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.mpv_set_option_string x00 x11 x22)

-- | Send a command to the player. Commands are the same as those used in input.conf, except that this function takes parameters in a pre-split form.
--
--     The commands and their parameters are documented in input.rst.
--
--     Does not use OSD and string expansion by default (unlike @'commandString'@ and input.conf).
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_command@.
--                   The safe flavor is 'commandSafe'
--                   : takes the core lock and runs the command on the calling thread, then waits for it to finish (unbounded); may run wakeup callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_command@, defined at @mpv\/client.h 908:16@
command
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@args@]: /(input)/
  --                     NULL-terminated list of strings. Usually, the first item is the command, and the following items are arguments.
  -> IO BG.Int32
command =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.mpv_command x00 x11)

-- | Send a command to the player. Commands are the same as those used in input.conf, except that this function takes parameters in a pre-split form.
--
--     The commands and their parameters are documented in input.rst.
--
--     Does not use OSD and string expansion by default (unlike @'commandString'@ and input.conf).
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_command@.
--                   The unsafe flavor is 'command'
--                   : takes the core lock and runs the command on the calling thread, then waits for it to finish (unbounded); may run wakeup callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_command@, defined at @mpv\/client.h 908:16@
commandSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@args@]: /(input)/
  --                     NULL-terminated list of strings. Usually, the first item is the command, and the following items are arguments.
  -> IO BG.Int32
commandSafe =
  \x00 ->
    \x11 -> fmap Coerce.coerce (Safe.mpv_command x00 x11)

-- | Same as @'command'@, but allows passing structured data in any format. In particular, calling @'command'@ is exactly like calling @'commandNode'@ with the format set to MPV_FORMAT_NODE_ARRAY, and every arg passed in order as MPV_FORMAT_STRING.
--
--     Does not use OSD and string expansion by default.
--
--     The args argument can have one of the following formats:
--
--     MPV_FORMAT_NODE_ARRAY: Positional arguments. Each entry is an argument using an arbitrary format (the format must be compatible to the used command). Usually, the first item is the command name (as MPV_FORMAT_STRING). The order of arguments is as documented in each command description.
--
--     MPV_FORMAT_NODE_MAP: Named arguments. This requires at least an entry with the key \"name\" to be present, which must be a string, and contains the command name. The special entry \"_flags\" is optional, and if present, must be an array of strings, each being a command prefix to apply. All other entries are interpreted as arguments. They must use the argument names as documented in each command description. Some commands do not support named arguments at all, and must use MPV_FORMAT_NODE_ARRAY.
--
--     [Returns]: error code (the result parameter is not set on error)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_command_node@.
--                   The safe flavor is 'commandNodeSafe'
--                   : takes the core lock and runs the command on the calling thread, then waits for it to finish (unbounded); may run wakeup callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_command_node@, defined at @mpv\/client.h 944:16@
commandNode
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> BG.Ptr Mpv_node
  -- ^
  --
  --           [@args@]: /(input)/
  --                     'Mpv_node' with format set to one of the values documented above (see there for details)
  -> BG.Ptr Mpv_node
  -- ^
  --
  --           [@result@]: /(output)/
  --                       Optional, pass NULL if unused. If not NULL, and if the function succeeds, this is set to command-specific return data. You must call @'freeNodeContents'@ to free it (again, only if the command actually succeeds). Not many commands actually use this at all.
  -> IO BG.Int32
commandNode =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.mpv_command_node x00 x11 x22)

-- | Same as @'command'@, but allows passing structured data in any format. In particular, calling @'command'@ is exactly like calling @'commandNode'@ with the format set to MPV_FORMAT_NODE_ARRAY, and every arg passed in order as MPV_FORMAT_STRING.
--
--     Does not use OSD and string expansion by default.
--
--     The args argument can have one of the following formats:
--
--     MPV_FORMAT_NODE_ARRAY: Positional arguments. Each entry is an argument using an arbitrary format (the format must be compatible to the used command). Usually, the first item is the command name (as MPV_FORMAT_STRING). The order of arguments is as documented in each command description.
--
--     MPV_FORMAT_NODE_MAP: Named arguments. This requires at least an entry with the key \"name\" to be present, which must be a string, and contains the command name. The special entry \"_flags\" is optional, and if present, must be an array of strings, each being a command prefix to apply. All other entries are interpreted as arguments. They must use the argument names as documented in each command description. Some commands do not support named arguments at all, and must use MPV_FORMAT_NODE_ARRAY.
--
--     [Returns]: error code (the result parameter is not set on error)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_command_node@.
--                   The unsafe flavor is 'commandNode'
--                   : takes the core lock and runs the command on the calling thread, then waits for it to finish (unbounded); may run wakeup callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_command_node@, defined at @mpv\/client.h 944:16@
commandNodeSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> BG.Ptr Mpv_node
  -- ^
  --
  --           [@args@]: /(input)/
  --                     'Mpv_node' with format set to one of the values documented above (see there for details)
  -> BG.Ptr Mpv_node
  -- ^
  --
  --           [@result@]: /(output)/
  --                       Optional, pass NULL if unused. If not NULL, and if the function succeeds, this is set to command-specific return data. You must call @'freeNodeContents'@ to free it (again, only if the command actually succeeds). Not many commands actually use this at all.
  -> IO BG.Int32
commandNodeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.mpv_command_node x00 x11 x22)

-- | This is essentially identical to @'command'@ but it also returns a result.
--
--     Does not use OSD and string expansion by default.
--
--     [Returns]: error code (the result parameter is not set on error)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_command_ret@.
--                   The safe flavor is 'commandRetSafe'
--                   : takes the core lock and runs the command on the calling thread, then waits for it to finish (unbounded); may run wakeup callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_command_ret@, defined at @mpv\/client.h 960:16@
commandRet
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@args@]: /(input)/
  --                     NULL-terminated list of strings. Usually, the first item is the command, and the following items are arguments.
  -> BG.Ptr Mpv_node
  -- ^
  --
  --           [@result@]: /(output)/
  --                       Optional, pass NULL if unused. If not NULL, and if the function succeeds, this is set to command-specific return data. You must call @'freeNodeContents'@ to free it (again, only if the command actually succeeds). Not many commands actually use this at all.
  -> IO BG.Int32
commandRet =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.mpv_command_ret x00 x11 x22)

-- | This is essentially identical to @'command'@ but it also returns a result.
--
--     Does not use OSD and string expansion by default.
--
--     [Returns]: error code (the result parameter is not set on error)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_command_ret@.
--                   The unsafe flavor is 'commandRet'
--                   : takes the core lock and runs the command on the calling thread, then waits for it to finish (unbounded); may run wakeup callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_command_ret@, defined at @mpv\/client.h 960:16@
commandRetSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@args@]: /(input)/
  --                     NULL-terminated list of strings. Usually, the first item is the command, and the following items are arguments.
  -> BG.Ptr Mpv_node
  -- ^
  --
  --           [@result@]: /(output)/
  --                       Optional, pass NULL if unused. If not NULL, and if the function succeeds, this is set to command-specific return data. You must call @'freeNodeContents'@ to free it (again, only if the command actually succeeds). Not many commands actually use this at all.
  -> IO BG.Int32
commandRetSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.mpv_command_ret x00 x11 x22)

-- | Same as 'command', but use input.conf parsing for splitting arguments. This is slightly simpler, but also more error prone, since arguments may need quoting\/escaping.
--
--     This also has OSD and string expansion enabled by default.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_command_string@.
--                   The safe flavor is 'commandStringSafe'
--                   : takes the core lock and runs the command on the calling thread, then waits for it to finish (unbounded); may run wakeup callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_command_string@, defined at @mpv\/client.h 969:16@
commandString
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @args@
  -> IO BG.Int32
commandString =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.mpv_command_string x00 x11)

-- | Same as 'command', but use input.conf parsing for splitting arguments. This is slightly simpler, but also more error prone, since arguments may need quoting\/escaping.
--
--     This also has OSD and string expansion enabled by default.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_command_string@.
--                   The unsafe flavor is 'commandString'
--                   : takes the core lock and runs the command on the calling thread, then waits for it to finish (unbounded); may run wakeup callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_command_string@, defined at @mpv\/client.h 969:16@
commandStringSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @args@
  -> IO BG.Int32
commandStringSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.mpv_command_string x00 x11)

-- | Same as 'command', but run the command asynchronously.
--
--     Commands are executed asynchronously. You will receive a MPV_EVENT_COMMAND_REPLY event. This event will also have an error code set if running the command failed. For commands that return data, the data is put into @mpv_event_command.result@.
--
--     The only case when you do not receive an event is when the function call itself fails. This happens only if parsing the command itself (or otherwise validating it) fails, i.e. the return code of the API call is not 0 or positive.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code (if parsing or queuing the command fails)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_command_async@.
--                   The safe flavor is 'commandAsyncSafe'
--                   : returns without waiting for the core, but takes the handle\'s lock, which mpv holds while running the wakeup callback.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_command_async@, defined at @mpv\/client.h 991:16@
commandAsync
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: the value @mpv_event.reply_userdata@ of the reply will be set to (see section about asynchronous calls)
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@args@]: NULL-terminated list of strings (see @'command'@)
  -> IO BG.Int32
commandAsync =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.mpv_command_async x00 x11 x22)

-- | Same as 'command', but run the command asynchronously.
--
--     Commands are executed asynchronously. You will receive a MPV_EVENT_COMMAND_REPLY event. This event will also have an error code set if running the command failed. For commands that return data, the data is put into @mpv_event_command.result@.
--
--     The only case when you do not receive an event is when the function call itself fails. This happens only if parsing the command itself (or otherwise validating it) fails, i.e. the return code of the API call is not 0 or positive.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code (if parsing or queuing the command fails)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_command_async@.
--                   The unsafe flavor is 'commandAsync'
--                   : returns without waiting for the core, but takes the handle\'s lock, which mpv holds while running the wakeup callback.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_command_async@, defined at @mpv\/client.h 991:16@
commandAsyncSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: the value @mpv_event.reply_userdata@ of the reply will be set to (see section about asynchronous calls)
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@args@]: NULL-terminated list of strings (see @'command'@)
  -> IO BG.Int32
commandAsyncSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.mpv_command_async x00 x11 x22)

-- | Same as @'commandNode'@, but run it asynchronously. Basically, this function is to @'commandNode'@ what @'commandAsync'@ is to @'command'@.
--
--     See @'commandAsync'@ for details.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code (if parsing or queuing the command fails)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_command_node_async@.
--                   The safe flavor is 'commandNodeAsyncSafe'
--                   : returns without waiting for the core, but takes the handle\'s lock, which mpv holds while running the wakeup callback.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_command_node_async@, defined at @mpv\/client.h 1008:16@
commandNodeAsync
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: the value @mpv_event.reply_userdata@ of the reply will be set to (see section about asynchronous calls)
  -> BG.Ptr Mpv_node
  -- ^
  --
  --           [@args@]: as in @'commandNode'@
  -> IO BG.Int32
commandNodeAsync =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.mpv_command_node_async x00 x11 x22)

-- | Same as @'commandNode'@, but run it asynchronously. Basically, this function is to @'commandNode'@ what @'commandAsync'@ is to @'command'@.
--
--     See @'commandAsync'@ for details.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code (if parsing or queuing the command fails)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_command_node_async@.
--                   The unsafe flavor is 'commandNodeAsync'
--                   : returns without waiting for the core, but takes the handle\'s lock, which mpv holds while running the wakeup callback.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_command_node_async@, defined at @mpv\/client.h 1008:16@
commandNodeAsyncSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: the value @mpv_event.reply_userdata@ of the reply will be set to (see section about asynchronous calls)
  -> BG.Ptr Mpv_node
  -- ^
  --
  --           [@args@]: as in @'commandNode'@
  -> IO BG.Int32
commandNodeAsyncSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.mpv_command_node_async x00 x11 x22)

-- | Signal to all async requests with the matching ID to abort. This affects the following API calls: 'commandAsync' 'commandNodeAsync'
--
--     All of these functions take a reply_userdata parameter. This API function tells all requests with the matching reply_userdata value to try to return as soon as possible. If there are multiple requests with matching ID, it aborts all of them.
--
--     This API function is mostly asynchronous itself. It will not wait until the command is aborted. Instead, the command will terminate as usual, but with some work not done. How this is signaled depends on the specific command (for example, the \"subprocess\" command will indicate it by \"killed_by_us\" set to true in the result). How long it takes also depends on the situation. The aborting process is completely asynchronous.
--
--     Not all commands may support this functionality. In this case, this function will have no effect. The same is true if the request using the passed reply_userdata has already terminated, has not been started yet, or was never in use at all.
--
--     You have to be careful of race conditions: the time during which the abort request will be effective is /after/ e.g. @'commandAsync'@ has returned, and before the command has signaled completion with MPV_EVENT_COMMAND_REPLY.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_abort_async_command@.
--                   The safe flavor is 'abortAsyncCommandSafe'
--                   : triggers cancellation synchronously; a custom stream the request opened runs its cancel_fn during the call.
--
--     [C declaration]: @mpv_abort_async_command@, defined at @mpv\/client.h 1041:17@
abortAsyncCommand
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: ID of the request to be aborted (see above)
  -> IO ()
abortAsyncCommand = Unsafe.mpv_abort_async_command

-- | Signal to all async requests with the matching ID to abort. This affects the following API calls: 'commandAsync' 'commandNodeAsync'
--
--     All of these functions take a reply_userdata parameter. This API function tells all requests with the matching reply_userdata value to try to return as soon as possible. If there are multiple requests with matching ID, it aborts all of them.
--
--     This API function is mostly asynchronous itself. It will not wait until the command is aborted. Instead, the command will terminate as usual, but with some work not done. How this is signaled depends on the specific command (for example, the \"subprocess\" command will indicate it by \"killed_by_us\" set to true in the result). How long it takes also depends on the situation. The aborting process is completely asynchronous.
--
--     Not all commands may support this functionality. In this case, this function will have no effect. The same is true if the request using the passed reply_userdata has already terminated, has not been started yet, or was never in use at all.
--
--     You have to be careful of race conditions: the time during which the abort request will be effective is /after/ e.g. @'commandAsync'@ has returned, and before the command has signaled completion with MPV_EVENT_COMMAND_REPLY.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_abort_async_command@.
--                   The unsafe flavor is 'abortAsyncCommand'
--                   : triggers cancellation synchronously; a custom stream the request opened runs its cancel_fn during the call.
--
--     [C declaration]: @mpv_abort_async_command@, defined at @mpv\/client.h 1041:17@
abortAsyncCommandSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: ID of the request to be aborted (see above)
  -> IO ()
abortAsyncCommandSafe = Safe.mpv_abort_async_command

-- | Set a property to a given value. Properties are essentially variables which can be queried or set at runtime. For example, writing to the pause property will actually pause or unpause playback.
--
--     If the format doesn\'t match with the internal format of the property, access usually will fail with MPV_ERROR_PROPERTY_FORMAT. In some cases, the data is automatically converted and access succeeds. For example, MPV_FORMAT_INT64 is always converted to MPV_FORMAT_DOUBLE, and access using MPV_FORMAT_STRING usually invokes a string parser. The same happens when calling this function with MPV_FORMAT_NODE: the underlying format may be converted to another type if possible.
--
--     Using a format other than MPV_FORMAT_NODE is equivalent to constructing a 'Mpv_node' with the given format and data, and passing the 'Mpv_node' to this function. (Before API version 1.21, this was different.)
--
--     Note: starting with mpv 0.21.0 (client API version 1.23), this can be used to set options in general. It even can be used before @'initialize'@ has been called. If called before @'initialize'@, setting properties not backed by options will result in MPV_ERROR_PROPERTY_UNAVAILABLE. In some cases, properties and options still conflict. In these cases, @'setProperty'@ accesses the options before @'initialize'@, and the properties after @'initialize'@. These conflicts will be removed in mpv 0.23.0. See @'setOption'@ for further remarks.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_set_property@.
--                   The safe flavor is 'setPropertySafe'
--                   : takes the core lock (an unbounded wait, per client.h) and runs the setter on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_set_property@, defined at @mpv\/client.h 1074:16@
setProperty
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name. See input.rst for a list of properties.
  -> Mpv_format
  -- ^
  --
  --           [@format@]: see enum 'Mpv_format'.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@data@]: /(input)/
  --                     Option value.
  -> IO BG.Int32
setProperty =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Unsafe.mpv_set_property x00 x11 x22 x33)

-- | Set a property to a given value. Properties are essentially variables which can be queried or set at runtime. For example, writing to the pause property will actually pause or unpause playback.
--
--     If the format doesn\'t match with the internal format of the property, access usually will fail with MPV_ERROR_PROPERTY_FORMAT. In some cases, the data is automatically converted and access succeeds. For example, MPV_FORMAT_INT64 is always converted to MPV_FORMAT_DOUBLE, and access using MPV_FORMAT_STRING usually invokes a string parser. The same happens when calling this function with MPV_FORMAT_NODE: the underlying format may be converted to another type if possible.
--
--     Using a format other than MPV_FORMAT_NODE is equivalent to constructing a 'Mpv_node' with the given format and data, and passing the 'Mpv_node' to this function. (Before API version 1.21, this was different.)
--
--     Note: starting with mpv 0.21.0 (client API version 1.23), this can be used to set options in general. It even can be used before @'initialize'@ has been called. If called before @'initialize'@, setting properties not backed by options will result in MPV_ERROR_PROPERTY_UNAVAILABLE. In some cases, properties and options still conflict. In these cases, @'setProperty'@ accesses the options before @'initialize'@, and the properties after @'initialize'@. These conflicts will be removed in mpv 0.23.0. See @'setOption'@ for further remarks.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_set_property@.
--                   The unsafe flavor is 'setProperty'
--                   : takes the core lock (an unbounded wait, per client.h) and runs the setter on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_set_property@, defined at @mpv\/client.h 1074:16@
setPropertySafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name. See input.rst for a list of properties.
  -> Mpv_format
  -- ^
  --
  --           [@format@]: see enum 'Mpv_format'.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@data@]: /(input)/
  --                     Option value.
  -> IO BG.Int32
setPropertySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Safe.mpv_set_property x00 x11 x22 x33)

-- | Convenience function to set a property to a string value.
--
--     This is like calling @'setProperty'@ with MPV_FORMAT_STRING.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_set_property_string@.
--                   The safe flavor is 'setPropertyStringSafe'
--                   : takes the core lock (an unbounded wait, per client.h) and runs the setter on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_set_property_string@, defined at @mpv\/client.h 1082:16@
setPropertyString
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @name@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @data@
  -> IO BG.Int32
setPropertyString =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.mpv_set_property_string x00 x11 x22)

-- | Convenience function to set a property to a string value.
--
--     This is like calling @'setProperty'@ with MPV_FORMAT_STRING.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_set_property_string@.
--                   The unsafe flavor is 'setPropertyString'
--                   : takes the core lock (an unbounded wait, per client.h) and runs the setter on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_set_property_string@, defined at @mpv\/client.h 1082:16@
setPropertyStringSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @name@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @data@
  -> IO BG.Int32
setPropertyStringSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.mpv_set_property_string x00 x11 x22)

-- | Convenience function to delete a property.
--
--     This is equivalent to running the command \"del [name]\".
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_del_property@.
--                   The safe flavor is 'delPropertySafe'
--                   : runs the del command synchronously; blocks and calls back like mpv_command.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_del_property@, defined at @mpv\/client.h 1092:16@
delProperty
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name. See input.rst for a list of properties.
  -> IO BG.Int32
delProperty =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.mpv_del_property x00 x11)

-- | Convenience function to delete a property.
--
--     This is equivalent to running the command \"del [name]\".
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_del_property@.
--                   The unsafe flavor is 'delProperty'
--                   : runs the del command synchronously; blocks and calls back like mpv_command.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_del_property@, defined at @mpv\/client.h 1092:16@
delPropertySafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name. See input.rst for a list of properties.
  -> IO BG.Int32
delPropertySafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.mpv_del_property x00 x11)

-- | Set a property asynchronously. You will receive the result of the operation as MPV_EVENT_SET_PROPERTY_REPLY event. The @mpv_event.error@ field will contain the result status of the operation. Otherwise, this function is similar to @'setProperty'@.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code if sending the request failed
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_set_property_async@.
--                   The safe flavor is 'setPropertyAsyncSafe'
--                   : returns without waiting for the core, but takes the handle\'s lock, which mpv holds while running the wakeup callback.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_set_property_async@, defined at @mpv\/client.h 1109:16@
setPropertyAsync
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: see section about asynchronous calls
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name.
  -> Mpv_format
  -- ^
  --
  --           [@format@]: see enum 'Mpv_format'.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@data@]: /(input)/
  --                     Option value. The value will be copied by the function. It will never be modified by the client API.
  -> IO BG.Int32
setPropertyAsync =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap Coerce.coerce (Unsafe.mpv_set_property_async x00 x11 x22 x33 x44)

-- | Set a property asynchronously. You will receive the result of the operation as MPV_EVENT_SET_PROPERTY_REPLY event. The @mpv_event.error@ field will contain the result status of the operation. Otherwise, this function is similar to @'setProperty'@.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code if sending the request failed
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_set_property_async@.
--                   The unsafe flavor is 'setPropertyAsync'
--                   : returns without waiting for the core, but takes the handle\'s lock, which mpv holds while running the wakeup callback.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_set_property_async@, defined at @mpv\/client.h 1109:16@
setPropertyAsyncSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: see section about asynchronous calls
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name.
  -> Mpv_format
  -- ^
  --
  --           [@format@]: see enum 'Mpv_format'.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@data@]: /(input)/
  --                     Option value. The value will be copied by the function. It will never be modified by the client API.
  -> IO BG.Int32
setPropertyAsyncSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap Coerce.coerce (Safe.mpv_set_property_async x00 x11 x22 x33 x44)

-- | Read the value of the given property.
--
--     If the format doesn\'t match with the internal format of the property, access usually will fail with MPV_ERROR_PROPERTY_FORMAT. In some cases, the data is automatically converted and access succeeds. For example, MPV_FORMAT_INT64 is always converted to MPV_FORMAT_DOUBLE, and access using MPV_FORMAT_STRING usually invokes a string formatter.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_get_property@.
--                   The safe flavor is 'getPropertySafe'
--                   : takes the core lock (an unbounded wait, per client.h) and runs the getter on the calling thread; some getters wait on your render thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_get_property@, defined at @mpv\/client.h 1130:16@
getProperty
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name.
  -> Mpv_format
  -- ^
  --
  --           [@format@]: see enum 'Mpv_format'.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@data@]: /(output)/
  --                     Pointer to the variable holding the option value. On success, the variable will be set to a copy of the option value. For formats that require dynamic memory allocation, you can free the value with @'free'@ (strings) or @'freeNodeContents'@ (MPV_FORMAT_NODE).
  -> IO BG.Int32
getProperty =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Unsafe.mpv_get_property x00 x11 x22 x33)

-- | Read the value of the given property.
--
--     If the format doesn\'t match with the internal format of the property, access usually will fail with MPV_ERROR_PROPERTY_FORMAT. In some cases, the data is automatically converted and access succeeds. For example, MPV_FORMAT_INT64 is always converted to MPV_FORMAT_DOUBLE, and access using MPV_FORMAT_STRING usually invokes a string formatter.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_get_property@.
--                   The unsafe flavor is 'getProperty'
--                   : takes the core lock (an unbounded wait, per client.h) and runs the getter on the calling thread; some getters wait on your render thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_get_property@, defined at @mpv\/client.h 1130:16@
getPropertySafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name.
  -> Mpv_format
  -- ^
  --
  --           [@format@]: see enum 'Mpv_format'.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@data@]: /(output)/
  --                     Pointer to the variable holding the option value. On success, the variable will be set to a copy of the option value. For formats that require dynamic memory allocation, you can free the value with @'free'@ (strings) or @'freeNodeContents'@ (MPV_FORMAT_NODE).
  -> IO BG.Int32
getPropertySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Safe.mpv_get_property x00 x11 x22 x33)

-- | Return the value of the property with the given name as string. This is equivalent to @'getProperty'@ with MPV_FORMAT_STRING.
--
--     See MPV_FORMAT_STRING for character encoding issues.
--
--     On error, NULL is returned. Use @'getProperty'@ if you want fine-grained error reporting.
--
--     [Returns]: Property value, or NULL if the property can\'t be retrieved. Free the string with @'free'@.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_get_property_string@.
--                   The safe flavor is 'getPropertyStringSafe'
--                   : takes the core lock (an unbounded wait, per client.h) and runs the getter on the calling thread; some getters wait on your render thread.
--
--     [C declaration]: @mpv_get_property_string@, defined at @mpv\/client.h 1146:18@
getPropertyString
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name.
  -> IO (BG.Ptr BG.CChar)
getPropertyString = Unsafe.mpv_get_property_string

-- | Return the value of the property with the given name as string. This is equivalent to @'getProperty'@ with MPV_FORMAT_STRING.
--
--     See MPV_FORMAT_STRING for character encoding issues.
--
--     On error, NULL is returned. Use @'getProperty'@ if you want fine-grained error reporting.
--
--     [Returns]: Property value, or NULL if the property can\'t be retrieved. Free the string with @'free'@.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_get_property_string@.
--                   The unsafe flavor is 'getPropertyString'
--                   : takes the core lock (an unbounded wait, per client.h) and runs the getter on the calling thread; some getters wait on your render thread.
--
--     [C declaration]: @mpv_get_property_string@, defined at @mpv\/client.h 1146:18@
getPropertyStringSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name.
  -> IO (BG.Ptr BG.CChar)
getPropertyStringSafe = Safe.mpv_get_property_string

-- | Return the property as \"OSD\" formatted string. This is the same as 'getPropertyString', but using MPV_FORMAT_OSD_STRING.
--
--     [Returns]: Property value, or NULL if the property can\'t be retrieved. Free the string with @'free'@.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_get_property_osd_string@.
--                   The safe flavor is 'getPropertyOsdStringSafe'
--                   : takes the core lock (an unbounded wait, per client.h) and runs the getter on the calling thread; some getters wait on your render thread.
--
--     [C declaration]: @mpv_get_property_osd_string@, defined at @mpv\/client.h 1155:18@
getPropertyOsdString
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @name@
  -> IO (BG.Ptr BG.CChar)
getPropertyOsdString =
  Unsafe.mpv_get_property_osd_string

-- | Return the property as \"OSD\" formatted string. This is the same as 'getPropertyString', but using MPV_FORMAT_OSD_STRING.
--
--     [Returns]: Property value, or NULL if the property can\'t be retrieved. Free the string with @'free'@.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_get_property_osd_string@.
--                   The unsafe flavor is 'getPropertyOsdString'
--                   : takes the core lock (an unbounded wait, per client.h) and runs the getter on the calling thread; some getters wait on your render thread.
--
--     [C declaration]: @mpv_get_property_osd_string@, defined at @mpv\/client.h 1155:18@
getPropertyOsdStringSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @name@
  -> IO (BG.Ptr BG.CChar)
getPropertyOsdStringSafe =
  Safe.mpv_get_property_osd_string

-- | Get a property asynchronously. You will receive the result of the operation as well as the property data with the MPV_EVENT_GET_PROPERTY_REPLY event. You should check the @mpv_event.error@ field on the reply event.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code if sending the request failed
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_get_property_async@.
--                   The safe flavor is 'getPropertyAsyncSafe'
--                   : returns without waiting for the core, but takes the handle\'s lock, which mpv holds while running the wakeup callback.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_get_property_async@, defined at @mpv\/client.h 1169:16@
getPropertyAsync
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: see section about asynchronous calls
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name.
  -> Mpv_format
  -- ^
  --
  --           [@format@]: see enum 'Mpv_format'.
  -> IO BG.Int32
getPropertyAsync =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Unsafe.mpv_get_property_async x00 x11 x22 x33)

-- | Get a property asynchronously. You will receive the result of the operation as well as the property data with the MPV_EVENT_GET_PROPERTY_REPLY event. You should check the @mpv_event.error@ field on the reply event.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code if sending the request failed
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_get_property_async@.
--                   The unsafe flavor is 'getPropertyAsync'
--                   : returns without waiting for the core, but takes the handle\'s lock, which mpv holds while running the wakeup callback.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_get_property_async@, defined at @mpv\/client.h 1169:16@
getPropertyAsyncSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: see section about asynchronous calls
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name.
  -> Mpv_format
  -- ^
  --
  --           [@format@]: see enum 'Mpv_format'.
  -> IO BG.Int32
getPropertyAsyncSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Safe.mpv_get_property_async x00 x11 x22 x33)

-- | Get a notification whenever the given property changes. You will receive updates as MPV_EVENT_PROPERTY_CHANGE. Note that this is not very precise: for some properties, it may not send updates even if the property changed. This depends on the property, and it\'s a valid feature request to ask for better update handling of a specific property. (For some properties, like @clock@, which shows the wall clock, this mechanism doesn\'t make too much sense anyway.)
--
--     Property changes are coalesced: the change events are returned only once the event queue becomes empty (e.g. @'waitEvent'@ would block or return MPV_EVENT_NONE), and then only one event per changed property is returned.
--
--     You always get an initial change notification. This is meant to initialize the user\'s state to the current value of the property.
--
--     Normally, change events are sent only if the property value changes according to the requested format. 'Mpv_event_property' will contain the property value as data member.
--
--     Warning: if a property is unavailable or retrieving it caused an error, MPV_FORMAT_NONE will be set in 'Mpv_event_property', even if the format parameter was set to a different value. In this case, the @mpv_event_property.data@ field is invalid.
--
--     If the property is observed with the format parameter set to MPV_FORMAT_NONE, you get low-level notifications whether the property /may/ have changed, and the data member in 'Mpv_event_property' will be unset. With this mode, you will have to determine yourself whether the property really changed. On the other hand, this mechanism can be faster and uses less resources.
--
--     Observing a property that doesn\'t exist is allowed. (Although it may still cause some sporadic change events.)
--
--     Keep in mind that you will get change notifications even if you change a property yourself. Try to avoid endless feedback loops, which could happen if you react to the change notifications triggered by your own change.
--
--     Only the 'Mpv_handle' on which this was called will receive the property change events, or can unobserve them.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code (usually fails only on OOM or unsupported format)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_observe_property@.
--                   The safe flavor is 'observePropertySafe'
--                   : takes the handle\'s lock, which mpv holds while running the wakeup callback; never waits for the core.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_observe_property@, defined at @mpv\/client.h 1227:16@
observeProperty
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @mpv@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: This will be used for the @mpv_event.reply_userdata@ field for the received MPV_EVENT_PROPERTY_CHANGE events. (Also see section about asynchronous calls, although this function is somewhat different from actual asynchronous calls.) If you have no use for this, pass 0. Also see @'unobserveProperty'@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name.
  -> Mpv_format
  -- ^
  --
  --           [@format@]: see enum 'Mpv_format'. Can be MPV_FORMAT_NONE to omit values from the change events.
  -> IO BG.Int32
observeProperty =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Unsafe.mpv_observe_property x00 x11 x22 x33)

-- | Get a notification whenever the given property changes. You will receive updates as MPV_EVENT_PROPERTY_CHANGE. Note that this is not very precise: for some properties, it may not send updates even if the property changed. This depends on the property, and it\'s a valid feature request to ask for better update handling of a specific property. (For some properties, like @clock@, which shows the wall clock, this mechanism doesn\'t make too much sense anyway.)
--
--     Property changes are coalesced: the change events are returned only once the event queue becomes empty (e.g. @'waitEvent'@ would block or return MPV_EVENT_NONE), and then only one event per changed property is returned.
--
--     You always get an initial change notification. This is meant to initialize the user\'s state to the current value of the property.
--
--     Normally, change events are sent only if the property value changes according to the requested format. 'Mpv_event_property' will contain the property value as data member.
--
--     Warning: if a property is unavailable or retrieving it caused an error, MPV_FORMAT_NONE will be set in 'Mpv_event_property', even if the format parameter was set to a different value. In this case, the @mpv_event_property.data@ field is invalid.
--
--     If the property is observed with the format parameter set to MPV_FORMAT_NONE, you get low-level notifications whether the property /may/ have changed, and the data member in 'Mpv_event_property' will be unset. With this mode, you will have to determine yourself whether the property really changed. On the other hand, this mechanism can be faster and uses less resources.
--
--     Observing a property that doesn\'t exist is allowed. (Although it may still cause some sporadic change events.)
--
--     Keep in mind that you will get change notifications even if you change a property yourself. Try to avoid endless feedback loops, which could happen if you react to the change notifications triggered by your own change.
--
--     Only the 'Mpv_handle' on which this was called will receive the property change events, or can unobserve them.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code (usually fails only on OOM or unsupported format)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_observe_property@.
--                   The unsafe flavor is 'observeProperty'
--                   : takes the handle\'s lock, which mpv holds while running the wakeup callback; never waits for the core.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_observe_property@, defined at @mpv\/client.h 1227:16@
observePropertySafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @mpv@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: This will be used for the @mpv_event.reply_userdata@ field for the received MPV_EVENT_PROPERTY_CHANGE events. (Also see section about asynchronous calls, although this function is somewhat different from actual asynchronous calls.) If you have no use for this, pass 0. Also see @'unobserveProperty'@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The property name.
  -> Mpv_format
  -- ^
  --
  --           [@format@]: see enum 'Mpv_format'. Can be MPV_FORMAT_NONE to omit values from the change events.
  -> IO BG.Int32
observePropertySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Safe.mpv_observe_property x00 x11 x22 x33)

-- | Undo @'observeProperty'@. This will remove all observed properties for which the given number was passed as reply_userdata to 'observeProperty'.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: negative value is an error code, >=0 is number of removed properties on success (includes the case when 0 were removed)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_unobserve_property@.
--                   The safe flavor is 'unobservePropertySafe'
--                   : takes the handle\'s lock, which mpv holds while running the wakeup callback; never waits for the core.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_unobserve_property@, defined at @mpv\/client.h 1240:16@
unobserveProperty
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @mpv@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@registered_reply_userdata@]: ID that was passed to 'observeProperty'
  -> IO BG.Int32
unobserveProperty =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.mpv_unobserve_property x00 x11)

-- | Undo @'observeProperty'@. This will remove all observed properties for which the given number was passed as reply_userdata to 'observeProperty'.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: negative value is an error code, >=0 is number of removed properties on success (includes the case when 0 were removed)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_unobserve_property@.
--                   The unsafe flavor is 'unobserveProperty'
--                   : takes the handle\'s lock, which mpv holds while running the wakeup callback; never waits for the core.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_unobserve_property@, defined at @mpv\/client.h 1240:16@
unobservePropertySafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @mpv@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@registered_reply_userdata@]: ID that was passed to 'observeProperty'
  -> IO BG.Int32
unobservePropertySafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.mpv_unobserve_property x00 x11)

-- | Return a string describing the event. For unknown events, NULL is returned.
--
--     Note that all events actually returned by the API will also yield a non-NULL string with this function.
--
--     [Returns]: A static string giving a short symbolic name of the event. It consists of lower-case alphanumeric characters and can include \"-\" characters. This string is suitable for use in e.g. scripting interfaces. The string is completely static, i.e. doesn\'t need to be deallocated, and is valid forever.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_event_name@.
--                   The safe import is not exported
--                   : returns a static string; cannot block, lock, or call back.
--
--     [C declaration]: @mpv_event_name@, defined at @mpv\/client.h 1388:24@
eventName
  :: Mpv_event_id
  -- ^
  --
  --           [@event@]: event ID, see see enum 'Mpv_event_id'
  -> IO (PtrConst.PtrConst BG.CChar)
eventName = Unsafe.mpv_event_name

-- | Convert the given src event to a 'Mpv_node', and set /dst to the result. *dst is set to a MPV_FORMAT_NODE_MAP, with fields for corresponding 'Mpv_event' and @mpv_event.data@ \/mpv_event_/ fields.
--
--     The exact details are not completely documented out of laziness. A start is located in the \"Events\" section of the manpage.
--
--     *dst may point to newly allocated memory, or pointers in 'Mpv_event'. You must copy the entire 'Mpv_node' if you want to reference it after 'Mpv_event' becomes invalid (such as making a new @'waitEvent'@ call, or destroying the 'Mpv_handle' from which it was returned). Call @'freeNodeContents'@ to free any memory allocations made by this API function.
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code (MPV_ERROR_NOMEM only, if at all)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_event_to_node@.
--                   The safe import is not exported
--                   : converts the event into freshly allocated nodes (parts may point into the event); cannot block or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_event_to_node@, defined at @mpv\/client.h 1651:16@
eventToNode
  :: BG.Ptr Mpv_node
  -- ^
  --
  --           [@dst@]: Target. This is not read and fully overwritten. Must be released with @'freeNodeContents'@. Do not write to pointers returned by it. (On error, this may be left as an empty node.)
  -> BG.Ptr Mpv_event
  -- ^
  --
  --           [@src@]: The source event. Not modified (it\'s not const due to the author\'s prejudice of the C version of const).
  -> IO BG.Int32
eventToNode =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.mpv_event_to_node x00 x11)

-- | Enable or disable the given event.
--
--     Some events are enabled by default. Some events can\'t be disabled.
--
--     (Informational note: currently, all events are enabled by default, except MPV_EVENT_TICK.)
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_request_event@.
--                   The safe flavor is 'requestEventSafe'
--                   : takes the handle\'s lock, which mpv holds while running the wakeup callback; never waits for the core.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_request_event@, defined at @mpv\/client.h 1667:16@
requestEvent
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> Mpv_event_id
  -- ^
  --
  --           [@event@]: See enum 'Mpv_event_id'.
  -> BG.Int32
  -- ^
  --
  --           [@enable@]: 1 to enable receiving this event, 0 to disable it.
  -> IO BG.Int32
requestEvent =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.mpv_request_event x00 x11 (Coerce.coerce x22))

-- | Enable or disable the given event.
--
--     Some events are enabled by default. Some events can\'t be disabled.
--
--     (Informational note: currently, all events are enabled by default, except MPV_EVENT_TICK.)
--
--     Safe to be called from mpv render API threads.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_request_event@.
--                   The unsafe flavor is 'requestEvent'
--                   : takes the handle\'s lock, which mpv holds while running the wakeup callback; never waits for the core.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_request_event@, defined at @mpv\/client.h 1667:16@
requestEventSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> Mpv_event_id
  -- ^
  --
  --           [@event@]: See enum 'Mpv_event_id'.
  -> BG.Int32
  -- ^
  --
  --           [@enable@]: 1 to enable receiving this event, 0 to disable it.
  -> IO BG.Int32
requestEventSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.mpv_request_event x00 x11 (Coerce.coerce x22))

-- | Enable or disable receiving of log messages. These are the messages the command line player prints to the terminal. This call sets the minimum required log level for a message to be received with MPV_EVENT_LOG_MESSAGE.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_request_log_messages@.
--                   The safe flavor is 'requestLogMessagesSafe'
--                   : runs the registered wakeup callback synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_request_log_messages@, defined at @mpv\/client.h 1683:16@
requestLogMessages
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@min_level@]: Minimal log level as string. Valid log levels: no fatal error warn info v debug trace The value \"no\" disables all messages. This is the default. An exception is the value \"terminal-default\", which uses the log level as set by the \"--msg-level\" option. This works even if the terminal is disabled. (Since API version 1.19.) Also see 'Mpv_log_level'.
  -> IO BG.Int32
requestLogMessages =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.mpv_request_log_messages x00 x11)

-- | Enable or disable receiving of log messages. These are the messages the command line player prints to the terminal. This call sets the minimum required log level for a message to be received with MPV_EVENT_LOG_MESSAGE.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_request_log_messages@.
--                   The unsafe flavor is 'requestLogMessages'
--                   : runs the registered wakeup callback synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_request_log_messages@, defined at @mpv\/client.h 1683:16@
requestLogMessagesSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@min_level@]: Minimal log level as string. Valid log levels: no fatal error warn info v debug trace The value \"no\" disables all messages. This is the default. An exception is the value \"terminal-default\", which uses the log level as set by the \"--msg-level\" option. This works even if the terminal is disabled. (Since API version 1.19.) Also see 'Mpv_log_level'.
  -> IO BG.Int32
requestLogMessagesSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.mpv_request_log_messages x00 x11)

-- | Wait for the next event, or until the timeout expires, or if another thread makes a call to @'wakeup'@. Passing 0 as timeout will never wait, and is suitable for polling.
--
--     The internal event queue has a limited size (per client handle). If you don\'t empty the event queue quickly enough with @'waitEvent'@, it will overflow and silently discard further events. If this happens, making asynchronous requests will fail as well (with MPV_ERROR_EVENT_QUEUE_FULL).
--
--     Only one thread is allowed to call this on the same 'Mpv_handle' at a time. The API won\'t complain if more than one thread calls this, but it will cause race conditions in the client when accessing the shared 'Mpv_event' struct. Note that most other API functions are not restricted by this, and no API function internally calls @'waitEvent'@. Additionally, concurrent calls to different mpv_handles are always safe.
--
--     As long as the timeout is 0, this is safe to be called from mpv render API threads.
--
--     [Returns]: A struct containing the event ID and other data. The pointer (and fields in the struct) stay valid until the next @'waitEvent'@ call, or until the 'Mpv_handle' is destroyed. You must not write to the struct, and all memory referenced by it will be automatically released by the API on the next @'waitEvent'@ call, or when the context is destroyed. The return value is never NULL.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_wait_event@.
--                   The safe flavor is 'waitEventSafe'
--                   : blocks up to the timeout (negative waits forever); prefer the Safe alias, an unsafe call stalls every capability and GC meanwhile.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_wait_event@, defined at @mpv\/client.h 1716:23@
waitEvent
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> Double
  -- ^
  --
  --           [@timeout@]: Timeout in seconds, after which the function returns even if no event was received. A MPV_EVENT_NONE is returned on timeout. A value of 0 will disable waiting. Negative values will wait with an infinite timeout.
  -> IO (BG.Ptr Mpv_event)
waitEvent =
  \x00 ->
    \x11 -> Unsafe.mpv_wait_event x00 (Coerce.coerce x11)

-- | Wait for the next event, or until the timeout expires, or if another thread makes a call to @'wakeup'@. Passing 0 as timeout will never wait, and is suitable for polling.
--
--     The internal event queue has a limited size (per client handle). If you don\'t empty the event queue quickly enough with @'waitEvent'@, it will overflow and silently discard further events. If this happens, making asynchronous requests will fail as well (with MPV_ERROR_EVENT_QUEUE_FULL).
--
--     Only one thread is allowed to call this on the same 'Mpv_handle' at a time. The API won\'t complain if more than one thread calls this, but it will cause race conditions in the client when accessing the shared 'Mpv_event' struct. Note that most other API functions are not restricted by this, and no API function internally calls @'waitEvent'@. Additionally, concurrent calls to different mpv_handles are always safe.
--
--     As long as the timeout is 0, this is safe to be called from mpv render API threads.
--
--     [Returns]: A struct containing the event ID and other data. The pointer (and fields in the struct) stay valid until the next @'waitEvent'@ call, or until the 'Mpv_handle' is destroyed. You must not write to the struct, and all memory referenced by it will be automatically released by the API on the next @'waitEvent'@ call, or when the context is destroyed. The return value is never NULL.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_wait_event@.
--                   The unsafe flavor is 'waitEvent'
--                   : blocks up to the timeout (negative waits forever); prefer the Safe alias, an unsafe call stalls every capability and GC meanwhile.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_wait_event@, defined at @mpv\/client.h 1716:23@
waitEventSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> Double
  -- ^
  --
  --           [@timeout@]: Timeout in seconds, after which the function returns even if no event was received. A MPV_EVENT_NONE is returned on timeout. A value of 0 will disable waiting. Negative values will wait with an infinite timeout.
  -> IO (BG.Ptr Mpv_event)
waitEventSafe =
  \x00 ->
    \x11 -> Safe.mpv_wait_event x00 (Coerce.coerce x11)

-- | Interrupt the current @'waitEvent'@ call. This will wake up the thread currently waiting in @'waitEvent'@. If no thread is waiting, the next @'waitEvent'@ call will return immediately (this is to avoid lost wakeups).
--
--     @'waitEvent'@ will receive a MPV_EVENT_NONE if it\'s woken up due to this call. But note that this dummy event might be skipped if there are already other events queued. All what counts is that the waiting thread is woken up at all.
--
--     Safe to be called from mpv render API threads.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_wakeup@.
--                   The safe flavor is 'wakeupSafe'
--                   : runs the registered wakeup callback synchronously.
--
--     [C declaration]: @mpv_wakeup@, defined at @mpv\/client.h 1731:17@
wakeup
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO ()
wakeup = Unsafe.mpv_wakeup

-- | Interrupt the current @'waitEvent'@ call. This will wake up the thread currently waiting in @'waitEvent'@. If no thread is waiting, the next @'waitEvent'@ call will return immediately (this is to avoid lost wakeups).
--
--     @'waitEvent'@ will receive a MPV_EVENT_NONE if it\'s woken up due to this call. But note that this dummy event might be skipped if there are already other events queued. All what counts is that the waiting thread is woken up at all.
--
--     Safe to be called from mpv render API threads.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_wakeup@.
--                   The unsafe flavor is 'wakeup'
--                   : runs the registered wakeup callback synchronously.
--
--     [C declaration]: @mpv_wakeup@, defined at @mpv\/client.h 1731:17@
wakeupSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO ()
wakeupSafe = Safe.mpv_wakeup

-- | Set a custom function that should be called when there are new events. Use this if blocking in @'waitEvent'@ to wait for new events is not feasible.
--
--     Keep in mind that the callback will be called from foreign threads. You must not make any assumptions of the environment, and you must return as soon as possible (i.e. no long blocking waits). Exiting the callback through any other means than a normal return is forbidden (no throwing exceptions, no longjmp() calls). You must not change any local thread state (such as the C floating point environment).
--
--     You are not allowed to call any client API functions inside of the callback. In particular, you should not do any processing in the callback, but wake up another thread that does all the work. The callback is meant strictly for notification only, and is called from arbitrary core parts of the player, that make no considerations for reentrant API use or allowing the callee to spend a lot of time doing other things. Keep in mind that it\'s also possible that the callback is called from a thread while a mpv API function is called (i.e. it can be reentrant).
--
--     In general, the client API expects you to call @'waitEvent'@ to receive notifications, and the wakeup callback is merely a helper utility to make this easier in certain situations. Note that it\'s possible that there\'s only one wakeup callback invocation for multiple events. You should call @'waitEvent'@ with no timeout until MPV_EVENT_NONE is reached, at which point the event queue is empty.
--
--     If you actually want to do processing in a callback, spawn a thread that does nothing but call @'waitEvent'@ in a loop and dispatches the result to a callback.
--
--     Only one wakeup callback can be set.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_set_wakeup_callback@.
--                   The unsafe import is not exported
--                   : invokes the callback once immediately.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @Mpv.Sys.Bindgen.Client.Unsafe.mpv_set_wakeup_callback@.
--
--     [C declaration]: @mpv_set_wakeup_callback@, defined at @mpv\/client.h 1769:17@
setWakeupCallbackSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> BG.FunPtr (BG.Ptr BG.Void -> IO ())
  -- ^
  --
  --           [@cb@]: function that should be called if a wakeup is required
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@d@]: arbitrary userdata passed to cb
  -> IO ()
setWakeupCallbackSafe = Safe.mpv_set_wakeup_callback

-- | Block until all asynchronous requests are done. This affects functions like @'commandAsync'@, which return immediately and return their result as events.
--
--     This is a helper, and somewhat equivalent to calling @'waitEvent'@ in a loop until all known asynchronous requests have sent their reply as event, except that the event queue is not emptied.
--
--     In case you called mpv_suspend() before, this will also forcibly reset the suspend counter of the given handle.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_wait_async_requests@.
--                   The safe flavor is 'waitAsyncRequestsSafe'
--                   : blocks until every async request has replied; prefer the Safe alias, an unsafe call stalls every capability and GC meanwhile.
--
--     [C declaration]: @mpv_wait_async_requests@, defined at @mpv\/client.h 1783:17@
waitAsyncRequests
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO ()
waitAsyncRequests = Unsafe.mpv_wait_async_requests

-- | Block until all asynchronous requests are done. This affects functions like @'commandAsync'@, which return immediately and return their result as events.
--
--     This is a helper, and somewhat equivalent to calling @'waitEvent'@ in a loop until all known asynchronous requests have sent their reply as event, except that the event queue is not emptied.
--
--     In case you called mpv_suspend() before, this will also forcibly reset the suspend counter of the given handle.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_wait_async_requests@.
--                   The unsafe flavor is 'waitAsyncRequests'
--                   : blocks until every async request has replied; prefer the Safe alias, an unsafe call stalls every capability and GC meanwhile.
--
--     [C declaration]: @mpv_wait_async_requests@, defined at @mpv\/client.h 1783:17@
waitAsyncRequestsSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO ()
waitAsyncRequestsSafe = Safe.mpv_wait_async_requests

-- | A hook is like a synchronous event that blocks the player. You register a hook handler with this function. You will get an event, which you need to handle, and once things are ready, you can let the player continue with @'hookContinue'@.
--
--     Currently, hooks can\'t be removed explicitly. But they will be implicitly removed if the 'Mpv_handle' it was registered with is destroyed. This also continues the hook if it was being handled by the destroyed 'Mpv_handle' (but this should be avoided, as it might mess up order of hook execution).
--
--     Hook handlers are ordered globally by priority and order of registration. Handlers for the same hook with same priority are invoked in order of registration (the handler registered first is run first). Handlers with lower priority are run first (which seems backward).
--
--     See the \"Hooks\" section in the manpage to see which hooks are currently defined.
--
--     Some hooks might be reentrant (so you get multiple MPV_EVENT_HOOK for the same hook). If this can happen for a specific hook type, it will be explicitly documented in the manpage.
--
--     Only the 'Mpv_handle' on which this was called will receive the hook events, or can \"continue\" them.
--
--     [Returns]: error code (usually fails only on OOM)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_hook_add@.
--                   The safe flavor is 'hookAddSafe'
--                   : takes the core lock (an unbounded wait, per client.h) to register the handler.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_hook_add@, defined at @mpv\/client.h 1820:16@
hookAdd
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: This will be used for the @mpv_event.reply_userdata@ field for the received MPV_EVENT_HOOK events. If you have no use for this, pass 0.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The hook name. This should be one of the documented names. But if the name is unknown, the hook event will simply be never raised.
  -> BG.Int32
  -- ^
  --
  --           [@priority@]: See remarks above. Use 0 as a neutral default.
  -> IO BG.Int32
hookAdd =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Unsafe.mpv_hook_add x00 x11 x22 (Coerce.coerce x33))

-- | A hook is like a synchronous event that blocks the player. You register a hook handler with this function. You will get an event, which you need to handle, and once things are ready, you can let the player continue with @'hookContinue'@.
--
--     Currently, hooks can\'t be removed explicitly. But they will be implicitly removed if the 'Mpv_handle' it was registered with is destroyed. This also continues the hook if it was being handled by the destroyed 'Mpv_handle' (but this should be avoided, as it might mess up order of hook execution).
--
--     Hook handlers are ordered globally by priority and order of registration. Handlers for the same hook with same priority are invoked in order of registration (the handler registered first is run first). Handlers with lower priority are run first (which seems backward).
--
--     See the \"Hooks\" section in the manpage to see which hooks are currently defined.
--
--     Some hooks might be reentrant (so you get multiple MPV_EVENT_HOOK for the same hook). If this can happen for a specific hook type, it will be explicitly documented in the manpage.
--
--     Only the 'Mpv_handle' on which this was called will receive the hook events, or can \"continue\" them.
--
--     [Returns]: error code (usually fails only on OOM)
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_hook_add@.
--                   The unsafe flavor is 'hookAdd'
--                   : takes the core lock (an unbounded wait, per client.h) to register the handler.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_hook_add@, defined at @mpv\/client.h 1820:16@
hookAddSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@reply_userdata@]: This will be used for the @mpv_event.reply_userdata@ field for the received MPV_EVENT_HOOK events. If you have no use for this, pass 0.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: The hook name. This should be one of the documented names. But if the name is unknown, the hook event will simply be never raised.
  -> BG.Int32
  -- ^
  --
  --           [@priority@]: See remarks above. Use 0 as a neutral default.
  -> IO BG.Int32
hookAddSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Safe.mpv_hook_add x00 x11 x22 (Coerce.coerce x33))

-- | Respond to a MPV_EVENT_HOOK event. You must call this after you have handled the event. There is no way to \"cancel\" or \"stop\" the hook.
--
--     Calling this will will typically unblock the player for whatever the hook is responsible for (e.g. for the \"on_load\" hook it lets it continue playback).
--
--     It is explicitly undefined behavior to call this more than once for each MPV_EVENT_HOOK, to pass an incorrect ID, or to call this on a 'Mpv_handle' different from the one that registered the handler and received the event.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_hook_continue@.
--                   The safe flavor is 'hookContinueSafe'
--                   : takes the core lock, then sends MPV_EVENT_HOOK to the next handler, running its wakeup callback synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_hook_continue@, defined at @mpv\/client.h 1839:16@
hookContinue
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@id@]: This must be the value of the @mpv_event_hook.id@ field for the corresponding MPV_EVENT_HOOK.
  -> IO BG.Int32
hookContinue =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.mpv_hook_continue x00 x11)

-- | Respond to a MPV_EVENT_HOOK event. You must call this after you have handled the event. There is no way to \"cancel\" or \"stop\" the hook.
--
--     Calling this will will typically unblock the player for whatever the hook is responsible for (e.g. for the \"on_load\" hook it lets it continue playback).
--
--     It is explicitly undefined behavior to call this more than once for each MPV_EVENT_HOOK, to pass an incorrect ID, or to call this on a 'Mpv_handle' different from the one that registered the handler and received the event.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_hook_continue@.
--                   The unsafe flavor is 'hookContinue'
--                   : takes the core lock, then sends MPV_EVENT_HOOK to the next handler, running its wakeup callback synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_hook_continue@, defined at @mpv\/client.h 1839:16@
hookContinueSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> HsBindgen.Runtime.LibC.Word64
  -- ^
  --
  --           [@id@]: This must be the value of the @mpv_event_hook.id@ field for the corresponding MPV_EVENT_HOOK.
  -> IO BG.Int32
hookContinueSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.mpv_hook_continue x00 x11)

-- | Return a UNIX file descriptor referring to the read end of a pipe. This pipe can be used to wake up a poll() based processing loop. The purpose of this function is very similar to @'setWakeupCallbackSafe'@, and provides a primitive mechanism to handle coordinating a foreign event loop and the libmpv event loop. The pipe is non-blocking. It\'s closed when the 'Mpv_handle' is destroyed. This function always returns the same value (on success).
--
--     This is in fact implemented using the same underlying code as for @'setWakeupCallbackSafe'@ (though they don\'t conflict), and it is as if each callback invocation writes a single 0 byte to the pipe. When the pipe becomes readable, the code calling poll() (or select()) on the pipe should read all contents of the pipe and then call mpv_wait_event(c, 0) until no new events are returned. The pipe contents do not matter and can just be discarded. There is not necessarily one byte per readable event in the pipe. For example, the pipes are non-blocking, and mpv won\'t block if the pipe is full. Pipes are normally limited to 4096 bytes, so if there are more than 4096 events, the number of readable bytes can not equal the number of events queued. Also, it\'s possible that mpv does not write to the pipe once it\'s guaranteed that the client was already signaled. See the example below how to do it correctly.
--
--     Example:
--
--     int pipefd = mpv_get_wakeup_pipe(mpv); if (pipefd \< 0) error(); while (1) { struct pollfd pfds[1] = { { .fd = pipefd, .events = POLLIN }, }; \/\/ Wait until there are possibly new mpv events. poll(pfds, 1, -1); if (pfds[0].revents & POLLIN) { \/\/ Empty the pipe. Doing this before calling @'waitEvent'@ \/\/ ensures that no wakeups are missed. It\'s not so important to \/\/ make sure the pipe is really empty (it will just cause some \/\/ additional wakeups in unlikely corner cases). char unused[256]; read(pipefd, unused, sizeof(unused)); while (1) {'Mpv_event' *ev = mpv_wait_event(mpv, 0); \/\/ If MPV_EVENT_NONE is received, the event queue is empty. if (ev->event_id == MPV_EVENT_NONE) break; \/\/ Process the event. ... } } }
--
--     [Deprecated]: this function will be removed in the future. If you need this functionality, use @'setWakeupCallbackSafe'@, create a pipe manually, and call write() on your pipe in the callback.
--
--     [Returns]: A UNIX FD of the read end of the wakeup pipe, or -1 on error. On MS Windows\/MinGW, this will always return -1.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_get_wakeup_pipe@.
--                   The safe flavor is 'getWakeupPipeSafe'
--                   : takes the wakeup lock, which mpv holds while running the wakeup callback; creates the pipe on first use.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_get_wakeup_pipe@, defined at @mpv\/client.h 1901:16@
getWakeupPipe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO BG.Int32
getWakeupPipe =
  \x00 ->
    fmap Coerce.coerce (Unsafe.mpv_get_wakeup_pipe x00)

-- | Return a UNIX file descriptor referring to the read end of a pipe. This pipe can be used to wake up a poll() based processing loop. The purpose of this function is very similar to @'setWakeupCallbackSafe'@, and provides a primitive mechanism to handle coordinating a foreign event loop and the libmpv event loop. The pipe is non-blocking. It\'s closed when the 'Mpv_handle' is destroyed. This function always returns the same value (on success).
--
--     This is in fact implemented using the same underlying code as for @'setWakeupCallbackSafe'@ (though they don\'t conflict), and it is as if each callback invocation writes a single 0 byte to the pipe. When the pipe becomes readable, the code calling poll() (or select()) on the pipe should read all contents of the pipe and then call mpv_wait_event(c, 0) until no new events are returned. The pipe contents do not matter and can just be discarded. There is not necessarily one byte per readable event in the pipe. For example, the pipes are non-blocking, and mpv won\'t block if the pipe is full. Pipes are normally limited to 4096 bytes, so if there are more than 4096 events, the number of readable bytes can not equal the number of events queued. Also, it\'s possible that mpv does not write to the pipe once it\'s guaranteed that the client was already signaled. See the example below how to do it correctly.
--
--     Example:
--
--     int pipefd = mpv_get_wakeup_pipe(mpv); if (pipefd \< 0) error(); while (1) { struct pollfd pfds[1] = { { .fd = pipefd, .events = POLLIN }, }; \/\/ Wait until there are possibly new mpv events. poll(pfds, 1, -1); if (pfds[0].revents & POLLIN) { \/\/ Empty the pipe. Doing this before calling @'waitEvent'@ \/\/ ensures that no wakeups are missed. It\'s not so important to \/\/ make sure the pipe is really empty (it will just cause some \/\/ additional wakeups in unlikely corner cases). char unused[256]; read(pipefd, unused, sizeof(unused)); while (1) {'Mpv_event' *ev = mpv_wait_event(mpv, 0); \/\/ If MPV_EVENT_NONE is received, the event queue is empty. if (ev->event_id == MPV_EVENT_NONE) break; \/\/ Process the event. ... } } }
--
--     [Deprecated]: this function will be removed in the future. If you need this functionality, use @'setWakeupCallbackSafe'@, create a pipe manually, and call write() on your pipe in the callback.
--
--     [Returns]: A UNIX FD of the read end of the wakeup pipe, or -1 on error. On MS Windows\/MinGW, this will always return -1.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_get_wakeup_pipe@.
--                   The unsafe flavor is 'getWakeupPipe'
--                   : takes the wakeup lock, which mpv holds while running the wakeup callback; creates the pipe on first use.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_get_wakeup_pipe@, defined at @mpv\/client.h 1901:16@
getWakeupPipeSafe
  :: BG.Ptr Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> IO BG.Int32
getWakeupPipeSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.mpv_get_wakeup_pipe x00)

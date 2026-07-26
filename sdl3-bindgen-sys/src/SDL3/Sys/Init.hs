{-# LANGUAGE PatternSynonyms #-}

-- | All SDL programs need to initialize the library before starting to work with it.
--
--     Almost everything can simply call @'init'@ near startup, with a handful of flags to specify subsystems to touch. These are here to make sure SDL does not even attempt to touch low-level pieces of the operating system that you don\'t intend to use. For example, you might be using SDL for video and input but chose an external library for audio, and in this case you would just need to leave off the @'sDL_INIT_AUDIO'@ flag to make sure that external library has complete control.
--
--     Most apps, when terminating, should call @'quit'@. This will clean up (nearly) everything that SDL might have allocated, and crucially, it\'ll make sure that the display\'s resolution is back to what the user expects if you had previously changed it for your game.
--
--     SDL3 apps are strongly encouraged to call @'setAppMetadata'@ at startup to fill in details about the program. This is completely optional, but it helps in small ways (we can provide an About dialog box for the macOS menu, we can name the app in the system\'s audio mixer, etc). Those that want to provide a /lot/ of information should look at the more-detailed @'setAppMetadataProperty'@. Initialization flags for 'init' and\/or 'initSubSystem'
--
--     These are the flags which may be passed to @'init'@. You should specify the subsystems which you will be using in your application.
--
--     @since 3.2.0
--
--     [See also]: 'init', 'quit', 'initSubSystem', 'quitSubSystem', 'wasInit'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Init.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Init (
  module SDL3.Sys.Bindgen.Init,

  -- * Typed constants
  pattern SDL3.Sys.Init.SDL_INIT_AUDIO,
  pattern SDL3.Sys.Init.SDL_INIT_VIDEO,
  pattern SDL3.Sys.Init.SDL_INIT_JOYSTICK,
  pattern SDL3.Sys.Init.SDL_INIT_HAPTIC,
  pattern SDL3.Sys.Init.SDL_INIT_GAMEPAD,
  pattern SDL3.Sys.Init.SDL_INIT_EVENTS,
  pattern SDL3.Sys.Init.SDL_INIT_SENSOR,
  pattern SDL3.Sys.Init.SDL_INIT_CAMERA,

  -- * Function aliases
  SDL3.Sys.Init.init,
  SDL3.Sys.Init.initSafe,
  SDL3.Sys.Init.initSubSystem,
  SDL3.Sys.Init.initSubSystemSafe,
  SDL3.Sys.Init.quitSubSystem,
  SDL3.Sys.Init.quitSubSystemSafe,
  SDL3.Sys.Init.wasInit,
  SDL3.Sys.Init.wasInitSafe,
  SDL3.Sys.Init.quit,
  SDL3.Sys.Init.quitSafe,
  SDL3.Sys.Init.isMainThread,
  SDL3.Sys.Init.isMainThreadSafe,
  SDL3.Sys.Init.runOnMainThreadSafe,
  SDL3.Sys.Init.setAppMetadata,
  SDL3.Sys.Init.setAppMetadataSafe,
  SDL3.Sys.Init.setAppMetadataProperty,
  SDL3.Sys.Init.setAppMetadataPropertySafe,
  SDL3.Sys.Init.getAppMetadataProperty,
  SDL3.Sys.Init.getAppMetadataPropertySafe,
)
where

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Init
import SDL3.Sys.Bindgen.Init.Safe qualified as Safe
import SDL3.Sys.Bindgen.Init.Unsafe qualified as Unsafe

-- | Initialize the SDL library.
--
--     @'init'@ simply forwards to calling @'initSubSystem'@. Therefore, the two may be used interchangeably. Though for readability of your code @'initSubSystem'@ might be preferred.
--
--     The file I\/O (for example: SDL_IOFromFile) and threading (SDL_CreateThread) subsystems are initialized by default. Message boxes (SDL_ShowSimpleMessageBox) also attempt to work without initializing the video subsystem, in hopes of being useful in showing an error dialog when 'init' fails. You must specifically initialize other subsystems if you use them in your application.
--
--     Logging (such as SDL_Log) works without initialization, too.
--
--     @flags@ may be any of the following OR\'d together:
--
--     * @'sDL_INIT_AUDIO'@: audio subsystem; automatically initializes the events subsystem
--
--     * @'sDL_INIT_VIDEO'@: video subsystem; automatically initializes the events subsystem, should be initialized on the main thread.
--
--     * @'sDL_INIT_JOYSTICK'@: joystick subsystem; automatically initializes the events subsystem
--
--     * @'sDL_INIT_HAPTIC'@: haptic (force feedback) subsystem
--
--     * @'sDL_INIT_GAMEPAD'@: gamepad subsystem; automatically initializes the joystick subsystem
--
--     * @'sDL_INIT_EVENTS'@: events subsystem
--
--     * @'sDL_INIT_SENSOR'@: sensor subsystem; automatically initializes the events subsystem
--
--     * @'sDL_INIT_CAMERA'@: camera subsystem; automatically initializes the events subsystem
--
--     Subsystem initialization is ref-counted, you must call @'quitSubSystem'@ for each @'initSubSystem'@ to correctly shutdown a subsystem manually (or call @'quit'@ to force shutdown). If a subsystem is already loaded then this call will increase the ref-count and return.
--
--     Consider reporting some basic metadata about your application before calling 'init', using either @'setAppMetadata'@ or @'setAppMetadataProperty'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAppMetadata', 'setAppMetadataProperty', 'initSubSystem', 'quit', 'SDL3.Sys.Main.setMainReady', 'wasInit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Init@.
--                   The safe flavor is 'initSafe'
--                   : driver loading can take hundreds of milliseconds.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_Init@, defined at @SDL3\/SDL_init.h 238:34@
init
  :: SDL_InitFlags
  -- ^
  --
  --           [@flags@]: subsystem initialization flags.
  -> IO Bool
init =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_Init x00)

-- | Initialize the SDL library.
--
--     @'init'@ simply forwards to calling @'initSubSystem'@. Therefore, the two may be used interchangeably. Though for readability of your code @'initSubSystem'@ might be preferred.
--
--     The file I\/O (for example: SDL_IOFromFile) and threading (SDL_CreateThread) subsystems are initialized by default. Message boxes (SDL_ShowSimpleMessageBox) also attempt to work without initializing the video subsystem, in hopes of being useful in showing an error dialog when 'init' fails. You must specifically initialize other subsystems if you use them in your application.
--
--     Logging (such as SDL_Log) works without initialization, too.
--
--     @flags@ may be any of the following OR\'d together:
--
--     * @'sDL_INIT_AUDIO'@: audio subsystem; automatically initializes the events subsystem
--
--     * @'sDL_INIT_VIDEO'@: video subsystem; automatically initializes the events subsystem, should be initialized on the main thread.
--
--     * @'sDL_INIT_JOYSTICK'@: joystick subsystem; automatically initializes the events subsystem
--
--     * @'sDL_INIT_HAPTIC'@: haptic (force feedback) subsystem
--
--     * @'sDL_INIT_GAMEPAD'@: gamepad subsystem; automatically initializes the joystick subsystem
--
--     * @'sDL_INIT_EVENTS'@: events subsystem
--
--     * @'sDL_INIT_SENSOR'@: sensor subsystem; automatically initializes the events subsystem
--
--     * @'sDL_INIT_CAMERA'@: camera subsystem; automatically initializes the events subsystem
--
--     Subsystem initialization is ref-counted, you must call @'quitSubSystem'@ for each @'initSubSystem'@ to correctly shutdown a subsystem manually (or call @'quit'@ to force shutdown). If a subsystem is already loaded then this call will increase the ref-count and return.
--
--     Consider reporting some basic metadata about your application before calling 'init', using either @'setAppMetadata'@ or @'setAppMetadataProperty'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAppMetadata', 'setAppMetadataProperty', 'initSubSystem', 'quit', 'SDL3.Sys.Main.setMainReady', 'wasInit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Init@.
--                   The unsafe flavor is 'init'
--                   : driver loading can take hundreds of milliseconds.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_Init@, defined at @SDL3\/SDL_init.h 238:34@
initSafe
  :: SDL_InitFlags
  -- ^
  --
  --           [@flags@]: subsystem initialization flags.
  -> IO Bool
initSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_Init x00)

-- | Compatibility function to initialize the SDL library.
--
--     This function and @'init'@ are interchangeable.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'init', 'quit', 'quitSubSystem'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_InitSubSystem@.
--                   The safe flavor is 'initSubSystemSafe'
--                   : driver loading can take hundreds of milliseconds.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_InitSubSystem@, defined at @SDL3\/SDL_init.h 257:34@
initSubSystem
  :: SDL_InitFlags
  -- ^
  --
  --           [@flags@]: any of the flags used by @'init'@; see 'init' for details.
  -> IO Bool
initSubSystem =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_InitSubSystem x00)

-- | Compatibility function to initialize the SDL library.
--
--     This function and @'init'@ are interchangeable.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'init', 'quit', 'quitSubSystem'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_InitSubSystem@.
--                   The unsafe flavor is 'initSubSystem'
--                   : driver loading can take hundreds of milliseconds.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_InitSubSystem@, defined at @SDL3\/SDL_init.h 257:34@
initSubSystemSafe
  :: SDL_InitFlags
  -- ^
  --
  --           [@flags@]: any of the flags used by @'init'@; see 'init' for details.
  -> IO Bool
initSubSystemSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_InitSubSystem x00)

-- | Shut down specific SDL subsystems.
--
--     You still need to call @'quit'@ even if you close all open subsystems with @'quitSubSystem'@.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'initSubSystem', 'quit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_QuitSubSystem@.
--                   The safe flavor is 'quitSubSystemSafe'
--                   : video quit invokes the clipboard cleanup callback synchronously.
--
--     [C declaration]: @SDL_QuitSubSystem@, defined at @SDL3\/SDL_init.h 274:34@
quitSubSystem
  :: SDL_InitFlags
  -- ^
  --
  --           [@flags@]: any of the flags used by @'init'@; see 'init' for details.
  -> IO ()
quitSubSystem = Unsafe.sDL_QuitSubSystem

-- | Shut down specific SDL subsystems.
--
--     You still need to call @'quit'@ even if you close all open subsystems with @'quitSubSystem'@.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'initSubSystem', 'quit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_QuitSubSystem@.
--                   The unsafe flavor is 'quitSubSystem'
--                   : video quit invokes the clipboard cleanup callback synchronously.
--
--     [C declaration]: @SDL_QuitSubSystem@, defined at @SDL3\/SDL_init.h 274:34@
quitSubSystemSafe
  :: SDL_InitFlags
  -- ^
  --
  --           [@flags@]: any of the flags used by @'init'@; see 'init' for details.
  -> IO ()
quitSubSystemSafe = Safe.sDL_QuitSubSystem

-- | Get a mask of the specified subsystems which are currently initialized.
--
--     [Returns]: a mask of all initialized subsystems if @flags@ is 0, otherwise it returns the initialization status of the specified subsystems.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'init', 'initSubSystem'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WasInit@.
--                   The safe flavor is 'wasInitSafe'
--                   .
--
--     [C declaration]: @SDL_WasInit@, defined at @SDL3\/SDL_init.h 290:43@
wasInit
  :: SDL_InitFlags
  -- ^
  --
  --           [@flags@]: any of the flags used by @'init'@; see 'init' for details.
  -> IO SDL_InitFlags
wasInit = Unsafe.sDL_WasInit

-- | Get a mask of the specified subsystems which are currently initialized.
--
--     [Returns]: a mask of all initialized subsystems if @flags@ is 0, otherwise it returns the initialization status of the specified subsystems.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'init', 'initSubSystem'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WasInit@.
--                   The unsafe flavor is 'wasInit'
--                   .
--
--     [C declaration]: @SDL_WasInit@, defined at @SDL3\/SDL_init.h 290:43@
wasInitSafe
  :: SDL_InitFlags
  -- ^
  --
  --           [@flags@]: any of the flags used by @'init'@; see 'init' for details.
  -> IO SDL_InitFlags
wasInitSafe = Safe.sDL_WasInit

-- | Clean up all initialized subsystems.
--
--     You should call this function even if you have already shutdown each initialized subsystem with @'quitSubSystem'@. It is safe to call this function even in the case of errors in initialization.
--
--     You can use this function with atexit() to ensure that it is run when your application is shutdown, but it is not wise to do this from a library or other dynamically loaded code.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'init', 'quitSubSystem'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Quit@.
--                   The safe flavor is 'quitSafe'
--                   : video quit invokes the clipboard cleanup callback synchronously.
--
--     [C declaration]: @SDL_Quit@, defined at @SDL3\/SDL_init.h 310:34@
quit :: IO ()
quit = Unsafe.sDL_Quit

-- | Clean up all initialized subsystems.
--
--     You should call this function even if you have already shutdown each initialized subsystem with @'quitSubSystem'@. It is safe to call this function even in the case of errors in initialization.
--
--     You can use this function with atexit() to ensure that it is run when your application is shutdown, but it is not wise to do this from a library or other dynamically loaded code.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'init', 'quitSubSystem'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Quit@.
--                   The unsafe flavor is 'quit'
--                   : video quit invokes the clipboard cleanup callback synchronously.
--
--     [C declaration]: @SDL_Quit@, defined at @SDL3\/SDL_init.h 310:34@
quitSafe :: IO ()
quitSafe = Safe.sDL_Quit

-- | Return whether this is the main thread.
--
--     On Apple platforms, the main thread is the thread that runs your program\'s main() entry point. On other platforms, the main thread is the one that calls SDL_Init(SDL_INIT_VIDEO), which should usually be the one that runs your program\'s main() entry point. If you are using the main callbacks, SDL_AppInit(), SDL_AppIterate(), and SDL_AppQuit() are all called on the main thread.
--
--     [Returns]: true if this thread is the main thread, or false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'runOnMainThreadSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IsMainThread@.
--                   The safe flavor is 'isMainThreadSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsMainThread@, defined at @SDL3\/SDL_init.h 330:34@
isMainThread :: IO Bool
isMainThread =
  fmap CBool.toBool Unsafe.sDL_IsMainThread

-- | Return whether this is the main thread.
--
--     On Apple platforms, the main thread is the thread that runs your program\'s main() entry point. On other platforms, the main thread is the one that calls SDL_Init(SDL_INIT_VIDEO), which should usually be the one that runs your program\'s main() entry point. If you are using the main callbacks, SDL_AppInit(), SDL_AppIterate(), and SDL_AppQuit() are all called on the main thread.
--
--     [Returns]: true if this thread is the main thread, or false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'runOnMainThreadSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IsMainThread@.
--                   The unsafe flavor is 'isMainThread'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsMainThread@, defined at @SDL3\/SDL_init.h 330:34@
isMainThreadSafe :: IO Bool
isMainThreadSafe =
  fmap CBool.toBool Safe.sDL_IsMainThread

-- | Call a function on the main thread during event processing.
--
--     If this is called on the main thread, the callback is executed immediately. If this is called on another thread, this callback is queued for execution on the main thread during event processing.
--
--     Be careful of deadlocks when using this functionality. You should not have the main thread wait for the current thread while this function is being called with @wait_complete@ true.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'isMainThread'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RunOnMainThread@.
--                   The unsafe import is not exported
--                   : invokes synchronously on the main thread, or blocks until the main thread runs it.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Init.Unsafe.sDL_RunOnMainThread@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RunOnMainThread@, defined at @SDL3\/SDL_init.h 367:34@
runOnMainThreadSafe
  :: SDL_MainThreadCallback
  -- ^
  --
  --           [@callback@]: the callback to call on the main thread.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @callback@.
  -> Bool
  -- ^
  --
  --           [@wait_complete@]: true to wait for the callback to complete, false to return immediately.
  -> IO Bool
runOnMainThreadSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_RunOnMainThread x00 x11 (CBool.fromBool x22))

-- | Specify basic metadata about your app.
--
--     You can optionally provide metadata about your app to SDL. This is not required, but strongly encouraged.
--
--     There are several locations where SDL can make use of metadata (an \"About\" box in the macOS menu bar, the name of the app can be shown on some audio mixers, etc). Any piece of metadata can be left as NULL, if a specific detail doesn\'t make sense for the app.
--
--     This function should be called as early as possible, before 'init'. Multiple calls to this function are allowed, but various state might not change once it has been set up with a previous call to this function.
--
--     Passing a NULL removes any previous metadata.
--
--     This is a simplified interface for the most important information. You can supply significantly more detailed metadata with @'setAppMetadataProperty'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAppMetadataProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAppMetadata@.
--                   The safe flavor is 'setAppMetadataSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAppMetadata@, defined at @SDL3\/SDL_init.h 405:34@
setAppMetadata
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@appname@]: The name of the application (\"My Game 2: Bad Guy\'s Revenge!\").
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@appversion@]: The version of the application (\"1.0.0beta5\" or a git hash, or whatever makes sense).
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@appidentifier@]: A unique string in reverse-domain format that identifies this app (\"com.example.mygame2\").
  -> IO Bool
setAppMetadata =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetAppMetadata x00 x11 x22)

-- | Specify basic metadata about your app.
--
--     You can optionally provide metadata about your app to SDL. This is not required, but strongly encouraged.
--
--     There are several locations where SDL can make use of metadata (an \"About\" box in the macOS menu bar, the name of the app can be shown on some audio mixers, etc). Any piece of metadata can be left as NULL, if a specific detail doesn\'t make sense for the app.
--
--     This function should be called as early as possible, before 'init'. Multiple calls to this function are allowed, but various state might not change once it has been set up with a previous call to this function.
--
--     Passing a NULL removes any previous metadata.
--
--     This is a simplified interface for the most important information. You can supply significantly more detailed metadata with @'setAppMetadataProperty'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAppMetadataProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAppMetadata@.
--                   The unsafe flavor is 'setAppMetadata'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAppMetadata@, defined at @SDL3\/SDL_init.h 405:34@
setAppMetadataSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@appname@]: The name of the application (\"My Game 2: Bad Guy\'s Revenge!\").
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@appversion@]: The version of the application (\"1.0.0beta5\" or a git hash, or whatever makes sense).
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@appidentifier@]: A unique string in reverse-domain format that identifies this app (\"com.example.mygame2\").
  -> IO Bool
setAppMetadataSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetAppMetadata x00 x11 x22)

-- | Specify metadata about your app through a set of properties.
--
--     You can optionally provide metadata about your app to SDL. This is not required, but strongly encouraged.
--
--     There are several locations where SDL can make use of metadata (an \"About\" box in the macOS menu bar, the name of the app can be shown on some audio mixers, etc). Any piece of metadata can be left out, if a specific detail doesn\'t make sense for the app.
--
--     This function should be called as early as possible, before 'init'. Multiple calls to this function are allowed, but various state might not change once it has been set up with a previous call to this function.
--
--     Once set, this metadata can be read using @'getAppMetadataProperty'@.
--
--     These are the supported properties:
--
--     * @'sDL_PROP_APP_METADATA_NAME_STRING'@: The human-readable name of the application, like \"My Game 2: Bad Guy\'s Revenge!\". This will show up anywhere the OS shows the name of the application separately from window titles, such as volume control applets, etc. This defaults to \"SDL Application\".
--
--     * @'sDL_PROP_APP_METADATA_VERSION_STRING'@: The version of the app that is running; there are no rules on format, so \"1.0.3beta2\" and \"April 22nd, 2024\" and a git hash are all valid options. This has no default.
--
--     * @'sDL_PROP_APP_METADATA_IDENTIFIER_STRING'@: A unique string that identifies this app. This must be in reverse-domain format, like \"com.example.mygame2\". This string is used by desktop compositors to identify and group windows together, as well as match applications with associated desktop settings and icons. If you plan to package your application in a container such as Flatpak, the app ID should match the name of your Flatpak container as well. This has no default.
--
--     * @'sDL_PROP_APP_METADATA_CREATOR_STRING'@: The human-readable name of the creator\/developer\/maker of this app, like \"MojoWorkshop, LLC\"
--
--     * @'sDL_PROP_APP_METADATA_COPYRIGHT_STRING'@: The human-readable copyright notice, like \"Copyright (c) 2024 MojoWorkshop, LLC\" or whatnot. Keep this to one line, don\'t paste a copy of a whole software license in here. This has no default.
--
--     * @'sDL_PROP_APP_METADATA_URL_STRING'@: A URL to the app on the web. Maybe a product page, or a storefront, or even a GitHub repository, for user\'s further information This has no default.
--
--     * @'sDL_PROP_APP_METADATA_TYPE_STRING'@: The type of application this is. Currently this string can be \"game\" for a video game, \"mediaplayer\" for a media player, or generically \"application\" if nothing else applies. Future versions of SDL might add new types. This defaults to \"application\".
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAppMetadataProperty', 'setAppMetadata'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAppMetadataProperty@.
--                   The safe flavor is 'setAppMetadataPropertySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAppMetadataProperty@, defined at @SDL3\/SDL_init.h 468:34@
setAppMetadataProperty
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the metadata property to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the property, or NULL to remove that property.
  -> IO Bool
setAppMetadataProperty =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetAppMetadataProperty x00 x11)

-- | Specify metadata about your app through a set of properties.
--
--     You can optionally provide metadata about your app to SDL. This is not required, but strongly encouraged.
--
--     There are several locations where SDL can make use of metadata (an \"About\" box in the macOS menu bar, the name of the app can be shown on some audio mixers, etc). Any piece of metadata can be left out, if a specific detail doesn\'t make sense for the app.
--
--     This function should be called as early as possible, before 'init'. Multiple calls to this function are allowed, but various state might not change once it has been set up with a previous call to this function.
--
--     Once set, this metadata can be read using @'getAppMetadataProperty'@.
--
--     These are the supported properties:
--
--     * @'sDL_PROP_APP_METADATA_NAME_STRING'@: The human-readable name of the application, like \"My Game 2: Bad Guy\'s Revenge!\". This will show up anywhere the OS shows the name of the application separately from window titles, such as volume control applets, etc. This defaults to \"SDL Application\".
--
--     * @'sDL_PROP_APP_METADATA_VERSION_STRING'@: The version of the app that is running; there are no rules on format, so \"1.0.3beta2\" and \"April 22nd, 2024\" and a git hash are all valid options. This has no default.
--
--     * @'sDL_PROP_APP_METADATA_IDENTIFIER_STRING'@: A unique string that identifies this app. This must be in reverse-domain format, like \"com.example.mygame2\". This string is used by desktop compositors to identify and group windows together, as well as match applications with associated desktop settings and icons. If you plan to package your application in a container such as Flatpak, the app ID should match the name of your Flatpak container as well. This has no default.
--
--     * @'sDL_PROP_APP_METADATA_CREATOR_STRING'@: The human-readable name of the creator\/developer\/maker of this app, like \"MojoWorkshop, LLC\"
--
--     * @'sDL_PROP_APP_METADATA_COPYRIGHT_STRING'@: The human-readable copyright notice, like \"Copyright (c) 2024 MojoWorkshop, LLC\" or whatnot. Keep this to one line, don\'t paste a copy of a whole software license in here. This has no default.
--
--     * @'sDL_PROP_APP_METADATA_URL_STRING'@: A URL to the app on the web. Maybe a product page, or a storefront, or even a GitHub repository, for user\'s further information This has no default.
--
--     * @'sDL_PROP_APP_METADATA_TYPE_STRING'@: The type of application this is. Currently this string can be \"game\" for a video game, \"mediaplayer\" for a media player, or generically \"application\" if nothing else applies. Future versions of SDL might add new types. This defaults to \"application\".
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAppMetadataProperty', 'setAppMetadata'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAppMetadataProperty@.
--                   The unsafe flavor is 'setAppMetadataProperty'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAppMetadataProperty@, defined at @SDL3\/SDL_init.h 468:34@
setAppMetadataPropertySafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the metadata property to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the property, or NULL to remove that property.
  -> IO Bool
setAppMetadataPropertySafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetAppMetadataProperty x00 x11)

-- | Get metadata about your app.
--
--     This returns metadata previously set using @'setAppMetadata'@ or @'setAppMetadataProperty'@. See @'setAppMetadataProperty'@ for the list of available properties and their meanings.
--
--     [Returns]: the current value of the metadata property, or the default if it is not set, NULL for properties with no default.
--
--     [Thread safety]: It is safe to call this function from any thread, although the string returned is not protected and could potentially be freed if you call @'setAppMetadataProperty'@ to set that property from another thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAppMetadata', 'setAppMetadataProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAppMetadataProperty@.
--                   The safe flavor is 'getAppMetadataPropertySafe'
--                   .
--
--     [C declaration]: @SDL_GetAppMetadataProperty@, defined at @SDL3\/SDL_init.h 499:42@
getAppMetadataProperty
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the metadata property to get.
  -> IO (PtrConst.PtrConst BG.CChar)
getAppMetadataProperty =
  Unsafe.sDL_GetAppMetadataProperty

-- | Get metadata about your app.
--
--     This returns metadata previously set using @'setAppMetadata'@ or @'setAppMetadataProperty'@. See @'setAppMetadataProperty'@ for the list of available properties and their meanings.
--
--     [Returns]: the current value of the metadata property, or the default if it is not set, NULL for properties with no default.
--
--     [Thread safety]: It is safe to call this function from any thread, although the string returned is not protected and could potentially be freed if you call @'setAppMetadataProperty'@ to set that property from another thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAppMetadata', 'setAppMetadataProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAppMetadataProperty@.
--                   The unsafe flavor is 'getAppMetadataProperty'
--                   .
--
--     [C declaration]: @SDL_GetAppMetadataProperty@, defined at @SDL3\/SDL_init.h 499:42@
getAppMetadataPropertySafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the metadata property to get.
  -> IO (PtrConst.PtrConst BG.CChar)
getAppMetadataPropertySafe =
  Safe.sDL_GetAppMetadataProperty

-- | Typed constant for macro @SDL_INIT_AUDIO@. Combine with @.|.@ from "Data.Bits".
pattern SDL_INIT_AUDIO :: SDL_InitFlags
pattern SDL_INIT_AUDIO = SDL_InitFlags 0x00000010

-- | Typed constant for macro @SDL_INIT_VIDEO@. Combine with @.|.@ from "Data.Bits".
pattern SDL_INIT_VIDEO :: SDL_InitFlags
pattern SDL_INIT_VIDEO = SDL_InitFlags 0x00000020

-- | Typed constant for macro @SDL_INIT_JOYSTICK@. Combine with @.|.@ from "Data.Bits".
pattern SDL_INIT_JOYSTICK :: SDL_InitFlags
pattern SDL_INIT_JOYSTICK = SDL_InitFlags 0x00000200

-- | Typed constant for macro @SDL_INIT_HAPTIC@. Combine with @.|.@ from "Data.Bits".
pattern SDL_INIT_HAPTIC :: SDL_InitFlags
pattern SDL_INIT_HAPTIC = SDL_InitFlags 0x00001000

-- | Typed constant for macro @SDL_INIT_GAMEPAD@. Combine with @.|.@ from "Data.Bits".
pattern SDL_INIT_GAMEPAD :: SDL_InitFlags
pattern SDL_INIT_GAMEPAD = SDL_InitFlags 0x00002000

-- | Typed constant for macro @SDL_INIT_EVENTS@. Combine with @.|.@ from "Data.Bits".
pattern SDL_INIT_EVENTS :: SDL_InitFlags
pattern SDL_INIT_EVENTS = SDL_InitFlags 0x00004000

-- | Typed constant for macro @SDL_INIT_SENSOR@. Combine with @.|.@ from "Data.Bits".
pattern SDL_INIT_SENSOR :: SDL_InitFlags
pattern SDL_INIT_SENSOR = SDL_InitFlags 0x00008000

-- | Typed constant for macro @SDL_INIT_CAMERA@. Combine with @.|.@ from "Data.Bits".
pattern SDL_INIT_CAMERA :: SDL_InitFlags
pattern SDL_INIT_CAMERA = SDL_InitFlags 0x00010000

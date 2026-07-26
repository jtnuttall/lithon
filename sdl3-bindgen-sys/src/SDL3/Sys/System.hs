-- | Platform-specific SDL API functions.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.System.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.System (
  module SDL3.Sys.Bindgen.System,

  -- * Function aliases
  SDL3.Sys.System.setX11EventHook,
  SDL3.Sys.System.setX11EventHookSafe,
  SDL3.Sys.System.setLinuxThreadPriority,
  SDL3.Sys.System.setLinuxThreadPrioritySafe,
  SDL3.Sys.System.setLinuxThreadPriorityAndPolicy,
  SDL3.Sys.System.setLinuxThreadPriorityAndPolicySafe,
  SDL3.Sys.System.isTablet,
  SDL3.Sys.System.isTabletSafe,
  SDL3.Sys.System.isTV,
  SDL3.Sys.System.isTVSafe,
  SDL3.Sys.System.getSandbox,
  SDL3.Sys.System.getSandboxSafe,
  SDL3.Sys.System.onApplicationWillTerminate,
  SDL3.Sys.System.onApplicationWillTerminateSafe,
  SDL3.Sys.System.onApplicationDidReceiveMemoryWarning,
  SDL3.Sys.System.onApplicationDidReceiveMemoryWarningSafe,
  SDL3.Sys.System.onApplicationWillEnterBackground,
  SDL3.Sys.System.onApplicationWillEnterBackgroundSafe,
  SDL3.Sys.System.onApplicationDidEnterBackground,
  SDL3.Sys.System.onApplicationDidEnterBackgroundSafe,
  SDL3.Sys.System.onApplicationWillEnterForeground,
  SDL3.Sys.System.onApplicationWillEnterForegroundSafe,
  SDL3.Sys.System.onApplicationDidEnterForeground,
  SDL3.Sys.System.onApplicationDidEnterForegroundSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.System
import SDL3.Sys.Bindgen.System.Safe qualified as Safe
import SDL3.Sys.Bindgen.System.Unsafe qualified as Unsafe

-- | Set a callback for every X11 event.
--
--     The callback may modify the event, and should return true if the event should continue to be processed, or false to prevent further processing.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetX11EventHook@.
--                   The safe flavor is 'setX11EventHookSafe'
--                   : registration; the hook runs during event pumping.
--
--     [C declaration]: @SDL_SetX11EventHook@, defined at @SDL3\/SDL_system.h 178:34@
setX11EventHook
  :: SDL_X11EventHook
  -- ^
  --
  --           [@callback@]: the 'SDL_X11EventHook' function to call.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer to pass to every iteration of @callback@.
  -> IO ()
setX11EventHook = Unsafe.sDL_SetX11EventHook

-- | Set a callback for every X11 event.
--
--     The callback may modify the event, and should return true if the event should continue to be processed, or false to prevent further processing.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetX11EventHook@.
--                   The unsafe flavor is 'setX11EventHook'
--                   : registration; the hook runs during event pumping.
--
--     [C declaration]: @SDL_SetX11EventHook@, defined at @SDL3\/SDL_system.h 178:34@
setX11EventHookSafe
  :: SDL_X11EventHook
  -- ^
  --
  --           [@callback@]: the 'SDL_X11EventHook' function to call.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer to pass to every iteration of @callback@.
  -> IO ()
setX11EventHookSafe = Safe.sDL_SetX11EventHook

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetLinuxThreadPriority@.
--                   The safe flavor is 'setLinuxThreadPrioritySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetLinuxThreadPriority@, defined at @SDL3\/SDL_system.h 197:34@
setLinuxThreadPriority
  :: BG.Int64
  -- ^ [C declaration]: @threadID@
  -> BG.Int32
  -- ^ [C declaration]: @priority@
  -> IO Bool
setLinuxThreadPriority =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetLinuxThreadPriority (Coerce.coerce x00) (Coerce.coerce x11))

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetLinuxThreadPriority@.
--                   The unsafe flavor is 'setLinuxThreadPriority'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetLinuxThreadPriority@, defined at @SDL3\/SDL_system.h 197:34@
setLinuxThreadPrioritySafe
  :: BG.Int64
  -- ^ [C declaration]: @threadID@
  -> BG.Int32
  -- ^ [C declaration]: @priority@
  -> IO Bool
setLinuxThreadPrioritySafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetLinuxThreadPriority (Coerce.coerce x00) (Coerce.coerce x11))

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetLinuxThreadPriorityAndPolicy@.
--                   The safe flavor is 'setLinuxThreadPriorityAndPolicySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetLinuxThreadPriorityAndPolicy@, defined at @SDL3\/SDL_system.h 215:34@
setLinuxThreadPriorityAndPolicy
  :: BG.Int64
  -- ^ [C declaration]: @threadID@
  -> BG.Int32
  -- ^ [C declaration]: @sdlPriority@
  -> BG.Int32
  -- ^ [C declaration]: @schedPolicy@
  -> IO Bool
setLinuxThreadPriorityAndPolicy =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap
          CBool.toBool
          ( Unsafe.sDL_SetLinuxThreadPriorityAndPolicy
              (Coerce.coerce x00)
              (Coerce.coerce x11)
              (Coerce.coerce x22)
          )

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetLinuxThreadPriorityAndPolicy@.
--                   The unsafe flavor is 'setLinuxThreadPriorityAndPolicy'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetLinuxThreadPriorityAndPolicy@, defined at @SDL3\/SDL_system.h 215:34@
setLinuxThreadPriorityAndPolicySafe
  :: BG.Int64
  -- ^ [C declaration]: @threadID@
  -> BG.Int32
  -- ^ [C declaration]: @sdlPriority@
  -> BG.Int32
  -- ^ [C declaration]: @schedPolicy@
  -> IO Bool
setLinuxThreadPriorityAndPolicySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap
          CBool.toBool
          (Safe.sDL_SetLinuxThreadPriorityAndPolicy (Coerce.coerce x00) (Coerce.coerce x11) (Coerce.coerce x22))

-- | Query if the current device is a tablet.
--
--     If SDL can\'t determine this, it will return false.
--
--     [Returns]: true if the device is a tablet, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IsTablet@.
--                   The safe flavor is 'isTabletSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsTablet@, defined at @SDL3\/SDL_system.h 630:34@
isTablet :: IO Bool
isTablet = fmap CBool.toBool Unsafe.sDL_IsTablet

-- | Query if the current device is a tablet.
--
--     If SDL can\'t determine this, it will return false.
--
--     [Returns]: true if the device is a tablet, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IsTablet@.
--                   The unsafe flavor is 'isTablet'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsTablet@, defined at @SDL3\/SDL_system.h 630:34@
isTabletSafe :: IO Bool
isTabletSafe = fmap CBool.toBool Safe.sDL_IsTablet

-- | Query if the current device is a TV.
--
--     If SDL can\'t determine this, it will return false.
--
--     [Returns]: true if the device is a TV, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IsTV@.
--                   The safe flavor is 'isTVSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsTV@, defined at @SDL3\/SDL_system.h 643:34@
isTV :: IO Bool
isTV = fmap CBool.toBool Unsafe.sDL_IsTV

-- | Query if the current device is a TV.
--
--     If SDL can\'t determine this, it will return false.
--
--     [Returns]: true if the device is a TV, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IsTV@.
--                   The unsafe flavor is 'isTV'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsTV@, defined at @SDL3\/SDL_system.h 643:34@
isTVSafe :: IO Bool
isTVSafe = fmap CBool.toBool Safe.sDL_IsTV

-- | Get the application sandbox environment, if any.
--
--     [Returns]: the application sandbox environment or SDL_SANDBOX_NONE if the application is not running in a sandbox environment.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSandbox@.
--                   The safe flavor is 'getSandboxSafe'
--                   .
--
--     [C declaration]: @SDL_GetSandbox@, defined at @SDL3\/SDL_system.h 667:41@
getSandbox :: IO SDL_Sandbox
getSandbox = Unsafe.sDL_GetSandbox

-- | Get the application sandbox environment, if any.
--
--     [Returns]: the application sandbox environment or SDL_SANDBOX_NONE if the application is not running in a sandbox environment.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSandbox@.
--                   The unsafe flavor is 'getSandbox'
--                   .
--
--     [C declaration]: @SDL_GetSandbox@, defined at @SDL3\/SDL_system.h 667:41@
getSandboxSafe :: IO SDL_Sandbox
getSandboxSafe = Safe.sDL_GetSandbox

-- | Let iOS apps with external event handling report onApplicationWillTerminate.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by 'SDL3.Sys.Video.createWindow'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OnApplicationWillTerminate@.
--                   The safe flavor is 'onApplicationWillTerminateSafe'
--                   .
--
--     [C declaration]: @SDL_OnApplicationWillTerminate@, defined at @SDL3\/SDL_system.h 687:34@
onApplicationWillTerminate :: IO ()
onApplicationWillTerminate =
  Unsafe.sDL_OnApplicationWillTerminate

-- | Let iOS apps with external event handling report onApplicationWillTerminate.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by 'SDL3.Sys.Video.createWindow'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OnApplicationWillTerminate@.
--                   The unsafe flavor is 'onApplicationWillTerminate'
--                   .
--
--     [C declaration]: @SDL_OnApplicationWillTerminate@, defined at @SDL3\/SDL_system.h 687:34@
onApplicationWillTerminateSafe :: IO ()
onApplicationWillTerminateSafe =
  Safe.sDL_OnApplicationWillTerminate

-- | Let iOS apps with external event handling report onApplicationDidReceiveMemoryWarning.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by 'SDL3.Sys.Video.createWindow'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OnApplicationDidReceiveMemoryWarning@.
--                   The safe flavor is 'onApplicationDidReceiveMemoryWarningSafe'
--                   .
--
--     [C declaration]: @SDL_OnApplicationDidReceiveMemoryWarning@, defined at @SDL3\/SDL_system.h 704:34@
onApplicationDidReceiveMemoryWarning :: IO ()
onApplicationDidReceiveMemoryWarning =
  Unsafe.sDL_OnApplicationDidReceiveMemoryWarning

-- | Let iOS apps with external event handling report onApplicationDidReceiveMemoryWarning.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by 'SDL3.Sys.Video.createWindow'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OnApplicationDidReceiveMemoryWarning@.
--                   The unsafe flavor is 'onApplicationDidReceiveMemoryWarning'
--                   .
--
--     [C declaration]: @SDL_OnApplicationDidReceiveMemoryWarning@, defined at @SDL3\/SDL_system.h 704:34@
onApplicationDidReceiveMemoryWarningSafe :: IO ()
onApplicationDidReceiveMemoryWarningSafe =
  Safe.sDL_OnApplicationDidReceiveMemoryWarning

-- | Let iOS apps with external event handling report onApplicationWillResignActive.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by 'SDL3.Sys.Video.createWindow'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OnApplicationWillEnterBackground@.
--                   The safe flavor is 'onApplicationWillEnterBackgroundSafe'
--                   .
--
--     [C declaration]: @SDL_OnApplicationWillEnterBackground@, defined at @SDL3\/SDL_system.h 721:34@
onApplicationWillEnterBackground :: IO ()
onApplicationWillEnterBackground =
  Unsafe.sDL_OnApplicationWillEnterBackground

-- | Let iOS apps with external event handling report onApplicationWillResignActive.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by 'SDL3.Sys.Video.createWindow'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OnApplicationWillEnterBackground@.
--                   The unsafe flavor is 'onApplicationWillEnterBackground'
--                   .
--
--     [C declaration]: @SDL_OnApplicationWillEnterBackground@, defined at @SDL3\/SDL_system.h 721:34@
onApplicationWillEnterBackgroundSafe :: IO ()
onApplicationWillEnterBackgroundSafe =
  Safe.sDL_OnApplicationWillEnterBackground

-- | Let iOS apps with external event handling report onApplicationDidEnterBackground.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by 'SDL3.Sys.Video.createWindow'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OnApplicationDidEnterBackground@.
--                   The safe flavor is 'onApplicationDidEnterBackgroundSafe'
--                   .
--
--     [C declaration]: @SDL_OnApplicationDidEnterBackground@, defined at @SDL3\/SDL_system.h 738:34@
onApplicationDidEnterBackground :: IO ()
onApplicationDidEnterBackground =
  Unsafe.sDL_OnApplicationDidEnterBackground

-- | Let iOS apps with external event handling report onApplicationDidEnterBackground.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by 'SDL3.Sys.Video.createWindow'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OnApplicationDidEnterBackground@.
--                   The unsafe flavor is 'onApplicationDidEnterBackground'
--                   .
--
--     [C declaration]: @SDL_OnApplicationDidEnterBackground@, defined at @SDL3\/SDL_system.h 738:34@
onApplicationDidEnterBackgroundSafe :: IO ()
onApplicationDidEnterBackgroundSafe =
  Safe.sDL_OnApplicationDidEnterBackground

-- | Let iOS apps with external event handling report onApplicationWillEnterForeground.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by 'SDL3.Sys.Video.createWindow'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OnApplicationWillEnterForeground@.
--                   The safe flavor is 'onApplicationWillEnterForegroundSafe'
--                   .
--
--     [C declaration]: @SDL_OnApplicationWillEnterForeground@, defined at @SDL3\/SDL_system.h 755:34@
onApplicationWillEnterForeground :: IO ()
onApplicationWillEnterForeground =
  Unsafe.sDL_OnApplicationWillEnterForeground

-- | Let iOS apps with external event handling report onApplicationWillEnterForeground.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by 'SDL3.Sys.Video.createWindow'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OnApplicationWillEnterForeground@.
--                   The unsafe flavor is 'onApplicationWillEnterForeground'
--                   .
--
--     [C declaration]: @SDL_OnApplicationWillEnterForeground@, defined at @SDL3\/SDL_system.h 755:34@
onApplicationWillEnterForegroundSafe :: IO ()
onApplicationWillEnterForegroundSafe =
  Safe.sDL_OnApplicationWillEnterForeground

-- | Let iOS apps with external event handling report onApplicationDidBecomeActive.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by 'SDL3.Sys.Video.createWindow'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OnApplicationDidEnterForeground@.
--                   The safe flavor is 'onApplicationDidEnterForegroundSafe'
--                   .
--
--     [C declaration]: @SDL_OnApplicationDidEnterForeground@, defined at @SDL3\/SDL_system.h 772:34@
onApplicationDidEnterForeground :: IO ()
onApplicationDidEnterForeground =
  Unsafe.sDL_OnApplicationDidEnterForeground

-- | Let iOS apps with external event handling report onApplicationDidBecomeActive.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by 'SDL3.Sys.Video.createWindow'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OnApplicationDidEnterForeground@.
--                   The unsafe flavor is 'onApplicationDidEnterForeground'
--                   .
--
--     [C declaration]: @SDL_OnApplicationDidEnterForeground@, defined at @SDL3\/SDL_system.h 772:34@
onApplicationDidEnterForegroundSafe :: IO ()
onApplicationDidEnterForegroundSafe =
  Safe.sDL_OnApplicationDidEnterForeground

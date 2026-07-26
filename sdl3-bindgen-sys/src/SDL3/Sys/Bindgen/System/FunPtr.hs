{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.System.FunPtr (
  SDL3.Sys.Bindgen.System.FunPtr.sDL_SetX11EventHook,
  SDL3.Sys.Bindgen.System.FunPtr.sDL_SetLinuxThreadPriority,
  SDL3.Sys.Bindgen.System.FunPtr.sDL_SetLinuxThreadPriorityAndPolicy,
  SDL3.Sys.Bindgen.System.FunPtr.sDL_IsTablet,
  SDL3.Sys.Bindgen.System.FunPtr.sDL_IsTV,
  SDL3.Sys.Bindgen.System.FunPtr.sDL_GetSandbox,
  SDL3.Sys.Bindgen.System.FunPtr.sDL_OnApplicationWillTerminate,
  SDL3.Sys.Bindgen.System.FunPtr.sDL_OnApplicationDidReceiveMemoryWarning,
  SDL3.Sys.Bindgen.System.FunPtr.sDL_OnApplicationWillEnterBackground,
  SDL3.Sys.Bindgen.System.FunPtr.sDL_OnApplicationDidEnterBackground,
  SDL3.Sys.Bindgen.System.FunPtr.sDL_OnApplicationWillEnterForeground,
  SDL3.Sys.Bindgen.System.FunPtr.sDL_OnApplicationDidEnterForeground,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.System

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_system.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_SetX11EventHook */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_c8461cbd9f660faf (void)) ("
         , "  SDL_X11EventHook arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetX11EventHook;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_SetLinuxThreadPriority */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1f8bde1858fb4a87 (void)) ("
         , "  Sint64 arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "#ifdef SDL_PLATFORM_LINUX"
         , "  return &SDL_SetLinuxThreadPriority;"
         , "#else"
         , "  SDL_SetError(\"SDL_SetLinuxThreadPriority is only available on Linux\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_SetLinuxThreadPriorityAndPolicy */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_cfce4d2d582fd59d (void)) ("
         , "  Sint64 arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "#ifdef SDL_PLATFORM_LINUX"
         , "  return &SDL_SetLinuxThreadPriorityAndPolicy;"
         , "#else"
         , "  SDL_SetError(\"SDL_SetLinuxThreadPriorityAndPolicy is only available on Linux\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_IsTablet */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9f492756c66f0817 (void)) (void)"
         , "{"
         , "  return &SDL_IsTablet;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_IsTV */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_cf95d51f81b9ae05 (void)) (void)"
         , "{"
         , "  return &SDL_IsTV;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_GetSandbox */"
         , "__attribute__ ((const))"
         , "SDL_Sandbox (*hs_bindgen_ec479faeb61e5dcc (void)) (void)"
         , "{"
         , "  return &SDL_GetSandbox;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationWillTerminate */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_d4425ea7b77d90a5 (void)) (void)"
         , "{"
         , "  return &SDL_OnApplicationWillTerminate;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationDidReceiveMemoryWarning */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_48da35892737056a (void)) (void)"
         , "{"
         , "  return &SDL_OnApplicationDidReceiveMemoryWarning;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationWillEnterBackground */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_b39763efba45615f (void)) (void)"
         , "{"
         , "  return &SDL_OnApplicationWillEnterBackground;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationDidEnterBackground */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_4930cfe88ee2ea33 (void)) (void)"
         , "{"
         , "  return &SDL_OnApplicationDidEnterBackground;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationWillEnterForeground */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_e6a127de1e095a24 (void)) (void)"
         , "{"
         , "  return &SDL_OnApplicationWillEnterForeground;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationDidEnterForeground */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_6ee69ef9852cabc3 (void)) (void)"
         , "{"
         , "  return &SDL_OnApplicationDidEnterForeground;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_SetX11EventHook@
foreign import ccall unsafe "hs_bindgen_c8461cbd9f660faf"
  hs_bindgen_c8461cbd9f660faf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_SetX11EventHook@
hs_bindgen_c8461cbd9f660faf :: IO (BG.FunPtr (SDL_X11EventHook -> BG.Ptr BG.Void -> IO ()))
hs_bindgen_c8461cbd9f660faf =
  BG.fromFFIType hs_bindgen_c8461cbd9f660faf_base

{-# NOINLINE sDL_SetX11EventHook #-}

-- | Set a callback for every X11 event.
--
--     The callback may modify the event, and should return true if the event should continue to be processed, or false to prevent further processing.
--
--     [@callback@]: the 'SDL_X11EventHook' function to call.
--
--     [@userdata@]: a pointer to pass to every iteration of @callback@.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetX11EventHook@, defined at @SDL3\/SDL_system.h 178:34@
sDL_SetX11EventHook :: BG.FunPtr (SDL_X11EventHook -> BG.Ptr BG.Void -> IO ())
sDL_SetX11EventHook =
  BG.unsafePerformIO hs_bindgen_c8461cbd9f660faf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_SetLinuxThreadPriority@
foreign import ccall unsafe "hs_bindgen_1f8bde1858fb4a87"
  hs_bindgen_1f8bde1858fb4a87_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_SetLinuxThreadPriority@
hs_bindgen_1f8bde1858fb4a87
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Sint64 -> BG.CInt -> IO BG.CBool))
hs_bindgen_1f8bde1858fb4a87 =
  BG.fromFFIType hs_bindgen_1f8bde1858fb4a87_base

{-# NOINLINE sDL_SetLinuxThreadPriority #-}

-- | [C declaration]: @SDL_SetLinuxThreadPriority@, defined at @SDL3\/SDL_system.h 197:34@
sDL_SetLinuxThreadPriority :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Sint64 -> BG.CInt -> IO BG.CBool)
sDL_SetLinuxThreadPriority =
  BG.unsafePerformIO hs_bindgen_1f8bde1858fb4a87

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_SetLinuxThreadPriorityAndPolicy@
foreign import ccall unsafe "hs_bindgen_cfce4d2d582fd59d"
  hs_bindgen_cfce4d2d582fd59d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_SetLinuxThreadPriorityAndPolicy@
hs_bindgen_cfce4d2d582fd59d
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Sint64 -> BG.CInt -> BG.CInt -> IO BG.CBool))
hs_bindgen_cfce4d2d582fd59d =
  BG.fromFFIType hs_bindgen_cfce4d2d582fd59d_base

{-# NOINLINE sDL_SetLinuxThreadPriorityAndPolicy #-}

-- | [C declaration]: @SDL_SetLinuxThreadPriorityAndPolicy@, defined at @SDL3\/SDL_system.h 215:34@
sDL_SetLinuxThreadPriorityAndPolicy
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Sint64 -> BG.CInt -> BG.CInt -> IO BG.CBool)
sDL_SetLinuxThreadPriorityAndPolicy =
  BG.unsafePerformIO hs_bindgen_cfce4d2d582fd59d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_IsTablet@
foreign import ccall unsafe "hs_bindgen_9f492756c66f0817"
  hs_bindgen_9f492756c66f0817_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_IsTablet@
hs_bindgen_9f492756c66f0817 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_9f492756c66f0817 =
  BG.fromFFIType hs_bindgen_9f492756c66f0817_base

{-# NOINLINE sDL_IsTablet #-}

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
--     [C declaration]: @SDL_IsTablet@, defined at @SDL3\/SDL_system.h 630:34@
sDL_IsTablet :: BG.FunPtr (IO BG.CBool)
sDL_IsTablet =
  BG.unsafePerformIO hs_bindgen_9f492756c66f0817

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_IsTV@
foreign import ccall unsafe "hs_bindgen_cf95d51f81b9ae05"
  hs_bindgen_cf95d51f81b9ae05_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_IsTV@
hs_bindgen_cf95d51f81b9ae05 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_cf95d51f81b9ae05 =
  BG.fromFFIType hs_bindgen_cf95d51f81b9ae05_base

{-# NOINLINE sDL_IsTV #-}

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
--     [C declaration]: @SDL_IsTV@, defined at @SDL3\/SDL_system.h 643:34@
sDL_IsTV :: BG.FunPtr (IO BG.CBool)
sDL_IsTV =
  BG.unsafePerformIO hs_bindgen_cf95d51f81b9ae05

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_GetSandbox@
foreign import ccall unsafe "hs_bindgen_ec479faeb61e5dcc"
  hs_bindgen_ec479faeb61e5dcc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_GetSandbox@
hs_bindgen_ec479faeb61e5dcc :: IO (BG.FunPtr (IO SDL_Sandbox))
hs_bindgen_ec479faeb61e5dcc =
  BG.fromFFIType hs_bindgen_ec479faeb61e5dcc_base

{-# NOINLINE sDL_GetSandbox #-}

-- | Get the application sandbox environment, if any.
--
--     [Returns]: the application sandbox environment or SDL_SANDBOX_NONE if the application is not running in a sandbox environment.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSandbox@, defined at @SDL3\/SDL_system.h 667:41@
sDL_GetSandbox :: BG.FunPtr (IO SDL_Sandbox)
sDL_GetSandbox =
  BG.unsafePerformIO hs_bindgen_ec479faeb61e5dcc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationWillTerminate@
foreign import ccall unsafe "hs_bindgen_d4425ea7b77d90a5"
  hs_bindgen_d4425ea7b77d90a5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationWillTerminate@
hs_bindgen_d4425ea7b77d90a5 :: IO (BG.FunPtr (IO ()))
hs_bindgen_d4425ea7b77d90a5 =
  BG.fromFFIType hs_bindgen_d4425ea7b77d90a5_base

{-# NOINLINE sDL_OnApplicationWillTerminate #-}

-- | Let iOS apps with external event handling report onApplicationWillTerminate.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by SDL_CreateWindow!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OnApplicationWillTerminate@, defined at @SDL3\/SDL_system.h 687:34@
sDL_OnApplicationWillTerminate :: BG.FunPtr (IO ())
sDL_OnApplicationWillTerminate =
  BG.unsafePerformIO hs_bindgen_d4425ea7b77d90a5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationDidReceiveMemoryWarning@
foreign import ccall unsafe "hs_bindgen_48da35892737056a"
  hs_bindgen_48da35892737056a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationDidReceiveMemoryWarning@
hs_bindgen_48da35892737056a :: IO (BG.FunPtr (IO ()))
hs_bindgen_48da35892737056a =
  BG.fromFFIType hs_bindgen_48da35892737056a_base

{-# NOINLINE sDL_OnApplicationDidReceiveMemoryWarning #-}

-- | Let iOS apps with external event handling report onApplicationDidReceiveMemoryWarning.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by SDL_CreateWindow!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OnApplicationDidReceiveMemoryWarning@, defined at @SDL3\/SDL_system.h 704:34@
sDL_OnApplicationDidReceiveMemoryWarning :: BG.FunPtr (IO ())
sDL_OnApplicationDidReceiveMemoryWarning =
  BG.unsafePerformIO hs_bindgen_48da35892737056a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationWillEnterBackground@
foreign import ccall unsafe "hs_bindgen_b39763efba45615f"
  hs_bindgen_b39763efba45615f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationWillEnterBackground@
hs_bindgen_b39763efba45615f :: IO (BG.FunPtr (IO ()))
hs_bindgen_b39763efba45615f =
  BG.fromFFIType hs_bindgen_b39763efba45615f_base

{-# NOINLINE sDL_OnApplicationWillEnterBackground #-}

-- | Let iOS apps with external event handling report onApplicationWillResignActive.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by SDL_CreateWindow!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OnApplicationWillEnterBackground@, defined at @SDL3\/SDL_system.h 721:34@
sDL_OnApplicationWillEnterBackground :: BG.FunPtr (IO ())
sDL_OnApplicationWillEnterBackground =
  BG.unsafePerformIO hs_bindgen_b39763efba45615f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationDidEnterBackground@
foreign import ccall unsafe "hs_bindgen_4930cfe88ee2ea33"
  hs_bindgen_4930cfe88ee2ea33_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationDidEnterBackground@
hs_bindgen_4930cfe88ee2ea33 :: IO (BG.FunPtr (IO ()))
hs_bindgen_4930cfe88ee2ea33 =
  BG.fromFFIType hs_bindgen_4930cfe88ee2ea33_base

{-# NOINLINE sDL_OnApplicationDidEnterBackground #-}

-- | Let iOS apps with external event handling report onApplicationDidEnterBackground.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by SDL_CreateWindow!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OnApplicationDidEnterBackground@, defined at @SDL3\/SDL_system.h 738:34@
sDL_OnApplicationDidEnterBackground :: BG.FunPtr (IO ())
sDL_OnApplicationDidEnterBackground =
  BG.unsafePerformIO hs_bindgen_4930cfe88ee2ea33

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationWillEnterForeground@
foreign import ccall unsafe "hs_bindgen_e6a127de1e095a24"
  hs_bindgen_e6a127de1e095a24_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationWillEnterForeground@
hs_bindgen_e6a127de1e095a24 :: IO (BG.FunPtr (IO ()))
hs_bindgen_e6a127de1e095a24 =
  BG.fromFFIType hs_bindgen_e6a127de1e095a24_base

{-# NOINLINE sDL_OnApplicationWillEnterForeground #-}

-- | Let iOS apps with external event handling report onApplicationWillEnterForeground.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by SDL_CreateWindow!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OnApplicationWillEnterForeground@, defined at @SDL3\/SDL_system.h 755:34@
sDL_OnApplicationWillEnterForeground :: BG.FunPtr (IO ())
sDL_OnApplicationWillEnterForeground =
  BG.unsafePerformIO hs_bindgen_e6a127de1e095a24

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationDidEnterForeground@
foreign import ccall unsafe "hs_bindgen_6ee69ef9852cabc3"
  hs_bindgen_6ee69ef9852cabc3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_get_SDL_OnApplicationDidEnterForeground@
hs_bindgen_6ee69ef9852cabc3 :: IO (BG.FunPtr (IO ()))
hs_bindgen_6ee69ef9852cabc3 =
  BG.fromFFIType hs_bindgen_6ee69ef9852cabc3_base

{-# NOINLINE sDL_OnApplicationDidEnterForeground #-}

-- | Let iOS apps with external event handling report onApplicationDidBecomeActive.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by SDL_CreateWindow!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OnApplicationDidEnterForeground@, defined at @SDL3\/SDL_system.h 772:34@
sDL_OnApplicationDidEnterForeground :: BG.FunPtr (IO ())
sDL_OnApplicationDidEnterForeground =
  BG.unsafePerformIO hs_bindgen_6ee69ef9852cabc3

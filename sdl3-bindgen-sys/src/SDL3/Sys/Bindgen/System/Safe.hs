{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.System.Safe (
  SDL3.Sys.Bindgen.System.Safe.sDL_SetX11EventHook,
  SDL3.Sys.Bindgen.System.Safe.sDL_SetLinuxThreadPriority,
  SDL3.Sys.Bindgen.System.Safe.sDL_SetLinuxThreadPriorityAndPolicy,
  SDL3.Sys.Bindgen.System.Safe.sDL_IsTablet,
  SDL3.Sys.Bindgen.System.Safe.sDL_IsTV,
  SDL3.Sys.Bindgen.System.Safe.sDL_GetSandbox,
  SDL3.Sys.Bindgen.System.Safe.sDL_OnApplicationWillTerminate,
  SDL3.Sys.Bindgen.System.Safe.sDL_OnApplicationDidReceiveMemoryWarning,
  SDL3.Sys.Bindgen.System.Safe.sDL_OnApplicationWillEnterBackground,
  SDL3.Sys.Bindgen.System.Safe.sDL_OnApplicationDidEnterBackground,
  SDL3.Sys.Bindgen.System.Safe.sDL_OnApplicationWillEnterForeground,
  SDL3.Sys.Bindgen.System.Safe.sDL_OnApplicationDidEnterForeground,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.System

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_system.h>"
         , "void hs_bindgen_ead2e2ea2677d0f8 ("
         , "  SDL_X11EventHook arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  (SDL_SetX11EventHook)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_9110686f4456a2f3 ("
         , "  Sint64 arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "#ifdef SDL_PLATFORM_LINUX"
         , "  return (SDL_SetLinuxThreadPriority)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; return SDL_SetError(\"SDL_SetLinuxThreadPriority is only available on Linux\");"
         , "#endif"
         , "}"
         , "_Bool hs_bindgen_0383bd6da68658c0 ("
         , "  Sint64 arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "#ifdef SDL_PLATFORM_LINUX"
         , "  return (SDL_SetLinuxThreadPriorityAndPolicy)(arg1, arg2, arg3);"
         , "#else"
         , "  (void)arg1; (void)arg2; (void)arg3; return SDL_SetError(\"SDL_SetLinuxThreadPriorityAndPolicy is only available on Linux\");"
         , "#endif"
         , "}"
         , "_Bool hs_bindgen_c9f4754632fd8d42 (void)"
         , "{"
         , "  return (SDL_IsTablet)();"
         , "}"
         , "_Bool hs_bindgen_0cd31739327b6cd7 (void)"
         , "{"
         , "  return (SDL_IsTV)();"
         , "}"
         , "SDL_Sandbox hs_bindgen_e5a169479304c118 (void)"
         , "{"
         , "  return (SDL_GetSandbox)();"
         , "}"
         , "void hs_bindgen_6de90d6f8ee04ad6 (void)"
         , "{"
         , "  (SDL_OnApplicationWillTerminate)();"
         , "}"
         , "void hs_bindgen_36ae92858c8204df (void)"
         , "{"
         , "  (SDL_OnApplicationDidReceiveMemoryWarning)();"
         , "}"
         , "void hs_bindgen_62c6019205cd45c2 (void)"
         , "{"
         , "  (SDL_OnApplicationWillEnterBackground)();"
         , "}"
         , "void hs_bindgen_73b2cba299dd5591 (void)"
         , "{"
         , "  (SDL_OnApplicationDidEnterBackground)();"
         , "}"
         , "void hs_bindgen_2b70d675ad267009 (void)"
         , "{"
         , "  (SDL_OnApplicationWillEnterForeground)();"
         , "}"
         , "void hs_bindgen_cfd36268e651eb47 (void)"
         , "{"
         , "  (SDL_OnApplicationDidEnterForeground)();"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_SetX11EventHook@
foreign import ccall safe "hs_bindgen_ead2e2ea2677d0f8"
  hs_bindgen_ead2e2ea2677d0f8_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_SetX11EventHook@
hs_bindgen_ead2e2ea2677d0f8
  :: SDL_X11EventHook
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_ead2e2ea2677d0f8 =
  BG.fromFFIType hs_bindgen_ead2e2ea2677d0f8_base

-- | Set a callback for every X11 event.
--
--     The callback may modify the event, and should return true if the event should continue to be processed, or false to prevent further processing.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetX11EventHook@, defined at @SDL3\/SDL_system.h 178:34@
sDL_SetX11EventHook
  :: SDL_X11EventHook
  -- ^
  --
  --           [@callback@]: the 'SDL_X11EventHook' function to call.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer to pass to every iteration of @callback@.
  -> IO ()
sDL_SetX11EventHook = hs_bindgen_ead2e2ea2677d0f8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_SetLinuxThreadPriority@
foreign import ccall safe "hs_bindgen_9110686f4456a2f3"
  hs_bindgen_9110686f4456a2f3_base
    :: BG.Int64
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_SetLinuxThreadPriority@
hs_bindgen_9110686f4456a2f3
  :: SDL3.Sys.Bindgen.Stdinc.Sint64
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_9110686f4456a2f3 =
  BG.fromFFIType hs_bindgen_9110686f4456a2f3_base

-- | [C declaration]: @SDL_SetLinuxThreadPriority@, defined at @SDL3\/SDL_system.h 197:34@
sDL_SetLinuxThreadPriority
  :: SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^ [C declaration]: @threadID@
  -> BG.CInt
  -- ^ [C declaration]: @priority@
  -> IO BG.CBool
sDL_SetLinuxThreadPriority =
  hs_bindgen_9110686f4456a2f3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_SetLinuxThreadPriorityAndPolicy@
foreign import ccall safe "hs_bindgen_0383bd6da68658c0"
  hs_bindgen_0383bd6da68658c0_base
    :: BG.Int64
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_SetLinuxThreadPriorityAndPolicy@
hs_bindgen_0383bd6da68658c0
  :: SDL3.Sys.Bindgen.Stdinc.Sint64
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_0383bd6da68658c0 =
  BG.fromFFIType hs_bindgen_0383bd6da68658c0_base

-- | [C declaration]: @SDL_SetLinuxThreadPriorityAndPolicy@, defined at @SDL3\/SDL_system.h 215:34@
sDL_SetLinuxThreadPriorityAndPolicy
  :: SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^ [C declaration]: @threadID@
  -> BG.CInt
  -- ^ [C declaration]: @sdlPriority@
  -> BG.CInt
  -- ^ [C declaration]: @schedPolicy@
  -> IO BG.CBool
sDL_SetLinuxThreadPriorityAndPolicy =
  hs_bindgen_0383bd6da68658c0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_IsTablet@
foreign import ccall safe "hs_bindgen_c9f4754632fd8d42"
  hs_bindgen_c9f4754632fd8d42_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_IsTablet@
hs_bindgen_c9f4754632fd8d42 :: IO BG.CBool
hs_bindgen_c9f4754632fd8d42 =
  BG.fromFFIType hs_bindgen_c9f4754632fd8d42_base

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
sDL_IsTablet :: IO BG.CBool
sDL_IsTablet = hs_bindgen_c9f4754632fd8d42

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_IsTV@
foreign import ccall safe "hs_bindgen_0cd31739327b6cd7"
  hs_bindgen_0cd31739327b6cd7_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_IsTV@
hs_bindgen_0cd31739327b6cd7 :: IO BG.CBool
hs_bindgen_0cd31739327b6cd7 =
  BG.fromFFIType hs_bindgen_0cd31739327b6cd7_base

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
sDL_IsTV :: IO BG.CBool
sDL_IsTV = hs_bindgen_0cd31739327b6cd7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_GetSandbox@
foreign import ccall safe "hs_bindgen_e5a169479304c118"
  hs_bindgen_e5a169479304c118_base
    :: IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_GetSandbox@
hs_bindgen_e5a169479304c118 :: IO SDL_Sandbox
hs_bindgen_e5a169479304c118 =
  BG.fromFFIType hs_bindgen_e5a169479304c118_base

-- | Get the application sandbox environment, if any.
--
--     [Returns]: the application sandbox environment or SDL_SANDBOX_NONE if the application is not running in a sandbox environment.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSandbox@, defined at @SDL3\/SDL_system.h 667:41@
sDL_GetSandbox :: IO SDL_Sandbox
sDL_GetSandbox = hs_bindgen_e5a169479304c118

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_OnApplicationWillTerminate@
foreign import ccall safe "hs_bindgen_6de90d6f8ee04ad6"
  hs_bindgen_6de90d6f8ee04ad6_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_OnApplicationWillTerminate@
hs_bindgen_6de90d6f8ee04ad6 :: IO ()
hs_bindgen_6de90d6f8ee04ad6 =
  BG.fromFFIType hs_bindgen_6de90d6f8ee04ad6_base

-- | Let iOS apps with external event handling report onApplicationWillTerminate.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by SDL_CreateWindow!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OnApplicationWillTerminate@, defined at @SDL3\/SDL_system.h 687:34@
sDL_OnApplicationWillTerminate :: IO ()
sDL_OnApplicationWillTerminate =
  hs_bindgen_6de90d6f8ee04ad6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_OnApplicationDidReceiveMemoryWarning@
foreign import ccall safe "hs_bindgen_36ae92858c8204df"
  hs_bindgen_36ae92858c8204df_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_OnApplicationDidReceiveMemoryWarning@
hs_bindgen_36ae92858c8204df :: IO ()
hs_bindgen_36ae92858c8204df =
  BG.fromFFIType hs_bindgen_36ae92858c8204df_base

-- | Let iOS apps with external event handling report onApplicationDidReceiveMemoryWarning.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by SDL_CreateWindow!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OnApplicationDidReceiveMemoryWarning@, defined at @SDL3\/SDL_system.h 704:34@
sDL_OnApplicationDidReceiveMemoryWarning :: IO ()
sDL_OnApplicationDidReceiveMemoryWarning =
  hs_bindgen_36ae92858c8204df

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_OnApplicationWillEnterBackground@
foreign import ccall safe "hs_bindgen_62c6019205cd45c2"
  hs_bindgen_62c6019205cd45c2_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_OnApplicationWillEnterBackground@
hs_bindgen_62c6019205cd45c2 :: IO ()
hs_bindgen_62c6019205cd45c2 =
  BG.fromFFIType hs_bindgen_62c6019205cd45c2_base

-- | Let iOS apps with external event handling report onApplicationWillResignActive.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by SDL_CreateWindow!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OnApplicationWillEnterBackground@, defined at @SDL3\/SDL_system.h 721:34@
sDL_OnApplicationWillEnterBackground :: IO ()
sDL_OnApplicationWillEnterBackground =
  hs_bindgen_62c6019205cd45c2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_OnApplicationDidEnterBackground@
foreign import ccall safe "hs_bindgen_73b2cba299dd5591"
  hs_bindgen_73b2cba299dd5591_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_OnApplicationDidEnterBackground@
hs_bindgen_73b2cba299dd5591 :: IO ()
hs_bindgen_73b2cba299dd5591 =
  BG.fromFFIType hs_bindgen_73b2cba299dd5591_base

-- | Let iOS apps with external event handling report onApplicationDidEnterBackground.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by SDL_CreateWindow!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OnApplicationDidEnterBackground@, defined at @SDL3\/SDL_system.h 738:34@
sDL_OnApplicationDidEnterBackground :: IO ()
sDL_OnApplicationDidEnterBackground =
  hs_bindgen_73b2cba299dd5591

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_OnApplicationWillEnterForeground@
foreign import ccall safe "hs_bindgen_2b70d675ad267009"
  hs_bindgen_2b70d675ad267009_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_OnApplicationWillEnterForeground@
hs_bindgen_2b70d675ad267009 :: IO ()
hs_bindgen_2b70d675ad267009 =
  BG.fromFFIType hs_bindgen_2b70d675ad267009_base

-- | Let iOS apps with external event handling report onApplicationWillEnterForeground.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by SDL_CreateWindow!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OnApplicationWillEnterForeground@, defined at @SDL3\/SDL_system.h 755:34@
sDL_OnApplicationWillEnterForeground :: IO ()
sDL_OnApplicationWillEnterForeground =
  hs_bindgen_2b70d675ad267009

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_OnApplicationDidEnterForeground@
foreign import ccall safe "hs_bindgen_cfd36268e651eb47"
  hs_bindgen_cfd36268e651eb47_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Safe_SDL_OnApplicationDidEnterForeground@
hs_bindgen_cfd36268e651eb47 :: IO ()
hs_bindgen_cfd36268e651eb47 =
  BG.fromFFIType hs_bindgen_cfd36268e651eb47_base

-- | Let iOS apps with external event handling report onApplicationDidBecomeActive.
--
--     This functions allows iOS apps that have their own event handling to hook into SDL to generate SDL events. This maps directly to an iOS-specific event, but since it doesn\'t do anything iOS-specific internally, it is available on all platforms, in case it might be useful for some specific paradigm. Most apps do not need to use this directly; SDL\'s internal event code will handle all this for windows created by SDL_CreateWindow!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OnApplicationDidEnterForeground@, defined at @SDL3\/SDL_system.h 772:34@
sDL_OnApplicationDidEnterForeground :: IO ()
sDL_OnApplicationDidEnterForeground =
  hs_bindgen_cfd36268e651eb47

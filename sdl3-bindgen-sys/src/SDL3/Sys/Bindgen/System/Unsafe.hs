{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.System.Unsafe (
  SDL3.Sys.Bindgen.System.Unsafe.sDL_SetX11EventHook,
  SDL3.Sys.Bindgen.System.Unsafe.sDL_SetLinuxThreadPriority,
  SDL3.Sys.Bindgen.System.Unsafe.sDL_SetLinuxThreadPriorityAndPolicy,
  SDL3.Sys.Bindgen.System.Unsafe.sDL_IsTablet,
  SDL3.Sys.Bindgen.System.Unsafe.sDL_IsTV,
  SDL3.Sys.Bindgen.System.Unsafe.sDL_GetSandbox,
  SDL3.Sys.Bindgen.System.Unsafe.sDL_OnApplicationWillTerminate,
  SDL3.Sys.Bindgen.System.Unsafe.sDL_OnApplicationDidReceiveMemoryWarning,
  SDL3.Sys.Bindgen.System.Unsafe.sDL_OnApplicationWillEnterBackground,
  SDL3.Sys.Bindgen.System.Unsafe.sDL_OnApplicationDidEnterBackground,
  SDL3.Sys.Bindgen.System.Unsafe.sDL_OnApplicationWillEnterForeground,
  SDL3.Sys.Bindgen.System.Unsafe.sDL_OnApplicationDidEnterForeground,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.System

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_system.h>"
         , "void hs_bindgen_6578867fea03cacb ("
         , "  SDL_X11EventHook arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  (SDL_SetX11EventHook)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_2e342f8192ce7216 ("
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
         , "_Bool hs_bindgen_5590fa8686376477 ("
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
         , "_Bool hs_bindgen_3681fc863886c2d2 (void)"
         , "{"
         , "  return (SDL_IsTablet)();"
         , "}"
         , "_Bool hs_bindgen_0bab6eb88d9a9496 (void)"
         , "{"
         , "  return (SDL_IsTV)();"
         , "}"
         , "SDL_Sandbox hs_bindgen_090a9001bc04ef5b (void)"
         , "{"
         , "  return (SDL_GetSandbox)();"
         , "}"
         , "void hs_bindgen_b7f727ac4163d9e9 (void)"
         , "{"
         , "  (SDL_OnApplicationWillTerminate)();"
         , "}"
         , "void hs_bindgen_9064fb92743d3c76 (void)"
         , "{"
         , "  (SDL_OnApplicationDidReceiveMemoryWarning)();"
         , "}"
         , "void hs_bindgen_874965c3cc9cd908 (void)"
         , "{"
         , "  (SDL_OnApplicationWillEnterBackground)();"
         , "}"
         , "void hs_bindgen_092a71f4734666c3 (void)"
         , "{"
         , "  (SDL_OnApplicationDidEnterBackground)();"
         , "}"
         , "void hs_bindgen_bf629409e4677855 (void)"
         , "{"
         , "  (SDL_OnApplicationWillEnterForeground)();"
         , "}"
         , "void hs_bindgen_36db0306e16f75d9 (void)"
         , "{"
         , "  (SDL_OnApplicationDidEnterForeground)();"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_SetX11EventHook@
foreign import ccall unsafe "hs_bindgen_6578867fea03cacb"
  hs_bindgen_6578867fea03cacb_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_SetX11EventHook@
hs_bindgen_6578867fea03cacb
  :: SDL_X11EventHook
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_6578867fea03cacb =
  BG.fromFFIType hs_bindgen_6578867fea03cacb_base

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
sDL_SetX11EventHook = hs_bindgen_6578867fea03cacb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_SetLinuxThreadPriority@
foreign import ccall unsafe "hs_bindgen_2e342f8192ce7216"
  hs_bindgen_2e342f8192ce7216_base
    :: BG.Int64
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_SetLinuxThreadPriority@
hs_bindgen_2e342f8192ce7216
  :: SDL3.Sys.Bindgen.Stdinc.Sint64
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_2e342f8192ce7216 =
  BG.fromFFIType hs_bindgen_2e342f8192ce7216_base

-- | [C declaration]: @SDL_SetLinuxThreadPriority@, defined at @SDL3\/SDL_system.h 197:34@
sDL_SetLinuxThreadPriority
  :: SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^ [C declaration]: @threadID@
  -> BG.CInt
  -- ^ [C declaration]: @priority@
  -> IO BG.CBool
sDL_SetLinuxThreadPriority =
  hs_bindgen_2e342f8192ce7216

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_SetLinuxThreadPriorityAndPolicy@
foreign import ccall unsafe "hs_bindgen_5590fa8686376477"
  hs_bindgen_5590fa8686376477_base
    :: BG.Int64
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_SetLinuxThreadPriorityAndPolicy@
hs_bindgen_5590fa8686376477
  :: SDL3.Sys.Bindgen.Stdinc.Sint64
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_5590fa8686376477 =
  BG.fromFFIType hs_bindgen_5590fa8686376477_base

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
  hs_bindgen_5590fa8686376477

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_IsTablet@
foreign import ccall unsafe "hs_bindgen_3681fc863886c2d2"
  hs_bindgen_3681fc863886c2d2_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_IsTablet@
hs_bindgen_3681fc863886c2d2 :: IO BG.CBool
hs_bindgen_3681fc863886c2d2 =
  BG.fromFFIType hs_bindgen_3681fc863886c2d2_base

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
sDL_IsTablet = hs_bindgen_3681fc863886c2d2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_IsTV@
foreign import ccall unsafe "hs_bindgen_0bab6eb88d9a9496"
  hs_bindgen_0bab6eb88d9a9496_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_IsTV@
hs_bindgen_0bab6eb88d9a9496 :: IO BG.CBool
hs_bindgen_0bab6eb88d9a9496 =
  BG.fromFFIType hs_bindgen_0bab6eb88d9a9496_base

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
sDL_IsTV = hs_bindgen_0bab6eb88d9a9496

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_GetSandbox@
foreign import ccall unsafe "hs_bindgen_090a9001bc04ef5b"
  hs_bindgen_090a9001bc04ef5b_base
    :: IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_GetSandbox@
hs_bindgen_090a9001bc04ef5b :: IO SDL_Sandbox
hs_bindgen_090a9001bc04ef5b =
  BG.fromFFIType hs_bindgen_090a9001bc04ef5b_base

-- | Get the application sandbox environment, if any.
--
--     [Returns]: the application sandbox environment or SDL_SANDBOX_NONE if the application is not running in a sandbox environment.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSandbox@, defined at @SDL3\/SDL_system.h 667:41@
sDL_GetSandbox :: IO SDL_Sandbox
sDL_GetSandbox = hs_bindgen_090a9001bc04ef5b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_OnApplicationWillTerminate@
foreign import ccall unsafe "hs_bindgen_b7f727ac4163d9e9"
  hs_bindgen_b7f727ac4163d9e9_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_OnApplicationWillTerminate@
hs_bindgen_b7f727ac4163d9e9 :: IO ()
hs_bindgen_b7f727ac4163d9e9 =
  BG.fromFFIType hs_bindgen_b7f727ac4163d9e9_base

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
  hs_bindgen_b7f727ac4163d9e9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_OnApplicationDidReceiveMemoryWarning@
foreign import ccall unsafe "hs_bindgen_9064fb92743d3c76"
  hs_bindgen_9064fb92743d3c76_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_OnApplicationDidReceiveMemoryWarning@
hs_bindgen_9064fb92743d3c76 :: IO ()
hs_bindgen_9064fb92743d3c76 =
  BG.fromFFIType hs_bindgen_9064fb92743d3c76_base

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
  hs_bindgen_9064fb92743d3c76

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_OnApplicationWillEnterBackground@
foreign import ccall unsafe "hs_bindgen_874965c3cc9cd908"
  hs_bindgen_874965c3cc9cd908_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_OnApplicationWillEnterBackground@
hs_bindgen_874965c3cc9cd908 :: IO ()
hs_bindgen_874965c3cc9cd908 =
  BG.fromFFIType hs_bindgen_874965c3cc9cd908_base

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
  hs_bindgen_874965c3cc9cd908

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_OnApplicationDidEnterBackground@
foreign import ccall unsafe "hs_bindgen_092a71f4734666c3"
  hs_bindgen_092a71f4734666c3_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_OnApplicationDidEnterBackground@
hs_bindgen_092a71f4734666c3 :: IO ()
hs_bindgen_092a71f4734666c3 =
  BG.fromFFIType hs_bindgen_092a71f4734666c3_base

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
  hs_bindgen_092a71f4734666c3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_OnApplicationWillEnterForeground@
foreign import ccall unsafe "hs_bindgen_bf629409e4677855"
  hs_bindgen_bf629409e4677855_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_OnApplicationWillEnterForeground@
hs_bindgen_bf629409e4677855 :: IO ()
hs_bindgen_bf629409e4677855 =
  BG.fromFFIType hs_bindgen_bf629409e4677855_base

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
  hs_bindgen_bf629409e4677855

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_OnApplicationDidEnterForeground@
foreign import ccall unsafe "hs_bindgen_36db0306e16f75d9"
  hs_bindgen_36db0306e16f75d9_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.System_Unsafe_SDL_OnApplicationDidEnterForeground@
hs_bindgen_36db0306e16f75d9 :: IO ()
hs_bindgen_36db0306e16f75d9 =
  BG.fromFFIType hs_bindgen_36db0306e16f75d9_base

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
  hs_bindgen_36db0306e16f75d9

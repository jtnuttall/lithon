{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Init.FunPtr (
  SDL3.Sys.Bindgen.Init.FunPtr.sDL_Init,
  SDL3.Sys.Bindgen.Init.FunPtr.sDL_InitSubSystem,
  SDL3.Sys.Bindgen.Init.FunPtr.sDL_QuitSubSystem,
  SDL3.Sys.Bindgen.Init.FunPtr.sDL_WasInit,
  SDL3.Sys.Bindgen.Init.FunPtr.sDL_Quit,
  SDL3.Sys.Bindgen.Init.FunPtr.sDL_IsMainThread,
  SDL3.Sys.Bindgen.Init.FunPtr.sDL_RunOnMainThread,
  SDL3.Sys.Bindgen.Init.FunPtr.sDL_SetAppMetadata,
  SDL3.Sys.Bindgen.Init.FunPtr.sDL_SetAppMetadataProperty,
  SDL3.Sys.Bindgen.Init.FunPtr.sDL_GetAppMetadataProperty,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Init

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_init.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_Init */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_dfba4f22209c9554 (void)) ("
         , "  SDL_InitFlags arg1"
         , ")"
         , "{"
         , "  return &SDL_Init;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_InitSubSystem */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_5bce25b55e9d45e3 (void)) ("
         , "  SDL_InitFlags arg1"
         , ")"
         , "{"
         , "  return &SDL_InitSubSystem;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_QuitSubSystem */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_149d9b7709db6751 (void)) ("
         , "  SDL_InitFlags arg1"
         , ")"
         , "{"
         , "  return &SDL_QuitSubSystem;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_WasInit */"
         , "__attribute__ ((const))"
         , "SDL_InitFlags (*hs_bindgen_53dd2f1aac19a298 (void)) ("
         , "  SDL_InitFlags arg1"
         , ")"
         , "{"
         , "  return &SDL_WasInit;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_Quit */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_9b631cb78cf1671f (void)) (void)"
         , "{"
         , "  return &SDL_Quit;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_IsMainThread */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a902ff5ab130bb25 (void)) (void)"
         , "{"
         , "  return &SDL_IsMainThread;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_RunOnMainThread */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1cff011229869063 (void)) ("
         , "  SDL_MainThreadCallback arg1,"
         , "  void *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return &SDL_RunOnMainThread;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_SetAppMetadata */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7a68851346541d78 (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return &SDL_SetAppMetadata;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_SetAppMetadataProperty */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d0081e390d662467 (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetAppMetadataProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_GetAppMetadataProperty */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_fdbd2caae5327fdc (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAppMetadataProperty;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_Init@
foreign import ccall unsafe "hs_bindgen_dfba4f22209c9554"
  hs_bindgen_dfba4f22209c9554_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_Init@
hs_bindgen_dfba4f22209c9554 :: IO (BG.FunPtr (SDL_InitFlags -> IO BG.CBool))
hs_bindgen_dfba4f22209c9554 =
  BG.fromFFIType hs_bindgen_dfba4f22209c9554_base

{-# NOINLINE sDL_Init #-}

-- | Initialize the SDL library.
--
--     @SDL_Init()@ simply forwards to calling @SDL_InitSubSystem()@. Therefore, the two may be used interchangeably. Though for readability of your code @SDL_InitSubSystem()@ might be preferred.
--
--     The file I\/O (for example: SDL_IOFromFile) and threading (SDL_CreateThread) subsystems are initialized by default. Message boxes (SDL_ShowSimpleMessageBox) also attempt to work without initializing the video subsystem, in hopes of being useful in showing an error dialog when SDL_Init fails. You must specifically initialize other subsystems if you use them in your application.
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
--     Subsystem initialization is ref-counted, you must call @SDL_QuitSubSystem()@ for each @SDL_InitSubSystem()@ to correctly shutdown a subsystem manually (or call @SDL_Quit()@ to force shutdown). If a subsystem is already loaded then this call will increase the ref-count and return.
--
--     Consider reporting some basic metadata about your application before calling SDL_Init, using either @SDL_SetAppMetadata()@ or @SDL_SetAppMetadataProperty()@.
--
--     [@flags@]: subsystem initialization flags.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAppMetadata', 'sDL_SetAppMetadataProperty', 'sDL_InitSubSystem', 'sDL_Quit', SDL_SetMainReady, 'sDL_WasInit'
--
--     [C declaration]: @SDL_Init@, defined at @SDL3\/SDL_init.h 238:34@
sDL_Init :: BG.FunPtr (SDL_InitFlags -> IO BG.CBool)
sDL_Init =
  BG.unsafePerformIO hs_bindgen_dfba4f22209c9554

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_InitSubSystem@
foreign import ccall unsafe "hs_bindgen_5bce25b55e9d45e3"
  hs_bindgen_5bce25b55e9d45e3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_InitSubSystem@
hs_bindgen_5bce25b55e9d45e3 :: IO (BG.FunPtr (SDL_InitFlags -> IO BG.CBool))
hs_bindgen_5bce25b55e9d45e3 =
  BG.fromFFIType hs_bindgen_5bce25b55e9d45e3_base

{-# NOINLINE sDL_InitSubSystem #-}

-- | Compatibility function to initialize the SDL library.
--
--     This function and @SDL_Init()@ are interchangeable.
--
--     [@flags@]: any of the flags used by @SDL_Init()@; see SDL_Init for details.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Init', 'sDL_Quit', 'sDL_QuitSubSystem'
--
--     [C declaration]: @SDL_InitSubSystem@, defined at @SDL3\/SDL_init.h 257:34@
sDL_InitSubSystem :: BG.FunPtr (SDL_InitFlags -> IO BG.CBool)
sDL_InitSubSystem =
  BG.unsafePerformIO hs_bindgen_5bce25b55e9d45e3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_QuitSubSystem@
foreign import ccall unsafe "hs_bindgen_149d9b7709db6751"
  hs_bindgen_149d9b7709db6751_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_QuitSubSystem@
hs_bindgen_149d9b7709db6751 :: IO (BG.FunPtr (SDL_InitFlags -> IO ()))
hs_bindgen_149d9b7709db6751 =
  BG.fromFFIType hs_bindgen_149d9b7709db6751_base

{-# NOINLINE sDL_QuitSubSystem #-}

-- | Shut down specific SDL subsystems.
--
--     You still need to call @SDL_Quit()@ even if you close all open subsystems with @SDL_QuitSubSystem()@.
--
--     [@flags@]: any of the flags used by @SDL_Init()@; see SDL_Init for details.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_InitSubSystem', 'sDL_Quit'
--
--     [C declaration]: @SDL_QuitSubSystem@, defined at @SDL3\/SDL_init.h 274:34@
sDL_QuitSubSystem :: BG.FunPtr (SDL_InitFlags -> IO ())
sDL_QuitSubSystem =
  BG.unsafePerformIO hs_bindgen_149d9b7709db6751

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_WasInit@
foreign import ccall unsafe "hs_bindgen_53dd2f1aac19a298"
  hs_bindgen_53dd2f1aac19a298_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_WasInit@
hs_bindgen_53dd2f1aac19a298 :: IO (BG.FunPtr (SDL_InitFlags -> IO SDL_InitFlags))
hs_bindgen_53dd2f1aac19a298 =
  BG.fromFFIType hs_bindgen_53dd2f1aac19a298_base

{-# NOINLINE sDL_WasInit #-}

-- | Get a mask of the specified subsystems which are currently initialized.
--
--     [@flags@]: any of the flags used by @SDL_Init()@; see SDL_Init for details.
--
--     [Returns]: a mask of all initialized subsystems if @flags@ is 0, otherwise it returns the initialization status of the specified subsystems.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Init', 'sDL_InitSubSystem'
--
--     [C declaration]: @SDL_WasInit@, defined at @SDL3\/SDL_init.h 290:43@
sDL_WasInit :: BG.FunPtr (SDL_InitFlags -> IO SDL_InitFlags)
sDL_WasInit =
  BG.unsafePerformIO hs_bindgen_53dd2f1aac19a298

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_Quit@
foreign import ccall unsafe "hs_bindgen_9b631cb78cf1671f"
  hs_bindgen_9b631cb78cf1671f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_Quit@
hs_bindgen_9b631cb78cf1671f :: IO (BG.FunPtr (IO ()))
hs_bindgen_9b631cb78cf1671f =
  BG.fromFFIType hs_bindgen_9b631cb78cf1671f_base

{-# NOINLINE sDL_Quit #-}

-- | Clean up all initialized subsystems.
--
--     You should call this function even if you have already shutdown each initialized subsystem with @SDL_QuitSubSystem()@. It is safe to call this function even in the case of errors in initialization.
--
--     You can use this function with atexit() to ensure that it is run when your application is shutdown, but it is not wise to do this from a library or other dynamically loaded code.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Init', 'sDL_QuitSubSystem'
--
--     [C declaration]: @SDL_Quit@, defined at @SDL3\/SDL_init.h 310:34@
sDL_Quit :: BG.FunPtr (IO ())
sDL_Quit =
  BG.unsafePerformIO hs_bindgen_9b631cb78cf1671f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_IsMainThread@
foreign import ccall unsafe "hs_bindgen_a902ff5ab130bb25"
  hs_bindgen_a902ff5ab130bb25_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_IsMainThread@
hs_bindgen_a902ff5ab130bb25 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_a902ff5ab130bb25 =
  BG.fromFFIType hs_bindgen_a902ff5ab130bb25_base

{-# NOINLINE sDL_IsMainThread #-}

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
--     [See also]: 'sDL_RunOnMainThread'
--
--     [C declaration]: @SDL_IsMainThread@, defined at @SDL3\/SDL_init.h 330:34@
sDL_IsMainThread :: BG.FunPtr (IO BG.CBool)
sDL_IsMainThread =
  BG.unsafePerformIO hs_bindgen_a902ff5ab130bb25

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_RunOnMainThread@
foreign import ccall unsafe "hs_bindgen_1cff011229869063"
  hs_bindgen_1cff011229869063_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_RunOnMainThread@
hs_bindgen_1cff011229869063
  :: IO (BG.FunPtr (SDL_MainThreadCallback -> BG.Ptr BG.Void -> BG.CBool -> IO BG.CBool))
hs_bindgen_1cff011229869063 =
  BG.fromFFIType hs_bindgen_1cff011229869063_base

{-# NOINLINE sDL_RunOnMainThread #-}

-- | Call a function on the main thread during event processing.
--
--     If this is called on the main thread, the callback is executed immediately. If this is called on another thread, this callback is queued for execution on the main thread during event processing.
--
--     Be careful of deadlocks when using this functionality. You should not have the main thread wait for the current thread while this function is being called with @wait_complete@ true.
--
--     [@callback@]: the callback to call on the main thread.
--
--     [@userdata@]: a pointer that is passed to @callback@.
--
--     [@wait_complete@]: true to wait for the callback to complete, false to return immediately.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_IsMainThread'
--
--     [C declaration]: @SDL_RunOnMainThread@, defined at @SDL3\/SDL_init.h 367:34@
sDL_RunOnMainThread
  :: BG.FunPtr (SDL_MainThreadCallback -> BG.Ptr BG.Void -> BG.CBool -> IO BG.CBool)
sDL_RunOnMainThread =
  BG.unsafePerformIO hs_bindgen_1cff011229869063

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_SetAppMetadata@
foreign import ccall unsafe "hs_bindgen_7a68851346541d78"
  hs_bindgen_7a68851346541d78_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_SetAppMetadata@
hs_bindgen_7a68851346541d78
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> IO BG.CBool
           )
       )
hs_bindgen_7a68851346541d78 =
  BG.fromFFIType hs_bindgen_7a68851346541d78_base

{-# NOINLINE sDL_SetAppMetadata #-}

-- | Specify basic metadata about your app.
--
--     You can optionally provide metadata about your app to SDL. This is not required, but strongly encouraged.
--
--     There are several locations where SDL can make use of metadata (an \"About\" box in the macOS menu bar, the name of the app can be shown on some audio mixers, etc). Any piece of metadata can be left as NULL, if a specific detail doesn\'t make sense for the app.
--
--     This function should be called as early as possible, before SDL_Init. Multiple calls to this function are allowed, but various state might not change once it has been set up with a previous call to this function.
--
--     Passing a NULL removes any previous metadata.
--
--     This is a simplified interface for the most important information. You can supply significantly more detailed metadata with @SDL_SetAppMetadataProperty()@.
--
--     [@appname@]: The name of the application (\"My Game 2: Bad Guy\'s Revenge!\").
--
--     [@appversion@]: The version of the application (\"1.0.0beta5\" or a git hash, or whatever makes sense).
--
--     [@appidentifier@]: A unique string in reverse-domain format that identifies this app (\"com.example.mygame2\").
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAppMetadataProperty'
--
--     [C declaration]: @SDL_SetAppMetadata@, defined at @SDL3\/SDL_init.h 405:34@
sDL_SetAppMetadata
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> IO BG.CBool
       )
sDL_SetAppMetadata =
  BG.unsafePerformIO hs_bindgen_7a68851346541d78

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_SetAppMetadataProperty@
foreign import ccall unsafe "hs_bindgen_d0081e390d662467"
  hs_bindgen_d0081e390d662467_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_SetAppMetadataProperty@
hs_bindgen_d0081e390d662467
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_d0081e390d662467 =
  BG.fromFFIType hs_bindgen_d0081e390d662467_base

{-# NOINLINE sDL_SetAppMetadataProperty #-}

-- | Specify metadata about your app through a set of properties.
--
--     You can optionally provide metadata about your app to SDL. This is not required, but strongly encouraged.
--
--     There are several locations where SDL can make use of metadata (an \"About\" box in the macOS menu bar, the name of the app can be shown on some audio mixers, etc). Any piece of metadata can be left out, if a specific detail doesn\'t make sense for the app.
--
--     This function should be called as early as possible, before SDL_Init. Multiple calls to this function are allowed, but various state might not change once it has been set up with a previous call to this function.
--
--     Once set, this metadata can be read using @SDL_GetAppMetadataProperty()@.
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
--     [@name@]: the name of the metadata property to set.
--
--     [@value@]: the value of the property, or NULL to remove that property.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAppMetadataProperty', 'sDL_SetAppMetadata'
--
--     [C declaration]: @SDL_SetAppMetadataProperty@, defined at @SDL3\/SDL_init.h 468:34@
sDL_SetAppMetadataProperty
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_SetAppMetadataProperty =
  BG.unsafePerformIO hs_bindgen_d0081e390d662467

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_GetAppMetadataProperty@
foreign import ccall unsafe "hs_bindgen_fdbd2caae5327fdc"
  hs_bindgen_fdbd2caae5327fdc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Init_get_SDL_GetAppMetadataProperty@
hs_bindgen_fdbd2caae5327fdc
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_fdbd2caae5327fdc =
  BG.fromFFIType hs_bindgen_fdbd2caae5327fdc_base

{-# NOINLINE sDL_GetAppMetadataProperty #-}

-- | Get metadata about your app.
--
--     This returns metadata previously set using @SDL_SetAppMetadata()@ or @SDL_SetAppMetadataProperty()@. See @SDL_SetAppMetadataProperty()@ for the list of available properties and their meanings.
--
--     [@name@]: the name of the metadata property to get.
--
--     [Returns]: the current value of the metadata property, or the default if it is not set, NULL for properties with no default.
--
--     [Thread safety]: It is safe to call this function from any thread, although the string returned is not protected and could potentially be freed if you call @SDL_SetAppMetadataProperty()@ to set that property from another thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAppMetadata', 'sDL_SetAppMetadataProperty'
--
--     [C declaration]: @SDL_GetAppMetadataProperty@, defined at @SDL3\/SDL_init.h 499:42@
sDL_GetAppMetadataProperty
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetAppMetadataProperty =
  BG.unsafePerformIO hs_bindgen_fdbd2caae5327fdc

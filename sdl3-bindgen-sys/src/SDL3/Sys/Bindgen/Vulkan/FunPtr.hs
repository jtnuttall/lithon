{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Vulkan.FunPtr (
  SDL3.Sys.Bindgen.Vulkan.FunPtr.sDL_Vulkan_LoadLibrary,
  SDL3.Sys.Bindgen.Vulkan.FunPtr.sDL_Vulkan_GetVkGetInstanceProcAddr,
  SDL3.Sys.Bindgen.Vulkan.FunPtr.sDL_Vulkan_UnloadLibrary,
  SDL3.Sys.Bindgen.Vulkan.FunPtr.sDL_Vulkan_GetInstanceExtensions,
  SDL3.Sys.Bindgen.Vulkan.FunPtr.sDL_Vulkan_CreateSurface,
  SDL3.Sys.Bindgen.Vulkan.FunPtr.sDL_Vulkan_DestroySurface,
  SDL3.Sys.Bindgen.Vulkan.FunPtr.sDL_Vulkan_GetPresentationSupport,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Video qualified
import SDL3.Sys.Bindgen.Vulkan

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_vulkan.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_LoadLibrary */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d0d596710f473c05 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_Vulkan_LoadLibrary;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_GetVkGetInstanceProcAddr */"
         , "__attribute__ ((const))"
         , "SDL_FunctionPointer (*hs_bindgen_e561af225e7863f2 (void)) (void)"
         , "{"
         , "  return &SDL_Vulkan_GetVkGetInstanceProcAddr;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_UnloadLibrary */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_8dbd3b301be26b64 (void)) (void)"
         , "{"
         , "  return &SDL_Vulkan_UnloadLibrary;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_GetInstanceExtensions */"
         , "__attribute__ ((const))"
         , "char const *const *(*hs_bindgen_86f751b3ecdfa51d (void)) ("
         , "  Uint32 *arg1"
         , ")"
         , "{"
         , "  return &SDL_Vulkan_GetInstanceExtensions;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_CreateSurface */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8ae9a4cb1d4352ac (void)) ("
         , "  SDL_Window *arg1,"
         , "  VkInstance arg2,"
         , "  struct VkAllocationCallbacks const *arg3,"
         , "  VkSurfaceKHR *arg4"
         , ")"
         , "{"
         , "  return &SDL_Vulkan_CreateSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_DestroySurface */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_5ea94b407895c233 (void)) ("
         , "  VkInstance arg1,"
         , "  VkSurfaceKHR arg2,"
         , "  struct VkAllocationCallbacks const *arg3"
         , ")"
         , "{"
         , "  return &SDL_Vulkan_DestroySurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_GetPresentationSupport */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e61814e6ac761e26 (void)) ("
         , "  VkInstance arg1,"
         , "  VkPhysicalDevice arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return &SDL_Vulkan_GetPresentationSupport;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_LoadLibrary@
foreign import ccall unsafe "hs_bindgen_d0d596710f473c05"
  hs_bindgen_d0d596710f473c05_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_LoadLibrary@
hs_bindgen_d0d596710f473c05 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_d0d596710f473c05 =
  BG.fromFFIType hs_bindgen_d0d596710f473c05_base

{-# NOINLINE sDL_Vulkan_LoadLibrary #-}

-- | Dynamically load the Vulkan loader library.
--
--     This should be called after initializing the video driver, but before creating any Vulkan windows. If no Vulkan loader library is loaded, the default library will be loaded upon creation of the first Vulkan window.
--
--     SDL keeps a counter of how many times this function has been successfully called, so it is safe to call this function multiple times, so long as it is eventually paired with an equivalent number of calls to SDL_Vulkan_UnloadLibrary. The @path@ argument is ignored unless there is no library currently loaded, and and the library isn\'t actually unloaded until there have been an equivalent number of calls to SDL_Vulkan_UnloadLibrary.
--
--     It is fairly common for Vulkan applications to link with libvulkan instead of explicitly loading it at run time. This will work with SDL provided the application links to a dynamic library and both it and SDL use the same search path.
--
--     If you specify a non-NULL @path@, an application should retrieve all of the Vulkan functions it uses from the dynamic library using SDL_Vulkan_GetVkGetInstanceProcAddr unless you can guarantee @path@ points to the same vulkan loader library the application linked to.
--
--     On Apple devices, if @path@ is NULL, SDL will attempt to find the @vkGetInstanceProcAddr@ address within all the Mach-O images of the current process. This is because it is fairly common for Vulkan applications to link with libvulkan (and historically MoltenVK was provided as a static library). If it is not found, on macOS, SDL will attempt to load @vulkan.framework\/vulkan@, @libvulkan.1.dylib@, @MoltenVK.framework\/MoltenVK@, and @libMoltenVK.dylib@, in that order. On iOS, SDL will attempt to load @libMoltenVK.dylib@. Applications using a dynamic framework or .dylib must ensure it is included in its application bundle.
--
--     On non-Apple devices, application linking with a static libvulkan is not supported. Either do not link to the Vulkan loader or link to a dynamic library version.
--
--     [@path@]: the platform dependent Vulkan loader library name or NULL.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Vulkan_GetVkGetInstanceProcAddr', 'sDL_Vulkan_UnloadLibrary'
--
--     [C declaration]: @SDL_Vulkan_LoadLibrary@, defined at @SDL3\/SDL_vulkan.h 133:34@
sDL_Vulkan_LoadLibrary :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_Vulkan_LoadLibrary =
  BG.unsafePerformIO hs_bindgen_d0d596710f473c05

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_GetVkGetInstanceProcAddr@
foreign import ccall unsafe "hs_bindgen_e561af225e7863f2"
  hs_bindgen_e561af225e7863f2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_GetVkGetInstanceProcAddr@
hs_bindgen_e561af225e7863f2 :: IO (BG.FunPtr (IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer))
hs_bindgen_e561af225e7863f2 =
  BG.fromFFIType hs_bindgen_e561af225e7863f2_base

{-# NOINLINE sDL_Vulkan_GetVkGetInstanceProcAddr #-}

-- | Get the address of the @vkGetInstanceProcAddr@ function.
--
--     This should be called after either calling @SDL_Vulkan_LoadLibrary()@ or creating an SDL_Window with the @SDL_WINDOW_VULKAN@ flag.
--
--     The actual type of the returned function pointer is PFN_vkGetInstanceProcAddr, but that isn\'t available because the Vulkan headers are not included here. You should cast the return value of this function to that type, e.g.
--
--     @vkGetInstanceProcAddr = (PFN_vkGetInstanceProcAddr) SDL_Vulkan_GetVkGetInstanceProcAddr();@
--
--     [Returns]: the function pointer for @vkGetInstanceProcAddr@ or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_Vulkan_GetVkGetInstanceProcAddr@, defined at @SDL3\/SDL_vulkan.h 154:49@
sDL_Vulkan_GetVkGetInstanceProcAddr :: BG.FunPtr (IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer)
sDL_Vulkan_GetVkGetInstanceProcAddr =
  BG.unsafePerformIO hs_bindgen_e561af225e7863f2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_UnloadLibrary@
foreign import ccall unsafe "hs_bindgen_8dbd3b301be26b64"
  hs_bindgen_8dbd3b301be26b64_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_UnloadLibrary@
hs_bindgen_8dbd3b301be26b64 :: IO (BG.FunPtr (IO ()))
hs_bindgen_8dbd3b301be26b64 =
  BG.fromFFIType hs_bindgen_8dbd3b301be26b64_base

{-# NOINLINE sDL_Vulkan_UnloadLibrary #-}

-- | Unload the Vulkan library previously loaded by @SDL_Vulkan_LoadLibrary()@.
--
--     SDL keeps a counter of how many times this function has been called, so it is safe to call this function multiple times, so long as it is paired with an equivalent number of calls to SDL_Vulkan_LoadLibrary. The library isn\'t actually unloaded until there have been an equivalent number of calls to SDL_Vulkan_UnloadLibrary.
--
--     Once the library has actually been unloaded, if any Vulkan instances remain, they will likely crash the program. Clean up any existing Vulkan resources, and destroy appropriate windows, renderers and GPU devices before calling this function.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Vulkan_LoadLibrary'
--
--     [C declaration]: @SDL_Vulkan_UnloadLibrary@, defined at @SDL3\/SDL_vulkan.h 176:34@
sDL_Vulkan_UnloadLibrary :: BG.FunPtr (IO ())
sDL_Vulkan_UnloadLibrary =
  BG.unsafePerformIO hs_bindgen_8dbd3b301be26b64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_GetInstanceExtensions@
foreign import ccall unsafe "hs_bindgen_86f751b3ecdfa51d"
  hs_bindgen_86f751b3ecdfa51d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_GetInstanceExtensions@
hs_bindgen_86f751b3ecdfa51d
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO (PtrConst.PtrConst (PtrConst.PtrConst BG.CChar)))
       )
hs_bindgen_86f751b3ecdfa51d =
  BG.fromFFIType hs_bindgen_86f751b3ecdfa51d_base

{-# NOINLINE sDL_Vulkan_GetInstanceExtensions #-}

-- | Get the Vulkan instance extensions needed for vkCreateInstance.
--
--     This should be called after either calling @SDL_Vulkan_LoadLibrary()@ or creating an SDL_Window with the @SDL_WINDOW_VULKAN@ flag.
--
--     On return, the variable pointed to by @count@ will be set to the number of elements returned, suitable for using with VkInstanceCreateInfo::enabledExtensionCount, and the returned array can be used with VkInstanceCreateInfo::ppEnabledExtensionNames, for calling Vulkan\'s vkCreateInstance API.
--
--     You should not free the returned array; it is owned by SDL.
--
--     [@count@]: a pointer filled in with the number of extensions returned.
--
--     [Returns]: an array of extension name strings on success, NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Vulkan_CreateSurface'
--
--     [C declaration]: @SDL_Vulkan_GetInstanceExtensions@, defined at @SDL3\/SDL_vulkan.h 200:50@
sDL_Vulkan_GetInstanceExtensions
  :: BG.FunPtr
       (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO (PtrConst.PtrConst (PtrConst.PtrConst BG.CChar)))
sDL_Vulkan_GetInstanceExtensions =
  BG.unsafePerformIO hs_bindgen_86f751b3ecdfa51d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_CreateSurface@
foreign import ccall unsafe "hs_bindgen_8ae9a4cb1d4352ac"
  hs_bindgen_8ae9a4cb1d4352ac_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_CreateSurface@
hs_bindgen_8ae9a4cb1d4352ac
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
             -> VkInstance
             -> PtrConst.PtrConst VkAllocationCallbacks
             -> BG.Ptr VkSurfaceKHR
             -> IO BG.CBool
           )
       )
hs_bindgen_8ae9a4cb1d4352ac =
  BG.fromFFIType hs_bindgen_8ae9a4cb1d4352ac_base

{-# NOINLINE sDL_Vulkan_CreateSurface #-}

-- | Create a Vulkan rendering surface for a window.
--
--     The @window@ must have been created with the @SDL_WINDOW_VULKAN@ flag and @instance@ must have been created with extensions returned by @SDL_Vulkan_GetInstanceExtensions()@ enabled.
--
--     If @allocator@ is NULL, Vulkan will use the system default allocator. This argument is passed directly to Vulkan and isn\'t used by SDL itself.
--
--     [@window@]: the window to which to attach the Vulkan surface.
--
--     [@instance@]: the Vulkan instance handle.
--
--     [@allocator@]: a VkAllocationCallbacks struct, which lets the app set the allocator that creates the surface. Can be NULL.
--
--     [@surface@]: a pointer to a VkSurfaceKHR handle to output the newly created surface.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Vulkan_GetInstanceExtensions', 'sDL_Vulkan_DestroySurface'
--
--     [C declaration]: @SDL_Vulkan_CreateSurface@, defined at @SDL3\/SDL_vulkan.h 226:34@
sDL_Vulkan_CreateSurface
  :: BG.FunPtr
       ( BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
         -> VkInstance
         -> PtrConst.PtrConst VkAllocationCallbacks
         -> BG.Ptr VkSurfaceKHR
         -> IO BG.CBool
       )
sDL_Vulkan_CreateSurface =
  BG.unsafePerformIO hs_bindgen_8ae9a4cb1d4352ac

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_DestroySurface@
foreign import ccall unsafe "hs_bindgen_5ea94b407895c233"
  hs_bindgen_5ea94b407895c233_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_DestroySurface@
hs_bindgen_5ea94b407895c233
  :: IO (BG.FunPtr (VkInstance -> VkSurfaceKHR -> PtrConst.PtrConst VkAllocationCallbacks -> IO ()))
hs_bindgen_5ea94b407895c233 =
  BG.fromFFIType hs_bindgen_5ea94b407895c233_base

{-# NOINLINE sDL_Vulkan_DestroySurface #-}

-- | Destroy the Vulkan rendering surface of a window.
--
--     This should be called before SDL_DestroyWindow, if SDL_Vulkan_CreateSurface was called after SDL_CreateWindow.
--
--     The @instance@ must have been created with extensions returned by @SDL_Vulkan_GetInstanceExtensions()@ enabled and @surface@ must have been created successfully by an @SDL_Vulkan_CreateSurface()@ call.
--
--     If @allocator@ is NULL, Vulkan will use the system default allocator. This argument is passed directly to Vulkan and isn\'t used by SDL itself.
--
--     [@instance@]: the Vulkan instance handle.
--
--     [@surface@]: vkSurfaceKHR handle to destroy.
--
--     [@allocator@]: a VkAllocationCallbacks struct, which lets the app set the allocator that destroys the surface. Can be NULL.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Vulkan_GetInstanceExtensions', 'sDL_Vulkan_CreateSurface'
--
--     [C declaration]: @SDL_Vulkan_DestroySurface@, defined at @SDL3\/SDL_vulkan.h 254:34@
sDL_Vulkan_DestroySurface
  :: BG.FunPtr (VkInstance -> VkSurfaceKHR -> PtrConst.PtrConst VkAllocationCallbacks -> IO ())
sDL_Vulkan_DestroySurface =
  BG.unsafePerformIO hs_bindgen_5ea94b407895c233

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_GetPresentationSupport@
foreign import ccall unsafe "hs_bindgen_e61814e6ac761e26"
  hs_bindgen_e61814e6ac761e26_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_get_SDL_Vulkan_GetPresentationSupport@
hs_bindgen_e61814e6ac761e26
  :: IO (BG.FunPtr (VkInstance -> VkPhysicalDevice -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_e61814e6ac761e26 =
  BG.fromFFIType hs_bindgen_e61814e6ac761e26_base

{-# NOINLINE sDL_Vulkan_GetPresentationSupport #-}

-- | Query support for presentation via a given physical device and queue family.
--
--     The @instance@ must have been created with extensions returned by @SDL_Vulkan_GetInstanceExtensions()@ enabled.
--
--     [@instance@]: the Vulkan instance handle.
--
--     [@physicalDevice@]: a valid Vulkan physical device handle.
--
--     [@queueFamilyIndex@]: a valid queue family index for the given physical device.
--
--     [Returns]: true if supported, false if unsupported or an error occurred.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Vulkan_GetInstanceExtensions'
--
--     [C declaration]: @SDL_Vulkan_GetPresentationSupport@, defined at @SDL3\/SDL_vulkan.h 275:34@
sDL_Vulkan_GetPresentationSupport
  :: BG.FunPtr (VkInstance -> VkPhysicalDevice -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_Vulkan_GetPresentationSupport =
  BG.unsafePerformIO hs_bindgen_e61814e6ac761e26

{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Vulkan.Safe (
  SDL3.Sys.Bindgen.Vulkan.Safe.sDL_Vulkan_LoadLibrary,
  SDL3.Sys.Bindgen.Vulkan.Safe.sDL_Vulkan_GetVkGetInstanceProcAddr,
  SDL3.Sys.Bindgen.Vulkan.Safe.sDL_Vulkan_UnloadLibrary,
  SDL3.Sys.Bindgen.Vulkan.Safe.sDL_Vulkan_GetInstanceExtensions,
  SDL3.Sys.Bindgen.Vulkan.Safe.sDL_Vulkan_CreateSurface,
  SDL3.Sys.Bindgen.Vulkan.Safe.sDL_Vulkan_DestroySurface,
  SDL3.Sys.Bindgen.Vulkan.Safe.sDL_Vulkan_GetPresentationSupport,
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
         , "_Bool hs_bindgen_ef9e83627c649a75 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_Vulkan_LoadLibrary)(arg1);"
         , "}"
         , "SDL_FunctionPointer hs_bindgen_eda99f289265681d (void)"
         , "{"
         , "  return (SDL_Vulkan_GetVkGetInstanceProcAddr)();"
         , "}"
         , "void hs_bindgen_ba0b6a1db50d1914 (void)"
         , "{"
         , "  (SDL_Vulkan_UnloadLibrary)();"
         , "}"
         , "char const *const *hs_bindgen_282c9f5ce4ea1600 ("
         , "  Uint32 *arg1"
         , ")"
         , "{"
         , "  return (SDL_Vulkan_GetInstanceExtensions)(arg1);"
         , "}"
         , "_Bool hs_bindgen_6e90d5d762dab7a4 ("
         , "  SDL_Window *arg1,"
         , "  VkInstance arg2,"
         , "  struct VkAllocationCallbacks const *arg3,"
         , "  VkSurfaceKHR *arg4"
         , ")"
         , "{"
         , "  return (SDL_Vulkan_CreateSurface)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_584b3250cc77055d ("
         , "  VkInstance arg1,"
         , "  VkSurfaceKHR arg2,"
         , "  struct VkAllocationCallbacks const *arg3"
         , ")"
         , "{"
         , "  (SDL_Vulkan_DestroySurface)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_861d49977f9c657e ("
         , "  VkInstance arg1,"
         , "  VkPhysicalDevice arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return (SDL_Vulkan_GetPresentationSupport)(arg1, arg2, arg3);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_LoadLibrary@
foreign import ccall safe "hs_bindgen_ef9e83627c649a75"
  hs_bindgen_ef9e83627c649a75_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_LoadLibrary@
hs_bindgen_ef9e83627c649a75
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_ef9e83627c649a75 =
  BG.fromFFIType hs_bindgen_ef9e83627c649a75_base

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
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Vulkan_GetVkGetInstanceProcAddr', 'sDL_Vulkan_UnloadLibrary'
--
--     [C declaration]: @SDL_Vulkan_LoadLibrary@, defined at @SDL3\/SDL_vulkan.h 133:34@
sDL_Vulkan_LoadLibrary
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the platform dependent Vulkan loader library name or NULL.
  -> IO BG.CBool
sDL_Vulkan_LoadLibrary = hs_bindgen_ef9e83627c649a75

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_GetVkGetInstanceProcAddr@
foreign import ccall safe "hs_bindgen_eda99f289265681d"
  hs_bindgen_eda99f289265681d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_GetVkGetInstanceProcAddr@
hs_bindgen_eda99f289265681d :: IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
hs_bindgen_eda99f289265681d =
  BG.fromFFIType hs_bindgen_eda99f289265681d_base

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
sDL_Vulkan_GetVkGetInstanceProcAddr :: IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
sDL_Vulkan_GetVkGetInstanceProcAddr =
  hs_bindgen_eda99f289265681d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_UnloadLibrary@
foreign import ccall safe "hs_bindgen_ba0b6a1db50d1914"
  hs_bindgen_ba0b6a1db50d1914_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_UnloadLibrary@
hs_bindgen_ba0b6a1db50d1914 :: IO ()
hs_bindgen_ba0b6a1db50d1914 =
  BG.fromFFIType hs_bindgen_ba0b6a1db50d1914_base

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
sDL_Vulkan_UnloadLibrary :: IO ()
sDL_Vulkan_UnloadLibrary =
  hs_bindgen_ba0b6a1db50d1914

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_GetInstanceExtensions@
foreign import ccall safe "hs_bindgen_282c9f5ce4ea1600"
  hs_bindgen_282c9f5ce4ea1600_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_GetInstanceExtensions@
hs_bindgen_282c9f5ce4ea1600
  :: BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO (PtrConst.PtrConst (PtrConst.PtrConst BG.CChar))
hs_bindgen_282c9f5ce4ea1600 =
  BG.fromFFIType hs_bindgen_282c9f5ce4ea1600_base

-- | Get the Vulkan instance extensions needed for vkCreateInstance.
--
--     This should be called after either calling @SDL_Vulkan_LoadLibrary()@ or creating an SDL_Window with the @SDL_WINDOW_VULKAN@ flag.
--
--     On return, the variable pointed to by @count@ will be set to the number of elements returned, suitable for using with VkInstanceCreateInfo::enabledExtensionCount, and the returned array can be used with VkInstanceCreateInfo::ppEnabledExtensionNames, for calling Vulkan\'s vkCreateInstance API.
--
--     You should not free the returned array; it is owned by SDL.
--
--     [Returns]: an array of extension name strings on success, NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Vulkan_CreateSurface'
--
--     [C declaration]: @SDL_Vulkan_GetInstanceExtensions@, defined at @SDL3\/SDL_vulkan.h 200:50@
sDL_Vulkan_GetInstanceExtensions
  :: BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of extensions returned.
  -> IO (PtrConst.PtrConst (PtrConst.PtrConst BG.CChar))
sDL_Vulkan_GetInstanceExtensions =
  hs_bindgen_282c9f5ce4ea1600

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_CreateSurface@
foreign import ccall safe "hs_bindgen_6e90d5d762dab7a4"
  hs_bindgen_6e90d5d762dab7a4_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_CreateSurface@
hs_bindgen_6e90d5d762dab7a4
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> VkInstance
  -> PtrConst.PtrConst VkAllocationCallbacks
  -> BG.Ptr VkSurfaceKHR
  -> IO BG.CBool
hs_bindgen_6e90d5d762dab7a4 =
  BG.fromFFIType hs_bindgen_6e90d5d762dab7a4_base

-- | Create a Vulkan rendering surface for a window.
--
--     The @window@ must have been created with the @SDL_WINDOW_VULKAN@ flag and @instance@ must have been created with extensions returned by @SDL_Vulkan_GetInstanceExtensions()@ enabled.
--
--     If @allocator@ is NULL, Vulkan will use the system default allocator. This argument is passed directly to Vulkan and isn\'t used by SDL itself.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Vulkan_GetInstanceExtensions', 'sDL_Vulkan_DestroySurface'
--
--     [C declaration]: @SDL_Vulkan_CreateSurface@, defined at @SDL3\/SDL_vulkan.h 226:34@
sDL_Vulkan_CreateSurface
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to which to attach the Vulkan surface.
  -> VkInstance
  -- ^
  --
  --           [@instance@]: the Vulkan instance handle.
  -> PtrConst.PtrConst VkAllocationCallbacks
  -- ^
  --
  --           [@allocator@]: a VkAllocationCallbacks struct, which lets the app set the allocator that creates the surface. Can be NULL.
  -> BG.Ptr VkSurfaceKHR
  -- ^
  --
  --           [@surface@]: a pointer to a VkSurfaceKHR handle to output the newly created surface.
  -> IO BG.CBool
sDL_Vulkan_CreateSurface =
  hs_bindgen_6e90d5d762dab7a4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_DestroySurface@
foreign import ccall safe "hs_bindgen_584b3250cc77055d"
  hs_bindgen_584b3250cc77055d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_DestroySurface@
hs_bindgen_584b3250cc77055d
  :: VkInstance
  -> VkSurfaceKHR
  -> PtrConst.PtrConst VkAllocationCallbacks
  -> IO ()
hs_bindgen_584b3250cc77055d =
  BG.fromFFIType hs_bindgen_584b3250cc77055d_base

-- | Destroy the Vulkan rendering surface of a window.
--
--     This should be called before SDL_DestroyWindow, if SDL_Vulkan_CreateSurface was called after SDL_CreateWindow.
--
--     The @instance@ must have been created with extensions returned by @SDL_Vulkan_GetInstanceExtensions()@ enabled and @surface@ must have been created successfully by an @SDL_Vulkan_CreateSurface()@ call.
--
--     If @allocator@ is NULL, Vulkan will use the system default allocator. This argument is passed directly to Vulkan and isn\'t used by SDL itself.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Vulkan_GetInstanceExtensions', 'sDL_Vulkan_CreateSurface'
--
--     [C declaration]: @SDL_Vulkan_DestroySurface@, defined at @SDL3\/SDL_vulkan.h 254:34@
sDL_Vulkan_DestroySurface
  :: VkInstance
  -- ^
  --
  --           [@instance@]: the Vulkan instance handle.
  -> VkSurfaceKHR
  -- ^
  --
  --           [@surface@]: vkSurfaceKHR handle to destroy.
  -> PtrConst.PtrConst VkAllocationCallbacks
  -- ^
  --
  --           [@allocator@]: a VkAllocationCallbacks struct, which lets the app set the allocator that destroys the surface. Can be NULL.
  -> IO ()
sDL_Vulkan_DestroySurface =
  hs_bindgen_584b3250cc77055d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_GetPresentationSupport@
foreign import ccall safe "hs_bindgen_861d49977f9c657e"
  hs_bindgen_861d49977f9c657e_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Vulkan_Safe_SDL_Vulkan_GetPresentationSupport@
hs_bindgen_861d49977f9c657e
  :: VkInstance
  -> VkPhysicalDevice
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_861d49977f9c657e =
  BG.fromFFIType hs_bindgen_861d49977f9c657e_base

-- | Query support for presentation via a given physical device and queue family.
--
--     The @instance@ must have been created with extensions returned by @SDL_Vulkan_GetInstanceExtensions()@ enabled.
--
--     [Returns]: true if supported, false if unsupported or an error occurred.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Vulkan_GetInstanceExtensions'
--
--     [C declaration]: @SDL_Vulkan_GetPresentationSupport@, defined at @SDL3\/SDL_vulkan.h 275:34@
sDL_Vulkan_GetPresentationSupport
  :: VkInstance
  -- ^
  --
  --           [@instance@]: the Vulkan instance handle.
  -> VkPhysicalDevice
  -- ^
  --
  --           [@physicalDevice@]: a valid Vulkan physical device handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@queueFamilyIndex@]: a valid queue family index for the given physical device.
  -> IO BG.CBool
sDL_Vulkan_GetPresentationSupport =
  hs_bindgen_861d49977f9c657e

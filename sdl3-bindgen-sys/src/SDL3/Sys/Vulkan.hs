-- | Functions for creating Vulkan surfaces on SDL windows.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Vulkan.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Vulkan (
  module SDL3.Sys.Bindgen.Vulkan,

  -- * Function aliases
  SDL3.Sys.Vulkan.vulkanLoadLibrary,
  SDL3.Sys.Vulkan.vulkanLoadLibrarySafe,
  SDL3.Sys.Vulkan.vulkanGetVkGetInstanceProcAddr,
  SDL3.Sys.Vulkan.vulkanGetVkGetInstanceProcAddrSafe,
  SDL3.Sys.Vulkan.vulkanUnloadLibrary,
  SDL3.Sys.Vulkan.vulkanUnloadLibrarySafe,
  SDL3.Sys.Vulkan.vulkanGetInstanceExtensions,
  SDL3.Sys.Vulkan.vulkanGetInstanceExtensionsSafe,
  SDL3.Sys.Vulkan.vulkanCreateSurface,
  SDL3.Sys.Vulkan.vulkanCreateSurfaceSafe,
  SDL3.Sys.Vulkan.vulkanDestroySurface,
  SDL3.Sys.Vulkan.vulkanDestroySurfaceSafe,
  SDL3.Sys.Vulkan.vulkanGetPresentationSupport,
  SDL3.Sys.Vulkan.vulkanGetPresentationSupportSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Video qualified
import SDL3.Sys.Bindgen.Vulkan
import SDL3.Sys.Bindgen.Vulkan.Safe qualified as Safe
import SDL3.Sys.Bindgen.Vulkan.Unsafe qualified as Unsafe

-- | Dynamically load the Vulkan loader library.
--
--     This should be called after initializing the video driver, but before creating any Vulkan windows. If no Vulkan loader library is loaded, the default library will be loaded upon creation of the first Vulkan window.
--
--     SDL keeps a counter of how many times this function has been successfully called, so it is safe to call this function multiple times, so long as it is eventually paired with an equivalent number of calls to 'vulkanUnloadLibrary'. The @path@ argument is ignored unless there is no library currently loaded, and and the library isn\'t actually unloaded until there have been an equivalent number of calls to 'vulkanUnloadLibrary'.
--
--     It is fairly common for Vulkan applications to link with libvulkan instead of explicitly loading it at run time. This will work with SDL provided the application links to a dynamic library and both it and SDL use the same search path.
--
--     If you specify a non-NULL @path@, an application should retrieve all of the Vulkan functions it uses from the dynamic library using 'vulkanGetVkGetInstanceProcAddr' unless you can guarantee @path@ points to the same vulkan loader library the application linked to.
--
--     On Apple devices, if @path@ is NULL, SDL will attempt to find the @vkGetInstanceProcAddr@ address within all the Mach-O images of the current process. This is because it is fairly common for Vulkan applications to link with libvulkan (and historically MoltenVK was provided as a static library). If it is not found, on macOS, SDL will attempt to load @vulkan.framework\/vulkan@, @libvulkan.1.dylib@, @MoltenVK.framework\/MoltenVK@, and @libMoltenVK.dylib@, in that order. On iOS, SDL will attempt to load @libMoltenVK.dylib@. Applications using a dynamic framework or .dylib must ensure it is included in its application bundle.
--
--     On non-Apple devices, application linking with a static libvulkan is not supported. Either do not link to the Vulkan loader or link to a dynamic library version.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'vulkanGetVkGetInstanceProcAddr', 'vulkanUnloadLibrary'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Vulkan_LoadLibrary@.
--                   The safe flavor is 'vulkanLoadLibrarySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_Vulkan_LoadLibrary@, defined at @SDL3\/SDL_vulkan.h 133:34@
vulkanLoadLibrary
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the platform dependent Vulkan loader library name or NULL.
  -> IO Bool
vulkanLoadLibrary =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_Vulkan_LoadLibrary x00)

-- | Dynamically load the Vulkan loader library.
--
--     This should be called after initializing the video driver, but before creating any Vulkan windows. If no Vulkan loader library is loaded, the default library will be loaded upon creation of the first Vulkan window.
--
--     SDL keeps a counter of how many times this function has been successfully called, so it is safe to call this function multiple times, so long as it is eventually paired with an equivalent number of calls to 'vulkanUnloadLibrary'. The @path@ argument is ignored unless there is no library currently loaded, and and the library isn\'t actually unloaded until there have been an equivalent number of calls to 'vulkanUnloadLibrary'.
--
--     It is fairly common for Vulkan applications to link with libvulkan instead of explicitly loading it at run time. This will work with SDL provided the application links to a dynamic library and both it and SDL use the same search path.
--
--     If you specify a non-NULL @path@, an application should retrieve all of the Vulkan functions it uses from the dynamic library using 'vulkanGetVkGetInstanceProcAddr' unless you can guarantee @path@ points to the same vulkan loader library the application linked to.
--
--     On Apple devices, if @path@ is NULL, SDL will attempt to find the @vkGetInstanceProcAddr@ address within all the Mach-O images of the current process. This is because it is fairly common for Vulkan applications to link with libvulkan (and historically MoltenVK was provided as a static library). If it is not found, on macOS, SDL will attempt to load @vulkan.framework\/vulkan@, @libvulkan.1.dylib@, @MoltenVK.framework\/MoltenVK@, and @libMoltenVK.dylib@, in that order. On iOS, SDL will attempt to load @libMoltenVK.dylib@. Applications using a dynamic framework or .dylib must ensure it is included in its application bundle.
--
--     On non-Apple devices, application linking with a static libvulkan is not supported. Either do not link to the Vulkan loader or link to a dynamic library version.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'vulkanGetVkGetInstanceProcAddr', 'vulkanUnloadLibrary'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Vulkan_LoadLibrary@.
--                   The unsafe flavor is 'vulkanLoadLibrary'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_Vulkan_LoadLibrary@, defined at @SDL3\/SDL_vulkan.h 133:34@
vulkanLoadLibrarySafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the platform dependent Vulkan loader library name or NULL.
  -> IO Bool
vulkanLoadLibrarySafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_Vulkan_LoadLibrary x00)

-- | Get the address of the @vkGetInstanceProcAddr@ function.
--
--     This should be called after either calling @'vulkanLoadLibrary'@ or creating an SDL_Window with the @SDL_WINDOW_VULKAN@ flag.
--
--     The actual type of the returned function pointer is PFN_vkGetInstanceProcAddr, but that isn\'t available because the Vulkan headers are not included here. You should cast the return value of this function to that type, e.g.
--
--     @vkGetInstanceProcAddr = (PFN_vkGetInstanceProcAddr) 'vulkanGetVkGetInstanceProcAddr';@
--
--     [Returns]: the function pointer for @vkGetInstanceProcAddr@ or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Vulkan_GetVkGetInstanceProcAddr@.
--                   The safe flavor is 'vulkanGetVkGetInstanceProcAddrSafe'
--                   .
--
--     [C declaration]: @SDL_Vulkan_GetVkGetInstanceProcAddr@, defined at @SDL3\/SDL_vulkan.h 154:49@
vulkanGetVkGetInstanceProcAddr :: IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
vulkanGetVkGetInstanceProcAddr =
  Unsafe.sDL_Vulkan_GetVkGetInstanceProcAddr

-- | Get the address of the @vkGetInstanceProcAddr@ function.
--
--     This should be called after either calling @'vulkanLoadLibrary'@ or creating an SDL_Window with the @SDL_WINDOW_VULKAN@ flag.
--
--     The actual type of the returned function pointer is PFN_vkGetInstanceProcAddr, but that isn\'t available because the Vulkan headers are not included here. You should cast the return value of this function to that type, e.g.
--
--     @vkGetInstanceProcAddr = (PFN_vkGetInstanceProcAddr) 'vulkanGetVkGetInstanceProcAddr';@
--
--     [Returns]: the function pointer for @vkGetInstanceProcAddr@ or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Vulkan_GetVkGetInstanceProcAddr@.
--                   The unsafe flavor is 'vulkanGetVkGetInstanceProcAddr'
--                   .
--
--     [C declaration]: @SDL_Vulkan_GetVkGetInstanceProcAddr@, defined at @SDL3\/SDL_vulkan.h 154:49@
vulkanGetVkGetInstanceProcAddrSafe :: IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
vulkanGetVkGetInstanceProcAddrSafe =
  Safe.sDL_Vulkan_GetVkGetInstanceProcAddr

-- | Unload the Vulkan library previously loaded by @'vulkanLoadLibrary'@.
--
--     SDL keeps a counter of how many times this function has been called, so it is safe to call this function multiple times, so long as it is paired with an equivalent number of calls to 'vulkanLoadLibrary'. The library isn\'t actually unloaded until there have been an equivalent number of calls to 'vulkanUnloadLibrary'.
--
--     Once the library has actually been unloaded, if any Vulkan instances remain, they will likely crash the program. Clean up any existing Vulkan resources, and destroy appropriate windows, renderers and GPU devices before calling this function.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'vulkanLoadLibrary'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Vulkan_UnloadLibrary@.
--                   The safe flavor is 'vulkanUnloadLibrarySafe'
--                   .
--
--     [C declaration]: @SDL_Vulkan_UnloadLibrary@, defined at @SDL3\/SDL_vulkan.h 176:34@
vulkanUnloadLibrary :: IO ()
vulkanUnloadLibrary = Unsafe.sDL_Vulkan_UnloadLibrary

-- | Unload the Vulkan library previously loaded by @'vulkanLoadLibrary'@.
--
--     SDL keeps a counter of how many times this function has been called, so it is safe to call this function multiple times, so long as it is paired with an equivalent number of calls to 'vulkanLoadLibrary'. The library isn\'t actually unloaded until there have been an equivalent number of calls to 'vulkanUnloadLibrary'.
--
--     Once the library has actually been unloaded, if any Vulkan instances remain, they will likely crash the program. Clean up any existing Vulkan resources, and destroy appropriate windows, renderers and GPU devices before calling this function.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'vulkanLoadLibrary'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Vulkan_UnloadLibrary@.
--                   The unsafe flavor is 'vulkanUnloadLibrary'
--                   .
--
--     [C declaration]: @SDL_Vulkan_UnloadLibrary@, defined at @SDL3\/SDL_vulkan.h 176:34@
vulkanUnloadLibrarySafe :: IO ()
vulkanUnloadLibrarySafe =
  Safe.sDL_Vulkan_UnloadLibrary

-- | Get the Vulkan instance extensions needed for vkCreateInstance.
--
--     This should be called after either calling @'vulkanLoadLibrary'@ or creating an SDL_Window with the @SDL_WINDOW_VULKAN@ flag.
--
--     On return, the variable pointed to by @count@ will be set to the number of elements returned, suitable for using with VkInstanceCreateInfo::enabledExtensionCount, and the returned array can be used with VkInstanceCreateInfo::ppEnabledExtensionNames, for calling Vulkan\'s vkCreateInstance API.
--
--     You should not free the returned array; it is owned by SDL.
--
--     [Returns]: an array of extension name strings on success, NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'vulkanCreateSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Vulkan_GetInstanceExtensions@.
--                   The safe flavor is 'vulkanGetInstanceExtensionsSafe'
--                   .
--
--     [C declaration]: @SDL_Vulkan_GetInstanceExtensions@, defined at @SDL3\/SDL_vulkan.h 200:50@
vulkanGetInstanceExtensions
  :: BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of extensions returned.
  -> IO (PtrConst.PtrConst (PtrConst.PtrConst BG.CChar))
vulkanGetInstanceExtensions =
  Unsafe.sDL_Vulkan_GetInstanceExtensions

-- | Get the Vulkan instance extensions needed for vkCreateInstance.
--
--     This should be called after either calling @'vulkanLoadLibrary'@ or creating an SDL_Window with the @SDL_WINDOW_VULKAN@ flag.
--
--     On return, the variable pointed to by @count@ will be set to the number of elements returned, suitable for using with VkInstanceCreateInfo::enabledExtensionCount, and the returned array can be used with VkInstanceCreateInfo::ppEnabledExtensionNames, for calling Vulkan\'s vkCreateInstance API.
--
--     You should not free the returned array; it is owned by SDL.
--
--     [Returns]: an array of extension name strings on success, NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'vulkanCreateSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Vulkan_GetInstanceExtensions@.
--                   The unsafe flavor is 'vulkanGetInstanceExtensions'
--                   .
--
--     [C declaration]: @SDL_Vulkan_GetInstanceExtensions@, defined at @SDL3\/SDL_vulkan.h 200:50@
vulkanGetInstanceExtensionsSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of extensions returned.
  -> IO (PtrConst.PtrConst (PtrConst.PtrConst BG.CChar))
vulkanGetInstanceExtensionsSafe =
  Safe.sDL_Vulkan_GetInstanceExtensions

-- | Create a Vulkan rendering surface for a window.
--
--     The @window@ must have been created with the @SDL_WINDOW_VULKAN@ flag and @instance@ must have been created with extensions returned by @'vulkanGetInstanceExtensions'@ enabled.
--
--     If @allocator@ is NULL, Vulkan will use the system default allocator. This argument is passed directly to Vulkan and isn\'t used by SDL itself.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'vulkanGetInstanceExtensions', 'vulkanDestroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Vulkan_CreateSurface@.
--                   The safe flavor is 'vulkanCreateSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_Vulkan_CreateSurface@, defined at @SDL3\/SDL_vulkan.h 226:34@
vulkanCreateSurface
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
  -> IO Bool
vulkanCreateSurface =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_Vulkan_CreateSurface x00 x11 x22 x33)

-- | Create a Vulkan rendering surface for a window.
--
--     The @window@ must have been created with the @SDL_WINDOW_VULKAN@ flag and @instance@ must have been created with extensions returned by @'vulkanGetInstanceExtensions'@ enabled.
--
--     If @allocator@ is NULL, Vulkan will use the system default allocator. This argument is passed directly to Vulkan and isn\'t used by SDL itself.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'vulkanGetInstanceExtensions', 'vulkanDestroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Vulkan_CreateSurface@.
--                   The unsafe flavor is 'vulkanCreateSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_Vulkan_CreateSurface@, defined at @SDL3\/SDL_vulkan.h 226:34@
vulkanCreateSurfaceSafe
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
  -> IO Bool
vulkanCreateSurfaceSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_Vulkan_CreateSurface x00 x11 x22 x33)

-- | Destroy the Vulkan rendering surface of a window.
--
--     This should be called before 'SDL3.Sys.Video.destroyWindow', if 'vulkanCreateSurface' was called after 'SDL3.Sys.Video.createWindow'.
--
--     The @instance@ must have been created with extensions returned by @'vulkanGetInstanceExtensions'@ enabled and @surface@ must have been created successfully by an @'vulkanCreateSurface'@ call.
--
--     If @allocator@ is NULL, Vulkan will use the system default allocator. This argument is passed directly to Vulkan and isn\'t used by SDL itself.
--
--     @since 3.2.0
--
--     [See also]: 'vulkanGetInstanceExtensions', 'vulkanCreateSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Vulkan_DestroySurface@.
--                   The safe flavor is 'vulkanDestroySurfaceSafe'
--                   .
--
--     [C declaration]: @SDL_Vulkan_DestroySurface@, defined at @SDL3\/SDL_vulkan.h 254:34@
vulkanDestroySurface
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
vulkanDestroySurface =
  Unsafe.sDL_Vulkan_DestroySurface

-- | Destroy the Vulkan rendering surface of a window.
--
--     This should be called before 'SDL3.Sys.Video.destroyWindow', if 'vulkanCreateSurface' was called after 'SDL3.Sys.Video.createWindow'.
--
--     The @instance@ must have been created with extensions returned by @'vulkanGetInstanceExtensions'@ enabled and @surface@ must have been created successfully by an @'vulkanCreateSurface'@ call.
--
--     If @allocator@ is NULL, Vulkan will use the system default allocator. This argument is passed directly to Vulkan and isn\'t used by SDL itself.
--
--     @since 3.2.0
--
--     [See also]: 'vulkanGetInstanceExtensions', 'vulkanCreateSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Vulkan_DestroySurface@.
--                   The unsafe flavor is 'vulkanDestroySurface'
--                   .
--
--     [C declaration]: @SDL_Vulkan_DestroySurface@, defined at @SDL3\/SDL_vulkan.h 254:34@
vulkanDestroySurfaceSafe
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
vulkanDestroySurfaceSafe =
  Safe.sDL_Vulkan_DestroySurface

-- | Query support for presentation via a given physical device and queue family.
--
--     The @instance@ must have been created with extensions returned by @'vulkanGetInstanceExtensions'@ enabled.
--
--     [Returns]: true if supported, false if unsupported or an error occurred.
--
--     @since 3.2.0
--
--     [See also]: 'vulkanGetInstanceExtensions'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Vulkan_GetPresentationSupport@.
--                   The safe flavor is 'vulkanGetPresentationSupportSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_Vulkan_GetPresentationSupport@, defined at @SDL3\/SDL_vulkan.h 275:34@
vulkanGetPresentationSupport
  :: VkInstance
  -- ^
  --
  --           [@instance@]: the Vulkan instance handle.
  -> VkPhysicalDevice
  -- ^
  --
  --           [@physicalDevice@]: a valid Vulkan physical device handle.
  -> BG.Word32
  -- ^
  --
  --           [@queueFamilyIndex@]: a valid queue family index for the given physical device.
  -> IO Bool
vulkanGetPresentationSupport =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_Vulkan_GetPresentationSupport x00 x11 (Coerce.coerce x22))

-- | Query support for presentation via a given physical device and queue family.
--
--     The @instance@ must have been created with extensions returned by @'vulkanGetInstanceExtensions'@ enabled.
--
--     [Returns]: true if supported, false if unsupported or an error occurred.
--
--     @since 3.2.0
--
--     [See also]: 'vulkanGetInstanceExtensions'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Vulkan_GetPresentationSupport@.
--                   The unsafe flavor is 'vulkanGetPresentationSupport'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_Vulkan_GetPresentationSupport@, defined at @SDL3\/SDL_vulkan.h 275:34@
vulkanGetPresentationSupportSafe
  :: VkInstance
  -- ^
  --
  --           [@instance@]: the Vulkan instance handle.
  -> VkPhysicalDevice
  -- ^
  --
  --           [@physicalDevice@]: a valid Vulkan physical device handle.
  -> BG.Word32
  -- ^
  --
  --           [@queueFamilyIndex@]: a valid queue family index for the given physical device.
  -> IO Bool
vulkanGetPresentationSupportSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_Vulkan_GetPresentationSupport x00 x11 (Coerce.coerce x22))

-- | Functions to creating Metal layers and views on SDL windows.
--
--     This provides some platform-specific glue for Apple platforms. Most macOS and iOS apps can use SDL without these functions, but this API they can be useful for specific OS-level integration tasks. A handle to a CAMetalLayer-backed NSView (macOS) or UIView (iOS\/tvOS).
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Metal.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Metal (
  module SDL3.Sys.Bindgen.Metal,

  -- * Function aliases
  SDL3.Sys.Metal.metalCreateView,
  SDL3.Sys.Metal.metalCreateViewSafe,
  SDL3.Sys.Metal.metalDestroyView,
  SDL3.Sys.Metal.metalDestroyViewSafe,
  SDL3.Sys.Metal.metalGetLayer,
  SDL3.Sys.Metal.metalGetLayerSafe,
)
where

import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Metal
import SDL3.Sys.Bindgen.Metal.Safe qualified as Safe
import SDL3.Sys.Bindgen.Metal.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Video qualified

-- | Create a CAMetalLayer-backed NSView\/UIView and attach it to the specified window.
--
--     On macOS, this does /not/ associate a MTLDevice with the CAMetalLayer on its own. It is up to user code to do that.
--
--     The returned handle can be casted directly to a NSView or UIView. To access the backing CAMetalLayer, call @'metalGetLayer'@.
--
--     [Returns]: handle NSView or UIView.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'metalDestroyView', 'metalGetLayer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Metal_CreateView@.
--                   The safe flavor is 'metalCreateViewSafe'
--                   .
--
--     [C declaration]: @SDL_Metal_CreateView@, defined at @SDL3\/SDL_metal.h 75:43@
metalCreateView
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window.
  -> IO SDL_MetalView
metalCreateView = Unsafe.sDL_Metal_CreateView

-- | Create a CAMetalLayer-backed NSView\/UIView and attach it to the specified window.
--
--     On macOS, this does /not/ associate a MTLDevice with the CAMetalLayer on its own. It is up to user code to do that.
--
--     The returned handle can be casted directly to a NSView or UIView. To access the backing CAMetalLayer, call @'metalGetLayer'@.
--
--     [Returns]: handle NSView or UIView.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'metalDestroyView', 'metalGetLayer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Metal_CreateView@.
--                   The unsafe flavor is 'metalCreateView'
--                   .
--
--     [C declaration]: @SDL_Metal_CreateView@, defined at @SDL3\/SDL_metal.h 75:43@
metalCreateViewSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window.
  -> IO SDL_MetalView
metalCreateViewSafe = Safe.sDL_Metal_CreateView

-- | Destroy an existing 'SDL_MetalView' object.
--
--     This should be called before 'SDL3.Sys.Video.destroyWindow', if 'metalCreateView' was called after 'SDL3.Sys.Video.createWindow'.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'metalCreateView'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Metal_DestroyView@.
--                   The safe flavor is 'metalDestroyViewSafe'
--                   .
--
--     [C declaration]: @SDL_Metal_DestroyView@, defined at @SDL3\/SDL_metal.h 91:34@
metalDestroyView
  :: SDL_MetalView
  -- ^
  --
  --           [@view@]: the 'SDL_MetalView' object.
  -> IO ()
metalDestroyView = Unsafe.sDL_Metal_DestroyView

-- | Destroy an existing 'SDL_MetalView' object.
--
--     This should be called before 'SDL3.Sys.Video.destroyWindow', if 'metalCreateView' was called after 'SDL3.Sys.Video.createWindow'.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'metalCreateView'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Metal_DestroyView@.
--                   The unsafe flavor is 'metalDestroyView'
--                   .
--
--     [C declaration]: @SDL_Metal_DestroyView@, defined at @SDL3\/SDL_metal.h 91:34@
metalDestroyViewSafe
  :: SDL_MetalView
  -- ^
  --
  --           [@view@]: the 'SDL_MetalView' object.
  -> IO ()
metalDestroyViewSafe = Safe.sDL_Metal_DestroyView

-- | Get a pointer to the backing CAMetalLayer for the given view.
--
--     [Returns]: a pointer.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_Metal_GetLayer@.
--                   The safe flavor is 'metalGetLayerSafe'
--                   .
--
--     [C declaration]: @SDL_Metal_GetLayer@, defined at @SDL3\/SDL_metal.h 103:36@
metalGetLayer
  :: SDL_MetalView
  -- ^
  --
  --           [@view@]: the 'SDL_MetalView' object.
  -> IO (BG.Ptr BG.Void)
metalGetLayer = Unsafe.sDL_Metal_GetLayer

-- | Get a pointer to the backing CAMetalLayer for the given view.
--
--     [Returns]: a pointer.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_Metal_GetLayer@.
--                   The unsafe flavor is 'metalGetLayer'
--                   .
--
--     [C declaration]: @SDL_Metal_GetLayer@, defined at @SDL3\/SDL_metal.h 103:36@
metalGetLayerSafe
  :: SDL_MetalView
  -- ^
  --
  --           [@view@]: the 'SDL_MetalView' object.
  -> IO (BG.Ptr BG.Void)
metalGetLayerSafe = Safe.sDL_Metal_GetLayer

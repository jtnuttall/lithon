{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Metal.Safe (
  SDL3.Sys.Bindgen.Metal.Safe.sDL_Metal_CreateView,
  SDL3.Sys.Bindgen.Metal.Safe.sDL_Metal_DestroyView,
  SDL3.Sys.Bindgen.Metal.Safe.sDL_Metal_GetLayer,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Metal
import SDL3.Sys.Bindgen.Video qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_metal.h>"
         , "SDL_MetalView hs_bindgen_04ce5ab1408c911d ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_Metal_CreateView)(arg1);"
         , "}"
         , "void hs_bindgen_b00215ead799e6c0 ("
         , "  SDL_MetalView arg1"
         , ")"
         , "{"
         , "  (SDL_Metal_DestroyView)(arg1);"
         , "}"
         , "void *hs_bindgen_4ce54bd94800c4e9 ("
         , "  SDL_MetalView arg1"
         , ")"
         , "{"
         , "  return (SDL_Metal_GetLayer)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Metal_Safe_SDL_Metal_CreateView@
foreign import ccall safe "hs_bindgen_04ce5ab1408c911d"
  hs_bindgen_04ce5ab1408c911d_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Metal_Safe_SDL_Metal_CreateView@
hs_bindgen_04ce5ab1408c911d
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO SDL_MetalView
hs_bindgen_04ce5ab1408c911d =
  BG.fromFFIType hs_bindgen_04ce5ab1408c911d_base

-- | Create a CAMetalLayer-backed NSView\/UIView and attach it to the specified window.
--
--     On macOS, this does /not/ associate a MTLDevice with the CAMetalLayer on its own. It is up to user code to do that.
--
--     The returned handle can be casted directly to a NSView or UIView. To access the backing CAMetalLayer, call @SDL_Metal_GetLayer()@.
--
--     [Returns]: handle NSView or UIView.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Metal_DestroyView', 'sDL_Metal_GetLayer'
--
--     [C declaration]: @SDL_Metal_CreateView@, defined at @SDL3\/SDL_metal.h 75:43@
sDL_Metal_CreateView
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window.
  -> IO SDL_MetalView
sDL_Metal_CreateView = hs_bindgen_04ce5ab1408c911d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Metal_Safe_SDL_Metal_DestroyView@
foreign import ccall safe "hs_bindgen_b00215ead799e6c0"
  hs_bindgen_b00215ead799e6c0_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Metal_Safe_SDL_Metal_DestroyView@
hs_bindgen_b00215ead799e6c0
  :: SDL_MetalView
  -> IO ()
hs_bindgen_b00215ead799e6c0 =
  BG.fromFFIType hs_bindgen_b00215ead799e6c0_base

-- | Destroy an existing 'SDL_MetalView' object.
--
--     This should be called before SDL_DestroyWindow, if SDL_Metal_CreateView was called after SDL_CreateWindow.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Metal_CreateView'
--
--     [C declaration]: @SDL_Metal_DestroyView@, defined at @SDL3\/SDL_metal.h 91:34@
sDL_Metal_DestroyView
  :: SDL_MetalView
  -- ^
  --
  --           [@view@]: the 'SDL_MetalView' object.
  -> IO ()
sDL_Metal_DestroyView = hs_bindgen_b00215ead799e6c0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Metal_Safe_SDL_Metal_GetLayer@
foreign import ccall safe "hs_bindgen_4ce54bd94800c4e9"
  hs_bindgen_4ce54bd94800c4e9_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Metal_Safe_SDL_Metal_GetLayer@
hs_bindgen_4ce54bd94800c4e9
  :: SDL_MetalView
  -> IO (BG.Ptr BG.Void)
hs_bindgen_4ce54bd94800c4e9 =
  BG.fromFFIType hs_bindgen_4ce54bd94800c4e9_base

-- | Get a pointer to the backing CAMetalLayer for the given view.
--
--     [Returns]: a pointer.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_Metal_GetLayer@, defined at @SDL3\/SDL_metal.h 103:36@
sDL_Metal_GetLayer
  :: SDL_MetalView
  -- ^
  --
  --           [@view@]: the 'SDL_MetalView' object.
  -> IO (BG.Ptr BG.Void)
sDL_Metal_GetLayer = hs_bindgen_4ce54bd94800c4e9

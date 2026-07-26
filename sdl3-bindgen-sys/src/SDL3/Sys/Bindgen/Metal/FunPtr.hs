{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Metal.FunPtr (
  SDL3.Sys.Bindgen.Metal.FunPtr.sDL_Metal_CreateView,
  SDL3.Sys.Bindgen.Metal.FunPtr.sDL_Metal_DestroyView,
  SDL3.Sys.Bindgen.Metal.FunPtr.sDL_Metal_GetLayer,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Metal
import SDL3.Sys.Bindgen.Video qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_metal.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Metal_get_SDL_Metal_CreateView */"
         , "__attribute__ ((const))"
         , "SDL_MetalView (*hs_bindgen_05e876f492f6e504 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_Metal_CreateView;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Metal_get_SDL_Metal_DestroyView */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_459e45a952bb1737 (void)) ("
         , "  SDL_MetalView arg1"
         , ")"
         , "{"
         , "  return &SDL_Metal_DestroyView;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Metal_get_SDL_Metal_GetLayer */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_7141fdaf243ea8b9 (void)) ("
         , "  SDL_MetalView arg1"
         , ")"
         , "{"
         , "  return &SDL_Metal_GetLayer;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Metal_get_SDL_Metal_CreateView@
foreign import ccall unsafe "hs_bindgen_05e876f492f6e504"
  hs_bindgen_05e876f492f6e504_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Metal_get_SDL_Metal_CreateView@
hs_bindgen_05e876f492f6e504
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO SDL_MetalView))
hs_bindgen_05e876f492f6e504 =
  BG.fromFFIType hs_bindgen_05e876f492f6e504_base

{-# NOINLINE sDL_Metal_CreateView #-}

-- | Create a CAMetalLayer-backed NSView\/UIView and attach it to the specified window.
--
--     On macOS, this does /not/ associate a MTLDevice with the CAMetalLayer on its own. It is up to user code to do that.
--
--     The returned handle can be casted directly to a NSView or UIView. To access the backing CAMetalLayer, call @SDL_Metal_GetLayer()@.
--
--     [@window@]: the window.
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
sDL_Metal_CreateView :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO SDL_MetalView)
sDL_Metal_CreateView =
  BG.unsafePerformIO hs_bindgen_05e876f492f6e504

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Metal_get_SDL_Metal_DestroyView@
foreign import ccall unsafe "hs_bindgen_459e45a952bb1737"
  hs_bindgen_459e45a952bb1737_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Metal_get_SDL_Metal_DestroyView@
hs_bindgen_459e45a952bb1737 :: IO (BG.FunPtr (SDL_MetalView -> IO ()))
hs_bindgen_459e45a952bb1737 =
  BG.fromFFIType hs_bindgen_459e45a952bb1737_base

{-# NOINLINE sDL_Metal_DestroyView #-}

-- | Destroy an existing 'SDL_MetalView' object.
--
--     This should be called before SDL_DestroyWindow, if SDL_Metal_CreateView was called after SDL_CreateWindow.
--
--     [@view@]: the 'SDL_MetalView' object.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Metal_CreateView'
--
--     [C declaration]: @SDL_Metal_DestroyView@, defined at @SDL3\/SDL_metal.h 91:34@
sDL_Metal_DestroyView :: BG.FunPtr (SDL_MetalView -> IO ())
sDL_Metal_DestroyView =
  BG.unsafePerformIO hs_bindgen_459e45a952bb1737

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Metal_get_SDL_Metal_GetLayer@
foreign import ccall unsafe "hs_bindgen_7141fdaf243ea8b9"
  hs_bindgen_7141fdaf243ea8b9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Metal_get_SDL_Metal_GetLayer@
hs_bindgen_7141fdaf243ea8b9 :: IO (BG.FunPtr (SDL_MetalView -> IO (BG.Ptr BG.Void)))
hs_bindgen_7141fdaf243ea8b9 =
  BG.fromFFIType hs_bindgen_7141fdaf243ea8b9_base

{-# NOINLINE sDL_Metal_GetLayer #-}

-- | Get a pointer to the backing CAMetalLayer for the given view.
--
--     [@view@]: the 'SDL_MetalView' object.
--
--     [Returns]: a pointer.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_Metal_GetLayer@, defined at @SDL3\/SDL_metal.h 103:36@
sDL_Metal_GetLayer :: BG.FunPtr (SDL_MetalView -> IO (BG.Ptr BG.Void))
sDL_Metal_GetLayer =
  BG.unsafePerformIO hs_bindgen_7141fdaf243ea8b9

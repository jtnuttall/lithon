{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Messagebox.FunPtr (
  SDL3.Sys.Bindgen.Messagebox.FunPtr.sDL_ShowMessageBox,
  SDL3.Sys.Bindgen.Messagebox.FunPtr.sDL_ShowSimpleMessageBox,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Messagebox
import SDL3.Sys.Bindgen.Video qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_messagebox.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Messagebox_get_SDL_ShowMessageBox */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fdad2a984a763ae0 (void)) ("
         , "  SDL_MessageBoxData const *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_ShowMessageBox;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Messagebox_get_SDL_ShowSimpleMessageBox */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_059be268606e6ea4 (void)) ("
         , "  SDL_MessageBoxFlags arg1,"
         , "  char const *arg2,"
         , "  char const *arg3,"
         , "  SDL_Window *arg4"
         , ")"
         , "{"
         , "  return &SDL_ShowSimpleMessageBox;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Messagebox_get_SDL_ShowMessageBox@
foreign import ccall unsafe "hs_bindgen_fdad2a984a763ae0"
  hs_bindgen_fdad2a984a763ae0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Messagebox_get_SDL_ShowMessageBox@
hs_bindgen_fdad2a984a763ae0
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL_MessageBoxData -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_fdad2a984a763ae0 =
  BG.fromFFIType hs_bindgen_fdad2a984a763ae0_base

{-# NOINLINE sDL_ShowMessageBox #-}

-- | Create a modal message box.
--
--     If your needs aren\'t complex, it might be easier to use SDL_ShowSimpleMessageBox.
--
--     This function should be called on the thread that created the parent window, or on the main thread if the messagebox has no parent. It will block execution of that thread until the user clicks a button or closes the messagebox.
--
--     This function may be called at any time, even before SDL_Init(). This makes it useful for reporting errors like a failure to create a renderer or OpenGL context.
--
--     On X11, SDL rolls its own dialog box with X11 primitives instead of a formal toolkit like GTK+ or Qt.
--
--     Note that if SDL_Init() would fail because there isn\'t any available video target, this function is likely to fail for the same reasons. If this is a concern, check the return value from this function and fall back to writing to stderr if you can.
--
--     [@messageboxdata@]: the 'SDL_MessageBoxData' structure with title, text and other options.
--
--     [@buttonid@]: the pointer to which user id of hit button should be copied.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ShowSimpleMessageBox'
--
--     [C declaration]: @SDL_ShowMessageBox@, defined at @SDL3\/SDL_messagebox.h 177:34@
sDL_ShowMessageBox
  :: BG.FunPtr (PtrConst.PtrConst SDL_MessageBoxData -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_ShowMessageBox =
  BG.unsafePerformIO hs_bindgen_fdad2a984a763ae0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Messagebox_get_SDL_ShowSimpleMessageBox@
foreign import ccall unsafe "hs_bindgen_059be268606e6ea4"
  hs_bindgen_059be268606e6ea4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Messagebox_get_SDL_ShowSimpleMessageBox@
hs_bindgen_059be268606e6ea4
  :: IO
       ( BG.FunPtr
           ( SDL_MessageBoxFlags
             -> PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
             -> IO BG.CBool
           )
       )
hs_bindgen_059be268606e6ea4 =
  BG.fromFFIType hs_bindgen_059be268606e6ea4_base

{-# NOINLINE sDL_ShowSimpleMessageBox #-}

-- | Display a simple modal message box.
--
--     If your needs aren\'t complex, this function is preferred over SDL_ShowMessageBox.
--
--     @flags@ may be any of the following:
--
--     * @'sDL_MESSAGEBOX_ERROR'@: error dialog
--
--     * @'sDL_MESSAGEBOX_WARNING'@: warning dialog
--
--     * @'sDL_MESSAGEBOX_INFORMATION'@: informational dialog
--
--     This function should be called on the thread that created the parent window, or on the main thread if the messagebox has no parent. It will block execution of that thread until the user clicks a button or closes the messagebox.
--
--     This function may be called at any time, even before SDL_Init(). This makes it useful for reporting errors like a failure to create a renderer or OpenGL context.
--
--     On X11, SDL rolls its own dialog box with X11 primitives instead of a formal toolkit like GTK+ or Qt.
--
--     Note that if SDL_Init() would fail because there isn\'t any available video target, this function is likely to fail for the same reasons. If this is a concern, check the return value from this function and fall back to writing to stderr if you can.
--
--     [@flags@]: an 'SDL_MessageBoxFlags' value.
--
--     [@title@]: UTF-8 title text.
--
--     [@message@]: UTF-8 message text.
--
--     [@window@]: the parent window, or NULL for no parent.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ShowMessageBox'
--
--     [C declaration]: @SDL_ShowSimpleMessageBox@, defined at @SDL3\/SDL_messagebox.h 221:34@
sDL_ShowSimpleMessageBox
  :: BG.FunPtr
       ( SDL_MessageBoxFlags
         -> PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
         -> IO BG.CBool
       )
sDL_ShowSimpleMessageBox =
  BG.unsafePerformIO hs_bindgen_059be268606e6ea4

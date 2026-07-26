{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Messagebox.Unsafe (
  SDL3.Sys.Bindgen.Messagebox.Unsafe.sDL_ShowMessageBox,
  SDL3.Sys.Bindgen.Messagebox.Unsafe.sDL_ShowSimpleMessageBox,
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
         , "_Bool hs_bindgen_6ca41526aad99745 ("
         , "  SDL_MessageBoxData const *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_ShowMessageBox)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_e2947f00c756e1c7 ("
         , "  SDL_MessageBoxFlags arg1,"
         , "  char const *arg2,"
         , "  char const *arg3,"
         , "  SDL_Window *arg4"
         , ")"
         , "{"
         , "  return (SDL_ShowSimpleMessageBox)(arg1, arg2, arg3, arg4);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Messagebox_Unsafe_SDL_ShowMessageBox@
foreign import ccall unsafe "hs_bindgen_6ca41526aad99745"
  hs_bindgen_6ca41526aad99745_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Messagebox_Unsafe_SDL_ShowMessageBox@
hs_bindgen_6ca41526aad99745
  :: PtrConst.PtrConst SDL_MessageBoxData
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_6ca41526aad99745 =
  BG.fromFFIType hs_bindgen_6ca41526aad99745_base

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
  :: PtrConst.PtrConst SDL_MessageBoxData
  -- ^
  --
  --           [@messageboxdata@]: the 'SDL_MessageBoxData' structure with title, text and other options.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@buttonid@]: the pointer to which user id of hit button should be copied.
  -> IO BG.CBool
sDL_ShowMessageBox = hs_bindgen_6ca41526aad99745

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Messagebox_Unsafe_SDL_ShowSimpleMessageBox@
foreign import ccall unsafe "hs_bindgen_e2947f00c756e1c7"
  hs_bindgen_e2947f00c756e1c7_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Messagebox_Unsafe_SDL_ShowSimpleMessageBox@
hs_bindgen_e2947f00c756e1c7
  :: SDL_MessageBoxFlags
  -> PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_e2947f00c756e1c7 =
  BG.fromFFIType hs_bindgen_e2947f00c756e1c7_base

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
  :: SDL_MessageBoxFlags
  -- ^
  --
  --           [@flags@]: an 'SDL_MessageBoxFlags' value.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@title@]: UTF-8 title text.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: UTF-8 message text.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the parent window, or NULL for no parent.
  -> IO BG.CBool
sDL_ShowSimpleMessageBox =
  hs_bindgen_e2947f00c756e1c7

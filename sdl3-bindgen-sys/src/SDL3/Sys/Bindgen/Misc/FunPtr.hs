{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Misc.FunPtr (
  SDL3.Sys.Bindgen.Misc.FunPtr.sDL_OpenURL,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_misc.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Misc_get_SDL_OpenURL */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4c967d8f61448acb (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_OpenURL;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Misc_get_SDL_OpenURL@
foreign import ccall unsafe "hs_bindgen_4c967d8f61448acb"
  hs_bindgen_4c967d8f61448acb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Misc_get_SDL_OpenURL@
hs_bindgen_4c967d8f61448acb :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_4c967d8f61448acb =
  BG.fromFFIType hs_bindgen_4c967d8f61448acb_base

{-# NOINLINE sDL_OpenURL #-}

-- | [C declaration]: @SDL_OpenURL@, defined at @SDL3\/SDL_misc.h 72:34@
sDL_OpenURL :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_OpenURL =
  BG.unsafePerformIO hs_bindgen_4c967d8f61448acb

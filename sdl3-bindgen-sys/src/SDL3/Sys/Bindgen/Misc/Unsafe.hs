{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Misc.Unsafe (
  SDL3.Sys.Bindgen.Misc.Unsafe.sDL_OpenURL,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_misc.h>"
         , "_Bool hs_bindgen_25f6c968529203db ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_OpenURL)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Misc_Unsafe_SDL_OpenURL@
foreign import ccall unsafe "hs_bindgen_25f6c968529203db"
  hs_bindgen_25f6c968529203db_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Misc_Unsafe_SDL_OpenURL@
hs_bindgen_25f6c968529203db
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_25f6c968529203db =
  BG.fromFFIType hs_bindgen_25f6c968529203db_base

-- | [C declaration]: @SDL_OpenURL@, defined at @SDL3\/SDL_misc.h 72:34@
sDL_OpenURL
  :: PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @url@
  -> IO BG.CBool
sDL_OpenURL = hs_bindgen_25f6c968529203db

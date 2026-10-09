{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Misc.Safe (
  SDL3.Sys.Bindgen.Misc.Safe.sDL_OpenURL,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#include <SDL3/SDL_misc.h>"
         , "_Bool hs_bindgen_b3f3010b7eba15e0 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_OpenURL)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Misc_Safe_SDL_OpenURL@
foreign import ccall safe "hs_bindgen_b3f3010b7eba15e0"
  hs_bindgen_b3f3010b7eba15e0_base
    :: BG.Ptr BG.Void
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Misc_Safe_SDL_OpenURL@
hs_bindgen_b3f3010b7eba15e0
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_b3f3010b7eba15e0 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_b3f3010b7eba15e0_base (BG.toFFIType x0))

-- | [C declaration]: @SDL_OpenURL@, defined at @SDL3\/SDL_misc.h 72:34@
sDL_OpenURL
  :: PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @url@
  -> IO BG.CBool
sDL_OpenURL = hs_bindgen_b3f3010b7eba15e0

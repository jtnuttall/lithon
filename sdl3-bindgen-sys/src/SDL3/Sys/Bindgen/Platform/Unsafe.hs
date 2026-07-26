{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Platform.Unsafe (
  SDL3.Sys.Bindgen.Platform.Unsafe.sDL_GetPlatform,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_platform.h>"
         , "char const *hs_bindgen_6a11aa5547a2bc81 (void)"
         , "{"
         , "  return (SDL_GetPlatform)();"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Platform_Unsafe_SDL_GetPlatform@
foreign import ccall unsafe "hs_bindgen_6a11aa5547a2bc81"
  hs_bindgen_6a11aa5547a2bc81_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Platform_Unsafe_SDL_GetPlatform@
hs_bindgen_6a11aa5547a2bc81 :: IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_6a11aa5547a2bc81 =
  BG.fromFFIType hs_bindgen_6a11aa5547a2bc81_base

-- | [C declaration]: @SDL_GetPlatform@, defined at @SDL3\/SDL_platform.h 58:42@
sDL_GetPlatform :: IO (PtrConst.PtrConst BG.CChar)
sDL_GetPlatform = hs_bindgen_6a11aa5547a2bc81

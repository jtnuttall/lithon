{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Platform.Safe (
  SDL3.Sys.Bindgen.Platform.Safe.sDL_GetPlatform,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#define SDL_SLOW_MEMCPY"
         , "#define SDL_SLOW_MEMMOVE"
         , "#define SDL_SLOW_MEMSET"
         , "#include <SDL3/SDL_platform.h>"
         , "char const *hs_bindgen_837ad9031649e009 (void)"
         , "{"
         , "  return (SDL_GetPlatform)();"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Platform_Safe_SDL_GetPlatform@
foreign import ccall safe "hs_bindgen_837ad9031649e009"
  hs_bindgen_837ad9031649e009_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Platform_Safe_SDL_GetPlatform@
hs_bindgen_837ad9031649e009 :: IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_837ad9031649e009 =
  fmap BG.fromFFIType hs_bindgen_837ad9031649e009_base

-- | [C declaration]: @SDL_GetPlatform@, defined at @SDL3\/SDL_platform.h 58:42@
sDL_GetPlatform :: IO (PtrConst.PtrConst BG.CChar)
sDL_GetPlatform = hs_bindgen_837ad9031649e009

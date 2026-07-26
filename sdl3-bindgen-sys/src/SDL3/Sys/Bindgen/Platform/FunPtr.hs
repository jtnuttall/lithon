{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Platform.FunPtr (
  SDL3.Sys.Bindgen.Platform.FunPtr.sDL_GetPlatform,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_platform.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Platform_get_SDL_GetPlatform */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_77c6464e30daf2fd (void)) (void)"
         , "{"
         , "  return &SDL_GetPlatform;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Platform_get_SDL_GetPlatform@
foreign import ccall unsafe "hs_bindgen_77c6464e30daf2fd"
  hs_bindgen_77c6464e30daf2fd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Platform_get_SDL_GetPlatform@
hs_bindgen_77c6464e30daf2fd :: IO (BG.FunPtr (IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_77c6464e30daf2fd =
  BG.fromFFIType hs_bindgen_77c6464e30daf2fd_base

{-# NOINLINE sDL_GetPlatform #-}

-- | [C declaration]: @SDL_GetPlatform@, defined at @SDL3\/SDL_platform.h 58:42@
sDL_GetPlatform :: BG.FunPtr (IO (PtrConst.PtrConst BG.CChar))
sDL_GetPlatform =
  BG.unsafePerformIO hs_bindgen_77c6464e30daf2fd

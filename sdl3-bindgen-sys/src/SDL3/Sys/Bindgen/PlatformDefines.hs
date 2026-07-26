{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE NoFieldSelectors #-}

module SDL3.Sys.Bindgen.PlatformDefines (
  SDL3.Sys.Bindgen.PlatformDefines.sDL_PLATFORM_LINUX,
  SDL3.Sys.Bindgen.PlatformDefines.sDL_PLATFORM_UNIX,
)
where

import HsBindgen.Runtime.Support qualified as BG

-- | [C declaration]: @macro SDL_PLATFORM_LINUX@, defined at @SDL3\/SDL_platform_defines.h 101:9@
sDL_PLATFORM_LINUX :: BG.CInt
sDL_PLATFORM_LINUX = (1 :: BG.CInt)

-- | [C declaration]: @macro SDL_PLATFORM_UNIX@, defined at @SDL3\/SDL_platform_defines.h 126:9@
sDL_PLATFORM_UNIX :: BG.CInt
sDL_PLATFORM_UNIX = (1 :: BG.CInt)

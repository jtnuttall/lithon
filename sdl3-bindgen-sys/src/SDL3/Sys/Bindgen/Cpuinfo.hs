{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | CPU feature detection for SDL.
--
--     These functions are largely concerned with reporting if the system has access to various SIMD instruction sets, but also has other important info to share, such as system RAM size and number of logical CPU cores.
--
--     CPU instruction set checks, like @SDL_HasSSE()@ and @SDL_HasNEON()@, are available on all platforms, even if they don\'t make sense (an ARM processor will never have SSE and an x86 processor will never have NEON, for example, but these functions still exist and will simply return false in these cases). A guess for the cacheline size used for padding.
--
--     Most x86 processors have a 64 byte cache line. The 64-bit PowerPC processors have a 128 byte cache line. We use the larger value to be generally safe.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Cpuinfo (
  SDL3.Sys.Bindgen.Cpuinfo.sDL_CACHELINE_SIZE,
)
where

import HsBindgen.Runtime.Support qualified as BG

-- | [C declaration]: @macro SDL_CACHELINE_SIZE@, defined at @SDL3\/SDL_cpuinfo.h 60:9@
sDL_CACHELINE_SIZE :: BG.CInt
sDL_CACHELINE_SIZE = (128 :: BG.CInt)

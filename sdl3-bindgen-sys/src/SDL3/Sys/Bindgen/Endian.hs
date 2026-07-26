{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE NoFieldSelectors #-}

module SDL3.Sys.Bindgen.Endian (
  SDL3.Sys.Bindgen.Endian.sDL_LIL_ENDIAN,
  SDL3.Sys.Bindgen.Endian.sDL_BIG_ENDIAN,
  SDL3.Sys.Bindgen.Endian.sDL_Swap16LE,
  SDL3.Sys.Bindgen.Endian.sDL_Swap32LE,
  SDL3.Sys.Bindgen.Endian.sDL_Swap64LE,
  SDL3.Sys.Bindgen.Endian.sDL_SwapFloatLE,
)
where

import HsBindgen.Runtime.Support qualified as BG

-- | A value to represent littleendian byteorder.
--
--     This is used with the preprocessor macro SDL_BYTEORDER, to determine a platform\'s byte ordering:
--
--     @
--     \#if SDL_BYTEORDER == SDL_LIL_ENDIAN
--     SDL_Log(\"This system is littleendian.\");
--     \#endif
--     @
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BYTEORDER', 'sDL_BIG_ENDIAN'
--
--     [C declaration]: @macro SDL_LIL_ENDIAN@, defined at @SDL3\/SDL_endian.h 86:9@
sDL_LIL_ENDIAN :: BG.CInt
sDL_LIL_ENDIAN = (1234 :: BG.CInt)

-- | A value to represent bigendian byteorder.
--
--     This is used with the preprocessor macro SDL_BYTEORDER, to determine a platform\'s byte ordering:
--
--     @
--     \#if SDL_BYTEORDER == SDL_BIG_ENDIAN
--     SDL_Log(\"This system is bigendian.\");
--     \#endif
--     @
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BYTEORDER', 'sDL_LIL_ENDIAN'
--
--     [C declaration]: @macro SDL_BIG_ENDIAN@, defined at @SDL3\/SDL_endian.h 105:9@
sDL_BIG_ENDIAN :: BG.CInt
sDL_BIG_ENDIAN = (4321 :: BG.CInt)

-- | [C declaration]: @macro SDL_Swap16LE@, defined at @SDL3\/SDL_endian.h 620:9@
sDL_Swap16LE :: forall a0. a0 -> a0
sDL_Swap16LE = \x0 -> x0

-- | [C declaration]: @macro SDL_Swap32LE@, defined at @SDL3\/SDL_endian.h 621:9@
sDL_Swap32LE :: forall a0. a0 -> a0
sDL_Swap32LE = \x0 -> x0

-- | [C declaration]: @macro SDL_Swap64LE@, defined at @SDL3\/SDL_endian.h 622:9@
sDL_Swap64LE :: forall a0. a0 -> a0
sDL_Swap64LE = \x0 -> x0

-- | [C declaration]: @macro SDL_SwapFloatLE@, defined at @SDL3\/SDL_endian.h 623:9@
sDL_SwapFloatLE :: forall a0. a0 -> a0
sDL_SwapFloatLE = \x0 -> x0

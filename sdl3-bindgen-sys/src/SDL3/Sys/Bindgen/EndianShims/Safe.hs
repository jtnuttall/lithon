{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.EndianShims.Safe (
  SDL3.Sys.Bindgen.EndianShims.Safe.lithon_SDL_Swap16,
  SDL3.Sys.Bindgen.EndianShims.Safe.lithon_SDL_Swap32,
  SDL3.Sys.Bindgen.EndianShims.Safe.lithon_SDL_Swap64,
  SDL3.Sys.Bindgen.EndianShims.Safe.lithon_SDL_Swap16LE,
  SDL3.Sys.Bindgen.EndianShims.Safe.lithon_SDL_Swap32LE,
  SDL3.Sys.Bindgen.EndianShims.Safe.lithon_SDL_Swap64LE,
  SDL3.Sys.Bindgen.EndianShims.Safe.lithon_SDL_SwapFloatLE,
  SDL3.Sys.Bindgen.EndianShims.Safe.lithon_SDL_Swap16BE,
  SDL3.Sys.Bindgen.EndianShims.Safe.lithon_SDL_Swap32BE,
  SDL3.Sys.Bindgen.EndianShims.Safe.lithon_SDL_Swap64BE,
  SDL3.Sys.Bindgen.EndianShims.Safe.lithon_SDL_SwapFloatBE,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#define SDL_SLOW_MEMCPY"
         , "#define SDL_SLOW_MEMMOVE"
         , "#define SDL_SLOW_MEMSET"
         , "#include <sdl3-bindgen-sys/SDL_endian_shims.h>"
         , "Uint16 hs_bindgen_2ea637caeefe4aa3 ("
         , "  Uint16 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap16)(arg1);"
         , "}"
         , "Uint32 hs_bindgen_d8dafdb03a84dea6 ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap32)(arg1);"
         , "}"
         , "Uint64 hs_bindgen_2a59fd2cead65c85 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap64)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_1f4c504e2d406d5d ("
         , "  Uint16 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap16LE)(arg1);"
         , "}"
         , "Uint32 hs_bindgen_83c800b17676e351 ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap32LE)(arg1);"
         , "}"
         , "Uint64 hs_bindgen_a8299e2a08d3f0eb ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap64LE)(arg1);"
         , "}"
         , "float hs_bindgen_3cbb3bb4c5039011 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_SwapFloatLE)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_3821b24e3d8e81ce ("
         , "  Uint16 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap16BE)(arg1);"
         , "}"
         , "Uint32 hs_bindgen_e3aaa35768c646a0 ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap32BE)(arg1);"
         , "}"
         , "Uint64 hs_bindgen_6201a0f0896f9116 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap64BE)(arg1);"
         , "}"
         , "float hs_bindgen_770a79534d696eb6 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_SwapFloatBE)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap16@
foreign import ccall safe "hs_bindgen_2ea637caeefe4aa3"
  hs_bindgen_2ea637caeefe4aa3_base
    :: HsBindgen.Runtime.LibC.Word16
    -> IO HsBindgen.Runtime.LibC.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap16@
hs_bindgen_2ea637caeefe4aa3
  :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_2ea637caeefe4aa3 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_2ea637caeefe4aa3_base (BG.toFFIType x0))

-- | Byte-swap an unsigned 16-bit number.
--
--     The SDL_Swap16 macro as a function. It always byte-swaps the value, whatever the system\'s byte order; SDL_Swap16LE or SDL_Swap16BE are what you want in most cases.
--
--     [Returns]: @x@, with its bytes in the opposite endian order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap16@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 38:26@
lithon_SDL_Swap16
  :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@x@]: the value to byte-swap.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
lithon_SDL_Swap16 = hs_bindgen_2ea637caeefe4aa3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap32@
foreign import ccall safe "hs_bindgen_d8dafdb03a84dea6"
  hs_bindgen_d8dafdb03a84dea6_base
    :: HsBindgen.Runtime.LibC.Word32
    -> IO HsBindgen.Runtime.LibC.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap32@
hs_bindgen_d8dafdb03a84dea6
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_d8dafdb03a84dea6 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_d8dafdb03a84dea6_base (BG.toFFIType x0))

-- | Byte-swap an unsigned 32-bit number.
--
--     The SDL_Swap32 macro as a function. It always byte-swaps the value, whatever the system\'s byte order; SDL_Swap32LE or SDL_Swap32BE are what you want in most cases.
--
--     [Returns]: @x@, with its bytes in the opposite endian order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap32@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 57:26@
lithon_SDL_Swap32
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@x@]: the value to byte-swap.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
lithon_SDL_Swap32 = hs_bindgen_d8dafdb03a84dea6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap64@
foreign import ccall safe "hs_bindgen_2a59fd2cead65c85"
  hs_bindgen_2a59fd2cead65c85_base
    :: HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap64@
hs_bindgen_2a59fd2cead65c85
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_2a59fd2cead65c85 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_2a59fd2cead65c85_base (BG.toFFIType x0))

-- | Byte-swap an unsigned 64-bit number.
--
--     The SDL_Swap64 macro as a function. It always byte-swaps the value, whatever the system\'s byte order; SDL_Swap64LE or SDL_Swap64BE are what you want in most cases.
--
--     [Returns]: @x@, with its bytes in the opposite endian order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap64@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 76:26@
lithon_SDL_Swap64
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@x@]: the value to byte-swap.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
lithon_SDL_Swap64 = hs_bindgen_2a59fd2cead65c85

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap16LE@
foreign import ccall safe "hs_bindgen_1f4c504e2d406d5d"
  hs_bindgen_1f4c504e2d406d5d_base
    :: HsBindgen.Runtime.LibC.Word16
    -> IO HsBindgen.Runtime.LibC.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap16LE@
hs_bindgen_1f4c504e2d406d5d
  :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_1f4c504e2d406d5d =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_1f4c504e2d406d5d_base (BG.toFFIType x0))

-- | Swap a 16-bit value from littleendian to native byte order.
--
--     The SDL_Swap16LE macro as a function. If this is running on a littleendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap16LE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 94:26@
lithon_SDL_Swap16LE
  :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@x@]: the value to swap, in littleendian byte order.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
lithon_SDL_Swap16LE = hs_bindgen_1f4c504e2d406d5d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap32LE@
foreign import ccall safe "hs_bindgen_83c800b17676e351"
  hs_bindgen_83c800b17676e351_base
    :: HsBindgen.Runtime.LibC.Word32
    -> IO HsBindgen.Runtime.LibC.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap32LE@
hs_bindgen_83c800b17676e351
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_83c800b17676e351 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_83c800b17676e351_base (BG.toFFIType x0))

-- | Swap a 32-bit value from littleendian to native byte order.
--
--     The SDL_Swap32LE macro as a function. If this is running on a littleendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap32LE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 112:26@
lithon_SDL_Swap32LE
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@x@]: the value to swap, in littleendian byte order.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
lithon_SDL_Swap32LE = hs_bindgen_83c800b17676e351

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap64LE@
foreign import ccall safe "hs_bindgen_a8299e2a08d3f0eb"
  hs_bindgen_a8299e2a08d3f0eb_base
    :: HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap64LE@
hs_bindgen_a8299e2a08d3f0eb
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_a8299e2a08d3f0eb =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_a8299e2a08d3f0eb_base (BG.toFFIType x0))

-- | Swap a 64-bit value from littleendian to native byte order.
--
--     The SDL_Swap64LE macro as a function. If this is running on a littleendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap64LE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 130:26@
lithon_SDL_Swap64LE
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@x@]: the value to swap, in littleendian byte order.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
lithon_SDL_Swap64LE = hs_bindgen_a8299e2a08d3f0eb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_SwapFloatLE@
foreign import ccall safe "hs_bindgen_3cbb3bb4c5039011"
  hs_bindgen_3cbb3bb4c5039011_base
    :: BG.CFloat
    -> IO BG.CFloat

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_SwapFloatLE@
hs_bindgen_3cbb3bb4c5039011
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_3cbb3bb4c5039011 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_3cbb3bb4c5039011_base (BG.toFFIType x0))

-- | Swap a floating point value from littleendian to native byte order.
--
--     The SDL_SwapFloatLE macro as a function. If this is running on a littleendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_SwapFloatLE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 148:25@
lithon_SDL_SwapFloatLE
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: the value to swap, in littleendian byte order.
  -> IO BG.CFloat
lithon_SDL_SwapFloatLE = hs_bindgen_3cbb3bb4c5039011

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap16BE@
foreign import ccall safe "hs_bindgen_3821b24e3d8e81ce"
  hs_bindgen_3821b24e3d8e81ce_base
    :: HsBindgen.Runtime.LibC.Word16
    -> IO HsBindgen.Runtime.LibC.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap16BE@
hs_bindgen_3821b24e3d8e81ce
  :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_3821b24e3d8e81ce =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_3821b24e3d8e81ce_base (BG.toFFIType x0))

-- | Swap a 16-bit value from bigendian to native byte order.
--
--     The SDL_Swap16BE macro as a function. If this is running on a bigendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap16BE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 166:26@
lithon_SDL_Swap16BE
  :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@x@]: the value to swap, in bigendian byte order.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
lithon_SDL_Swap16BE = hs_bindgen_3821b24e3d8e81ce

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap32BE@
foreign import ccall safe "hs_bindgen_e3aaa35768c646a0"
  hs_bindgen_e3aaa35768c646a0_base
    :: HsBindgen.Runtime.LibC.Word32
    -> IO HsBindgen.Runtime.LibC.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap32BE@
hs_bindgen_e3aaa35768c646a0
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_e3aaa35768c646a0 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_e3aaa35768c646a0_base (BG.toFFIType x0))

-- | Swap a 32-bit value from bigendian to native byte order.
--
--     The SDL_Swap32BE macro as a function. If this is running on a bigendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap32BE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 184:26@
lithon_SDL_Swap32BE
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@x@]: the value to swap, in bigendian byte order.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
lithon_SDL_Swap32BE = hs_bindgen_e3aaa35768c646a0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap64BE@
foreign import ccall safe "hs_bindgen_6201a0f0896f9116"
  hs_bindgen_6201a0f0896f9116_base
    :: HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_Swap64BE@
hs_bindgen_6201a0f0896f9116
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_6201a0f0896f9116 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_6201a0f0896f9116_base (BG.toFFIType x0))

-- | Swap a 64-bit value from bigendian to native byte order.
--
--     The SDL_Swap64BE macro as a function. If this is running on a bigendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap64BE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 202:26@
lithon_SDL_Swap64BE
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@x@]: the value to swap, in bigendian byte order.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
lithon_SDL_Swap64BE = hs_bindgen_6201a0f0896f9116

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_SwapFloatBE@
foreign import ccall safe "hs_bindgen_770a79534d696eb6"
  hs_bindgen_770a79534d696eb6_base
    :: BG.CFloat
    -> IO BG.CFloat

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Safe_lithon_SDL_SwapFloatBE@
hs_bindgen_770a79534d696eb6
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_770a79534d696eb6 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_770a79534d696eb6_base (BG.toFFIType x0))

-- | Swap a floating point value from bigendian to native byte order.
--
--     The SDL_SwapFloatBE macro as a function. If this is running on a bigendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_SwapFloatBE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 220:25@
lithon_SDL_SwapFloatBE
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: the value to swap, in bigendian byte order.
  -> IO BG.CFloat
lithon_SDL_SwapFloatBE = hs_bindgen_770a79534d696eb6

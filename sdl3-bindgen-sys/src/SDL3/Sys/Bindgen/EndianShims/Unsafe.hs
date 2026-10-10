{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.EndianShims.Unsafe (
  SDL3.Sys.Bindgen.EndianShims.Unsafe.lithon_SDL_Swap16,
  SDL3.Sys.Bindgen.EndianShims.Unsafe.lithon_SDL_Swap32,
  SDL3.Sys.Bindgen.EndianShims.Unsafe.lithon_SDL_Swap64,
  SDL3.Sys.Bindgen.EndianShims.Unsafe.lithon_SDL_Swap16LE,
  SDL3.Sys.Bindgen.EndianShims.Unsafe.lithon_SDL_Swap32LE,
  SDL3.Sys.Bindgen.EndianShims.Unsafe.lithon_SDL_Swap64LE,
  SDL3.Sys.Bindgen.EndianShims.Unsafe.lithon_SDL_SwapFloatLE,
  SDL3.Sys.Bindgen.EndianShims.Unsafe.lithon_SDL_Swap16BE,
  SDL3.Sys.Bindgen.EndianShims.Unsafe.lithon_SDL_Swap32BE,
  SDL3.Sys.Bindgen.EndianShims.Unsafe.lithon_SDL_Swap64BE,
  SDL3.Sys.Bindgen.EndianShims.Unsafe.lithon_SDL_SwapFloatBE,
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
         , "Uint16 hs_bindgen_882f703cb333be29 ("
         , "  Uint16 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap16)(arg1);"
         , "}"
         , "Uint32 hs_bindgen_af9f92ac0160930e ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap32)(arg1);"
         , "}"
         , "Uint64 hs_bindgen_a76e576373ba9315 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap64)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_ba2e727e2251e74a ("
         , "  Uint16 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap16LE)(arg1);"
         , "}"
         , "Uint32 hs_bindgen_534b6cb79f9a53da ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap32LE)(arg1);"
         , "}"
         , "Uint64 hs_bindgen_1138811e72133911 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap64LE)(arg1);"
         , "}"
         , "float hs_bindgen_14edd560fa30714a ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_SwapFloatLE)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_cfef4dbd360a587e ("
         , "  Uint16 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap16BE)(arg1);"
         , "}"
         , "Uint32 hs_bindgen_fef82eb9028f9b73 ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap32BE)(arg1);"
         , "}"
         , "Uint64 hs_bindgen_617e37704da5f1a9 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_Swap64BE)(arg1);"
         , "}"
         , "float hs_bindgen_1ba0c9ba8563300f ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_SwapFloatBE)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap16@
foreign import ccall unsafe "hs_bindgen_882f703cb333be29"
  hs_bindgen_882f703cb333be29_base
    :: HsBindgen.Runtime.LibC.Word16
    -> IO HsBindgen.Runtime.LibC.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap16@
hs_bindgen_882f703cb333be29
  :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_882f703cb333be29 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_882f703cb333be29_base (BG.toFFIType x0))

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
lithon_SDL_Swap16 = hs_bindgen_882f703cb333be29

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap32@
foreign import ccall unsafe "hs_bindgen_af9f92ac0160930e"
  hs_bindgen_af9f92ac0160930e_base
    :: HsBindgen.Runtime.LibC.Word32
    -> IO HsBindgen.Runtime.LibC.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap32@
hs_bindgen_af9f92ac0160930e
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_af9f92ac0160930e =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_af9f92ac0160930e_base (BG.toFFIType x0))

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
lithon_SDL_Swap32 = hs_bindgen_af9f92ac0160930e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap64@
foreign import ccall unsafe "hs_bindgen_a76e576373ba9315"
  hs_bindgen_a76e576373ba9315_base
    :: HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap64@
hs_bindgen_a76e576373ba9315
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_a76e576373ba9315 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_a76e576373ba9315_base (BG.toFFIType x0))

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
lithon_SDL_Swap64 = hs_bindgen_a76e576373ba9315

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap16LE@
foreign import ccall unsafe "hs_bindgen_ba2e727e2251e74a"
  hs_bindgen_ba2e727e2251e74a_base
    :: HsBindgen.Runtime.LibC.Word16
    -> IO HsBindgen.Runtime.LibC.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap16LE@
hs_bindgen_ba2e727e2251e74a
  :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_ba2e727e2251e74a =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_ba2e727e2251e74a_base (BG.toFFIType x0))

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
lithon_SDL_Swap16LE = hs_bindgen_ba2e727e2251e74a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap32LE@
foreign import ccall unsafe "hs_bindgen_534b6cb79f9a53da"
  hs_bindgen_534b6cb79f9a53da_base
    :: HsBindgen.Runtime.LibC.Word32
    -> IO HsBindgen.Runtime.LibC.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap32LE@
hs_bindgen_534b6cb79f9a53da
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_534b6cb79f9a53da =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_534b6cb79f9a53da_base (BG.toFFIType x0))

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
lithon_SDL_Swap32LE = hs_bindgen_534b6cb79f9a53da

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap64LE@
foreign import ccall unsafe "hs_bindgen_1138811e72133911"
  hs_bindgen_1138811e72133911_base
    :: HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap64LE@
hs_bindgen_1138811e72133911
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_1138811e72133911 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_1138811e72133911_base (BG.toFFIType x0))

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
lithon_SDL_Swap64LE = hs_bindgen_1138811e72133911

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_SwapFloatLE@
foreign import ccall unsafe "hs_bindgen_14edd560fa30714a"
  hs_bindgen_14edd560fa30714a_base
    :: BG.CFloat
    -> IO BG.CFloat

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_SwapFloatLE@
hs_bindgen_14edd560fa30714a
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_14edd560fa30714a =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_14edd560fa30714a_base (BG.toFFIType x0))

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
lithon_SDL_SwapFloatLE = hs_bindgen_14edd560fa30714a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap16BE@
foreign import ccall unsafe "hs_bindgen_cfef4dbd360a587e"
  hs_bindgen_cfef4dbd360a587e_base
    :: HsBindgen.Runtime.LibC.Word16
    -> IO HsBindgen.Runtime.LibC.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap16BE@
hs_bindgen_cfef4dbd360a587e
  :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint16
hs_bindgen_cfef4dbd360a587e =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_cfef4dbd360a587e_base (BG.toFFIType x0))

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
lithon_SDL_Swap16BE = hs_bindgen_cfef4dbd360a587e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap32BE@
foreign import ccall unsafe "hs_bindgen_fef82eb9028f9b73"
  hs_bindgen_fef82eb9028f9b73_base
    :: HsBindgen.Runtime.LibC.Word32
    -> IO HsBindgen.Runtime.LibC.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap32BE@
hs_bindgen_fef82eb9028f9b73
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_fef82eb9028f9b73 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_fef82eb9028f9b73_base (BG.toFFIType x0))

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
lithon_SDL_Swap32BE = hs_bindgen_fef82eb9028f9b73

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap64BE@
foreign import ccall unsafe "hs_bindgen_617e37704da5f1a9"
  hs_bindgen_617e37704da5f1a9_base
    :: HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_Swap64BE@
hs_bindgen_617e37704da5f1a9
  :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_617e37704da5f1a9 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_617e37704da5f1a9_base (BG.toFFIType x0))

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
lithon_SDL_Swap64BE = hs_bindgen_617e37704da5f1a9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_SwapFloatBE@
foreign import ccall unsafe "hs_bindgen_1ba0c9ba8563300f"
  hs_bindgen_1ba0c9ba8563300f_base
    :: BG.CFloat
    -> IO BG.CFloat

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_Unsafe_lithon_SDL_SwapFloatBE@
hs_bindgen_1ba0c9ba8563300f
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_1ba0c9ba8563300f =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_1ba0c9ba8563300f_base (BG.toFFIType x0))

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
lithon_SDL_SwapFloatBE = hs_bindgen_1ba0c9ba8563300f

{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.EndianShims.FunPtr (
  SDL3.Sys.Bindgen.EndianShims.FunPtr.lithon_SDL_Swap16,
  SDL3.Sys.Bindgen.EndianShims.FunPtr.lithon_SDL_Swap32,
  SDL3.Sys.Bindgen.EndianShims.FunPtr.lithon_SDL_Swap64,
  SDL3.Sys.Bindgen.EndianShims.FunPtr.lithon_SDL_Swap16LE,
  SDL3.Sys.Bindgen.EndianShims.FunPtr.lithon_SDL_Swap32LE,
  SDL3.Sys.Bindgen.EndianShims.FunPtr.lithon_SDL_Swap64LE,
  SDL3.Sys.Bindgen.EndianShims.FunPtr.lithon_SDL_SwapFloatLE,
  SDL3.Sys.Bindgen.EndianShims.FunPtr.lithon_SDL_Swap16BE,
  SDL3.Sys.Bindgen.EndianShims.FunPtr.lithon_SDL_Swap32BE,
  SDL3.Sys.Bindgen.EndianShims.FunPtr.lithon_SDL_Swap64BE,
  SDL3.Sys.Bindgen.EndianShims.FunPtr.lithon_SDL_SwapFloatBE,
)
where

import Prelude (IO, fmap)

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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap16 */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_7b8c5f080d1ded5e (void)) ("
         , "  Uint16 arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_Swap16;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap32 */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_72820f6cbd65d197 (void)) ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_Swap32;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap64 */"
         , "__attribute__ ((const))"
         , "Uint64 (*hs_bindgen_a6f1eb5f1830cff7 (void)) ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_Swap64;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap16LE */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_6da14ac6e18900ea (void)) ("
         , "  Uint16 arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_Swap16LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap32LE */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_7565149a49ae8b75 (void)) ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_Swap32LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap64LE */"
         , "__attribute__ ((const))"
         , "Uint64 (*hs_bindgen_538b6a0639e3f6b8 (void)) ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_Swap64LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_SwapFloatLE */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_37fcf9d0fa6d7f0b (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_SwapFloatLE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap16BE */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_e0a1dc754a468319 (void)) ("
         , "  Uint16 arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_Swap16BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap32BE */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_d51d24c0ad9eeb3d (void)) ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_Swap32BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap64BE */"
         , "__attribute__ ((const))"
         , "Uint64 (*hs_bindgen_75711d840ca571fa (void)) ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_Swap64BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_SwapFloatBE */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_d1bcd6541629959e (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_SwapFloatBE;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap16@
foreign import ccall unsafe "hs_bindgen_7b8c5f080d1ded5e"
  hs_bindgen_7b8c5f080d1ded5e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap16@
hs_bindgen_7b8c5f080d1ded5e
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_7b8c5f080d1ded5e =
  fmap BG.fromFFIType hs_bindgen_7b8c5f080d1ded5e_base

{-# NOINLINE lithon_SDL_Swap16 #-}

-- | Byte-swap an unsigned 16-bit number.
--
--     The SDL_Swap16 macro as a function. It always byte-swaps the value, whatever the system\'s byte order; SDL_Swap16LE or SDL_Swap16BE are what you want in most cases.
--
--     [@x@]: the value to byte-swap.
--
--     [Returns]: @x@, with its bytes in the opposite endian order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap16@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 38:26@
lithon_SDL_Swap16 :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
lithon_SDL_Swap16 =
  BG.unsafePerformIO hs_bindgen_7b8c5f080d1ded5e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap32@
foreign import ccall unsafe "hs_bindgen_72820f6cbd65d197"
  hs_bindgen_72820f6cbd65d197_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap32@
hs_bindgen_72820f6cbd65d197
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32))
hs_bindgen_72820f6cbd65d197 =
  fmap BG.fromFFIType hs_bindgen_72820f6cbd65d197_base

{-# NOINLINE lithon_SDL_Swap32 #-}

-- | Byte-swap an unsigned 32-bit number.
--
--     The SDL_Swap32 macro as a function. It always byte-swaps the value, whatever the system\'s byte order; SDL_Swap32LE or SDL_Swap32BE are what you want in most cases.
--
--     [@x@]: the value to byte-swap.
--
--     [Returns]: @x@, with its bytes in the opposite endian order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap32@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 57:26@
lithon_SDL_Swap32 :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
lithon_SDL_Swap32 =
  BG.unsafePerformIO hs_bindgen_72820f6cbd65d197

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap64@
foreign import ccall unsafe "hs_bindgen_a6f1eb5f1830cff7"
  hs_bindgen_a6f1eb5f1830cff7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap64@
hs_bindgen_a6f1eb5f1830cff7
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64))
hs_bindgen_a6f1eb5f1830cff7 =
  fmap BG.fromFFIType hs_bindgen_a6f1eb5f1830cff7_base

{-# NOINLINE lithon_SDL_Swap64 #-}

-- | Byte-swap an unsigned 64-bit number.
--
--     The SDL_Swap64 macro as a function. It always byte-swaps the value, whatever the system\'s byte order; SDL_Swap64LE or SDL_Swap64BE are what you want in most cases.
--
--     [@x@]: the value to byte-swap.
--
--     [Returns]: @x@, with its bytes in the opposite endian order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap64@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 76:26@
lithon_SDL_Swap64 :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64)
lithon_SDL_Swap64 =
  BG.unsafePerformIO hs_bindgen_a6f1eb5f1830cff7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap16LE@
foreign import ccall unsafe "hs_bindgen_6da14ac6e18900ea"
  hs_bindgen_6da14ac6e18900ea_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap16LE@
hs_bindgen_6da14ac6e18900ea
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_6da14ac6e18900ea =
  fmap BG.fromFFIType hs_bindgen_6da14ac6e18900ea_base

{-# NOINLINE lithon_SDL_Swap16LE #-}

-- | Swap a 16-bit value from littleendian to native byte order.
--
--     The SDL_Swap16LE macro as a function. If this is running on a littleendian system, @x@ is returned unchanged.
--
--     [@x@]: the value to swap, in littleendian byte order.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap16LE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 94:26@
lithon_SDL_Swap16LE
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
lithon_SDL_Swap16LE =
  BG.unsafePerformIO hs_bindgen_6da14ac6e18900ea

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap32LE@
foreign import ccall unsafe "hs_bindgen_7565149a49ae8b75"
  hs_bindgen_7565149a49ae8b75_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap32LE@
hs_bindgen_7565149a49ae8b75
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32))
hs_bindgen_7565149a49ae8b75 =
  fmap BG.fromFFIType hs_bindgen_7565149a49ae8b75_base

{-# NOINLINE lithon_SDL_Swap32LE #-}

-- | Swap a 32-bit value from littleendian to native byte order.
--
--     The SDL_Swap32LE macro as a function. If this is running on a littleendian system, @x@ is returned unchanged.
--
--     [@x@]: the value to swap, in littleendian byte order.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap32LE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 112:26@
lithon_SDL_Swap32LE
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
lithon_SDL_Swap32LE =
  BG.unsafePerformIO hs_bindgen_7565149a49ae8b75

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap64LE@
foreign import ccall unsafe "hs_bindgen_538b6a0639e3f6b8"
  hs_bindgen_538b6a0639e3f6b8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap64LE@
hs_bindgen_538b6a0639e3f6b8
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64))
hs_bindgen_538b6a0639e3f6b8 =
  fmap BG.fromFFIType hs_bindgen_538b6a0639e3f6b8_base

{-# NOINLINE lithon_SDL_Swap64LE #-}

-- | Swap a 64-bit value from littleendian to native byte order.
--
--     The SDL_Swap64LE macro as a function. If this is running on a littleendian system, @x@ is returned unchanged.
--
--     [@x@]: the value to swap, in littleendian byte order.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap64LE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 130:26@
lithon_SDL_Swap64LE
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64)
lithon_SDL_Swap64LE =
  BG.unsafePerformIO hs_bindgen_538b6a0639e3f6b8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_SwapFloatLE@
foreign import ccall unsafe "hs_bindgen_37fcf9d0fa6d7f0b"
  hs_bindgen_37fcf9d0fa6d7f0b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_SwapFloatLE@
hs_bindgen_37fcf9d0fa6d7f0b :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_37fcf9d0fa6d7f0b =
  fmap BG.fromFFIType hs_bindgen_37fcf9d0fa6d7f0b_base

{-# NOINLINE lithon_SDL_SwapFloatLE #-}

-- | Swap a floating point value from littleendian to native byte order.
--
--     The SDL_SwapFloatLE macro as a function. If this is running on a littleendian system, @x@ is returned unchanged.
--
--     [@x@]: the value to swap, in littleendian byte order.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_SwapFloatLE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 148:25@
lithon_SDL_SwapFloatLE :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
lithon_SDL_SwapFloatLE =
  BG.unsafePerformIO hs_bindgen_37fcf9d0fa6d7f0b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap16BE@
foreign import ccall unsafe "hs_bindgen_e0a1dc754a468319"
  hs_bindgen_e0a1dc754a468319_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap16BE@
hs_bindgen_e0a1dc754a468319
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO SDL3.Sys.Bindgen.Stdinc.Uint16))
hs_bindgen_e0a1dc754a468319 =
  fmap BG.fromFFIType hs_bindgen_e0a1dc754a468319_base

{-# NOINLINE lithon_SDL_Swap16BE #-}

-- | Swap a 16-bit value from bigendian to native byte order.
--
--     The SDL_Swap16BE macro as a function. If this is running on a bigendian system, @x@ is returned unchanged.
--
--     [@x@]: the value to swap, in bigendian byte order.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap16BE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 166:26@
lithon_SDL_Swap16BE
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO SDL3.Sys.Bindgen.Stdinc.Uint16)
lithon_SDL_Swap16BE =
  BG.unsafePerformIO hs_bindgen_e0a1dc754a468319

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap32BE@
foreign import ccall unsafe "hs_bindgen_d51d24c0ad9eeb3d"
  hs_bindgen_d51d24c0ad9eeb3d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap32BE@
hs_bindgen_d51d24c0ad9eeb3d
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32))
hs_bindgen_d51d24c0ad9eeb3d =
  fmap BG.fromFFIType hs_bindgen_d51d24c0ad9eeb3d_base

{-# NOINLINE lithon_SDL_Swap32BE #-}

-- | Swap a 32-bit value from bigendian to native byte order.
--
--     The SDL_Swap32BE macro as a function. If this is running on a bigendian system, @x@ is returned unchanged.
--
--     [@x@]: the value to swap, in bigendian byte order.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap32BE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 184:26@
lithon_SDL_Swap32BE
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
lithon_SDL_Swap32BE =
  BG.unsafePerformIO hs_bindgen_d51d24c0ad9eeb3d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap64BE@
foreign import ccall unsafe "hs_bindgen_75711d840ca571fa"
  hs_bindgen_75711d840ca571fa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_Swap64BE@
hs_bindgen_75711d840ca571fa
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64))
hs_bindgen_75711d840ca571fa =
  fmap BG.fromFFIType hs_bindgen_75711d840ca571fa_base

{-# NOINLINE lithon_SDL_Swap64BE #-}

-- | Swap a 64-bit value from bigendian to native byte order.
--
--     The SDL_Swap64BE macro as a function. If this is running on a bigendian system, @x@ is returned unchanged.
--
--     [@x@]: the value to swap, in bigendian byte order.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_Swap64BE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 202:26@
lithon_SDL_Swap64BE
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64)
lithon_SDL_Swap64BE =
  BG.unsafePerformIO hs_bindgen_75711d840ca571fa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_SwapFloatBE@
foreign import ccall unsafe "hs_bindgen_d1bcd6541629959e"
  hs_bindgen_d1bcd6541629959e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.EndianShims_get_lithon_SDL_SwapFloatBE@
hs_bindgen_d1bcd6541629959e :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_d1bcd6541629959e =
  fmap BG.fromFFIType hs_bindgen_d1bcd6541629959e_base

{-# NOINLINE lithon_SDL_SwapFloatBE #-}

-- | Swap a floating point value from bigendian to native byte order.
--
--     The SDL_SwapFloatBE macro as a function. If this is running on a bigendian system, @x@ is returned unchanged.
--
--     [@x@]: the value to swap, in bigendian byte order.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_SwapFloatBE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 220:25@
lithon_SDL_SwapFloatBE :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
lithon_SDL_SwapFloatBE =
  BG.unsafePerformIO hs_bindgen_d1bcd6541629959e

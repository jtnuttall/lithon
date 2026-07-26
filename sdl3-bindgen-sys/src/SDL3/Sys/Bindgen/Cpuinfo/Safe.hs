{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Cpuinfo.Safe (
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_GetNumLogicalCPUCores,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_GetCPUCacheLineSize,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasAltiVec,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasMMX,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasSSE,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasSSE2,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasSSE3,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasSSE41,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasSSE42,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasAVX,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasAVX2,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasAVX512F,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasARMSIMD,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasNEON,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasLSX,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_HasLASX,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_GetSystemRAM,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_GetSIMDAlignment,
  SDL3.Sys.Bindgen.Cpuinfo.Safe.sDL_GetSystemPageSize,
)
where

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_cpuinfo.h>"
         , "signed int hs_bindgen_021d38423efa2894 (void)"
         , "{"
         , "  return (SDL_GetNumLogicalCPUCores)();"
         , "}"
         , "signed int hs_bindgen_0ca909a81c077ab1 (void)"
         , "{"
         , "  return (SDL_GetCPUCacheLineSize)();"
         , "}"
         , "_Bool hs_bindgen_12f0f738ad7e36de (void)"
         , "{"
         , "  return (SDL_HasAltiVec)();"
         , "}"
         , "_Bool hs_bindgen_7b773ae3e33864af (void)"
         , "{"
         , "  return (SDL_HasMMX)();"
         , "}"
         , "_Bool hs_bindgen_9fc6d41bd7e06a8c (void)"
         , "{"
         , "  return (SDL_HasSSE)();"
         , "}"
         , "_Bool hs_bindgen_87bc5fc8be1bca92 (void)"
         , "{"
         , "  return (SDL_HasSSE2)();"
         , "}"
         , "_Bool hs_bindgen_8c78b2fb7d6ba035 (void)"
         , "{"
         , "  return (SDL_HasSSE3)();"
         , "}"
         , "_Bool hs_bindgen_ad68eac9c65daa8b (void)"
         , "{"
         , "  return (SDL_HasSSE41)();"
         , "}"
         , "_Bool hs_bindgen_45773d656848547a (void)"
         , "{"
         , "  return (SDL_HasSSE42)();"
         , "}"
         , "_Bool hs_bindgen_09d9c1ee75214203 (void)"
         , "{"
         , "  return (SDL_HasAVX)();"
         , "}"
         , "_Bool hs_bindgen_dccd2628b251a266 (void)"
         , "{"
         , "  return (SDL_HasAVX2)();"
         , "}"
         , "_Bool hs_bindgen_963390989096b612 (void)"
         , "{"
         , "  return (SDL_HasAVX512F)();"
         , "}"
         , "_Bool hs_bindgen_7f5bde151d49ba8f (void)"
         , "{"
         , "  return (SDL_HasARMSIMD)();"
         , "}"
         , "_Bool hs_bindgen_4bb569121e6831a2 (void)"
         , "{"
         , "  return (SDL_HasNEON)();"
         , "}"
         , "_Bool hs_bindgen_56a380fc3630f88f (void)"
         , "{"
         , "  return (SDL_HasLSX)();"
         , "}"
         , "_Bool hs_bindgen_18257ff80297cf49 (void)"
         , "{"
         , "  return (SDL_HasLASX)();"
         , "}"
         , "signed int hs_bindgen_cd53f670bd0bc729 (void)"
         , "{"
         , "  return (SDL_GetSystemRAM)();"
         , "}"
         , "size_t hs_bindgen_db11c36832e4fbf2 (void)"
         , "{"
         , "  return (SDL_GetSIMDAlignment)();"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "signed int hs_bindgen_a5c1dbf29e777b88 (void)"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetSystemPageSize)();"
         , "#else"
         , "  SDL_SetError(\"SDL_GetSystemPageSize requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_GetNumLogicalCPUCores@
foreign import ccall safe "hs_bindgen_021d38423efa2894"
  hs_bindgen_021d38423efa2894_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_GetNumLogicalCPUCores@
hs_bindgen_021d38423efa2894 :: IO BG.CInt
hs_bindgen_021d38423efa2894 =
  BG.fromFFIType hs_bindgen_021d38423efa2894_base

-- | Get the number of logical CPU cores available.
--
--     [Returns]: the total number of logical CPU cores. On CPUs that include technologies such as hyperthreading, the number of logical cores may be more than the number of physical cores.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetNumLogicalCPUCores@, defined at @SDL3\/SDL_cpuinfo.h 73:33@
sDL_GetNumLogicalCPUCores :: IO BG.CInt
sDL_GetNumLogicalCPUCores =
  hs_bindgen_021d38423efa2894

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_GetCPUCacheLineSize@
foreign import ccall safe "hs_bindgen_0ca909a81c077ab1"
  hs_bindgen_0ca909a81c077ab1_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_GetCPUCacheLineSize@
hs_bindgen_0ca909a81c077ab1 :: IO BG.CInt
hs_bindgen_0ca909a81c077ab1 =
  BG.fromFFIType hs_bindgen_0ca909a81c077ab1_base

-- | Determine the L1 cache line size of the CPU.
--
--     This is useful for determining multi-threaded structure padding or SIMD prefetch sizes.
--
--     [Returns]: the L1 cache line size of the CPU, in bytes.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetCPUCacheLineSize@, defined at @SDL3\/SDL_cpuinfo.h 87:33@
sDL_GetCPUCacheLineSize :: IO BG.CInt
sDL_GetCPUCacheLineSize = hs_bindgen_0ca909a81c077ab1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasAltiVec@
foreign import ccall safe "hs_bindgen_12f0f738ad7e36de"
  hs_bindgen_12f0f738ad7e36de_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasAltiVec@
hs_bindgen_12f0f738ad7e36de :: IO BG.CBool
hs_bindgen_12f0f738ad7e36de =
  BG.fromFFIType hs_bindgen_12f0f738ad7e36de_base

-- | Determine whether the CPU has AltiVec features.
--
--     This always returns false on CPUs that aren\'t using PowerPC instruction sets.
--
--     [Returns]: true if the CPU has AltiVec features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_HasAltiVec@, defined at @SDL3\/SDL_cpuinfo.h 101:34@
sDL_HasAltiVec :: IO BG.CBool
sDL_HasAltiVec = hs_bindgen_12f0f738ad7e36de

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasMMX@
foreign import ccall safe "hs_bindgen_7b773ae3e33864af"
  hs_bindgen_7b773ae3e33864af_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasMMX@
hs_bindgen_7b773ae3e33864af :: IO BG.CBool
hs_bindgen_7b773ae3e33864af =
  BG.fromFFIType hs_bindgen_7b773ae3e33864af_base

-- | Determine whether the CPU has MMX features.
--
--     This always returns false on CPUs that aren\'t using Intel instruction sets.
--
--     [Returns]: true if the CPU has MMX features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_HasMMX@, defined at @SDL3\/SDL_cpuinfo.h 114:34@
sDL_HasMMX :: IO BG.CBool
sDL_HasMMX = hs_bindgen_7b773ae3e33864af

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasSSE@
foreign import ccall safe "hs_bindgen_9fc6d41bd7e06a8c"
  hs_bindgen_9fc6d41bd7e06a8c_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasSSE@
hs_bindgen_9fc6d41bd7e06a8c :: IO BG.CBool
hs_bindgen_9fc6d41bd7e06a8c =
  BG.fromFFIType hs_bindgen_9fc6d41bd7e06a8c_base

-- | Determine whether the CPU has SSE features.
--
--     This always returns false on CPUs that aren\'t using Intel instruction sets.
--
--     [Returns]: true if the CPU has SSE features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasSSE2', 'sDL_HasSSE3', 'sDL_HasSSE41', 'sDL_HasSSE42'
--
--     [C declaration]: @SDL_HasSSE@, defined at @SDL3\/SDL_cpuinfo.h 132:34@
sDL_HasSSE :: IO BG.CBool
sDL_HasSSE = hs_bindgen_9fc6d41bd7e06a8c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasSSE2@
foreign import ccall safe "hs_bindgen_87bc5fc8be1bca92"
  hs_bindgen_87bc5fc8be1bca92_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasSSE2@
hs_bindgen_87bc5fc8be1bca92 :: IO BG.CBool
hs_bindgen_87bc5fc8be1bca92 =
  BG.fromFFIType hs_bindgen_87bc5fc8be1bca92_base

-- | Determine whether the CPU has SSE2 features.
--
--     This always returns false on CPUs that aren\'t using Intel instruction sets.
--
--     [Returns]: true if the CPU has SSE2 features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasSSE', 'sDL_HasSSE3', 'sDL_HasSSE41', 'sDL_HasSSE42'
--
--     [C declaration]: @SDL_HasSSE2@, defined at @SDL3\/SDL_cpuinfo.h 150:34@
sDL_HasSSE2 :: IO BG.CBool
sDL_HasSSE2 = hs_bindgen_87bc5fc8be1bca92

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasSSE3@
foreign import ccall safe "hs_bindgen_8c78b2fb7d6ba035"
  hs_bindgen_8c78b2fb7d6ba035_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasSSE3@
hs_bindgen_8c78b2fb7d6ba035 :: IO BG.CBool
hs_bindgen_8c78b2fb7d6ba035 =
  BG.fromFFIType hs_bindgen_8c78b2fb7d6ba035_base

-- | Determine whether the CPU has SSE3 features.
--
--     This always returns false on CPUs that aren\'t using Intel instruction sets.
--
--     [Returns]: true if the CPU has SSE3 features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasSSE', 'sDL_HasSSE2', 'sDL_HasSSE41', 'sDL_HasSSE42'
--
--     [C declaration]: @SDL_HasSSE3@, defined at @SDL3\/SDL_cpuinfo.h 168:34@
sDL_HasSSE3 :: IO BG.CBool
sDL_HasSSE3 = hs_bindgen_8c78b2fb7d6ba035

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasSSE41@
foreign import ccall safe "hs_bindgen_ad68eac9c65daa8b"
  hs_bindgen_ad68eac9c65daa8b_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasSSE41@
hs_bindgen_ad68eac9c65daa8b :: IO BG.CBool
hs_bindgen_ad68eac9c65daa8b =
  BG.fromFFIType hs_bindgen_ad68eac9c65daa8b_base

-- | Determine whether the CPU has SSE4.1 features.
--
--     This always returns false on CPUs that aren\'t using Intel instruction sets.
--
--     [Returns]: true if the CPU has SSE4.1 features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasSSE', 'sDL_HasSSE2', 'sDL_HasSSE3', 'sDL_HasSSE42'
--
--     [C declaration]: @SDL_HasSSE41@, defined at @SDL3\/SDL_cpuinfo.h 186:34@
sDL_HasSSE41 :: IO BG.CBool
sDL_HasSSE41 = hs_bindgen_ad68eac9c65daa8b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasSSE42@
foreign import ccall safe "hs_bindgen_45773d656848547a"
  hs_bindgen_45773d656848547a_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasSSE42@
hs_bindgen_45773d656848547a :: IO BG.CBool
hs_bindgen_45773d656848547a =
  BG.fromFFIType hs_bindgen_45773d656848547a_base

-- | Determine whether the CPU has SSE4.2 features.
--
--     This always returns false on CPUs that aren\'t using Intel instruction sets.
--
--     [Returns]: true if the CPU has SSE4.2 features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasSSE', 'sDL_HasSSE2', 'sDL_HasSSE3', 'sDL_HasSSE41'
--
--     [C declaration]: @SDL_HasSSE42@, defined at @SDL3\/SDL_cpuinfo.h 204:34@
sDL_HasSSE42 :: IO BG.CBool
sDL_HasSSE42 = hs_bindgen_45773d656848547a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasAVX@
foreign import ccall safe "hs_bindgen_09d9c1ee75214203"
  hs_bindgen_09d9c1ee75214203_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasAVX@
hs_bindgen_09d9c1ee75214203 :: IO BG.CBool
hs_bindgen_09d9c1ee75214203 =
  BG.fromFFIType hs_bindgen_09d9c1ee75214203_base

-- | Determine whether the CPU has AVX features.
--
--     This always returns false on CPUs that aren\'t using Intel instruction sets.
--
--     [Returns]: true if the CPU has AVX features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasAVX2', 'sDL_HasAVX512F'
--
--     [C declaration]: @SDL_HasAVX@, defined at @SDL3\/SDL_cpuinfo.h 220:34@
sDL_HasAVX :: IO BG.CBool
sDL_HasAVX = hs_bindgen_09d9c1ee75214203

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasAVX2@
foreign import ccall safe "hs_bindgen_dccd2628b251a266"
  hs_bindgen_dccd2628b251a266_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasAVX2@
hs_bindgen_dccd2628b251a266 :: IO BG.CBool
hs_bindgen_dccd2628b251a266 =
  BG.fromFFIType hs_bindgen_dccd2628b251a266_base

-- | Determine whether the CPU has AVX2 features.
--
--     This always returns false on CPUs that aren\'t using Intel instruction sets.
--
--     [Returns]: true if the CPU has AVX2 features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasAVX', 'sDL_HasAVX512F'
--
--     [C declaration]: @SDL_HasAVX2@, defined at @SDL3\/SDL_cpuinfo.h 236:34@
sDL_HasAVX2 :: IO BG.CBool
sDL_HasAVX2 = hs_bindgen_dccd2628b251a266

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasAVX512F@
foreign import ccall safe "hs_bindgen_963390989096b612"
  hs_bindgen_963390989096b612_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasAVX512F@
hs_bindgen_963390989096b612 :: IO BG.CBool
hs_bindgen_963390989096b612 =
  BG.fromFFIType hs_bindgen_963390989096b612_base

-- | Determine whether the CPU has AVX-512F (foundation) features.
--
--     This always returns false on CPUs that aren\'t using Intel instruction sets.
--
--     [Returns]: true if the CPU has AVX-512F features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasAVX', 'sDL_HasAVX2'
--
--     [C declaration]: @SDL_HasAVX512F@, defined at @SDL3\/SDL_cpuinfo.h 252:34@
sDL_HasAVX512F :: IO BG.CBool
sDL_HasAVX512F = hs_bindgen_963390989096b612

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasARMSIMD@
foreign import ccall safe "hs_bindgen_7f5bde151d49ba8f"
  hs_bindgen_7f5bde151d49ba8f_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasARMSIMD@
hs_bindgen_7f5bde151d49ba8f :: IO BG.CBool
hs_bindgen_7f5bde151d49ba8f =
  BG.fromFFIType hs_bindgen_7f5bde151d49ba8f_base

-- | Determine whether the CPU has ARM SIMD (ARMv6) features.
--
--     This is different from ARM NEON, which is a different instruction set.
--
--     This always returns false on CPUs that aren\'t using ARM instruction sets.
--
--     [Returns]: true if the CPU has ARM SIMD features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasNEON'
--
--     [C declaration]: @SDL_HasARMSIMD@, defined at @SDL3\/SDL_cpuinfo.h 269:34@
sDL_HasARMSIMD :: IO BG.CBool
sDL_HasARMSIMD = hs_bindgen_7f5bde151d49ba8f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasNEON@
foreign import ccall safe "hs_bindgen_4bb569121e6831a2"
  hs_bindgen_4bb569121e6831a2_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasNEON@
hs_bindgen_4bb569121e6831a2 :: IO BG.CBool
hs_bindgen_4bb569121e6831a2 =
  BG.fromFFIType hs_bindgen_4bb569121e6831a2_base

-- | Determine whether the CPU has NEON (ARM SIMD) features.
--
--     This always returns false on CPUs that aren\'t using ARM instruction sets.
--
--     [Returns]: true if the CPU has ARM NEON features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_HasNEON@, defined at @SDL3\/SDL_cpuinfo.h 282:34@
sDL_HasNEON :: IO BG.CBool
sDL_HasNEON = hs_bindgen_4bb569121e6831a2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasLSX@
foreign import ccall safe "hs_bindgen_56a380fc3630f88f"
  hs_bindgen_56a380fc3630f88f_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasLSX@
hs_bindgen_56a380fc3630f88f :: IO BG.CBool
hs_bindgen_56a380fc3630f88f =
  BG.fromFFIType hs_bindgen_56a380fc3630f88f_base

-- | Determine whether the CPU has LSX (LOONGARCH SIMD) features.
--
--     This always returns false on CPUs that aren\'t using LOONGARCH instruction sets.
--
--     [Returns]: true if the CPU has LOONGARCH LSX features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_HasLSX@, defined at @SDL3\/SDL_cpuinfo.h 296:34@
sDL_HasLSX :: IO BG.CBool
sDL_HasLSX = hs_bindgen_56a380fc3630f88f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasLASX@
foreign import ccall safe "hs_bindgen_18257ff80297cf49"
  hs_bindgen_18257ff80297cf49_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_HasLASX@
hs_bindgen_18257ff80297cf49 :: IO BG.CBool
hs_bindgen_18257ff80297cf49 =
  BG.fromFFIType hs_bindgen_18257ff80297cf49_base

-- | Determine whether the CPU has LASX (LOONGARCH SIMD) features.
--
--     This always returns false on CPUs that aren\'t using LOONGARCH instruction sets.
--
--     [Returns]: true if the CPU has LOONGARCH LASX features or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_HasLASX@, defined at @SDL3\/SDL_cpuinfo.h 310:34@
sDL_HasLASX :: IO BG.CBool
sDL_HasLASX = hs_bindgen_18257ff80297cf49

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_GetSystemRAM@
foreign import ccall safe "hs_bindgen_cd53f670bd0bc729"
  hs_bindgen_cd53f670bd0bc729_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_GetSystemRAM@
hs_bindgen_cd53f670bd0bc729 :: IO BG.CInt
hs_bindgen_cd53f670bd0bc729 =
  BG.fromFFIType hs_bindgen_cd53f670bd0bc729_base

-- | Get the amount of RAM configured in the system.
--
--     [Returns]: the amount of RAM configured in the system in MiB.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSystemRAM@, defined at @SDL3\/SDL_cpuinfo.h 321:33@
sDL_GetSystemRAM :: IO BG.CInt
sDL_GetSystemRAM = hs_bindgen_cd53f670bd0bc729

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_GetSIMDAlignment@
foreign import ccall safe "hs_bindgen_db11c36832e4fbf2"
  hs_bindgen_db11c36832e4fbf2_base
    :: IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_GetSIMDAlignment@
hs_bindgen_db11c36832e4fbf2 :: IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_db11c36832e4fbf2 =
  BG.fromFFIType hs_bindgen_db11c36832e4fbf2_base

-- | Report the alignment this system needs for SIMD allocations.
--
--     This will return the minimum number of bytes to which a pointer must be aligned to be compatible with SIMD instructions on the current machine. For example, if the machine supports SSE only, it will return 16, but if it supports AVX-512F, it\'ll return 64 (etc). This only reports values for instruction sets SDL knows about, so if your SDL build doesn\'t have @SDL_HasAVX512F()@, then it might return 16 for the SSE support it sees and not 64 for the AVX-512 instructions that exist but SDL doesn\'t know about. Plan accordingly.
--
--     [Returns]: the alignment in bytes needed for available, known SIMD instructions.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_aligned_alloc, SDL_aligned_free
--
--     [C declaration]: @SDL_GetSIMDAlignment@, defined at @SDL3\/SDL_cpuinfo.h 345:36@
sDL_GetSIMDAlignment :: IO HsBindgen.Runtime.LibC.CSize
sDL_GetSIMDAlignment = hs_bindgen_db11c36832e4fbf2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_GetSystemPageSize@
foreign import ccall safe "hs_bindgen_a5c1dbf29e777b88"
  hs_bindgen_a5c1dbf29e777b88_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Safe_SDL_GetSystemPageSize@
hs_bindgen_a5c1dbf29e777b88 :: IO BG.CInt
hs_bindgen_a5c1dbf29e777b88 =
  BG.fromFFIType hs_bindgen_a5c1dbf29e777b88_base

-- | Report the size of a page of memory.
--
--     Different platforms might have different memory page sizes. In current times, 4 kilobytes is not unusual, but newer systems are moving to larger page sizes, and esoteric platforms might have any unexpected size.
--
--     Note that this function can return 0, which means SDL can\'t determine the page size on this platform. It will /not/ set an error string to be retrieved with SDL_GetError() in this case! In this case, defaulting to 4096 is often a reasonable option.
--
--     [Returns]: the size of a single page of memory, in bytes, or 0 if SDL can\'t determine this information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetSystemPageSize@, defined at @SDL3\/SDL_cpuinfo.h 366:33@
sDL_GetSystemPageSize :: IO BG.CInt
sDL_GetSystemPageSize = hs_bindgen_a5c1dbf29e777b88

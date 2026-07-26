{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Cpuinfo.Unsafe (
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_GetNumLogicalCPUCores,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_GetCPUCacheLineSize,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasAltiVec,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasMMX,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasSSE,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasSSE2,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasSSE3,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasSSE41,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasSSE42,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasAVX,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasAVX2,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasAVX512F,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasARMSIMD,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasNEON,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasLSX,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_HasLASX,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_GetSystemRAM,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_GetSIMDAlignment,
  SDL3.Sys.Bindgen.Cpuinfo.Unsafe.sDL_GetSystemPageSize,
)
where

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_cpuinfo.h>"
         , "signed int hs_bindgen_2dccacbd66e2901a (void)"
         , "{"
         , "  return (SDL_GetNumLogicalCPUCores)();"
         , "}"
         , "signed int hs_bindgen_e03244111b7a5e58 (void)"
         , "{"
         , "  return (SDL_GetCPUCacheLineSize)();"
         , "}"
         , "_Bool hs_bindgen_c02ac9b5929c16b4 (void)"
         , "{"
         , "  return (SDL_HasAltiVec)();"
         , "}"
         , "_Bool hs_bindgen_28aa2bda36b5aa4c (void)"
         , "{"
         , "  return (SDL_HasMMX)();"
         , "}"
         , "_Bool hs_bindgen_eaac9231c0bcefbd (void)"
         , "{"
         , "  return (SDL_HasSSE)();"
         , "}"
         , "_Bool hs_bindgen_45752d13431081c5 (void)"
         , "{"
         , "  return (SDL_HasSSE2)();"
         , "}"
         , "_Bool hs_bindgen_c6c39cde5a6c6617 (void)"
         , "{"
         , "  return (SDL_HasSSE3)();"
         , "}"
         , "_Bool hs_bindgen_e0ea6c3ffa969fb3 (void)"
         , "{"
         , "  return (SDL_HasSSE41)();"
         , "}"
         , "_Bool hs_bindgen_963abd764eea230e (void)"
         , "{"
         , "  return (SDL_HasSSE42)();"
         , "}"
         , "_Bool hs_bindgen_9fd691470d9db666 (void)"
         , "{"
         , "  return (SDL_HasAVX)();"
         , "}"
         , "_Bool hs_bindgen_124690c686028ea3 (void)"
         , "{"
         , "  return (SDL_HasAVX2)();"
         , "}"
         , "_Bool hs_bindgen_3ae539db5deb14c3 (void)"
         , "{"
         , "  return (SDL_HasAVX512F)();"
         , "}"
         , "_Bool hs_bindgen_b00e33aa275d2caa (void)"
         , "{"
         , "  return (SDL_HasARMSIMD)();"
         , "}"
         , "_Bool hs_bindgen_1bc7c765b1884ac6 (void)"
         , "{"
         , "  return (SDL_HasNEON)();"
         , "}"
         , "_Bool hs_bindgen_d7682979762c8eba (void)"
         , "{"
         , "  return (SDL_HasLSX)();"
         , "}"
         , "_Bool hs_bindgen_d5a768a4b808f80b (void)"
         , "{"
         , "  return (SDL_HasLASX)();"
         , "}"
         , "signed int hs_bindgen_677c5a21a3ebeb42 (void)"
         , "{"
         , "  return (SDL_GetSystemRAM)();"
         , "}"
         , "size_t hs_bindgen_0e3c01d452c69d72 (void)"
         , "{"
         , "  return (SDL_GetSIMDAlignment)();"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "signed int hs_bindgen_d276a10dc866cd76 (void)"
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

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_GetNumLogicalCPUCores@
foreign import ccall unsafe "hs_bindgen_2dccacbd66e2901a"
  hs_bindgen_2dccacbd66e2901a_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_GetNumLogicalCPUCores@
hs_bindgen_2dccacbd66e2901a :: IO BG.CInt
hs_bindgen_2dccacbd66e2901a =
  BG.fromFFIType hs_bindgen_2dccacbd66e2901a_base

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
  hs_bindgen_2dccacbd66e2901a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_GetCPUCacheLineSize@
foreign import ccall unsafe "hs_bindgen_e03244111b7a5e58"
  hs_bindgen_e03244111b7a5e58_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_GetCPUCacheLineSize@
hs_bindgen_e03244111b7a5e58 :: IO BG.CInt
hs_bindgen_e03244111b7a5e58 =
  BG.fromFFIType hs_bindgen_e03244111b7a5e58_base

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
sDL_GetCPUCacheLineSize = hs_bindgen_e03244111b7a5e58

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasAltiVec@
foreign import ccall unsafe "hs_bindgen_c02ac9b5929c16b4"
  hs_bindgen_c02ac9b5929c16b4_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasAltiVec@
hs_bindgen_c02ac9b5929c16b4 :: IO BG.CBool
hs_bindgen_c02ac9b5929c16b4 =
  BG.fromFFIType hs_bindgen_c02ac9b5929c16b4_base

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
sDL_HasAltiVec = hs_bindgen_c02ac9b5929c16b4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasMMX@
foreign import ccall unsafe "hs_bindgen_28aa2bda36b5aa4c"
  hs_bindgen_28aa2bda36b5aa4c_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasMMX@
hs_bindgen_28aa2bda36b5aa4c :: IO BG.CBool
hs_bindgen_28aa2bda36b5aa4c =
  BG.fromFFIType hs_bindgen_28aa2bda36b5aa4c_base

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
sDL_HasMMX = hs_bindgen_28aa2bda36b5aa4c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasSSE@
foreign import ccall unsafe "hs_bindgen_eaac9231c0bcefbd"
  hs_bindgen_eaac9231c0bcefbd_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasSSE@
hs_bindgen_eaac9231c0bcefbd :: IO BG.CBool
hs_bindgen_eaac9231c0bcefbd =
  BG.fromFFIType hs_bindgen_eaac9231c0bcefbd_base

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
sDL_HasSSE = hs_bindgen_eaac9231c0bcefbd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasSSE2@
foreign import ccall unsafe "hs_bindgen_45752d13431081c5"
  hs_bindgen_45752d13431081c5_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasSSE2@
hs_bindgen_45752d13431081c5 :: IO BG.CBool
hs_bindgen_45752d13431081c5 =
  BG.fromFFIType hs_bindgen_45752d13431081c5_base

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
sDL_HasSSE2 = hs_bindgen_45752d13431081c5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasSSE3@
foreign import ccall unsafe "hs_bindgen_c6c39cde5a6c6617"
  hs_bindgen_c6c39cde5a6c6617_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasSSE3@
hs_bindgen_c6c39cde5a6c6617 :: IO BG.CBool
hs_bindgen_c6c39cde5a6c6617 =
  BG.fromFFIType hs_bindgen_c6c39cde5a6c6617_base

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
sDL_HasSSE3 = hs_bindgen_c6c39cde5a6c6617

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasSSE41@
foreign import ccall unsafe "hs_bindgen_e0ea6c3ffa969fb3"
  hs_bindgen_e0ea6c3ffa969fb3_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasSSE41@
hs_bindgen_e0ea6c3ffa969fb3 :: IO BG.CBool
hs_bindgen_e0ea6c3ffa969fb3 =
  BG.fromFFIType hs_bindgen_e0ea6c3ffa969fb3_base

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
sDL_HasSSE41 = hs_bindgen_e0ea6c3ffa969fb3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasSSE42@
foreign import ccall unsafe "hs_bindgen_963abd764eea230e"
  hs_bindgen_963abd764eea230e_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasSSE42@
hs_bindgen_963abd764eea230e :: IO BG.CBool
hs_bindgen_963abd764eea230e =
  BG.fromFFIType hs_bindgen_963abd764eea230e_base

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
sDL_HasSSE42 = hs_bindgen_963abd764eea230e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasAVX@
foreign import ccall unsafe "hs_bindgen_9fd691470d9db666"
  hs_bindgen_9fd691470d9db666_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasAVX@
hs_bindgen_9fd691470d9db666 :: IO BG.CBool
hs_bindgen_9fd691470d9db666 =
  BG.fromFFIType hs_bindgen_9fd691470d9db666_base

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
sDL_HasAVX = hs_bindgen_9fd691470d9db666

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasAVX2@
foreign import ccall unsafe "hs_bindgen_124690c686028ea3"
  hs_bindgen_124690c686028ea3_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasAVX2@
hs_bindgen_124690c686028ea3 :: IO BG.CBool
hs_bindgen_124690c686028ea3 =
  BG.fromFFIType hs_bindgen_124690c686028ea3_base

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
sDL_HasAVX2 = hs_bindgen_124690c686028ea3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasAVX512F@
foreign import ccall unsafe "hs_bindgen_3ae539db5deb14c3"
  hs_bindgen_3ae539db5deb14c3_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasAVX512F@
hs_bindgen_3ae539db5deb14c3 :: IO BG.CBool
hs_bindgen_3ae539db5deb14c3 =
  BG.fromFFIType hs_bindgen_3ae539db5deb14c3_base

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
sDL_HasAVX512F = hs_bindgen_3ae539db5deb14c3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasARMSIMD@
foreign import ccall unsafe "hs_bindgen_b00e33aa275d2caa"
  hs_bindgen_b00e33aa275d2caa_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasARMSIMD@
hs_bindgen_b00e33aa275d2caa :: IO BG.CBool
hs_bindgen_b00e33aa275d2caa =
  BG.fromFFIType hs_bindgen_b00e33aa275d2caa_base

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
sDL_HasARMSIMD = hs_bindgen_b00e33aa275d2caa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasNEON@
foreign import ccall unsafe "hs_bindgen_1bc7c765b1884ac6"
  hs_bindgen_1bc7c765b1884ac6_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasNEON@
hs_bindgen_1bc7c765b1884ac6 :: IO BG.CBool
hs_bindgen_1bc7c765b1884ac6 =
  BG.fromFFIType hs_bindgen_1bc7c765b1884ac6_base

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
sDL_HasNEON = hs_bindgen_1bc7c765b1884ac6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasLSX@
foreign import ccall unsafe "hs_bindgen_d7682979762c8eba"
  hs_bindgen_d7682979762c8eba_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasLSX@
hs_bindgen_d7682979762c8eba :: IO BG.CBool
hs_bindgen_d7682979762c8eba =
  BG.fromFFIType hs_bindgen_d7682979762c8eba_base

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
sDL_HasLSX = hs_bindgen_d7682979762c8eba

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasLASX@
foreign import ccall unsafe "hs_bindgen_d5a768a4b808f80b"
  hs_bindgen_d5a768a4b808f80b_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_HasLASX@
hs_bindgen_d5a768a4b808f80b :: IO BG.CBool
hs_bindgen_d5a768a4b808f80b =
  BG.fromFFIType hs_bindgen_d5a768a4b808f80b_base

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
sDL_HasLASX = hs_bindgen_d5a768a4b808f80b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_GetSystemRAM@
foreign import ccall unsafe "hs_bindgen_677c5a21a3ebeb42"
  hs_bindgen_677c5a21a3ebeb42_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_GetSystemRAM@
hs_bindgen_677c5a21a3ebeb42 :: IO BG.CInt
hs_bindgen_677c5a21a3ebeb42 =
  BG.fromFFIType hs_bindgen_677c5a21a3ebeb42_base

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
sDL_GetSystemRAM = hs_bindgen_677c5a21a3ebeb42

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_GetSIMDAlignment@
foreign import ccall unsafe "hs_bindgen_0e3c01d452c69d72"
  hs_bindgen_0e3c01d452c69d72_base
    :: IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_GetSIMDAlignment@
hs_bindgen_0e3c01d452c69d72 :: IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_0e3c01d452c69d72 =
  BG.fromFFIType hs_bindgen_0e3c01d452c69d72_base

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
sDL_GetSIMDAlignment = hs_bindgen_0e3c01d452c69d72

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_GetSystemPageSize@
foreign import ccall unsafe "hs_bindgen_d276a10dc866cd76"
  hs_bindgen_d276a10dc866cd76_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_Unsafe_SDL_GetSystemPageSize@
hs_bindgen_d276a10dc866cd76 :: IO BG.CInt
hs_bindgen_d276a10dc866cd76 =
  BG.fromFFIType hs_bindgen_d276a10dc866cd76_base

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
sDL_GetSystemPageSize = hs_bindgen_d276a10dc866cd76

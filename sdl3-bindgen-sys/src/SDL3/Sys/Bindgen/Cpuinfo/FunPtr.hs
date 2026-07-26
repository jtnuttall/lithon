{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Cpuinfo.FunPtr (
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_GetNumLogicalCPUCores,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_GetCPUCacheLineSize,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasAltiVec,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasMMX,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasSSE,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasSSE2,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasSSE3,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasSSE41,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasSSE42,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasAVX,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasAVX2,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasAVX512F,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasARMSIMD,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasNEON,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasLSX,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_HasLASX,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_GetSystemRAM,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_GetSIMDAlignment,
  SDL3.Sys.Bindgen.Cpuinfo.FunPtr.sDL_GetSystemPageSize,
)
where

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_cpuinfo.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetNumLogicalCPUCores */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_c4c2c993acb58488 (void)) (void)"
         , "{"
         , "  return &SDL_GetNumLogicalCPUCores;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetCPUCacheLineSize */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_2391090357def4cf (void)) (void)"
         , "{"
         , "  return &SDL_GetCPUCacheLineSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasAltiVec */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9f39d5a7368376a4 (void)) (void)"
         , "{"
         , "  return &SDL_HasAltiVec;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasMMX */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fa412e7652139df5 (void)) (void)"
         , "{"
         , "  return &SDL_HasMMX;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_05d08b5690b4e001 (void)) (void)"
         , "{"
         , "  return &SDL_HasSSE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE2 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ad213f4961990d26 (void)) (void)"
         , "{"
         , "  return &SDL_HasSSE2;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE3 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a58ea737867abc40 (void)) (void)"
         , "{"
         , "  return &SDL_HasSSE3;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE41 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_29ae5cbdbd616ec9 (void)) (void)"
         , "{"
         , "  return &SDL_HasSSE41;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE42 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a3625752abd98954 (void)) (void)"
         , "{"
         , "  return &SDL_HasSSE42;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasAVX */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b930b79d23d9a864 (void)) (void)"
         , "{"
         , "  return &SDL_HasAVX;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasAVX2 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7d7f442924af51db (void)) (void)"
         , "{"
         , "  return &SDL_HasAVX2;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasAVX512F */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_95bef25f1d596e41 (void)) (void)"
         , "{"
         , "  return &SDL_HasAVX512F;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasARMSIMD */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_37e83b09e5180d73 (void)) (void)"
         , "{"
         , "  return &SDL_HasARMSIMD;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasNEON */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f1637d681990a151 (void)) (void)"
         , "{"
         , "  return &SDL_HasNEON;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasLSX */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_aeeccb148a52761c (void)) (void)"
         , "{"
         , "  return &SDL_HasLSX;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasLASX */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d5a4bc1d40b5d505 (void)) (void)"
         , "{"
         , "  return &SDL_HasLASX;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetSystemRAM */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_393a56703dc32628 (void)) (void)"
         , "{"
         , "  return &SDL_GetSystemRAM;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetSIMDAlignment */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_893e4a7de858042c (void)) (void)"
         , "{"
         , "  return &SDL_GetSIMDAlignment;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetSystemPageSize */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_0f2dc2f831cb5d73 (void)) (void)"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_GetSystemPageSize;"
         , "#else"
         , "  SDL_SetError(\"SDL_GetSystemPageSize requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetNumLogicalCPUCores@
foreign import ccall unsafe "hs_bindgen_c4c2c993acb58488"
  hs_bindgen_c4c2c993acb58488_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetNumLogicalCPUCores@
hs_bindgen_c4c2c993acb58488 :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_c4c2c993acb58488 =
  BG.fromFFIType hs_bindgen_c4c2c993acb58488_base

{-# NOINLINE sDL_GetNumLogicalCPUCores #-}

-- | Get the number of logical CPU cores available.
--
--     [Returns]: the total number of logical CPU cores. On CPUs that include technologies such as hyperthreading, the number of logical cores may be more than the number of physical cores.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetNumLogicalCPUCores@, defined at @SDL3\/SDL_cpuinfo.h 73:33@
sDL_GetNumLogicalCPUCores :: BG.FunPtr (IO BG.CInt)
sDL_GetNumLogicalCPUCores =
  BG.unsafePerformIO hs_bindgen_c4c2c993acb58488

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetCPUCacheLineSize@
foreign import ccall unsafe "hs_bindgen_2391090357def4cf"
  hs_bindgen_2391090357def4cf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetCPUCacheLineSize@
hs_bindgen_2391090357def4cf :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_2391090357def4cf =
  BG.fromFFIType hs_bindgen_2391090357def4cf_base

{-# NOINLINE sDL_GetCPUCacheLineSize #-}

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
sDL_GetCPUCacheLineSize :: BG.FunPtr (IO BG.CInt)
sDL_GetCPUCacheLineSize =
  BG.unsafePerformIO hs_bindgen_2391090357def4cf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasAltiVec@
foreign import ccall unsafe "hs_bindgen_9f39d5a7368376a4"
  hs_bindgen_9f39d5a7368376a4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasAltiVec@
hs_bindgen_9f39d5a7368376a4 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_9f39d5a7368376a4 =
  BG.fromFFIType hs_bindgen_9f39d5a7368376a4_base

{-# NOINLINE sDL_HasAltiVec #-}

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
sDL_HasAltiVec :: BG.FunPtr (IO BG.CBool)
sDL_HasAltiVec =
  BG.unsafePerformIO hs_bindgen_9f39d5a7368376a4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasMMX@
foreign import ccall unsafe "hs_bindgen_fa412e7652139df5"
  hs_bindgen_fa412e7652139df5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasMMX@
hs_bindgen_fa412e7652139df5 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_fa412e7652139df5 =
  BG.fromFFIType hs_bindgen_fa412e7652139df5_base

{-# NOINLINE sDL_HasMMX #-}

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
sDL_HasMMX :: BG.FunPtr (IO BG.CBool)
sDL_HasMMX =
  BG.unsafePerformIO hs_bindgen_fa412e7652139df5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE@
foreign import ccall unsafe "hs_bindgen_05d08b5690b4e001"
  hs_bindgen_05d08b5690b4e001_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE@
hs_bindgen_05d08b5690b4e001 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_05d08b5690b4e001 =
  BG.fromFFIType hs_bindgen_05d08b5690b4e001_base

{-# NOINLINE sDL_HasSSE #-}

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
sDL_HasSSE :: BG.FunPtr (IO BG.CBool)
sDL_HasSSE =
  BG.unsafePerformIO hs_bindgen_05d08b5690b4e001

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE2@
foreign import ccall unsafe "hs_bindgen_ad213f4961990d26"
  hs_bindgen_ad213f4961990d26_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE2@
hs_bindgen_ad213f4961990d26 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_ad213f4961990d26 =
  BG.fromFFIType hs_bindgen_ad213f4961990d26_base

{-# NOINLINE sDL_HasSSE2 #-}

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
sDL_HasSSE2 :: BG.FunPtr (IO BG.CBool)
sDL_HasSSE2 =
  BG.unsafePerformIO hs_bindgen_ad213f4961990d26

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE3@
foreign import ccall unsafe "hs_bindgen_a58ea737867abc40"
  hs_bindgen_a58ea737867abc40_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE3@
hs_bindgen_a58ea737867abc40 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_a58ea737867abc40 =
  BG.fromFFIType hs_bindgen_a58ea737867abc40_base

{-# NOINLINE sDL_HasSSE3 #-}

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
sDL_HasSSE3 :: BG.FunPtr (IO BG.CBool)
sDL_HasSSE3 =
  BG.unsafePerformIO hs_bindgen_a58ea737867abc40

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE41@
foreign import ccall unsafe "hs_bindgen_29ae5cbdbd616ec9"
  hs_bindgen_29ae5cbdbd616ec9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE41@
hs_bindgen_29ae5cbdbd616ec9 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_29ae5cbdbd616ec9 =
  BG.fromFFIType hs_bindgen_29ae5cbdbd616ec9_base

{-# NOINLINE sDL_HasSSE41 #-}

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
sDL_HasSSE41 :: BG.FunPtr (IO BG.CBool)
sDL_HasSSE41 =
  BG.unsafePerformIO hs_bindgen_29ae5cbdbd616ec9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE42@
foreign import ccall unsafe "hs_bindgen_a3625752abd98954"
  hs_bindgen_a3625752abd98954_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasSSE42@
hs_bindgen_a3625752abd98954 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_a3625752abd98954 =
  BG.fromFFIType hs_bindgen_a3625752abd98954_base

{-# NOINLINE sDL_HasSSE42 #-}

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
sDL_HasSSE42 :: BG.FunPtr (IO BG.CBool)
sDL_HasSSE42 =
  BG.unsafePerformIO hs_bindgen_a3625752abd98954

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasAVX@
foreign import ccall unsafe "hs_bindgen_b930b79d23d9a864"
  hs_bindgen_b930b79d23d9a864_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasAVX@
hs_bindgen_b930b79d23d9a864 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_b930b79d23d9a864 =
  BG.fromFFIType hs_bindgen_b930b79d23d9a864_base

{-# NOINLINE sDL_HasAVX #-}

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
sDL_HasAVX :: BG.FunPtr (IO BG.CBool)
sDL_HasAVX =
  BG.unsafePerformIO hs_bindgen_b930b79d23d9a864

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasAVX2@
foreign import ccall unsafe "hs_bindgen_7d7f442924af51db"
  hs_bindgen_7d7f442924af51db_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasAVX2@
hs_bindgen_7d7f442924af51db :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_7d7f442924af51db =
  BG.fromFFIType hs_bindgen_7d7f442924af51db_base

{-# NOINLINE sDL_HasAVX2 #-}

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
sDL_HasAVX2 :: BG.FunPtr (IO BG.CBool)
sDL_HasAVX2 =
  BG.unsafePerformIO hs_bindgen_7d7f442924af51db

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasAVX512F@
foreign import ccall unsafe "hs_bindgen_95bef25f1d596e41"
  hs_bindgen_95bef25f1d596e41_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasAVX512F@
hs_bindgen_95bef25f1d596e41 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_95bef25f1d596e41 =
  BG.fromFFIType hs_bindgen_95bef25f1d596e41_base

{-# NOINLINE sDL_HasAVX512F #-}

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
sDL_HasAVX512F :: BG.FunPtr (IO BG.CBool)
sDL_HasAVX512F =
  BG.unsafePerformIO hs_bindgen_95bef25f1d596e41

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasARMSIMD@
foreign import ccall unsafe "hs_bindgen_37e83b09e5180d73"
  hs_bindgen_37e83b09e5180d73_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasARMSIMD@
hs_bindgen_37e83b09e5180d73 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_37e83b09e5180d73 =
  BG.fromFFIType hs_bindgen_37e83b09e5180d73_base

{-# NOINLINE sDL_HasARMSIMD #-}

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
sDL_HasARMSIMD :: BG.FunPtr (IO BG.CBool)
sDL_HasARMSIMD =
  BG.unsafePerformIO hs_bindgen_37e83b09e5180d73

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasNEON@
foreign import ccall unsafe "hs_bindgen_f1637d681990a151"
  hs_bindgen_f1637d681990a151_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasNEON@
hs_bindgen_f1637d681990a151 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_f1637d681990a151 =
  BG.fromFFIType hs_bindgen_f1637d681990a151_base

{-# NOINLINE sDL_HasNEON #-}

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
sDL_HasNEON :: BG.FunPtr (IO BG.CBool)
sDL_HasNEON =
  BG.unsafePerformIO hs_bindgen_f1637d681990a151

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasLSX@
foreign import ccall unsafe "hs_bindgen_aeeccb148a52761c"
  hs_bindgen_aeeccb148a52761c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasLSX@
hs_bindgen_aeeccb148a52761c :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_aeeccb148a52761c =
  BG.fromFFIType hs_bindgen_aeeccb148a52761c_base

{-# NOINLINE sDL_HasLSX #-}

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
sDL_HasLSX :: BG.FunPtr (IO BG.CBool)
sDL_HasLSX =
  BG.unsafePerformIO hs_bindgen_aeeccb148a52761c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasLASX@
foreign import ccall unsafe "hs_bindgen_d5a4bc1d40b5d505"
  hs_bindgen_d5a4bc1d40b5d505_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_HasLASX@
hs_bindgen_d5a4bc1d40b5d505 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_d5a4bc1d40b5d505 =
  BG.fromFFIType hs_bindgen_d5a4bc1d40b5d505_base

{-# NOINLINE sDL_HasLASX #-}

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
sDL_HasLASX :: BG.FunPtr (IO BG.CBool)
sDL_HasLASX =
  BG.unsafePerformIO hs_bindgen_d5a4bc1d40b5d505

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetSystemRAM@
foreign import ccall unsafe "hs_bindgen_393a56703dc32628"
  hs_bindgen_393a56703dc32628_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetSystemRAM@
hs_bindgen_393a56703dc32628 :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_393a56703dc32628 =
  BG.fromFFIType hs_bindgen_393a56703dc32628_base

{-# NOINLINE sDL_GetSystemRAM #-}

-- | Get the amount of RAM configured in the system.
--
--     [Returns]: the amount of RAM configured in the system in MiB.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSystemRAM@, defined at @SDL3\/SDL_cpuinfo.h 321:33@
sDL_GetSystemRAM :: BG.FunPtr (IO BG.CInt)
sDL_GetSystemRAM =
  BG.unsafePerformIO hs_bindgen_393a56703dc32628

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetSIMDAlignment@
foreign import ccall unsafe "hs_bindgen_893e4a7de858042c"
  hs_bindgen_893e4a7de858042c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetSIMDAlignment@
hs_bindgen_893e4a7de858042c :: IO (BG.FunPtr (IO HsBindgen.Runtime.LibC.CSize))
hs_bindgen_893e4a7de858042c =
  BG.fromFFIType hs_bindgen_893e4a7de858042c_base

{-# NOINLINE sDL_GetSIMDAlignment #-}

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
sDL_GetSIMDAlignment :: BG.FunPtr (IO HsBindgen.Runtime.LibC.CSize)
sDL_GetSIMDAlignment =
  BG.unsafePerformIO hs_bindgen_893e4a7de858042c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetSystemPageSize@
foreign import ccall unsafe "hs_bindgen_0f2dc2f831cb5d73"
  hs_bindgen_0f2dc2f831cb5d73_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Cpuinfo_get_SDL_GetSystemPageSize@
hs_bindgen_0f2dc2f831cb5d73 :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_0f2dc2f831cb5d73 =
  BG.fromFFIType hs_bindgen_0f2dc2f831cb5d73_base

{-# NOINLINE sDL_GetSystemPageSize #-}

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
sDL_GetSystemPageSize :: BG.FunPtr (IO BG.CInt)
sDL_GetSystemPageSize =
  BG.unsafePerformIO hs_bindgen_0f2dc2f831cb5d73

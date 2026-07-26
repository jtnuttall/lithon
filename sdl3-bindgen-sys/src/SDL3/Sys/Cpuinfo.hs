-- | CPU feature detection for SDL.
--
--     These functions are largely concerned with reporting if the system has access to various SIMD instruction sets, but also has other important info to share, such as system RAM size and number of logical CPU cores.
--
--     CPU instruction set checks, like @'hasSSE'@ and @'hasNEON'@, are available on all platforms, even if they don\'t make sense (an ARM processor will never have SSE and an x86 processor will never have NEON, for example, but these functions still exist and will simply return false in these cases). A guess for the cacheline size used for padding.
--
--     Most x86 processors have a 64 byte cache line. The 64-bit PowerPC processors have a 128 byte cache line. We use the larger value to be generally safe.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Cpuinfo.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Cpuinfo (
  module SDL3.Sys.Bindgen.Cpuinfo,

  -- * Function aliases
  SDL3.Sys.Cpuinfo.getNumLogicalCPUCores,
  SDL3.Sys.Cpuinfo.getNumLogicalCPUCoresSafe,
  SDL3.Sys.Cpuinfo.getCPUCacheLineSize,
  SDL3.Sys.Cpuinfo.getCPUCacheLineSizeSafe,
  SDL3.Sys.Cpuinfo.hasAltiVec,
  SDL3.Sys.Cpuinfo.hasAltiVecSafe,
  SDL3.Sys.Cpuinfo.hasMMX,
  SDL3.Sys.Cpuinfo.hasMMXSafe,
  SDL3.Sys.Cpuinfo.hasSSE,
  SDL3.Sys.Cpuinfo.hasSSESafe,
  SDL3.Sys.Cpuinfo.hasSSE2,
  SDL3.Sys.Cpuinfo.hasSSE2Safe,
  SDL3.Sys.Cpuinfo.hasSSE3,
  SDL3.Sys.Cpuinfo.hasSSE3Safe,
  SDL3.Sys.Cpuinfo.hasSSE41,
  SDL3.Sys.Cpuinfo.hasSSE41Safe,
  SDL3.Sys.Cpuinfo.hasSSE42,
  SDL3.Sys.Cpuinfo.hasSSE42Safe,
  SDL3.Sys.Cpuinfo.hasAVX,
  SDL3.Sys.Cpuinfo.hasAVXSafe,
  SDL3.Sys.Cpuinfo.hasAVX2,
  SDL3.Sys.Cpuinfo.hasAVX2Safe,
  SDL3.Sys.Cpuinfo.hasAVX512F,
  SDL3.Sys.Cpuinfo.hasAVX512FSafe,
  SDL3.Sys.Cpuinfo.hasARMSIMD,
  SDL3.Sys.Cpuinfo.hasARMSIMDSafe,
  SDL3.Sys.Cpuinfo.hasNEON,
  SDL3.Sys.Cpuinfo.hasNEONSafe,
  SDL3.Sys.Cpuinfo.hasLSX,
  SDL3.Sys.Cpuinfo.hasLSXSafe,
  SDL3.Sys.Cpuinfo.hasLASX,
  SDL3.Sys.Cpuinfo.hasLASXSafe,
  SDL3.Sys.Cpuinfo.getSystemRAM,
  SDL3.Sys.Cpuinfo.getSystemRAMSafe,
  SDL3.Sys.Cpuinfo.getSIMDAlignment,
  SDL3.Sys.Cpuinfo.getSIMDAlignmentSafe,
  SDL3.Sys.Cpuinfo.getSystemPageSize,
  SDL3.Sys.Cpuinfo.getSystemPageSizeSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Cpuinfo
import SDL3.Sys.Bindgen.Cpuinfo.Safe qualified as Safe
import SDL3.Sys.Bindgen.Cpuinfo.Unsafe qualified as Unsafe

-- | Get the number of logical CPU cores available.
--
--     [Returns]: the total number of logical CPU cores. On CPUs that include technologies such as hyperthreading, the number of logical cores may be more than the number of physical cores.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumLogicalCPUCores@.
--                   The safe flavor is 'getNumLogicalCPUCoresSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumLogicalCPUCores@, defined at @SDL3\/SDL_cpuinfo.h 73:33@
getNumLogicalCPUCores :: IO BG.Int32
getNumLogicalCPUCores =
  fmap Coerce.coerce Unsafe.sDL_GetNumLogicalCPUCores

-- | Get the number of logical CPU cores available.
--
--     [Returns]: the total number of logical CPU cores. On CPUs that include technologies such as hyperthreading, the number of logical cores may be more than the number of physical cores.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumLogicalCPUCores@.
--                   The unsafe flavor is 'getNumLogicalCPUCores'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumLogicalCPUCores@, defined at @SDL3\/SDL_cpuinfo.h 73:33@
getNumLogicalCPUCoresSafe :: IO BG.Int32
getNumLogicalCPUCoresSafe =
  fmap Coerce.coerce Safe.sDL_GetNumLogicalCPUCores

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCPUCacheLineSize@.
--                   The safe flavor is 'getCPUCacheLineSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetCPUCacheLineSize@, defined at @SDL3\/SDL_cpuinfo.h 87:33@
getCPUCacheLineSize :: IO BG.Int32
getCPUCacheLineSize =
  fmap Coerce.coerce Unsafe.sDL_GetCPUCacheLineSize

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCPUCacheLineSize@.
--                   The unsafe flavor is 'getCPUCacheLineSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetCPUCacheLineSize@, defined at @SDL3\/SDL_cpuinfo.h 87:33@
getCPUCacheLineSizeSafe :: IO BG.Int32
getCPUCacheLineSizeSafe =
  fmap Coerce.coerce Safe.sDL_GetCPUCacheLineSize

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasAltiVec@.
--                   The safe flavor is 'hasAltiVecSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasAltiVec@, defined at @SDL3\/SDL_cpuinfo.h 101:34@
hasAltiVec :: IO Bool
hasAltiVec = fmap CBool.toBool Unsafe.sDL_HasAltiVec

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasAltiVec@.
--                   The unsafe flavor is 'hasAltiVec'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasAltiVec@, defined at @SDL3\/SDL_cpuinfo.h 101:34@
hasAltiVecSafe :: IO Bool
hasAltiVecSafe =
  fmap CBool.toBool Safe.sDL_HasAltiVec

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasMMX@.
--                   The safe flavor is 'hasMMXSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasMMX@, defined at @SDL3\/SDL_cpuinfo.h 114:34@
hasMMX :: IO Bool
hasMMX = fmap CBool.toBool Unsafe.sDL_HasMMX

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasMMX@.
--                   The unsafe flavor is 'hasMMX'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasMMX@, defined at @SDL3\/SDL_cpuinfo.h 114:34@
hasMMXSafe :: IO Bool
hasMMXSafe = fmap CBool.toBool Safe.sDL_HasMMX

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
--     [See also]: 'hasSSE2', 'hasSSE3', 'hasSSE41', 'hasSSE42'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasSSE@.
--                   The safe flavor is 'hasSSESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasSSE@, defined at @SDL3\/SDL_cpuinfo.h 132:34@
hasSSE :: IO Bool
hasSSE = fmap CBool.toBool Unsafe.sDL_HasSSE

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
--     [See also]: 'hasSSE2', 'hasSSE3', 'hasSSE41', 'hasSSE42'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasSSE@.
--                   The unsafe flavor is 'hasSSE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasSSE@, defined at @SDL3\/SDL_cpuinfo.h 132:34@
hasSSESafe :: IO Bool
hasSSESafe = fmap CBool.toBool Safe.sDL_HasSSE

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
--     [See also]: 'hasSSE', 'hasSSE3', 'hasSSE41', 'hasSSE42'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasSSE2@.
--                   The safe flavor is 'hasSSE2Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasSSE2@, defined at @SDL3\/SDL_cpuinfo.h 150:34@
hasSSE2 :: IO Bool
hasSSE2 = fmap CBool.toBool Unsafe.sDL_HasSSE2

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
--     [See also]: 'hasSSE', 'hasSSE3', 'hasSSE41', 'hasSSE42'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasSSE2@.
--                   The unsafe flavor is 'hasSSE2'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasSSE2@, defined at @SDL3\/SDL_cpuinfo.h 150:34@
hasSSE2Safe :: IO Bool
hasSSE2Safe = fmap CBool.toBool Safe.sDL_HasSSE2

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
--     [See also]: 'hasSSE', 'hasSSE2', 'hasSSE41', 'hasSSE42'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasSSE3@.
--                   The safe flavor is 'hasSSE3Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasSSE3@, defined at @SDL3\/SDL_cpuinfo.h 168:34@
hasSSE3 :: IO Bool
hasSSE3 = fmap CBool.toBool Unsafe.sDL_HasSSE3

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
--     [See also]: 'hasSSE', 'hasSSE2', 'hasSSE41', 'hasSSE42'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasSSE3@.
--                   The unsafe flavor is 'hasSSE3'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasSSE3@, defined at @SDL3\/SDL_cpuinfo.h 168:34@
hasSSE3Safe :: IO Bool
hasSSE3Safe = fmap CBool.toBool Safe.sDL_HasSSE3

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
--     [See also]: 'hasSSE', 'hasSSE2', 'hasSSE3', 'hasSSE42'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasSSE41@.
--                   The safe flavor is 'hasSSE41Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasSSE41@, defined at @SDL3\/SDL_cpuinfo.h 186:34@
hasSSE41 :: IO Bool
hasSSE41 = fmap CBool.toBool Unsafe.sDL_HasSSE41

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
--     [See also]: 'hasSSE', 'hasSSE2', 'hasSSE3', 'hasSSE42'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasSSE41@.
--                   The unsafe flavor is 'hasSSE41'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasSSE41@, defined at @SDL3\/SDL_cpuinfo.h 186:34@
hasSSE41Safe :: IO Bool
hasSSE41Safe = fmap CBool.toBool Safe.sDL_HasSSE41

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
--     [See also]: 'hasSSE', 'hasSSE2', 'hasSSE3', 'hasSSE41'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasSSE42@.
--                   The safe flavor is 'hasSSE42Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasSSE42@, defined at @SDL3\/SDL_cpuinfo.h 204:34@
hasSSE42 :: IO Bool
hasSSE42 = fmap CBool.toBool Unsafe.sDL_HasSSE42

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
--     [See also]: 'hasSSE', 'hasSSE2', 'hasSSE3', 'hasSSE41'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasSSE42@.
--                   The unsafe flavor is 'hasSSE42'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasSSE42@, defined at @SDL3\/SDL_cpuinfo.h 204:34@
hasSSE42Safe :: IO Bool
hasSSE42Safe = fmap CBool.toBool Safe.sDL_HasSSE42

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
--     [See also]: 'hasAVX2', 'hasAVX512F'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasAVX@.
--                   The safe flavor is 'hasAVXSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasAVX@, defined at @SDL3\/SDL_cpuinfo.h 220:34@
hasAVX :: IO Bool
hasAVX = fmap CBool.toBool Unsafe.sDL_HasAVX

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
--     [See also]: 'hasAVX2', 'hasAVX512F'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasAVX@.
--                   The unsafe flavor is 'hasAVX'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasAVX@, defined at @SDL3\/SDL_cpuinfo.h 220:34@
hasAVXSafe :: IO Bool
hasAVXSafe = fmap CBool.toBool Safe.sDL_HasAVX

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
--     [See also]: 'hasAVX', 'hasAVX512F'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasAVX2@.
--                   The safe flavor is 'hasAVX2Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasAVX2@, defined at @SDL3\/SDL_cpuinfo.h 236:34@
hasAVX2 :: IO Bool
hasAVX2 = fmap CBool.toBool Unsafe.sDL_HasAVX2

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
--     [See also]: 'hasAVX', 'hasAVX512F'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasAVX2@.
--                   The unsafe flavor is 'hasAVX2'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasAVX2@, defined at @SDL3\/SDL_cpuinfo.h 236:34@
hasAVX2Safe :: IO Bool
hasAVX2Safe = fmap CBool.toBool Safe.sDL_HasAVX2

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
--     [See also]: 'hasAVX', 'hasAVX2'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasAVX512F@.
--                   The safe flavor is 'hasAVX512FSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasAVX512F@, defined at @SDL3\/SDL_cpuinfo.h 252:34@
hasAVX512F :: IO Bool
hasAVX512F = fmap CBool.toBool Unsafe.sDL_HasAVX512F

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
--     [See also]: 'hasAVX', 'hasAVX2'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasAVX512F@.
--                   The unsafe flavor is 'hasAVX512F'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasAVX512F@, defined at @SDL3\/SDL_cpuinfo.h 252:34@
hasAVX512FSafe :: IO Bool
hasAVX512FSafe =
  fmap CBool.toBool Safe.sDL_HasAVX512F

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
--     [See also]: 'hasNEON'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasARMSIMD@.
--                   The safe flavor is 'hasARMSIMDSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasARMSIMD@, defined at @SDL3\/SDL_cpuinfo.h 269:34@
hasARMSIMD :: IO Bool
hasARMSIMD = fmap CBool.toBool Unsafe.sDL_HasARMSIMD

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
--     [See also]: 'hasNEON'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasARMSIMD@.
--                   The unsafe flavor is 'hasARMSIMD'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasARMSIMD@, defined at @SDL3\/SDL_cpuinfo.h 269:34@
hasARMSIMDSafe :: IO Bool
hasARMSIMDSafe =
  fmap CBool.toBool Safe.sDL_HasARMSIMD

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasNEON@.
--                   The safe flavor is 'hasNEONSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasNEON@, defined at @SDL3\/SDL_cpuinfo.h 282:34@
hasNEON :: IO Bool
hasNEON = fmap CBool.toBool Unsafe.sDL_HasNEON

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasNEON@.
--                   The unsafe flavor is 'hasNEON'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasNEON@, defined at @SDL3\/SDL_cpuinfo.h 282:34@
hasNEONSafe :: IO Bool
hasNEONSafe = fmap CBool.toBool Safe.sDL_HasNEON

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasLSX@.
--                   The safe flavor is 'hasLSXSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasLSX@, defined at @SDL3\/SDL_cpuinfo.h 296:34@
hasLSX :: IO Bool
hasLSX = fmap CBool.toBool Unsafe.sDL_HasLSX

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasLSX@.
--                   The unsafe flavor is 'hasLSX'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasLSX@, defined at @SDL3\/SDL_cpuinfo.h 296:34@
hasLSXSafe :: IO Bool
hasLSXSafe = fmap CBool.toBool Safe.sDL_HasLSX

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasLASX@.
--                   The safe flavor is 'hasLASXSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasLASX@, defined at @SDL3\/SDL_cpuinfo.h 310:34@
hasLASX :: IO Bool
hasLASX = fmap CBool.toBool Unsafe.sDL_HasLASX

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasLASX@.
--                   The unsafe flavor is 'hasLASX'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasLASX@, defined at @SDL3\/SDL_cpuinfo.h 310:34@
hasLASXSafe :: IO Bool
hasLASXSafe = fmap CBool.toBool Safe.sDL_HasLASX

-- | Get the amount of RAM configured in the system.
--
--     [Returns]: the amount of RAM configured in the system in MiB.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSystemRAM@.
--                   The safe flavor is 'getSystemRAMSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSystemRAM@, defined at @SDL3\/SDL_cpuinfo.h 321:33@
getSystemRAM :: IO BG.Int32
getSystemRAM =
  fmap Coerce.coerce Unsafe.sDL_GetSystemRAM

-- | Get the amount of RAM configured in the system.
--
--     [Returns]: the amount of RAM configured in the system in MiB.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSystemRAM@.
--                   The unsafe flavor is 'getSystemRAM'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSystemRAM@, defined at @SDL3\/SDL_cpuinfo.h 321:33@
getSystemRAMSafe :: IO BG.Int32
getSystemRAMSafe =
  fmap Coerce.coerce Safe.sDL_GetSystemRAM

-- | Report the alignment this system needs for SIMD allocations.
--
--     This will return the minimum number of bytes to which a pointer must be aligned to be compatible with SIMD instructions on the current machine. For example, if the machine supports SSE only, it will return 16, but if it supports AVX-512F, it\'ll return 64 (etc). This only reports values for instruction sets SDL knows about, so if your SDL build doesn\'t have @'hasAVX512F'@, then it might return 16 for the SSE support it sees and not 64 for the AVX-512 instructions that exist but SDL doesn\'t know about. Plan accordingly.
--
--     [Returns]: the alignment in bytes needed for available, known SIMD instructions.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Stdinc.alignedAlloc', 'SDL3.Sys.Stdinc.alignedFree'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSIMDAlignment@.
--                   The safe flavor is 'getSIMDAlignmentSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSIMDAlignment@, defined at @SDL3\/SDL_cpuinfo.h 345:36@
getSIMDAlignment :: IO BG.Word64
getSIMDAlignment =
  fmap Coerce.coerce Unsafe.sDL_GetSIMDAlignment

-- | Report the alignment this system needs for SIMD allocations.
--
--     This will return the minimum number of bytes to which a pointer must be aligned to be compatible with SIMD instructions on the current machine. For example, if the machine supports SSE only, it will return 16, but if it supports AVX-512F, it\'ll return 64 (etc). This only reports values for instruction sets SDL knows about, so if your SDL build doesn\'t have @'hasAVX512F'@, then it might return 16 for the SSE support it sees and not 64 for the AVX-512 instructions that exist but SDL doesn\'t know about. Plan accordingly.
--
--     [Returns]: the alignment in bytes needed for available, known SIMD instructions.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Stdinc.alignedAlloc', 'SDL3.Sys.Stdinc.alignedFree'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSIMDAlignment@.
--                   The unsafe flavor is 'getSIMDAlignment'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSIMDAlignment@, defined at @SDL3\/SDL_cpuinfo.h 345:36@
getSIMDAlignmentSafe :: IO BG.Word64
getSIMDAlignmentSafe =
  fmap Coerce.coerce Safe.sDL_GetSIMDAlignment

-- | Report the size of a page of memory.
--
--     Different platforms might have different memory page sizes. In current times, 4 kilobytes is not unusual, but newer systems are moving to larger page sizes, and esoteric platforms might have any unexpected size.
--
--     Note that this function can return 0, which means SDL can\'t determine the page size on this platform. It will /not/ set an error string to be retrieved with 'SDL3.Sys.Error.getError' in this case! In this case, defaulting to 4096 is often a reasonable option.
--
--     [Returns]: the size of a single page of memory, in bytes, or 0 if SDL can\'t determine this information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSystemPageSize@.
--                   The safe flavor is 'getSystemPageSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSystemPageSize@, defined at @SDL3\/SDL_cpuinfo.h 366:33@
getSystemPageSize :: IO BG.Int32
getSystemPageSize =
  fmap Coerce.coerce Unsafe.sDL_GetSystemPageSize

-- | Report the size of a page of memory.
--
--     Different platforms might have different memory page sizes. In current times, 4 kilobytes is not unusual, but newer systems are moving to larger page sizes, and esoteric platforms might have any unexpected size.
--
--     Note that this function can return 0, which means SDL can\'t determine the page size on this platform. It will /not/ set an error string to be retrieved with 'SDL3.Sys.Error.getError' in this case! In this case, defaulting to 4096 is often a reasonable option.
--
--     [Returns]: the size of a single page of memory, in bytes, or 0 if SDL can\'t determine this information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSystemPageSize@.
--                   The unsafe flavor is 'getSystemPageSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSystemPageSize@, defined at @SDL3\/SDL_cpuinfo.h 366:33@
getSystemPageSizeSafe :: IO BG.Int32
getSystemPageSizeSafe =
  fmap Coerce.coerce Safe.sDL_GetSystemPageSize

-- | SDL\'s C-library replacements: memory, strings, math, and conversions.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Stdinc.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Stdinc (
  module SDL3.Sys.Bindgen.Stdinc,

  -- * Function aliases
  SDL3.Sys.Stdinc.malloc,
  SDL3.Sys.Stdinc.mallocSafe,
  SDL3.Sys.Stdinc.calloc,
  SDL3.Sys.Stdinc.callocSafe,
  SDL3.Sys.Stdinc.realloc,
  SDL3.Sys.Stdinc.reallocSafe,
  SDL3.Sys.Stdinc.free,
  SDL3.Sys.Stdinc.freeSafe,
  SDL3.Sys.Stdinc.getOriginalMemoryFunctions,
  SDL3.Sys.Stdinc.getOriginalMemoryFunctionsSafe,
  SDL3.Sys.Stdinc.getMemoryFunctions,
  SDL3.Sys.Stdinc.getMemoryFunctionsSafe,
  SDL3.Sys.Stdinc.setMemoryFunctions,
  SDL3.Sys.Stdinc.setMemoryFunctionsSafe,
  SDL3.Sys.Stdinc.alignedAlloc,
  SDL3.Sys.Stdinc.alignedAllocSafe,
  SDL3.Sys.Stdinc.alignedFree,
  SDL3.Sys.Stdinc.alignedFreeSafe,
  SDL3.Sys.Stdinc.getNumAllocations,
  SDL3.Sys.Stdinc.getNumAllocationsSafe,
  SDL3.Sys.Stdinc.getEnvironment,
  SDL3.Sys.Stdinc.getEnvironmentSafe,
  SDL3.Sys.Stdinc.createEnvironment,
  SDL3.Sys.Stdinc.createEnvironmentSafe,
  SDL3.Sys.Stdinc.getEnvironmentVariable,
  SDL3.Sys.Stdinc.getEnvironmentVariableSafe,
  SDL3.Sys.Stdinc.getEnvironmentVariables,
  SDL3.Sys.Stdinc.getEnvironmentVariablesSafe,
  SDL3.Sys.Stdinc.setEnvironmentVariable,
  SDL3.Sys.Stdinc.setEnvironmentVariableSafe,
  SDL3.Sys.Stdinc.unsetEnvironmentVariable,
  SDL3.Sys.Stdinc.unsetEnvironmentVariableSafe,
  SDL3.Sys.Stdinc.destroyEnvironment,
  SDL3.Sys.Stdinc.destroyEnvironmentSafe,
  SDL3.Sys.Stdinc.getenv,
  SDL3.Sys.Stdinc.getenvSafe,
  SDL3.Sys.Stdinc.getenvUnsafe,
  SDL3.Sys.Stdinc.getenvUnsafeSafe,
  SDL3.Sys.Stdinc.setenvUnsafe,
  SDL3.Sys.Stdinc.setenvUnsafeSafe,
  SDL3.Sys.Stdinc.unsetenvUnsafe,
  SDL3.Sys.Stdinc.unsetenvUnsafeSafe,
  SDL3.Sys.Stdinc.qsortSafe,
  SDL3.Sys.Stdinc.bsearchSafe,
  SDL3.Sys.Stdinc.qsortRSafe,
  SDL3.Sys.Stdinc.bsearchRSafe,
  SDL3.Sys.Stdinc.abs,
  SDL3.Sys.Stdinc.isalpha,
  SDL3.Sys.Stdinc.isalnum,
  SDL3.Sys.Stdinc.isblank,
  SDL3.Sys.Stdinc.iscntrl,
  SDL3.Sys.Stdinc.isdigit,
  SDL3.Sys.Stdinc.isxdigit,
  SDL3.Sys.Stdinc.ispunct,
  SDL3.Sys.Stdinc.isspace,
  SDL3.Sys.Stdinc.isupper,
  SDL3.Sys.Stdinc.islower,
  SDL3.Sys.Stdinc.isprint,
  SDL3.Sys.Stdinc.isgraph,
  SDL3.Sys.Stdinc.toupper,
  SDL3.Sys.Stdinc.tolower,
  SDL3.Sys.Stdinc.crc16,
  SDL3.Sys.Stdinc.crc16Safe,
  SDL3.Sys.Stdinc.crc32,
  SDL3.Sys.Stdinc.crc32Safe,
  SDL3.Sys.Stdinc.murmur3_32,
  SDL3.Sys.Stdinc.murmur3_32Safe,
  SDL3.Sys.Stdinc.memset4,
  SDL3.Sys.Stdinc.memset4Safe,
  SDL3.Sys.Stdinc.memcmp,
  SDL3.Sys.Stdinc.memcmpSafe,
  SDL3.Sys.Stdinc.wcslen,
  SDL3.Sys.Stdinc.wcsnlen,
  SDL3.Sys.Stdinc.wcslcpy,
  SDL3.Sys.Stdinc.wcslcat,
  SDL3.Sys.Stdinc.wcsdup,
  SDL3.Sys.Stdinc.wcsdupSafe,
  SDL3.Sys.Stdinc.wcsstr,
  SDL3.Sys.Stdinc.wcsnstr,
  SDL3.Sys.Stdinc.wcscmp,
  SDL3.Sys.Stdinc.wcsncmp,
  SDL3.Sys.Stdinc.wcscasecmp,
  SDL3.Sys.Stdinc.wcsncasecmp,
  SDL3.Sys.Stdinc.strlen,
  SDL3.Sys.Stdinc.strnlen,
  SDL3.Sys.Stdinc.strlcpy,
  SDL3.Sys.Stdinc.utf8strlcpy,
  SDL3.Sys.Stdinc.strlcat,
  SDL3.Sys.Stdinc.strdup,
  SDL3.Sys.Stdinc.strdupSafe,
  SDL3.Sys.Stdinc.strndup,
  SDL3.Sys.Stdinc.strndupSafe,
  SDL3.Sys.Stdinc.strrev,
  SDL3.Sys.Stdinc.strupr,
  SDL3.Sys.Stdinc.strlwr,
  SDL3.Sys.Stdinc.strchr,
  SDL3.Sys.Stdinc.strrchr,
  SDL3.Sys.Stdinc.strstr,
  SDL3.Sys.Stdinc.strnstr,
  SDL3.Sys.Stdinc.strcasestr,
  SDL3.Sys.Stdinc.strtokR,
  SDL3.Sys.Stdinc.utf8strlen,
  SDL3.Sys.Stdinc.utf8strnlen,
  SDL3.Sys.Stdinc.itoa,
  SDL3.Sys.Stdinc.uitoa,
  SDL3.Sys.Stdinc.lltoa,
  SDL3.Sys.Stdinc.ulltoa,
  SDL3.Sys.Stdinc.atoi,
  SDL3.Sys.Stdinc.atof,
  SDL3.Sys.Stdinc.strtoll,
  SDL3.Sys.Stdinc.strtoull,
  SDL3.Sys.Stdinc.strtod,
  SDL3.Sys.Stdinc.strcmp,
  SDL3.Sys.Stdinc.strncmp,
  SDL3.Sys.Stdinc.strcasecmp,
  SDL3.Sys.Stdinc.strncasecmp,
  SDL3.Sys.Stdinc.strpbrk,
  SDL3.Sys.Stdinc.stepUTF8,
  SDL3.Sys.Stdinc.stepBackUTF8,
  SDL3.Sys.Stdinc.ucs4ToUTF8,
  SDL3.Sys.Stdinc.srand,
  SDL3.Sys.Stdinc.srandSafe,
  SDL3.Sys.Stdinc.rand,
  SDL3.Sys.Stdinc.randSafe,
  SDL3.Sys.Stdinc.randf,
  SDL3.Sys.Stdinc.randfSafe,
  SDL3.Sys.Stdinc.randBits,
  SDL3.Sys.Stdinc.randBitsSafe,
  SDL3.Sys.Stdinc.randR,
  SDL3.Sys.Stdinc.randRSafe,
  SDL3.Sys.Stdinc.randfR,
  SDL3.Sys.Stdinc.randfRSafe,
  SDL3.Sys.Stdinc.randBitsR,
  SDL3.Sys.Stdinc.randBitsRSafe,
  SDL3.Sys.Stdinc.acos,
  SDL3.Sys.Stdinc.acosf,
  SDL3.Sys.Stdinc.asin,
  SDL3.Sys.Stdinc.asinf,
  SDL3.Sys.Stdinc.atan,
  SDL3.Sys.Stdinc.atanf,
  SDL3.Sys.Stdinc.atan2,
  SDL3.Sys.Stdinc.atan2f,
  SDL3.Sys.Stdinc.ceil,
  SDL3.Sys.Stdinc.ceilf,
  SDL3.Sys.Stdinc.copysign,
  SDL3.Sys.Stdinc.copysignf,
  SDL3.Sys.Stdinc.cos,
  SDL3.Sys.Stdinc.cosf,
  SDL3.Sys.Stdinc.exp,
  SDL3.Sys.Stdinc.expf,
  SDL3.Sys.Stdinc.fabs,
  SDL3.Sys.Stdinc.fabsf,
  SDL3.Sys.Stdinc.floor,
  SDL3.Sys.Stdinc.floorf,
  SDL3.Sys.Stdinc.trunc,
  SDL3.Sys.Stdinc.truncf,
  SDL3.Sys.Stdinc.fmod,
  SDL3.Sys.Stdinc.fmodf,
  SDL3.Sys.Stdinc.isinf,
  SDL3.Sys.Stdinc.isinff,
  SDL3.Sys.Stdinc.isnan,
  SDL3.Sys.Stdinc.isnanf,
  SDL3.Sys.Stdinc.log,
  SDL3.Sys.Stdinc.logf,
  SDL3.Sys.Stdinc.log10,
  SDL3.Sys.Stdinc.log10f,
  SDL3.Sys.Stdinc.modf,
  SDL3.Sys.Stdinc.modff,
  SDL3.Sys.Stdinc.pow,
  SDL3.Sys.Stdinc.powf,
  SDL3.Sys.Stdinc.round,
  SDL3.Sys.Stdinc.roundf,
  SDL3.Sys.Stdinc.scalbn,
  SDL3.Sys.Stdinc.scalbnf,
  SDL3.Sys.Stdinc.sin,
  SDL3.Sys.Stdinc.sinf,
  SDL3.Sys.Stdinc.sqrt,
  SDL3.Sys.Stdinc.sqrtf,
  SDL3.Sys.Stdinc.tan,
  SDL3.Sys.Stdinc.tanf,
  SDL3.Sys.Stdinc.iconvOpen,
  SDL3.Sys.Stdinc.iconvOpenSafe,
  SDL3.Sys.Stdinc.iconvClose,
  SDL3.Sys.Stdinc.iconvCloseSafe,
  SDL3.Sys.Stdinc.iconv,
  SDL3.Sys.Stdinc.iconvSafe,
  SDL3.Sys.Stdinc.iconvString,
  SDL3.Sys.Stdinc.iconvStringSafe,
  SDL3.Sys.Stdinc.sizeMulCheckOverflowBuiltin,
  SDL3.Sys.Stdinc.sizeMulCheckOverflowBuiltinSafe,
  SDL3.Sys.Stdinc.sizeAddCheckOverflowBuiltin,
  SDL3.Sys.Stdinc.sizeAddCheckOverflowBuiltinSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Stdinc
import SDL3.Sys.Bindgen.Stdinc.Safe qualified as Safe
import SDL3.Sys.Bindgen.Stdinc.Unsafe qualified as Unsafe

-- | Allocate uninitialized memory.
--
--     The allocated memory returned by this function must be freed with @'free'@.
--
--     If @size@ is 0, it will be set to 1.
--
--     If the allocation is successful, the returned pointer is guaranteed to be aligned to either the /fundamental alignment/ (@alignof(max_align_t)@ in C11 and later) or @2 * sizeof(void *)@, whichever is smaller. Use @'alignedAlloc'@ if you need to allocate memory aligned to an alignment greater than this guarantee.
--
--     [Returns]: a pointer to the allocated memory, or NULL if allocation failed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'free', 'calloc', 'realloc', 'alignedAlloc'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_malloc@.
--                   The safe flavor is 'mallocSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_malloc@, defined at @SDL3\/SDL_stdinc.h 1341:47@
malloc
  :: BG.Word64
  -- ^
  --
  --           [@size@]: the size to allocate.
  -> IO (BG.Ptr BG.Void)
malloc =
  \x00 -> Unsafe.sDL_malloc (Coerce.coerce x00)

-- | Allocate uninitialized memory.
--
--     The allocated memory returned by this function must be freed with @'free'@.
--
--     If @size@ is 0, it will be set to 1.
--
--     If the allocation is successful, the returned pointer is guaranteed to be aligned to either the /fundamental alignment/ (@alignof(max_align_t)@ in C11 and later) or @2 * sizeof(void *)@, whichever is smaller. Use @'alignedAlloc'@ if you need to allocate memory aligned to an alignment greater than this guarantee.
--
--     [Returns]: a pointer to the allocated memory, or NULL if allocation failed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'free', 'calloc', 'realloc', 'alignedAlloc'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_malloc@.
--                   The unsafe flavor is 'malloc'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_malloc@, defined at @SDL3\/SDL_stdinc.h 1341:47@
mallocSafe
  :: BG.Word64
  -- ^
  --
  --           [@size@]: the size to allocate.
  -> IO (BG.Ptr BG.Void)
mallocSafe =
  \x00 -> Safe.sDL_malloc (Coerce.coerce x00)

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_calloc@.
--                   The safe flavor is 'callocSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_calloc@, defined at @SDL3\/SDL_stdinc.h 1366:69@
calloc
  :: BG.Word64
  -- ^ [C declaration]: @nmemb@
  -> BG.Word64
  -- ^ [C declaration]: @size@
  -> IO (BG.Ptr BG.Void)
calloc =
  \x00 ->
    \x11 ->
      Unsafe.sDL_calloc (Coerce.coerce x00) (Coerce.coerce x11)

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_calloc@.
--                   The unsafe flavor is 'calloc'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_calloc@, defined at @SDL3\/SDL_stdinc.h 1366:69@
callocSafe
  :: BG.Word64
  -- ^ [C declaration]: @nmemb@
  -> BG.Word64
  -- ^ [C declaration]: @size@
  -> IO (BG.Ptr BG.Void)
callocSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_calloc (Coerce.coerce x00) (Coerce.coerce x11)

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_realloc@.
--                   The safe flavor is 'reallocSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_realloc@, defined at @SDL3\/SDL_stdinc.h 1406:54@
realloc
  :: BG.Ptr BG.Void
  -- ^ [C declaration]: @mem@
  -> BG.Word64
  -- ^ [C declaration]: @size@
  -> IO (BG.Ptr BG.Void)
realloc =
  \x00 ->
    \x11 -> Unsafe.sDL_realloc x00 (Coerce.coerce x11)

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_realloc@.
--                   The unsafe flavor is 'realloc'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_realloc@, defined at @SDL3\/SDL_stdinc.h 1406:54@
reallocSafe
  :: BG.Ptr BG.Void
  -- ^ [C declaration]: @mem@
  -> BG.Word64
  -- ^ [C declaration]: @size@
  -> IO (BG.Ptr BG.Void)
reallocSafe =
  \x00 ->
    \x11 -> Safe.sDL_realloc x00 (Coerce.coerce x11)

-- | Free allocated memory.
--
--     The pointer is no longer valid after this call and cannot be dereferenced anymore.
--
--     If @mem@ is NULL, this function does nothing.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'malloc', 'calloc', 'realloc'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_free@.
--                   The safe flavor is 'freeSafe'
--                   .
--
--     [C declaration]: @SDL_free@, defined at @SDL3\/SDL_stdinc.h 1426:34@
free
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@mem@]: a pointer to allocated memory, or NULL.
  -> IO ()
free = Unsafe.sDL_free

-- | Free allocated memory.
--
--     The pointer is no longer valid after this call and cannot be dereferenced anymore.
--
--     If @mem@ is NULL, this function does nothing.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'malloc', 'calloc', 'realloc'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_free@.
--                   The unsafe flavor is 'free'
--                   .
--
--     [C declaration]: @SDL_free@, defined at @SDL3\/SDL_stdinc.h 1426:34@
freeSafe
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@mem@]: a pointer to allocated memory, or NULL.
  -> IO ()
freeSafe = Safe.sDL_free

-- | Get the original set of SDL memory functions.
--
--     This is what 'malloc' and friends will use by default, if there has been no call to 'setMemoryFunctions'. This is not necessarily using the C runtime\'s @malloc@ functions behind the scenes! Different platforms and build configurations might do any number of unexpected things.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetOriginalMemoryFunctions@.
--                   The safe flavor is 'getOriginalMemoryFunctionsSafe'
--                   .
--
--     [C declaration]: @SDL_GetOriginalMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1524:34@
getOriginalMemoryFunctions
  :: BG.Ptr SDL_malloc_func
  -- ^
  --
  --           [@malloc_func@]: filled with malloc function.
  -> BG.Ptr SDL_calloc_func
  -- ^
  --
  --           [@calloc_func@]: filled with calloc function.
  -> BG.Ptr SDL_realloc_func
  -- ^
  --
  --           [@realloc_func@]: filled with realloc function.
  -> BG.Ptr SDL_free_func
  -- ^
  --
  --           [@free_func@]: filled with free function.
  -> IO ()
getOriginalMemoryFunctions =
  Unsafe.sDL_GetOriginalMemoryFunctions

-- | Get the original set of SDL memory functions.
--
--     This is what 'malloc' and friends will use by default, if there has been no call to 'setMemoryFunctions'. This is not necessarily using the C runtime\'s @malloc@ functions behind the scenes! Different platforms and build configurations might do any number of unexpected things.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetOriginalMemoryFunctions@.
--                   The unsafe flavor is 'getOriginalMemoryFunctions'
--                   .
--
--     [C declaration]: @SDL_GetOriginalMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1524:34@
getOriginalMemoryFunctionsSafe
  :: BG.Ptr SDL_malloc_func
  -- ^
  --
  --           [@malloc_func@]: filled with malloc function.
  -> BG.Ptr SDL_calloc_func
  -- ^
  --
  --           [@calloc_func@]: filled with calloc function.
  -> BG.Ptr SDL_realloc_func
  -- ^
  --
  --           [@realloc_func@]: filled with realloc function.
  -> BG.Ptr SDL_free_func
  -- ^
  --
  --           [@free_func@]: filled with free function.
  -> IO ()
getOriginalMemoryFunctionsSafe =
  Safe.sDL_GetOriginalMemoryFunctions

-- | Get the current set of SDL memory functions.
--
--     [Thread safety]: This does not hold a lock, so do not call this in the unlikely event of a background thread calling 'setMemoryFunctions' simultaneously.
--
--     @since 3.2.0
--
--     [See also]: 'setMemoryFunctions', 'getOriginalMemoryFunctions'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetMemoryFunctions@.
--                   The safe flavor is 'getMemoryFunctionsSafe'
--                   .
--
--     [C declaration]: @SDL_GetMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1546:34@
getMemoryFunctions
  :: BG.Ptr SDL_malloc_func
  -- ^
  --
  --           [@malloc_func@]: filled with malloc function.
  -> BG.Ptr SDL_calloc_func
  -- ^
  --
  --           [@calloc_func@]: filled with calloc function.
  -> BG.Ptr SDL_realloc_func
  -- ^
  --
  --           [@realloc_func@]: filled with realloc function.
  -> BG.Ptr SDL_free_func
  -- ^
  --
  --           [@free_func@]: filled with free function.
  -> IO ()
getMemoryFunctions = Unsafe.sDL_GetMemoryFunctions

-- | Get the current set of SDL memory functions.
--
--     [Thread safety]: This does not hold a lock, so do not call this in the unlikely event of a background thread calling 'setMemoryFunctions' simultaneously.
--
--     @since 3.2.0
--
--     [See also]: 'setMemoryFunctions', 'getOriginalMemoryFunctions'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetMemoryFunctions@.
--                   The unsafe flavor is 'getMemoryFunctions'
--                   .
--
--     [C declaration]: @SDL_GetMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1546:34@
getMemoryFunctionsSafe
  :: BG.Ptr SDL_malloc_func
  -- ^
  --
  --           [@malloc_func@]: filled with malloc function.
  -> BG.Ptr SDL_calloc_func
  -- ^
  --
  --           [@calloc_func@]: filled with calloc function.
  -> BG.Ptr SDL_realloc_func
  -- ^
  --
  --           [@realloc_func@]: filled with realloc function.
  -> BG.Ptr SDL_free_func
  -- ^
  --
  --           [@free_func@]: filled with free function.
  -> IO ()
getMemoryFunctionsSafe = Safe.sDL_GetMemoryFunctions

-- | Replace SDL\'s memory allocation functions with a custom set.
--
--     It is not safe to call this function once any allocations have been made, as future calls to 'free' will use the new allocator, even if they came from an 'malloc' made with the old one!
--
--     If used, usually this needs to be the first call made into the SDL library, if not the very first thing done at program startup time.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but one should not replace the memory functions once any allocations are made!
--
--     @since 3.2.0
--
--     [See also]: 'getMemoryFunctions', 'getOriginalMemoryFunctions'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetMemoryFunctions@.
--                   The safe flavor is 'setMemoryFunctionsSafe'
--                   : registration; replacement allocators run inside every later SDL call.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1577:34@
setMemoryFunctions
  :: SDL_malloc_func
  -- ^
  --
  --           [@malloc_func@]: custom malloc function.
  -> SDL_calloc_func
  -- ^
  --
  --           [@calloc_func@]: custom calloc function.
  -> SDL_realloc_func
  -- ^
  --
  --           [@realloc_func@]: custom realloc function.
  -> SDL_free_func
  -- ^
  --
  --           [@free_func@]: custom free function.
  -> IO Bool
setMemoryFunctions =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_SetMemoryFunctions x00 x11 x22 x33)

-- | Replace SDL\'s memory allocation functions with a custom set.
--
--     It is not safe to call this function once any allocations have been made, as future calls to 'free' will use the new allocator, even if they came from an 'malloc' made with the old one!
--
--     If used, usually this needs to be the first call made into the SDL library, if not the very first thing done at program startup time.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but one should not replace the memory functions once any allocations are made!
--
--     @since 3.2.0
--
--     [See also]: 'getMemoryFunctions', 'getOriginalMemoryFunctions'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetMemoryFunctions@.
--                   The unsafe flavor is 'setMemoryFunctions'
--                   : registration; replacement allocators run inside every later SDL call.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1577:34@
setMemoryFunctionsSafe
  :: SDL_malloc_func
  -- ^
  --
  --           [@malloc_func@]: custom malloc function.
  -> SDL_calloc_func
  -- ^
  --
  --           [@calloc_func@]: custom calloc function.
  -> SDL_realloc_func
  -- ^
  --
  --           [@realloc_func@]: custom realloc function.
  -> SDL_free_func
  -- ^
  --
  --           [@free_func@]: custom free function.
  -> IO Bool
setMemoryFunctionsSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_SetMemoryFunctions x00 x11 x22 x33)

-- | Allocate memory aligned to a specific alignment.
--
--     The memory returned by this function must be freed with @'alignedFree'@, /not/ @'free'@.
--
--     If @alignment@ is less than the size of @void *@, it will be increased to match that.
--
--     The returned memory address will be a multiple of the alignment value, and the size of the memory allocated will be a multiple of the alignment value.
--
--     [Returns]: a pointer to the aligned memory, or NULL if allocation failed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'alignedFree'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_aligned_alloc@.
--                   The safe flavor is 'alignedAllocSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_aligned_alloc@, defined at @SDL3\/SDL_stdinc.h 1604:47@
alignedAlloc
  :: BG.Word64
  -- ^
  --
  --           [@alignment@]: the alignment of the memory.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the size to allocate.
  -> IO (BG.Ptr BG.Void)
alignedAlloc =
  \x00 ->
    \x11 ->
      Unsafe.sDL_aligned_alloc (Coerce.coerce x00) (Coerce.coerce x11)

-- | Allocate memory aligned to a specific alignment.
--
--     The memory returned by this function must be freed with @'alignedFree'@, /not/ @'free'@.
--
--     If @alignment@ is less than the size of @void *@, it will be increased to match that.
--
--     The returned memory address will be a multiple of the alignment value, and the size of the memory allocated will be a multiple of the alignment value.
--
--     [Returns]: a pointer to the aligned memory, or NULL if allocation failed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'alignedFree'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_aligned_alloc@.
--                   The unsafe flavor is 'alignedAlloc'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_aligned_alloc@, defined at @SDL3\/SDL_stdinc.h 1604:47@
alignedAllocSafe
  :: BG.Word64
  -- ^
  --
  --           [@alignment@]: the alignment of the memory.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the size to allocate.
  -> IO (BG.Ptr BG.Void)
alignedAllocSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_aligned_alloc (Coerce.coerce x00) (Coerce.coerce x11)

-- | Free memory allocated by @'alignedAlloc'@.
--
--     The pointer is no longer valid after this call and cannot be dereferenced anymore.
--
--     If @mem@ is NULL, this function does nothing.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'alignedAlloc'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_aligned_free@.
--                   The safe flavor is 'alignedFreeSafe'
--                   .
--
--     [C declaration]: @SDL_aligned_free@, defined at @SDL3\/SDL_stdinc.h 1622:34@
alignedFree
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@mem@]: a pointer previously returned by @'alignedAlloc'@, or NULL.
  -> IO ()
alignedFree = Unsafe.sDL_aligned_free

-- | Free memory allocated by @'alignedAlloc'@.
--
--     The pointer is no longer valid after this call and cannot be dereferenced anymore.
--
--     If @mem@ is NULL, this function does nothing.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'alignedAlloc'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_aligned_free@.
--                   The unsafe flavor is 'alignedFree'
--                   .
--
--     [C declaration]: @SDL_aligned_free@, defined at @SDL3\/SDL_stdinc.h 1622:34@
alignedFreeSafe
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@mem@]: a pointer previously returned by @'alignedAlloc'@, or NULL.
  -> IO ()
alignedFreeSafe = Safe.sDL_aligned_free

-- | Get the number of outstanding (unfreed) allocations.
--
--     [Returns]: the number of allocations or -1 if allocation counting is disabled.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumAllocations@.
--                   The safe flavor is 'getNumAllocationsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumAllocations@, defined at @SDL3\/SDL_stdinc.h 1634:33@
getNumAllocations :: IO BG.Int32
getNumAllocations =
  fmap Coerce.coerce Unsafe.sDL_GetNumAllocations

-- | Get the number of outstanding (unfreed) allocations.
--
--     [Returns]: the number of allocations or -1 if allocation counting is disabled.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumAllocations@.
--                   The unsafe flavor is 'getNumAllocations'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumAllocations@, defined at @SDL3\/SDL_stdinc.h 1634:33@
getNumAllocationsSafe :: IO BG.Int32
getNumAllocationsSafe =
  fmap Coerce.coerce Safe.sDL_GetNumAllocations

-- | Get the process environment.
--
--     This is initialized at application start and is not affected by setenv() and unsetenv() calls after that point. Use @'setEnvironmentVariable'@ and @'unsetEnvironmentVariable'@ if you want to modify this environment, or @'setenvUnsafe'@ or @'unsetenvUnsafe'@ if you want changes to persist in the C runtime environment after 'SDL3.Sys.Init.quit'.
--
--     [Returns]: a pointer to the environment for the process or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getEnvironmentVariable', 'getEnvironmentVariables', 'setEnvironmentVariable', 'unsetEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetEnvironment@.
--                   The safe flavor is 'getEnvironmentSafe'
--                   .
--
--     [C declaration]: @SDL_GetEnvironment@, defined at @SDL3\/SDL_stdinc.h 1672:47@
getEnvironment :: IO (BG.Ptr SDL_Environment)
getEnvironment = Unsafe.sDL_GetEnvironment

-- | Get the process environment.
--
--     This is initialized at application start and is not affected by setenv() and unsetenv() calls after that point. Use @'setEnvironmentVariable'@ and @'unsetEnvironmentVariable'@ if you want to modify this environment, or @'setenvUnsafe'@ or @'unsetenvUnsafe'@ if you want changes to persist in the C runtime environment after 'SDL3.Sys.Init.quit'.
--
--     [Returns]: a pointer to the environment for the process or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getEnvironmentVariable', 'getEnvironmentVariables', 'setEnvironmentVariable', 'unsetEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetEnvironment@.
--                   The unsafe flavor is 'getEnvironment'
--                   .
--
--     [C declaration]: @SDL_GetEnvironment@, defined at @SDL3\/SDL_stdinc.h 1672:47@
getEnvironmentSafe :: IO (BG.Ptr SDL_Environment)
getEnvironmentSafe = Safe.sDL_GetEnvironment

-- | Create a set of environment variables
--
--     [Returns]: a pointer to the new environment or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: If @populated@ is false, it is safe to call this function from any thread, otherwise it is safe if no other threads are calling setenv() or unsetenv()
--
--     @since 3.2.0
--
--     [See also]: 'getEnvironmentVariable', 'getEnvironmentVariables', 'setEnvironmentVariable', 'unsetEnvironmentVariable', 'destroyEnvironment'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateEnvironment@.
--                   The safe flavor is 'createEnvironmentSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateEnvironment@, defined at @SDL3\/SDL_stdinc.h 1694:47@
createEnvironment
  :: Bool
  -- ^
  --
  --           [@populated@]: true to initialize it from the C runtime environment, false to create an empty environment.
  -> IO (BG.Ptr SDL_Environment)
createEnvironment =
  \x00 ->
    Unsafe.sDL_CreateEnvironment (CBool.fromBool x00)

-- | Create a set of environment variables
--
--     [Returns]: a pointer to the new environment or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: If @populated@ is false, it is safe to call this function from any thread, otherwise it is safe if no other threads are calling setenv() or unsetenv()
--
--     @since 3.2.0
--
--     [See also]: 'getEnvironmentVariable', 'getEnvironmentVariables', 'setEnvironmentVariable', 'unsetEnvironmentVariable', 'destroyEnvironment'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateEnvironment@.
--                   The unsafe flavor is 'createEnvironment'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateEnvironment@, defined at @SDL3\/SDL_stdinc.h 1694:47@
createEnvironmentSafe
  :: Bool
  -- ^
  --
  --           [@populated@]: true to initialize it from the C runtime environment, false to create an empty environment.
  -> IO (BG.Ptr SDL_Environment)
createEnvironmentSafe =
  \x00 ->
    Safe.sDL_CreateEnvironment (CBool.fromBool x00)

-- | Get the value of a variable in the environment.
--
--     [Returns]: a pointer to the value of the variable or NULL if it can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getEnvironment', 'createEnvironment', 'getEnvironmentVariables', 'setEnvironmentVariable', 'unsetEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetEnvironmentVariable@.
--                   The safe flavor is 'getEnvironmentVariableSafe'
--                   .
--
--     [C declaration]: @SDL_GetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1714:42@
getEnvironmentVariable
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to get.
  -> IO (PtrConst.PtrConst BG.CChar)
getEnvironmentVariable =
  Unsafe.sDL_GetEnvironmentVariable

-- | Get the value of a variable in the environment.
--
--     [Returns]: a pointer to the value of the variable or NULL if it can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getEnvironment', 'createEnvironment', 'getEnvironmentVariables', 'setEnvironmentVariable', 'unsetEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetEnvironmentVariable@.
--                   The unsafe flavor is 'getEnvironmentVariable'
--                   .
--
--     [C declaration]: @SDL_GetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1714:42@
getEnvironmentVariableSafe
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to get.
  -> IO (PtrConst.PtrConst BG.CChar)
getEnvironmentVariableSafe =
  Safe.sDL_GetEnvironmentVariable

-- | Get all variables in the environment.
--
--     [Returns]: a NULL terminated array of pointers to environment variables in the form \"variable=value\" or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with @'free'@ when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getEnvironment', 'createEnvironment', 'getEnvironmentVariables', 'setEnvironmentVariable', 'unsetEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetEnvironmentVariables@.
--                   The safe flavor is 'getEnvironmentVariablesSafe'
--                   .
--
--     [C declaration]: @SDL_GetEnvironmentVariables@, defined at @SDL3\/SDL_stdinc.h 1735:37@
getEnvironmentVariables
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to query.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
getEnvironmentVariables =
  Unsafe.sDL_GetEnvironmentVariables

-- | Get all variables in the environment.
--
--     [Returns]: a NULL terminated array of pointers to environment variables in the form \"variable=value\" or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with @'free'@ when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getEnvironment', 'createEnvironment', 'getEnvironmentVariables', 'setEnvironmentVariable', 'unsetEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetEnvironmentVariables@.
--                   The unsafe flavor is 'getEnvironmentVariables'
--                   .
--
--     [C declaration]: @SDL_GetEnvironmentVariables@, defined at @SDL3\/SDL_stdinc.h 1735:37@
getEnvironmentVariablesSafe
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to query.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
getEnvironmentVariablesSafe =
  Safe.sDL_GetEnvironmentVariables

-- | Set the value of a variable in the environment.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getEnvironment', 'createEnvironment', 'getEnvironmentVariable', 'getEnvironmentVariables', 'unsetEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetEnvironmentVariable@.
--                   The safe flavor is 'setEnvironmentVariableSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1759:34@
setEnvironmentVariable
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the variable to set.
  -> Bool
  -- ^
  --
  --           [@overwrite@]: true to overwrite the variable if it exists, false to return success without setting the variable if it already exists.
  -> IO Bool
setEnvironmentVariable =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_SetEnvironmentVariable x00 x11 x22 (CBool.fromBool x33))

-- | Set the value of a variable in the environment.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getEnvironment', 'createEnvironment', 'getEnvironmentVariable', 'getEnvironmentVariables', 'unsetEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetEnvironmentVariable@.
--                   The unsafe flavor is 'setEnvironmentVariable'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1759:34@
setEnvironmentVariableSafe
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the variable to set.
  -> Bool
  -- ^
  --
  --           [@overwrite@]: true to overwrite the variable if it exists, false to return success without setting the variable if it already exists.
  -> IO Bool
setEnvironmentVariableSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_SetEnvironmentVariable x00 x11 x22 (CBool.fromBool x33))

-- | Clear a variable from the environment.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getEnvironment', 'createEnvironment', 'getEnvironmentVariable', 'getEnvironmentVariables', 'setEnvironmentVariable', 'unsetEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnsetEnvironmentVariable@.
--                   The safe flavor is 'unsetEnvironmentVariableSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UnsetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1780:34@
unsetEnvironmentVariable
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to unset.
  -> IO Bool
unsetEnvironmentVariable =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_UnsetEnvironmentVariable x00 x11)

-- | Clear a variable from the environment.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getEnvironment', 'createEnvironment', 'getEnvironmentVariable', 'getEnvironmentVariables', 'setEnvironmentVariable', 'unsetEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnsetEnvironmentVariable@.
--                   The unsafe flavor is 'unsetEnvironmentVariable'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UnsetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1780:34@
unsetEnvironmentVariableSafe
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to unset.
  -> IO Bool
unsetEnvironmentVariableSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_UnsetEnvironmentVariable x00 x11)

-- | Destroy a set of environment variables.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the environment is no longer in use.
--
--     @since 3.2.0
--
--     [See also]: 'createEnvironment'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyEnvironment@.
--                   The safe flavor is 'destroyEnvironmentSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyEnvironment@, defined at @SDL3\/SDL_stdinc.h 1794:34@
destroyEnvironment
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to destroy.
  -> IO ()
destroyEnvironment = Unsafe.sDL_DestroyEnvironment

-- | Destroy a set of environment variables.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the environment is no longer in use.
--
--     @since 3.2.0
--
--     [See also]: 'createEnvironment'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyEnvironment@.
--                   The unsafe flavor is 'destroyEnvironment'
--                   .
--
--     [C declaration]: @SDL_DestroyEnvironment@, defined at @SDL3\/SDL_stdinc.h 1794:34@
destroyEnvironmentSafe
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to destroy.
  -> IO ()
destroyEnvironmentSafe = Safe.sDL_DestroyEnvironment

-- | Get the value of a variable in the environment.
--
--     This function uses SDL\'s cached copy of the environment and is thread-safe.
--
--     [Returns]: a pointer to the value of the variable or NULL if it can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_getenv@.
--                   The safe flavor is 'getenvSafe'
--                   .
--
--     [C declaration]: @SDL_getenv@, defined at @SDL3\/SDL_stdinc.h 1809:42@
getenv
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to get.
  -> IO (PtrConst.PtrConst BG.CChar)
getenv = Unsafe.sDL_getenv

-- | Get the value of a variable in the environment.
--
--     This function uses SDL\'s cached copy of the environment and is thread-safe.
--
--     [Returns]: a pointer to the value of the variable or NULL if it can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_getenv@.
--                   The unsafe flavor is 'getenv'
--                   .
--
--     [C declaration]: @SDL_getenv@, defined at @SDL3\/SDL_stdinc.h 1809:42@
getenvSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to get.
  -> IO (PtrConst.PtrConst BG.CChar)
getenvSafe = Safe.sDL_getenv

-- | Get the value of a variable in the environment.
--
--     This function bypasses SDL\'s cached copy of the environment and is not thread-safe.
--
--     [Returns]: a pointer to the value of the variable or NULL if it can\'t be found.
--
--     [Thread safety]: This function is not thread safe, consider using @'getenv'@ instead.
--
--     @since 3.2.0
--
--     [See also]: 'getenv'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_getenv_unsafe@.
--                   The safe flavor is 'getenvUnsafeSafe'
--                   .
--
--     [C declaration]: @SDL_getenv_unsafe@, defined at @SDL3\/SDL_stdinc.h 1828:42@
getenvUnsafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to get.
  -> IO (PtrConst.PtrConst BG.CChar)
getenvUnsafe = Unsafe.sDL_getenv_unsafe

-- | Get the value of a variable in the environment.
--
--     This function bypasses SDL\'s cached copy of the environment and is not thread-safe.
--
--     [Returns]: a pointer to the value of the variable or NULL if it can\'t be found.
--
--     [Thread safety]: This function is not thread safe, consider using @'getenv'@ instead.
--
--     @since 3.2.0
--
--     [See also]: 'getenv'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_getenv_unsafe@.
--                   The unsafe flavor is 'getenvUnsafe'
--                   .
--
--     [C declaration]: @SDL_getenv_unsafe@, defined at @SDL3\/SDL_stdinc.h 1828:42@
getenvUnsafeSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to get.
  -> IO (PtrConst.PtrConst BG.CChar)
getenvUnsafeSafe = Safe.sDL_getenv_unsafe

-- | Set the value of a variable in the environment.
--
--     [Returns]: 0 on success, -1 on error.
--
--     [Thread safety]: This function is not thread safe, consider using @'setEnvironmentVariable'@ instead.
--
--     @since 3.2.0
--
--     [See also]: 'setEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_setenv_unsafe@.
--                   The safe flavor is 'setenvUnsafeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_setenv_unsafe@, defined at @SDL3\/SDL_stdinc.h 1846:33@
setenvUnsafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the variable to set.
  -> BG.Int32
  -- ^
  --
  --           [@overwrite@]: 1 to overwrite the variable if it exists, 0 to return success without setting the variable if it already exists.
  -> IO BG.Int32
setenvUnsafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_setenv_unsafe x00 x11 (Coerce.coerce x22))

-- | Set the value of a variable in the environment.
--
--     [Returns]: 0 on success, -1 on error.
--
--     [Thread safety]: This function is not thread safe, consider using @'setEnvironmentVariable'@ instead.
--
--     @since 3.2.0
--
--     [See also]: 'setEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_setenv_unsafe@.
--                   The unsafe flavor is 'setenvUnsafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_setenv_unsafe@, defined at @SDL3\/SDL_stdinc.h 1846:33@
setenvUnsafeSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the variable to set.
  -> BG.Int32
  -- ^
  --
  --           [@overwrite@]: 1 to overwrite the variable if it exists, 0 to return success without setting the variable if it already exists.
  -> IO BG.Int32
setenvUnsafeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_setenv_unsafe x00 x11 (Coerce.coerce x22))

-- | Clear a variable from the environment.
--
--     [Returns]: 0 on success, -1 on error.
--
--     [Thread safety]: This function is not thread safe, consider using @'unsetEnvironmentVariable'@ instead.
--
--     @since 3.2.0
--
--     [See also]: 'unsetEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_unsetenv_unsafe@.
--                   The safe flavor is 'unsetenvUnsafeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_unsetenv_unsafe@, defined at @SDL3\/SDL_stdinc.h 1861:33@
unsetenvUnsafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to unset.
  -> IO BG.Int32
unsetenvUnsafe =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_unsetenv_unsafe x00)

-- | Clear a variable from the environment.
--
--     [Returns]: 0 on success, -1 on error.
--
--     [Thread safety]: This function is not thread safe, consider using @'unsetEnvironmentVariable'@ instead.
--
--     @since 3.2.0
--
--     [See also]: 'unsetEnvironmentVariable'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_unsetenv_unsafe@.
--                   The unsafe flavor is 'unsetenvUnsafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_unsetenv_unsafe@, defined at @SDL3\/SDL_stdinc.h 1861:33@
unsetenvUnsafeSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to unset.
  -> IO BG.Int32
unsetenvUnsafeSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_unsetenv_unsafe x00)

-- | Sort an array.
--
--     For example:
--
--     @
--     typedef struct {
--         int key;
--         const char *string;
--     } data;
--
--     int SDLCALL compare(const void *a, const void *b)
--     {
--         const data *A = (const data *)a;
--         const data *B = (const data *)b;
--
--         if (A->n \< B->n) {
--             return -1;
--         } else if (B->n \< A->n) {
--             return 1;
--         } else {
--             return 0;
--         }
--     }
--
--     data values[] = {
--         { 3, \"third\" }, { 1, \"first\" }, { 2, \"second\" }
--     };
--
--     SDL_qsort(values, SDL_arraysize(values), sizeof(values[0]), compare);
--     @
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'bsearchSafe', 'qsortRSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_qsort@.
--                   The unsafe import is not exported
--                   : invokes the comparator synchronously.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Stdinc.Unsafe.sDL_qsort@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_qsort@, defined at @SDL3\/SDL_stdinc.h 1923:34@
qsortSafe
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@base@]: a pointer to the start of the array.
  -> BG.Word64
  -- ^
  --
  --           [@nmemb@]: the number of elements in the array.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the size of the elements in the array.
  -> SDL_CompareCallback
  -- ^
  --
  --           [@compare@]: a function used to compare elements in the array.
  -> IO ()
qsortSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_qsort x00 (Coerce.coerce x11) (Coerce.coerce x22) x33

-- | Perform a binary search on a previously sorted array.
--
--     For example:
--
--     @
--     typedef struct {
--         int key;
--         const char *string;
--     } data;
--
--     int SDLCALL compare(const void *a, const void *b)
--     {
--         const data *A = (const data *)a;
--         const data *B = (const data *)b;
--
--         if (A->n \< B->n) {
--             return -1;
--         } else if (B->n \< A->n) {
--             return 1;
--         } else {
--             return 0;
--         }
--     }
--
--     data values[] = {
--         { 1, \"first\" }, { 2, \"second\" }, { 3, \"third\" }
--     };
--     data key = { 2, NULL };
--
--     data *result = SDL_bsearch(&key, values, SDL_arraysize(values), sizeof(values[0]), compare);
--     @
--
--     [Returns]: a pointer to the matching element in the array, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'bsearchRSafe', 'qsortSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_bsearch@.
--                   The unsafe import is not exported
--                   : invokes the comparator synchronously.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Stdinc.Unsafe.sDL_bsearch@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_bsearch@, defined at @SDL3\/SDL_stdinc.h 1973:36@
bsearchSafe
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@key@]: a pointer to a key equal to the element being searched for.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@base@]: a pointer to the start of the array.
  -> BG.Word64
  -- ^
  --
  --           [@nmemb@]: the number of elements in the array.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the size of the elements in the array.
  -> SDL_CompareCallback
  -- ^
  --
  --           [@compare@]: a function used to compare elements in the array.
  -> IO (BG.Ptr BG.Void)
bsearchSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Safe.sDL_bsearch x00 x11 (Coerce.coerce x22) (Coerce.coerce x33) x44

-- | Sort an array, passing a userdata pointer to the compare function.
--
--     For example:
--
--     @
--     typedef enum {
--         sort_increasing,
--         sort_decreasing,
--     } sort_method;
--
--     typedef struct {
--         int key;
--         const char *string;
--     } data;
--
--     int SDLCALL compare(const void *userdata, const void *a, const void *b)
--     {
--         sort_method method = (sort_method)(uintptr_t)userdata;
--         const data *A = (const data *)a;
--         const data *B = (const data *)b;
--
--         if (A->key \< B->key) {
--             return (method == sort_increasing) ? -1 : 1;
--         } else if (B->key \< A->key) {
--             return (method == sort_increasing) ? 1 : -1;
--         } else {
--             return 0;
--         }
--     }
--
--     data values[] = {
--         { 3, \"third\" }, { 1, \"first\" }, { 2, \"second\" }
--     };
--
--     SDL_qsort_r(values, SDL_arraysize(values), sizeof(values[0]), compare, (const void *)(uintptr_t)sort_increasing);
--     @
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'bsearchRSafe', 'qsortSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_qsort_r@.
--                   The unsafe import is not exported
--                   : invokes the comparator synchronously.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Stdinc.Unsafe.sDL_qsort_r@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_qsort_r@, defined at @SDL3\/SDL_stdinc.h 2043:34@
qsortRSafe
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@base@]: a pointer to the start of the array.
  -> BG.Word64
  -- ^
  --
  --           [@nmemb@]: the number of elements in the array.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the size of the elements in the array.
  -> SDL_CompareCallback_r
  -- ^
  --
  --           [@compare@]: a function used to compare elements in the array.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer to pass to the compare function.
  -> IO ()
qsortRSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Safe.sDL_qsort_r x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44

-- | Perform a binary search on a previously sorted array, passing a userdata pointer to the compare function.
--
--     For example:
--
--     @
--     typedef enum {
--         sort_increasing,
--         sort_decreasing,
--     } sort_method;
--
--     typedef struct {
--         int key;
--         const char *string;
--     } data;
--
--     int SDLCALL compare(const void *userdata, const void *a, const void *b)
--     {
--         sort_method method = (sort_method)(uintptr_t)userdata;
--         const data *A = (const data *)a;
--         const data *B = (const data *)b;
--
--         if (A->key \< B->key) {
--             return (method == sort_increasing) ? -1 : 1;
--         } else if (B->key \< A->key) {
--             return (method == sort_increasing) ? 1 : -1;
--         } else {
--             return 0;
--         }
--     }
--
--     data values[] = {
--         { 1, \"first\" }, { 2, \"second\" }, { 3, \"third\" }
--     };
--     data key = { 2, NULL };
--
--     data *result = SDL_bsearch_r(&key, values, SDL_arraysize(values), sizeof(values[0]), compare, (const void *)(uintptr_t)sort_increasing);
--     @
--
--     [Returns]: a pointer to the matching element in the array, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'bsearchSafe', 'qsortRSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_bsearch_r@.
--                   The unsafe import is not exported
--                   : invokes the comparator synchronously.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Stdinc.Unsafe.sDL_bsearch_r@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_bsearch_r@, defined at @SDL3\/SDL_stdinc.h 2101:36@
bsearchRSafe
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@key@]: a pointer to a key equal to the element being searched for.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@base@]: a pointer to the start of the array.
  -> BG.Word64
  -- ^
  --
  --           [@nmemb@]: the number of elements in the array.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the size of the elements in the array.
  -> SDL_CompareCallback_r
  -- ^
  --
  --           [@compare@]: a function used to compare elements in the array.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer to pass to the compare function.
  -> IO (BG.Ptr BG.Void)
bsearchRSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              Safe.sDL_bsearch_r x00 x11 (Coerce.coerce x22) (Coerce.coerce x33) x44 x55

-- | Compute the absolute value of @x@.
--
--     [Returns]: the absolute value of x.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_abs@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_abs@, defined at @SDL3\/SDL_stdinc.h 2113:33@
abs
  :: BG.Int32
  -- ^
  --
  --           [@x@]: an integer value.
  -> IO BG.Int32
abs =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_abs (Coerce.coerce x00))

-- | Query if a character is alphabetic (a letter).
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values for English \'a-z\' and \'A-Z\' as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isalpha@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isalpha@, defined at @SDL3\/SDL_stdinc.h 2188:33@
isalpha
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
isalpha =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isalpha (Coerce.coerce x00))

-- | Query if a character is alphabetic (a letter) or a number.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values for English \'a-z\', \'A-Z\', and \'0-9\' as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isalnum@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isalnum@, defined at @SDL3\/SDL_stdinc.h 2203:33@
isalnum
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
isalnum =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isalnum (Coerce.coerce x00))

-- | Report if a character is blank (a space or tab).
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values 0x20 (space) or 0x9 (tab) as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isblank@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isblank@, defined at @SDL3\/SDL_stdinc.h 2218:33@
isblank
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
isblank =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isblank (Coerce.coerce x00))

-- | Report if a character is a control character.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values 0 through 0x1F, and 0x7F, as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_iscntrl@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_iscntrl@, defined at @SDL3\/SDL_stdinc.h 2233:33@
iscntrl
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
iscntrl =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_iscntrl (Coerce.coerce x00))

-- | Report if a character is a numeric digit.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \'0\' (0x30) through \'9\' (0x39), as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isdigit@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isdigit@, defined at @SDL3\/SDL_stdinc.h 2248:33@
isdigit
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
isdigit =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isdigit (Coerce.coerce x00))

-- | Report if a character is a hexadecimal digit.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \'A\' through \'F\', \'a\' through \'f\', and \'0\' through \'9\', as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isxdigit@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isxdigit@, defined at @SDL3\/SDL_stdinc.h 2263:33@
isxdigit
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
isxdigit =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isxdigit (Coerce.coerce x00))

-- | Report if a character is a punctuation mark.
--
--     __WARNING__: Regardless of system locale, this is equivalent to @((SDL_isgraph(x)) && (!SDL_isalnum(x)))@.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'isgraph', 'isalnum'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ispunct@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ispunct@, defined at @SDL3\/SDL_stdinc.h 2281:33@
ispunct
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
ispunct =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_ispunct (Coerce.coerce x00))

-- | Report if a character is whitespace.
--
--     __WARNING__: Regardless of system locale, this will only treat the following ASCII values as true:
--
--     * space (0x20)
--
--     * tab (0x09)
--
--     * newline (0x0A)
--
--     * vertical tab (0x0B)
--
--     * form feed (0x0C)
--
--     * return (0x0D)
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isspace@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isspace@, defined at @SDL3\/SDL_stdinc.h 2303:33@
isspace
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
isspace =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isspace (Coerce.coerce x00))

-- | Report if a character is upper case.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \'A\' through \'Z\' as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isupper@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isupper@, defined at @SDL3\/SDL_stdinc.h 2318:33@
isupper
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
isupper =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isupper (Coerce.coerce x00))

-- | Report if a character is lower case.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \'a\' through \'z\' as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_islower@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_islower@, defined at @SDL3\/SDL_stdinc.h 2333:33@
islower
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
islower =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_islower (Coerce.coerce x00))

-- | Report if a character is \"printable\".
--
--     Be advised that \"printable\" has a definition that goes back to text terminals from the dawn of computing, making this a sort of special case function that is not suitable for Unicode (or most any) text management.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \' \' (0x20) through \'~\' (0x7E) as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isprint@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isprint@, defined at @SDL3\/SDL_stdinc.h 2352:33@
isprint
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
isprint =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isprint (Coerce.coerce x00))

-- | Report if a character is any \"printable\" except space.
--
--     Be advised that \"printable\" has a definition that goes back to text terminals from the dawn of computing, making this a sort of special case function that is not suitable for Unicode (or most any) text management.
--
--     __WARNING__: Regardless of system locale, this is equivalent to @(SDL_isprint(x)) && ((x) != \' \')@.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'isprint'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isgraph@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isgraph@, defined at @SDL3\/SDL_stdinc.h 2373:33@
isgraph
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
isgraph =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isgraph (Coerce.coerce x00))

-- | Convert low-ASCII English letters to uppercase.
--
--     __WARNING__: Regardless of system locale, this will only convert ASCII values \'a\' through \'z\' to uppercase.
--
--     This function returns the uppercase equivalent of @x@. If a character cannot be converted, or is already uppercase, this function returns @x@.
--
--     [Returns]: capitalized version of x, or x if no conversion available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_toupper@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_toupper@, defined at @SDL3\/SDL_stdinc.h 2391:33@
toupper
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
toupper =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_toupper (Coerce.coerce x00))

-- | Convert low-ASCII English letters to lowercase.
--
--     __WARNING__: Regardless of system locale, this will only convert ASCII values \'A\' through \'Z\' to lowercase.
--
--     This function returns the lowercase equivalent of @x@. If a character cannot be converted, or is already lowercase, this function returns @x@.
--
--     [Returns]: lowercase version of x, or x if no conversion available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_tolower@.
--                   The safe import is not exported
--                   : locale-independent ASCII character classification; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_tolower@, defined at @SDL3\/SDL_stdinc.h 2409:33@
tolower
  :: BG.Int32
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.Int32
tolower =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_tolower (Coerce.coerce x00))

-- | Calculate a CRC-16 value.
--
--     [https:\/\/en.wikipedia.org\/wiki\/Cyclic_redundancy_check](https://en.wikipedia.org/wiki/Cyclic_redundancy_check)
--
--     This function can be called multiple times, to stream data to be checksummed in blocks. Each call must provide the previous CRC-16 return value to be updated with the next block. The first call to this function for a set of blocks should pass in a zero CRC value.
--
--     [Returns]: a CRC-16 checksum value of all blocks in the data set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_crc16@.
--                   The safe flavor is 'crc16Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_crc16@, defined at @SDL3\/SDL_stdinc.h 2430:36@
crc16
  :: BG.Word16
  -- ^
  --
  --           [@crc@]: the current checksum for this data set, or 0 for a new data set.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: a new block of data to add to the checksum.
  -> BG.Word64
  -- ^
  --
  --           [@len@]: the size, in bytes, of the new block of data.
  -> IO BG.Word16
crc16 =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_crc16 (Coerce.coerce x00) x11 (Coerce.coerce x22))

-- | Calculate a CRC-16 value.
--
--     [https:\/\/en.wikipedia.org\/wiki\/Cyclic_redundancy_check](https://en.wikipedia.org/wiki/Cyclic_redundancy_check)
--
--     This function can be called multiple times, to stream data to be checksummed in blocks. Each call must provide the previous CRC-16 return value to be updated with the next block. The first call to this function for a set of blocks should pass in a zero CRC value.
--
--     [Returns]: a CRC-16 checksum value of all blocks in the data set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_crc16@.
--                   The unsafe flavor is 'crc16'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_crc16@, defined at @SDL3\/SDL_stdinc.h 2430:36@
crc16Safe
  :: BG.Word16
  -- ^
  --
  --           [@crc@]: the current checksum for this data set, or 0 for a new data set.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: a new block of data to add to the checksum.
  -> BG.Word64
  -- ^
  --
  --           [@len@]: the size, in bytes, of the new block of data.
  -> IO BG.Word16
crc16Safe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_crc16 (Coerce.coerce x00) x11 (Coerce.coerce x22))

-- | Calculate a CRC-32 value.
--
--     [https:\/\/en.wikipedia.org\/wiki\/Cyclic_redundancy_check](https://en.wikipedia.org/wiki/Cyclic_redundancy_check)
--
--     This function can be called multiple times, to stream data to be checksummed in blocks. Each call must provide the previous CRC-32 return value to be updated with the next block. The first call to this function for a set of blocks should pass in a zero CRC value.
--
--     [Returns]: a CRC-32 checksum value of all blocks in the data set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_crc32@.
--                   The safe flavor is 'crc32Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_crc32@, defined at @SDL3\/SDL_stdinc.h 2451:36@
crc32
  :: BG.Word32
  -- ^
  --
  --           [@crc@]: the current checksum for this data set, or 0 for a new data set.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: a new block of data to add to the checksum.
  -> BG.Word64
  -- ^
  --
  --           [@len@]: the size, in bytes, of the new block of data.
  -> IO BG.Word32
crc32 =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_crc32 (Coerce.coerce x00) x11 (Coerce.coerce x22))

-- | Calculate a CRC-32 value.
--
--     [https:\/\/en.wikipedia.org\/wiki\/Cyclic_redundancy_check](https://en.wikipedia.org/wiki/Cyclic_redundancy_check)
--
--     This function can be called multiple times, to stream data to be checksummed in blocks. Each call must provide the previous CRC-32 return value to be updated with the next block. The first call to this function for a set of blocks should pass in a zero CRC value.
--
--     [Returns]: a CRC-32 checksum value of all blocks in the data set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_crc32@.
--                   The unsafe flavor is 'crc32'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_crc32@, defined at @SDL3\/SDL_stdinc.h 2451:36@
crc32Safe
  :: BG.Word32
  -- ^
  --
  --           [@crc@]: the current checksum for this data set, or 0 for a new data set.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: a new block of data to add to the checksum.
  -> BG.Word64
  -- ^
  --
  --           [@len@]: the size, in bytes, of the new block of data.
  -> IO BG.Word32
crc32Safe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_crc32 (Coerce.coerce x00) x11 (Coerce.coerce x22))

-- | Calculate a 32-bit MurmurHash3 value for a block of data.
--
--     [https:\/\/en.wikipedia.org\/wiki\/MurmurHash](https://en.wikipedia.org/wiki/MurmurHash)
--
--     A seed may be specified, which changes the final results consistently, but this does not work like 'crc16' and 'crc32': you can\'t feed a previous result from this function back into itself as the next seed value to calculate a hash in chunks; it won\'t produce the same hash as it would if the same data was provided in a single call.
--
--     If you aren\'t sure what to provide for a seed, zero is fine. Murmur3 is not cryptographically secure, so it shouldn\'t be used for hashing top-secret data.
--
--     [Returns]: a Murmur3 32-bit hash value.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_murmur3_32@.
--                   The safe flavor is 'murmur3_32Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_murmur3_32@, defined at @SDL3\/SDL_stdinc.h 2477:36@
murmur3_32
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to be hashed.
  -> BG.Word64
  -- ^
  --
  --           [@len@]: the size of data, in bytes.
  -> BG.Word32
  -- ^
  --
  --           [@seed@]: a value that alters the final hash value.
  -> IO BG.Word32
murmur3_32 =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_murmur3_32 x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Calculate a 32-bit MurmurHash3 value for a block of data.
--
--     [https:\/\/en.wikipedia.org\/wiki\/MurmurHash](https://en.wikipedia.org/wiki/MurmurHash)
--
--     A seed may be specified, which changes the final results consistently, but this does not work like 'crc16' and 'crc32': you can\'t feed a previous result from this function back into itself as the next seed value to calculate a hash in chunks; it won\'t produce the same hash as it would if the same data was provided in a single call.
--
--     If you aren\'t sure what to provide for a seed, zero is fine. Murmur3 is not cryptographically secure, so it shouldn\'t be used for hashing top-secret data.
--
--     [Returns]: a Murmur3 32-bit hash value.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_murmur3_32@.
--                   The unsafe flavor is 'murmur3_32'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_murmur3_32@, defined at @SDL3\/SDL_stdinc.h 2477:36@
murmur3_32Safe
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to be hashed.
  -> BG.Word64
  -- ^
  --
  --           [@len@]: the size of data, in bytes.
  -> BG.Word32
  -- ^
  --
  --           [@seed@]: a value that alters the final hash value.
  -> IO BG.Word32
murmur3_32Safe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_murmur3_32 x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Initialize all 32-bit words of buffer of memory to a specific value.
--
--     This function will set a buffer of @dwords@ 'Uint32' values, pointed to by @dst@, to the value specified in @val@.
--
--     Unlike SDL_memset, this sets 32-bit values, not bytes, so it\'s not limited to a range of 0-255.
--
--     [Returns]: @dst@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_memset4@.
--                   The safe flavor is 'memset4Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_memset4@, defined at @SDL3\/SDL_stdinc.h 2601:36@
memset4
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@dst@]: the destination memory region. Must not be NULL.
  -> BG.Word32
  -- ^
  --
  --           [@val@]: the 'Uint32' value to set.
  -> BG.Word64
  -- ^
  --
  --           [@dwords@]: the number of 'Uint32' values to set in @dst@.
  -> IO (BG.Ptr BG.Void)
memset4 =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_memset4 x00 (Coerce.coerce x11) (Coerce.coerce x22)

-- | Initialize all 32-bit words of buffer of memory to a specific value.
--
--     This function will set a buffer of @dwords@ 'Uint32' values, pointed to by @dst@, to the value specified in @val@.
--
--     Unlike SDL_memset, this sets 32-bit values, not bytes, so it\'s not limited to a range of 0-255.
--
--     [Returns]: @dst@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_memset4@.
--                   The unsafe flavor is 'memset4'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_memset4@, defined at @SDL3\/SDL_stdinc.h 2601:36@
memset4Safe
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@dst@]: the destination memory region. Must not be NULL.
  -> BG.Word32
  -- ^
  --
  --           [@val@]: the 'Uint32' value to set.
  -> BG.Word64
  -- ^
  --
  --           [@dwords@]: the number of 'Uint32' values to set in @dst@.
  -> IO (BG.Ptr BG.Void)
memset4Safe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.sDL_memset4 x00 (Coerce.coerce x11) (Coerce.coerce x22)

-- | Compare two buffers of memory.
--
--     [Returns]: less than zero if s1 is \"less than\" s2, greater than zero if s1 is \"greater than\" s2, and zero if the buffers match exactly for @len@ bytes.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_memcmp@.
--                   The safe flavor is 'memcmpSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_memcmp@, defined at @SDL3\/SDL_stdinc.h 2683:33@
memcmp
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@s1@]: the first buffer to compare. NULL is not permitted!
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@s2@]: the second buffer to compare. NULL is not permitted!
  -> BG.Word64
  -- ^
  --
  --           [@len@]: the number of bytes to compare between the buffers.
  -> IO BG.Int32
memcmp =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_memcmp x00 x11 (Coerce.coerce x22))

-- | Compare two buffers of memory.
--
--     [Returns]: less than zero if s1 is \"less than\" s2, greater than zero if s1 is \"greater than\" s2, and zero if the buffers match exactly for @len@ bytes.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_memcmp@.
--                   The unsafe flavor is 'memcmp'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_memcmp@, defined at @SDL3\/SDL_stdinc.h 2683:33@
memcmpSafe
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@s1@]: the first buffer to compare. NULL is not permitted!
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@s2@]: the second buffer to compare. NULL is not permitted!
  -> BG.Word64
  -- ^
  --
  --           [@len@]: the number of bytes to compare between the buffers.
  -> IO BG.Int32
memcmpSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_memcmp x00 x11 (Coerce.coerce x22))

-- | This works exactly like wcslen() but doesn\'t require access to a C runtime.
--
--     Counts the number of wchar_t values in @wstr@, excluding the null terminator.
--
--     Like 'strlen' only counts bytes and not codepoints in a UTF-8 string, this counts wchar_t values in a string, even if the string\'s encoding is of variable width, like UTF-16.
--
--     Also be aware that wchar_t is different sizes on different platforms (4 bytes on Linux, 2 on Windows, etc).
--
--     [Returns]: the length (in wchar_t values, excluding the null terminator) of @wstr@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'wcsnlen', 'utf8strlen', 'utf8strnlen'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_wcslen@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_wcslen@, defined at @SDL3\/SDL_stdinc.h 2710:36@
wcslen
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@wstr@]: The null-terminated wide string to read. Must not be NULL.
  -> IO BG.Word64
wcslen =
  \x00 -> fmap Coerce.coerce (Unsafe.sDL_wcslen x00)

-- | This works exactly like wcsnlen() but doesn\'t require access to a C runtime.
--
--     Counts up to a maximum of @maxlen@ wchar_t values in @wstr@, excluding the null terminator.
--
--     Like 'strnlen' only counts bytes and not codepoints in a UTF-8 string, this counts wchar_t values in a string, even if the string\'s encoding is of variable width, like UTF-16.
--
--     Also be aware that wchar_t is different sizes on different platforms (4 bytes on Linux, 2 on Windows, etc).
--
--     Also, @maxlen@ is a count of wide characters, not bytes!
--
--     [Returns]: the length (in wide characters, excluding the null terminator) of @wstr@ but never more than @maxlen@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'wcslen', 'utf8strlen', 'utf8strnlen'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_wcsnlen@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_wcsnlen@, defined at @SDL3\/SDL_stdinc.h 2741:36@
wcsnlen
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@wstr@]: The null-terminated wide string to read. Must not be NULL.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: The maximum amount of wide characters to count.
  -> IO BG.Word64
wcsnlen =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_wcsnlen x00 (Coerce.coerce x11))

-- | Copy a wide string.
--
--     This function copies @maxlen@ - 1 wide characters from @src@ to @dst@, then appends a null terminator.
--
--     @src@ and @dst@ must not overlap.
--
--     If @maxlen@ is 0, no wide characters are copied and no null terminator is written.
--
--     [Returns]: the length (in wide characters, excluding the null terminator) of @src@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'wcslcat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_wcslcpy@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_wcslcpy@, defined at @SDL3\/SDL_stdinc.h 2768:36@
wcslcpy
  :: BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@dst@]: The destination buffer. Must not be NULL, and must not overlap with @src@.
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@src@]: The null-terminated wide string to copy. Must not be NULL, and must not overlap with @dst@.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: The length (in wide characters) of the destination buffer.
  -> IO BG.Word64
wcslcpy =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_wcslcpy x00 x11 (Coerce.coerce x22))

-- | Concatenate wide strings.
--
--     This function appends up to @maxlen@ - SDL_wcslen(dst) - 1 wide characters from @src@ to the end of the wide string in @dst@, then appends a null terminator.
--
--     @src@ and @dst@ must not overlap.
--
--     If @maxlen@ - SDL_wcslen(dst) - 1 is less than or equal to 0, then @dst@ is unmodified.
--
--     [Returns]: the length (in wide characters, excluding the null terminator) of the string in @dst@ plus the length of @src@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'wcslcpy'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_wcslcat@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_wcslcat@, defined at @SDL3\/SDL_stdinc.h 2797:36@
wcslcat
  :: BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@dst@]: The destination buffer already containing the first null-terminated wide string. Must not be NULL and must not overlap with @src@.
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@src@]: The second null-terminated wide string. Must not be NULL, and must not overlap with @dst@.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: The length (in wide characters) of the destination buffer.
  -> IO BG.Word64
wcslcat =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_wcslcat x00 x11 (Coerce.coerce x22))

-- | Allocate a copy of a wide string.
--
--     This allocates enough space for a null-terminated copy of @wstr@, using 'malloc', and then makes a copy of the string into this space.
--
--     The returned string is owned by the caller, and should be passed to 'free' when no longer needed.
--
--     [Returns]: a pointer to the newly-allocated wide string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_wcsdup@.
--                   The safe flavor is 'wcsdupSafe'
--                   .
--
--     [C declaration]: @SDL_wcsdup@, defined at @SDL3\/SDL_stdinc.h 2815:39@
wcsdup
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@wstr@]: the string to copy.
  -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
wcsdup = Unsafe.sDL_wcsdup

-- | Allocate a copy of a wide string.
--
--     This allocates enough space for a null-terminated copy of @wstr@, using 'malloc', and then makes a copy of the string into this space.
--
--     The returned string is owned by the caller, and should be passed to 'free' when no longer needed.
--
--     [Returns]: a pointer to the newly-allocated wide string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_wcsdup@.
--                   The unsafe flavor is 'wcsdup'
--                   .
--
--     [C declaration]: @SDL_wcsdup@, defined at @SDL3\/SDL_stdinc.h 2815:39@
wcsdupSafe
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@wstr@]: the string to copy.
  -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
wcsdupSafe = Safe.sDL_wcsdup

-- | Search a wide string for the first instance of a specific substring.
--
--     The search ends once it finds the requested substring, or a null terminator byte to end the string.
--
--     Note that this looks for strings of /wide characters/, not /codepoints/, so it\'s legal to search for malformed and incomplete UTF-16 sequences.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_wcsstr@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [C declaration]: @SDL_wcsstr@, defined at @SDL3\/SDL_stdinc.h 2835:39@
wcsstr
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@haystack@]: the wide string to search. Must not be NULL.
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@needle@]: the wide string to search for. Must not be NULL.
  -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
wcsstr = Unsafe.sDL_wcsstr

-- | Search a wide string, up to n wide chars, for the first instance of a specific substring.
--
--     The search ends once it finds the requested substring, or a null terminator value to end the string, or @maxlen@ wide character have been examined. It is possible to use this function on a wide string without a null terminator.
--
--     Note that this looks for strings of /wide characters/, not /codepoints/, so it\'s legal to search for malformed and incomplete UTF-16 sequences.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_wcsnstr@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_wcsnstr@, defined at @SDL3\/SDL_stdinc.h 2860:39@
wcsnstr
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@haystack@]: the wide string to search. Must not be NULL.
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@needle@]: the wide string to search for. Must not be NULL.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the maximum number of wide characters to search in @haystack@.
  -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
wcsnstr =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_wcsnstr x00 x11 (Coerce.coerce x22)

-- | Compare two null-terminated wide strings.
--
--     This only compares wchar_t values until it hits a null-terminating character; it does not care if the string is well-formed UTF-16 (or UTF-32, depending on your platform\'s wchar_t size), or uses valid Unicode values.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_wcscmp@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_wcscmp@, defined at @SDL3\/SDL_stdinc.h 2879:33@
wcscmp
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> IO BG.Int32
wcscmp =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_wcscmp x00 x11)

-- | Compare two wide strings up to a number of wchar_t values.
--
--     This only compares wchar_t values; it does not care if the string is well-formed UTF-16 (or UTF-32, depending on your platform\'s wchar_t size), or uses valid Unicode values.
--
--     Note that while this function is intended to be used with UTF-16 (or UTF-32, depending on your platform\'s definition of wchar_t), it is comparing raw wchar_t values and not Unicode codepoints: @maxlen@ specifies a wchar_t limit! If the limit lands in the middle of a multi-wchar UTF-16 sequence, it will only compare a portion of the final character.
--
--     @maxlen@ specifies a maximum number of wchar_t to compare; if the strings match to this number of wide chars (or both have matched to a null-terminator character before this count), they will be considered equal.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_wcsncmp@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_wcsncmp@, defined at @SDL3\/SDL_stdinc.h 2910:33@
wcsncmp
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the maximum number of wchar_t to compare.
  -> IO BG.Int32
wcsncmp =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_wcsncmp x00 x11 (Coerce.coerce x22))

-- | Compare two null-terminated wide strings, case-insensitively.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Depending on your platform, \"wchar_t\" might be 2 bytes, and expected to be UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this handles Unicode, it expects the string to be well-formed and not a null-terminated string of arbitrary bytes. Characters that are not valid UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_wcscasecmp@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_wcscasecmp@, defined at @SDL3\/SDL_stdinc.h 2940:33@
wcscasecmp
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> IO BG.Int32
wcscasecmp =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_wcscasecmp x00 x11)

-- | Compare two wide strings, case-insensitively, up to a number of wchar_t.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Depending on your platform, \"wchar_t\" might be 2 bytes, and expected to be UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this handles Unicode, it expects the string to be well-formed and not a null-terminated string of arbitrary bytes. Characters that are not valid UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     Note that while this function might deal with variable-sized characters, @maxlen@ specifies a /wchar/ limit! If the limit lands in the middle of a multi-byte UTF-16 sequence, it may convert a portion of the final character to one or more Unicode character U+FFFD (REPLACEMENT CHARACTER) so as not to overflow a buffer.
--
--     @maxlen@ specifies a maximum number of wchar_t values to compare; if the strings match to this number of wchar_t (or both have matched to a null-terminator character before this number of bytes), they will be considered equal.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_wcsncasecmp@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_wcsncasecmp@, defined at @SDL3\/SDL_stdinc.h 2982:33@
wcsncasecmp
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the maximum number of wchar_t values to compare.
  -> IO BG.Int32
wcsncasecmp =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_wcsncasecmp x00 x11 (Coerce.coerce x22))

-- | This works exactly like strlen() but doesn\'t require access to a C runtime.
--
--     Counts the bytes in @str@, excluding the null terminator.
--
--     If you need the length of a UTF-8 string, consider using @'utf8strlen'@.
--
--     [Returns]: the length (in bytes, excluding the null terminator) of @src@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'strnlen', 'utf8strlen', 'utf8strnlen'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strlen@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strlen@, defined at @SDL3\/SDL_stdinc.h 3029:36@
strlen
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to read. Must not be NULL.
  -> IO BG.Word64
strlen =
  \x00 -> fmap Coerce.coerce (Unsafe.sDL_strlen x00)

-- | This works exactly like strnlen() but doesn\'t require access to a C runtime.
--
--     Counts up to a maximum of @maxlen@ bytes in @str@, excluding the null terminator.
--
--     If you need the length of a UTF-8 string, consider using @'utf8strnlen'@.
--
--     [Returns]: the length (in bytes, excluding the null terminator) of @src@ but never more than @maxlen@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'strlen', 'utf8strlen', 'utf8strnlen'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strnlen@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strnlen@, defined at @SDL3\/SDL_stdinc.h 3053:36@
strnlen
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to read. Must not be NULL.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: The maximum amount of bytes to count.
  -> IO BG.Word64
strnlen =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_strnlen x00 (Coerce.coerce x11))

-- | Copy a string.
--
--     This function copies up to @maxlen@ - 1 characters from @src@ to @dst@, then appends a null terminator.
--
--     If @maxlen@ is 0, no characters are copied and no null terminator is written.
--
--     If you want to copy an UTF-8 string but need to ensure that multi-byte sequences are not truncated, consider using @'utf8strlcpy'@.
--
--     [Returns]: the length (in characters, excluding the null terminator) of @src@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'strlcat', 'utf8strlcpy'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strlcpy@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strlcpy@, defined at @SDL3\/SDL_stdinc.h 3082:36@
strlcpy
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@dst@]: The destination buffer. Must not be NULL, and must not overlap with @src@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@src@]: The null-terminated string to copy. Must not be NULL, and must not overlap with @dst@.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: The length (in characters) of the destination buffer.
  -> IO BG.Word64
strlcpy =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_strlcpy x00 x11 (Coerce.coerce x22))

-- | Copy an UTF-8 string.
--
--     This function copies up to @dst_bytes@ - 1 bytes from @src@ to @dst@ while also ensuring that the string written to @dst@ does not end in a truncated multi-byte sequence. Finally, it appends a null terminator.
--
--     @src@ and @dst@ must not overlap.
--
--     Note that unlike @'strlcpy'@, this function returns the number of bytes written, not the length of @src@.
--
--     [Returns]: the number of bytes written, excluding the null terminator.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'strlcpy'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_utf8strlcpy@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_utf8strlcpy@, defined at @SDL3\/SDL_stdinc.h 3110:36@
utf8strlcpy
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@dst@]: The destination buffer. Must not be NULL, and must not overlap with @src@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@src@]: The null-terminated UTF-8 string to copy. Must not be NULL, and must not overlap with @dst@.
  -> BG.Word64
  -- ^
  --
  --           [@dst_bytes@]: The length (in bytes) of the destination buffer. Must not be 0.
  -> IO BG.Word64
utf8strlcpy =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_utf8strlcpy x00 x11 (Coerce.coerce x22))

-- | Concatenate strings.
--
--     This function appends up to @maxlen@ - SDL_strlen(dst) - 1 characters from @src@ to the end of the string in @dst@, then appends a null terminator.
--
--     @src@ and @dst@ must not overlap.
--
--     If @maxlen@ - SDL_strlen(dst) - 1 is less than or equal to 0, then @dst@ is unmodified.
--
--     [Returns]: the length (in characters, excluding the null terminator) of the string in @dst@ plus the length of @src@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'strlcpy'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strlcat@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strlcat@, defined at @SDL3\/SDL_stdinc.h 3138:36@
strlcat
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@dst@]: The destination buffer already containing the first null-terminated string. Must not be NULL and must not overlap with @src@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@src@]: The second null-terminated string. Must not be NULL, and must not overlap with @dst@.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: The length (in characters) of the destination buffer.
  -> IO BG.Word64
strlcat =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_strlcat x00 x11 (Coerce.coerce x22))

-- | Allocate a copy of a string.
--
--     This allocates enough space for a null-terminated copy of @str@, using 'malloc', and then makes a copy of the string into this space.
--
--     The returned string is owned by the caller, and should be passed to 'free' when no longer needed.
--
--     [Returns]: a pointer to the newly-allocated string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strdup@.
--                   The safe flavor is 'strdupSafe'
--                   .
--
--     [C declaration]: @SDL_strdup@, defined at @SDL3\/SDL_stdinc.h 3156:47@
strdup
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to copy.
  -> IO (BG.Ptr BG.CChar)
strdup = Unsafe.sDL_strdup

-- | Allocate a copy of a string.
--
--     This allocates enough space for a null-terminated copy of @str@, using 'malloc', and then makes a copy of the string into this space.
--
--     The returned string is owned by the caller, and should be passed to 'free' when no longer needed.
--
--     [Returns]: a pointer to the newly-allocated string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_strdup@.
--                   The unsafe flavor is 'strdup'
--                   .
--
--     [C declaration]: @SDL_strdup@, defined at @SDL3\/SDL_stdinc.h 3156:47@
strdupSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to copy.
  -> IO (BG.Ptr BG.CChar)
strdupSafe = Safe.sDL_strdup

-- | Allocate a copy of a string, up to n characters.
--
--     This allocates enough space for a null-terminated copy of @str@, up to @maxlen@ bytes, using 'malloc', and then makes a copy of the string into this space.
--
--     If the string is longer than @maxlen@ bytes, the returned string will be @maxlen@ bytes long, plus a null-terminator character that isn\'t included in the count.
--
--     The returned string is owned by the caller, and should be passed to 'free' when no longer needed.
--
--     [Returns]: a pointer to the newly-allocated string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strndup@.
--                   The safe flavor is 'strndupSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strndup@, defined at @SDL3\/SDL_stdinc.h 3181:47@
strndup
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to copy.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the maximum length of the copied string, not counting the null-terminator character.
  -> IO (BG.Ptr BG.CChar)
strndup =
  \x00 ->
    \x11 -> Unsafe.sDL_strndup x00 (Coerce.coerce x11)

-- | Allocate a copy of a string, up to n characters.
--
--     This allocates enough space for a null-terminated copy of @str@, up to @maxlen@ bytes, using 'malloc', and then makes a copy of the string into this space.
--
--     If the string is longer than @maxlen@ bytes, the returned string will be @maxlen@ bytes long, plus a null-terminator character that isn\'t included in the count.
--
--     The returned string is owned by the caller, and should be passed to 'free' when no longer needed.
--
--     [Returns]: a pointer to the newly-allocated string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_strndup@.
--                   The unsafe flavor is 'strndup'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strndup@, defined at @SDL3\/SDL_stdinc.h 3181:47@
strndupSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to copy.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the maximum length of the copied string, not counting the null-terminator character.
  -> IO (BG.Ptr BG.CChar)
strndupSafe =
  \x00 ->
    \x11 -> Safe.sDL_strndup x00 (Coerce.coerce x11)

-- | Reverse a string\'s contents.
--
--     This reverses a null-terminated string in-place. Only the content of the string is reversed; the null-terminator character remains at the end of the reversed string.
--
--     __WARNING__: This function reverses the /bytes/ of the string, not the codepoints. If @str@ is a UTF-8 string with Unicode codepoints > 127, this will ruin the string data. You should only use this function on strings that are completely comprised of low ASCII characters.
--
--     [Returns]: @str@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strrev@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [C declaration]: @SDL_strrev@, defined at @SDL3\/SDL_stdinc.h 3202:36@
strrev
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the string to reverse.
  -> IO (BG.Ptr BG.CChar)
strrev = Unsafe.sDL_strrev

-- | Convert a string to uppercase.
--
--     __WARNING__: Regardless of system locale, this will only convert ASCII values \'A\' through \'Z\' to uppercase.
--
--     This function operates on a null-terminated string of bytes even if it is malformed UTF-8! and converts ASCII characters \'a\' through \'z\' to their uppercase equivalents in-place, returning the original @str@ pointer.
--
--     [Returns]: the @str@ pointer passed into this function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'strlwr'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strupr@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [C declaration]: @SDL_strupr@, defined at @SDL3\/SDL_stdinc.h 3223:36@
strupr
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the string to convert in-place. Can not be NULL.
  -> IO (BG.Ptr BG.CChar)
strupr = Unsafe.sDL_strupr

-- | Convert a string to lowercase.
--
--     __WARNING__: Regardless of system locale, this will only convert ASCII values \'A\' through \'Z\' to lowercase.
--
--     This function operates on a null-terminated string of bytes even if it is malformed UTF-8! and converts ASCII characters \'A\' through \'Z\' to their lowercase equivalents in-place, returning the original @str@ pointer.
--
--     [Returns]: the @str@ pointer passed into this function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'strupr'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strlwr@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [C declaration]: @SDL_strlwr@, defined at @SDL3\/SDL_stdinc.h 3244:36@
strlwr
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the string to convert in-place. Can not be NULL.
  -> IO (BG.Ptr BG.CChar)
strlwr = Unsafe.sDL_strlwr

-- | Search a string for the first instance of a specific byte.
--
--     The search ends once it finds the requested byte value, or a null terminator byte to end the string.
--
--     Note that this looks for /bytes/, not /characters/, so you cannot match against a Unicode codepoint > 255, regardless of character encoding.
--
--     [Returns]: a pointer to the first instance of @c@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strchr@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strchr@, defined at @SDL3\/SDL_stdinc.h 3264:36@
strchr
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to search. Must not be NULL.
  -> BG.Int32
  -- ^
  --
  --           [@c@]: the byte value to search for.
  -> IO (BG.Ptr BG.CChar)
strchr =
  \x00 ->
    \x11 -> Unsafe.sDL_strchr x00 (Coerce.coerce x11)

-- | Search a string for the last instance of a specific byte.
--
--     The search must go until it finds a null terminator byte to end the string.
--
--     Note that this looks for /bytes/, not /characters/, so you cannot match against a Unicode codepoint > 255, regardless of character encoding.
--
--     [Returns]: a pointer to the last instance of @c@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strrchr@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strrchr@, defined at @SDL3\/SDL_stdinc.h 3283:36@
strrchr
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to search. Must not be NULL.
  -> BG.Int32
  -- ^
  --
  --           [@c@]: the byte value to search for.
  -> IO (BG.Ptr BG.CChar)
strrchr =
  \x00 ->
    \x11 -> Unsafe.sDL_strrchr x00 (Coerce.coerce x11)

-- | Search a string for the first instance of a specific substring.
--
--     The search ends once it finds the requested substring, or a null terminator byte to end the string.
--
--     Note that this looks for strings of /bytes/, not /characters/, so it\'s legal to search for malformed and incomplete UTF-8 sequences.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strstr@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [C declaration]: @SDL_strstr@, defined at @SDL3\/SDL_stdinc.h 3303:36@
strstr
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@haystack@]: the string to search. Must not be NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@needle@]: the string to search for. Must not be NULL.
  -> IO (BG.Ptr BG.CChar)
strstr = Unsafe.sDL_strstr

-- | Search a string, up to n bytes, for the first instance of a specific substring.
--
--     The search ends once it finds the requested substring, or a null terminator byte to end the string, or @maxlen@ bytes have been examined. It is possible to use this function on a string without a null terminator.
--
--     Note that this looks for strings of /bytes/, not /characters/, so it\'s legal to search for malformed and incomplete UTF-8 sequences.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strnstr@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strnstr@, defined at @SDL3\/SDL_stdinc.h 3326:36@
strnstr
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@haystack@]: the string to search. Must not be NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@needle@]: the string to search for. Must not be NULL.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the maximum number of bytes to search in @haystack@.
  -> IO (BG.Ptr BG.CChar)
strnstr =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_strnstr x00 x11 (Coerce.coerce x22)

-- | Search a UTF-8 string for the first instance of a specific substring, case-insensitively.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Since this handles Unicode, it expects the strings to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strcasestr@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [C declaration]: @SDL_strcasestr@, defined at @SDL3\/SDL_stdinc.h 3354:36@
strcasestr
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@haystack@]: the string to search. Must not be NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@needle@]: the string to search for. Must not be NULL.
  -> IO (BG.Ptr BG.CChar)
strcasestr = Unsafe.sDL_strcasestr

-- | This works exactly like strtok_r() but doesn\'t require access to a C runtime.
--
--     Break a string up into a series of tokens.
--
--     To start tokenizing a new string, @str@ should be the non-NULL address of the string to start tokenizing. Future calls to get the next token from the same string should specify a NULL.
--
--     Note that this function will overwrite pieces of @str@ with null chars to split it into tokens. This function cannot be used with const\/read-only strings!
--
--     @saveptr@ just needs to point to a @char *@ that can be overwritten; SDL will use this to save tokenizing state between calls. It is initialized if @str@ is non-NULL, and used to resume tokenizing when @str@ is NULL.
--
--     [Returns]: A pointer to the next token, or NULL if no tokens remain.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strtok_r@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [C declaration]: @SDL_strtok_r@, defined at @SDL3\/SDL_stdinc.h 3383:36@
strtokR
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the string to tokenize, or NULL to continue tokenizing.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@delim@]: the delimiter string that separates tokens.
  -> BG.Ptr (BG.Ptr BG.CChar)
  -- ^
  --
  --           [@saveptr@]: pointer to a char *, used for ongoing state.
  -> IO (BG.Ptr BG.CChar)
strtokR = Unsafe.sDL_strtok_r

-- | Count the number of codepoints in a UTF-8 string.
--
--     Counts the /codepoints/, not /bytes/, in @str@, excluding the null terminator.
--
--     If you need to count the bytes in a string instead, consider using @'strlen'@.
--
--     Since this handles Unicode, it expects the strings to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), so a malformed or incomplete UTF-8 sequence might increase the count by several replacement characters.
--
--     [Returns]: The length (in codepoints, excluding the null terminator) of @src@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'utf8strnlen', 'strlen'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_utf8strlen@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_utf8strlen@, defined at @SDL3\/SDL_stdinc.h 3411:36@
utf8strlen
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated UTF-8 string to read. Must not be NULL.
  -> IO BG.Word64
utf8strlen =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_utf8strlen x00)

-- | Count the number of codepoints in a UTF-8 string, up to n bytes.
--
--     Counts the /codepoints/, not /bytes/, in @str@, excluding the null terminator.
--
--     If you need to count the bytes in a string instead, consider using @'strnlen'@.
--
--     The counting stops at @bytes@ bytes (not codepoints!). This seems counterintuitive, but makes it easy to express the total size of the string\'s buffer.
--
--     Since this handles Unicode, it expects the strings to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), so a malformed or incomplete UTF-8 sequence might increase the count by several replacement characters.
--
--     [Returns]: The length (in codepoints, excluding the null terminator) of @src@ but never more than @maxlen@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'utf8strlen', 'strnlen'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_utf8strnlen@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_utf8strnlen@, defined at @SDL3\/SDL_stdinc.h 3444:36@
utf8strnlen
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated UTF-8 string to read. Must not be NULL.
  -> BG.Word64
  -- ^
  --
  --           [@bytes@]: The maximum amount of bytes to count.
  -> IO BG.Word64
utf8strnlen =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_utf8strnlen x00 (Coerce.coerce x11))

-- | Convert an integer into a string.
--
--     This requires a radix to specified for string format. Specifying 10 produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2 to 36.
--
--     Note that this function will overflow a buffer if @str@ is not large enough to hold the output! It may be safer to use SDL_snprintf to clamp output, or SDL_asprintf to allocate a buffer. Otherwise, it doesn\'t hurt to allocate much more space than you expect to use (and don\'t forget possible negative signs, null terminator bytes, etc).
--
--     [Returns]: @str@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'uitoa', @SDL_ltoa@, 'lltoa'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_itoa@.
--                   The safe import is not exported
--                   : pure numeric conversion over a short caller buffer; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_itoa@, defined at @SDL3\/SDL_stdinc.h 3472:36@
itoa
  :: BG.Int32
  -- ^
  --
  --           [@value@]: the integer to convert.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the buffer to write the string into.
  -> BG.Int32
  -- ^
  --
  --           [@radix@]: the radix to use for string generation.
  -> IO (BG.Ptr BG.CChar)
itoa =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_itoa (Coerce.coerce x00) x11 (Coerce.coerce x22)

-- | Convert an unsigned integer into a string.
--
--     This requires a radix to specified for string format. Specifying 10 produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2 to 36.
--
--     Note that this function will overflow a buffer if @str@ is not large enough to hold the output! It may be safer to use SDL_snprintf to clamp output, or SDL_asprintf to allocate a buffer. Otherwise, it doesn\'t hurt to allocate much more space than you expect to use (and don\'t forget null terminator bytes, etc).
--
--     [Returns]: @str@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'itoa', @SDL_ultoa@, 'ulltoa'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_uitoa@.
--                   The safe import is not exported
--                   : pure numeric conversion over a short caller buffer; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_uitoa@, defined at @SDL3\/SDL_stdinc.h 3500:36@
uitoa
  :: BG.Word32
  -- ^
  --
  --           [@value@]: the unsigned integer to convert.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the buffer to write the string into.
  -> BG.Int32
  -- ^
  --
  --           [@radix@]: the radix to use for string generation.
  -> IO (BG.Ptr BG.CChar)
uitoa =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_uitoa (Coerce.coerce x00) x11 (Coerce.coerce x22)

-- | Convert a long long integer into a string.
--
--     This requires a radix to specified for string format. Specifying 10 produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2 to 36.
--
--     Note that this function will overflow a buffer if @str@ is not large enough to hold the output! It may be safer to use SDL_snprintf to clamp output, or SDL_asprintf to allocate a buffer. Otherwise, it doesn\'t hurt to allocate much more space than you expect to use (and don\'t forget possible negative signs, null terminator bytes, etc).
--
--     [Returns]: @str@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'ulltoa', 'itoa', @SDL_ltoa@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_lltoa@.
--                   The safe import is not exported
--                   : pure numeric conversion over a short caller buffer; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_lltoa@, defined at @SDL3\/SDL_stdinc.h 3586:36@
lltoa
  :: BG.Int64
  -- ^
  --
  --           [@value@]: the long long integer to convert.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the buffer to write the string into.
  -> BG.Int32
  -- ^
  --
  --           [@radix@]: the radix to use for string generation.
  -> IO (BG.Ptr BG.CChar)
lltoa =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_lltoa (Coerce.coerce x00) x11 (Coerce.coerce x22)

-- | Convert an unsigned long long integer into a string.
--
--     This requires a radix to specified for string format. Specifying 10 produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2 to 36.
--
--     Note that this function will overflow a buffer if @str@ is not large enough to hold the output! It may be safer to use SDL_snprintf to clamp output, or SDL_asprintf to allocate a buffer. Otherwise, it doesn\'t hurt to allocate much more space than you expect to use (and don\'t forget null terminator bytes, etc).
--
--     [Returns]: @str@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'lltoa', 'uitoa', @SDL_ultoa@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ulltoa@.
--                   The safe import is not exported
--                   : pure numeric conversion over a short caller buffer; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ulltoa@, defined at @SDL3\/SDL_stdinc.h 3614:36@
ulltoa
  :: BG.Word64
  -- ^
  --
  --           [@value@]: the unsigned long long integer to convert.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the buffer to write the string into.
  -> BG.Int32
  -- ^
  --
  --           [@radix@]: the radix to use for string generation.
  -> IO (BG.Ptr BG.CChar)
ulltoa =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_ulltoa (Coerce.coerce x00) x11 (Coerce.coerce x22)

-- | Parse an @int@ from a string.
--
--     The result of calling @SDL_atoi(str)@ is equivalent to @(int)SDL_strtol(str, NULL, 10)@.
--
--     [Returns]: the parsed @int@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'atof', @SDL_strtol@, @SDL_strtoul@, 'strtoll', 'strtoull', 'strtod', 'itoa'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_atoi@.
--                   The safe import is not exported
--                   : pure numeric conversion over a short caller buffer; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_atoi@, defined at @SDL3\/SDL_stdinc.h 3638:33@
atoi
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to read. Must not be NULL.
  -> IO BG.Int32
atoi =
  \x00 -> fmap Coerce.coerce (Unsafe.sDL_atoi x00)

-- | Parse a @double@ from a string.
--
--     The result of calling @SDL_atof(str)@ is equivalent to @SDL_strtod(str, NULL)@.
--
--     [Returns]: the parsed @double@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'atoi', @SDL_strtol@, @SDL_strtoul@, 'strtoll', 'strtoull', 'strtod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_atof@.
--                   The safe import is not exported
--                   : pure numeric conversion over a short caller buffer; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_atof@, defined at @SDL3\/SDL_stdinc.h 3660:36@
atof
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to read. Must not be NULL.
  -> IO Double
atof =
  \x00 -> fmap Coerce.coerce (Unsafe.sDL_atof x00)

-- | Parse a @long long@ from a string.
--
--     If @str@ starts with whitespace, then those whitespace characters are skipped before attempting to parse the number.
--
--     If the parsed number does not fit inside a @long long@, the result is clamped to the minimum and maximum representable @long long@ values.
--
--     [Returns]: the parsed @long long@, or 0 if no number could be parsed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'atoi', 'atof', @SDL_strtol@, @SDL_strtoul@, 'strtoull', 'strtod', 'lltoa'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strtoll@.
--                   The safe import is not exported
--                   : pure numeric conversion over a short caller buffer; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strtoll@, defined at @SDL3\/SDL_stdinc.h 3762:39@
strtoll
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to read. Must not be NULL.
  -> BG.Ptr (BG.Ptr BG.CChar)
  -- ^
  --
  --           [@endp@]: If not NULL, the address of the first invalid character (i.e. the next character after the parsed number) will be written to this pointer.
  -> BG.Int32
  -- ^
  --
  --           [@base@]: The base of the integer to read. Supported values are 0 and 2 to 36 inclusive. If 0, the base will be inferred from the number\'s prefix (0x for hexadecimal, 0 for octal, decimal otherwise).
  -> IO BG.Int64
strtoll =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_strtoll x00 x11 (Coerce.coerce x22))

-- | Parse an @unsigned long long@ from a string.
--
--     If @str@ starts with whitespace, then those whitespace characters are skipped before attempting to parse the number.
--
--     If the parsed number does not fit inside an @unsigned long long@, the result is clamped to the maximum representable @unsigned long long@ value.
--
--     [Returns]: the parsed @unsigned long long@, or 0 if no number could be parsed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'atoi', 'atof', @SDL_strtol@, 'strtoll', @SDL_strtoul@, 'strtod', 'ulltoa'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strtoull@.
--                   The safe import is not exported
--                   : pure numeric conversion over a short caller buffer; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strtoull@, defined at @SDL3\/SDL_stdinc.h 3796:48@
strtoull
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to read. Must not be NULL.
  -> BG.Ptr (BG.Ptr BG.CChar)
  -- ^
  --
  --           [@endp@]: If not NULL, the address of the first invalid character (i.e. the next character after the parsed number) will be written to this pointer.
  -> BG.Int32
  -- ^
  --
  --           [@base@]: The base of the integer to read. Supported values are 0 and 2 to 36 inclusive. If 0, the base will be inferred from the number\'s prefix (0x for hexadecimal, 0 for octal, decimal otherwise).
  -> IO BG.Word64
strtoull =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_strtoull x00 x11 (Coerce.coerce x22))

-- | Parse a @double@ from a string.
--
--     This function makes fewer guarantees than the C runtime @strtod@:
--
--     * Only decimal notation is guaranteed to be supported. The handling of scientific and hexadecimal notation is unspecified.
--
--     * Whether or not INF and NAN can be parsed is unspecified.
--
--     * The precision of the result is unspecified.
--
--     [Returns]: the parsed @double@, or 0 if no number could be parsed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'atoi', 'atof', @SDL_strtol@, 'strtoll', @SDL_strtoul@, 'strtoull'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strtod@.
--                   The safe import is not exported
--                   : pure numeric conversion over a short caller buffer; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strtod@, defined at @SDL3\/SDL_stdinc.h 3826:36@
strtod
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the null-terminated string to read. Must not be NULL.
  -> BG.Ptr (BG.Ptr BG.CChar)
  -- ^
  --
  --           [@endp@]: if not NULL, the address of the first invalid character (i.e. the next character after the parsed number) will be written to this pointer.
  -> IO Double
strtod =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_strtod x00 x11)

-- | Compare two null-terminated UTF-8 strings.
--
--     Due to the nature of UTF-8 encoding, this will work with Unicode strings, since effectively this function just compares bytes until it hits a null-terminating character. Also due to the nature of UTF-8, this can be used with @'qsortSafe'@ to put strings in (roughly) alphabetical order.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strcmp@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strcmp@, defined at @SDL3\/SDL_stdinc.h 3846:33@
strcmp
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> IO BG.Int32
strcmp =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_strcmp x00 x11)

-- | Compare two UTF-8 strings up to a number of bytes.
--
--     Due to the nature of UTF-8 encoding, this will work with Unicode strings, since effectively this function just compares bytes until it hits a null-terminating character. Also due to the nature of UTF-8, this can be used with @'qsortSafe'@ to put strings in (roughly) alphabetical order.
--
--     Note that while this function is intended to be used with UTF-8, it is doing a bytewise comparison, and @maxlen@ specifies a /byte/ limit! If the limit lands in the middle of a multi-byte UTF-8 sequence, it will only compare a portion of the final character.
--
--     @maxlen@ specifies a maximum number of bytes to compare; if the strings match to this number of bytes (or both have matched to a null-terminator character before this number of bytes), they will be considered equal.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strncmp@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strncmp@, defined at @SDL3\/SDL_stdinc.h 3876:33@
strncmp
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the maximum number of /bytes/ to compare.
  -> IO BG.Int32
strncmp =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_strncmp x00 x11 (Coerce.coerce x22))

-- | Compare two null-terminated UTF-8 strings, case-insensitively.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Since this handles Unicode, it expects the string to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strcasecmp@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strcasecmp@, defined at @SDL3\/SDL_stdinc.h 3904:33@
strcasecmp
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> IO BG.Int32
strcasecmp =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_strcasecmp x00 x11)

-- | Compare two UTF-8 strings, case-insensitively, up to a number of bytes.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Since this handles Unicode, it expects the string to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     Note that while this function is intended to be used with UTF-8, @maxlen@ specifies a /byte/ limit! If the limit lands in the middle of a multi-byte UTF-8 sequence, it may convert a portion of the final character to one or more Unicode character U+FFFD (REPLACEMENT CHARACTER) so as not to overflow a buffer.
--
--     @maxlen@ specifies a maximum number of bytes to compare; if the strings match to this number of bytes (or both have matched to a null-terminator character before this number of bytes), they will be considered equal.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strncasecmp@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_strncasecmp@, defined at @SDL3\/SDL_stdinc.h 3944:33@
strncasecmp
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the maximum number of bytes to compare.
  -> IO BG.Int32
strncasecmp =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_strncasecmp x00 x11 (Coerce.coerce x22))

-- | Searches a string for the first occurrence of any character contained in a breakset, and returns a pointer from the string to that character.
--
--     [Returns]: A pointer to the location, in str, of the first occurrence of a character present in the breakset, or NULL if none is found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_strpbrk@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [C declaration]: @SDL_strpbrk@, defined at @SDL3\/SDL_stdinc.h 3962:36@
strpbrk
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to be searched. Must not be NULL, and must not overlap with @breakset@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@breakset@]: A null-terminated string containing the list of characters to look for. Must not be NULL, and must not overlap with @str@.
  -> IO (BG.Ptr BG.CChar)
strpbrk = Unsafe.sDL_strpbrk

-- | Decode a UTF-8 string, one Unicode codepoint at a time.
--
--     This will return the first Unicode codepoint in the UTF-8 encoded string in @*pstr@, and then advance @*pstr@ past any consumed bytes before returning.
--
--     It will not access more than @*pslen@ bytes from the string. @*pslen@ will be adjusted, as well, subtracting the number of bytes consumed.
--
--     @pslen@ is allowed to be NULL, in which case the string /must/ be NULL-terminated, as the function will blindly read until it sees the NULL char.
--
--     if @*pslen@ is zero, it assumes the end of string is reached and returns a zero codepoint regardless of the contents of the string buffer.
--
--     If the resulting codepoint is zero (a NULL terminator), or @*pslen@ is zero, it will not advance @*pstr@ or @*pslen@ at all.
--
--     Generally this function is called in a loop until it returns zero, adjusting its parameters each iteration.
--
--     If an invalid UTF-8 sequence is encountered, this function returns SDL_INVALID_UNICODE_CODEPOINT and advances the string\/length by one byte (which is to say, a multibyte sequence might produce several SDL_INVALID_UNICODE_CODEPOINT returns before it syncs to the next valid UTF-8 sequence).
--
--     Several things can generate invalid UTF-8 sequences, including overlong encodings, the use of UTF-16 surrogate values, and truncated data. Please refer to [RFC3629](https://www.ietf.org/rfc/rfc3629.txt) for details.
--
--     [Returns]: the first Unicode codepoint in the string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_StepUTF8@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StepUTF8@, defined at @SDL3\/SDL_stdinc.h 4022:36@
stepUTF8
  :: BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@pstr@]: a pointer to a UTF-8 string pointer to be read and adjusted.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@pslen@]: a pointer to the number of bytes in the string, to be read and adjusted. NULL is allowed.
  -> IO BG.Word32
stepUTF8 =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_StepUTF8 x00 x11)

-- | Decode a UTF-8 string in reverse, one Unicode codepoint at a time.
--
--     This will go to the start of the previous Unicode codepoint in the string, move @*pstr@ to that location and return that codepoint.
--
--     If @*pstr@ is already at the start of the string), it will not advance @*pstr@ at all.
--
--     Generally this function is called in a loop until it returns zero, adjusting its parameter each iteration.
--
--     If an invalid UTF-8 sequence is encountered, this function returns SDL_INVALID_UNICODE_CODEPOINT.
--
--     Several things can generate invalid UTF-8 sequences, including overlong encodings, the use of UTF-16 surrogate values, and truncated data. Please refer to [RFC3629](https://www.ietf.org/rfc/rfc3629.txt) for details.
--
--     [Returns]: the previous Unicode codepoint in the string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_StepBackUTF8@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StepBackUTF8@, defined at @SDL3\/SDL_stdinc.h 4053:36@
stepBackUTF8
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@start@]: a pointer to the beginning of the UTF-8 string.
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@pstr@]: a pointer to a UTF-8 string pointer to be read and adjusted.
  -> IO BG.Word32
stepBackUTF8 =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_StepBackUTF8 x00 x11)

-- | Convert a single Unicode codepoint to UTF-8.
--
--     The buffer pointed to by @dst@ must be at least 4 bytes long, as this function may generate between 1 and 4 bytes of output.
--
--     This function returns the first byte /after/ the newly-written UTF-8 sequence, which is useful for encoding multiple codepoints in a loop, or knowing where to write a NULL-terminator character to end the string (in either case, plan to have a buffer of /more/ than 4 bytes!).
--
--     If @codepoint@ is an invalid value (outside the Unicode range, or a UTF-16 surrogate value, etc), this will use U+FFFD (REPLACEMENT CHARACTER) for the codepoint instead, and not set an error.
--
--     If @dst@ is NULL, this returns NULL immediately without writing to the pointer and without setting an error.
--
--     [Returns]: the first byte past the newly-written UTF-8 sequence.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UCS4ToUTF8@.
--                   The safe import is not exported
--                   : string computation over caller memory with no allocation; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UCS4ToUTF8@, defined at @SDL3\/SDL_stdinc.h 4082:36@
ucs4ToUTF8
  :: BG.Word32
  -- ^
  --
  --           [@codepoint@]: a Unicode codepoint to convert to UTF-8.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@dst@]: the location to write the encoded UTF-8. Must point to at least 4 bytes!
  -> IO (BG.Ptr BG.CChar)
ucs4ToUTF8 =
  \x00 ->
    \x11 -> Unsafe.sDL_UCS4ToUTF8 (Coerce.coerce x00) x11

-- | Seeds the pseudo-random number generator.
--
--     Reusing the seed number will cause @'rand'@ to repeat the same stream of \'random\' numbers.
--
--     [Thread safety]: This should be called on the same thread that calls @'rand'@
--
--     @since 3.2.0
--
--     [See also]: 'rand', 'randBits', 'randf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_srand@.
--                   The safe flavor is 'srandSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_srand@, defined at @SDL3\/SDL_stdinc.h 4294:34@
srand
  :: BG.Word64
  -- ^
  --
  --           [@seed@]: the value to use as a random number seed, or 0 to use 'SDL3.Sys.Timer.getPerformanceCounter'.
  -> IO ()
srand = \x00 -> Unsafe.sDL_srand (Coerce.coerce x00)

-- | Seeds the pseudo-random number generator.
--
--     Reusing the seed number will cause @'rand'@ to repeat the same stream of \'random\' numbers.
--
--     [Thread safety]: This should be called on the same thread that calls @'rand'@
--
--     @since 3.2.0
--
--     [See also]: 'rand', 'randBits', 'randf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_srand@.
--                   The unsafe flavor is 'srand'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_srand@, defined at @SDL3\/SDL_stdinc.h 4294:34@
srandSafe
  :: BG.Word64
  -- ^
  --
  --           [@seed@]: the value to use as a random number seed, or 0 to use 'SDL3.Sys.Timer.getPerformanceCounter'.
  -> IO ()
srandSafe =
  \x00 -> Safe.sDL_srand (Coerce.coerce x00)

-- | Generate a pseudo-random number less than n for positive n
--
--     The method used is faster and of better quality than @rand() % n@. Odds are roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and much worse as n gets bigger.
--
--     Example: to simulate a d6 use @SDL_rand(6) + 1@ The +1 converts 0..5 to 1..6
--
--     If you want to generate a pseudo-random number in the full range of 'Sint32', you should use: ('Sint32') @'randBits'@
--
--     If you want reproducible output, be sure to initialize with @'srand'@ first.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0 .. n-1].
--
--     [Thread safety]: All calls should be made from a single thread
--
--     @since 3.2.0
--
--     [See also]: 'srand', 'randf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_rand@.
--                   The safe flavor is 'randSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_rand@, defined at @SDL3\/SDL_stdinc.h 4328:36@
rand
  :: BG.Int32
  -- ^
  --
  --           [@n@]: the number of possible outcomes. n must be positive.
  -> IO BG.Int32
rand =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_rand (Coerce.coerce x00))

-- | Generate a pseudo-random number less than n for positive n
--
--     The method used is faster and of better quality than @rand() % n@. Odds are roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and much worse as n gets bigger.
--
--     Example: to simulate a d6 use @SDL_rand(6) + 1@ The +1 converts 0..5 to 1..6
--
--     If you want to generate a pseudo-random number in the full range of 'Sint32', you should use: ('Sint32') @'randBits'@
--
--     If you want reproducible output, be sure to initialize with @'srand'@ first.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0 .. n-1].
--
--     [Thread safety]: All calls should be made from a single thread
--
--     @since 3.2.0
--
--     [See also]: 'srand', 'randf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_rand@.
--                   The unsafe flavor is 'rand'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_rand@, defined at @SDL3\/SDL_stdinc.h 4328:36@
randSafe
  :: BG.Int32
  -- ^
  --
  --           [@n@]: the number of possible outcomes. n must be positive.
  -> IO BG.Int32
randSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_rand (Coerce.coerce x00))

-- | Generate a uniform pseudo-random floating point number less than 1.0
--
--     If you want reproducible output, be sure to initialize with @'srand'@ first.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0.0, 1.0).
--
--     [Thread safety]: All calls should be made from a single thread
--
--     @since 3.2.0
--
--     [See also]: 'srand', 'rand'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_randf@.
--                   The safe flavor is 'randfSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_randf@, defined at @SDL3\/SDL_stdinc.h 4351:35@
randf :: IO Float
randf = fmap Coerce.coerce Unsafe.sDL_randf

-- | Generate a uniform pseudo-random floating point number less than 1.0
--
--     If you want reproducible output, be sure to initialize with @'srand'@ first.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0.0, 1.0).
--
--     [Thread safety]: All calls should be made from a single thread
--
--     @since 3.2.0
--
--     [See also]: 'srand', 'rand'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_randf@.
--                   The unsafe flavor is 'randf'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_randf@, defined at @SDL3\/SDL_stdinc.h 4351:35@
randfSafe :: IO Float
randfSafe = fmap Coerce.coerce Safe.sDL_randf

-- | Generate 32 pseudo-random bits.
--
--     You likely want to use @'rand'@ to get a psuedo-random number instead.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0-SDL_MAX_UINT32].
--
--     [Thread safety]: All calls should be made from a single thread
--
--     @since 3.2.0
--
--     [See also]: 'rand', 'randf', 'srand'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_rand_bits@.
--                   The safe flavor is 'randBitsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_rand_bits@, defined at @SDL3\/SDL_stdinc.h 4374:36@
randBits :: IO BG.Word32
randBits = fmap Coerce.coerce Unsafe.sDL_rand_bits

-- | Generate 32 pseudo-random bits.
--
--     You likely want to use @'rand'@ to get a psuedo-random number instead.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0-SDL_MAX_UINT32].
--
--     [Thread safety]: All calls should be made from a single thread
--
--     @since 3.2.0
--
--     [See also]: 'rand', 'randf', 'srand'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_rand_bits@.
--                   The unsafe flavor is 'randBits'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_rand_bits@, defined at @SDL3\/SDL_stdinc.h 4374:36@
randBitsSafe :: IO BG.Word32
randBitsSafe = fmap Coerce.coerce Safe.sDL_rand_bits

-- | Generate a pseudo-random number less than n for positive n
--
--     The method used is faster and of better quality than @rand() % n@. Odds are roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and much worse as n gets bigger.
--
--     Example: to simulate a d6 use @SDL_rand_r(state, 6) + 1@ The +1 converts 0..5 to 1..6
--
--     If you want to generate a pseudo-random number in the full range of 'Sint32', you should use: ('Sint32')SDL_rand_bits_r(state)
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0 .. n-1].
--
--     [Thread safety]: This function is thread-safe, as long as the state pointer isn\'t shared between threads.
--
--     @since 3.2.0
--
--     [See also]: 'rand', 'randBitsR', 'randfR'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_rand_r@.
--                   The safe flavor is 'randRSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_rand_r@, defined at @SDL3\/SDL_stdinc.h 4409:36@
randR
  :: BG.Ptr Uint64
  -- ^
  --
  --           [@state@]: a pointer to the current random number state, this may not be NULL.
  -> BG.Int32
  -- ^
  --
  --           [@n@]: the number of possible outcomes. n must be positive.
  -> IO BG.Int32
randR =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_rand_r x00 (Coerce.coerce x11))

-- | Generate a pseudo-random number less than n for positive n
--
--     The method used is faster and of better quality than @rand() % n@. Odds are roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and much worse as n gets bigger.
--
--     Example: to simulate a d6 use @SDL_rand_r(state, 6) + 1@ The +1 converts 0..5 to 1..6
--
--     If you want to generate a pseudo-random number in the full range of 'Sint32', you should use: ('Sint32')SDL_rand_bits_r(state)
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0 .. n-1].
--
--     [Thread safety]: This function is thread-safe, as long as the state pointer isn\'t shared between threads.
--
--     @since 3.2.0
--
--     [See also]: 'rand', 'randBitsR', 'randfR'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_rand_r@.
--                   The unsafe flavor is 'randR'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_rand_r@, defined at @SDL3\/SDL_stdinc.h 4409:36@
randRSafe
  :: BG.Ptr Uint64
  -- ^
  --
  --           [@state@]: a pointer to the current random number state, this may not be NULL.
  -> BG.Int32
  -- ^
  --
  --           [@n@]: the number of possible outcomes. n must be positive.
  -> IO BG.Int32
randRSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_rand_r x00 (Coerce.coerce x11))

-- | Generate a uniform pseudo-random floating point number less than 1.0
--
--     If you want reproducible output, be sure to initialize with @'srand'@ first.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0.0, 1.0).
--
--     [Thread safety]: This function is thread-safe, as long as the state pointer isn\'t shared between threads.
--
--     @since 3.2.0
--
--     [See also]: 'randBitsR', 'randR', 'randf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_randf_r@.
--                   The safe flavor is 'randfRSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_randf_r@, defined at @SDL3\/SDL_stdinc.h 4436:35@
randfR
  :: BG.Ptr Uint64
  -- ^
  --
  --           [@state@]: a pointer to the current random number state, this may not be NULL.
  -> IO Float
randfR =
  \x00 -> fmap Coerce.coerce (Unsafe.sDL_randf_r x00)

-- | Generate a uniform pseudo-random floating point number less than 1.0
--
--     If you want reproducible output, be sure to initialize with @'srand'@ first.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0.0, 1.0).
--
--     [Thread safety]: This function is thread-safe, as long as the state pointer isn\'t shared between threads.
--
--     @since 3.2.0
--
--     [See also]: 'randBitsR', 'randR', 'randf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_randf_r@.
--                   The unsafe flavor is 'randfR'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_randf_r@, defined at @SDL3\/SDL_stdinc.h 4436:35@
randfRSafe
  :: BG.Ptr Uint64
  -- ^
  --
  --           [@state@]: a pointer to the current random number state, this may not be NULL.
  -> IO Float
randfRSafe =
  \x00 -> fmap Coerce.coerce (Safe.sDL_randf_r x00)

-- | Generate 32 pseudo-random bits.
--
--     You likely want to use @'randR'@ to get a psuedo-random number instead.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0-SDL_MAX_UINT32].
--
--     [Thread safety]: This function is thread-safe, as long as the state pointer isn\'t shared between threads.
--
--     @since 3.2.0
--
--     [See also]: 'randR', 'randfR'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_rand_bits_r@.
--                   The safe flavor is 'randBitsRSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_rand_bits_r@, defined at @SDL3\/SDL_stdinc.h 4461:36@
randBitsR
  :: BG.Ptr Uint64
  -- ^
  --
  --           [@state@]: a pointer to the current random number state, this may not be NULL.
  -> IO BG.Word32
randBitsR =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_rand_bits_r x00)

-- | Generate 32 pseudo-random bits.
--
--     You likely want to use @'randR'@ to get a psuedo-random number instead.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0-SDL_MAX_UINT32].
--
--     [Thread safety]: This function is thread-safe, as long as the state pointer isn\'t shared between threads.
--
--     @since 3.2.0
--
--     [See also]: 'randR', 'randfR'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_rand_bits_r@.
--                   The unsafe flavor is 'randBitsR'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_rand_bits_r@, defined at @SDL3\/SDL_stdinc.h 4461:36@
randBitsRSafe
  :: BG.Ptr Uint64
  -- ^
  --
  --           [@state@]: a pointer to the current random number state, this may not be NULL.
  -> IO BG.Word32
randBitsRSafe =
  \x00 -> fmap Coerce.coerce (Safe.sDL_rand_bits_r x00)

-- | Compute the arc cosine of @x@.
--
--     The definition of @y = acos(x)@ is @x = cos(y)@.
--
--     Domain: @-1 \<= x \<= 1@
--
--     Range: @0 \<= y \<= Pi@
--
--     This function operates on double-precision floating point values, use 'acosf' for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: arc cosine of @x@, in radians.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'acosf', 'asin', 'cos'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_acos@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_acos@, defined at @SDL3\/SDL_stdinc.h 4515:36@
acos
  :: Double
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Double
acos =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_acos (Coerce.coerce x00))

-- | Compute the arc cosine of @x@.
--
--     The definition of @y = acos(x)@ is @x = cos(y)@.
--
--     Domain: @-1 \<= x \<= 1@
--
--     Range: @0 \<= y \<= Pi@
--
--     This function operates on single-precision floating point values, use 'acos' for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: arc cosine of @x@, in radians.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'acos', 'asinf', 'cosf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_acosf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_acosf@, defined at @SDL3\/SDL_stdinc.h 4545:35@
acosf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Float
acosf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_acosf (Coerce.coerce x00))

-- | Compute the arc sine of @x@.
--
--     The definition of @y = asin(x)@ is @x = sin(y)@.
--
--     Domain: @-1 \<= x \<= 1@
--
--     Range: @-Pi\/2 \<= y \<= Pi\/2@
--
--     This function operates on double-precision floating point values, use 'asinf' for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: arc sine of @x@, in radians.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'asinf', 'acos', 'sin'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_asin@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_asin@, defined at @SDL3\/SDL_stdinc.h 4575:36@
asin
  :: Double
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Double
asin =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_asin (Coerce.coerce x00))

-- | Compute the arc sine of @x@.
--
--     The definition of @y = asin(x)@ is @x = sin(y)@.
--
--     Domain: @-1 \<= x \<= 1@
--
--     Range: @-Pi\/2 \<= y \<= Pi\/2@
--
--     This function operates on single-precision floating point values, use 'asin' for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: arc sine of @x@, in radians.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'asin', 'acosf', 'sinf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_asinf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_asinf@, defined at @SDL3\/SDL_stdinc.h 4605:35@
asinf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Float
asinf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_asinf (Coerce.coerce x00))

-- | Compute the arc tangent of @x@.
--
--     The definition of @y = atan(x)@ is @x = tan(y)@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-Pi\/2 \<= y \<= Pi\/2@
--
--     This function operates on double-precision floating point values, use 'atanf' for single-precision floats.
--
--     To calculate the arc tangent of y \/ x, use 'atan2'.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: arc tangent of of @x@ in radians, or 0 if @x = 0@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'atanf', 'atan2', 'tan'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_atan@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_atan@, defined at @SDL3\/SDL_stdinc.h 4637:36@
atan
  :: Double
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Double
atan =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_atan (Coerce.coerce x00))

-- | Compute the arc tangent of @x@.
--
--     The definition of @y = atan(x)@ is @x = tan(y)@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-Pi\/2 \<= y \<= Pi\/2@
--
--     This function operates on single-precision floating point values, use 'atan' for dboule-precision floats.
--
--     To calculate the arc tangent of y \/ x, use 'atan2f'.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: arc tangent of of @x@ in radians, or 0 if @x = 0@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'atan', 'atan2f', 'tanf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_atanf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_atanf@, defined at @SDL3\/SDL_stdinc.h 4669:35@
atanf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Float
atanf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_atanf (Coerce.coerce x00))

-- | Compute the arc tangent of @y \/ x@, using the signs of x and y to adjust the result\'s quadrant.
--
--     The definition of @z = atan2(x, y)@ is @y = x tan(z)@, where the quadrant of z is determined based on the signs of x and y.
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= INF@
--
--     Range: @-Pi \<= y \<= Pi@
--
--     This function operates on double-precision floating point values, use 'atan2f' for single-precision floats.
--
--     To calculate the arc tangent of a single value, use 'atan'.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: arc tangent of of @y \/ x@ in radians, or, if @x = 0@, either @-Pi\/2@, @0@, or @Pi\/2@, depending on the value of @y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'atan2f', 'atan', 'tan'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_atan2@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_atan2@, defined at @SDL3\/SDL_stdinc.h 4705:36@
atan2
  :: Double
  -- ^
  --
  --           [@y@]: floating point value of the numerator (y coordinate).
  -> Double
  -- ^
  --
  --           [@x@]: floating point value of the denominator (x coordinate).
  -> IO Double
atan2 =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_atan2 (Coerce.coerce x00) (Coerce.coerce x11))

-- | Compute the arc tangent of @y \/ x@, using the signs of x and y to adjust the result\'s quadrant.
--
--     The definition of @z = atan2(x, y)@ is @y = x tan(z)@, where the quadrant of z is determined based on the signs of x and y.
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= INF@
--
--     Range: @-Pi \<= y \<= Pi@
--
--     This function operates on single-precision floating point values, use 'atan2' for double-precision floats.
--
--     To calculate the arc tangent of a single value, use 'atanf'.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: arc tangent of of @y \/ x@ in radians, or, if @x = 0@, either @-Pi\/2@, @0@, or @Pi\/2@, depending on the value of @y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'atan2', 'atan', 'tan'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_atan2f@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_atan2f@, defined at @SDL3\/SDL_stdinc.h 4741:35@
atan2f
  :: Float
  -- ^
  --
  --           [@y@]: floating point value of the numerator (y coordinate).
  -> Float
  -- ^
  --
  --           [@x@]: floating point value of the denominator (x coordinate).
  -> IO Float
atan2f =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_atan2f (Coerce.coerce x00) (Coerce.coerce x11))

-- | Compute the ceiling of @x@.
--
--     The ceiling of @x@ is the smallest integer @y@ such that @y >= x@, i.e @x@ rounded up to the nearest integer.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on double-precision floating point values, use 'ceilf' for single-precision floats.
--
--     [Returns]: the ceiling of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'ceilf', 'floor', 'trunc', 'round', @SDL_lround@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ceil@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ceil@, defined at @SDL3\/SDL_stdinc.h 4769:36@
ceil
  :: Double
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Double
ceil =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_ceil (Coerce.coerce x00))

-- | Compute the ceiling of @x@.
--
--     The ceiling of @x@ is the smallest integer @y@ such that @y >= x@, i.e @x@ rounded up to the nearest integer.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on single-precision floating point values, use 'ceil' for double-precision floats.
--
--     [Returns]: the ceiling of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'ceil', 'floorf', 'truncf', 'roundf', @SDL_lroundf@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ceilf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ceilf@, defined at @SDL3\/SDL_stdinc.h 4797:35@
ceilf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Float
ceilf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_ceilf (Coerce.coerce x00))

-- | Copy the sign of one floating-point value to another.
--
--     The definition of copysign is that @copysign(x, y) = abs(x) * sign(y)@.
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= f@
--
--     Range: @-INF \<= z \<= INF@
--
--     This function operates on double-precision floating point values, use 'copysignf' for single-precision floats.
--
--     [Returns]: the floating point value with the sign of y and the magnitude of x.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'copysignf', 'fabs'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_copysign@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_copysign@, defined at @SDL3\/SDL_stdinc.h 4823:36@
copysign
  :: Double
  -- ^
  --
  --           [@x@]: floating point value to use as the magnitude.
  -> Double
  -- ^
  --
  --           [@y@]: floating point value to use as the sign.
  -> IO Double
copysign =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_copysign (Coerce.coerce x00) (Coerce.coerce x11))

-- | Copy the sign of one floating-point value to another.
--
--     The definition of copysign is that @copysign(x, y) = abs(x) * sign(y)@.
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= f@
--
--     Range: @-INF \<= z \<= INF@
--
--     This function operates on single-precision floating point values, use 'copysign' for double-precision floats.
--
--     [Returns]: the floating point value with the sign of y and the magnitude of x.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'copysign', 'fabsf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_copysignf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_copysignf@, defined at @SDL3\/SDL_stdinc.h 4849:35@
copysignf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value to use as the magnitude.
  -> Float
  -- ^
  --
  --           [@y@]: floating point value to use as the sign.
  -> IO Float
copysignf =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_copysignf (Coerce.coerce x00) (Coerce.coerce x11))

-- | Compute the cosine of @x@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-1 \<= y \<= 1@
--
--     This function operates on double-precision floating point values, use 'cosf' for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: cosine of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'cosf', 'acos', 'sin'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_cos@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_cos@, defined at @SDL3\/SDL_stdinc.h 4877:36@
cos
  :: Double
  -- ^
  --
  --           [@x@]: floating point value, in radians.
  -> IO Double
cos =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_cos (Coerce.coerce x00))

-- | Compute the cosine of @x@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-1 \<= y \<= 1@
--
--     This function operates on single-precision floating point values, use 'cos' for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: cosine of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'cos', 'acosf', 'sinf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_cosf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_cosf@, defined at @SDL3\/SDL_stdinc.h 4905:35@
cosf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value, in radians.
  -> IO Float
cosf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_cosf (Coerce.coerce x00))

-- | Compute the exponential of @x@.
--
--     The definition of @y = exp(x)@ is @y = e^x@, where @e@ is the base of the natural logarithm. The inverse is the natural logarithm, 'log'.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     The output will overflow if @exp(x)@ is too large to be represented.
--
--     This function operates on double-precision floating point values, use 'expf' for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: value of @e^x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'expf', 'log'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_exp@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_exp@, defined at @SDL3\/SDL_stdinc.h 4937:36@
exp
  :: Double
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Double
exp =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_exp (Coerce.coerce x00))

-- | Compute the exponential of @x@.
--
--     The definition of @y = exp(x)@ is @y = e^x@, where @e@ is the base of the natural logarithm. The inverse is the natural logarithm, 'logf'.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     The output will overflow if @exp(x)@ is too large to be represented.
--
--     This function operates on single-precision floating point values, use 'exp' for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: value of @e^x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'exp', 'logf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_expf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_expf@, defined at @SDL3\/SDL_stdinc.h 4969:35@
expf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Float
expf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_expf (Coerce.coerce x00))

-- | Compute the absolute value of @x@
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     This function operates on double-precision floating point values, use 'fabsf' for single-precision floats.
--
--     [Returns]: the absolute value of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'fabsf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_fabs@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_fabs@, defined at @SDL3\/SDL_stdinc.h 4990:36@
fabs
  :: Double
  -- ^
  --
  --           [@x@]: floating point value to use as the magnitude.
  -> IO Double
fabs =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_fabs (Coerce.coerce x00))

-- | Compute the absolute value of @x@
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     This function operates on single-precision floating point values, use 'fabs' for double-precision floats.
--
--     [Returns]: the absolute value of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'fabs'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_fabsf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_fabsf@, defined at @SDL3\/SDL_stdinc.h 5011:35@
fabsf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value to use as the magnitude.
  -> IO Float
fabsf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_fabsf (Coerce.coerce x00))

-- | Compute the floor of @x@.
--
--     The floor of @x@ is the largest integer @y@ such that @y \<= x@, i.e @x@ rounded down to the nearest integer.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on double-precision floating point values, use 'floorf' for single-precision floats.
--
--     [Returns]: the floor of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'floorf', 'ceil', 'trunc', 'round', @SDL_lround@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_floor@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_floor@, defined at @SDL3\/SDL_stdinc.h 5039:36@
floor
  :: Double
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Double
floor =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_floor (Coerce.coerce x00))

-- | Compute the floor of @x@.
--
--     The floor of @x@ is the largest integer @y@ such that @y \<= x@, i.e @x@ rounded down to the nearest integer.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on single-precision floating point values, use 'floor' for double-precision floats.
--
--     [Returns]: the floor of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'floor', 'ceilf', 'truncf', 'roundf', @SDL_lroundf@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_floorf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_floorf@, defined at @SDL3\/SDL_stdinc.h 5067:35@
floorf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Float
floorf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_floorf (Coerce.coerce x00))

-- | Truncate @x@ to an integer.
--
--     Rounds @x@ to the next closest integer to 0. This is equivalent to removing the fractional part of @x@, leaving only the integer part.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on double-precision floating point values, use 'truncf' for single-precision floats.
--
--     [Returns]: @x@ truncated to an integer.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'truncf', 'fmod', 'ceil', 'floor', 'round', @SDL_lround@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_trunc@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_trunc@, defined at @SDL3\/SDL_stdinc.h 5096:36@
trunc
  :: Double
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Double
trunc =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_trunc (Coerce.coerce x00))

-- | Truncate @x@ to an integer.
--
--     Rounds @x@ to the next closest integer to 0. This is equivalent to removing the fractional part of @x@, leaving only the integer part.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on single-precision floating point values, use 'trunc' for double-precision floats.
--
--     [Returns]: @x@ truncated to an integer.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'trunc', 'fmodf', 'ceilf', 'floorf', 'roundf', @SDL_lroundf@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_truncf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_truncf@, defined at @SDL3\/SDL_stdinc.h 5125:35@
truncf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Float
truncf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_truncf (Coerce.coerce x00))

-- | Return the floating-point remainder of @x \/ y@
--
--     Divides @x@ by @y@, and returns the remainder.
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= INF@, @y != 0@
--
--     Range: @-y \<= z \<= y@
--
--     This function operates on double-precision floating point values, use 'fmodf' for single-precision floats.
--
--     [Returns]: the remainder of @x \/ y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'fmodf', 'modf', 'trunc', 'ceil', 'floor', 'round', @SDL_lround@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_fmod@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_fmod@, defined at @SDL3\/SDL_stdinc.h 5155:36@
fmod
  :: Double
  -- ^
  --
  --           [@x@]: the numerator.
  -> Double
  -- ^
  --
  --           [@y@]: the denominator. Must not be 0.
  -> IO Double
fmod =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_fmod (Coerce.coerce x00) (Coerce.coerce x11))

-- | Return the floating-point remainder of @x \/ y@
--
--     Divides @x@ by @y@, and returns the remainder.
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= INF@, @y != 0@
--
--     Range: @-y \<= z \<= y@
--
--     This function operates on single-precision floating point values, use 'fmod' for double-precision floats.
--
--     [Returns]: the remainder of @x \/ y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'fmod', 'truncf', 'modff', 'ceilf', 'floorf', 'roundf', @SDL_lroundf@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_fmodf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_fmodf@, defined at @SDL3\/SDL_stdinc.h 5185:35@
fmodf
  :: Float
  -- ^
  --
  --           [@x@]: the numerator.
  -> Float
  -- ^
  --
  --           [@y@]: the denominator. Must not be 0.
  -> IO Float
fmodf =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_fmodf (Coerce.coerce x00) (Coerce.coerce x11))

-- | Return whether the value is infinity.
--
--     [Returns]: non-zero if the value is infinity, 0 otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'isinff'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isinf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isinf@, defined at @SDL3\/SDL_stdinc.h 5199:33@
isinf
  :: Double
  -- ^
  --
  --           [@x@]: double-precision floating point value.
  -> IO BG.Int32
isinf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isinf (Coerce.coerce x00))

-- | Return whether the value is infinity.
--
--     [Returns]: non-zero if the value is infinity, 0 otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'isinf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isinff@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isinff@, defined at @SDL3\/SDL_stdinc.h 5213:33@
isinff
  :: Float
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.Int32
isinff =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isinff (Coerce.coerce x00))

-- | Return whether the value is NaN.
--
--     [Returns]: non-zero if the value is NaN, 0 otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'isnanf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isnan@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isnan@, defined at @SDL3\/SDL_stdinc.h 5227:33@
isnan
  :: Double
  -- ^
  --
  --           [@x@]: double-precision floating point value.
  -> IO BG.Int32
isnan =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isnan (Coerce.coerce x00))

-- | Return whether the value is NaN.
--
--     [Returns]: non-zero if the value is NaN, 0 otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'isnan'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_isnanf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_isnanf@, defined at @SDL3\/SDL_stdinc.h 5241:33@
isnanf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.Int32
isnanf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_isnanf (Coerce.coerce x00))

-- | Compute the natural logarithm of @x@.
--
--     Domain: @0 \< x \<= INF@
--
--     Range: @-INF \<= y \<= INF@
--
--     It is an error for @x@ to be less than or equal to 0.
--
--     This function operates on double-precision floating point values, use 'logf' for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: the natural logarithm of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logf', 'log10', 'exp'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_log@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_log@, defined at @SDL3\/SDL_stdinc.h 5271:36@
log
  :: Double
  -- ^
  --
  --           [@x@]: floating point value. Must be greater than 0.
  -> IO Double
log =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_log (Coerce.coerce x00))

-- | Compute the natural logarithm of @x@.
--
--     Domain: @0 \< x \<= INF@
--
--     Range: @-INF \<= y \<= INF@
--
--     It is an error for @x@ to be less than or equal to 0.
--
--     This function operates on single-precision floating point values, use 'log' for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: the natural logarithm of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'log', 'expf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_logf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_logf@, defined at @SDL3\/SDL_stdinc.h 5300:35@
logf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value. Must be greater than 0.
  -> IO Float
logf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_logf (Coerce.coerce x00))

-- | Compute the base-10 logarithm of @x@.
--
--     Domain: @0 \< x \<= INF@
--
--     Range: @-INF \<= y \<= INF@
--
--     It is an error for @x@ to be less than or equal to 0.
--
--     This function operates on double-precision floating point values, use 'log10f' for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: the logarithm of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'log10f', 'log', 'pow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_log10@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_log10@, defined at @SDL3\/SDL_stdinc.h 5330:36@
log10
  :: Double
  -- ^
  --
  --           [@x@]: floating point value. Must be greater than 0.
  -> IO Double
log10 =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_log10 (Coerce.coerce x00))

-- | Compute the base-10 logarithm of @x@.
--
--     Domain: @0 \< x \<= INF@
--
--     Range: @-INF \<= y \<= INF@
--
--     It is an error for @x@ to be less than or equal to 0.
--
--     This function operates on single-precision floating point values, use 'log10' for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: the logarithm of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'log10', 'logf', 'powf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_log10f@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_log10f@, defined at @SDL3\/SDL_stdinc.h 5360:35@
log10f
  :: Float
  -- ^
  --
  --           [@x@]: floating point value. Must be greater than 0.
  -> IO Float
log10f =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_log10f (Coerce.coerce x00))

-- | Split @x@ into integer and fractional parts
--
--     This function operates on double-precision floating point values, use 'modff' for single-precision floats.
--
--     [Returns]: the fractional part of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'modff', 'trunc', 'fmod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_modf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_modf@, defined at @SDL3\/SDL_stdinc.h 5380:36@
modf
  :: Double
  -- ^
  --
  --           [@x@]: floating point value.
  -> BG.Ptr BG.CDouble
  -- ^
  --
  --           [@y@]: output pointer to store the integer part of @x@.
  -> IO Double
modf =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_modf (Coerce.coerce x00) x11)

-- | Split @x@ into integer and fractional parts
--
--     This function operates on single-precision floating point values, use 'modf' for double-precision floats.
--
--     [Returns]: the fractional part of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'modf', 'truncf', 'fmodf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_modff@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_modff@, defined at @SDL3\/SDL_stdinc.h 5400:35@
modff
  :: Float
  -- ^
  --
  --           [@x@]: floating point value.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: output pointer to store the integer part of @x@.
  -> IO Float
modff =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_modff (Coerce.coerce x00) x11)

-- | Raise @x@ to the power @y@
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= INF@
--
--     Range: @-INF \<= z \<= INF@
--
--     If @y@ is the base of the natural logarithm (e), consider using 'exp' instead.
--
--     This function operates on double-precision floating point values, use 'powf' for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: @x@ raised to the power @y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'powf', 'exp', 'log'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_pow@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_pow@, defined at @SDL3\/SDL_stdinc.h 5432:36@
pow
  :: Double
  -- ^
  --
  --           [@x@]: the base.
  -> Double
  -- ^
  --
  --           [@y@]: the exponent.
  -> IO Double
pow =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_pow (Coerce.coerce x00) (Coerce.coerce x11))

-- | Raise @x@ to the power @y@
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= INF@
--
--     Range: @-INF \<= z \<= INF@
--
--     If @y@ is the base of the natural logarithm (e), consider using 'exp' instead.
--
--     This function operates on single-precision floating point values, use 'pow' for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: @x@ raised to the power @y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'pow', 'expf', 'logf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_powf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_powf@, defined at @SDL3\/SDL_stdinc.h 5464:35@
powf
  :: Float
  -- ^
  --
  --           [@x@]: the base.
  -> Float
  -- ^
  --
  --           [@y@]: the exponent.
  -> IO Float
powf =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_powf (Coerce.coerce x00) (Coerce.coerce x11))

-- | Round @x@ to the nearest integer.
--
--     Rounds @x@ to the nearest integer. Values halfway between integers will be rounded away from zero.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on double-precision floating point values, use 'roundf' for single-precision floats. To get the result as an integer type, use SDL_lround.
--
--     [Returns]: the nearest integer to @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'roundf', @SDL_lround@, 'floor', 'ceil', 'trunc'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_round@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_round@, defined at @SDL3\/SDL_stdinc.h 5493:36@
round
  :: Double
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Double
round =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_round (Coerce.coerce x00))

-- | Round @x@ to the nearest integer.
--
--     Rounds @x@ to the nearest integer. Values halfway between integers will be rounded away from zero.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on single-precision floating point values, use 'round' for double-precision floats. To get the result as an integer type, use SDL_lroundf.
--
--     [Returns]: the nearest integer to @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'round', @SDL_lroundf@, 'floorf', 'ceilf', 'truncf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_roundf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_roundf@, defined at @SDL3\/SDL_stdinc.h 5522:35@
roundf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO Float
roundf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_roundf (Coerce.coerce x00))

-- | Scale @x@ by an integer power of two.
--
--     Multiplies @x@ by the @n@ th power of the floating point radix (always 2).
--
--     Domain: @-INF \<= x \<= INF@, @n@ integer
--
--     Range: @-INF \<= y \<= INF@
--
--     This function operates on double-precision floating point values, use 'scalbnf' for single-precision floats.
--
--     [Returns]: @x * 2^n@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'scalbnf', 'pow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_scalbn@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_scalbn@, defined at @SDL3\/SDL_stdinc.h 5605:36@
scalbn
  :: Double
  -- ^
  --
  --           [@x@]: floating point value to be scaled.
  -> BG.Int32
  -- ^
  --
  --           [@n@]: integer exponent.
  -> IO Double
scalbn =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_scalbn (Coerce.coerce x00) (Coerce.coerce x11))

-- | Scale @x@ by an integer power of two.
--
--     Multiplies @x@ by the @n@ th power of the floating point radix (always 2).
--
--     Domain: @-INF \<= x \<= INF@, @n@ integer
--
--     Range: @-INF \<= y \<= INF@
--
--     This function operates on single-precision floating point values, use 'scalbn' for double-precision floats.
--
--     [Returns]: @x * 2^n@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'scalbn', 'powf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_scalbnf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_scalbnf@, defined at @SDL3\/SDL_stdinc.h 5630:35@
scalbnf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value to be scaled.
  -> BG.Int32
  -- ^
  --
  --           [@n@]: integer exponent.
  -> IO Float
scalbnf =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_scalbnf (Coerce.coerce x00) (Coerce.coerce x11))

-- | Compute the sine of @x@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-1 \<= y \<= 1@
--
--     This function operates on double-precision floating point values, use 'sinf' for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: sine of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sinf', 'asin', 'cos'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_sin@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_sin@, defined at @SDL3\/SDL_stdinc.h 5658:36@
sin
  :: Double
  -- ^
  --
  --           [@x@]: floating point value, in radians.
  -> IO Double
sin =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_sin (Coerce.coerce x00))

-- | Compute the sine of @x@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-1 \<= y \<= 1@
--
--     This function operates on single-precision floating point values, use 'sin' for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: sine of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sin', 'asinf', 'cosf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_sinf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_sinf@, defined at @SDL3\/SDL_stdinc.h 5686:35@
sinf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value, in radians.
  -> IO Float
sinf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_sinf (Coerce.coerce x00))

-- | Compute the square root of @x@.
--
--     Domain: @0 \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     This function operates on double-precision floating point values, use 'sqrtf' for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: square root of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sqrtf'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_sqrt@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_sqrt@, defined at @SDL3\/SDL_stdinc.h 5712:36@
sqrt
  :: Double
  -- ^
  --
  --           [@x@]: floating point value. Must be greater than or equal to 0.
  -> IO Double
sqrt =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_sqrt (Coerce.coerce x00))

-- | Compute the square root of @x@.
--
--     Domain: @0 \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     This function operates on single-precision floating point values, use 'sqrt' for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: square root of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sqrt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_sqrtf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_sqrtf@, defined at @SDL3\/SDL_stdinc.h 5738:35@
sqrtf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value. Must be greater than or equal to 0.
  -> IO Float
sqrtf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_sqrtf (Coerce.coerce x00))

-- | Compute the tangent of @x@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@
--
--     This function operates on double-precision floating point values, use 'tanf' for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: tangent of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'tanf', 'sin', 'cos', 'atan', 'atan2'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_tan@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_tan@, defined at @SDL3\/SDL_stdinc.h 5768:36@
tan
  :: Double
  -- ^
  --
  --           [@x@]: floating point value, in radians.
  -> IO Double
tan =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_tan (Coerce.coerce x00))

-- | Compute the tangent of @x@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@
--
--     This function operates on single-precision floating point values, use 'tan' for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [Returns]: tangent of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'tan', 'sinf', 'cosf', 'atanf', 'atan2f'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_tanf@.
--                   The safe import is not exported
--                   : pure math on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_tanf@, defined at @SDL3\/SDL_stdinc.h 5798:35@
tanf
  :: Float
  -- ^
  --
  --           [@x@]: floating point value, in radians.
  -> IO Float
tanf =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_tanf (Coerce.coerce x00))

-- | This function allocates a context for the specified character set conversion.
--
--     [Returns]: a handle that must be freed with 'iconvClose', or SDL_ICONV_ERROR on failure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'iconv', 'iconvClose', 'iconvString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_iconv_open@.
--                   The safe flavor is 'iconvOpenSafe'
--                   .
--
--     [C declaration]: @SDL_iconv_open@, defined at @SDL3\/SDL_stdinc.h 5826:41@
iconvOpen
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@tocode@]: The target character encoding, must not be NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@fromcode@]: The source character encoding, must not be NULL.
  -> IO SDL_iconv_t
iconvOpen = Unsafe.sDL_iconv_open

-- | This function allocates a context for the specified character set conversion.
--
--     [Returns]: a handle that must be freed with 'iconvClose', or SDL_ICONV_ERROR on failure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'iconv', 'iconvClose', 'iconvString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_iconv_open@.
--                   The unsafe flavor is 'iconvOpen'
--                   .
--
--     [C declaration]: @SDL_iconv_open@, defined at @SDL3\/SDL_stdinc.h 5826:41@
iconvOpenSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@tocode@]: The target character encoding, must not be NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@fromcode@]: The source character encoding, must not be NULL.
  -> IO SDL_iconv_t
iconvOpenSafe = Safe.sDL_iconv_open

-- | This function frees a context used for character set conversion.
--
--     [Returns]: 0 on success, or -1 on failure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'iconv', 'iconvOpen', 'iconvString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_iconv_close@.
--                   The safe flavor is 'iconvCloseSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_iconv_close@, defined at @SDL3\/SDL_stdinc.h 5843:33@
iconvClose
  :: SDL_iconv_t
  -- ^
  --
  --           [@cd@]: The character set conversion handle.
  -> IO BG.Int32
iconvClose =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_iconv_close x00)

-- | This function frees a context used for character set conversion.
--
--     [Returns]: 0 on success, or -1 on failure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'iconv', 'iconvOpen', 'iconvString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_iconv_close@.
--                   The unsafe flavor is 'iconvClose'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_iconv_close@, defined at @SDL3\/SDL_stdinc.h 5843:33@
iconvCloseSafe
  :: SDL_iconv_t
  -- ^
  --
  --           [@cd@]: The character set conversion handle.
  -> IO BG.Int32
iconvCloseSafe =
  \x00 -> fmap Coerce.coerce (Safe.sDL_iconv_close x00)

-- | This function converts text between encodings, reading from and writing to a buffer.
--
--     It returns the number of successful conversions on success. On error, SDL_ICONV_E2BIG is returned when the output buffer is too small, or SDL_ICONV_EILSEQ is returned when an invalid input sequence is encountered, or SDL_ICONV_EINVAL is returned when an incomplete input sequence is encountered.
--
--     On exit:
--
--     * inbuf will point to the beginning of the next multibyte sequence. On error, this is the location of the problematic input sequence. On success, this is the end of the input sequence.
--
--     * inbytesleft will be set to the number of bytes left to convert, which will be 0 on success.
--
--     * outbuf will point to the location where to store the next output byte.
--
--     * outbytesleft will be set to the number of bytes left in the output buffer.
--
--     [Returns]: the number of conversions on success, or a negative error code.
--
--     [Thread safety]: Do not use the same 'SDL_iconv_t' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'iconvOpen', 'iconvClose', 'iconvString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_iconv@.
--                   The safe flavor is 'iconvSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_iconv@, defined at @SDL3\/SDL_stdinc.h 5883:36@
iconv
  :: SDL_iconv_t
  -- ^
  --
  --           [@cd@]: The character set conversion context, created in @'iconvOpen'@.
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@inbuf@]: Address of variable that points to the first character of the input sequence.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@inbytesleft@]: The number of bytes in the input buffer.
  -> BG.Ptr (BG.Ptr BG.CChar)
  -- ^
  --
  --           [@outbuf@]: Address of variable that points to the output buffer.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@outbytesleft@]: The number of bytes in the output buffer.
  -> IO BG.Word64
iconv =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap Coerce.coerce (Unsafe.sDL_iconv x00 x11 x22 x33 x44)

-- | This function converts text between encodings, reading from and writing to a buffer.
--
--     It returns the number of successful conversions on success. On error, SDL_ICONV_E2BIG is returned when the output buffer is too small, or SDL_ICONV_EILSEQ is returned when an invalid input sequence is encountered, or SDL_ICONV_EINVAL is returned when an incomplete input sequence is encountered.
--
--     On exit:
--
--     * inbuf will point to the beginning of the next multibyte sequence. On error, this is the location of the problematic input sequence. On success, this is the end of the input sequence.
--
--     * inbytesleft will be set to the number of bytes left to convert, which will be 0 on success.
--
--     * outbuf will point to the location where to store the next output byte.
--
--     * outbytesleft will be set to the number of bytes left in the output buffer.
--
--     [Returns]: the number of conversions on success, or a negative error code.
--
--     [Thread safety]: Do not use the same 'SDL_iconv_t' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'iconvOpen', 'iconvClose', 'iconvString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_iconv@.
--                   The unsafe flavor is 'iconv'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_iconv@, defined at @SDL3\/SDL_stdinc.h 5883:36@
iconvSafe
  :: SDL_iconv_t
  -- ^
  --
  --           [@cd@]: The character set conversion context, created in @'iconvOpen'@.
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@inbuf@]: Address of variable that points to the first character of the input sequence.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@inbytesleft@]: The number of bytes in the input buffer.
  -> BG.Ptr (BG.Ptr BG.CChar)
  -- ^
  --
  --           [@outbuf@]: Address of variable that points to the output buffer.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@outbytesleft@]: The number of bytes in the output buffer.
  -> IO BG.Word64
iconvSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap Coerce.coerce (Safe.sDL_iconv x00 x11 x22 x33 x44)

-- | Helper function to convert a string\'s encoding in one call.
--
--     This function converts a buffer or string between encodings in one pass.
--
--     The string does not need to be NULL-terminated; this function operates on the number of bytes specified in @inbytesleft@ whether there is a NULL character anywhere in the buffer.
--
--     The returned string is owned by the caller, and should be passed to 'free' when no longer needed.
--
--     [Returns]: a new string, converted to the new encoding, or NULL on error.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'iconvOpen', 'iconvClose', 'iconv'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_iconv_string@.
--                   The safe flavor is 'iconvStringSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_iconv_string@, defined at @SDL3\/SDL_stdinc.h 5920:36@
iconvString
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@tocode@]: the character encoding of the output string. Examples are \"UTF-8\", \"UCS-4\", etc.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@fromcode@]: the character encoding of data in @inbuf@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@inbuf@]: the string to convert to a different encoding.
  -> BG.Word64
  -- ^
  --
  --           [@inbytesleft@]: the size of the input string /in bytes/.
  -> IO (BG.Ptr BG.CChar)
iconvString =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_iconv_string x00 x11 x22 (Coerce.coerce x33)

-- | Helper function to convert a string\'s encoding in one call.
--
--     This function converts a buffer or string between encodings in one pass.
--
--     The string does not need to be NULL-terminated; this function operates on the number of bytes specified in @inbytesleft@ whether there is a NULL character anywhere in the buffer.
--
--     The returned string is owned by the caller, and should be passed to 'free' when no longer needed.
--
--     [Returns]: a new string, converted to the new encoding, or NULL on error.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'iconvOpen', 'iconvClose', 'iconv'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_iconv_string@.
--                   The unsafe flavor is 'iconvString'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_iconv_string@, defined at @SDL3\/SDL_stdinc.h 5920:36@
iconvStringSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@tocode@]: the character encoding of the output string. Examples are \"UTF-8\", \"UCS-4\", etc.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@fromcode@]: the character encoding of data in @inbuf@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@inbuf@]: the string to convert to a different encoding.
  -> BG.Word64
  -- ^
  --
  --           [@inbytesleft@]: the size of the input string /in bytes/.
  -> IO (BG.Ptr BG.CChar)
iconvStringSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_iconv_string x00 x11 x22 (Coerce.coerce x33)

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_size_mul_check_overflow_builtin@.
--                   The safe flavor is 'sizeMulCheckOverflowBuiltinSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_size_mul_check_overflow_builtin@, defined at @SDL3\/SDL_stdinc.h 6101:23@
sizeMulCheckOverflowBuiltin
  :: BG.Word64
  -- ^ [C declaration]: @a@
  -> BG.Word64
  -- ^ [C declaration]: @b@
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @ret@
  -> IO Bool
sizeMulCheckOverflowBuiltin =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap
          CBool.toBool
          (Unsafe.sDL_size_mul_check_overflow_builtin (Coerce.coerce x00) (Coerce.coerce x11) x22)

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_size_mul_check_overflow_builtin@.
--                   The unsafe flavor is 'sizeMulCheckOverflowBuiltin'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_size_mul_check_overflow_builtin@, defined at @SDL3\/SDL_stdinc.h 6101:23@
sizeMulCheckOverflowBuiltinSafe
  :: BG.Word64
  -- ^ [C declaration]: @a@
  -> BG.Word64
  -- ^ [C declaration]: @b@
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @ret@
  -> IO Bool
sizeMulCheckOverflowBuiltinSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap
          CBool.toBool
          (Safe.sDL_size_mul_check_overflow_builtin (Coerce.coerce x00) (Coerce.coerce x11) x22)

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_size_add_check_overflow_builtin@.
--                   The safe flavor is 'sizeAddCheckOverflowBuiltinSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_size_add_check_overflow_builtin@, defined at @SDL3\/SDL_stdinc.h 6139:23@
sizeAddCheckOverflowBuiltin
  :: BG.Word64
  -- ^ [C declaration]: @a@
  -> BG.Word64
  -- ^ [C declaration]: @b@
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @ret@
  -> IO Bool
sizeAddCheckOverflowBuiltin =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap
          CBool.toBool
          (Unsafe.sDL_size_add_check_overflow_builtin (Coerce.coerce x00) (Coerce.coerce x11) x22)

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_size_add_check_overflow_builtin@.
--                   The unsafe flavor is 'sizeAddCheckOverflowBuiltin'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_size_add_check_overflow_builtin@, defined at @SDL3\/SDL_stdinc.h 6139:23@
sizeAddCheckOverflowBuiltinSafe
  :: BG.Word64
  -- ^ [C declaration]: @a@
  -> BG.Word64
  -- ^ [C declaration]: @b@
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @ret@
  -> IO Bool
sizeAddCheckOverflowBuiltinSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap
          CBool.toBool
          (Safe.sDL_size_add_check_overflow_builtin (Coerce.coerce x00) (Coerce.coerce x11) x22)

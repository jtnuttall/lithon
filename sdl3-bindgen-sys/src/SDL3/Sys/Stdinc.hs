{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE NoImplicitPrelude #-}

-- | SDL\'s C-library replacements: memory, strings, math, and conversions; this module aliases the allocator and SDL\'s own API.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Stdinc.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     This module aliases only the functions of @SDL_stdinc.h@ that the registry allowlists. The header\'s other functions are raw-only: "SDL3.Sys.Bindgen.Stdinc.Unsafe" and "SDL3.Sys.Bindgen.Stdinc.Safe" export them.
--
--     The C shims are functions this package defines in C over what the FFI cannot call directly (variadic functions, function-like macros), each named after what it wraps; the same flavor rules apply. Their raw imports live under "SDL3.Sys.Bindgen.StdincShims".
--
--     Full conventions: "SDL3.Sys".
--
--     == Allowlist
--
--     The aliases are SDL\'s own API in this header (environments, the memory-function hooks and allocation count, UTF-8 stepping) and the allocator family, since memory SDL frees, or hands you to free, must come from SDL\'s allocator: 'malloc', 'free', 'strdup', and their kin. The rest of the header serves C programs without a portable C library: strings, character classes, math, sorting, random numbers, checksums, @iconv@, @memcpy@. Haskell has its own, so they stay raw-only.
module SDL3.Sys.Stdinc (
  module SDL3.Sys.Bindgen.Stdinc,

  -- * Typed constants
  pattern SDL3.Sys.Stdinc.SDL_MAX_TIME,
  pattern SDL3.Sys.Stdinc.SDL_MIN_TIME,
  pattern SDL3.Sys.Stdinc.SDL_MAX_SINT16,
  pattern SDL3.Sys.Stdinc.SDL_MIN_SINT16,
  pattern SDL3.Sys.Stdinc.SDL_MAX_SINT32,
  pattern SDL3.Sys.Stdinc.SDL_MIN_SINT32,
  pattern SDL3.Sys.Stdinc.SDL_MAX_SINT64,
  pattern SDL3.Sys.Stdinc.SDL_MIN_SINT64,
  pattern SDL3.Sys.Stdinc.SDL_MAX_SINT8,
  pattern SDL3.Sys.Stdinc.SDL_MIN_SINT8,
  pattern SDL3.Sys.Stdinc.SDL_MAX_UINT16,
  pattern SDL3.Sys.Stdinc.SDL_MIN_UINT16,
  pattern SDL3.Sys.Stdinc.SDL_MAX_UINT32,
  pattern SDL3.Sys.Stdinc.SDL_MIN_UINT32,
  pattern SDL3.Sys.Stdinc.SDL_MAX_UINT64,
  pattern SDL3.Sys.Stdinc.SDL_MIN_UINT64,
  pattern SDL3.Sys.Stdinc.SDL_MAX_UINT8,
  pattern SDL3.Sys.Stdinc.SDL_MIN_UINT8,
  pattern SDL3.Sys.Stdinc.SDL_SIZE_MAX,
  pattern SDL3.Sys.Stdinc.SDL_ICONV_ERROR,
  pattern SDL3.Sys.Stdinc.SDL_ICONV_E2BIG,
  pattern SDL3.Sys.Stdinc.SDL_ICONV_EILSEQ,
  pattern SDL3.Sys.Stdinc.SDL_ICONV_EINVAL,

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
  SDL3.Sys.Stdinc.strdup,
  SDL3.Sys.Stdinc.strdupSafe,
  SDL3.Sys.Stdinc.strndup,
  SDL3.Sys.Stdinc.strndupSafe,
  SDL3.Sys.Stdinc.stepUTF8,
  SDL3.Sys.Stdinc.stepBackUTF8,
  SDL3.Sys.Stdinc.ucs4ToUTF8,

  -- * C shims
  SDL3.Sys.Stdinc.fourCC,
)
where

import Data.Coerce qualified as Coerce
import Prelude (Bool, IO, fmap)

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Stdinc
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Stdinc.Safe qualified as Safe
import SDL3.Sys.Bindgen.Stdinc.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.StdincShims.Unsafe qualified as Unsafe

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
--     [C declaration]: @SDL_malloc@, defined at @SDL3\/SDL_stdinc.h 1342:47@
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
--     [C declaration]: @SDL_malloc@, defined at @SDL3\/SDL_stdinc.h 1342:47@
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
--     [C declaration]: @SDL_calloc@, defined at @SDL3\/SDL_stdinc.h 1367:69@
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
--     [C declaration]: @SDL_calloc@, defined at @SDL3\/SDL_stdinc.h 1367:69@
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
--     [C declaration]: @SDL_realloc@, defined at @SDL3\/SDL_stdinc.h 1407:54@
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
--     [C declaration]: @SDL_realloc@, defined at @SDL3\/SDL_stdinc.h 1407:54@
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
--     [C declaration]: @SDL_free@, defined at @SDL3\/SDL_stdinc.h 1427:34@
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
--     [C declaration]: @SDL_free@, defined at @SDL3\/SDL_stdinc.h 1427:34@
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
--     [C declaration]: @SDL_GetOriginalMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1525:34@
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
--     [C declaration]: @SDL_GetOriginalMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1525:34@
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
--     [C declaration]: @SDL_GetMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1547:34@
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
--     [C declaration]: @SDL_GetMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1547:34@
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
--     [C declaration]: @SDL_SetMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1578:34@
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
--     [C declaration]: @SDL_SetMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1578:34@
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
--     [C declaration]: @SDL_aligned_alloc@, defined at @SDL3\/SDL_stdinc.h 1605:47@
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
--     [C declaration]: @SDL_aligned_alloc@, defined at @SDL3\/SDL_stdinc.h 1605:47@
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
--     [C declaration]: @SDL_aligned_free@, defined at @SDL3\/SDL_stdinc.h 1623:34@
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
--     [C declaration]: @SDL_aligned_free@, defined at @SDL3\/SDL_stdinc.h 1623:34@
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
--     [C declaration]: @SDL_GetNumAllocations@, defined at @SDL3\/SDL_stdinc.h 1635:33@
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
--     [C declaration]: @SDL_GetNumAllocations@, defined at @SDL3\/SDL_stdinc.h 1635:33@
getNumAllocationsSafe :: IO BG.Int32
getNumAllocationsSafe =
  fmap Coerce.coerce Safe.sDL_GetNumAllocations

-- | Get the process environment.
--
--     This is initialized at application start and is not affected by setenv() and unsetenv() calls after that point. Use @'setEnvironmentVariable'@ and @'unsetEnvironmentVariable'@ if you want to modify this environment, or @'SDL3.Sys.Bindgen.Stdinc.Unsafe.sDL_setenv_unsafe'@ or @'SDL3.Sys.Bindgen.Stdinc.Unsafe.sDL_unsetenv_unsafe'@ if you want changes to persist in the C runtime environment after 'SDL3.Sys.Init.quit'.
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
--     [C declaration]: @SDL_GetEnvironment@, defined at @SDL3\/SDL_stdinc.h 1673:47@
getEnvironment :: IO (BG.Ptr SDL_Environment)
getEnvironment = Unsafe.sDL_GetEnvironment

-- | Get the process environment.
--
--     This is initialized at application start and is not affected by setenv() and unsetenv() calls after that point. Use @'setEnvironmentVariable'@ and @'unsetEnvironmentVariable'@ if you want to modify this environment, or @'SDL3.Sys.Bindgen.Stdinc.Unsafe.sDL_setenv_unsafe'@ or @'SDL3.Sys.Bindgen.Stdinc.Unsafe.sDL_unsetenv_unsafe'@ if you want changes to persist in the C runtime environment after 'SDL3.Sys.Init.quit'.
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
--     [C declaration]: @SDL_GetEnvironment@, defined at @SDL3\/SDL_stdinc.h 1673:47@
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
--     [C declaration]: @SDL_CreateEnvironment@, defined at @SDL3\/SDL_stdinc.h 1695:47@
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
--     [C declaration]: @SDL_CreateEnvironment@, defined at @SDL3\/SDL_stdinc.h 1695:47@
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
--     [C declaration]: @SDL_GetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1715:42@
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
--     [C declaration]: @SDL_GetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1715:42@
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
--     [C declaration]: @SDL_GetEnvironmentVariables@, defined at @SDL3\/SDL_stdinc.h 1736:37@
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
--     [C declaration]: @SDL_GetEnvironmentVariables@, defined at @SDL3\/SDL_stdinc.h 1736:37@
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
--     [C declaration]: @SDL_SetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1760:34@
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
--     [C declaration]: @SDL_SetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1760:34@
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
--     [C declaration]: @SDL_UnsetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1781:34@
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
--     [C declaration]: @SDL_UnsetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1781:34@
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
--     [C declaration]: @SDL_DestroyEnvironment@, defined at @SDL3\/SDL_stdinc.h 1795:34@
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
--     [C declaration]: @SDL_DestroyEnvironment@, defined at @SDL3\/SDL_stdinc.h 1795:34@
destroyEnvironmentSafe
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to destroy.
  -> IO ()
destroyEnvironmentSafe = Safe.sDL_DestroyEnvironment

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
--     [C declaration]: @SDL_strdup@, defined at @SDL3\/SDL_stdinc.h 3164:47@
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
--     [C declaration]: @SDL_strdup@, defined at @SDL3\/SDL_stdinc.h 3164:47@
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
--     [C declaration]: @SDL_strndup@, defined at @SDL3\/SDL_stdinc.h 3189:47@
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
--     [C declaration]: @SDL_strndup@, defined at @SDL3\/SDL_stdinc.h 3189:47@
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
--     [C declaration]: @SDL_StepUTF8@, defined at @SDL3\/SDL_stdinc.h 4030:36@
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
--     [C declaration]: @SDL_StepBackUTF8@, defined at @SDL3\/SDL_stdinc.h 4061:36@
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
--     [C declaration]: @SDL_UCS4ToUTF8@, defined at @SDL3\/SDL_stdinc.h 4090:36@
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

-- | Define a four character code as a Uint32.
--
--     The SDL_FOURCC macro as a function.
--
--     [Returns]: the four characters converted into a Uint32, one character per-byte.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_FOURCC@.
--                   The safe import is not exported
--                   : pure bit manipulation on immediate values; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_FOURCC@, defined at @sdl3-bindgen-sys\/SDL_stdinc_shims.h 40:26@
fourCC
  :: BG.Word8
  -- ^
  --
  --           [@a@]: the first ASCII character.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the second ASCII character.
  -> BG.Word8
  -- ^
  --
  --           [@c@]: the third ASCII character.
  -> BG.Word8
  -- ^
  --
  --           [@d@]: the fourth ASCII character.
  -> IO BG.Word32
fourCC =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            Coerce.coerce
            ( Unsafe.lithon_SDL_FOURCC
                (Coerce.coerce x00)
                (Coerce.coerce x11)
                (Coerce.coerce x22)
                (Coerce.coerce x33)
            )

-- | Typed constant for macro @SDL_MAX_TIME@.
pattern SDL_MAX_TIME :: SDL_Time
pattern SDL_MAX_TIME = SDL_Time 9223372036854775807

-- | Typed constant for macro @SDL_MIN_TIME@.
pattern SDL_MIN_TIME :: SDL_Time
pattern SDL_MIN_TIME <- SDL_Time (-9223372036854775808)
 where
  SDL_MIN_TIME = SDL_Time (-9223372036854775808)

-- | Typed constant for macro @SDL_MAX_SINT16@.
pattern SDL_MAX_SINT16 :: Sint16
pattern SDL_MAX_SINT16 = Sint16 32767

-- | Typed constant for macro @SDL_MIN_SINT16@.
pattern SDL_MIN_SINT16 :: Sint16
pattern SDL_MIN_SINT16 <- Sint16 (-32768)
 where
  SDL_MIN_SINT16 = Sint16 (-32768)

-- | Typed constant for macro @SDL_MAX_SINT32@.
pattern SDL_MAX_SINT32 :: Sint32
pattern SDL_MAX_SINT32 = Sint32 2147483647

-- | Typed constant for macro @SDL_MIN_SINT32@.
pattern SDL_MIN_SINT32 :: Sint32
pattern SDL_MIN_SINT32 <- Sint32 (-2147483648)
 where
  SDL_MIN_SINT32 = Sint32 (-2147483648)

-- | Typed constant for macro @SDL_MAX_SINT64@.
pattern SDL_MAX_SINT64 :: Sint64
pattern SDL_MAX_SINT64 = Sint64 9223372036854775807

-- | Typed constant for macro @SDL_MIN_SINT64@.
pattern SDL_MIN_SINT64 :: Sint64
pattern SDL_MIN_SINT64 <- Sint64 (-9223372036854775808)
 where
  SDL_MIN_SINT64 = Sint64 (-9223372036854775808)

-- | Typed constant for macro @SDL_MAX_SINT8@.
pattern SDL_MAX_SINT8 :: Sint8
pattern SDL_MAX_SINT8 = Sint8 127

-- | Typed constant for macro @SDL_MIN_SINT8@.
pattern SDL_MIN_SINT8 :: Sint8
pattern SDL_MIN_SINT8 <- Sint8 (-128)
 where
  SDL_MIN_SINT8 = Sint8 (-128)

-- | Typed constant for macro @SDL_MAX_UINT16@.
pattern SDL_MAX_UINT16 :: Uint16
pattern SDL_MAX_UINT16 = Uint16 65535

-- | Typed constant for macro @SDL_MIN_UINT16@.
pattern SDL_MIN_UINT16 :: Uint16
pattern SDL_MIN_UINT16 = Uint16 0

-- | Typed constant for macro @SDL_MAX_UINT32@.
pattern SDL_MAX_UINT32 :: Uint32
pattern SDL_MAX_UINT32 = Uint32 4294967295

-- | Typed constant for macro @SDL_MIN_UINT32@.
pattern SDL_MIN_UINT32 :: Uint32
pattern SDL_MIN_UINT32 = Uint32 0

-- | Typed constant for macro @SDL_MAX_UINT64@.
pattern SDL_MAX_UINT64 :: Uint64
pattern SDL_MAX_UINT64 = Uint64 18446744073709551615

-- | Typed constant for macro @SDL_MIN_UINT64@.
pattern SDL_MIN_UINT64 :: Uint64
pattern SDL_MIN_UINT64 = Uint64 0

-- | Typed constant for macro @SDL_MAX_UINT8@.
pattern SDL_MAX_UINT8 :: Uint8
pattern SDL_MAX_UINT8 = Uint8 255

-- | Typed constant for macro @SDL_MIN_UINT8@.
pattern SDL_MIN_UINT8 :: Uint8
pattern SDL_MIN_UINT8 = Uint8 0

-- | Typed constant for macro @SDL_SIZE_MAX@ (C type @size_t@).
pattern SDL_SIZE_MAX :: BG.Word64
pattern SDL_SIZE_MAX = 18446744073709551615

-- | Typed constant for macro @SDL_ICONV_ERROR@ (C type @size_t@).
pattern SDL_ICONV_ERROR :: BG.Word64
pattern SDL_ICONV_ERROR = 18446744073709551615

-- | Typed constant for macro @SDL_ICONV_E2BIG@ (C type @size_t@).
pattern SDL_ICONV_E2BIG :: BG.Word64
pattern SDL_ICONV_E2BIG = 18446744073709551614

-- | Typed constant for macro @SDL_ICONV_EILSEQ@ (C type @size_t@).
pattern SDL_ICONV_EILSEQ :: BG.Word64
pattern SDL_ICONV_EILSEQ = 18446744073709551613

-- | Typed constant for macro @SDL_ICONV_EINVAL@ (C type @size_t@).
pattern SDL_ICONV_EINVAL :: BG.Word64
pattern SDL_ICONV_EINVAL = 18446744073709551612

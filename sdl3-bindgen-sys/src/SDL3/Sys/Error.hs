-- | Simple error message routines for SDL.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Error.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Error (
  -- * Function aliases
  SDL3.Sys.Error.outOfMemory,
  SDL3.Sys.Error.getError,
  SDL3.Sys.Error.clearError,
)
where

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Error.Unsafe qualified as Unsafe

-- | Set an error indicating that memory allocation failed.
--
--     This function does not do any memory allocation.
--
--     [Returns]: false.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OutOfMemory@.
--                   The safe import is not exported
--                   : touches only the thread-local error buffer; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_OutOfMemory@, defined at @SDL3\/SDL_error.h 121:34@
outOfMemory :: IO Bool
outOfMemory =
  fmap CBool.toBool Unsafe.sDL_OutOfMemory

-- | Retrieve a message about the last error that occurred on the current thread.
--
--     It is possible for multiple errors to occur before calling @'getError'@. Only the last error is returned.
--
--     The message is only applicable when an SDL function has signaled an error. You must check the return values of SDL function calls to determine when to appropriately call @'getError'@. You should /not/ use the results of @'getError'@ to decide if an error has occurred! Sometimes SDL will set an error string even when reporting success.
--
--     SDL will /not/ clear the error string for successful API calls. You /must/ check return values for failure cases before you can assume the error string applies.
--
--     Error strings are set per-thread, so an error set in a different thread will not interfere with the current thread\'s operation.
--
--     The returned value is a thread-local string which will remain valid until the current thread\'s error string is changed. The caller should make a copy if the value is needed after the next SDL API call.
--
--     [Returns]: a message with information about the specific error that occurred, or an empty string if there hasn\'t been an error message set since the last call to @'clearError'@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'clearError', @SDL_SetError@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetError@.
--                   The safe import is not exported
--                   : touches only the thread-local error buffer; cannot block, lock, or call back.
--
--     [C declaration]: @SDL_GetError@, defined at @SDL3\/SDL_error.h 158:42@
getError :: IO (PtrConst.PtrConst BG.CChar)
getError = Unsafe.sDL_GetError

-- | Clear any previous error message for this thread.
--
--     [Returns]: true.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getError', @SDL_SetError@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ClearError@.
--                   The safe import is not exported
--                   : touches only the thread-local error buffer; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClearError@, defined at @SDL3\/SDL_error.h 172:34@
clearError :: IO Bool
clearError = fmap CBool.toBool Unsafe.sDL_ClearError

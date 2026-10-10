{-# LANGUAGE NoImplicitPrelude #-}

-- | Simple error message routines for SDL.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Error.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     The C shims are functions this package defines in C over what the FFI cannot call directly (variadic functions, function-like macros), each named after what it wraps; the same flavor rules apply. Their raw imports live under "SDL3.Sys.Bindgen.ErrorShims".
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Error (
  -- * Function aliases
  SDL3.Sys.Error.outOfMemory,
  SDL3.Sys.Error.getError,
  SDL3.Sys.Error.clearError,

  -- * C shims
  SDL3.Sys.Error.setError,
  SDL3.Sys.Error.unsupported,
  SDL3.Sys.Error.invalidParamError,
)
where

import Prelude (Bool, IO, fmap)

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Error.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.ErrorShims.Unsafe qualified as Unsafe

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
--     [See also]: 'clearError', @'setError'@
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
--     [See also]: 'getError', @'setError'@
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

-- | Set the SDL error message for the current thread.
--
--     A fixed-arity shim over the variadic SDL_SetError: @message@ becomes the error message verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     Calling this function will replace any previous error message that was set. It always returns false, since SDL frequently uses false to signify a failing result.
--
--     [Returns]: false.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'clearError', 'getError'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_SetError@.
--                   The safe import is not exported
--                   : formats into the thread-local error buffer; SDL_SetErrorV\'s log call is compiled out (\#if 0, SDL 3.2.0 through 3.4.16); cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_SetError@, defined at @sdl3-bindgen-sys\/SDL_error_shims.h 45:24@
setError
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the error message, in UTF-8.
  -> IO Bool
setError =
  \x00 ->
    fmap CBool.toBool (Unsafe.lithon_SDL_SetError x00)

-- | Report an unsupported operation with SDL\'s standard error message.
--
--     The SDL_Unsupported macro as a function: it sets the error message to \"That operation is not supported\".
--
--     [Returns]: false.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setError'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_Unsupported@.
--                   The safe import is not exported
--                   : formats into the thread-local error buffer; SDL_SetErrorV\'s log call is compiled out (\#if 0, SDL 3.2.0 through 3.4.16); cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_Unsupported@, defined at @sdl3-bindgen-sys\/SDL_error_shims.h 64:24@
unsupported :: IO Bool
unsupported =
  fmap CBool.toBool Unsafe.lithon_SDL_Unsupported

-- | Report an invalid parameter with SDL\'s standard error message.
--
--     The SDL_InvalidParamError macro as a function: it sets the error message to \"Parameter \'name\' is invalid\", with the parameter\'s name in place of name.
--
--     [Returns]: false.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setError'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_InvalidParamError@.
--                   The safe import is not exported
--                   : formats into the thread-local error buffer; SDL_SetErrorV\'s log call is compiled out (\#if 0, SDL 3.2.0 through 3.4.16); cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_InvalidParamError@, defined at @sdl3-bindgen-sys\/SDL_error_shims.h 84:24@
invalidParamError
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@param@]: the name of the invalid parameter, in UTF-8.
  -> IO Bool
invalidParamError =
  \x00 ->
    fmap CBool.toBool (Unsafe.lithon_SDL_InvalidParamError x00)

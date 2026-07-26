-- | This file contains functions to set and get configuration hints, as well as listing each of them alphabetically.
--
--     The convention for naming hints is SDL_HINT_X, where \"SDL_X\" is the environment variable that can be used to override the default.
--
--     In general these hints are just that - they may or may not be supported or applicable on any given platform, but they provide a way for an application or user to give the library a hint as to how they would like the library to work. Specify the behavior of Alt+Tab while the keyboard is grabbed.
--
--     By default, SDL emulates Alt+Tab functionality while the keyboard is grabbed and your window is full-screen. This prevents the user from getting stuck in your application if you\'ve enabled keyboard grab.
--
--     The variable can be set to the following values:
--
--     * \"0\": SDL will not handle Alt+Tab. Your application is responsible for handling Alt+Tab while the keyboard is grabbed.
--
--     * \"1\": SDL will minimize your window when Alt+Tab is pressed (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Hints.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Hints (
  module SDL3.Sys.Bindgen.Hints,

  -- * Function aliases
  SDL3.Sys.Hints.setHintWithPriority,
  SDL3.Sys.Hints.setHintWithPrioritySafe,
  SDL3.Sys.Hints.setHint,
  SDL3.Sys.Hints.setHintSafe,
  SDL3.Sys.Hints.resetHint,
  SDL3.Sys.Hints.resetHintSafe,
  SDL3.Sys.Hints.resetHints,
  SDL3.Sys.Hints.resetHintsSafe,
  SDL3.Sys.Hints.getHint,
  SDL3.Sys.Hints.getHintSafe,
  SDL3.Sys.Hints.getHintBoolean,
  SDL3.Sys.Hints.getHintBooleanSafe,
  SDL3.Sys.Hints.addHintCallbackSafe,
  SDL3.Sys.Hints.removeHintCallback,
  SDL3.Sys.Hints.removeHintCallbackSafe,
)
where

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Hints
import SDL3.Sys.Bindgen.Hints.Safe qualified as Safe
import SDL3.Sys.Bindgen.Hints.Unsafe qualified as Unsafe

-- | Set a hint with a specific priority.
--
--     The priority controls the behavior when setting a hint that already has a value. Hints will replace existing hints of their priority and lower. Environment variables are considered to have override priority.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getHint', 'resetHint', 'setHint'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetHintWithPriority@.
--                   The safe flavor is 'setHintWithPrioritySafe'
--                   : runs registered hint callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetHintWithPriority@, defined at @SDL3\/SDL_hints.h 4756:34@
setHintWithPriority
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the hint variable.
  -> SDL_HintPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_HintPriority' level for the hint.
  -> IO Bool
setHintWithPriority =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetHintWithPriority x00 x11 x22)

-- | Set a hint with a specific priority.
--
--     The priority controls the behavior when setting a hint that already has a value. Hints will replace existing hints of their priority and lower. Environment variables are considered to have override priority.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getHint', 'resetHint', 'setHint'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetHintWithPriority@.
--                   The unsafe flavor is 'setHintWithPriority'
--                   : runs registered hint callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetHintWithPriority@, defined at @SDL3\/SDL_hints.h 4756:34@
setHintWithPrioritySafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the hint variable.
  -> SDL_HintPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_HintPriority' level for the hint.
  -> IO Bool
setHintWithPrioritySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetHintWithPriority x00 x11 x22)

-- | Set a hint with normal priority.
--
--     Hints will not be set if there is an existing override hint or environment variable that takes precedence. You can use @'setHintWithPriority'@ to set the hint with override priority instead.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getHint', 'resetHint', 'setHintWithPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetHint@.
--                   The safe flavor is 'setHintSafe'
--                   : runs registered hint callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetHint@, defined at @SDL3\/SDL_hints.h 4778:34@
setHint
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the hint variable.
  -> IO Bool
setHint =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetHint x00 x11)

-- | Set a hint with normal priority.
--
--     Hints will not be set if there is an existing override hint or environment variable that takes precedence. You can use @'setHintWithPriority'@ to set the hint with override priority instead.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getHint', 'resetHint', 'setHintWithPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetHint@.
--                   The unsafe flavor is 'setHint'
--                   : runs registered hint callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetHint@, defined at @SDL3\/SDL_hints.h 4778:34@
setHintSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the hint variable.
  -> IO Bool
setHintSafe =
  \x00 ->
    \x11 -> fmap CBool.toBool (Safe.sDL_SetHint x00 x11)

-- | Reset a hint to the default value.
--
--     This will reset a hint to the value of the environment variable, or NULL if the environment isn\'t set. Callbacks will be called normally with this change.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setHint', 'resetHints'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ResetHint@.
--                   The safe flavor is 'resetHintSafe'
--                   : runs registered hint callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ResetHint@, defined at @SDL3\/SDL_hints.h 4798:34@
resetHint
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to set.
  -> IO Bool
resetHint =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_ResetHint x00)

-- | Reset a hint to the default value.
--
--     This will reset a hint to the value of the environment variable, or NULL if the environment isn\'t set. Callbacks will be called normally with this change.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setHint', 'resetHints'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ResetHint@.
--                   The unsafe flavor is 'resetHint'
--                   : runs registered hint callbacks synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ResetHint@, defined at @SDL3\/SDL_hints.h 4798:34@
resetHintSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to set.
  -> IO Bool
resetHintSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_ResetHint x00)

-- | Reset all hints to the default values.
--
--     This will reset all hints to the value of the associated environment variable, or NULL if the environment isn\'t set. Callbacks will be called normally with this change.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'resetHint'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ResetHints@.
--                   The safe flavor is 'resetHintsSafe'
--                   : runs registered hint callbacks synchronously.
--
--     [C declaration]: @SDL_ResetHints@, defined at @SDL3\/SDL_hints.h 4813:34@
resetHints :: IO ()
resetHints = Unsafe.sDL_ResetHints

-- | Reset all hints to the default values.
--
--     This will reset all hints to the value of the associated environment variable, or NULL if the environment isn\'t set. Callbacks will be called normally with this change.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'resetHint'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ResetHints@.
--                   The unsafe flavor is 'resetHints'
--                   : runs registered hint callbacks synchronously.
--
--     [C declaration]: @SDL_ResetHints@, defined at @SDL3\/SDL_hints.h 4813:34@
resetHintsSafe :: IO ()
resetHintsSafe = Safe.sDL_ResetHints

-- | Get the value of a hint.
--
--     [Returns]: the string value of a hint or NULL if the hint isn\'t set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setHint', 'setHintWithPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetHint@.
--                   The safe flavor is 'getHintSafe'
--                   .
--
--     [C declaration]: @SDL_GetHint@, defined at @SDL3\/SDL_hints.h 4828:41@
getHint
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getHint = Unsafe.sDL_GetHint

-- | Get the value of a hint.
--
--     [Returns]: the string value of a hint or NULL if the hint isn\'t set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setHint', 'setHintWithPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetHint@.
--                   The unsafe flavor is 'getHint'
--                   .
--
--     [C declaration]: @SDL_GetHint@, defined at @SDL3\/SDL_hints.h 4828:41@
getHintSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getHintSafe = Safe.sDL_GetHint

-- | Get the boolean value of a hint variable.
--
--     [Returns]: the boolean value of a hint or the provided default value if the hint does not exist.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getHint', 'setHint'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetHintBoolean@.
--                   The safe flavor is 'getHintBooleanSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetHintBoolean@, defined at @SDL3\/SDL_hints.h 4845:34@
getHintBoolean
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the hint to get the boolean value from.
  -> Bool
  -- ^
  --
  --           [@default_value@]: the value to return if the hint does not exist.
  -> IO Bool
getHintBoolean =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetHintBoolean x00 (CBool.fromBool x11))

-- | Get the boolean value of a hint variable.
--
--     [Returns]: the boolean value of a hint or the provided default value if the hint does not exist.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getHint', 'setHint'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetHintBoolean@.
--                   The unsafe flavor is 'getHintBoolean'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetHintBoolean@, defined at @SDL3\/SDL_hints.h 4845:34@
getHintBooleanSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the hint to get the boolean value from.
  -> Bool
  -- ^
  --
  --           [@default_value@]: the value to return if the hint does not exist.
  -> IO Bool
getHintBooleanSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetHintBoolean x00 (CBool.fromBool x11))

-- | Add a function to watch a particular hint.
--
--     The callback function is called /during/ this function, to provide it an initial value, and again each time the hint\'s value changes.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'removeHintCallback'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AddHintCallback@.
--                   The unsafe import is not exported
--                   : invokes the callback once immediately with the current hint value.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Hints.Unsafe.sDL_AddHintCallback@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddHintCallback@, defined at @SDL3\/SDL_hints.h 4887:34@
addHintCallbackSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to watch.
  -> SDL_HintCallback
  -- ^
  --
  --           [@callback@]: An 'SDL_HintCallback' function that will be called when the hint value changes.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer to pass to the callback function.
  -> IO Bool
addHintCallbackSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_AddHintCallback x00 x11 x22)

-- | Remove a function watching a particular hint.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addHintCallbackSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RemoveHintCallback@.
--                   The safe flavor is 'removeHintCallbackSafe'
--                   : deregistration only.
--
--     [C declaration]: @SDL_RemoveHintCallback@, defined at @SDL3\/SDL_hints.h 4903:34@
removeHintCallback
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint being watched.
  -> SDL_HintCallback
  -- ^
  --
  --           [@callback@]: an 'SDL_HintCallback' function that will be called when the hint value changes.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer being passed to the callback function.
  -> IO ()
removeHintCallback = Unsafe.sDL_RemoveHintCallback

-- | Remove a function watching a particular hint.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addHintCallbackSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RemoveHintCallback@.
--                   The unsafe flavor is 'removeHintCallback'
--                   : deregistration only.
--
--     [C declaration]: @SDL_RemoveHintCallback@, defined at @SDL3\/SDL_hints.h 4903:34@
removeHintCallbackSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint being watched.
  -> SDL_HintCallback
  -- ^
  --
  --           [@callback@]: an 'SDL_HintCallback' function that will be called when the hint value changes.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer being passed to the callback function.
  -> IO ()
removeHintCallbackSafe = Safe.sDL_RemoveHintCallback

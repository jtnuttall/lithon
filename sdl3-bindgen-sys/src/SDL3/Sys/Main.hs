-- | App entry-point handling; SDL_main is not bound here.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Main.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Main (
  module SDL3.Sys.Bindgen.Main,

  -- * Function aliases
  SDL3.Sys.Main.setMainReady,
  SDL3.Sys.Main.setMainReadySafe,
  SDL3.Sys.Main.runAppSafe,
  SDL3.Sys.Main.enterAppMainCallbacksSafe,
  SDL3.Sys.Main.gdkSuspendComplete,
  SDL3.Sys.Main.gdkSuspendCompleteSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.IncompleteArray qualified as IA
import HsBindgen.Runtime.IsArray qualified as IsA
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Init qualified
import SDL3.Sys.Bindgen.Main
import SDL3.Sys.Bindgen.Main.Safe qualified as Safe
import SDL3.Sys.Bindgen.Main.Unsafe qualified as Unsafe

-- | Circumvent failure of 'SDL3.Sys.Init.init' when not using @SDL_main()@ as an entry point.
--
--     This function is defined in @SDL_main.h@, along with the preprocessor rule to redefine main() as @SDL_main()@. Thus to ensure that your main() function will not be changed it is necessary to define SDL_MAIN_HANDLED before including SDL.h.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Init.init'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetMainReady@.
--                   The safe flavor is 'setMainReadySafe'
--                   .
--
--     [C declaration]: @SDL_SetMainReady@, defined at @SDL3\/SDL_main.h 548:34@
setMainReady :: IO ()
setMainReady = Unsafe.sDL_SetMainReady

-- | Circumvent failure of 'SDL3.Sys.Init.init' when not using @SDL_main()@ as an entry point.
--
--     This function is defined in @SDL_main.h@, along with the preprocessor rule to redefine main() as @SDL_main()@. Thus to ensure that your main() function will not be changed it is necessary to define SDL_MAIN_HANDLED before including SDL.h.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Init.init'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetMainReady@.
--                   The unsafe flavor is 'setMainReady'
--                   .
--
--     [C declaration]: @SDL_SetMainReady@, defined at @SDL3\/SDL_main.h 548:34@
setMainReadySafe :: IO ()
setMainReadySafe = Safe.sDL_SetMainReady

-- | Initializes and launches an SDL application, by doing platform-specific initialization before calling your mainFunction and cleanups after it returns, if that is needed for a specific platform, otherwise it just calls mainFunction.
--
--     You can use this if you want to use your own main() implementation without using SDL_main (like when using SDL_MAIN_HANDLED). When using this, you do /not/ need @'setMainReady'@.
--
--     If @argv@ is NULL, SDL will provide command line arguments, either by querying the OS for them if possible, or supplying a filler array if not.
--
--     [Returns]: the return value from mainFunction: 0 on success, otherwise failure; 'SDL3.Sys.Error.getError' might have more information on the failure.
--
--     [Thread safety]: Generally this is called once, near startup, from the process\'s initial thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RunApp@.
--                   The unsafe import is not exported
--                   : runs the provided main function synchronously.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Main.Unsafe.sDL_RunApp@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RunApp@, defined at @SDL3\/SDL_main.h 581:33@
runAppSafe
  :: BG.Int32
  -- ^
  --
  --           [@argc@]: the argc parameter from the application\'s main() function, or 0 if the platform\'s main-equivalent has no argc.
  -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar)))
  -- ^
  --
  --           [@argv@]: the argv parameter from the application\'s main() function, or NULL if the platform\'s main-equivalent has no argv.
  -> SDL_main_func
  -- ^
  --
  --           [@mainFunction@]: your SDL app\'s C-style main(). NOT the function you\'re calling this from! Its name doesn\'t matter; it doesn\'t literally have to be @main@.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@reserved@]: should be NULL (reserved for future use, will probably be platform-specific then).
  -> IO BG.Int32
runAppSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Safe.sDL_RunApp (Coerce.coerce x00) x11 x22 x33)

-- | An entry point for SDL\'s use in SDL_MAIN_USE_CALLBACKS.
--
--     Generally, you should not call this function directly. This only exists to hand off work into SDL as soon as possible, where it has a lot more control and functionality available, and make the inline code in @SDL_main.h@ as small as possible.
--
--     Not all platforms use this, it\'s actual use is hidden in a magic header-only library, and you should not call this directly unless you /really/ know what you\'re doing.
--
--     [Returns]: standard Unix main return value.
--
--     [Thread safety]: It is not safe to call this anywhere except as the only function call in SDL_main.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EnterAppMainCallbacks@.
--                   The unsafe import is not exported
--                   : runs the whole app main loop through the callbacks synchronously.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Main.Unsafe.sDL_EnterAppMainCallbacks@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_EnterAppMainCallbacks@, defined at @SDL3\/SDL_main.h 608:33@
enterAppMainCallbacksSafe
  :: BG.Int32
  -- ^
  --
  --           [@argc@]: standard Unix main argc.
  -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar)))
  -- ^
  --
  --           [@argv@]: standard Unix main argv.
  -> SDL3.Sys.Bindgen.Init.SDL_AppInit_func
  -- ^
  --
  --           [@appinit@]: the application\'s SDL_AppInit function.
  -> SDL3.Sys.Bindgen.Init.SDL_AppIterate_func
  -- ^
  --
  --           [@appiter@]: the application\'s SDL_AppIterate function.
  -> SDL3.Sys.Bindgen.Init.SDL_AppEvent_func
  -- ^
  --
  --           [@appevent@]: the application\'s SDL_AppEvent function.
  -> SDL3.Sys.Bindgen.Init.SDL_AppQuit_func
  -- ^
  --
  --           [@appquit@]: the application\'s SDL_AppQuit function.
  -> IO BG.Int32
enterAppMainCallbacksSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap Coerce.coerce (Safe.sDL_EnterAppMainCallbacks (Coerce.coerce x00) x11 x22 x33 x44 x55)

-- | Callback from the application to let the suspend continue.
--
--     This function is only needed for Xbox GDK support; all other platforms will do nothing and set an \"unsupported\" error message.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GDKSuspendComplete@.
--                   The safe flavor is 'gdkSuspendCompleteSafe'
--                   .
--
--     [C declaration]: @SDL_GDKSuspendComplete@, defined at @SDL3\/SDL_main.h 673:34@
gdkSuspendComplete :: IO ()
gdkSuspendComplete = Unsafe.sDL_GDKSuspendComplete

-- | Callback from the application to let the suspend continue.
--
--     This function is only needed for Xbox GDK support; all other platforms will do nothing and set an \"unsupported\" error message.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GDKSuspendComplete@.
--                   The unsafe flavor is 'gdkSuspendComplete'
--                   .
--
--     [C declaration]: @SDL_GDKSuspendComplete@, defined at @SDL3\/SDL_main.h 673:34@
gdkSuspendCompleteSafe :: IO ()
gdkSuspendCompleteSafe = Safe.sDL_GDKSuspendComplete

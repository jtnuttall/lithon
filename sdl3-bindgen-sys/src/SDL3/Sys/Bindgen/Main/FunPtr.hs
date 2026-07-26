{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Main.FunPtr (
  SDL3.Sys.Bindgen.Main.FunPtr.sDL_SetMainReady,
  SDL3.Sys.Bindgen.Main.FunPtr.sDL_RunApp,
  SDL3.Sys.Bindgen.Main.FunPtr.sDL_EnterAppMainCallbacks,
  SDL3.Sys.Bindgen.Main.FunPtr.sDL_GDKSuspendComplete,
)
where

import HsBindgen.Runtime.IncompleteArray qualified as IA
import HsBindgen.Runtime.IsArray qualified as IsA
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Init qualified
import SDL3.Sys.Bindgen.Main

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#include <SDL3/SDL_main.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Main_get_SDL_SetMainReady */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_a748be6c08507093 (void)) (void)"
         , "{"
         , "  return &SDL_SetMainReady;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Main_get_SDL_RunApp */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_9ddd66f3bccdd116 (void)) ("
         , "  signed int arg1,"
         , "  char **arg2,"
         , "  SDL_main_func arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  return &SDL_RunApp;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Main_get_SDL_EnterAppMainCallbacks */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_50b435e689e12498 (void)) ("
         , "  signed int arg1,"
         , "  char **arg2,"
         , "  SDL_AppInit_func arg3,"
         , "  SDL_AppIterate_func arg4,"
         , "  SDL_AppEvent_func arg5,"
         , "  SDL_AppQuit_func arg6"
         , ")"
         , "{"
         , "  return &SDL_EnterAppMainCallbacks;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Main_get_SDL_GDKSuspendComplete */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_07ea6ee797596218 (void)) (void)"
         , "{"
         , "  return &SDL_GDKSuspendComplete;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Main_get_SDL_SetMainReady@
foreign import ccall unsafe "hs_bindgen_a748be6c08507093"
  hs_bindgen_a748be6c08507093_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Main_get_SDL_SetMainReady@
hs_bindgen_a748be6c08507093 :: IO (BG.FunPtr (IO ()))
hs_bindgen_a748be6c08507093 =
  BG.fromFFIType hs_bindgen_a748be6c08507093_base

{-# NOINLINE sDL_SetMainReady #-}

-- | Circumvent failure of SDL_Init() when not using @SDL_main()@ as an entry point.
--
--     This function is defined in @SDL_main.h@, along with the preprocessor rule to redefine main() as @SDL_main()@. Thus to ensure that your main() function will not be changed it is necessary to define SDL_MAIN_HANDLED before including SDL.h.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: SDL_Init
--
--     [C declaration]: @SDL_SetMainReady@, defined at @SDL3\/SDL_main.h 548:34@
sDL_SetMainReady :: BG.FunPtr (IO ())
sDL_SetMainReady =
  BG.unsafePerformIO hs_bindgen_a748be6c08507093

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Main_get_SDL_RunApp@
foreign import ccall unsafe "hs_bindgen_9ddd66f3bccdd116"
  hs_bindgen_9ddd66f3bccdd116_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Main_get_SDL_RunApp@
hs_bindgen_9ddd66f3bccdd116
  :: IO
       ( BG.FunPtr
           ( BG.CInt
             -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar)))
             -> SDL_main_func
             -> BG.Ptr BG.Void
             -> IO BG.CInt
           )
       )
hs_bindgen_9ddd66f3bccdd116 =
  BG.fromFFIType hs_bindgen_9ddd66f3bccdd116_base

{-# NOINLINE sDL_RunApp #-}

-- | Initializes and launches an SDL application, by doing platform-specific initialization before calling your mainFunction and cleanups after it returns, if that is needed for a specific platform, otherwise it just calls mainFunction.
--
--     You can use this if you want to use your own main() implementation without using SDL_main (like when using SDL_MAIN_HANDLED). When using this, you do /not/ need @SDL_SetMainReady()@.
--
--     If @argv@ is NULL, SDL will provide command line arguments, either by querying the OS for them if possible, or supplying a filler array if not.
--
--     [@argc@]: the argc parameter from the application\'s main() function, or 0 if the platform\'s main-equivalent has no argc.
--
--     [@argv@]: the argv parameter from the application\'s main() function, or NULL if the platform\'s main-equivalent has no argv.
--
--     [@mainFunction@]: your SDL app\'s C-style main(). NOT the function you\'re calling this from! Its name doesn\'t matter; it doesn\'t literally have to be @main@.
--
--     [@reserved@]: should be NULL (reserved for future use, will probably be platform-specific then).
--
--     [Returns]: the return value from mainFunction: 0 on success, otherwise failure; SDL_GetError() might have more information on the failure.
--
--     [Thread safety]: Generally this is called once, near startup, from the process\'s initial thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RunApp@, defined at @SDL3\/SDL_main.h 581:33@
sDL_RunApp
  :: BG.FunPtr
       ( BG.CInt
         -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar)))
         -> SDL_main_func
         -> BG.Ptr BG.Void
         -> IO BG.CInt
       )
sDL_RunApp =
  BG.unsafePerformIO hs_bindgen_9ddd66f3bccdd116

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Main_get_SDL_EnterAppMainCallbacks@
foreign import ccall unsafe "hs_bindgen_50b435e689e12498"
  hs_bindgen_50b435e689e12498_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Main_get_SDL_EnterAppMainCallbacks@
hs_bindgen_50b435e689e12498
  :: IO
       ( BG.FunPtr
           ( BG.CInt
             -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar)))
             -> SDL3.Sys.Bindgen.Init.SDL_AppInit_func
             -> SDL3.Sys.Bindgen.Init.SDL_AppIterate_func
             -> SDL3.Sys.Bindgen.Init.SDL_AppEvent_func
             -> SDL3.Sys.Bindgen.Init.SDL_AppQuit_func
             -> IO BG.CInt
           )
       )
hs_bindgen_50b435e689e12498 =
  BG.fromFFIType hs_bindgen_50b435e689e12498_base

{-# NOINLINE sDL_EnterAppMainCallbacks #-}

-- | An entry point for SDL\'s use in SDL_MAIN_USE_CALLBACKS.
--
--     Generally, you should not call this function directly. This only exists to hand off work into SDL as soon as possible, where it has a lot more control and functionality available, and make the inline code in @SDL_main.h@ as small as possible.
--
--     Not all platforms use this, it\'s actual use is hidden in a magic header-only library, and you should not call this directly unless you /really/ know what you\'re doing.
--
--     [@argc@]: standard Unix main argc.
--
--     [@argv@]: standard Unix main argv.
--
--     [@appinit@]: the application\'s SDL_AppInit function.
--
--     [@appiter@]: the application\'s SDL_AppIterate function.
--
--     [@appevent@]: the application\'s SDL_AppEvent function.
--
--     [@appquit@]: the application\'s SDL_AppQuit function.
--
--     [Returns]: standard Unix main return value.
--
--     [Thread safety]: It is not safe to call this anywhere except as the only function call in SDL_main.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EnterAppMainCallbacks@, defined at @SDL3\/SDL_main.h 608:33@
sDL_EnterAppMainCallbacks
  :: BG.FunPtr
       ( BG.CInt
         -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar)))
         -> SDL3.Sys.Bindgen.Init.SDL_AppInit_func
         -> SDL3.Sys.Bindgen.Init.SDL_AppIterate_func
         -> SDL3.Sys.Bindgen.Init.SDL_AppEvent_func
         -> SDL3.Sys.Bindgen.Init.SDL_AppQuit_func
         -> IO BG.CInt
       )
sDL_EnterAppMainCallbacks =
  BG.unsafePerformIO hs_bindgen_50b435e689e12498

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Main_get_SDL_GDKSuspendComplete@
foreign import ccall unsafe "hs_bindgen_07ea6ee797596218"
  hs_bindgen_07ea6ee797596218_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Main_get_SDL_GDKSuspendComplete@
hs_bindgen_07ea6ee797596218 :: IO (BG.FunPtr (IO ()))
hs_bindgen_07ea6ee797596218 =
  BG.fromFFIType hs_bindgen_07ea6ee797596218_base

{-# NOINLINE sDL_GDKSuspendComplete #-}

-- | Callback from the application to let the suspend continue.
--
--     This function is only needed for Xbox GDK support; all other platforms will do nothing and set an \"unsupported\" error message.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GDKSuspendComplete@, defined at @SDL3\/SDL_main.h 673:34@
sDL_GDKSuspendComplete :: BG.FunPtr (IO ())
sDL_GDKSuspendComplete =
  BG.unsafePerformIO hs_bindgen_07ea6ee797596218

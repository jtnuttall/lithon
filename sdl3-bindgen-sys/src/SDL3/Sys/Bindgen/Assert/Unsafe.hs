{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Assert.Unsafe (
  SDL3.Sys.Bindgen.Assert.Unsafe.sDL_ReportAssertion,
  SDL3.Sys.Bindgen.Assert.Unsafe.sDL_SetAssertionHandler,
  SDL3.Sys.Bindgen.Assert.Unsafe.sDL_GetDefaultAssertionHandler,
  SDL3.Sys.Bindgen.Assert.Unsafe.sDL_GetAssertionHandler,
  SDL3.Sys.Bindgen.Assert.Unsafe.sDL_GetAssertionReport,
  SDL3.Sys.Bindgen.Assert.Unsafe.sDL_ResetAssertionReport,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Assert

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_assert.h>"
         , "SDL_AssertState hs_bindgen_a7639e4e554aca71 ("
         , "  SDL_AssertData *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "  return (SDL_ReportAssertion)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_e1f2894e05101967 ("
         , "  SDL_AssertionHandler arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  (SDL_SetAssertionHandler)(arg1, arg2);"
         , "}"
         , "SDL_AssertionHandler hs_bindgen_dff5ecac8d034d8d (void)"
         , "{"
         , "  return (SDL_GetDefaultAssertionHandler)();"
         , "}"
         , "SDL_AssertionHandler hs_bindgen_0c314ac7cf70966e ("
         , "  void **arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAssertionHandler)(arg1);"
         , "}"
         , "SDL_AssertData const *hs_bindgen_53829b7497744243 (void)"
         , "{"
         , "  return (SDL_GetAssertionReport)();"
         , "}"
         , "void hs_bindgen_bb1d739857931f60 (void)"
         , "{"
         , "  (SDL_ResetAssertionReport)();"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_Unsafe_SDL_ReportAssertion@
foreign import ccall unsafe "hs_bindgen_a7639e4e554aca71"
  hs_bindgen_a7639e4e554aca71_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_Unsafe_SDL_ReportAssertion@
hs_bindgen_a7639e4e554aca71
  :: BG.Ptr SDL_AssertData
  -> PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> BG.CInt
  -> IO SDL_AssertState
hs_bindgen_a7639e4e554aca71 =
  BG.fromFFIType hs_bindgen_a7639e4e554aca71_base

-- | Never call this directly.
--
--     Use the SDL_assert macros instead.
--
--     [Returns]: assert state.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReportAssertion@, defined at @SDL3\/SDL_assert.h 350:45@
sDL_ReportAssertion
  :: BG.Ptr SDL_AssertData
  -- ^
  --
  --           [@data@]: assert data structure.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@func@]: function name.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: file name.
  -> BG.CInt
  -- ^
  --
  --           [@line@]: line number.
  -> IO SDL_AssertState
sDL_ReportAssertion = hs_bindgen_a7639e4e554aca71

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_Unsafe_SDL_SetAssertionHandler@
foreign import ccall unsafe "hs_bindgen_e1f2894e05101967"
  hs_bindgen_e1f2894e05101967_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_Unsafe_SDL_SetAssertionHandler@
hs_bindgen_e1f2894e05101967
  :: SDL_AssertionHandler
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_e1f2894e05101967 =
  BG.fromFFIType hs_bindgen_e1f2894e05101967_base

-- | Set an application-defined assertion handler.
--
--     This function allows an application to show its own assertion UI and\/or force the response to an assertion failure. If the application doesn\'t provide this, SDL will try to do the right thing, popping up a system-specific GUI dialog, and probably minimizing any fullscreen windows.
--
--     This callback may fire from any thread, but it runs wrapped in a mutex, so it will only fire from one thread at a time.
--
--     This callback is NOT reset to SDL\'s internal handler upon SDL_Quit()!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAssertionHandler'
--
--     [C declaration]: @SDL_SetAssertionHandler@, defined at @SDL3\/SDL_assert.h 591:34@
sDL_SetAssertionHandler
  :: SDL_AssertionHandler
  -- ^
  --
  --           [@handler@]: the 'SDL_AssertionHandler' function to call when an assertion fails or NULL for the default handler.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @handler@.
  -> IO ()
sDL_SetAssertionHandler = hs_bindgen_e1f2894e05101967

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_Unsafe_SDL_GetDefaultAssertionHandler@
foreign import ccall unsafe "hs_bindgen_dff5ecac8d034d8d"
  hs_bindgen_dff5ecac8d034d8d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_Unsafe_SDL_GetDefaultAssertionHandler@
hs_bindgen_dff5ecac8d034d8d :: IO SDL_AssertionHandler
hs_bindgen_dff5ecac8d034d8d =
  BG.fromFFIType hs_bindgen_dff5ecac8d034d8d_base

-- | Get the default assertion handler.
--
--     This returns the function pointer that is called by default when an assertion is triggered. This is an internal function provided by SDL, that is used for assertions when @SDL_SetAssertionHandler()@ hasn\'t been used to provide a different function.
--
--     [Returns]: the default 'SDL_AssertionHandler' that is called when an assert triggers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAssertionHandler'
--
--     [C declaration]: @SDL_GetDefaultAssertionHandler@, defined at @SDL3\/SDL_assert.h 612:50@
sDL_GetDefaultAssertionHandler :: IO SDL_AssertionHandler
sDL_GetDefaultAssertionHandler =
  hs_bindgen_dff5ecac8d034d8d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_Unsafe_SDL_GetAssertionHandler@
foreign import ccall unsafe "hs_bindgen_0c314ac7cf70966e"
  hs_bindgen_0c314ac7cf70966e_base
    :: BG.Ptr BG.Void
    -> IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_Unsafe_SDL_GetAssertionHandler@
hs_bindgen_0c314ac7cf70966e
  :: BG.Ptr (BG.Ptr BG.Void)
  -> IO SDL_AssertionHandler
hs_bindgen_0c314ac7cf70966e =
  BG.fromFFIType hs_bindgen_0c314ac7cf70966e_base

-- | Get the current assertion handler.
--
--     This returns the function pointer that is called when an assertion is triggered. This is either the value last passed to @SDL_SetAssertionHandler()@, or if no application-specified function is set, is equivalent to calling @SDL_GetDefaultAssertionHandler()@.
--
--     The parameter @puserdata@ is a pointer to a void*, which will store the \"userdata\" pointer that was passed to @SDL_SetAssertionHandler()@. This value will always be NULL for the default handler. If you don\'t care about this data, it is safe to pass a NULL pointer to this function to ignore it.
--
--     [Returns]: the 'SDL_AssertionHandler' that is called when an assert triggers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAssertionHandler'
--
--     [C declaration]: @SDL_GetAssertionHandler@, defined at @SDL3\/SDL_assert.h 637:50@
sDL_GetAssertionHandler
  :: BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@puserdata@]: pointer which is filled with the \"userdata\" pointer that was passed to @SDL_SetAssertionHandler()@.
  -> IO SDL_AssertionHandler
sDL_GetAssertionHandler = hs_bindgen_0c314ac7cf70966e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_Unsafe_SDL_GetAssertionReport@
foreign import ccall unsafe "hs_bindgen_53829b7497744243"
  hs_bindgen_53829b7497744243_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_Unsafe_SDL_GetAssertionReport@
hs_bindgen_53829b7497744243 :: IO (PtrConst.PtrConst SDL_AssertData)
hs_bindgen_53829b7497744243 =
  BG.fromFFIType hs_bindgen_53829b7497744243_base

-- | Get a list of all assertion failures.
--
--     This function gets all assertions triggered since the last call to @SDL_ResetAssertionReport()@, or the start of the program.
--
--     The proper way to examine this data looks something like this:
--
--     @
--     const SDL_AssertData *item = SDL_GetAssertionReport();
--     while (item) {
--        printf(\"\'%s\', %s (%s:%d), triggered %u times, always ignore: %s.\\\\n\",
--               item->condition, item->function, item->filename,
--               item->linenum, item->trigger_count,
--               item->always_ignore ? \"yes\" : \"no\");
--        item = item->next;
--     }
--     @
--
--     [Returns]: a list of all failed assertions or NULL if the list is empty. This memory should not be modified or freed by the application. This pointer remains valid until the next call to SDL_Quit() or @SDL_ResetAssertionReport()@.
--
--     [Thread safety]: This function is not thread safe. Other threads calling @SDL_ResetAssertionReport()@ simultaneously, may render the returned pointer invalid.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ResetAssertionReport'
--
--     [C declaration]: @SDL_GetAssertionReport@, defined at @SDL3\/SDL_assert.h 671:52@
sDL_GetAssertionReport :: IO (PtrConst.PtrConst SDL_AssertData)
sDL_GetAssertionReport = hs_bindgen_53829b7497744243

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_Unsafe_SDL_ResetAssertionReport@
foreign import ccall unsafe "hs_bindgen_bb1d739857931f60"
  hs_bindgen_bb1d739857931f60_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_Unsafe_SDL_ResetAssertionReport@
hs_bindgen_bb1d739857931f60 :: IO ()
hs_bindgen_bb1d739857931f60 =
  BG.fromFFIType hs_bindgen_bb1d739857931f60_base

-- | Clear the list of all assertion failures.
--
--     This function will clear the list of all assertions triggered up to that point. Immediately following this call, SDL_GetAssertionReport will return no items. In addition, any previously-triggered assertions will be reset to a trigger_count of zero, and their always_ignore state will be false.
--
--     [Thread safety]: This function is not thread safe. Other threads triggering an assertion, or simultaneously calling this function may cause memory leaks or crashes.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAssertionReport'
--
--     [C declaration]: @SDL_ResetAssertionReport@, defined at @SDL3\/SDL_assert.h 689:34@
sDL_ResetAssertionReport :: IO ()
sDL_ResetAssertionReport =
  hs_bindgen_bb1d739857931f60

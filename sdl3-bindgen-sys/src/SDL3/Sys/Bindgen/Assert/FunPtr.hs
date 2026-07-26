{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Assert.FunPtr (
  SDL3.Sys.Bindgen.Assert.FunPtr.sDL_ReportAssertion,
  SDL3.Sys.Bindgen.Assert.FunPtr.sDL_SetAssertionHandler,
  SDL3.Sys.Bindgen.Assert.FunPtr.sDL_GetDefaultAssertionHandler,
  SDL3.Sys.Bindgen.Assert.FunPtr.sDL_GetAssertionHandler,
  SDL3.Sys.Bindgen.Assert.FunPtr.sDL_GetAssertionReport,
  SDL3.Sys.Bindgen.Assert.FunPtr.sDL_ResetAssertionReport,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Assert

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_assert.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_ReportAssertion */"
         , "__attribute__ ((const))"
         , "SDL_AssertState (*hs_bindgen_3242a9f392e3cbbb (void)) ("
         , "  SDL_AssertData *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "  return &SDL_ReportAssertion;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_SetAssertionHandler */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_d3c978a8cd9d0fb4 (void)) ("
         , "  SDL_AssertionHandler arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetAssertionHandler;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_GetDefaultAssertionHandler */"
         , "__attribute__ ((const))"
         , "SDL_AssertionHandler (*hs_bindgen_9ee5171cfc759fff (void)) (void)"
         , "{"
         , "  return &SDL_GetDefaultAssertionHandler;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_GetAssertionHandler */"
         , "__attribute__ ((const))"
         , "SDL_AssertionHandler (*hs_bindgen_d86a645db34b2ab2 (void)) ("
         , "  void **arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAssertionHandler;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_GetAssertionReport */"
         , "__attribute__ ((const))"
         , "SDL_AssertData const *(*hs_bindgen_81f7661412c040b9 (void)) (void)"
         , "{"
         , "  return &SDL_GetAssertionReport;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_ResetAssertionReport */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_d418f82b830fadaf (void)) (void)"
         , "{"
         , "  return &SDL_ResetAssertionReport;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_ReportAssertion@
foreign import ccall unsafe "hs_bindgen_3242a9f392e3cbbb"
  hs_bindgen_3242a9f392e3cbbb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_ReportAssertion@
hs_bindgen_3242a9f392e3cbbb
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_AssertData
             -> PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> BG.CInt
             -> IO SDL_AssertState
           )
       )
hs_bindgen_3242a9f392e3cbbb =
  BG.fromFFIType hs_bindgen_3242a9f392e3cbbb_base

{-# NOINLINE sDL_ReportAssertion #-}

-- | Never call this directly.
--
--     Use the SDL_assert macros instead.
--
--     [@data@]: assert data structure.
--
--     [@func@]: function name.
--
--     [@file@]: file name.
--
--     [@line@]: line number.
--
--     [Returns]: assert state.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReportAssertion@, defined at @SDL3\/SDL_assert.h 350:45@
sDL_ReportAssertion
  :: BG.FunPtr
       ( BG.Ptr SDL_AssertData
         -> PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> BG.CInt
         -> IO SDL_AssertState
       )
sDL_ReportAssertion =
  BG.unsafePerformIO hs_bindgen_3242a9f392e3cbbb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_SetAssertionHandler@
foreign import ccall unsafe "hs_bindgen_d3c978a8cd9d0fb4"
  hs_bindgen_d3c978a8cd9d0fb4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_SetAssertionHandler@
hs_bindgen_d3c978a8cd9d0fb4 :: IO (BG.FunPtr (SDL_AssertionHandler -> BG.Ptr BG.Void -> IO ()))
hs_bindgen_d3c978a8cd9d0fb4 =
  BG.fromFFIType hs_bindgen_d3c978a8cd9d0fb4_base

{-# NOINLINE sDL_SetAssertionHandler #-}

-- | Set an application-defined assertion handler.
--
--     This function allows an application to show its own assertion UI and\/or force the response to an assertion failure. If the application doesn\'t provide this, SDL will try to do the right thing, popping up a system-specific GUI dialog, and probably minimizing any fullscreen windows.
--
--     This callback may fire from any thread, but it runs wrapped in a mutex, so it will only fire from one thread at a time.
--
--     This callback is NOT reset to SDL\'s internal handler upon SDL_Quit()!
--
--     [@handler@]: the 'SDL_AssertionHandler' function to call when an assertion fails or NULL for the default handler.
--
--     [@userdata@]: a pointer that is passed to @handler@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAssertionHandler'
--
--     [C declaration]: @SDL_SetAssertionHandler@, defined at @SDL3\/SDL_assert.h 591:34@
sDL_SetAssertionHandler :: BG.FunPtr (SDL_AssertionHandler -> BG.Ptr BG.Void -> IO ())
sDL_SetAssertionHandler =
  BG.unsafePerformIO hs_bindgen_d3c978a8cd9d0fb4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_GetDefaultAssertionHandler@
foreign import ccall unsafe "hs_bindgen_9ee5171cfc759fff"
  hs_bindgen_9ee5171cfc759fff_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_GetDefaultAssertionHandler@
hs_bindgen_9ee5171cfc759fff :: IO (BG.FunPtr (IO SDL_AssertionHandler))
hs_bindgen_9ee5171cfc759fff =
  BG.fromFFIType hs_bindgen_9ee5171cfc759fff_base

{-# NOINLINE sDL_GetDefaultAssertionHandler #-}

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
sDL_GetDefaultAssertionHandler :: BG.FunPtr (IO SDL_AssertionHandler)
sDL_GetDefaultAssertionHandler =
  BG.unsafePerformIO hs_bindgen_9ee5171cfc759fff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_GetAssertionHandler@
foreign import ccall unsafe "hs_bindgen_d86a645db34b2ab2"
  hs_bindgen_d86a645db34b2ab2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_GetAssertionHandler@
hs_bindgen_d86a645db34b2ab2 :: IO (BG.FunPtr (BG.Ptr (BG.Ptr BG.Void) -> IO SDL_AssertionHandler))
hs_bindgen_d86a645db34b2ab2 =
  BG.fromFFIType hs_bindgen_d86a645db34b2ab2_base

{-# NOINLINE sDL_GetAssertionHandler #-}

-- | Get the current assertion handler.
--
--     This returns the function pointer that is called when an assertion is triggered. This is either the value last passed to @SDL_SetAssertionHandler()@, or if no application-specified function is set, is equivalent to calling @SDL_GetDefaultAssertionHandler()@.
--
--     The parameter @puserdata@ is a pointer to a void*, which will store the \"userdata\" pointer that was passed to @SDL_SetAssertionHandler()@. This value will always be NULL for the default handler. If you don\'t care about this data, it is safe to pass a NULL pointer to this function to ignore it.
--
--     [@puserdata@]: pointer which is filled with the \"userdata\" pointer that was passed to @SDL_SetAssertionHandler()@.
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
sDL_GetAssertionHandler :: BG.FunPtr (BG.Ptr (BG.Ptr BG.Void) -> IO SDL_AssertionHandler)
sDL_GetAssertionHandler =
  BG.unsafePerformIO hs_bindgen_d86a645db34b2ab2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_GetAssertionReport@
foreign import ccall unsafe "hs_bindgen_81f7661412c040b9"
  hs_bindgen_81f7661412c040b9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_GetAssertionReport@
hs_bindgen_81f7661412c040b9 :: IO (BG.FunPtr (IO (PtrConst.PtrConst SDL_AssertData)))
hs_bindgen_81f7661412c040b9 =
  BG.fromFFIType hs_bindgen_81f7661412c040b9_base

{-# NOINLINE sDL_GetAssertionReport #-}

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
sDL_GetAssertionReport :: BG.FunPtr (IO (PtrConst.PtrConst SDL_AssertData))
sDL_GetAssertionReport =
  BG.unsafePerformIO hs_bindgen_81f7661412c040b9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_ResetAssertionReport@
foreign import ccall unsafe "hs_bindgen_d418f82b830fadaf"
  hs_bindgen_d418f82b830fadaf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Assert_get_SDL_ResetAssertionReport@
hs_bindgen_d418f82b830fadaf :: IO (BG.FunPtr (IO ()))
hs_bindgen_d418f82b830fadaf =
  BG.fromFFIType hs_bindgen_d418f82b830fadaf_base

{-# NOINLINE sDL_ResetAssertionReport #-}

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
sDL_ResetAssertionReport :: BG.FunPtr (IO ())
sDL_ResetAssertionReport =
  BG.unsafePerformIO hs_bindgen_d418f82b830fadaf

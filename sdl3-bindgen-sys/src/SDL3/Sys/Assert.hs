-- | A helpful assertion macro!
--
--     SDL assertions operate like your usual @assert@ macro, but with some added features:
--
--     * It uses a trick with the @sizeof@ operator, so disabled assertions vaporize out of the compiled code, but variables only referenced in the assertion won\'t trigger compiler warnings about being unused.
--
--     * It is safe to use with a dangling-else: @if (x) SDL_assert(y); else do_something();@
--
--     * It works the same everywhere, instead of counting on various platforms\' compiler and C runtime to behave.
--
--     * It provides multiple levels of assertion (SDL_assert, SDL_assert_release, SDL_assert_paranoid) instead of a single all-or-nothing option.
--
--     * It offers a variety of responses when an assertion fails (retry, trigger the debugger, abort the program, ignore the failure once, ignore it for the rest of the program\'s run).
--
--     * It tries to show the user a dialog by default, if possible, but the app can provide a callback to handle assertion failures however they like.
--
--     * It lets failed assertions be retried. Perhaps you had a network failure and just want to retry the test after plugging your network cable back in? You can.
--
--     * It lets the user ignore an assertion failure, if there\'s a harmless problem that one can continue past.
--
--     * It lets the user mark an assertion as ignored for the rest of the program\'s run; if there\'s a harmless problem that keeps popping up.
--
--     * It provides statistics and data on all failed assertions to the app.
--
--     * It allows the default assertion handler to be controlled with environment variables, in case an automated script needs to control it.
--
--     * It can be used as an aid to Clang\'s static analysis; it will treat SDL assertions as universally true (under the assumption that you are serious about the asserted claims and that your debug builds will detect when these claims were wrong). This can help the analyzer avoid false positives.
--
--     To use it: compile a debug build and just sprinkle around tests to check your code!
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Assert.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Assert (
  module SDL3.Sys.Bindgen.Assert,

  -- * Function aliases
  SDL3.Sys.Assert.reportAssertion,
  SDL3.Sys.Assert.reportAssertionSafe,
  SDL3.Sys.Assert.setAssertionHandler,
  SDL3.Sys.Assert.setAssertionHandlerSafe,
  SDL3.Sys.Assert.getDefaultAssertionHandler,
  SDL3.Sys.Assert.getDefaultAssertionHandlerSafe,
  SDL3.Sys.Assert.getAssertionHandler,
  SDL3.Sys.Assert.getAssertionHandlerSafe,
  SDL3.Sys.Assert.getAssertionReport,
  SDL3.Sys.Assert.getAssertionReportSafe,
  SDL3.Sys.Assert.resetAssertionReport,
  SDL3.Sys.Assert.resetAssertionReportSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Assert
import SDL3.Sys.Bindgen.Assert.Safe qualified as Safe
import SDL3.Sys.Bindgen.Assert.Unsafe qualified as Unsafe

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReportAssertion@.
--                   The safe flavor is 'reportAssertionSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReportAssertion@, defined at @SDL3\/SDL_assert.h 350:45@
reportAssertion
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
  -> BG.Int32
  -- ^
  --
  --           [@line@]: line number.
  -> IO SDL_AssertState
reportAssertion =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_ReportAssertion x00 x11 x22 (Coerce.coerce x33)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReportAssertion@.
--                   The unsafe flavor is 'reportAssertion'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReportAssertion@, defined at @SDL3\/SDL_assert.h 350:45@
reportAssertionSafe
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
  -> BG.Int32
  -- ^
  --
  --           [@line@]: line number.
  -> IO SDL_AssertState
reportAssertionSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_ReportAssertion x00 x11 x22 (Coerce.coerce x33)

-- | Set an application-defined assertion handler.
--
--     This function allows an application to show its own assertion UI and\/or force the response to an assertion failure. If the application doesn\'t provide this, SDL will try to do the right thing, popping up a system-specific GUI dialog, and probably minimizing any fullscreen windows.
--
--     This callback may fire from any thread, but it runs wrapped in a mutex, so it will only fire from one thread at a time.
--
--     This callback is NOT reset to SDL\'s internal handler upon 'SDL3.Sys.Init.quit'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAssertionHandler'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAssertionHandler@.
--                   The safe flavor is 'setAssertionHandlerSafe'
--                   : registration; the handler fires from failed SDL assertions.
--
--     [C declaration]: @SDL_SetAssertionHandler@, defined at @SDL3\/SDL_assert.h 591:34@
setAssertionHandler
  :: SDL_AssertionHandler
  -- ^
  --
  --           [@handler@]: the 'SDL_AssertionHandler' function to call when an assertion fails or NULL for the default handler.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @handler@.
  -> IO ()
setAssertionHandler = Unsafe.sDL_SetAssertionHandler

-- | Set an application-defined assertion handler.
--
--     This function allows an application to show its own assertion UI and\/or force the response to an assertion failure. If the application doesn\'t provide this, SDL will try to do the right thing, popping up a system-specific GUI dialog, and probably minimizing any fullscreen windows.
--
--     This callback may fire from any thread, but it runs wrapped in a mutex, so it will only fire from one thread at a time.
--
--     This callback is NOT reset to SDL\'s internal handler upon 'SDL3.Sys.Init.quit'!
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAssertionHandler'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAssertionHandler@.
--                   The unsafe flavor is 'setAssertionHandler'
--                   : registration; the handler fires from failed SDL assertions.
--
--     [C declaration]: @SDL_SetAssertionHandler@, defined at @SDL3\/SDL_assert.h 591:34@
setAssertionHandlerSafe
  :: SDL_AssertionHandler
  -- ^
  --
  --           [@handler@]: the 'SDL_AssertionHandler' function to call when an assertion fails or NULL for the default handler.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @handler@.
  -> IO ()
setAssertionHandlerSafe =
  Safe.sDL_SetAssertionHandler

-- | Get the default assertion handler.
--
--     This returns the function pointer that is called by default when an assertion is triggered. This is an internal function provided by SDL, that is used for assertions when @'setAssertionHandler'@ hasn\'t been used to provide a different function.
--
--     [Returns]: the default 'SDL_AssertionHandler' that is called when an assert triggers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAssertionHandler'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDefaultAssertionHandler@.
--                   The safe flavor is 'getDefaultAssertionHandlerSafe'
--                   .
--
--     [C declaration]: @SDL_GetDefaultAssertionHandler@, defined at @SDL3\/SDL_assert.h 612:50@
getDefaultAssertionHandler :: IO SDL_AssertionHandler
getDefaultAssertionHandler =
  Unsafe.sDL_GetDefaultAssertionHandler

-- | Get the default assertion handler.
--
--     This returns the function pointer that is called by default when an assertion is triggered. This is an internal function provided by SDL, that is used for assertions when @'setAssertionHandler'@ hasn\'t been used to provide a different function.
--
--     [Returns]: the default 'SDL_AssertionHandler' that is called when an assert triggers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAssertionHandler'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDefaultAssertionHandler@.
--                   The unsafe flavor is 'getDefaultAssertionHandler'
--                   .
--
--     [C declaration]: @SDL_GetDefaultAssertionHandler@, defined at @SDL3\/SDL_assert.h 612:50@
getDefaultAssertionHandlerSafe :: IO SDL_AssertionHandler
getDefaultAssertionHandlerSafe =
  Safe.sDL_GetDefaultAssertionHandler

-- | Get the current assertion handler.
--
--     This returns the function pointer that is called when an assertion is triggered. This is either the value last passed to @'setAssertionHandler'@, or if no application-specified function is set, is equivalent to calling @'getDefaultAssertionHandler'@.
--
--     The parameter @puserdata@ is a pointer to a void*, which will store the \"userdata\" pointer that was passed to @'setAssertionHandler'@. This value will always be NULL for the default handler. If you don\'t care about this data, it is safe to pass a NULL pointer to this function to ignore it.
--
--     [Returns]: the 'SDL_AssertionHandler' that is called when an assert triggers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAssertionHandler'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAssertionHandler@.
--                   The safe flavor is 'getAssertionHandlerSafe'
--                   .
--
--     [C declaration]: @SDL_GetAssertionHandler@, defined at @SDL3\/SDL_assert.h 637:50@
getAssertionHandler
  :: BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@puserdata@]: pointer which is filled with the \"userdata\" pointer that was passed to @'setAssertionHandler'@.
  -> IO SDL_AssertionHandler
getAssertionHandler = Unsafe.sDL_GetAssertionHandler

-- | Get the current assertion handler.
--
--     This returns the function pointer that is called when an assertion is triggered. This is either the value last passed to @'setAssertionHandler'@, or if no application-specified function is set, is equivalent to calling @'getDefaultAssertionHandler'@.
--
--     The parameter @puserdata@ is a pointer to a void*, which will store the \"userdata\" pointer that was passed to @'setAssertionHandler'@. This value will always be NULL for the default handler. If you don\'t care about this data, it is safe to pass a NULL pointer to this function to ignore it.
--
--     [Returns]: the 'SDL_AssertionHandler' that is called when an assert triggers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAssertionHandler'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAssertionHandler@.
--                   The unsafe flavor is 'getAssertionHandler'
--                   .
--
--     [C declaration]: @SDL_GetAssertionHandler@, defined at @SDL3\/SDL_assert.h 637:50@
getAssertionHandlerSafe
  :: BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@puserdata@]: pointer which is filled with the \"userdata\" pointer that was passed to @'setAssertionHandler'@.
  -> IO SDL_AssertionHandler
getAssertionHandlerSafe =
  Safe.sDL_GetAssertionHandler

-- | Get a list of all assertion failures.
--
--     This function gets all assertions triggered since the last call to @'resetAssertionReport'@, or the start of the program.
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
--     [Returns]: a list of all failed assertions or NULL if the list is empty. This memory should not be modified or freed by the application. This pointer remains valid until the next call to 'SDL3.Sys.Init.quit' or @'resetAssertionReport'@.
--
--     [Thread safety]: This function is not thread safe. Other threads calling @'resetAssertionReport'@ simultaneously, may render the returned pointer invalid.
--
--     @since 3.2.0
--
--     [See also]: 'resetAssertionReport'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAssertionReport@.
--                   The safe flavor is 'getAssertionReportSafe'
--                   .
--
--     [C declaration]: @SDL_GetAssertionReport@, defined at @SDL3\/SDL_assert.h 671:52@
getAssertionReport :: IO (PtrConst.PtrConst SDL_AssertData)
getAssertionReport = Unsafe.sDL_GetAssertionReport

-- | Get a list of all assertion failures.
--
--     This function gets all assertions triggered since the last call to @'resetAssertionReport'@, or the start of the program.
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
--     [Returns]: a list of all failed assertions or NULL if the list is empty. This memory should not be modified or freed by the application. This pointer remains valid until the next call to 'SDL3.Sys.Init.quit' or @'resetAssertionReport'@.
--
--     [Thread safety]: This function is not thread safe. Other threads calling @'resetAssertionReport'@ simultaneously, may render the returned pointer invalid.
--
--     @since 3.2.0
--
--     [See also]: 'resetAssertionReport'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAssertionReport@.
--                   The unsafe flavor is 'getAssertionReport'
--                   .
--
--     [C declaration]: @SDL_GetAssertionReport@, defined at @SDL3\/SDL_assert.h 671:52@
getAssertionReportSafe :: IO (PtrConst.PtrConst SDL_AssertData)
getAssertionReportSafe = Safe.sDL_GetAssertionReport

-- | Clear the list of all assertion failures.
--
--     This function will clear the list of all assertions triggered up to that point. Immediately following this call, 'getAssertionReport' will return no items. In addition, any previously-triggered assertions will be reset to a trigger_count of zero, and their always_ignore state will be false.
--
--     [Thread safety]: This function is not thread safe. Other threads triggering an assertion, or simultaneously calling this function may cause memory leaks or crashes.
--
--     @since 3.2.0
--
--     [See also]: 'getAssertionReport'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ResetAssertionReport@.
--                   The safe flavor is 'resetAssertionReportSafe'
--                   .
--
--     [C declaration]: @SDL_ResetAssertionReport@, defined at @SDL3\/SDL_assert.h 689:34@
resetAssertionReport :: IO ()
resetAssertionReport =
  Unsafe.sDL_ResetAssertionReport

-- | Clear the list of all assertion failures.
--
--     This function will clear the list of all assertions triggered up to that point. Immediately following this call, 'getAssertionReport' will return no items. In addition, any previously-triggered assertions will be reset to a trigger_count of zero, and their always_ignore state will be false.
--
--     [Thread safety]: This function is not thread safe. Other threads triggering an assertion, or simultaneously calling this function may cause memory leaks or crashes.
--
--     @since 3.2.0
--
--     [See also]: 'getAssertionReport'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ResetAssertionReport@.
--                   The unsafe flavor is 'resetAssertionReport'
--                   .
--
--     [C declaration]: @SDL_ResetAssertionReport@, defined at @SDL3\/SDL_assert.h 689:34@
resetAssertionReportSafe :: IO ()
resetAssertionReportSafe =
  Safe.sDL_ResetAssertionReport

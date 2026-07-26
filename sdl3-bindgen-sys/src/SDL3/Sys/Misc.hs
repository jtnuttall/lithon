-- | SDL API functions that don\'t fit elsewhere. Open a URL\/URI in the browser or other appropriate external application.
--
--     Open a URL in a separate, system-provided application. How this works will vary wildly depending on the platform. This will likely launch what makes sense to handle a specific URL\'s protocol (a web browser for @[http:\/\/](http://)@, etc), but it might also be able to launch file managers for directories and other things.
--
--     What happens when you open a URL varies wildly as well: your game window may lose focus (and may or may not lose focus if your game was fullscreen or grabbing input at the time). On mobile devices, your app will likely move to the background or your process might be paused. Any given platform may or may not handle a given URL.
--
--     If this is unimplemented (or simply unavailable) for a platform, this will fail with an error. A successful result does not mean the URL loaded, just that we launched /something/ to handle it (or at least believe we did).
--
--     All this to say: this function can be useful, but you should definitely test it on every platform you target.
--
--     [@url@]: a valid URL\/URI to open. Use @[file:\/\/\/full\/path\/to\/file](file:///full/path/to/file)@ for local files, if supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Misc.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Misc (
  -- * Function aliases
  SDL3.Sys.Misc.openURL,
  SDL3.Sys.Misc.openURLSafe,
)
where

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Misc.Safe qualified as Safe
import SDL3.Sys.Bindgen.Misc.Unsafe qualified as Unsafe

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenURL@.
--                   The safe flavor is 'openURLSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_OpenURL@, defined at @SDL3\/SDL_misc.h 72:34@
openURL
  :: PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @url@
  -> IO Bool
openURL =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_OpenURL x00)

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenURL@.
--                   The unsafe flavor is 'openURL'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_OpenURL@, defined at @SDL3\/SDL_misc.h 72:34@
openURLSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @url@
  -> IO Bool
openURLSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_OpenURL x00)

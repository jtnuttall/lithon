-- | SDL provides a means to identify the app\'s platform, both at compile time and runtime. Get the name of the platform.
--
--     Here are the names returned for some (but not all) supported platforms:
--
--     * \"Windows\"
--
--     * \"macOS\"
--
--     * \"Linux\"
--
--     * \"iOS\"
--
--     * \"Android\"
--
--     [Returns]: the name of the platform. If the correct platform name is not available, returns a string beginning with the text \"Unknown\".
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Platform.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Platform (
  -- * Function aliases
  SDL3.Sys.Platform.getPlatform,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Platform.Unsafe qualified as Unsafe

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPlatform@.
--                   The safe import is not exported
--                   : returns a compiled-in constant; cannot block, lock, or call back.
--
--     [C declaration]: @SDL_GetPlatform@, defined at @SDL3\/SDL_platform.h 58:42@
getPlatform :: IO (PtrConst.PtrConst BG.CChar)
getPlatform = Unsafe.sDL_GetPlatform

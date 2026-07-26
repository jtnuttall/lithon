-- | Functionality to query the current SDL version, both as headers the app was compiled against, and a library the app is linked to. The current major version of SDL headers.
--
--     If this were SDL version 3.2.1, this value would be 3.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Version.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Version (
  module SDL3.Sys.Bindgen.Version,

  -- * Function aliases
  SDL3.Sys.Version.getVersion,
  SDL3.Sys.Version.getRevision,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Version
import SDL3.Sys.Bindgen.Version.Unsafe qualified as Unsafe

-- | Get the version of SDL that is linked against your program.
--
--     If you are linking to SDL dynamically, then it is possible that the current version will be different than the version you compiled against. This function returns the current version, while SDL_VERSION is the version you compiled with.
--
--     This function may be called safely at any time, even before 'SDL3.Sys.Init.init'.
--
--     [Returns]: the version of the linked library.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRevision'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetVersion@.
--                   The safe import is not exported
--                   : returns a compiled-in constant; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetVersion@, defined at @SDL3\/SDL_version.h 160:33@
getVersion :: IO BG.Int32
getVersion = fmap Coerce.coerce Unsafe.sDL_GetVersion

-- | Get the code revision of the SDL library that is linked against your program.
--
--     This value is the revision of the code you are linking against and may be different from the code you are compiling with, which is found in the constant SDL_REVISION if you explicitly include SDL_revision.h
--
--     The revision is an arbitrary string (a hash value) uniquely identifying the exact revision of the SDL library in use, and is only useful in comparing against other revisions. It is NOT an incrementing number.
--
--     If SDL wasn\'t built from a git repository with the appropriate tools, this will return an empty string.
--
--     You shouldn\'t use this function for anything but logging it for debugging purposes. The string is not intended to be reliable in any way.
--
--     [Returns]: an arbitrary string, uniquely identifying the exact revision of the SDL library in use.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getVersion'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRevision@.
--                   The safe import is not exported
--                   : returns a compiled-in constant; cannot block, lock, or call back.
--
--     [C declaration]: @SDL_GetRevision@, defined at @SDL3\/SDL_version.h 189:42@
getRevision :: IO (PtrConst.PtrConst BG.CChar)
getRevision = Unsafe.sDL_GetRevision

-- | A GUID is a 128-bit value that represents something that is uniquely identifiable by this value: \"globally unique.\"
--
--     SDL provides functions to convert a GUID to\/from a string. An 'SDL_GUID' is a 128-bit identifier for an input device that identifies that device across runs of SDL programs on the same platform.
--
--     If the device is detached and then re-attached to a different port, or if the base system is rebooted, the device should still report the same GUID.
--
--     GUIDs are as precise as possible but are not guaranteed to distinguish physically distinct but equivalent devices. For example, two game controllers from the same vendor with the same product ID and revision may have the same GUID.
--
--     GUIDs may be platform-dependent (i.e., the same device may report different GUIDs on different operating systems).
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Guid.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Guid (
  module SDL3.Sys.Bindgen.Guid,

  -- * Function aliases
  SDL3.Sys.Guid.guidToString,
  SDL3.Sys.Guid.guidToStringSafe,
  SDL3.Sys.Guid.stringToGUID,
  SDL3.Sys.Guid.stringToGUIDSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Guid
import SDL3.Sys.Bindgen.Guid.Safe qualified as Safe
import SDL3.Sys.Bindgen.Guid.Unsafe qualified as Unsafe

-- | Get an ASCII string representation for a given 'SDL_GUID'.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'stringToGUID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GUIDToString@.
--                   The safe flavor is 'guidToStringSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GUIDToString@, defined at @SDL3\/SDL_guid.h 80:34@
guidToString
  :: SDL_GUID
  -- ^
  --
  --           [@guid@]: the 'SDL_GUID' you wish to convert to string.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@pszGUID@]: buffer in which to write the ASCII string.
  -> BG.Int32
  -- ^
  --
  --           [@cbGUID@]: the size of pszGUID, should be at least 33 bytes.
  -> IO ()
guidToString =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_GUIDToString x00 x11 (Coerce.coerce x22)

-- | Get an ASCII string representation for a given 'SDL_GUID'.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'stringToGUID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GUIDToString@.
--                   The unsafe flavor is 'guidToString'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GUIDToString@, defined at @SDL3\/SDL_guid.h 80:34@
guidToStringSafe
  :: SDL_GUID
  -- ^
  --
  --           [@guid@]: the 'SDL_GUID' you wish to convert to string.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@pszGUID@]: buffer in which to write the ASCII string.
  -> BG.Int32
  -- ^
  --
  --           [@cbGUID@]: the size of pszGUID, should be at least 33 bytes.
  -> IO ()
guidToStringSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.sDL_GUIDToString x00 x11 (Coerce.coerce x22)

-- | Convert a GUID string into a 'SDL_GUID' structure.
--
--     Performs no error checking. If this function is given a string containing an invalid GUID, the function will silently succeed, but the GUID generated will not be useful.
--
--     [Returns]: a 'SDL_GUID' structure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'guidToString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_StringToGUID@.
--                   The safe flavor is 'stringToGUIDSafe'
--                   .
--
--     [C declaration]: @SDL_StringToGUID@, defined at @SDL3\/SDL_guid.h 98:38@
stringToGUID
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@pchGUID@]: string containing an ASCII representation of a GUID.
  -> IO SDL_GUID
stringToGUID = Unsafe.sDL_StringToGUID

-- | Convert a GUID string into a 'SDL_GUID' structure.
--
--     Performs no error checking. If this function is given a string containing an invalid GUID, the function will silently succeed, but the GUID generated will not be useful.
--
--     [Returns]: a 'SDL_GUID' structure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'guidToString'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_StringToGUID@.
--                   The unsafe flavor is 'stringToGUID'
--                   .
--
--     [C declaration]: @SDL_StringToGUID@, defined at @SDL3\/SDL_guid.h 98:38@
stringToGUIDSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@pchGUID@]: string containing an ASCII representation of a GUID.
  -> IO SDL_GUID
stringToGUIDSafe = Safe.sDL_StringToGUID

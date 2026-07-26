{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Guid.Unsafe (
  SDL3.Sys.Bindgen.Guid.Unsafe.sDL_GUIDToString,
  SDL3.Sys.Bindgen.Guid.Unsafe.sDL_StringToGUID,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Guid

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_guid.h>"
         , "void hs_bindgen_8df1ca830111b8be ("
         , "  SDL_GUID *arg1,"
         , "  char *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  (SDL_GUIDToString)(*arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_5e01e589522eb138 ("
         , "  char const *arg1,"
         , "  SDL_GUID *arg2"
         , ")"
         , "{"
         , "  *arg2 = (SDL_StringToGUID)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Guid_Unsafe_SDL_GUIDToString@
foreign import ccall unsafe "hs_bindgen_8df1ca830111b8be"
  hs_bindgen_8df1ca830111b8be_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Guid_Unsafe_SDL_GUIDToString@
hs_bindgen_8df1ca830111b8be
  :: BG.Ptr SDL_GUID
  -> BG.Ptr BG.CChar
  -> BG.CInt
  -> IO ()
hs_bindgen_8df1ca830111b8be =
  BG.fromFFIType hs_bindgen_8df1ca830111b8be_base

-- | Get an ASCII string representation for a given 'SDL_GUID'.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StringToGUID'
--
--     [C declaration]: @SDL_GUIDToString@, defined at @SDL3\/SDL_guid.h 80:34@
sDL_GUIDToString
  :: SDL_GUID
  -- ^
  --
  --           [@guid@]: the 'SDL_GUID' you wish to convert to string.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@pszGUID@]: buffer in which to write the ASCII string.
  -> BG.CInt
  -- ^
  --
  --           [@cbGUID@]: the size of pszGUID, should be at least 33 bytes.
  -> IO ()
sDL_GUIDToString =
  \guid0 ->
    \pszGUID1 ->
      \cbGUID2 ->
        BG.with
          guid0
          ( \guid3 ->
              hs_bindgen_8df1ca830111b8be guid3 pszGUID1 cbGUID2
          )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Guid_Unsafe_SDL_StringToGUID@
foreign import ccall unsafe "hs_bindgen_5e01e589522eb138"
  hs_bindgen_5e01e589522eb138_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Guid_Unsafe_SDL_StringToGUID@
hs_bindgen_5e01e589522eb138
  :: PtrConst.PtrConst BG.CChar
  -> BG.Ptr SDL_GUID
  -> IO ()
hs_bindgen_5e01e589522eb138 =
  BG.fromFFIType hs_bindgen_5e01e589522eb138_base

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
--     [See also]: 'sDL_GUIDToString'
--
--     [C declaration]: @SDL_StringToGUID@, defined at @SDL3\/SDL_guid.h 98:38@
sDL_StringToGUID
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@pchGUID@]: string containing an ASCII representation of a GUID.
  -> IO SDL_GUID
sDL_StringToGUID =
  \pchGUID0 ->
    BG.allocaAndPeek
      ( \res1 ->
          hs_bindgen_5e01e589522eb138 pchGUID0 res1
      )

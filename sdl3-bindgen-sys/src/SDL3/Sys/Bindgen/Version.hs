{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | Functionality to query the current SDL version, both as headers the app was compiled against, and a library the app is linked to. The current major version of SDL headers.
--
--     If this were SDL version 3.2.1, this value would be 3.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Version (
  SDL3.Sys.Bindgen.Version.sDL_MAJOR_VERSION,
  SDL3.Sys.Bindgen.Version.sDL_MINOR_VERSION,
  SDL3.Sys.Bindgen.Version.sDL_MICRO_VERSION,
  SDL3.Sys.Bindgen.Version.sDL_VERSIONNUM,
  SDL3.Sys.Bindgen.Version.sDL_VERSIONNUM_MAJOR,
  SDL3.Sys.Bindgen.Version.sDL_VERSIONNUM_MINOR,
  SDL3.Sys.Bindgen.Version.sDL_VERSIONNUM_MICRO,
  SDL3.Sys.Bindgen.Version.sDL_VERSION,
  SDL3.Sys.Bindgen.Version.sDL_VERSION_ATLEAST,
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.Support qualified as BG

-- | [C declaration]: @macro SDL_MAJOR_VERSION@, defined at @SDL3\/SDL_version.h 47:9@
sDL_MAJOR_VERSION :: BG.CInt
sDL_MAJOR_VERSION = (3 :: BG.CInt)

-- | The current minor version of the SDL headers.
--
--     If this were SDL version 3.2.1, this value would be 2.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_MINOR_VERSION@, defined at @SDL3\/SDL_version.h 56:9@
sDL_MINOR_VERSION :: BG.CInt
sDL_MINOR_VERSION = (4 :: BG.CInt)

-- | The current micro (or patchlevel) version of the SDL headers.
--
--     If this were SDL version 3.2.1, this value would be 1.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_MICRO_VERSION@, defined at @SDL3\/SDL_version.h 65:9@
sDL_MICRO_VERSION :: BG.CInt
sDL_MICRO_VERSION = (2 :: BG.CInt)

-- | This macro turns the version numbers into a numeric value.
--
--     (1,2,3) becomes 1002003.
--
--     [@major@]: the major version number.
--
--     [@minor@]: the minorversion number.
--
--     [@patch@]: the patch version number.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_VERSIONNUM@, defined at @SDL3\/SDL_version.h 78:9@
sDL_VERSIONNUM
  :: forall a0 b1 c2
   . ( C.Expr.HostPlatform.Add
         (C.Expr.HostPlatform.MultRes a0 BG.CInt)
         (C.Expr.HostPlatform.MultRes b1 BG.CInt)
     )
  => ( C.Expr.HostPlatform.Add
         ( C.Expr.HostPlatform.AddRes
             (C.Expr.HostPlatform.MultRes a0 BG.CInt)
             (C.Expr.HostPlatform.MultRes b1 BG.CInt)
         )
         c2
     )
  => (C.Expr.HostPlatform.Mult b1 BG.CInt)
  => (C.Expr.HostPlatform.Mult a0 BG.CInt)
  => a0
  -> b1
  -> c2
  -> C.Expr.HostPlatform.AddRes
       ( C.Expr.HostPlatform.AddRes
           (C.Expr.HostPlatform.MultRes a0 BG.CInt)
           (C.Expr.HostPlatform.MultRes b1 BG.CInt)
       )
       c2
sDL_VERSIONNUM =
  \major0 ->
    \minor1 ->
      \patch2 ->
        (C.Expr.HostPlatform.+)
          ( (C.Expr.HostPlatform.+)
              ((C.Expr.HostPlatform.*) major0 (1000000 :: BG.CInt))
              ((C.Expr.HostPlatform.*) minor1 (1000 :: BG.CInt))
          )
          patch2

-- | This macro extracts the major version from a version number
--
--     1002003 becomes 1.
--
--     [@version@]: the version number.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_VERSIONNUM_MAJOR@, defined at @SDL3\/SDL_version.h 92:9@
sDL_VERSIONNUM_MAJOR
  :: forall a0. (C.Expr.HostPlatform.Div a0 BG.CInt) => a0 -> C.Expr.HostPlatform.DivRes a0 BG.CInt
sDL_VERSIONNUM_MAJOR =
  \version0 ->
    (C.Expr.HostPlatform./) version0 (1000000 :: BG.CInt)

-- | This macro extracts the minor version from a version number
--
--     1002003 becomes 2.
--
--     [@version@]: the version number.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_VERSIONNUM_MINOR@, defined at @SDL3\/SDL_version.h 105:9@
sDL_VERSIONNUM_MINOR
  :: forall a0
   . (C.Expr.HostPlatform.Div a0 BG.CInt)
  => (C.Expr.HostPlatform.Rem (C.Expr.HostPlatform.DivRes a0 BG.CInt) BG.CInt)
  => a0 -> C.Expr.HostPlatform.RemRes (C.Expr.HostPlatform.DivRes a0 BG.CInt) BG.CInt
sDL_VERSIONNUM_MINOR =
  \version0 ->
    (C.Expr.HostPlatform.%) ((C.Expr.HostPlatform./) version0 (1000 :: BG.CInt)) (1000 :: BG.CInt)

-- | This macro extracts the micro version from a version number
--
--     1002003 becomes 3.
--
--     [@version@]: the version number.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_VERSIONNUM_MICRO@, defined at @SDL3\/SDL_version.h 118:9@
sDL_VERSIONNUM_MICRO
  :: forall a0. (C.Expr.HostPlatform.Rem a0 BG.CInt) => a0 -> C.Expr.HostPlatform.RemRes a0 BG.CInt
sDL_VERSIONNUM_MICRO =
  \version0 ->
    (C.Expr.HostPlatform.%) version0 (1000 :: BG.CInt)

-- | This is the version number macro for the current SDL version.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetVersion'
--
--     [C declaration]: @macro SDL_VERSION@, defined at @SDL3\/SDL_version.h 129:9@
sDL_VERSION :: BG.CInt
sDL_VERSION =
  sDL_VERSIONNUM sDL_MAJOR_VERSION sDL_MINOR_VERSION sDL_MICRO_VERSION

-- | This macro will evaluate to true if compiled with SDL at least X.Y.Z.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_VERSION_ATLEAST@, defined at @SDL3\/SDL_version.h 139:9@
sDL_VERSION_ATLEAST
  :: forall a0 b1 c2
   . ( C.Expr.HostPlatform.RelOrd
         BG.CInt
         ( C.Expr.HostPlatform.AddRes
             ( C.Expr.HostPlatform.AddRes
                 (C.Expr.HostPlatform.MultRes a0 BG.CInt)
                 (C.Expr.HostPlatform.MultRes b1 BG.CInt)
             )
             c2
         )
     )
  => ( C.Expr.HostPlatform.Add
         ( C.Expr.HostPlatform.AddRes
             (C.Expr.HostPlatform.MultRes a0 BG.CInt)
             (C.Expr.HostPlatform.MultRes b1 BG.CInt)
         )
         c2
     )
  => ( C.Expr.HostPlatform.Add
         (C.Expr.HostPlatform.MultRes a0 BG.CInt)
         (C.Expr.HostPlatform.MultRes b1 BG.CInt)
     )
  => (C.Expr.HostPlatform.Mult a0 BG.CInt)
  => (C.Expr.HostPlatform.Mult b1 BG.CInt)
  => a0 -> b1 -> c2 -> BG.CInt
sDL_VERSION_ATLEAST =
  \x0 ->
    \y1 ->
      \z2 ->
        (C.Expr.HostPlatform.>=) sDL_VERSION (sDL_VERSIONNUM x0 y1 z2)

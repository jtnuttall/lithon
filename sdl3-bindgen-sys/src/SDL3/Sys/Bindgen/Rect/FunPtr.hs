{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Rect.FunPtr (
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_RectToFRect,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_PointInRect,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_RectEmpty,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_RectsEqual,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_HasRectIntersection,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_GetRectIntersection,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_GetRectUnion,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_GetRectEnclosingPoints,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_GetRectAndLineIntersection,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_PointInRectFloat,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_RectEmptyFloat,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_RectsEqualEpsilon,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_RectsEqualFloat,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_HasRectIntersectionFloat,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_GetRectIntersectionFloat,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_GetRectUnionFloat,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_GetRectEnclosingPointsFloat,
  SDL3.Sys.Bindgen.Rect.FunPtr.sDL_GetRectAndLineIntersectionFloat,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Rect

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_rect.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectToFRect */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_81396927af8995d0 (void)) ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_FRect *arg2"
         , ")"
         , "{"
         , "  return &SDL_RectToFRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_PointInRect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8ad7f125172b6954 (void)) ("
         , "  SDL_Point const *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_PointInRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectEmpty */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_423b3dd0cd8e3bd3 (void)) ("
         , "  SDL_Rect const *arg1"
         , ")"
         , "{"
         , "  return &SDL_RectEmpty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectsEqual */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8e6916371c8ddba4 (void)) ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_RectsEqual;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_HasRectIntersection */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e6e10beddc2428e4 (void)) ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_HasRectIntersection;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectIntersection */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b27ebfc7301ab58a (void)) ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Rect *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetRectIntersection;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectUnion */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f2cca914398431e6 (void)) ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Rect *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetRectUnion;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectEnclosingPoints */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9e30de5a15e6eb56 (void)) ("
         , "  SDL_Point const *arg1,"
         , "  signed int arg2,"
         , "  SDL_Rect const *arg3,"
         , "  SDL_Rect *arg4"
         , ")"
         , "{"
         , "  return &SDL_GetRectEnclosingPoints;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectAndLineIntersection */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8fb4c89870de38a5 (void)) ("
         , "  SDL_Rect const *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3,"
         , "  signed int *arg4,"
         , "  signed int *arg5"
         , ")"
         , "{"
         , "  return &SDL_GetRectAndLineIntersection;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_PointInRectFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_092906727716778c (void)) ("
         , "  SDL_FPoint const *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_PointInRectFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectEmptyFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_31feb0e1be2327c4 (void)) ("
         , "  SDL_FRect const *arg1"
         , ")"
         , "{"
         , "  return &SDL_RectEmptyFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectsEqualEpsilon */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3b833d6a0ec61a00 (void)) ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return &SDL_RectsEqualEpsilon;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectsEqualFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6182b7c77941f68d (void)) ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_RectsEqualFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_HasRectIntersectionFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3add038abafa0b81 (void)) ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_HasRectIntersectionFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectIntersectionFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_5458db9427cb15c2 (void)) ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  SDL_FRect *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetRectIntersectionFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectUnionFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_937c1757d8b5c9a9 (void)) ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  SDL_FRect *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetRectUnionFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectEnclosingPointsFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_09f44777a8ae2968 (void)) ("
         , "  SDL_FPoint const *arg1,"
         , "  signed int arg2,"
         , "  SDL_FRect const *arg3,"
         , "  SDL_FRect *arg4"
         , ")"
         , "{"
         , "  return &SDL_GetRectEnclosingPointsFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectAndLineIntersectionFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_0a7c277ad6063b14 (void)) ("
         , "  SDL_FRect const *arg1,"
         , "  float *arg2,"
         , "  float *arg3,"
         , "  float *arg4,"
         , "  float *arg5"
         , ")"
         , "{"
         , "  return &SDL_GetRectAndLineIntersectionFloat;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectToFRect@
foreign import ccall unsafe "hs_bindgen_81396927af8995d0"
  hs_bindgen_81396927af8995d0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectToFRect@
hs_bindgen_81396927af8995d0
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL_Rect -> BG.Ptr SDL_FRect -> IO ()))
hs_bindgen_81396927af8995d0 =
  BG.fromFFIType hs_bindgen_81396927af8995d0_base

{-# NOINLINE sDL_RectToFRect #-}

-- | Convert an 'SDL_Rect' to 'SDL_FRect'
--
--     [@rect@]: a pointer to an 'SDL_Rect'.
--
--     [@frect@]: a pointer filled in with the floating point representation of @rect@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RectToFRect@, defined at @SDL3\/SDL_rect.h 129:23@
sDL_RectToFRect :: BG.FunPtr (PtrConst.PtrConst SDL_Rect -> BG.Ptr SDL_FRect -> IO ())
sDL_RectToFRect =
  BG.unsafePerformIO hs_bindgen_81396927af8995d0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_PointInRect@
foreign import ccall unsafe "hs_bindgen_8ad7f125172b6954"
  hs_bindgen_8ad7f125172b6954_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_PointInRect@
hs_bindgen_8ad7f125172b6954
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL_Point -> PtrConst.PtrConst SDL_Rect -> IO BG.CBool))
hs_bindgen_8ad7f125172b6954 =
  BG.fromFFIType hs_bindgen_8ad7f125172b6954_base

{-# NOINLINE sDL_PointInRect #-}

-- | Determine whether a point resides inside a rectangle.
--
--     A point is considered part of a rectangle if both @p@ and @r@ are not NULL, and @p@ \'s x and y coordinates are >= to the rectangle\'s top left corner, and \< the rectangle\'s x+w and y+h. So a 1x1 rectangle considers point (0,0) as \"inside\" and (0,1) as not.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [@p@]: the point to test.
--
--     [@r@]: the rectangle to test.
--
--     [Returns]: true if @p@ is contained by @r@, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PointInRect@, defined at @SDL3\/SDL_rect.h 158:23@
sDL_PointInRect
  :: BG.FunPtr (PtrConst.PtrConst SDL_Point -> PtrConst.PtrConst SDL_Rect -> IO BG.CBool)
sDL_PointInRect =
  BG.unsafePerformIO hs_bindgen_8ad7f125172b6954

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectEmpty@
foreign import ccall unsafe "hs_bindgen_423b3dd0cd8e3bd3"
  hs_bindgen_423b3dd0cd8e3bd3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectEmpty@
hs_bindgen_423b3dd0cd8e3bd3 :: IO (BG.FunPtr (PtrConst.PtrConst SDL_Rect -> IO BG.CBool))
hs_bindgen_423b3dd0cd8e3bd3 =
  BG.fromFFIType hs_bindgen_423b3dd0cd8e3bd3_base

{-# NOINLINE sDL_RectEmpty #-}

-- | Determine whether a rectangle has no area.
--
--     A rectangle is considered \"empty\" for this function if @r@ is NULL, or if @r@ \'s width and\/or height are \<= 0.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [@r@]: the rectangle to test.
--
--     [Returns]: true if the rectangle is \"empty\", false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RectEmpty@, defined at @SDL3\/SDL_rect.h 182:23@
sDL_RectEmpty :: BG.FunPtr (PtrConst.PtrConst SDL_Rect -> IO BG.CBool)
sDL_RectEmpty =
  BG.unsafePerformIO hs_bindgen_423b3dd0cd8e3bd3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectsEqual@
foreign import ccall unsafe "hs_bindgen_8e6916371c8ddba4"
  hs_bindgen_8e6916371c8ddba4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectsEqual@
hs_bindgen_8e6916371c8ddba4
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL_Rect -> PtrConst.PtrConst SDL_Rect -> IO BG.CBool))
hs_bindgen_8e6916371c8ddba4 =
  BG.fromFFIType hs_bindgen_8e6916371c8ddba4_base

{-# NOINLINE sDL_RectsEqual #-}

-- | Determine whether two rectangles are equal.
--
--     Rectangles are considered equal if both are not NULL and each of their x, y, width and height match.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [@a@]: the first rectangle to test.
--
--     [@b@]: the second rectangle to test.
--
--     [Returns]: true if the rectangles are equal, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RectsEqual@, defined at @SDL3\/SDL_rect.h 206:23@
sDL_RectsEqual
  :: BG.FunPtr (PtrConst.PtrConst SDL_Rect -> PtrConst.PtrConst SDL_Rect -> IO BG.CBool)
sDL_RectsEqual =
  BG.unsafePerformIO hs_bindgen_8e6916371c8ddba4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_HasRectIntersection@
foreign import ccall unsafe "hs_bindgen_e6e10beddc2428e4"
  hs_bindgen_e6e10beddc2428e4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_HasRectIntersection@
hs_bindgen_e6e10beddc2428e4
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL_Rect -> PtrConst.PtrConst SDL_Rect -> IO BG.CBool))
hs_bindgen_e6e10beddc2428e4 =
  BG.fromFFIType hs_bindgen_e6e10beddc2428e4_base

{-# NOINLINE sDL_HasRectIntersection #-}

-- | Determine whether two rectangles intersect.
--
--     If either pointer is NULL the function will return false.
--
--     [@A@]: an 'SDL_Rect' structure representing the first rectangle.
--
--     [@B@]: an 'SDL_Rect' structure representing the second rectangle.
--
--     [Returns]: true if there is an intersection, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRectIntersection'
--
--     [C declaration]: @SDL_HasRectIntersection@, defined at @SDL3\/SDL_rect.h 227:34@
sDL_HasRectIntersection
  :: BG.FunPtr (PtrConst.PtrConst SDL_Rect -> PtrConst.PtrConst SDL_Rect -> IO BG.CBool)
sDL_HasRectIntersection =
  BG.unsafePerformIO hs_bindgen_e6e10beddc2428e4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectIntersection@
foreign import ccall unsafe "hs_bindgen_b27ebfc7301ab58a"
  hs_bindgen_b27ebfc7301ab58a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectIntersection@
hs_bindgen_b27ebfc7301ab58a
  :: IO
       ( BG.FunPtr
           (PtrConst.PtrConst SDL_Rect -> PtrConst.PtrConst SDL_Rect -> BG.Ptr SDL_Rect -> IO BG.CBool)
       )
hs_bindgen_b27ebfc7301ab58a =
  BG.fromFFIType hs_bindgen_b27ebfc7301ab58a_base

{-# NOINLINE sDL_GetRectIntersection #-}

-- | Calculate the intersection of two rectangles.
--
--     If @result@ is NULL then this function will return false.
--
--     [@A@]: an 'SDL_Rect' structure representing the first rectangle.
--
--     [@B@]: an 'SDL_Rect' structure representing the second rectangle.
--
--     [@result@]: an 'SDL_Rect' structure filled in with the intersection of rectangles @A@ and @B@.
--
--     [Returns]: true if there is an intersection, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasRectIntersection'
--
--     [C declaration]: @SDL_GetRectIntersection@, defined at @SDL3\/SDL_rect.h 246:34@
sDL_GetRectIntersection
  :: BG.FunPtr
       (PtrConst.PtrConst SDL_Rect -> PtrConst.PtrConst SDL_Rect -> BG.Ptr SDL_Rect -> IO BG.CBool)
sDL_GetRectIntersection =
  BG.unsafePerformIO hs_bindgen_b27ebfc7301ab58a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectUnion@
foreign import ccall unsafe "hs_bindgen_f2cca914398431e6"
  hs_bindgen_f2cca914398431e6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectUnion@
hs_bindgen_f2cca914398431e6
  :: IO
       ( BG.FunPtr
           (PtrConst.PtrConst SDL_Rect -> PtrConst.PtrConst SDL_Rect -> BG.Ptr SDL_Rect -> IO BG.CBool)
       )
hs_bindgen_f2cca914398431e6 =
  BG.fromFFIType hs_bindgen_f2cca914398431e6_base

{-# NOINLINE sDL_GetRectUnion #-}

-- | Calculate the union of two rectangles.
--
--     [@A@]: an 'SDL_Rect' structure representing the first rectangle.
--
--     [@B@]: an 'SDL_Rect' structure representing the second rectangle.
--
--     [@result@]: an 'SDL_Rect' structure filled in with the union of rectangles @A@ and @B@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRectUnion@, defined at @SDL3\/SDL_rect.h 262:34@
sDL_GetRectUnion
  :: BG.FunPtr
       (PtrConst.PtrConst SDL_Rect -> PtrConst.PtrConst SDL_Rect -> BG.Ptr SDL_Rect -> IO BG.CBool)
sDL_GetRectUnion =
  BG.unsafePerformIO hs_bindgen_f2cca914398431e6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectEnclosingPoints@
foreign import ccall unsafe "hs_bindgen_9e30de5a15e6eb56"
  hs_bindgen_9e30de5a15e6eb56_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectEnclosingPoints@
hs_bindgen_9e30de5a15e6eb56
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst SDL_Point
             -> BG.CInt
             -> PtrConst.PtrConst SDL_Rect
             -> BG.Ptr SDL_Rect
             -> IO BG.CBool
           )
       )
hs_bindgen_9e30de5a15e6eb56 =
  BG.fromFFIType hs_bindgen_9e30de5a15e6eb56_base

{-# NOINLINE sDL_GetRectEnclosingPoints #-}

-- | Calculate a minimal rectangle enclosing a set of points.
--
--     If @clip@ is not NULL then only points inside of the clipping rectangle are considered.
--
--     [@points@]: an array of 'SDL_Point' structures representing points to be enclosed.
--
--     [@count@]: the number of structures in the @points@ array.
--
--     [@clip@]: an 'SDL_Rect' used for clipping or NULL to enclose all points.
--
--     [@result@]: an 'SDL_Rect' structure filled in with the minimal enclosing rectangle.
--
--     [Returns]: true if any points were enclosed or false if all the points were outside of the clipping rectangle.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRectEnclosingPoints@, defined at @SDL3\/SDL_rect.h 283:34@
sDL_GetRectEnclosingPoints
  :: BG.FunPtr
       ( PtrConst.PtrConst SDL_Point
         -> BG.CInt
         -> PtrConst.PtrConst SDL_Rect
         -> BG.Ptr SDL_Rect
         -> IO BG.CBool
       )
sDL_GetRectEnclosingPoints =
  BG.unsafePerformIO hs_bindgen_9e30de5a15e6eb56

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectAndLineIntersection@
foreign import ccall unsafe "hs_bindgen_8fb4c89870de38a5"
  hs_bindgen_8fb4c89870de38a5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectAndLineIntersection@
hs_bindgen_8fb4c89870de38a5
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst SDL_Rect
             -> BG.Ptr BG.CInt
             -> BG.Ptr BG.CInt
             -> BG.Ptr BG.CInt
             -> BG.Ptr BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_8fb4c89870de38a5 =
  BG.fromFFIType hs_bindgen_8fb4c89870de38a5_base

{-# NOINLINE sDL_GetRectAndLineIntersection #-}

-- | Calculate the intersection of a rectangle and line segment.
--
--     This function is used to clip a line segment to a rectangle. A line segment contained entirely within the rectangle or that does not intersect will remain unchanged. A line segment that crosses the rectangle at either or both ends will be clipped to the boundary of the rectangle and the new coordinates saved in @X1@, @Y1@, @X2@, and\/or @Y2@ as necessary.
--
--     [@rect@]: an 'SDL_Rect' structure representing the rectangle to intersect.
--
--     [@X1@]: a pointer to the starting X-coordinate of the line.
--
--     [@Y1@]: a pointer to the starting Y-coordinate of the line.
--
--     [@X2@]: a pointer to the ending X-coordinate of the line.
--
--     [@Y2@]: a pointer to the ending Y-coordinate of the line.
--
--     [Returns]: true if there is an intersection, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRectAndLineIntersection@, defined at @SDL3\/SDL_rect.h 305:34@
sDL_GetRectAndLineIntersection
  :: BG.FunPtr
       ( PtrConst.PtrConst SDL_Rect
         -> BG.Ptr BG.CInt
         -> BG.Ptr BG.CInt
         -> BG.Ptr BG.CInt
         -> BG.Ptr BG.CInt
         -> IO BG.CBool
       )
sDL_GetRectAndLineIntersection =
  BG.unsafePerformIO hs_bindgen_8fb4c89870de38a5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_PointInRectFloat@
foreign import ccall unsafe "hs_bindgen_092906727716778c"
  hs_bindgen_092906727716778c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_PointInRectFloat@
hs_bindgen_092906727716778c
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL_FPoint -> PtrConst.PtrConst SDL_FRect -> IO BG.CBool))
hs_bindgen_092906727716778c =
  BG.fromFFIType hs_bindgen_092906727716778c_base

{-# NOINLINE sDL_PointInRectFloat #-}

-- | Determine whether a point resides inside a floating point rectangle.
--
--     A point is considered part of a rectangle if both @p@ and @r@ are not NULL, and @p@ \'s x and y coordinates are >= to the rectangle\'s top left corner, and \<= the rectangle\'s x+w and y+h. So a 1x1 rectangle considers point (0,0) and (0,1) as \"inside\" and (0,2) as not.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [@p@]: the point to test.
--
--     [@r@]: the rectangle to test.
--
--     [Returns]: true if @p@ is contained by @r@, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PointInRectFloat@, defined at @SDL3\/SDL_rect.h 331:23@
sDL_PointInRectFloat
  :: BG.FunPtr (PtrConst.PtrConst SDL_FPoint -> PtrConst.PtrConst SDL_FRect -> IO BG.CBool)
sDL_PointInRectFloat =
  BG.unsafePerformIO hs_bindgen_092906727716778c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectEmptyFloat@
foreign import ccall unsafe "hs_bindgen_31feb0e1be2327c4"
  hs_bindgen_31feb0e1be2327c4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectEmptyFloat@
hs_bindgen_31feb0e1be2327c4 :: IO (BG.FunPtr (PtrConst.PtrConst SDL_FRect -> IO BG.CBool))
hs_bindgen_31feb0e1be2327c4 =
  BG.fromFFIType hs_bindgen_31feb0e1be2327c4_base

{-# NOINLINE sDL_RectEmptyFloat #-}

-- | Determine whether a floating point rectangle takes no space.
--
--     A rectangle is considered \"empty\" for this function if @r@ is NULL, or if @r@ \'s width and\/or height are \< 0.0f.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [@r@]: the rectangle to test.
--
--     [Returns]: true if the rectangle is \"empty\", false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RectEmptyFloat@, defined at @SDL3\/SDL_rect.h 355:23@
sDL_RectEmptyFloat :: BG.FunPtr (PtrConst.PtrConst SDL_FRect -> IO BG.CBool)
sDL_RectEmptyFloat =
  BG.unsafePerformIO hs_bindgen_31feb0e1be2327c4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectsEqualEpsilon@
foreign import ccall unsafe "hs_bindgen_3b833d6a0ec61a00"
  hs_bindgen_3b833d6a0ec61a00_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectsEqualEpsilon@
hs_bindgen_3b833d6a0ec61a00
  :: IO
       (BG.FunPtr (PtrConst.PtrConst SDL_FRect -> PtrConst.PtrConst SDL_FRect -> BG.CFloat -> IO BG.CBool))
hs_bindgen_3b833d6a0ec61a00 =
  BG.fromFFIType hs_bindgen_3b833d6a0ec61a00_base

{-# NOINLINE sDL_RectsEqualEpsilon #-}

-- | Determine whether two floating point rectangles are equal, within some given epsilon.
--
--     Rectangles are considered equal if both are not NULL and each of their x, y, width and height are within @epsilon@ of each other. If you don\'t know what value to use for @epsilon@, you should call the SDL_RectsEqualFloat function instead.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [@a@]: the first rectangle to test.
--
--     [@b@]: the second rectangle to test.
--
--     [@epsilon@]: the epsilon value for comparison.
--
--     [Returns]: true if the rectangles are equal, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RectsEqualFloat'
--
--     [C declaration]: @SDL_RectsEqualEpsilon@, defined at @SDL3\/SDL_rect.h 385:23@
sDL_RectsEqualEpsilon
  :: BG.FunPtr (PtrConst.PtrConst SDL_FRect -> PtrConst.PtrConst SDL_FRect -> BG.CFloat -> IO BG.CBool)
sDL_RectsEqualEpsilon =
  BG.unsafePerformIO hs_bindgen_3b833d6a0ec61a00

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectsEqualFloat@
foreign import ccall unsafe "hs_bindgen_6182b7c77941f68d"
  hs_bindgen_6182b7c77941f68d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_RectsEqualFloat@
hs_bindgen_6182b7c77941f68d
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL_FRect -> PtrConst.PtrConst SDL_FRect -> IO BG.CBool))
hs_bindgen_6182b7c77941f68d =
  BG.fromFFIType hs_bindgen_6182b7c77941f68d_base

{-# NOINLINE sDL_RectsEqualFloat #-}

-- | Determine whether two floating point rectangles are equal, within a default epsilon.
--
--     Rectangles are considered equal if both are not NULL and each of their x, y, width and height are within SDL_FLT_EPSILON of each other. This is often a reasonable way to compare two floating point rectangles and deal with the slight precision variations in floating point calculations that tend to pop up.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [@a@]: the first rectangle to test.
--
--     [@b@]: the second rectangle to test.
--
--     [Returns]: true if the rectangles are equal, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RectsEqualEpsilon'
--
--     [C declaration]: @SDL_RectsEqualFloat@, defined at @SDL3\/SDL_rect.h 420:23@
sDL_RectsEqualFloat
  :: BG.FunPtr (PtrConst.PtrConst SDL_FRect -> PtrConst.PtrConst SDL_FRect -> IO BG.CBool)
sDL_RectsEqualFloat =
  BG.unsafePerformIO hs_bindgen_6182b7c77941f68d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_HasRectIntersectionFloat@
foreign import ccall unsafe "hs_bindgen_3add038abafa0b81"
  hs_bindgen_3add038abafa0b81_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_HasRectIntersectionFloat@
hs_bindgen_3add038abafa0b81
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL_FRect -> PtrConst.PtrConst SDL_FRect -> IO BG.CBool))
hs_bindgen_3add038abafa0b81 =
  BG.fromFFIType hs_bindgen_3add038abafa0b81_base

{-# NOINLINE sDL_HasRectIntersectionFloat #-}

-- | Determine whether two rectangles intersect with float precision.
--
--     If either pointer is NULL the function will return false.
--
--     [@A@]: an 'SDL_FRect' structure representing the first rectangle.
--
--     [@B@]: an 'SDL_FRect' structure representing the second rectangle.
--
--     [Returns]: true if there is an intersection, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRectIntersection'
--
--     [C declaration]: @SDL_HasRectIntersectionFloat@, defined at @SDL3\/SDL_rect.h 440:34@
sDL_HasRectIntersectionFloat
  :: BG.FunPtr (PtrConst.PtrConst SDL_FRect -> PtrConst.PtrConst SDL_FRect -> IO BG.CBool)
sDL_HasRectIntersectionFloat =
  BG.unsafePerformIO hs_bindgen_3add038abafa0b81

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectIntersectionFloat@
foreign import ccall unsafe "hs_bindgen_5458db9427cb15c2"
  hs_bindgen_5458db9427cb15c2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectIntersectionFloat@
hs_bindgen_5458db9427cb15c2
  :: IO
       ( BG.FunPtr
           (PtrConst.PtrConst SDL_FRect -> PtrConst.PtrConst SDL_FRect -> BG.Ptr SDL_FRect -> IO BG.CBool)
       )
hs_bindgen_5458db9427cb15c2 =
  BG.fromFFIType hs_bindgen_5458db9427cb15c2_base

{-# NOINLINE sDL_GetRectIntersectionFloat #-}

-- | Calculate the intersection of two rectangles with float precision.
--
--     If @result@ is NULL then this function will return false.
--
--     [@A@]: an 'SDL_FRect' structure representing the first rectangle.
--
--     [@B@]: an 'SDL_FRect' structure representing the second rectangle.
--
--     [@result@]: an 'SDL_FRect' structure filled in with the intersection of rectangles @A@ and @B@.
--
--     [Returns]: true if there is an intersection, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasRectIntersectionFloat'
--
--     [C declaration]: @SDL_GetRectIntersectionFloat@, defined at @SDL3\/SDL_rect.h 459:34@
sDL_GetRectIntersectionFloat
  :: BG.FunPtr
       (PtrConst.PtrConst SDL_FRect -> PtrConst.PtrConst SDL_FRect -> BG.Ptr SDL_FRect -> IO BG.CBool)
sDL_GetRectIntersectionFloat =
  BG.unsafePerformIO hs_bindgen_5458db9427cb15c2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectUnionFloat@
foreign import ccall unsafe "hs_bindgen_937c1757d8b5c9a9"
  hs_bindgen_937c1757d8b5c9a9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectUnionFloat@
hs_bindgen_937c1757d8b5c9a9
  :: IO
       ( BG.FunPtr
           (PtrConst.PtrConst SDL_FRect -> PtrConst.PtrConst SDL_FRect -> BG.Ptr SDL_FRect -> IO BG.CBool)
       )
hs_bindgen_937c1757d8b5c9a9 =
  BG.fromFFIType hs_bindgen_937c1757d8b5c9a9_base

{-# NOINLINE sDL_GetRectUnionFloat #-}

-- | Calculate the union of two rectangles with float precision.
--
--     [@A@]: an 'SDL_FRect' structure representing the first rectangle.
--
--     [@B@]: an 'SDL_FRect' structure representing the second rectangle.
--
--     [@result@]: an 'SDL_FRect' structure filled in with the union of rectangles @A@ and @B@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRectUnionFloat@, defined at @SDL3\/SDL_rect.h 475:34@
sDL_GetRectUnionFloat
  :: BG.FunPtr
       (PtrConst.PtrConst SDL_FRect -> PtrConst.PtrConst SDL_FRect -> BG.Ptr SDL_FRect -> IO BG.CBool)
sDL_GetRectUnionFloat =
  BG.unsafePerformIO hs_bindgen_937c1757d8b5c9a9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectEnclosingPointsFloat@
foreign import ccall unsafe "hs_bindgen_09f44777a8ae2968"
  hs_bindgen_09f44777a8ae2968_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectEnclosingPointsFloat@
hs_bindgen_09f44777a8ae2968
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst SDL_FPoint
             -> BG.CInt
             -> PtrConst.PtrConst SDL_FRect
             -> BG.Ptr SDL_FRect
             -> IO BG.CBool
           )
       )
hs_bindgen_09f44777a8ae2968 =
  BG.fromFFIType hs_bindgen_09f44777a8ae2968_base

{-# NOINLINE sDL_GetRectEnclosingPointsFloat #-}

-- | Calculate a minimal rectangle enclosing a set of points with float precision.
--
--     If @clip@ is not NULL then only points inside of the clipping rectangle are considered.
--
--     [@points@]: an array of 'SDL_FPoint' structures representing points to be enclosed.
--
--     [@count@]: the number of structures in the @points@ array.
--
--     [@clip@]: an 'SDL_FRect' used for clipping or NULL to enclose all points.
--
--     [@result@]: an 'SDL_FRect' structure filled in with the minimal enclosing rectangle.
--
--     [Returns]: true if any points were enclosed or false if all the points were outside of the clipping rectangle.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRectEnclosingPointsFloat@, defined at @SDL3\/SDL_rect.h 497:34@
sDL_GetRectEnclosingPointsFloat
  :: BG.FunPtr
       ( PtrConst.PtrConst SDL_FPoint
         -> BG.CInt
         -> PtrConst.PtrConst SDL_FRect
         -> BG.Ptr SDL_FRect
         -> IO BG.CBool
       )
sDL_GetRectEnclosingPointsFloat =
  BG.unsafePerformIO hs_bindgen_09f44777a8ae2968

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectAndLineIntersectionFloat@
foreign import ccall unsafe "hs_bindgen_0a7c277ad6063b14"
  hs_bindgen_0a7c277ad6063b14_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_get_SDL_GetRectAndLineIntersectionFloat@
hs_bindgen_0a7c277ad6063b14
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst SDL_FRect
             -> BG.Ptr BG.CFloat
             -> BG.Ptr BG.CFloat
             -> BG.Ptr BG.CFloat
             -> BG.Ptr BG.CFloat
             -> IO BG.CBool
           )
       )
hs_bindgen_0a7c277ad6063b14 =
  BG.fromFFIType hs_bindgen_0a7c277ad6063b14_base

{-# NOINLINE sDL_GetRectAndLineIntersectionFloat #-}

-- | Calculate the intersection of a rectangle and line segment with float precision.
--
--     This function is used to clip a line segment to a rectangle. A line segment contained entirely within the rectangle or that does not intersect will remain unchanged. A line segment that crosses the rectangle at either or both ends will be clipped to the boundary of the rectangle and the new coordinates saved in @X1@, @Y1@, @X2@, and\/or @Y2@ as necessary.
--
--     [@rect@]: an 'SDL_FRect' structure representing the rectangle to intersect.
--
--     [@X1@]: a pointer to the starting X-coordinate of the line.
--
--     [@Y1@]: a pointer to the starting Y-coordinate of the line.
--
--     [@X2@]: a pointer to the ending X-coordinate of the line.
--
--     [@Y2@]: a pointer to the ending Y-coordinate of the line.
--
--     [Returns]: true if there is an intersection, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRectAndLineIntersectionFloat@, defined at @SDL3\/SDL_rect.h 520:34@
sDL_GetRectAndLineIntersectionFloat
  :: BG.FunPtr
       ( PtrConst.PtrConst SDL_FRect
         -> BG.Ptr BG.CFloat
         -> BG.Ptr BG.CFloat
         -> BG.Ptr BG.CFloat
         -> BG.Ptr BG.CFloat
         -> IO BG.CBool
       )
sDL_GetRectAndLineIntersectionFloat =
  BG.unsafePerformIO hs_bindgen_0a7c277ad6063b14

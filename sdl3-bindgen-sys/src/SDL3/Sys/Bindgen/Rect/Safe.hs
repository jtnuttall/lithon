{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Rect.Safe (
  SDL3.Sys.Bindgen.Rect.Safe.sDL_RectToFRect,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_PointInRect,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_RectEmpty,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_RectsEqual,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_HasRectIntersection,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_GetRectIntersection,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_GetRectUnion,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_GetRectEnclosingPoints,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_GetRectAndLineIntersection,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_PointInRectFloat,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_RectEmptyFloat,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_RectsEqualEpsilon,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_RectsEqualFloat,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_HasRectIntersectionFloat,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_GetRectIntersectionFloat,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_GetRectUnionFloat,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_GetRectEnclosingPointsFloat,
  SDL3.Sys.Bindgen.Rect.Safe.sDL_GetRectAndLineIntersectionFloat,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Rect

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_rect.h>"
         , "void hs_bindgen_a9f520f11e166938 ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_FRect *arg2"
         , ")"
         , "{"
         , "  (SDL_RectToFRect)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_7c0acf8d07c0c1dd ("
         , "  SDL_Point const *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_PointInRect)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_7298326168509737 ("
         , "  SDL_Rect const *arg1"
         , ")"
         , "{"
         , "  return (SDL_RectEmpty)(arg1);"
         , "}"
         , "_Bool hs_bindgen_d40e366324ea8c2f ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_RectsEqual)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_b2eda76752d2c711 ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_HasRectIntersection)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_808b8181f3c8f0c7 ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Rect *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetRectIntersection)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_44114d292c0406e2 ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Rect *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetRectUnion)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_b02c8a352859e75c ("
         , "  SDL_Point const *arg1,"
         , "  signed int arg2,"
         , "  SDL_Rect const *arg3,"
         , "  SDL_Rect *arg4"
         , ")"
         , "{"
         , "  return (SDL_GetRectEnclosingPoints)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_1319bb78d8d2e643 ("
         , "  SDL_Rect const *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3,"
         , "  signed int *arg4,"
         , "  signed int *arg5"
         , ")"
         , "{"
         , "  return (SDL_GetRectAndLineIntersection)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_db89e1c0a4060064 ("
         , "  SDL_FPoint const *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_PointInRectFloat)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_cf687f22e3772d43 ("
         , "  SDL_FRect const *arg1"
         , ")"
         , "{"
         , "  return (SDL_RectEmptyFloat)(arg1);"
         , "}"
         , "_Bool hs_bindgen_ffb7b7aa2884662e ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return (SDL_RectsEqualEpsilon)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_16841c4903715a15 ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_RectsEqualFloat)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_4ccee9871e6b2122 ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_HasRectIntersectionFloat)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_73c245953e392b8b ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  SDL_FRect *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetRectIntersectionFloat)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_26df11f6f3486748 ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  SDL_FRect *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetRectUnionFloat)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_c543abfe8b881179 ("
         , "  SDL_FPoint const *arg1,"
         , "  signed int arg2,"
         , "  SDL_FRect const *arg3,"
         , "  SDL_FRect *arg4"
         , ")"
         , "{"
         , "  return (SDL_GetRectEnclosingPointsFloat)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_274c31df17fcabf9 ("
         , "  SDL_FRect const *arg1,"
         , "  float *arg2,"
         , "  float *arg3,"
         , "  float *arg4,"
         , "  float *arg5"
         , ")"
         , "{"
         , "  return (SDL_GetRectAndLineIntersectionFloat)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_RectToFRect@
foreign import ccall safe "hs_bindgen_a9f520f11e166938"
  hs_bindgen_a9f520f11e166938_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_RectToFRect@
hs_bindgen_a9f520f11e166938
  :: PtrConst.PtrConst SDL_Rect
  -> BG.Ptr SDL_FRect
  -> IO ()
hs_bindgen_a9f520f11e166938 =
  BG.fromFFIType hs_bindgen_a9f520f11e166938_base

-- | Convert an 'SDL_Rect' to 'SDL_FRect'
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RectToFRect@, defined at @SDL3\/SDL_rect.h 129:23@
sDL_RectToFRect
  :: PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@rect@]: a pointer to an 'SDL_Rect'.
  -> BG.Ptr SDL_FRect
  -- ^
  --
  --           [@frect@]: a pointer filled in with the floating point representation of @rect@.
  -> IO ()
sDL_RectToFRect = hs_bindgen_a9f520f11e166938

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_PointInRect@
foreign import ccall safe "hs_bindgen_7c0acf8d07c0c1dd"
  hs_bindgen_7c0acf8d07c0c1dd_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_PointInRect@
hs_bindgen_7c0acf8d07c0c1dd
  :: PtrConst.PtrConst SDL_Point
  -> PtrConst.PtrConst SDL_Rect
  -> IO BG.CBool
hs_bindgen_7c0acf8d07c0c1dd =
  BG.fromFFIType hs_bindgen_7c0acf8d07c0c1dd_base

-- | Determine whether a point resides inside a rectangle.
--
--     A point is considered part of a rectangle if both @p@ and @r@ are not NULL, and @p@ \'s x and y coordinates are >= to the rectangle\'s top left corner, and \< the rectangle\'s x+w and y+h. So a 1x1 rectangle considers point (0,0) as \"inside\" and (0,1) as not.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [Returns]: true if @p@ is contained by @r@, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PointInRect@, defined at @SDL3\/SDL_rect.h 158:23@
sDL_PointInRect
  :: PtrConst.PtrConst SDL_Point
  -- ^
  --
  --           [@p@]: the point to test.
  -> PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@r@]: the rectangle to test.
  -> IO BG.CBool
sDL_PointInRect = hs_bindgen_7c0acf8d07c0c1dd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_RectEmpty@
foreign import ccall safe "hs_bindgen_7298326168509737"
  hs_bindgen_7298326168509737_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_RectEmpty@
hs_bindgen_7298326168509737
  :: PtrConst.PtrConst SDL_Rect
  -> IO BG.CBool
hs_bindgen_7298326168509737 =
  BG.fromFFIType hs_bindgen_7298326168509737_base

-- | Determine whether a rectangle has no area.
--
--     A rectangle is considered \"empty\" for this function if @r@ is NULL, or if @r@ \'s width and\/or height are \<= 0.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [Returns]: true if the rectangle is \"empty\", false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RectEmpty@, defined at @SDL3\/SDL_rect.h 182:23@
sDL_RectEmpty
  :: PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@r@]: the rectangle to test.
  -> IO BG.CBool
sDL_RectEmpty = hs_bindgen_7298326168509737

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_RectsEqual@
foreign import ccall safe "hs_bindgen_d40e366324ea8c2f"
  hs_bindgen_d40e366324ea8c2f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_RectsEqual@
hs_bindgen_d40e366324ea8c2f
  :: PtrConst.PtrConst SDL_Rect
  -> PtrConst.PtrConst SDL_Rect
  -> IO BG.CBool
hs_bindgen_d40e366324ea8c2f =
  BG.fromFFIType hs_bindgen_d40e366324ea8c2f_base

-- | Determine whether two rectangles are equal.
--
--     Rectangles are considered equal if both are not NULL and each of their x, y, width and height match.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [Returns]: true if the rectangles are equal, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RectsEqual@, defined at @SDL3\/SDL_rect.h 206:23@
sDL_RectsEqual
  :: PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@a@]: the first rectangle to test.
  -> PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@b@]: the second rectangle to test.
  -> IO BG.CBool
sDL_RectsEqual = hs_bindgen_d40e366324ea8c2f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_HasRectIntersection@
foreign import ccall safe "hs_bindgen_b2eda76752d2c711"
  hs_bindgen_b2eda76752d2c711_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_HasRectIntersection@
hs_bindgen_b2eda76752d2c711
  :: PtrConst.PtrConst SDL_Rect
  -> PtrConst.PtrConst SDL_Rect
  -> IO BG.CBool
hs_bindgen_b2eda76752d2c711 =
  BG.fromFFIType hs_bindgen_b2eda76752d2c711_base

-- | Determine whether two rectangles intersect.
--
--     If either pointer is NULL the function will return false.
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
  :: PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@A@]: an 'SDL_Rect' structure representing the first rectangle.
  -> PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@B@]: an 'SDL_Rect' structure representing the second rectangle.
  -> IO BG.CBool
sDL_HasRectIntersection = hs_bindgen_b2eda76752d2c711

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectIntersection@
foreign import ccall safe "hs_bindgen_808b8181f3c8f0c7"
  hs_bindgen_808b8181f3c8f0c7_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectIntersection@
hs_bindgen_808b8181f3c8f0c7
  :: PtrConst.PtrConst SDL_Rect
  -> PtrConst.PtrConst SDL_Rect
  -> BG.Ptr SDL_Rect
  -> IO BG.CBool
hs_bindgen_808b8181f3c8f0c7 =
  BG.fromFFIType hs_bindgen_808b8181f3c8f0c7_base

-- | Calculate the intersection of two rectangles.
--
--     If @result@ is NULL then this function will return false.
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
  :: PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@A@]: an 'SDL_Rect' structure representing the first rectangle.
  -> PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@B@]: an 'SDL_Rect' structure representing the second rectangle.
  -> BG.Ptr SDL_Rect
  -- ^
  --
  --           [@result@]: an 'SDL_Rect' structure filled in with the intersection of rectangles @A@ and @B@.
  -> IO BG.CBool
sDL_GetRectIntersection = hs_bindgen_808b8181f3c8f0c7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectUnion@
foreign import ccall safe "hs_bindgen_44114d292c0406e2"
  hs_bindgen_44114d292c0406e2_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectUnion@
hs_bindgen_44114d292c0406e2
  :: PtrConst.PtrConst SDL_Rect
  -> PtrConst.PtrConst SDL_Rect
  -> BG.Ptr SDL_Rect
  -> IO BG.CBool
hs_bindgen_44114d292c0406e2 =
  BG.fromFFIType hs_bindgen_44114d292c0406e2_base

-- | Calculate the union of two rectangles.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRectUnion@, defined at @SDL3\/SDL_rect.h 262:34@
sDL_GetRectUnion
  :: PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@A@]: an 'SDL_Rect' structure representing the first rectangle.
  -> PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@B@]: an 'SDL_Rect' structure representing the second rectangle.
  -> BG.Ptr SDL_Rect
  -- ^
  --
  --           [@result@]: an 'SDL_Rect' structure filled in with the union of rectangles @A@ and @B@.
  -> IO BG.CBool
sDL_GetRectUnion = hs_bindgen_44114d292c0406e2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectEnclosingPoints@
foreign import ccall safe "hs_bindgen_b02c8a352859e75c"
  hs_bindgen_b02c8a352859e75c_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectEnclosingPoints@
hs_bindgen_b02c8a352859e75c
  :: PtrConst.PtrConst SDL_Point
  -> BG.CInt
  -> PtrConst.PtrConst SDL_Rect
  -> BG.Ptr SDL_Rect
  -> IO BG.CBool
hs_bindgen_b02c8a352859e75c =
  BG.fromFFIType hs_bindgen_b02c8a352859e75c_base

-- | Calculate a minimal rectangle enclosing a set of points.
--
--     If @clip@ is not NULL then only points inside of the clipping rectangle are considered.
--
--     [Returns]: true if any points were enclosed or false if all the points were outside of the clipping rectangle.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRectEnclosingPoints@, defined at @SDL3\/SDL_rect.h 283:34@
sDL_GetRectEnclosingPoints
  :: PtrConst.PtrConst SDL_Point
  -- ^
  --
  --           [@points@]: an array of 'SDL_Point' structures representing points to be enclosed.
  -> BG.CInt
  -- ^
  --
  --           [@count@]: the number of structures in the @points@ array.
  -> PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@clip@]: an 'SDL_Rect' used for clipping or NULL to enclose all points.
  -> BG.Ptr SDL_Rect
  -- ^
  --
  --           [@result@]: an 'SDL_Rect' structure filled in with the minimal enclosing rectangle.
  -> IO BG.CBool
sDL_GetRectEnclosingPoints =
  hs_bindgen_b02c8a352859e75c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectAndLineIntersection@
foreign import ccall safe "hs_bindgen_1319bb78d8d2e643"
  hs_bindgen_1319bb78d8d2e643_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectAndLineIntersection@
hs_bindgen_1319bb78d8d2e643
  :: PtrConst.PtrConst SDL_Rect
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_1319bb78d8d2e643 =
  BG.fromFFIType hs_bindgen_1319bb78d8d2e643_base

-- | Calculate the intersection of a rectangle and line segment.
--
--     This function is used to clip a line segment to a rectangle. A line segment contained entirely within the rectangle or that does not intersect will remain unchanged. A line segment that crosses the rectangle at either or both ends will be clipped to the boundary of the rectangle and the new coordinates saved in @X1@, @Y1@, @X2@, and\/or @Y2@ as necessary.
--
--     [Returns]: true if there is an intersection, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRectAndLineIntersection@, defined at @SDL3\/SDL_rect.h 305:34@
sDL_GetRectAndLineIntersection
  :: PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@rect@]: an 'SDL_Rect' structure representing the rectangle to intersect.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@X1@]: a pointer to the starting X-coordinate of the line.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@Y1@]: a pointer to the starting Y-coordinate of the line.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@X2@]: a pointer to the ending X-coordinate of the line.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@Y2@]: a pointer to the ending Y-coordinate of the line.
  -> IO BG.CBool
sDL_GetRectAndLineIntersection =
  hs_bindgen_1319bb78d8d2e643

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_PointInRectFloat@
foreign import ccall safe "hs_bindgen_db89e1c0a4060064"
  hs_bindgen_db89e1c0a4060064_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_PointInRectFloat@
hs_bindgen_db89e1c0a4060064
  :: PtrConst.PtrConst SDL_FPoint
  -> PtrConst.PtrConst SDL_FRect
  -> IO BG.CBool
hs_bindgen_db89e1c0a4060064 =
  BG.fromFFIType hs_bindgen_db89e1c0a4060064_base

-- | Determine whether a point resides inside a floating point rectangle.
--
--     A point is considered part of a rectangle if both @p@ and @r@ are not NULL, and @p@ \'s x and y coordinates are >= to the rectangle\'s top left corner, and \<= the rectangle\'s x+w and y+h. So a 1x1 rectangle considers point (0,0) and (0,1) as \"inside\" and (0,2) as not.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [Returns]: true if @p@ is contained by @r@, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PointInRectFloat@, defined at @SDL3\/SDL_rect.h 331:23@
sDL_PointInRectFloat
  :: PtrConst.PtrConst SDL_FPoint
  -- ^
  --
  --           [@p@]: the point to test.
  -> PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@r@]: the rectangle to test.
  -> IO BG.CBool
sDL_PointInRectFloat = hs_bindgen_db89e1c0a4060064

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_RectEmptyFloat@
foreign import ccall safe "hs_bindgen_cf687f22e3772d43"
  hs_bindgen_cf687f22e3772d43_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_RectEmptyFloat@
hs_bindgen_cf687f22e3772d43
  :: PtrConst.PtrConst SDL_FRect
  -> IO BG.CBool
hs_bindgen_cf687f22e3772d43 =
  BG.fromFFIType hs_bindgen_cf687f22e3772d43_base

-- | Determine whether a floating point rectangle takes no space.
--
--     A rectangle is considered \"empty\" for this function if @r@ is NULL, or if @r@ \'s width and\/or height are \< 0.0f.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [Returns]: true if the rectangle is \"empty\", false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RectEmptyFloat@, defined at @SDL3\/SDL_rect.h 355:23@
sDL_RectEmptyFloat
  :: PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@r@]: the rectangle to test.
  -> IO BG.CBool
sDL_RectEmptyFloat = hs_bindgen_cf687f22e3772d43

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_RectsEqualEpsilon@
foreign import ccall safe "hs_bindgen_ffb7b7aa2884662e"
  hs_bindgen_ffb7b7aa2884662e_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_RectsEqualEpsilon@
hs_bindgen_ffb7b7aa2884662e
  :: PtrConst.PtrConst SDL_FRect
  -> PtrConst.PtrConst SDL_FRect
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_ffb7b7aa2884662e =
  BG.fromFFIType hs_bindgen_ffb7b7aa2884662e_base

-- | Determine whether two floating point rectangles are equal, within some given epsilon.
--
--     Rectangles are considered equal if both are not NULL and each of their x, y, width and height are within @epsilon@ of each other. If you don\'t know what value to use for @epsilon@, you should call the SDL_RectsEqualFloat function instead.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
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
  :: PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@a@]: the first rectangle to test.
  -> PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@b@]: the second rectangle to test.
  -> BG.CFloat
  -- ^
  --
  --           [@epsilon@]: the epsilon value for comparison.
  -> IO BG.CBool
sDL_RectsEqualEpsilon = hs_bindgen_ffb7b7aa2884662e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_RectsEqualFloat@
foreign import ccall safe "hs_bindgen_16841c4903715a15"
  hs_bindgen_16841c4903715a15_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_RectsEqualFloat@
hs_bindgen_16841c4903715a15
  :: PtrConst.PtrConst SDL_FRect
  -> PtrConst.PtrConst SDL_FRect
  -> IO BG.CBool
hs_bindgen_16841c4903715a15 =
  BG.fromFFIType hs_bindgen_16841c4903715a15_base

-- | Determine whether two floating point rectangles are equal, within a default epsilon.
--
--     Rectangles are considered equal if both are not NULL and each of their x, y, width and height are within SDL_FLT_EPSILON of each other. This is often a reasonable way to compare two floating point rectangles and deal with the slight precision variations in floating point calculations that tend to pop up.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
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
  :: PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@a@]: the first rectangle to test.
  -> PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@b@]: the second rectangle to test.
  -> IO BG.CBool
sDL_RectsEqualFloat = hs_bindgen_16841c4903715a15

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_HasRectIntersectionFloat@
foreign import ccall safe "hs_bindgen_4ccee9871e6b2122"
  hs_bindgen_4ccee9871e6b2122_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_HasRectIntersectionFloat@
hs_bindgen_4ccee9871e6b2122
  :: PtrConst.PtrConst SDL_FRect
  -> PtrConst.PtrConst SDL_FRect
  -> IO BG.CBool
hs_bindgen_4ccee9871e6b2122 =
  BG.fromFFIType hs_bindgen_4ccee9871e6b2122_base

-- | Determine whether two rectangles intersect with float precision.
--
--     If either pointer is NULL the function will return false.
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
  :: PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@A@]: an 'SDL_FRect' structure representing the first rectangle.
  -> PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@B@]: an 'SDL_FRect' structure representing the second rectangle.
  -> IO BG.CBool
sDL_HasRectIntersectionFloat =
  hs_bindgen_4ccee9871e6b2122

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectIntersectionFloat@
foreign import ccall safe "hs_bindgen_73c245953e392b8b"
  hs_bindgen_73c245953e392b8b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectIntersectionFloat@
hs_bindgen_73c245953e392b8b
  :: PtrConst.PtrConst SDL_FRect
  -> PtrConst.PtrConst SDL_FRect
  -> BG.Ptr SDL_FRect
  -> IO BG.CBool
hs_bindgen_73c245953e392b8b =
  BG.fromFFIType hs_bindgen_73c245953e392b8b_base

-- | Calculate the intersection of two rectangles with float precision.
--
--     If @result@ is NULL then this function will return false.
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
  :: PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@A@]: an 'SDL_FRect' structure representing the first rectangle.
  -> PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@B@]: an 'SDL_FRect' structure representing the second rectangle.
  -> BG.Ptr SDL_FRect
  -- ^
  --
  --           [@result@]: an 'SDL_FRect' structure filled in with the intersection of rectangles @A@ and @B@.
  -> IO BG.CBool
sDL_GetRectIntersectionFloat =
  hs_bindgen_73c245953e392b8b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectUnionFloat@
foreign import ccall safe "hs_bindgen_26df11f6f3486748"
  hs_bindgen_26df11f6f3486748_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectUnionFloat@
hs_bindgen_26df11f6f3486748
  :: PtrConst.PtrConst SDL_FRect
  -> PtrConst.PtrConst SDL_FRect
  -> BG.Ptr SDL_FRect
  -> IO BG.CBool
hs_bindgen_26df11f6f3486748 =
  BG.fromFFIType hs_bindgen_26df11f6f3486748_base

-- | Calculate the union of two rectangles with float precision.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRectUnionFloat@, defined at @SDL3\/SDL_rect.h 475:34@
sDL_GetRectUnionFloat
  :: PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@A@]: an 'SDL_FRect' structure representing the first rectangle.
  -> PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@B@]: an 'SDL_FRect' structure representing the second rectangle.
  -> BG.Ptr SDL_FRect
  -- ^
  --
  --           [@result@]: an 'SDL_FRect' structure filled in with the union of rectangles @A@ and @B@.
  -> IO BG.CBool
sDL_GetRectUnionFloat = hs_bindgen_26df11f6f3486748

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectEnclosingPointsFloat@
foreign import ccall safe "hs_bindgen_c543abfe8b881179"
  hs_bindgen_c543abfe8b881179_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectEnclosingPointsFloat@
hs_bindgen_c543abfe8b881179
  :: PtrConst.PtrConst SDL_FPoint
  -> BG.CInt
  -> PtrConst.PtrConst SDL_FRect
  -> BG.Ptr SDL_FRect
  -> IO BG.CBool
hs_bindgen_c543abfe8b881179 =
  BG.fromFFIType hs_bindgen_c543abfe8b881179_base

-- | Calculate a minimal rectangle enclosing a set of points with float precision.
--
--     If @clip@ is not NULL then only points inside of the clipping rectangle are considered.
--
--     [Returns]: true if any points were enclosed or false if all the points were outside of the clipping rectangle.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRectEnclosingPointsFloat@, defined at @SDL3\/SDL_rect.h 497:34@
sDL_GetRectEnclosingPointsFloat
  :: PtrConst.PtrConst SDL_FPoint
  -- ^
  --
  --           [@points@]: an array of 'SDL_FPoint' structures representing points to be enclosed.
  -> BG.CInt
  -- ^
  --
  --           [@count@]: the number of structures in the @points@ array.
  -> PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@clip@]: an 'SDL_FRect' used for clipping or NULL to enclose all points.
  -> BG.Ptr SDL_FRect
  -- ^
  --
  --           [@result@]: an 'SDL_FRect' structure filled in with the minimal enclosing rectangle.
  -> IO BG.CBool
sDL_GetRectEnclosingPointsFloat =
  hs_bindgen_c543abfe8b881179

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectAndLineIntersectionFloat@
foreign import ccall safe "hs_bindgen_274c31df17fcabf9"
  hs_bindgen_274c31df17fcabf9_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Safe_SDL_GetRectAndLineIntersectionFloat@
hs_bindgen_274c31df17fcabf9
  :: PtrConst.PtrConst SDL_FRect
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_274c31df17fcabf9 =
  BG.fromFFIType hs_bindgen_274c31df17fcabf9_base

-- | Calculate the intersection of a rectangle and line segment with float precision.
--
--     This function is used to clip a line segment to a rectangle. A line segment contained entirely within the rectangle or that does not intersect will remain unchanged. A line segment that crosses the rectangle at either or both ends will be clipped to the boundary of the rectangle and the new coordinates saved in @X1@, @Y1@, @X2@, and\/or @Y2@ as necessary.
--
--     [Returns]: true if there is an intersection, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRectAndLineIntersectionFloat@, defined at @SDL3\/SDL_rect.h 520:34@
sDL_GetRectAndLineIntersectionFloat
  :: PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@rect@]: an 'SDL_FRect' structure representing the rectangle to intersect.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@X1@]: a pointer to the starting X-coordinate of the line.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@Y1@]: a pointer to the starting Y-coordinate of the line.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@X2@]: a pointer to the ending X-coordinate of the line.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@Y2@]: a pointer to the ending Y-coordinate of the line.
  -> IO BG.CBool
sDL_GetRectAndLineIntersectionFloat =
  hs_bindgen_274c31df17fcabf9

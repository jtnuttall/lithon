{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Rect.Unsafe (
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_RectToFRect,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_PointInRect,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_RectEmpty,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_RectsEqual,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_HasRectIntersection,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_GetRectIntersection,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_GetRectUnion,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_GetRectEnclosingPoints,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_GetRectAndLineIntersection,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_PointInRectFloat,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_RectEmptyFloat,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_RectsEqualEpsilon,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_RectsEqualFloat,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_HasRectIntersectionFloat,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_GetRectIntersectionFloat,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_GetRectUnionFloat,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_GetRectEnclosingPointsFloat,
  SDL3.Sys.Bindgen.Rect.Unsafe.sDL_GetRectAndLineIntersectionFloat,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Rect

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_rect.h>"
         , "void hs_bindgen_8e106b8f8a5cc9ba ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_FRect *arg2"
         , ")"
         , "{"
         , "  (SDL_RectToFRect)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_a98cca13647f2c65 ("
         , "  SDL_Point const *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_PointInRect)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_d87d44547ed7b9c1 ("
         , "  SDL_Rect const *arg1"
         , ")"
         , "{"
         , "  return (SDL_RectEmpty)(arg1);"
         , "}"
         , "_Bool hs_bindgen_27b455f8a1132dc3 ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_RectsEqual)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_c41afd18a3fb5214 ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_HasRectIntersection)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_a35618c178c541bb ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Rect *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetRectIntersection)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_fb794a6b5c1e9203 ("
         , "  SDL_Rect const *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Rect *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetRectUnion)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_055ba0fc6b09318a ("
         , "  SDL_Point const *arg1,"
         , "  signed int arg2,"
         , "  SDL_Rect const *arg3,"
         , "  SDL_Rect *arg4"
         , ")"
         , "{"
         , "  return (SDL_GetRectEnclosingPoints)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_959a5cb13535d34f ("
         , "  SDL_Rect const *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3,"
         , "  signed int *arg4,"
         , "  signed int *arg5"
         , ")"
         , "{"
         , "  return (SDL_GetRectAndLineIntersection)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_d0a7b5fa03d29582 ("
         , "  SDL_FPoint const *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_PointInRectFloat)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_9c321e237166b364 ("
         , "  SDL_FRect const *arg1"
         , ")"
         , "{"
         , "  return (SDL_RectEmptyFloat)(arg1);"
         , "}"
         , "_Bool hs_bindgen_f80b1d55f3fd3ff0 ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return (SDL_RectsEqualEpsilon)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_ae8860672929d976 ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_RectsEqualFloat)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_7789d3ed056d9e69 ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_HasRectIntersectionFloat)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_b201a8ca90bb5827 ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  SDL_FRect *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetRectIntersectionFloat)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_acf40b03660f89c9 ("
         , "  SDL_FRect const *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  SDL_FRect *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetRectUnionFloat)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_7e56e880d6fe6038 ("
         , "  SDL_FPoint const *arg1,"
         , "  signed int arg2,"
         , "  SDL_FRect const *arg3,"
         , "  SDL_FRect *arg4"
         , ")"
         , "{"
         , "  return (SDL_GetRectEnclosingPointsFloat)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_eea028e78b1eead0 ("
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

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_RectToFRect@
foreign import ccall unsafe "hs_bindgen_8e106b8f8a5cc9ba"
  hs_bindgen_8e106b8f8a5cc9ba_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_RectToFRect@
hs_bindgen_8e106b8f8a5cc9ba
  :: PtrConst.PtrConst SDL_Rect
  -> BG.Ptr SDL_FRect
  -> IO ()
hs_bindgen_8e106b8f8a5cc9ba =
  BG.fromFFIType hs_bindgen_8e106b8f8a5cc9ba_base

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
sDL_RectToFRect = hs_bindgen_8e106b8f8a5cc9ba

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_PointInRect@
foreign import ccall unsafe "hs_bindgen_a98cca13647f2c65"
  hs_bindgen_a98cca13647f2c65_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_PointInRect@
hs_bindgen_a98cca13647f2c65
  :: PtrConst.PtrConst SDL_Point
  -> PtrConst.PtrConst SDL_Rect
  -> IO BG.CBool
hs_bindgen_a98cca13647f2c65 =
  BG.fromFFIType hs_bindgen_a98cca13647f2c65_base

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
sDL_PointInRect = hs_bindgen_a98cca13647f2c65

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_RectEmpty@
foreign import ccall unsafe "hs_bindgen_d87d44547ed7b9c1"
  hs_bindgen_d87d44547ed7b9c1_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_RectEmpty@
hs_bindgen_d87d44547ed7b9c1
  :: PtrConst.PtrConst SDL_Rect
  -> IO BG.CBool
hs_bindgen_d87d44547ed7b9c1 =
  BG.fromFFIType hs_bindgen_d87d44547ed7b9c1_base

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
sDL_RectEmpty = hs_bindgen_d87d44547ed7b9c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_RectsEqual@
foreign import ccall unsafe "hs_bindgen_27b455f8a1132dc3"
  hs_bindgen_27b455f8a1132dc3_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_RectsEqual@
hs_bindgen_27b455f8a1132dc3
  :: PtrConst.PtrConst SDL_Rect
  -> PtrConst.PtrConst SDL_Rect
  -> IO BG.CBool
hs_bindgen_27b455f8a1132dc3 =
  BG.fromFFIType hs_bindgen_27b455f8a1132dc3_base

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
sDL_RectsEqual = hs_bindgen_27b455f8a1132dc3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_HasRectIntersection@
foreign import ccall unsafe "hs_bindgen_c41afd18a3fb5214"
  hs_bindgen_c41afd18a3fb5214_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_HasRectIntersection@
hs_bindgen_c41afd18a3fb5214
  :: PtrConst.PtrConst SDL_Rect
  -> PtrConst.PtrConst SDL_Rect
  -> IO BG.CBool
hs_bindgen_c41afd18a3fb5214 =
  BG.fromFFIType hs_bindgen_c41afd18a3fb5214_base

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
sDL_HasRectIntersection = hs_bindgen_c41afd18a3fb5214

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectIntersection@
foreign import ccall unsafe "hs_bindgen_a35618c178c541bb"
  hs_bindgen_a35618c178c541bb_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectIntersection@
hs_bindgen_a35618c178c541bb
  :: PtrConst.PtrConst SDL_Rect
  -> PtrConst.PtrConst SDL_Rect
  -> BG.Ptr SDL_Rect
  -> IO BG.CBool
hs_bindgen_a35618c178c541bb =
  BG.fromFFIType hs_bindgen_a35618c178c541bb_base

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
sDL_GetRectIntersection = hs_bindgen_a35618c178c541bb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectUnion@
foreign import ccall unsafe "hs_bindgen_fb794a6b5c1e9203"
  hs_bindgen_fb794a6b5c1e9203_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectUnion@
hs_bindgen_fb794a6b5c1e9203
  :: PtrConst.PtrConst SDL_Rect
  -> PtrConst.PtrConst SDL_Rect
  -> BG.Ptr SDL_Rect
  -> IO BG.CBool
hs_bindgen_fb794a6b5c1e9203 =
  BG.fromFFIType hs_bindgen_fb794a6b5c1e9203_base

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
sDL_GetRectUnion = hs_bindgen_fb794a6b5c1e9203

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectEnclosingPoints@
foreign import ccall unsafe "hs_bindgen_055ba0fc6b09318a"
  hs_bindgen_055ba0fc6b09318a_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectEnclosingPoints@
hs_bindgen_055ba0fc6b09318a
  :: PtrConst.PtrConst SDL_Point
  -> BG.CInt
  -> PtrConst.PtrConst SDL_Rect
  -> BG.Ptr SDL_Rect
  -> IO BG.CBool
hs_bindgen_055ba0fc6b09318a =
  BG.fromFFIType hs_bindgen_055ba0fc6b09318a_base

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
  hs_bindgen_055ba0fc6b09318a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectAndLineIntersection@
foreign import ccall unsafe "hs_bindgen_959a5cb13535d34f"
  hs_bindgen_959a5cb13535d34f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectAndLineIntersection@
hs_bindgen_959a5cb13535d34f
  :: PtrConst.PtrConst SDL_Rect
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_959a5cb13535d34f =
  BG.fromFFIType hs_bindgen_959a5cb13535d34f_base

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
  hs_bindgen_959a5cb13535d34f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_PointInRectFloat@
foreign import ccall unsafe "hs_bindgen_d0a7b5fa03d29582"
  hs_bindgen_d0a7b5fa03d29582_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_PointInRectFloat@
hs_bindgen_d0a7b5fa03d29582
  :: PtrConst.PtrConst SDL_FPoint
  -> PtrConst.PtrConst SDL_FRect
  -> IO BG.CBool
hs_bindgen_d0a7b5fa03d29582 =
  BG.fromFFIType hs_bindgen_d0a7b5fa03d29582_base

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
sDL_PointInRectFloat = hs_bindgen_d0a7b5fa03d29582

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_RectEmptyFloat@
foreign import ccall unsafe "hs_bindgen_9c321e237166b364"
  hs_bindgen_9c321e237166b364_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_RectEmptyFloat@
hs_bindgen_9c321e237166b364
  :: PtrConst.PtrConst SDL_FRect
  -> IO BG.CBool
hs_bindgen_9c321e237166b364 =
  BG.fromFFIType hs_bindgen_9c321e237166b364_base

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
sDL_RectEmptyFloat = hs_bindgen_9c321e237166b364

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_RectsEqualEpsilon@
foreign import ccall unsafe "hs_bindgen_f80b1d55f3fd3ff0"
  hs_bindgen_f80b1d55f3fd3ff0_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_RectsEqualEpsilon@
hs_bindgen_f80b1d55f3fd3ff0
  :: PtrConst.PtrConst SDL_FRect
  -> PtrConst.PtrConst SDL_FRect
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_f80b1d55f3fd3ff0 =
  BG.fromFFIType hs_bindgen_f80b1d55f3fd3ff0_base

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
sDL_RectsEqualEpsilon = hs_bindgen_f80b1d55f3fd3ff0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_RectsEqualFloat@
foreign import ccall unsafe "hs_bindgen_ae8860672929d976"
  hs_bindgen_ae8860672929d976_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_RectsEqualFloat@
hs_bindgen_ae8860672929d976
  :: PtrConst.PtrConst SDL_FRect
  -> PtrConst.PtrConst SDL_FRect
  -> IO BG.CBool
hs_bindgen_ae8860672929d976 =
  BG.fromFFIType hs_bindgen_ae8860672929d976_base

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
sDL_RectsEqualFloat = hs_bindgen_ae8860672929d976

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_HasRectIntersectionFloat@
foreign import ccall unsafe "hs_bindgen_7789d3ed056d9e69"
  hs_bindgen_7789d3ed056d9e69_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_HasRectIntersectionFloat@
hs_bindgen_7789d3ed056d9e69
  :: PtrConst.PtrConst SDL_FRect
  -> PtrConst.PtrConst SDL_FRect
  -> IO BG.CBool
hs_bindgen_7789d3ed056d9e69 =
  BG.fromFFIType hs_bindgen_7789d3ed056d9e69_base

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
  hs_bindgen_7789d3ed056d9e69

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectIntersectionFloat@
foreign import ccall unsafe "hs_bindgen_b201a8ca90bb5827"
  hs_bindgen_b201a8ca90bb5827_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectIntersectionFloat@
hs_bindgen_b201a8ca90bb5827
  :: PtrConst.PtrConst SDL_FRect
  -> PtrConst.PtrConst SDL_FRect
  -> BG.Ptr SDL_FRect
  -> IO BG.CBool
hs_bindgen_b201a8ca90bb5827 =
  BG.fromFFIType hs_bindgen_b201a8ca90bb5827_base

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
  hs_bindgen_b201a8ca90bb5827

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectUnionFloat@
foreign import ccall unsafe "hs_bindgen_acf40b03660f89c9"
  hs_bindgen_acf40b03660f89c9_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectUnionFloat@
hs_bindgen_acf40b03660f89c9
  :: PtrConst.PtrConst SDL_FRect
  -> PtrConst.PtrConst SDL_FRect
  -> BG.Ptr SDL_FRect
  -> IO BG.CBool
hs_bindgen_acf40b03660f89c9 =
  BG.fromFFIType hs_bindgen_acf40b03660f89c9_base

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
sDL_GetRectUnionFloat = hs_bindgen_acf40b03660f89c9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectEnclosingPointsFloat@
foreign import ccall unsafe "hs_bindgen_7e56e880d6fe6038"
  hs_bindgen_7e56e880d6fe6038_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectEnclosingPointsFloat@
hs_bindgen_7e56e880d6fe6038
  :: PtrConst.PtrConst SDL_FPoint
  -> BG.CInt
  -> PtrConst.PtrConst SDL_FRect
  -> BG.Ptr SDL_FRect
  -> IO BG.CBool
hs_bindgen_7e56e880d6fe6038 =
  BG.fromFFIType hs_bindgen_7e56e880d6fe6038_base

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
  hs_bindgen_7e56e880d6fe6038

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectAndLineIntersectionFloat@
foreign import ccall unsafe "hs_bindgen_eea028e78b1eead0"
  hs_bindgen_eea028e78b1eead0_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Rect_Unsafe_SDL_GetRectAndLineIntersectionFloat@
hs_bindgen_eea028e78b1eead0
  :: PtrConst.PtrConst SDL_FRect
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_eea028e78b1eead0 =
  BG.fromFFIType hs_bindgen_eea028e78b1eead0_base

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
  hs_bindgen_eea028e78b1eead0

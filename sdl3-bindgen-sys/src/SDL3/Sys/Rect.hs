-- | Some helper functions for managing rectangles and 2D points, in both integer and floating point versions. The structure that defines a point (using integers).
--
--     @since 3.2.0
--
--     [See also]: 'getRectEnclosingPoints', 'pointInRect'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Rect.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Rect (
  module SDL3.Sys.Bindgen.Rect,

  -- * Function aliases
  SDL3.Sys.Rect.rectToFRect,
  SDL3.Sys.Rect.pointInRect,
  SDL3.Sys.Rect.rectEmpty,
  SDL3.Sys.Rect.rectsEqual,
  SDL3.Sys.Rect.hasRectIntersection,
  SDL3.Sys.Rect.getRectIntersection,
  SDL3.Sys.Rect.getRectUnion,
  SDL3.Sys.Rect.getRectEnclosingPoints,
  SDL3.Sys.Rect.getRectAndLineIntersection,
  SDL3.Sys.Rect.pointInRectFloat,
  SDL3.Sys.Rect.rectEmptyFloat,
  SDL3.Sys.Rect.rectsEqualEpsilon,
  SDL3.Sys.Rect.rectsEqualFloat,
  SDL3.Sys.Rect.hasRectIntersectionFloat,
  SDL3.Sys.Rect.getRectIntersectionFloat,
  SDL3.Sys.Rect.getRectUnionFloat,
  SDL3.Sys.Rect.getRectEnclosingPointsFloat,
  SDL3.Sys.Rect.getRectAndLineIntersectionFloat,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Rect
import SDL3.Sys.Bindgen.Rect.Unsafe qualified as Unsafe

-- | Convert an 'SDL_Rect' to 'SDL_FRect'
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RectToFRect@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [C declaration]: @SDL_RectToFRect@, defined at @SDL3\/SDL_rect.h 129:23@
rectToFRect
  :: PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@rect@]: a pointer to an 'SDL_Rect'.
  -> BG.Ptr SDL_FRect
  -- ^
  --
  --           [@frect@]: a pointer filled in with the floating point representation of @rect@.
  -> IO ()
rectToFRect = Unsafe.sDL_RectToFRect

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PointInRect@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PointInRect@, defined at @SDL3\/SDL_rect.h 158:23@
pointInRect
  :: PtrConst.PtrConst SDL_Point
  -- ^
  --
  --           [@p@]: the point to test.
  -> PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@r@]: the rectangle to test.
  -> IO Bool
pointInRect =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_PointInRect x00 x11)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RectEmpty@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RectEmpty@, defined at @SDL3\/SDL_rect.h 182:23@
rectEmpty
  :: PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@r@]: the rectangle to test.
  -> IO Bool
rectEmpty =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_RectEmpty x00)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RectsEqual@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RectsEqual@, defined at @SDL3\/SDL_rect.h 206:23@
rectsEqual
  :: PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@a@]: the first rectangle to test.
  -> PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@b@]: the second rectangle to test.
  -> IO Bool
rectsEqual =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_RectsEqual x00 x11)

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
--     [See also]: 'getRectIntersection'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasRectIntersection@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasRectIntersection@, defined at @SDL3\/SDL_rect.h 227:34@
hasRectIntersection
  :: PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@A@]: an 'SDL_Rect' structure representing the first rectangle.
  -> PtrConst.PtrConst SDL_Rect
  -- ^
  --
  --           [@B@]: an 'SDL_Rect' structure representing the second rectangle.
  -> IO Bool
hasRectIntersection =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_HasRectIntersection x00 x11)

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
--     [See also]: 'hasRectIntersection'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRectIntersection@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRectIntersection@, defined at @SDL3\/SDL_rect.h 246:34@
getRectIntersection
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
  -> IO Bool
getRectIntersection =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetRectIntersection x00 x11 x22)

-- | Calculate the union of two rectangles.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRectUnion@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRectUnion@, defined at @SDL3\/SDL_rect.h 262:34@
getRectUnion
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
  -> IO Bool
getRectUnion =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetRectUnion x00 x11 x22)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRectEnclosingPoints@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRectEnclosingPoints@, defined at @SDL3\/SDL_rect.h 283:34@
getRectEnclosingPoints
  :: PtrConst.PtrConst SDL_Point
  -- ^
  --
  --           [@points@]: an array of 'SDL_Point' structures representing points to be enclosed.
  -> BG.Int32
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
  -> IO Bool
getRectEnclosingPoints =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_GetRectEnclosingPoints x00 (Coerce.coerce x11) x22 x33)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRectAndLineIntersection@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRectAndLineIntersection@, defined at @SDL3\/SDL_rect.h 305:34@
getRectAndLineIntersection
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
  -> IO Bool
getRectAndLineIntersection =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_GetRectAndLineIntersection x00 x11 x22 x33 x44)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PointInRectFloat@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PointInRectFloat@, defined at @SDL3\/SDL_rect.h 331:23@
pointInRectFloat
  :: PtrConst.PtrConst SDL_FPoint
  -- ^
  --
  --           [@p@]: the point to test.
  -> PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@r@]: the rectangle to test.
  -> IO Bool
pointInRectFloat =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_PointInRectFloat x00 x11)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RectEmptyFloat@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RectEmptyFloat@, defined at @SDL3\/SDL_rect.h 355:23@
rectEmptyFloat
  :: PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@r@]: the rectangle to test.
  -> IO Bool
rectEmptyFloat =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_RectEmptyFloat x00)

-- | Determine whether two floating point rectangles are equal, within some given epsilon.
--
--     Rectangles are considered equal if both are not NULL and each of their x, y, width and height are within @epsilon@ of each other. If you don\'t know what value to use for @epsilon@, you should call the 'rectsEqualFloat' function instead.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [Returns]: true if the rectangles are equal, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'rectsEqualFloat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RectsEqualEpsilon@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RectsEqualEpsilon@, defined at @SDL3\/SDL_rect.h 385:23@
rectsEqualEpsilon
  :: PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@a@]: the first rectangle to test.
  -> PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@b@]: the second rectangle to test.
  -> Float
  -- ^
  --
  --           [@epsilon@]: the epsilon value for comparison.
  -> IO Bool
rectsEqualEpsilon =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_RectsEqualEpsilon x00 x11 (Coerce.coerce x22))

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
--     [See also]: 'rectsEqualEpsilon'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RectsEqualFloat@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RectsEqualFloat@, defined at @SDL3\/SDL_rect.h 420:23@
rectsEqualFloat
  :: PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@a@]: the first rectangle to test.
  -> PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@b@]: the second rectangle to test.
  -> IO Bool
rectsEqualFloat =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_RectsEqualFloat x00 x11)

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
--     [See also]: 'getRectIntersection'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasRectIntersectionFloat@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasRectIntersectionFloat@, defined at @SDL3\/SDL_rect.h 440:34@
hasRectIntersectionFloat
  :: PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@A@]: an 'SDL_FRect' structure representing the first rectangle.
  -> PtrConst.PtrConst SDL_FRect
  -- ^
  --
  --           [@B@]: an 'SDL_FRect' structure representing the second rectangle.
  -> IO Bool
hasRectIntersectionFloat =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_HasRectIntersectionFloat x00 x11)

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
--     [See also]: 'hasRectIntersectionFloat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRectIntersectionFloat@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRectIntersectionFloat@, defined at @SDL3\/SDL_rect.h 459:34@
getRectIntersectionFloat
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
  -> IO Bool
getRectIntersectionFloat =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetRectIntersectionFloat x00 x11 x22)

-- | Calculate the union of two rectangles with float precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRectUnionFloat@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRectUnionFloat@, defined at @SDL3\/SDL_rect.h 475:34@
getRectUnionFloat
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
  -> IO Bool
getRectUnionFloat =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetRectUnionFloat x00 x11 x22)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRectEnclosingPointsFloat@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRectEnclosingPointsFloat@, defined at @SDL3\/SDL_rect.h 497:34@
getRectEnclosingPointsFloat
  :: PtrConst.PtrConst SDL_FPoint
  -- ^
  --
  --           [@points@]: an array of 'SDL_FPoint' structures representing points to be enclosed.
  -> BG.Int32
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
  -> IO Bool
getRectEnclosingPointsFloat =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_GetRectEnclosingPointsFloat x00 (Coerce.coerce x11) x22 x33)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRectAndLineIntersectionFloat@.
--                   The safe import is not exported
--                   : pure geometry on caller-supplied structs; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRectAndLineIntersectionFloat@, defined at @SDL3\/SDL_rect.h 520:34@
getRectAndLineIntersectionFloat
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
  -> IO Bool
getRectAndLineIntersectionFloat =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_GetRectAndLineIntersectionFloat x00 x11 x22 x33 x44)

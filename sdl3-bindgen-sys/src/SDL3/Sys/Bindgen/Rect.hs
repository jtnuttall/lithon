{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | Some helper functions for managing rectangles and 2D points, in both integer and floating point versions. The structure that defines a point (using integers).
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRectEnclosingPoints', 'sDL_PointInRect'
module SDL3.Sys.Bindgen.Rect (
  SDL3.Sys.Bindgen.Rect.SDL_Point (..),
  SDL3.Sys.Bindgen.Rect.SDL_FPoint (..),
  SDL3.Sys.Bindgen.Rect.SDL_Rect (..),
  SDL3.Sys.Bindgen.Rect.SDL_FRect (..),
)
where

import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @struct SDL_Point@, defined at @SDL3\/SDL_rect.h 49:16@
data SDL_Point = SDL_Point
  { x :: BG.CInt
  -- ^ [C declaration]: @x@, defined at @SDL3\/SDL_rect.h 51:9@
  , y :: BG.CInt
  -- ^ [C declaration]: @y@, defined at @SDL3\/SDL_rect.h 52:9@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_Point where
  staticSizeOf = \_ -> (8 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_Point where
  readRaw =
    \ptr0 ->
      pure SDL_Point
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0

instance Marshal.WriteRaw SDL_Point where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Point x2 y3 ->
            HasCField.writeRaw (BG.Proxy @"x") ptr0 x2
              >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y3

deriving via Marshal.EquivStorable SDL_Point instance BG.Storable SDL_Point

instance (ty ~ BG.CInt) => BG.CompatHasField.HasField "x" SDL_Point ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Point{x = y1, y = BG.getField @"y" x0}
      , BG.getField @"x" x0
      )

instance (ty ~ BG.CInt) => BG.HasField "x" (BG.Ptr SDL_Point) (BG.Ptr ty) where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_Point "x" where
  type CFieldType SDL_Point "x" = BG.CInt

  offset# = \_ -> \_ -> 0

instance (ty ~ BG.CInt) => BG.CompatHasField.HasField "y" SDL_Point ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Point{y = y1, x = BG.getField @"x" x0}
      , BG.getField @"y" x0
      )

instance (ty ~ BG.CInt) => BG.HasField "y" (BG.Ptr SDL_Point) (BG.Ptr ty) where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_Point "y" where
  type CFieldType SDL_Point "y" = BG.CInt

  offset# = \_ -> \_ -> 4

-- | The structure that defines a point (using floating point values).
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRectEnclosingPointsFloat', 'sDL_PointInRectFloat'
--
--     [C declaration]: @struct SDL_FPoint@, defined at @SDL3\/SDL_rect.h 63:16@
data SDL_FPoint = SDL_FPoint
  { x :: BG.CFloat
  -- ^ [C declaration]: @x@, defined at @SDL3\/SDL_rect.h 65:11@
  , y :: BG.CFloat
  -- ^ [C declaration]: @y@, defined at @SDL3\/SDL_rect.h 66:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_FPoint where
  staticSizeOf = \_ -> (8 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_FPoint where
  readRaw =
    \ptr0 ->
      pure SDL_FPoint
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0

instance Marshal.WriteRaw SDL_FPoint where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_FPoint x2 y3 ->
            HasCField.writeRaw (BG.Proxy @"x") ptr0 x2
              >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y3

deriving via Marshal.EquivStorable SDL_FPoint instance BG.Storable SDL_FPoint

instance (ty ~ BG.CFloat) => BG.CompatHasField.HasField "x" SDL_FPoint ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FPoint{x = y1, y = BG.getField @"y" x0}
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_FPoint) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_FPoint "x" where
  type CFieldType SDL_FPoint "x" = BG.CFloat

  offset# = \_ -> \_ -> 0

instance (ty ~ BG.CFloat) => BG.CompatHasField.HasField "y" SDL_FPoint ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FPoint{y = y1, x = BG.getField @"x" x0}
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_FPoint) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_FPoint "y" where
  type CFieldType SDL_FPoint "y" = BG.CFloat

  offset# = \_ -> \_ -> 4

-- | A rectangle, with the origin at the upper left (using integers).
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RectEmpty', 'sDL_RectsEqual', 'sDL_HasRectIntersection', 'sDL_GetRectIntersection', 'sDL_GetRectAndLineIntersection', 'sDL_GetRectUnion', 'sDL_GetRectEnclosingPoints'
--
--     [C declaration]: @struct SDL_Rect@, defined at @SDL3\/SDL_rect.h 83:16@
data SDL_Rect = SDL_Rect
  { x :: BG.CInt
  -- ^ [C declaration]: @x@, defined at @SDL3\/SDL_rect.h 85:9@
  , y :: BG.CInt
  -- ^ [C declaration]: @y@, defined at @SDL3\/SDL_rect.h 85:12@
  , w :: BG.CInt
  -- ^ [C declaration]: @w@, defined at @SDL3\/SDL_rect.h 86:9@
  , h :: BG.CInt
  -- ^ [C declaration]: @h@, defined at @SDL3\/SDL_rect.h 86:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_Rect where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_Rect where
  readRaw =
    \ptr0 ->
      pure SDL_Rect
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"w") ptr0
        <*> HasCField.readRaw (BG.Proxy @"h") ptr0

instance Marshal.WriteRaw SDL_Rect where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Rect x2 y3 w4 h5 ->
            HasCField.writeRaw (BG.Proxy @"x") ptr0 x2
              >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y3
              >> HasCField.writeRaw (BG.Proxy @"w") ptr0 w4
              >> HasCField.writeRaw (BG.Proxy @"h") ptr0 h5

deriving via Marshal.EquivStorable SDL_Rect instance BG.Storable SDL_Rect

instance (ty ~ BG.CInt) => BG.CompatHasField.HasField "x" SDL_Rect ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Rect
            { x = y1
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"x" x0
      )

instance (ty ~ BG.CInt) => BG.HasField "x" (BG.Ptr SDL_Rect) (BG.Ptr ty) where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_Rect "x" where
  type CFieldType SDL_Rect "x" = BG.CInt

  offset# = \_ -> \_ -> 0

instance (ty ~ BG.CInt) => BG.CompatHasField.HasField "y" SDL_Rect ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Rect
            { y = y1
            , x = BG.getField @"x" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"y" x0
      )

instance (ty ~ BG.CInt) => BG.HasField "y" (BG.Ptr SDL_Rect) (BG.Ptr ty) where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_Rect "y" where
  type CFieldType SDL_Rect "y" = BG.CInt

  offset# = \_ -> \_ -> 4

instance (ty ~ BG.CInt) => BG.CompatHasField.HasField "w" SDL_Rect ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Rect
            { w = y1
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"w" x0
      )

instance (ty ~ BG.CInt) => BG.HasField "w" (BG.Ptr SDL_Rect) (BG.Ptr ty) where
  getField = HasCField.fromPtr (BG.Proxy @"w")

instance HasCField.HasCField SDL_Rect "w" where
  type CFieldType SDL_Rect "w" = BG.CInt

  offset# = \_ -> \_ -> 8

instance (ty ~ BG.CInt) => BG.CompatHasField.HasField "h" SDL_Rect ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Rect
            { h = y1
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            }
      , BG.getField @"h" x0
      )

instance (ty ~ BG.CInt) => BG.HasField "h" (BG.Ptr SDL_Rect) (BG.Ptr ty) where
  getField = HasCField.fromPtr (BG.Proxy @"h")

instance HasCField.HasCField SDL_Rect "h" where
  type CFieldType SDL_Rect "h" = BG.CInt

  offset# = \_ -> \_ -> 12

-- | A rectangle stored using floating point values.
--
--     The origin of the coordinate space is in the top-left, with increasing values moving down and right. The properties @x@ and @y@ represent the coordinates of the top-left corner of the rectangle.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RectEmptyFloat', 'sDL_RectsEqualFloat', 'sDL_RectsEqualEpsilon', 'sDL_HasRectIntersectionFloat', 'sDL_GetRectIntersectionFloat', 'sDL_GetRectAndLineIntersectionFloat', 'sDL_GetRectUnionFloat', 'sDL_GetRectEnclosingPointsFloat', 'sDL_PointInRectFloat'
--
--     [C declaration]: @struct SDL_FRect@, defined at @SDL3\/SDL_rect.h 109:16@
data SDL_FRect = SDL_FRect
  { x :: BG.CFloat
  -- ^ [C declaration]: @x@, defined at @SDL3\/SDL_rect.h 111:11@
  , y :: BG.CFloat
  -- ^ [C declaration]: @y@, defined at @SDL3\/SDL_rect.h 112:11@
  , w :: BG.CFloat
  -- ^ [C declaration]: @w@, defined at @SDL3\/SDL_rect.h 113:11@
  , h :: BG.CFloat
  -- ^ [C declaration]: @h@, defined at @SDL3\/SDL_rect.h 114:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_FRect where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_FRect where
  readRaw =
    \ptr0 ->
      pure SDL_FRect
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"w") ptr0
        <*> HasCField.readRaw (BG.Proxy @"h") ptr0

instance Marshal.WriteRaw SDL_FRect where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_FRect x2 y3 w4 h5 ->
            HasCField.writeRaw (BG.Proxy @"x") ptr0 x2
              >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y3
              >> HasCField.writeRaw (BG.Proxy @"w") ptr0 w4
              >> HasCField.writeRaw (BG.Proxy @"h") ptr0 h5

deriving via Marshal.EquivStorable SDL_FRect instance BG.Storable SDL_FRect

instance (ty ~ BG.CFloat) => BG.CompatHasField.HasField "x" SDL_FRect ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FRect
            { x = y1
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_FRect) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_FRect "x" where
  type CFieldType SDL_FRect "x" = BG.CFloat

  offset# = \_ -> \_ -> 0

instance (ty ~ BG.CFloat) => BG.CompatHasField.HasField "y" SDL_FRect ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FRect
            { y = y1
            , x = BG.getField @"x" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_FRect) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_FRect "y" where
  type CFieldType SDL_FRect "y" = BG.CFloat

  offset# = \_ -> \_ -> 4

instance (ty ~ BG.CFloat) => BG.CompatHasField.HasField "w" SDL_FRect ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FRect
            { w = y1
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"w" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "w" (BG.Ptr SDL_FRect) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"w")

instance HasCField.HasCField SDL_FRect "w" where
  type CFieldType SDL_FRect "w" = BG.CFloat

  offset# = \_ -> \_ -> 8

instance (ty ~ BG.CFloat) => BG.CompatHasField.HasField "h" SDL_FRect ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FRect
            { h = y1
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            }
      , BG.getField @"h" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "h" (BG.Ptr SDL_FRect) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"h")

instance HasCField.HasCField SDL_FRect "h" where
  type CFieldType SDL_FRect "h" = BG.CFloat

  offset# = \_ -> \_ -> 12

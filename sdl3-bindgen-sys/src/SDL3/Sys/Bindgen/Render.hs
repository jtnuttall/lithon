{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | Header file for SDL 2D rendering functions.
--
--     This API supports the following features:
--
--     * single pixel points
--
--     * single pixel lines
--
--     * filled rectangles
--
--     * texture images
--
--     * 2D polygons
--
--     The primitives may be drawn in opaque, blended, or additive modes.
--
--     The texture images may be drawn in opaque, blended, or additive modes. They can have an additional color tint or alpha modulation applied to them, and may also be stretched with linear interpolation.
--
--     This API is designed to accelerate simple 2D operations. You may want more functionality such as 3D polygons and particle effects, and in that case you should use SDL\'s OpenGL\/Direct3D support, the SDL3 GPU API, or one of the many good 3D engines.
--
--     These functions must be called from the main thread. See this bug for details: [https:\/\/github.com\/libsdl-org\/SDL\/issues\/986](https://github.com/libsdl-org/SDL/issues/986) The name of the software renderer.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Render (
  SDL3.Sys.Bindgen.Render.sDL_SOFTWARE_RENDERER,
  SDL3.Sys.Bindgen.Render.sDL_GPU_RENDERER,
  SDL3.Sys.Bindgen.Render.SDL_Vertex (..),
  SDL3.Sys.Bindgen.Render.SDL_TextureAccess (..),
  pattern SDL3.Sys.Bindgen.Render.SDL_TEXTUREACCESS_STATIC,
  pattern SDL3.Sys.Bindgen.Render.SDL_TEXTUREACCESS_STREAMING,
  pattern SDL3.Sys.Bindgen.Render.SDL_TEXTUREACCESS_TARGET,
  SDL3.Sys.Bindgen.Render.SDL_TextureAddressMode (..),
  pattern SDL3.Sys.Bindgen.Render.SDL_TEXTURE_ADDRESS_INVALID,
  pattern SDL3.Sys.Bindgen.Render.SDL_TEXTURE_ADDRESS_AUTO,
  pattern SDL3.Sys.Bindgen.Render.SDL_TEXTURE_ADDRESS_CLAMP,
  pattern SDL3.Sys.Bindgen.Render.SDL_TEXTURE_ADDRESS_WRAP,
  SDL3.Sys.Bindgen.Render.SDL_RendererLogicalPresentation (..),
  pattern SDL3.Sys.Bindgen.Render.SDL_LOGICAL_PRESENTATION_DISABLED,
  pattern SDL3.Sys.Bindgen.Render.SDL_LOGICAL_PRESENTATION_STRETCH,
  pattern SDL3.Sys.Bindgen.Render.SDL_LOGICAL_PRESENTATION_LETTERBOX,
  pattern SDL3.Sys.Bindgen.Render.SDL_LOGICAL_PRESENTATION_OVERSCAN,
  pattern SDL3.Sys.Bindgen.Render.SDL_LOGICAL_PRESENTATION_INTEGER_SCALE,
  SDL3.Sys.Bindgen.Render.SDL_Renderer,
  SDL3.Sys.Bindgen.Render.SDL_Texture (..),
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_NAME_STRING,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_WINDOW_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_SURFACE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_GPU_DEVICE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_NAME_STRING,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_WINDOW_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_SURFACE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_VSYNC_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_HDR_HEADROOM_FLOAT,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_D3D9_DEVICE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_D3D11_DEVICE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_D3D12_DEVICE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_VULKAN_DEVICE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_RENDERER_GPU_DEVICE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_PALETTE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_VULKAN_LAYOUT_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_U_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_V_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_COLORSPACE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_FORMAT_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_ACCESS_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_WIDTH_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_HEIGHT_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_GPU_TEXTURE_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_GPU_TEXTURE_UV_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_GPU_TEXTURE_U_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_PROP_TEXTURE_GPU_TEXTURE_V_POINTER,
  SDL3.Sys.Bindgen.Render.sDL_RENDERER_VSYNC_DISABLED,
  SDL3.Sys.Bindgen.Render.sDL_RENDERER_VSYNC_ADAPTIVE,
  SDL3.Sys.Bindgen.Render.sDL_DEBUG_TEXT_FONT_CHARACTER_SIZE,
  SDL3.Sys.Bindgen.Render.SDL_GPURenderStateCreateInfo (..),
  SDL3.Sys.Bindgen.Render.SDL_GPURenderState,
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Gpu qualified
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Rect qualified
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @macro SDL_SOFTWARE_RENDERER@, literal @\"software\"@, defined at @SDL3\/SDL_render.h 75:9@
sDL_SOFTWARE_RENDERER :: BG.ByteString
sDL_SOFTWARE_RENDERER =
  BG.pack [0x73, 0x6F, 0x66, 0x74, 0x77, 0x61, 0x72, 0x65]

-- | The name of the GPU renderer.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_GPU_RENDERER@, literal @\"gpu\"@, defined at @SDL3\/SDL_render.h 82:9@
sDL_GPU_RENDERER :: BG.ByteString
sDL_GPU_RENDERER = BG.pack [0x67, 0x70, 0x75]

-- | Vertex structure.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_Vertex@, defined at @SDL3\/SDL_render.h 89:16@
data SDL_Vertex = SDL_Vertex
  { position :: SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -- ^ Vertex position, in 'SDL_Renderer' coordinates
  --
  --          [C declaration]: @position@, defined at @SDL3\/SDL_render.h 91:16@
  , color :: SDL3.Sys.Bindgen.Pixels.SDL_FColor
  -- ^ Vertex color
  --
  --          [C declaration]: @color@, defined at @SDL3\/SDL_render.h 92:16@
  , tex_coord :: SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -- ^ Normalized texture coordinates, if needed
  --
  --          [C declaration]: @tex_coord@, defined at @SDL3\/SDL_render.h 93:16@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_Vertex where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_Vertex where
  readRaw =
    \ptr0 ->
      pure SDL_Vertex
        <*> HasCField.readRaw (BG.Proxy @"position") ptr0
        <*> HasCField.readRaw (BG.Proxy @"color") ptr0
        <*> HasCField.readRaw (BG.Proxy @"tex_coord") ptr0

instance Marshal.WriteRaw SDL_Vertex where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Vertex position2 color3 tex_coord4 ->
            HasCField.writeRaw (BG.Proxy @"position") ptr0 position2
              >> HasCField.writeRaw (BG.Proxy @"color") ptr0 color3
              >> HasCField.writeRaw (BG.Proxy @"tex_coord") ptr0 tex_coord4

deriving via Marshal.EquivStorable SDL_Vertex instance BG.Storable SDL_Vertex

instance
  (ty ~ SDL3.Sys.Bindgen.Rect.SDL_FPoint)
  => BG.CompatHasField.HasField "position" SDL_Vertex ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Vertex
            { position = y1
            , color = BG.getField @"color" x0
            , tex_coord = BG.getField @"tex_coord" x0
            }
      , BG.getField @"position" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Rect.SDL_FPoint)
  => BG.HasField "position" (BG.Ptr SDL_Vertex) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"position")

instance HasCField.HasCField SDL_Vertex "position" where
  type
    CFieldType SDL_Vertex "position" =
      SDL3.Sys.Bindgen.Rect.SDL_FPoint

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_FColor)
  => BG.CompatHasField.HasField "color" SDL_Vertex ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Vertex
            { color = y1
            , position = BG.getField @"position" x0
            , tex_coord = BG.getField @"tex_coord" x0
            }
      , BG.getField @"color" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_FColor)
  => BG.HasField "color" (BG.Ptr SDL_Vertex) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"color")

instance HasCField.HasCField SDL_Vertex "color" where
  type
    CFieldType SDL_Vertex "color" =
      SDL3.Sys.Bindgen.Pixels.SDL_FColor

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Rect.SDL_FPoint)
  => BG.CompatHasField.HasField "tex_coord" SDL_Vertex ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Vertex
            { tex_coord = y1
            , position = BG.getField @"position" x0
            , color = BG.getField @"color" x0
            }
      , BG.getField @"tex_coord" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Rect.SDL_FPoint)
  => BG.HasField "tex_coord" (BG.Ptr SDL_Vertex) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"tex_coord")

instance HasCField.HasCField SDL_Vertex "tex_coord" where
  type
    CFieldType SDL_Vertex "tex_coord" =
      SDL3.Sys.Bindgen.Rect.SDL_FPoint

  offset# = \_ -> \_ -> 24

-- | The access pattern allowed for a texture.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_TextureAccess@, defined at @SDL3\/SDL_render.h 101:14@
newtype SDL_TextureAccess = SDL_TextureAccess
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_TextureAccess where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_TextureAccess where
  readRaw =
    \ptr0 ->
      pure SDL_TextureAccess
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_TextureAccess where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_TextureAccess unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_TextureAccess instance BG.Storable SDL_TextureAccess

deriving via BG.CUInt instance BG.Prim SDL_TextureAccess

instance CEnum.CEnum SDL_TextureAccess where
  type CEnumZ SDL_TextureAccess = BG.CUInt

  toCEnum = SDL_TextureAccess

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_TEXTUREACCESS_STATIC")
        , (1, BG.singleton "SDL_TEXTUREACCESS_STREAMING")
        , (2, BG.singleton "SDL_TEXTUREACCESS_TARGET")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_TextureAccess"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_TextureAccess"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_TextureAccess where
  minDeclaredValue = SDL_TEXTUREACCESS_STATIC

  maxDeclaredValue = SDL_TEXTUREACCESS_TARGET

instance Show SDL_TextureAccess where
  showsPrec = CEnum.shows

instance Read SDL_TextureAccess where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_TextureAccess ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextureAccess{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_TextureAccess) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TextureAccess "unwrap" where
  type CFieldType SDL_TextureAccess "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Changes rarely, not lockable
--
--     [C declaration]: @SDL_TEXTUREACCESS_STATIC@, defined at @SDL3\/SDL_render.h 103:5@
pattern SDL_TEXTUREACCESS_STATIC :: SDL_TextureAccess
pattern SDL_TEXTUREACCESS_STATIC = SDL_TextureAccess 0

-- | Changes frequently, lockable
--
--     [C declaration]: @SDL_TEXTUREACCESS_STREAMING@, defined at @SDL3\/SDL_render.h 104:5@
pattern SDL_TEXTUREACCESS_STREAMING :: SDL_TextureAccess
pattern SDL_TEXTUREACCESS_STREAMING = SDL_TextureAccess 1

-- | Texture can be used as a render target
--
--     [C declaration]: @SDL_TEXTUREACCESS_TARGET@, defined at @SDL3\/SDL_render.h 105:5@
pattern SDL_TEXTUREACCESS_TARGET :: SDL_TextureAccess
pattern SDL_TEXTUREACCESS_TARGET = SDL_TextureAccess 2

-- | The addressing mode for a texture when used in @SDL_RenderGeometry()@.
--
--     This affects how texture coordinates are interpreted outside of [0, 1]
--
--     Texture wrapping is always supported for power of two texture sizes, and is supported for other texture sizes if SDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN is set to true.
--
--     @since 3.4.0
--
--     [C declaration]: @enum SDL_TextureAddressMode@, defined at @SDL3\/SDL_render.h 119:14@
newtype SDL_TextureAddressMode = SDL_TextureAddressMode
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_TextureAddressMode where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_TextureAddressMode where
  readRaw =
    \ptr0 ->
      pure SDL_TextureAddressMode
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_TextureAddressMode where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_TextureAddressMode unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_TextureAddressMode
  instance
    BG.Storable SDL_TextureAddressMode

deriving via BG.CInt instance BG.Prim SDL_TextureAddressMode

instance CEnum.CEnum SDL_TextureAddressMode where
  type CEnumZ SDL_TextureAddressMode = BG.CInt

  toCEnum = SDL_TextureAddressMode

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (-1, BG.singleton "SDL_TEXTURE_ADDRESS_INVALID")
        , (0, BG.singleton "SDL_TEXTURE_ADDRESS_AUTO")
        , (1, BG.singleton "SDL_TEXTURE_ADDRESS_CLAMP")
        , (2, BG.singleton "SDL_TEXTURE_ADDRESS_WRAP")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_TextureAddressMode"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_TextureAddressMode"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_TextureAddressMode where
  minDeclaredValue = SDL_TEXTURE_ADDRESS_INVALID

  maxDeclaredValue = SDL_TEXTURE_ADDRESS_WRAP

instance Show SDL_TextureAddressMode where
  showsPrec = CEnum.shows

instance Read SDL_TextureAddressMode where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_TextureAddressMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextureAddressMode{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_TextureAddressMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TextureAddressMode "unwrap" where
  type
    CFieldType SDL_TextureAddressMode "unwrap" =
      BG.CInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_TEXTURE_ADDRESS_INVALID@, defined at @SDL3\/SDL_render.h 121:5@
pattern SDL_TEXTURE_ADDRESS_INVALID :: SDL_TextureAddressMode
pattern SDL_TEXTURE_ADDRESS_INVALID = SDL_TextureAddressMode (-1)

-- | Wrapping is enabled if texture coordinates are outside [0, 1], this is the default
--
--     [C declaration]: @SDL_TEXTURE_ADDRESS_AUTO@, defined at @SDL3\/SDL_render.h 122:5@
pattern SDL_TEXTURE_ADDRESS_AUTO :: SDL_TextureAddressMode
pattern SDL_TEXTURE_ADDRESS_AUTO = SDL_TextureAddressMode 0

-- | Texture coordinates are clamped to the [0, 1] range
--
--     [C declaration]: @SDL_TEXTURE_ADDRESS_CLAMP@, defined at @SDL3\/SDL_render.h 123:5@
pattern SDL_TEXTURE_ADDRESS_CLAMP :: SDL_TextureAddressMode
pattern SDL_TEXTURE_ADDRESS_CLAMP = SDL_TextureAddressMode 1

-- | The texture is repeated (tiled)
--
--     [C declaration]: @SDL_TEXTURE_ADDRESS_WRAP@, defined at @SDL3\/SDL_render.h 124:5@
pattern SDL_TEXTURE_ADDRESS_WRAP :: SDL_TextureAddressMode
pattern SDL_TEXTURE_ADDRESS_WRAP = SDL_TextureAddressMode 2

-- | How the logical size is mapped to the output.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_RendererLogicalPresentation@, defined at @SDL3\/SDL_render.h 132:14@
newtype SDL_RendererLogicalPresentation = SDL_RendererLogicalPresentation
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_RendererLogicalPresentation where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_RendererLogicalPresentation where
  readRaw =
    \ptr0 ->
      pure SDL_RendererLogicalPresentation
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_RendererLogicalPresentation where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_RendererLogicalPresentation unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_RendererLogicalPresentation
  instance
    BG.Storable SDL_RendererLogicalPresentation

deriving via BG.CUInt instance BG.Prim SDL_RendererLogicalPresentation

instance CEnum.CEnum SDL_RendererLogicalPresentation where
  type
    CEnumZ SDL_RendererLogicalPresentation =
      BG.CUInt

  toCEnum = SDL_RendererLogicalPresentation

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_LOGICAL_PRESENTATION_DISABLED")
        , (1, BG.singleton "SDL_LOGICAL_PRESENTATION_STRETCH")
        , (2, BG.singleton "SDL_LOGICAL_PRESENTATION_LETTERBOX")
        , (3, BG.singleton "SDL_LOGICAL_PRESENTATION_OVERSCAN")
        , (4, BG.singleton "SDL_LOGICAL_PRESENTATION_INTEGER_SCALE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_RendererLogicalPresentation"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_RendererLogicalPresentation"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_RendererLogicalPresentation where
  minDeclaredValue = SDL_LOGICAL_PRESENTATION_DISABLED

  maxDeclaredValue =
    SDL_LOGICAL_PRESENTATION_INTEGER_SCALE

instance Show SDL_RendererLogicalPresentation where
  showsPrec = CEnum.shows

instance Read SDL_RendererLogicalPresentation where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_RendererLogicalPresentation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_RendererLogicalPresentation{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_RendererLogicalPresentation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_RendererLogicalPresentation "unwrap" where
  type
    CFieldType SDL_RendererLogicalPresentation "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | There is no logical size in effect
--
--     [C declaration]: @SDL_LOGICAL_PRESENTATION_DISABLED@, defined at @SDL3\/SDL_render.h 134:5@
pattern SDL_LOGICAL_PRESENTATION_DISABLED :: SDL_RendererLogicalPresentation
pattern SDL_LOGICAL_PRESENTATION_DISABLED = SDL_RendererLogicalPresentation 0

-- | The rendered content is stretched to the output resolution
--
--     [C declaration]: @SDL_LOGICAL_PRESENTATION_STRETCH@, defined at @SDL3\/SDL_render.h 135:5@
pattern SDL_LOGICAL_PRESENTATION_STRETCH :: SDL_RendererLogicalPresentation
pattern SDL_LOGICAL_PRESENTATION_STRETCH = SDL_RendererLogicalPresentation 1

-- | The rendered content is fit to the largest dimension and the other dimension is letterboxed with the clear color
--
--     [C declaration]: @SDL_LOGICAL_PRESENTATION_LETTERBOX@, defined at @SDL3\/SDL_render.h 136:5@
pattern SDL_LOGICAL_PRESENTATION_LETTERBOX :: SDL_RendererLogicalPresentation
pattern SDL_LOGICAL_PRESENTATION_LETTERBOX = SDL_RendererLogicalPresentation 2

-- | The rendered content is fit to the smallest dimension and the other dimension extends beyond the output bounds
--
--     [C declaration]: @SDL_LOGICAL_PRESENTATION_OVERSCAN@, defined at @SDL3\/SDL_render.h 137:5@
pattern SDL_LOGICAL_PRESENTATION_OVERSCAN :: SDL_RendererLogicalPresentation
pattern SDL_LOGICAL_PRESENTATION_OVERSCAN = SDL_RendererLogicalPresentation 3

-- | The rendered content is scaled up by integer multiples to fit the output resolution
--
--     [C declaration]: @SDL_LOGICAL_PRESENTATION_INTEGER_SCALE@, defined at @SDL3\/SDL_render.h 138:5@
pattern SDL_LOGICAL_PRESENTATION_INTEGER_SCALE :: SDL_RendererLogicalPresentation
pattern SDL_LOGICAL_PRESENTATION_INTEGER_SCALE = SDL_RendererLogicalPresentation 4

-- | A structure representing rendering state
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_Renderer@, defined at @SDL3\/SDL_render.h 146:16@
data SDL_Renderer

-- | An efficient driver-specific representation of pixel data
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTexture', 'sDL_CreateTextureFromSurface', 'sDL_CreateTextureWithProperties', 'sDL_DestroyTexture'
--
--     [C declaration]: @struct SDL_Texture@, defined at @SDL3\/SDL_render.h 160:8@
data SDL_Texture = SDL_Texture
  { format :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^ The format of the texture, read-only
  --
  --          [C declaration]: @format@, defined at @SDL3\/SDL_render.h 162:21@
  , w :: BG.CInt
  -- ^ The width of the texture, read-only.
  --
  --          [C declaration]: @w@, defined at @SDL3\/SDL_render.h 163:9@
  , h :: BG.CInt
  -- ^ The height of the texture, read-only.
  --
  --          [C declaration]: @h@, defined at @SDL3\/SDL_render.h 164:9@
  , refcount :: BG.CInt
  -- ^ Application reference count, used when freeing texture
  --
  --          [C declaration]: @refcount@, defined at @SDL3\/SDL_render.h 166:9@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_Texture where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_Texture where
  readRaw =
    \ptr0 ->
      pure SDL_Texture
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"w") ptr0
        <*> HasCField.readRaw (BG.Proxy @"h") ptr0
        <*> HasCField.readRaw (BG.Proxy @"refcount") ptr0

instance Marshal.WriteRaw SDL_Texture where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Texture format2 w3 h4 refcount5 ->
            HasCField.writeRaw (BG.Proxy @"format") ptr0 format2
              >> HasCField.writeRaw (BG.Proxy @"w") ptr0 w3
              >> HasCField.writeRaw (BG.Proxy @"h") ptr0 h4
              >> HasCField.writeRaw (BG.Proxy @"refcount") ptr0 refcount5

deriving via Marshal.EquivStorable SDL_Texture instance BG.Storable SDL_Texture

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat)
  => BG.CompatHasField.HasField "format" SDL_Texture ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Texture
            { format = y1
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , refcount = BG.getField @"refcount" x0
            }
      , BG.getField @"format" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat)
  => BG.HasField "format" (BG.Ptr SDL_Texture) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField SDL_Texture "format" where
  type
    CFieldType SDL_Texture "format" =
      SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat

  offset# = \_ -> \_ -> 0

instance (ty ~ BG.CInt) => BG.CompatHasField.HasField "w" SDL_Texture ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Texture
            { w = y1
            , format = BG.getField @"format" x0
            , h = BG.getField @"h" x0
            , refcount = BG.getField @"refcount" x0
            }
      , BG.getField @"w" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "w" (BG.Ptr SDL_Texture) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"w")

instance HasCField.HasCField SDL_Texture "w" where
  type CFieldType SDL_Texture "w" = BG.CInt

  offset# = \_ -> \_ -> 4

instance (ty ~ BG.CInt) => BG.CompatHasField.HasField "h" SDL_Texture ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Texture
            { h = y1
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , refcount = BG.getField @"refcount" x0
            }
      , BG.getField @"h" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "h" (BG.Ptr SDL_Texture) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"h")

instance HasCField.HasCField SDL_Texture "h" where
  type CFieldType SDL_Texture "h" = BG.CInt

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "refcount" SDL_Texture ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Texture
            { refcount = y1
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"refcount" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "refcount" (BG.Ptr SDL_Texture) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"refcount")

instance HasCField.HasCField SDL_Texture "refcount" where
  type CFieldType SDL_Texture "refcount" = BG.CInt

  offset# = \_ -> \_ -> 12

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_NAME_STRING@, literal @\"SDL.renderer.create.name\"@, defined at @SDL3\/SDL_render.h 339:9@
sDL_PROP_RENDERER_CREATE_NAME_STRING :: BG.ByteString
sDL_PROP_RENDERER_CREATE_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_WINDOW_POINTER@, literal @\"SDL.renderer.create.window\"@, defined at @SDL3\/SDL_render.h 340:9@
sDL_PROP_RENDERER_CREATE_WINDOW_POINTER :: BG.ByteString
sDL_PROP_RENDERER_CREATE_WINDOW_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_SURFACE_POINTER@, literal @\"SDL.renderer.create.surface\"@, defined at @SDL3\/SDL_render.h 341:9@
sDL_PROP_RENDERER_CREATE_SURFACE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_CREATE_SURFACE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER@, literal @\"SDL.renderer.create.output_colorspace\"@, defined at @SDL3\/SDL_render.h 342:9@
sDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER :: BG.ByteString
sDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6F
    , 0x75
    , 0x74
    , 0x70
    , 0x75
    , 0x74
    , 0x5F
    , 0x63
    , 0x6F
    , 0x6C
    , 0x6F
    , 0x72
    , 0x73
    , 0x70
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER@, literal @\"SDL.renderer.create.present_vsync\"@, defined at @SDL3\/SDL_render.h 343:9@
sDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER :: BG.ByteString
sDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x70
    , 0x72
    , 0x65
    , 0x73
    , 0x65
    , 0x6E
    , 0x74
    , 0x5F
    , 0x76
    , 0x73
    , 0x79
    , 0x6E
    , 0x63
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_GPU_DEVICE_POINTER@, literal @\"SDL.renderer.create.gpu.device\"@, defined at @SDL3\/SDL_render.h 344:9@
sDL_PROP_RENDERER_CREATE_GPU_DEVICE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_CREATE_GPU_DEVICE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN@, literal @\"SDL.renderer.create.gpu.shaders_spirv\"@, defined at @SDL3\/SDL_render.h 345:9@
sDL_PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN :: BG.ByteString
sDL_PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x73
    , 0x68
    , 0x61
    , 0x64
    , 0x65
    , 0x72
    , 0x73
    , 0x5F
    , 0x73
    , 0x70
    , 0x69
    , 0x72
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN@, literal @\"SDL.renderer.create.gpu.shaders_dxil\"@, defined at @SDL3\/SDL_render.h 346:9@
sDL_PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN :: BG.ByteString
sDL_PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x73
    , 0x68
    , 0x61
    , 0x64
    , 0x65
    , 0x72
    , 0x73
    , 0x5F
    , 0x64
    , 0x78
    , 0x69
    , 0x6C
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN@, literal @\"SDL.renderer.create.gpu.shaders_msl\"@, defined at @SDL3\/SDL_render.h 347:9@
sDL_PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN :: BG.ByteString
sDL_PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x73
    , 0x68
    , 0x61
    , 0x64
    , 0x65
    , 0x72
    , 0x73
    , 0x5F
    , 0x6D
    , 0x73
    , 0x6C
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER@, literal @\"SDL.renderer.create.vulkan.instance\"@, defined at @SDL3\/SDL_render.h 348:9@
sDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x69
    , 0x6E
    , 0x73
    , 0x74
    , 0x61
    , 0x6E
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER@, literal @\"SDL.renderer.create.vulkan.surface\"@, defined at @SDL3\/SDL_render.h 349:9@
sDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER :: BG.ByteString
sDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER@, literal @\"SDL.renderer.create.vulkan.physical_device\"@, defined at @SDL3\/SDL_render.h 350:9@
sDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x70
    , 0x68
    , 0x79
    , 0x73
    , 0x69
    , 0x63
    , 0x61
    , 0x6C
    , 0x5F
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER@, literal @\"SDL.renderer.create.vulkan.device\"@, defined at @SDL3\/SDL_render.h 351:9@
sDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER@, literal @\"SDL.renderer.create.vulkan.graphics_queue_family_index\"@, defined at @SDL3\/SDL_render.h 352:9@
sDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER :: BG.ByteString
sDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x67
    , 0x72
    , 0x61
    , 0x70
    , 0x68
    , 0x69
    , 0x63
    , 0x73
    , 0x5F
    , 0x71
    , 0x75
    , 0x65
    , 0x75
    , 0x65
    , 0x5F
    , 0x66
    , 0x61
    , 0x6D
    , 0x69
    , 0x6C
    , 0x79
    , 0x5F
    , 0x69
    , 0x6E
    , 0x64
    , 0x65
    , 0x78
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER@, literal @\"SDL.renderer.create.vulkan.present_queue_family_index\"@, defined at @SDL3\/SDL_render.h 353:9@
sDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER :: BG.ByteString
sDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x70
    , 0x72
    , 0x65
    , 0x73
    , 0x65
    , 0x6E
    , 0x74
    , 0x5F
    , 0x71
    , 0x75
    , 0x65
    , 0x75
    , 0x65
    , 0x5F
    , 0x66
    , 0x61
    , 0x6D
    , 0x69
    , 0x6C
    , 0x79
    , 0x5F
    , 0x69
    , 0x6E
    , 0x64
    , 0x65
    , 0x78
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_NAME_STRING@, literal @\"SDL.renderer.name\"@, defined at @SDL3\/SDL_render.h 553:9@
sDL_PROP_RENDERER_NAME_STRING :: BG.ByteString
sDL_PROP_RENDERER_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_WINDOW_POINTER@, literal @\"SDL.renderer.window\"@, defined at @SDL3\/SDL_render.h 554:9@
sDL_PROP_RENDERER_WINDOW_POINTER :: BG.ByteString
sDL_PROP_RENDERER_WINDOW_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_SURFACE_POINTER@, literal @\"SDL.renderer.surface\"@, defined at @SDL3\/SDL_render.h 555:9@
sDL_PROP_RENDERER_SURFACE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_SURFACE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_VSYNC_NUMBER@, literal @\"SDL.renderer.vsync\"@, defined at @SDL3\/SDL_render.h 556:9@
sDL_PROP_RENDERER_VSYNC_NUMBER :: BG.ByteString
sDL_PROP_RENDERER_VSYNC_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x76
    , 0x73
    , 0x79
    , 0x6E
    , 0x63
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER@, literal @\"SDL.renderer.max_texture_size\"@, defined at @SDL3\/SDL_render.h 557:9@
sDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER :: BG.ByteString
sDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x6D
    , 0x61
    , 0x78
    , 0x5F
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x73
    , 0x69
    , 0x7A
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER@, literal @\"SDL.renderer.texture_formats\"@, defined at @SDL3\/SDL_render.h 558:9@
sDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER :: BG.ByteString
sDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x66
    , 0x6F
    , 0x72
    , 0x6D
    , 0x61
    , 0x74
    , 0x73
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN@, literal @\"SDL.renderer.texture_wrapping\"@, defined at @SDL3\/SDL_render.h 559:9@
sDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN :: BG.ByteString
sDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x77
    , 0x72
    , 0x61
    , 0x70
    , 0x70
    , 0x69
    , 0x6E
    , 0x67
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER@, literal @\"SDL.renderer.output_colorspace\"@, defined at @SDL3\/SDL_render.h 560:9@
sDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER :: BG.ByteString
sDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x6F
    , 0x75
    , 0x74
    , 0x70
    , 0x75
    , 0x74
    , 0x5F
    , 0x63
    , 0x6F
    , 0x6C
    , 0x6F
    , 0x72
    , 0x73
    , 0x70
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN@, literal @\"SDL.renderer.HDR_enabled\"@, defined at @SDL3\/SDL_render.h 561:9@
sDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN :: BG.ByteString
sDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x48
    , 0x44
    , 0x52
    , 0x5F
    , 0x65
    , 0x6E
    , 0x61
    , 0x62
    , 0x6C
    , 0x65
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT@, literal @\"SDL.renderer.SDR_white_point\"@, defined at @SDL3\/SDL_render.h 562:9@
sDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT :: BG.ByteString
sDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x53
    , 0x44
    , 0x52
    , 0x5F
    , 0x77
    , 0x68
    , 0x69
    , 0x74
    , 0x65
    , 0x5F
    , 0x70
    , 0x6F
    , 0x69
    , 0x6E
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT@, literal @\"SDL.renderer.HDR_headroom\"@, defined at @SDL3\/SDL_render.h 563:9@
sDL_PROP_RENDERER_HDR_HEADROOM_FLOAT :: BG.ByteString
sDL_PROP_RENDERER_HDR_HEADROOM_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x48
    , 0x44
    , 0x52
    , 0x5F
    , 0x68
    , 0x65
    , 0x61
    , 0x64
    , 0x72
    , 0x6F
    , 0x6F
    , 0x6D
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_D3D9_DEVICE_POINTER@, literal @\"SDL.renderer.d3d9.device\"@, defined at @SDL3\/SDL_render.h 564:9@
sDL_PROP_RENDERER_D3D9_DEVICE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_D3D9_DEVICE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x39
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_D3D11_DEVICE_POINTER@, literal @\"SDL.renderer.d3d11.device\"@, defined at @SDL3\/SDL_render.h 565:9@
sDL_PROP_RENDERER_D3D11_DEVICE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_D3D11_DEVICE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x31
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER@, literal @\"SDL.renderer.d3d11.swap_chain\"@, defined at @SDL3\/SDL_render.h 566:9@
sDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER :: BG.ByteString
sDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x31
    , 0x2E
    , 0x73
    , 0x77
    , 0x61
    , 0x70
    , 0x5F
    , 0x63
    , 0x68
    , 0x61
    , 0x69
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_D3D12_DEVICE_POINTER@, literal @\"SDL.renderer.d3d12.device\"@, defined at @SDL3\/SDL_render.h 567:9@
sDL_PROP_RENDERER_D3D12_DEVICE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_D3D12_DEVICE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER@, literal @\"SDL.renderer.d3d12.swap_chain\"@, defined at @SDL3\/SDL_render.h 568:9@
sDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER :: BG.ByteString
sDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x73
    , 0x77
    , 0x61
    , 0x70
    , 0x5F
    , 0x63
    , 0x68
    , 0x61
    , 0x69
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER@, literal @\"SDL.renderer.d3d12.command_queue\"@, defined at @SDL3\/SDL_render.h 569:9@
sDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x63
    , 0x6F
    , 0x6D
    , 0x6D
    , 0x61
    , 0x6E
    , 0x64
    , 0x5F
    , 0x71
    , 0x75
    , 0x65
    , 0x75
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER@, literal @\"SDL.renderer.vulkan.instance\"@, defined at @SDL3\/SDL_render.h 570:9@
sDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x69
    , 0x6E
    , 0x73
    , 0x74
    , 0x61
    , 0x6E
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER@, literal @\"SDL.renderer.vulkan.surface\"@, defined at @SDL3\/SDL_render.h 571:9@
sDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER :: BG.ByteString
sDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER@, literal @\"SDL.renderer.vulkan.physical_device\"@, defined at @SDL3\/SDL_render.h 572:9@
sDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x70
    , 0x68
    , 0x79
    , 0x73
    , 0x69
    , 0x63
    , 0x61
    , 0x6C
    , 0x5F
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER@, literal @\"SDL.renderer.vulkan.device\"@, defined at @SDL3\/SDL_render.h 573:9@
sDL_PROP_RENDERER_VULKAN_DEVICE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_VULKAN_DEVICE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER@, literal @\"SDL.renderer.vulkan.graphics_queue_family_index\"@, defined at @SDL3\/SDL_render.h 574:9@
sDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER :: BG.ByteString
sDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x67
    , 0x72
    , 0x61
    , 0x70
    , 0x68
    , 0x69
    , 0x63
    , 0x73
    , 0x5F
    , 0x71
    , 0x75
    , 0x65
    , 0x75
    , 0x65
    , 0x5F
    , 0x66
    , 0x61
    , 0x6D
    , 0x69
    , 0x6C
    , 0x79
    , 0x5F
    , 0x69
    , 0x6E
    , 0x64
    , 0x65
    , 0x78
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER@, literal @\"SDL.renderer.vulkan.present_queue_family_index\"@, defined at @SDL3\/SDL_render.h 575:9@
sDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER :: BG.ByteString
sDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x70
    , 0x72
    , 0x65
    , 0x73
    , 0x65
    , 0x6E
    , 0x74
    , 0x5F
    , 0x71
    , 0x75
    , 0x65
    , 0x75
    , 0x65
    , 0x5F
    , 0x66
    , 0x61
    , 0x6D
    , 0x69
    , 0x6C
    , 0x79
    , 0x5F
    , 0x69
    , 0x6E
    , 0x64
    , 0x65
    , 0x78
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER@, literal @\"SDL.renderer.vulkan.swapchain_image_count\"@, defined at @SDL3\/SDL_render.h 576:9@
sDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER :: BG.ByteString
sDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x73
    , 0x77
    , 0x61
    , 0x70
    , 0x63
    , 0x68
    , 0x61
    , 0x69
    , 0x6E
    , 0x5F
    , 0x69
    , 0x6D
    , 0x61
    , 0x67
    , 0x65
    , 0x5F
    , 0x63
    , 0x6F
    , 0x75
    , 0x6E
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_RENDERER_GPU_DEVICE_POINTER@, literal @\"SDL.renderer.gpu.device\"@, defined at @SDL3\/SDL_render.h 577:9@
sDL_PROP_RENDERER_GPU_DEVICE_POINTER :: BG.ByteString
sDL_PROP_RENDERER_GPU_DEVICE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x65
    , 0x72
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER@, literal @\"SDL.texture.create.colorspace\"@, defined at @SDL3\/SDL_render.h 808:9@
sDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x63
    , 0x6F
    , 0x6C
    , 0x6F
    , 0x72
    , 0x73
    , 0x70
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER@, literal @\"SDL.texture.create.format\"@, defined at @SDL3\/SDL_render.h 809:9@
sDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x66
    , 0x6F
    , 0x72
    , 0x6D
    , 0x61
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER@, literal @\"SDL.texture.create.access\"@, defined at @SDL3\/SDL_render.h 810:9@
sDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x61
    , 0x63
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER@, literal @\"SDL.texture.create.width\"@, defined at @SDL3\/SDL_render.h 811:9@
sDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x77
    , 0x69
    , 0x64
    , 0x74
    , 0x68
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER@, literal @\"SDL.texture.create.height\"@, defined at @SDL3\/SDL_render.h 812:9@
sDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x68
    , 0x65
    , 0x69
    , 0x67
    , 0x68
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_PALETTE_POINTER@, literal @\"SDL.texture.create.palette\"@, defined at @SDL3\/SDL_render.h 813:9@
sDL_PROP_TEXTURE_CREATE_PALETTE_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_PALETTE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x70
    , 0x61
    , 0x6C
    , 0x65
    , 0x74
    , 0x74
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT@, literal @\"SDL.texture.create.SDR_white_point\"@, defined at @SDL3\/SDL_render.h 814:9@
sDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x53
    , 0x44
    , 0x52
    , 0x5F
    , 0x77
    , 0x68
    , 0x69
    , 0x74
    , 0x65
    , 0x5F
    , 0x70
    , 0x6F
    , 0x69
    , 0x6E
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT@, literal @\"SDL.texture.create.HDR_headroom\"@, defined at @SDL3\/SDL_render.h 815:9@
sDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x48
    , 0x44
    , 0x52
    , 0x5F
    , 0x68
    , 0x65
    , 0x61
    , 0x64
    , 0x72
    , 0x6F
    , 0x6F
    , 0x6D
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER@, literal @\"SDL.texture.create.d3d11.texture\"@, defined at @SDL3\/SDL_render.h 816:9@
sDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x31
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER@, literal @\"SDL.texture.create.d3d11.texture_u\"@, defined at @SDL3\/SDL_render.h 817:9@
sDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x31
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER@, literal @\"SDL.texture.create.d3d11.texture_v\"@, defined at @SDL3\/SDL_render.h 818:9@
sDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x31
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER@, literal @\"SDL.texture.create.d3d12.texture\"@, defined at @SDL3\/SDL_render.h 819:9@
sDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER@, literal @\"SDL.texture.create.d3d12.texture_u\"@, defined at @SDL3\/SDL_render.h 820:9@
sDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER@, literal @\"SDL.texture.create.d3d12.texture_v\"@, defined at @SDL3\/SDL_render.h 821:9@
sDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER@, literal @\"SDL.texture.create.metal.pixelbuffer\"@, defined at @SDL3\/SDL_render.h 822:9@
sDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x6C
    , 0x2E
    , 0x70
    , 0x69
    , 0x78
    , 0x65
    , 0x6C
    , 0x62
    , 0x75
    , 0x66
    , 0x66
    , 0x65
    , 0x72
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER@, literal @\"SDL.texture.create.opengl.texture\"@, defined at @SDL3\/SDL_render.h 823:9@
sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER@, literal @\"SDL.texture.create.opengl.texture_uv\"@, defined at @SDL3\/SDL_render.h 824:9@
sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER@, literal @\"SDL.texture.create.opengl.texture_u\"@, defined at @SDL3\/SDL_render.h 825:9@
sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER@, literal @\"SDL.texture.create.opengl.texture_v\"@, defined at @SDL3\/SDL_render.h 826:9@
sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER@, literal @\"SDL.texture.create.opengles2.texture\"@, defined at @SDL3\/SDL_render.h 827:9@
sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x65
    , 0x73
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER@, literal @\"SDL.texture.create.opengles2.texture_uv\"@, defined at @SDL3\/SDL_render.h 828:9@
sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x65
    , 0x73
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER@, literal @\"SDL.texture.create.opengles2.texture_u\"@, defined at @SDL3\/SDL_render.h 829:9@
sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x65
    , 0x73
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER@, literal @\"SDL.texture.create.opengles2.texture_v\"@, defined at @SDL3\/SDL_render.h 830:9@
sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x65
    , 0x73
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER@, literal @\"SDL.texture.create.vulkan.texture\"@, defined at @SDL3\/SDL_render.h 831:9@
sDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_VULKAN_LAYOUT_NUMBER@, literal @\"SDL.texture.create.vulkan.layout\"@, defined at @SDL3\/SDL_render.h 832:9@
sDL_PROP_TEXTURE_CREATE_VULKAN_LAYOUT_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_VULKAN_LAYOUT_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x6C
    , 0x61
    , 0x79
    , 0x6F
    , 0x75
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER@, literal @\"SDL.texture.create.gpu.texture\"@, defined at @SDL3\/SDL_render.h 833:9@
sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_POINTER@, literal @\"SDL.texture.create.gpu.texture_uv\"@, defined at @SDL3\/SDL_render.h 834:9@
sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_U_POINTER@, literal @\"SDL.texture.create.gpu.texture_u\"@, defined at @SDL3\/SDL_render.h 835:9@
sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_U_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_U_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_V_POINTER@, literal @\"SDL.texture.create.gpu.texture_v\"@, defined at @SDL3\/SDL_render.h 836:9@
sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_V_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_V_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_COLORSPACE_NUMBER@, literal @\"SDL.texture.colorspace\"@, defined at @SDL3\/SDL_render.h 937:9@
sDL_PROP_TEXTURE_COLORSPACE_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_COLORSPACE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x6F
    , 0x6C
    , 0x6F
    , 0x72
    , 0x73
    , 0x70
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_FORMAT_NUMBER@, literal @\"SDL.texture.format\"@, defined at @SDL3\/SDL_render.h 938:9@
sDL_PROP_TEXTURE_FORMAT_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_FORMAT_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x66
    , 0x6F
    , 0x72
    , 0x6D
    , 0x61
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_ACCESS_NUMBER@, literal @\"SDL.texture.access\"@, defined at @SDL3\/SDL_render.h 939:9@
sDL_PROP_TEXTURE_ACCESS_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_ACCESS_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x61
    , 0x63
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_WIDTH_NUMBER@, literal @\"SDL.texture.width\"@, defined at @SDL3\/SDL_render.h 940:9@
sDL_PROP_TEXTURE_WIDTH_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_WIDTH_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x77
    , 0x69
    , 0x64
    , 0x74
    , 0x68
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_HEIGHT_NUMBER@, literal @\"SDL.texture.height\"@, defined at @SDL3\/SDL_render.h 941:9@
sDL_PROP_TEXTURE_HEIGHT_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_HEIGHT_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x68
    , 0x65
    , 0x69
    , 0x67
    , 0x68
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT@, literal @\"SDL.texture.SDR_white_point\"@, defined at @SDL3\/SDL_render.h 942:9@
sDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT :: BG.ByteString
sDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x53
    , 0x44
    , 0x52
    , 0x5F
    , 0x77
    , 0x68
    , 0x69
    , 0x74
    , 0x65
    , 0x5F
    , 0x70
    , 0x6F
    , 0x69
    , 0x6E
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT@, literal @\"SDL.texture.HDR_headroom\"@, defined at @SDL3\/SDL_render.h 943:9@
sDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT :: BG.ByteString
sDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x48
    , 0x44
    , 0x52
    , 0x5F
    , 0x68
    , 0x65
    , 0x61
    , 0x64
    , 0x72
    , 0x6F
    , 0x6F
    , 0x6D
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER@, literal @\"SDL.texture.d3d11.texture\"@, defined at @SDL3\/SDL_render.h 944:9@
sDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x31
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER@, literal @\"SDL.texture.d3d11.texture_u\"@, defined at @SDL3\/SDL_render.h 945:9@
sDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x31
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER@, literal @\"SDL.texture.d3d11.texture_v\"@, defined at @SDL3\/SDL_render.h 946:9@
sDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x31
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER@, literal @\"SDL.texture.d3d12.texture\"@, defined at @SDL3\/SDL_render.h 947:9@
sDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER@, literal @\"SDL.texture.d3d12.texture_u\"@, defined at @SDL3\/SDL_render.h 948:9@
sDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER@, literal @\"SDL.texture.d3d12.texture_v\"@, defined at @SDL3\/SDL_render.h 949:9@
sDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER@, literal @\"SDL.texture.opengl.texture\"@, defined at @SDL3\/SDL_render.h 950:9@
sDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER@, literal @\"SDL.texture.opengl.texture_uv\"@, defined at @SDL3\/SDL_render.h 951:9@
sDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER@, literal @\"SDL.texture.opengl.texture_u\"@, defined at @SDL3\/SDL_render.h 952:9@
sDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER@, literal @\"SDL.texture.opengl.texture_v\"@, defined at @SDL3\/SDL_render.h 953:9@
sDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER@, literal @\"SDL.texture.opengl.target\"@, defined at @SDL3\/SDL_render.h 954:9@
sDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x74
    , 0x61
    , 0x72
    , 0x67
    , 0x65
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT@, literal @\"SDL.texture.opengl.tex_w\"@, defined at @SDL3\/SDL_render.h 955:9@
sDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT :: BG.ByteString
sDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x5F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT@, literal @\"SDL.texture.opengl.tex_h\"@, defined at @SDL3\/SDL_render.h 956:9@
sDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT :: BG.ByteString
sDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x5F
    , 0x68
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER@, literal @\"SDL.texture.opengles2.texture\"@, defined at @SDL3\/SDL_render.h 957:9@
sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x65
    , 0x73
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER@, literal @\"SDL.texture.opengles2.texture_uv\"@, defined at @SDL3\/SDL_render.h 958:9@
sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x65
    , 0x73
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER@, literal @\"SDL.texture.opengles2.texture_u\"@, defined at @SDL3\/SDL_render.h 959:9@
sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x65
    , 0x73
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER@, literal @\"SDL.texture.opengles2.texture_v\"@, defined at @SDL3\/SDL_render.h 960:9@
sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x65
    , 0x73
    , 0x32
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER@, literal @\"SDL.texture.opengles2.target\"@, defined at @SDL3\/SDL_render.h 961:9@
sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x65
    , 0x73
    , 0x32
    , 0x2E
    , 0x74
    , 0x61
    , 0x72
    , 0x67
    , 0x65
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER@, literal @\"SDL.texture.vulkan.texture\"@, defined at @SDL3\/SDL_render.h 962:9@
sDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER :: BG.ByteString
sDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_GPU_TEXTURE_POINTER@, literal @\"SDL.texture.gpu.texture\"@, defined at @SDL3\/SDL_render.h 963:9@
sDL_PROP_TEXTURE_GPU_TEXTURE_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_GPU_TEXTURE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_GPU_TEXTURE_UV_POINTER@, literal @\"SDL.texture.gpu.texture_uv\"@, defined at @SDL3\/SDL_render.h 964:9@
sDL_PROP_TEXTURE_GPU_TEXTURE_UV_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_GPU_TEXTURE_UV_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_GPU_TEXTURE_U_POINTER@, literal @\"SDL.texture.gpu.texture_u\"@, defined at @SDL3\/SDL_render.h 965:9@
sDL_PROP_TEXTURE_GPU_TEXTURE_U_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_GPU_TEXTURE_U_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x75
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTURE_GPU_TEXTURE_V_POINTER@, literal @\"SDL.texture.gpu.texture_v\"@, defined at @SDL3\/SDL_render.h 966:9@
sDL_PROP_TEXTURE_GPU_TEXTURE_V_POINTER :: BG.ByteString
sDL_PROP_TEXTURE_GPU_TEXTURE_V_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x5F
    , 0x76
    ]

-- | [C declaration]: @macro SDL_RENDERER_VSYNC_DISABLED@, defined at @SDL3\/SDL_render.h 2782:9@
sDL_RENDERER_VSYNC_DISABLED :: BG.CInt
sDL_RENDERER_VSYNC_DISABLED = (0 :: BG.CInt)

-- | [C declaration]: @macro SDL_RENDERER_VSYNC_ADAPTIVE@, defined at @SDL3\/SDL_render.h 2783:9@
sDL_RENDERER_VSYNC_ADAPTIVE :: BG.CInt
sDL_RENDERER_VSYNC_ADAPTIVE =
  C.Expr.HostPlatform.negate (1 :: BG.CInt)

-- | The size, in pixels, of a single @SDL_RenderDebugText()@ character.
--
--     The font is monospaced and square, so this applies to all characters.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderDebugText'
--
--     [C declaration]: @macro SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE@, defined at @SDL3\/SDL_render.h 2811:9@
sDL_DEBUG_TEXT_FONT_CHARACTER_SIZE :: BG.CInt
sDL_DEBUG_TEXT_FONT_CHARACTER_SIZE = (8 :: BG.CInt)

-- | A structure specifying the parameters of a GPU render state.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_CreateGPURenderState'
--
--     [C declaration]: @struct SDL_GPURenderStateCreateInfo@, defined at @SDL3\/SDL_render.h 2925:16@
data SDL_GPURenderStateCreateInfo = SDL_GPURenderStateCreateInfo
  { fragment_shader :: BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUShader
  -- ^ The fragment shader to use when this render state is active
  --
  --          [C declaration]: @fragment_shader@, defined at @SDL3\/SDL_render.h 2927:20@
  , num_sampler_bindings :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The number of additional fragment samplers to bind when this render state is active
  --
  --          [C declaration]: @num_sampler_bindings@, defined at @SDL3\/SDL_render.h 2929:12@
  , sampler_bindings :: PtrConst.PtrConst SDL3.Sys.Bindgen.Gpu.SDL_GPUTextureSamplerBinding
  -- ^ Additional fragment samplers to bind when this render state is active
  --
  --          [C declaration]: @sampler_bindings@, defined at @SDL3\/SDL_render.h 2930:41@
  , num_storage_textures :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The number of storage textures to bind when this render state is active
  --
  --          [C declaration]: @num_storage_textures@, defined at @SDL3\/SDL_render.h 2932:12@
  , storage_textures :: PtrConst.PtrConst (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUTexture)
  -- ^ Storage textures to bind when this render state is active
  --
  --          [C declaration]: @storage_textures@, defined at @SDL3\/SDL_render.h 2933:28@
  , num_storage_buffers :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The number of storage buffers to bind when this render state is active
  --
  --          [C declaration]: @num_storage_buffers@, defined at @SDL3\/SDL_render.h 2935:12@
  , storage_buffers :: PtrConst.PtrConst (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUBuffer)
  -- ^ Storage buffers to bind when this render state is active
  --
  --          [C declaration]: @storage_buffers@, defined at @SDL3\/SDL_render.h 2936:27@
  , props :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^ A properties ID for extensions. Should be 0 if no extensions are needed.
  --
  --          [C declaration]: @props@, defined at @SDL3\/SDL_render.h 2938:22@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPURenderStateCreateInfo where
  staticSizeOf = \_ -> (64 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPURenderStateCreateInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPURenderStateCreateInfo
        <*> HasCField.readRaw (BG.Proxy @"fragment_shader") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_sampler_bindings") ptr0
        <*> HasCField.readRaw (BG.Proxy @"sampler_bindings") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_storage_textures") ptr0
        <*> HasCField.readRaw (BG.Proxy @"storage_textures") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_storage_buffers") ptr0
        <*> HasCField.readRaw (BG.Proxy @"storage_buffers") ptr0
        <*> HasCField.readRaw (BG.Proxy @"props") ptr0

instance Marshal.WriteRaw SDL_GPURenderStateCreateInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPURenderStateCreateInfo
            fragment_shader2
            num_sampler_bindings3
            sampler_bindings4
            num_storage_textures5
            storage_textures6
            num_storage_buffers7
            storage_buffers8
            props9 ->
              HasCField.writeRaw (BG.Proxy @"fragment_shader") ptr0 fragment_shader2
                >> HasCField.writeRaw (BG.Proxy @"num_sampler_bindings") ptr0 num_sampler_bindings3
                >> HasCField.writeRaw (BG.Proxy @"sampler_bindings") ptr0 sampler_bindings4
                >> HasCField.writeRaw (BG.Proxy @"num_storage_textures") ptr0 num_storage_textures5
                >> HasCField.writeRaw (BG.Proxy @"storage_textures") ptr0 storage_textures6
                >> HasCField.writeRaw (BG.Proxy @"num_storage_buffers") ptr0 num_storage_buffers7
                >> HasCField.writeRaw (BG.Proxy @"storage_buffers") ptr0 storage_buffers8
                >> HasCField.writeRaw (BG.Proxy @"props") ptr0 props9

deriving via
  Marshal.EquivStorable SDL_GPURenderStateCreateInfo
  instance
    BG.Storable SDL_GPURenderStateCreateInfo

instance
  (ty ~ BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUShader)
  => BG.CompatHasField.HasField "fragment_shader" SDL_GPURenderStateCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURenderStateCreateInfo
            { fragment_shader = y1
            , num_sampler_bindings = BG.getField @"num_sampler_bindings" x0
            , sampler_bindings = BG.getField @"sampler_bindings" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , storage_textures = BG.getField @"storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , storage_buffers = BG.getField @"storage_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"fragment_shader" x0
      )

instance
  (ty ~ BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUShader)
  => BG.HasField "fragment_shader" (BG.Ptr SDL_GPURenderStateCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"fragment_shader")

instance HasCField.HasCField SDL_GPURenderStateCreateInfo "fragment_shader" where
  type
    CFieldType SDL_GPURenderStateCreateInfo "fragment_shader" =
      BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUShader

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "num_sampler_bindings" SDL_GPURenderStateCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURenderStateCreateInfo
            { num_sampler_bindings = y1
            , fragment_shader = BG.getField @"fragment_shader" x0
            , sampler_bindings = BG.getField @"sampler_bindings" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , storage_textures = BG.getField @"storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , storage_buffers = BG.getField @"storage_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_sampler_bindings" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "num_sampler_bindings" (BG.Ptr SDL_GPURenderStateCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_sampler_bindings")

instance HasCField.HasCField SDL_GPURenderStateCreateInfo "num_sampler_bindings" where
  type
    CFieldType SDL_GPURenderStateCreateInfo "num_sampler_bindings" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ PtrConst.PtrConst SDL3.Sys.Bindgen.Gpu.SDL_GPUTextureSamplerBinding)
  => BG.CompatHasField.HasField "sampler_bindings" SDL_GPURenderStateCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURenderStateCreateInfo
            { sampler_bindings = y1
            , fragment_shader = BG.getField @"fragment_shader" x0
            , num_sampler_bindings = BG.getField @"num_sampler_bindings" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , storage_textures = BG.getField @"storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , storage_buffers = BG.getField @"storage_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"sampler_bindings" x0
      )

instance
  (ty ~ PtrConst.PtrConst SDL3.Sys.Bindgen.Gpu.SDL_GPUTextureSamplerBinding)
  => BG.HasField "sampler_bindings" (BG.Ptr SDL_GPURenderStateCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"sampler_bindings")

instance HasCField.HasCField SDL_GPURenderStateCreateInfo "sampler_bindings" where
  type
    CFieldType SDL_GPURenderStateCreateInfo "sampler_bindings" =
      PtrConst.PtrConst SDL3.Sys.Bindgen.Gpu.SDL_GPUTextureSamplerBinding

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "num_storage_textures" SDL_GPURenderStateCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURenderStateCreateInfo
            { num_storage_textures = y1
            , fragment_shader = BG.getField @"fragment_shader" x0
            , num_sampler_bindings = BG.getField @"num_sampler_bindings" x0
            , sampler_bindings = BG.getField @"sampler_bindings" x0
            , storage_textures = BG.getField @"storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , storage_buffers = BG.getField @"storage_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_storage_textures" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "num_storage_textures" (BG.Ptr SDL_GPURenderStateCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_storage_textures")

instance HasCField.HasCField SDL_GPURenderStateCreateInfo "num_storage_textures" where
  type
    CFieldType SDL_GPURenderStateCreateInfo "num_storage_textures" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 24

instance
  (ty ~ PtrConst.PtrConst (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUTexture))
  => BG.CompatHasField.HasField "storage_textures" SDL_GPURenderStateCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURenderStateCreateInfo
            { storage_textures = y1
            , fragment_shader = BG.getField @"fragment_shader" x0
            , num_sampler_bindings = BG.getField @"num_sampler_bindings" x0
            , sampler_bindings = BG.getField @"sampler_bindings" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , storage_buffers = BG.getField @"storage_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"storage_textures" x0
      )

instance
  (ty ~ PtrConst.PtrConst (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUTexture))
  => BG.HasField "storage_textures" (BG.Ptr SDL_GPURenderStateCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"storage_textures")

instance HasCField.HasCField SDL_GPURenderStateCreateInfo "storage_textures" where
  type
    CFieldType SDL_GPURenderStateCreateInfo "storage_textures" =
      PtrConst.PtrConst (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUTexture)

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "num_storage_buffers" SDL_GPURenderStateCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURenderStateCreateInfo
            { num_storage_buffers = y1
            , fragment_shader = BG.getField @"fragment_shader" x0
            , num_sampler_bindings = BG.getField @"num_sampler_bindings" x0
            , sampler_bindings = BG.getField @"sampler_bindings" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , storage_textures = BG.getField @"storage_textures" x0
            , storage_buffers = BG.getField @"storage_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_storage_buffers" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "num_storage_buffers" (BG.Ptr SDL_GPURenderStateCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_storage_buffers")

instance HasCField.HasCField SDL_GPURenderStateCreateInfo "num_storage_buffers" where
  type
    CFieldType SDL_GPURenderStateCreateInfo "num_storage_buffers" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 40

instance
  (ty ~ PtrConst.PtrConst (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUBuffer))
  => BG.CompatHasField.HasField "storage_buffers" SDL_GPURenderStateCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURenderStateCreateInfo
            { storage_buffers = y1
            , fragment_shader = BG.getField @"fragment_shader" x0
            , num_sampler_bindings = BG.getField @"num_sampler_bindings" x0
            , sampler_bindings = BG.getField @"sampler_bindings" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , storage_textures = BG.getField @"storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"storage_buffers" x0
      )

instance
  (ty ~ PtrConst.PtrConst (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUBuffer))
  => BG.HasField "storage_buffers" (BG.Ptr SDL_GPURenderStateCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"storage_buffers")

instance HasCField.HasCField SDL_GPURenderStateCreateInfo "storage_buffers" where
  type
    CFieldType SDL_GPURenderStateCreateInfo "storage_buffers" =
      PtrConst.PtrConst (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUBuffer)

  offset# = \_ -> \_ -> 48

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.CompatHasField.HasField "props" SDL_GPURenderStateCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURenderStateCreateInfo
            { props = y1
            , fragment_shader = BG.getField @"fragment_shader" x0
            , num_sampler_bindings = BG.getField @"num_sampler_bindings" x0
            , sampler_bindings = BG.getField @"sampler_bindings" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , storage_textures = BG.getField @"storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , storage_buffers = BG.getField @"storage_buffers" x0
            }
      , BG.getField @"props" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.HasField "props" (BG.Ptr SDL_GPURenderStateCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"props")

instance HasCField.HasCField SDL_GPURenderStateCreateInfo "props" where
  type
    CFieldType SDL_GPURenderStateCreateInfo "props" =
      SDL3.Sys.Bindgen.Properties.SDL_PropertiesID

  offset# = \_ -> \_ -> 56

-- | A custom GPU render state.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_CreateGPURenderState', 'sDL_SetGPURenderStateFragmentUniforms', 'sDL_SetGPURenderState', 'sDL_DestroyGPURenderState'
--
--     [C declaration]: @struct SDL_GPURenderState@, defined at @SDL3\/SDL_render.h 2951:16@
data SDL_GPURenderState

{-# LANGUAGE PatternSynonyms #-}

-- | Blend modes decide how two colors will mix together. There are both standard modes for basic needs and a means to create custom modes, dictating what sort of math to do on what color components. A set of blend modes used in drawing operations.
--
--     These predefined blend modes are supported everywhere.
--
--     Additional values may be obtained from 'composeCustomBlendMode'.
--
--     @since 3.2.0
--
--     [See also]: 'composeCustomBlendMode'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Blendmode.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Blendmode (
  module SDL3.Sys.Bindgen.Blendmode,

  -- * Typed constants
  pattern SDL3.Sys.Blendmode.SDL_BLENDMODE_NONE,
  pattern SDL3.Sys.Blendmode.SDL_BLENDMODE_BLEND,
  pattern SDL3.Sys.Blendmode.SDL_BLENDMODE_BLEND_PREMULTIPLIED,
  pattern SDL3.Sys.Blendmode.SDL_BLENDMODE_ADD,
  pattern SDL3.Sys.Blendmode.SDL_BLENDMODE_ADD_PREMULTIPLIED,
  pattern SDL3.Sys.Blendmode.SDL_BLENDMODE_MOD,
  pattern SDL3.Sys.Blendmode.SDL_BLENDMODE_MUL,
  pattern SDL3.Sys.Blendmode.SDL_BLENDMODE_INVALID,

  -- * Function aliases
  SDL3.Sys.Blendmode.composeCustomBlendMode,
  SDL3.Sys.Blendmode.composeCustomBlendModeSafe,
)
where

import SDL3.Sys.Bindgen.Blendmode
import SDL3.Sys.Bindgen.Blendmode.Safe qualified as Safe
import SDL3.Sys.Bindgen.Blendmode.Unsafe qualified as Unsafe

-- | Compose a custom blend mode for renderers.
--
--     The functions 'SDL3.Sys.Render.setRenderDrawBlendMode' and 'SDL3.Sys.Render.setTextureBlendMode' accept the 'SDL_BlendMode' returned by this function if the renderer supports it.
--
--     A blend mode controls how the pixels from a drawing operation (source) get combined with the pixels from the render target (destination). First, the components of the source and destination pixels get multiplied with their blend factors. Then, the blend operation takes the two products and calculates the result that will get stored in the render target.
--
--     Expressed in pseudocode, it would look like this:
--
--     @
--     dstRGB = colorOperation(srcRGB * srcColorFactor, dstRGB * dstColorFactor);
--     dstA = alphaOperation(srcA * srcAlphaFactor, dstA * dstAlphaFactor);
--     @
--
--     Where the functions @colorOperation(src, dst)@ and @alphaOperation(src, dst)@ can return one of the following:
--
--     * @src + dst@
--
--     * @src - dst@
--
--     * @dst - src@
--
--     * @min(src, dst)@
--
--     * @max(src, dst)@
--
--     The red, green, and blue components are always multiplied with the first, second, and third components of the 'SDL_BlendFactor', respectively. The fourth component is not used.
--
--     The alpha component is always multiplied with the fourth component of the 'SDL_BlendFactor'. The other components are not used in the alpha calculation.
--
--     Support for these blend modes varies for each renderer. To check if a specific 'SDL_BlendMode' is supported, create a renderer and pass it to either 'SDL3.Sys.Render.setRenderDrawBlendMode' or 'SDL3.Sys.Render.setTextureBlendMode'. They will return with an error if the blend mode is not supported.
--
--     This list describes the support of custom blend modes for each renderer. All renderers support the four blend modes listed in the 'SDL_BlendMode' enumeration.
--
--     * __direct3d__: Supports all operations with all factors. However, some factors produce unexpected results with @SDL_BLENDOPERATION_MINIMUM@ and @SDL_BLENDOPERATION_MAXIMUM@.
--
--     * __direct3d11__: Same as Direct3D 9.
--
--     * __opengl__: Supports the @SDL_BLENDOPERATION_ADD@ operation with all factors. OpenGL versions 1.1, 1.2, and 1.3 do not work correctly here.
--
--     * __opengles2__: Supports the @SDL_BLENDOPERATION_ADD@, @SDL_BLENDOPERATION_SUBTRACT@, @SDL_BLENDOPERATION_REV_SUBTRACT@ operations with all factors.
--
--     * __psp__: No custom blend mode support.
--
--     * __software__: No custom blend mode support.
--
--     Some renderers do not provide an alpha component for the default render target. The @SDL_BLENDFACTOR_DST_ALPHA@ and @SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA@ factors do not have an effect in this case.
--
--     [Returns]: an 'SDL_BlendMode' that represents the chosen factors and operations.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Render.setRenderDrawBlendMode', 'SDL3.Sys.Render.getRenderDrawBlendMode', 'SDL3.Sys.Render.setTextureBlendMode', 'SDL3.Sys.Render.getTextureBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ComposeCustomBlendMode@.
--                   The safe flavor is 'composeCustomBlendModeSafe'
--                   .
--
--     [C declaration]: @SDL_ComposeCustomBlendMode@, defined at @SDL3\/SDL_blendmode.h 189:43@
composeCustomBlendMode
  :: SDL_BlendFactor
  -- ^
  --
  --           [@srcColorFactor@]: the 'SDL_BlendFactor' applied to the red, green, and blue components of the source pixels.
  -> SDL_BlendFactor
  -- ^
  --
  --           [@dstColorFactor@]: the 'SDL_BlendFactor' applied to the red, green, and blue components of the destination pixels.
  -> SDL_BlendOperation
  -- ^
  --
  --           [@colorOperation@]: the 'SDL_BlendOperation' used to combine the red, green, and blue components of the source and destination pixels.
  -> SDL_BlendFactor
  -- ^
  --
  --           [@srcAlphaFactor@]: the 'SDL_BlendFactor' applied to the alpha component of the source pixels.
  -> SDL_BlendFactor
  -- ^
  --
  --           [@dstAlphaFactor@]: the 'SDL_BlendFactor' applied to the alpha component of the destination pixels.
  -> SDL_BlendOperation
  -- ^
  --
  --           [@alphaOperation@]: the 'SDL_BlendOperation' used to combine the alpha component of the source and destination pixels.
  -> IO SDL_BlendMode
composeCustomBlendMode =
  Unsafe.sDL_ComposeCustomBlendMode

-- | Compose a custom blend mode for renderers.
--
--     The functions 'SDL3.Sys.Render.setRenderDrawBlendMode' and 'SDL3.Sys.Render.setTextureBlendMode' accept the 'SDL_BlendMode' returned by this function if the renderer supports it.
--
--     A blend mode controls how the pixels from a drawing operation (source) get combined with the pixels from the render target (destination). First, the components of the source and destination pixels get multiplied with their blend factors. Then, the blend operation takes the two products and calculates the result that will get stored in the render target.
--
--     Expressed in pseudocode, it would look like this:
--
--     @
--     dstRGB = colorOperation(srcRGB * srcColorFactor, dstRGB * dstColorFactor);
--     dstA = alphaOperation(srcA * srcAlphaFactor, dstA * dstAlphaFactor);
--     @
--
--     Where the functions @colorOperation(src, dst)@ and @alphaOperation(src, dst)@ can return one of the following:
--
--     * @src + dst@
--
--     * @src - dst@
--
--     * @dst - src@
--
--     * @min(src, dst)@
--
--     * @max(src, dst)@
--
--     The red, green, and blue components are always multiplied with the first, second, and third components of the 'SDL_BlendFactor', respectively. The fourth component is not used.
--
--     The alpha component is always multiplied with the fourth component of the 'SDL_BlendFactor'. The other components are not used in the alpha calculation.
--
--     Support for these blend modes varies for each renderer. To check if a specific 'SDL_BlendMode' is supported, create a renderer and pass it to either 'SDL3.Sys.Render.setRenderDrawBlendMode' or 'SDL3.Sys.Render.setTextureBlendMode'. They will return with an error if the blend mode is not supported.
--
--     This list describes the support of custom blend modes for each renderer. All renderers support the four blend modes listed in the 'SDL_BlendMode' enumeration.
--
--     * __direct3d__: Supports all operations with all factors. However, some factors produce unexpected results with @SDL_BLENDOPERATION_MINIMUM@ and @SDL_BLENDOPERATION_MAXIMUM@.
--
--     * __direct3d11__: Same as Direct3D 9.
--
--     * __opengl__: Supports the @SDL_BLENDOPERATION_ADD@ operation with all factors. OpenGL versions 1.1, 1.2, and 1.3 do not work correctly here.
--
--     * __opengles2__: Supports the @SDL_BLENDOPERATION_ADD@, @SDL_BLENDOPERATION_SUBTRACT@, @SDL_BLENDOPERATION_REV_SUBTRACT@ operations with all factors.
--
--     * __psp__: No custom blend mode support.
--
--     * __software__: No custom blend mode support.
--
--     Some renderers do not provide an alpha component for the default render target. The @SDL_BLENDFACTOR_DST_ALPHA@ and @SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA@ factors do not have an effect in this case.
--
--     [Returns]: an 'SDL_BlendMode' that represents the chosen factors and operations.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Render.setRenderDrawBlendMode', 'SDL3.Sys.Render.getRenderDrawBlendMode', 'SDL3.Sys.Render.setTextureBlendMode', 'SDL3.Sys.Render.getTextureBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ComposeCustomBlendMode@.
--                   The unsafe flavor is 'composeCustomBlendMode'
--                   .
--
--     [C declaration]: @SDL_ComposeCustomBlendMode@, defined at @SDL3\/SDL_blendmode.h 189:43@
composeCustomBlendModeSafe
  :: SDL_BlendFactor
  -- ^
  --
  --           [@srcColorFactor@]: the 'SDL_BlendFactor' applied to the red, green, and blue components of the source pixels.
  -> SDL_BlendFactor
  -- ^
  --
  --           [@dstColorFactor@]: the 'SDL_BlendFactor' applied to the red, green, and blue components of the destination pixels.
  -> SDL_BlendOperation
  -- ^
  --
  --           [@colorOperation@]: the 'SDL_BlendOperation' used to combine the red, green, and blue components of the source and destination pixels.
  -> SDL_BlendFactor
  -- ^
  --
  --           [@srcAlphaFactor@]: the 'SDL_BlendFactor' applied to the alpha component of the source pixels.
  -> SDL_BlendFactor
  -- ^
  --
  --           [@dstAlphaFactor@]: the 'SDL_BlendFactor' applied to the alpha component of the destination pixels.
  -> SDL_BlendOperation
  -- ^
  --
  --           [@alphaOperation@]: the 'SDL_BlendOperation' used to combine the alpha component of the source and destination pixels.
  -> IO SDL_BlendMode
composeCustomBlendModeSafe =
  Safe.sDL_ComposeCustomBlendMode

-- | Typed constant for macro @SDL_BLENDMODE_NONE@.
pattern SDL_BLENDMODE_NONE :: SDL_BlendMode
pattern SDL_BLENDMODE_NONE = SDL_BlendMode 0

-- | Typed constant for macro @SDL_BLENDMODE_BLEND@.
pattern SDL_BLENDMODE_BLEND :: SDL_BlendMode
pattern SDL_BLENDMODE_BLEND = SDL_BlendMode 1

-- | Typed constant for macro @SDL_BLENDMODE_BLEND_PREMULTIPLIED@.
pattern SDL_BLENDMODE_BLEND_PREMULTIPLIED :: SDL_BlendMode
pattern SDL_BLENDMODE_BLEND_PREMULTIPLIED = SDL_BlendMode 16

-- | Typed constant for macro @SDL_BLENDMODE_ADD@.
pattern SDL_BLENDMODE_ADD :: SDL_BlendMode
pattern SDL_BLENDMODE_ADD = SDL_BlendMode 2

-- | Typed constant for macro @SDL_BLENDMODE_ADD_PREMULTIPLIED@.
pattern SDL_BLENDMODE_ADD_PREMULTIPLIED :: SDL_BlendMode
pattern SDL_BLENDMODE_ADD_PREMULTIPLIED = SDL_BlendMode 32

-- | Typed constant for macro @SDL_BLENDMODE_MOD@.
pattern SDL_BLENDMODE_MOD :: SDL_BlendMode
pattern SDL_BLENDMODE_MOD = SDL_BlendMode 4

-- | Typed constant for macro @SDL_BLENDMODE_MUL@.
pattern SDL_BLENDMODE_MUL :: SDL_BlendMode
pattern SDL_BLENDMODE_MUL = SDL_BlendMode 8

-- | Typed constant for macro @SDL_BLENDMODE_INVALID@.
pattern SDL_BLENDMODE_INVALID :: SDL_BlendMode
pattern SDL_BLENDMODE_INVALID = SDL_BlendMode 2147483647

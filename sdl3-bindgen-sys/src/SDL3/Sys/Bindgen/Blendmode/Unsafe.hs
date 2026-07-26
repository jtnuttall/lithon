{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Blendmode.Unsafe (
  SDL3.Sys.Bindgen.Blendmode.Unsafe.sDL_ComposeCustomBlendMode,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Blendmode

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_blendmode.h>"
         , "SDL_BlendMode hs_bindgen_02a1b148e92e150f ("
         , "  SDL_BlendFactor arg1,"
         , "  SDL_BlendFactor arg2,"
         , "  SDL_BlendOperation arg3,"
         , "  SDL_BlendFactor arg4,"
         , "  SDL_BlendFactor arg5,"
         , "  SDL_BlendOperation arg6"
         , ")"
         , "{"
         , "  return (SDL_ComposeCustomBlendMode)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Blendmode_Unsafe_SDL_ComposeCustomBlendMode@
foreign import ccall unsafe "hs_bindgen_02a1b148e92e150f"
  hs_bindgen_02a1b148e92e150f_base
    :: BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Blendmode_Unsafe_SDL_ComposeCustomBlendMode@
hs_bindgen_02a1b148e92e150f
  :: SDL_BlendFactor
  -> SDL_BlendFactor
  -> SDL_BlendOperation
  -> SDL_BlendFactor
  -> SDL_BlendFactor
  -> SDL_BlendOperation
  -> IO SDL_BlendMode
hs_bindgen_02a1b148e92e150f =
  BG.fromFFIType hs_bindgen_02a1b148e92e150f_base

-- | Compose a custom blend mode for renderers.
--
--     The functions SDL_SetRenderDrawBlendMode and SDL_SetTextureBlendMode accept the 'SDL_BlendMode' returned by this function if the renderer supports it.
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
--     Support for these blend modes varies for each renderer. To check if a specific 'SDL_BlendMode' is supported, create a renderer and pass it to either SDL_SetRenderDrawBlendMode or SDL_SetTextureBlendMode. They will return with an error if the blend mode is not supported.
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
--     [See also]: SDL_SetRenderDrawBlendMode, SDL_GetRenderDrawBlendMode, SDL_SetTextureBlendMode, SDL_GetTextureBlendMode
--
--     [C declaration]: @SDL_ComposeCustomBlendMode@, defined at @SDL3\/SDL_blendmode.h 189:43@
sDL_ComposeCustomBlendMode
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
sDL_ComposeCustomBlendMode =
  hs_bindgen_02a1b148e92e150f

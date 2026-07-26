{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Hints.Unsafe (
  SDL3.Sys.Bindgen.Hints.Unsafe.sDL_SetHintWithPriority,
  SDL3.Sys.Bindgen.Hints.Unsafe.sDL_SetHint,
  SDL3.Sys.Bindgen.Hints.Unsafe.sDL_ResetHint,
  SDL3.Sys.Bindgen.Hints.Unsafe.sDL_ResetHints,
  SDL3.Sys.Bindgen.Hints.Unsafe.sDL_GetHint,
  SDL3.Sys.Bindgen.Hints.Unsafe.sDL_GetHintBoolean,
  SDL3.Sys.Bindgen.Hints.Unsafe.sDL_AddHintCallback,
  SDL3.Sys.Bindgen.Hints.Unsafe.sDL_RemoveHintCallback,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Hints

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_hints.h>"
         , "_Bool hs_bindgen_cb82b52002f46100 ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  SDL_HintPriority arg3"
         , ")"
         , "{"
         , "  return (SDL_SetHintWithPriority)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_3f922ee38b008540 ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetHint)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_3d1b9b2531cc28fe ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_ResetHint)(arg1);"
         , "}"
         , "void hs_bindgen_55d0a8bf7baacba4 (void)"
         , "{"
         , "  (SDL_ResetHints)();"
         , "}"
         , "char const *hs_bindgen_637ba7b5c2a54073 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetHint)(arg1);"
         , "}"
         , "_Bool hs_bindgen_df016d033ceb7b47 ("
         , "  char const *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_GetHintBoolean)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_5d061e74b3f3440a ("
         , "  char const *arg1,"
         , "  SDL_HintCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_AddHintCallback)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_7b0a9c503e7af491 ("
         , "  char const *arg1,"
         , "  SDL_HintCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  (SDL_RemoveHintCallback)(arg1, arg2, arg3);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_SetHintWithPriority@
foreign import ccall unsafe "hs_bindgen_cb82b52002f46100"
  hs_bindgen_cb82b52002f46100_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_SetHintWithPriority@
hs_bindgen_cb82b52002f46100
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> SDL_HintPriority
  -> IO BG.CBool
hs_bindgen_cb82b52002f46100 =
  BG.fromFFIType hs_bindgen_cb82b52002f46100_base

-- | Set a hint with a specific priority.
--
--     The priority controls the behavior when setting a hint that already has a value. Hints will replace existing hints of their priority and lower. Environment variables are considered to have override priority.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHint', 'sDL_ResetHint', 'sDL_SetHint'
--
--     [C declaration]: @SDL_SetHintWithPriority@, defined at @SDL3\/SDL_hints.h 4756:34@
sDL_SetHintWithPriority
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the hint variable.
  -> SDL_HintPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_HintPriority' level for the hint.
  -> IO BG.CBool
sDL_SetHintWithPriority = hs_bindgen_cb82b52002f46100

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_SetHint@
foreign import ccall unsafe "hs_bindgen_3f922ee38b008540"
  hs_bindgen_3f922ee38b008540_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_SetHint@
hs_bindgen_3f922ee38b008540
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_3f922ee38b008540 =
  BG.fromFFIType hs_bindgen_3f922ee38b008540_base

-- | Set a hint with normal priority.
--
--     Hints will not be set if there is an existing override hint or environment variable that takes precedence. You can use @SDL_SetHintWithPriority()@ to set the hint with override priority instead.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHint', 'sDL_ResetHint', 'sDL_SetHintWithPriority'
--
--     [C declaration]: @SDL_SetHint@, defined at @SDL3\/SDL_hints.h 4778:34@
sDL_SetHint
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the hint variable.
  -> IO BG.CBool
sDL_SetHint = hs_bindgen_3f922ee38b008540

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_ResetHint@
foreign import ccall unsafe "hs_bindgen_3d1b9b2531cc28fe"
  hs_bindgen_3d1b9b2531cc28fe_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_ResetHint@
hs_bindgen_3d1b9b2531cc28fe
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_3d1b9b2531cc28fe =
  BG.fromFFIType hs_bindgen_3d1b9b2531cc28fe_base

-- | Reset a hint to the default value.
--
--     This will reset a hint to the value of the environment variable, or NULL if the environment isn\'t set. Callbacks will be called normally with this change.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetHint', 'sDL_ResetHints'
--
--     [C declaration]: @SDL_ResetHint@, defined at @SDL3\/SDL_hints.h 4798:34@
sDL_ResetHint
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to set.
  -> IO BG.CBool
sDL_ResetHint = hs_bindgen_3d1b9b2531cc28fe

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_ResetHints@
foreign import ccall unsafe "hs_bindgen_55d0a8bf7baacba4"
  hs_bindgen_55d0a8bf7baacba4_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_ResetHints@
hs_bindgen_55d0a8bf7baacba4 :: IO ()
hs_bindgen_55d0a8bf7baacba4 =
  BG.fromFFIType hs_bindgen_55d0a8bf7baacba4_base

-- | Reset all hints to the default values.
--
--     This will reset all hints to the value of the associated environment variable, or NULL if the environment isn\'t set. Callbacks will be called normally with this change.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ResetHint'
--
--     [C declaration]: @SDL_ResetHints@, defined at @SDL3\/SDL_hints.h 4813:34@
sDL_ResetHints :: IO ()
sDL_ResetHints = hs_bindgen_55d0a8bf7baacba4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_GetHint@
foreign import ccall unsafe "hs_bindgen_637ba7b5c2a54073"
  hs_bindgen_637ba7b5c2a54073_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_GetHint@
hs_bindgen_637ba7b5c2a54073
  :: PtrConst.PtrConst BG.CChar
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_637ba7b5c2a54073 =
  BG.fromFFIType hs_bindgen_637ba7b5c2a54073_base

-- | Get the value of a hint.
--
--     [Returns]: the string value of a hint or NULL if the hint isn\'t set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetHint', 'sDL_SetHintWithPriority'
--
--     [C declaration]: @SDL_GetHint@, defined at @SDL3\/SDL_hints.h 4828:41@
sDL_GetHint
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to query.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetHint = hs_bindgen_637ba7b5c2a54073

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_GetHintBoolean@
foreign import ccall unsafe "hs_bindgen_df016d033ceb7b47"
  hs_bindgen_df016d033ceb7b47_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_GetHintBoolean@
hs_bindgen_df016d033ceb7b47
  :: PtrConst.PtrConst BG.CChar
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_df016d033ceb7b47 =
  BG.fromFFIType hs_bindgen_df016d033ceb7b47_base

-- | Get the boolean value of a hint variable.
--
--     [Returns]: the boolean value of a hint or the provided default value if the hint does not exist.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHint', 'sDL_SetHint'
--
--     [C declaration]: @SDL_GetHintBoolean@, defined at @SDL3\/SDL_hints.h 4845:34@
sDL_GetHintBoolean
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the hint to get the boolean value from.
  -> BG.CBool
  -- ^
  --
  --           [@default_value@]: the value to return if the hint does not exist.
  -> IO BG.CBool
sDL_GetHintBoolean = hs_bindgen_df016d033ceb7b47

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_AddHintCallback@
foreign import ccall unsafe "hs_bindgen_5d061e74b3f3440a"
  hs_bindgen_5d061e74b3f3440a_base
    :: BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_AddHintCallback@
hs_bindgen_5d061e74b3f3440a
  :: PtrConst.PtrConst BG.CChar
  -> SDL_HintCallback
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_5d061e74b3f3440a =
  BG.fromFFIType hs_bindgen_5d061e74b3f3440a_base

-- | Add a function to watch a particular hint.
--
--     The callback function is called /during/ this function, to provide it an initial value, and again each time the hint\'s value changes.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RemoveHintCallback'
--
--     [C declaration]: @SDL_AddHintCallback@, defined at @SDL3\/SDL_hints.h 4887:34@
sDL_AddHintCallback
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint to watch.
  -> SDL_HintCallback
  -- ^
  --
  --           [@callback@]: An 'SDL_HintCallback' function that will be called when the hint value changes.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer to pass to the callback function.
  -> IO BG.CBool
sDL_AddHintCallback = hs_bindgen_5d061e74b3f3440a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_RemoveHintCallback@
foreign import ccall unsafe "hs_bindgen_7b0a9c503e7af491"
  hs_bindgen_7b0a9c503e7af491_base
    :: BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_Unsafe_SDL_RemoveHintCallback@
hs_bindgen_7b0a9c503e7af491
  :: PtrConst.PtrConst BG.CChar
  -> SDL_HintCallback
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_7b0a9c503e7af491 =
  BG.fromFFIType hs_bindgen_7b0a9c503e7af491_base

-- | Remove a function watching a particular hint.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddHintCallback'
--
--     [C declaration]: @SDL_RemoveHintCallback@, defined at @SDL3\/SDL_hints.h 4903:34@
sDL_RemoveHintCallback
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the hint being watched.
  -> SDL_HintCallback
  -- ^
  --
  --           [@callback@]: an 'SDL_HintCallback' function that will be called when the hint value changes.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer being passed to the callback function.
  -> IO ()
sDL_RemoveHintCallback = hs_bindgen_7b0a9c503e7af491

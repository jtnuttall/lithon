{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Hints.FunPtr (
  SDL3.Sys.Bindgen.Hints.FunPtr.sDL_SetHintWithPriority,
  SDL3.Sys.Bindgen.Hints.FunPtr.sDL_SetHint,
  SDL3.Sys.Bindgen.Hints.FunPtr.sDL_ResetHint,
  SDL3.Sys.Bindgen.Hints.FunPtr.sDL_ResetHints,
  SDL3.Sys.Bindgen.Hints.FunPtr.sDL_GetHint,
  SDL3.Sys.Bindgen.Hints.FunPtr.sDL_GetHintBoolean,
  SDL3.Sys.Bindgen.Hints.FunPtr.sDL_AddHintCallback,
  SDL3.Sys.Bindgen.Hints.FunPtr.sDL_RemoveHintCallback,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Hints

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_hints.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_SetHintWithPriority */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a1124b908df29b8d (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  SDL_HintPriority arg3"
         , ")"
         , "{"
         , "  return &SDL_SetHintWithPriority;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_SetHint */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_67e0f6aa5619e9be (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetHint;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_ResetHint */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_978a3ef046005881 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_ResetHint;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_ResetHints */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_55759cca20a8fc7a (void)) (void)"
         , "{"
         , "  return &SDL_ResetHints;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_GetHint */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_76a1a86d4bb7fe80 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetHint;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_GetHintBoolean */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_31d7e0760df235bb (void)) ("
         , "  char const *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_GetHintBoolean;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_AddHintCallback */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e8ea72aae64e3056 (void)) ("
         , "  char const *arg1,"
         , "  SDL_HintCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_AddHintCallback;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_RemoveHintCallback */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_266d8b3206b888d9 (void)) ("
         , "  char const *arg1,"
         , "  SDL_HintCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_RemoveHintCallback;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_SetHintWithPriority@
foreign import ccall unsafe "hs_bindgen_a1124b908df29b8d"
  hs_bindgen_a1124b908df29b8d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_SetHintWithPriority@
hs_bindgen_a1124b908df29b8d
  :: IO
       ( BG.FunPtr
           (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> SDL_HintPriority -> IO BG.CBool)
       )
hs_bindgen_a1124b908df29b8d =
  BG.fromFFIType hs_bindgen_a1124b908df29b8d_base

{-# NOINLINE sDL_SetHintWithPriority #-}

-- | Set a hint with a specific priority.
--
--     The priority controls the behavior when setting a hint that already has a value. Hints will replace existing hints of their priority and lower. Environment variables are considered to have override priority.
--
--     [@name@]: the hint to set.
--
--     [@value@]: the value of the hint variable.
--
--     [@priority@]: the 'SDL_HintPriority' level for the hint.
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
  :: BG.FunPtr
       (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> SDL_HintPriority -> IO BG.CBool)
sDL_SetHintWithPriority =
  BG.unsafePerformIO hs_bindgen_a1124b908df29b8d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_SetHint@
foreign import ccall unsafe "hs_bindgen_67e0f6aa5619e9be"
  hs_bindgen_67e0f6aa5619e9be_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_SetHint@
hs_bindgen_67e0f6aa5619e9be
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_67e0f6aa5619e9be =
  BG.fromFFIType hs_bindgen_67e0f6aa5619e9be_base

{-# NOINLINE sDL_SetHint #-}

-- | Set a hint with normal priority.
--
--     Hints will not be set if there is an existing override hint or environment variable that takes precedence. You can use @SDL_SetHintWithPriority()@ to set the hint with override priority instead.
--
--     [@name@]: the hint to set.
--
--     [@value@]: the value of the hint variable.
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
sDL_SetHint :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_SetHint =
  BG.unsafePerformIO hs_bindgen_67e0f6aa5619e9be

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_ResetHint@
foreign import ccall unsafe "hs_bindgen_978a3ef046005881"
  hs_bindgen_978a3ef046005881_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_ResetHint@
hs_bindgen_978a3ef046005881 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_978a3ef046005881 =
  BG.fromFFIType hs_bindgen_978a3ef046005881_base

{-# NOINLINE sDL_ResetHint #-}

-- | Reset a hint to the default value.
--
--     This will reset a hint to the value of the environment variable, or NULL if the environment isn\'t set. Callbacks will be called normally with this change.
--
--     [@name@]: the hint to set.
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
sDL_ResetHint :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_ResetHint =
  BG.unsafePerformIO hs_bindgen_978a3ef046005881

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_ResetHints@
foreign import ccall unsafe "hs_bindgen_55759cca20a8fc7a"
  hs_bindgen_55759cca20a8fc7a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_ResetHints@
hs_bindgen_55759cca20a8fc7a :: IO (BG.FunPtr (IO ()))
hs_bindgen_55759cca20a8fc7a =
  BG.fromFFIType hs_bindgen_55759cca20a8fc7a_base

{-# NOINLINE sDL_ResetHints #-}

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
sDL_ResetHints :: BG.FunPtr (IO ())
sDL_ResetHints =
  BG.unsafePerformIO hs_bindgen_55759cca20a8fc7a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_GetHint@
foreign import ccall unsafe "hs_bindgen_76a1a86d4bb7fe80"
  hs_bindgen_76a1a86d4bb7fe80_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_GetHint@
hs_bindgen_76a1a86d4bb7fe80
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_76a1a86d4bb7fe80 =
  BG.fromFFIType hs_bindgen_76a1a86d4bb7fe80_base

{-# NOINLINE sDL_GetHint #-}

-- | Get the value of a hint.
--
--     [@name@]: the hint to query.
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
sDL_GetHint :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetHint =
  BG.unsafePerformIO hs_bindgen_76a1a86d4bb7fe80

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_GetHintBoolean@
foreign import ccall unsafe "hs_bindgen_31d7e0760df235bb"
  hs_bindgen_31d7e0760df235bb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_GetHintBoolean@
hs_bindgen_31d7e0760df235bb
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.CBool -> IO BG.CBool))
hs_bindgen_31d7e0760df235bb =
  BG.fromFFIType hs_bindgen_31d7e0760df235bb_base

{-# NOINLINE sDL_GetHintBoolean #-}

-- | Get the boolean value of a hint variable.
--
--     [@name@]: the name of the hint to get the boolean value from.
--
--     [@default_value@]: the value to return if the hint does not exist.
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
sDL_GetHintBoolean :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.CBool -> IO BG.CBool)
sDL_GetHintBoolean =
  BG.unsafePerformIO hs_bindgen_31d7e0760df235bb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_AddHintCallback@
foreign import ccall unsafe "hs_bindgen_e8ea72aae64e3056"
  hs_bindgen_e8ea72aae64e3056_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_AddHintCallback@
hs_bindgen_e8ea72aae64e3056
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> SDL_HintCallback -> BG.Ptr BG.Void -> IO BG.CBool))
hs_bindgen_e8ea72aae64e3056 =
  BG.fromFFIType hs_bindgen_e8ea72aae64e3056_base

{-# NOINLINE sDL_AddHintCallback #-}

-- | Add a function to watch a particular hint.
--
--     The callback function is called /during/ this function, to provide it an initial value, and again each time the hint\'s value changes.
--
--     [@name@]: the hint to watch.
--
--     [@callback@]: An 'SDL_HintCallback' function that will be called when the hint value changes.
--
--     [@userdata@]: a pointer to pass to the callback function.
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
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> SDL_HintCallback -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_AddHintCallback =
  BG.unsafePerformIO hs_bindgen_e8ea72aae64e3056

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_RemoveHintCallback@
foreign import ccall unsafe "hs_bindgen_266d8b3206b888d9"
  hs_bindgen_266d8b3206b888d9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hints_get_SDL_RemoveHintCallback@
hs_bindgen_266d8b3206b888d9
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> SDL_HintCallback -> BG.Ptr BG.Void -> IO ()))
hs_bindgen_266d8b3206b888d9 =
  BG.fromFFIType hs_bindgen_266d8b3206b888d9_base

{-# NOINLINE sDL_RemoveHintCallback #-}

-- | Remove a function watching a particular hint.
--
--     [@name@]: the hint being watched.
--
--     [@callback@]: an 'SDL_HintCallback' function that will be called when the hint value changes.
--
--     [@userdata@]: a pointer being passed to the callback function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddHintCallback'
--
--     [C declaration]: @SDL_RemoveHintCallback@, defined at @SDL3\/SDL_hints.h 4903:34@
sDL_RemoveHintCallback
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> SDL_HintCallback -> BG.Ptr BG.Void -> IO ())
sDL_RemoveHintCallback =
  BG.unsafePerformIO hs_bindgen_266d8b3206b888d9

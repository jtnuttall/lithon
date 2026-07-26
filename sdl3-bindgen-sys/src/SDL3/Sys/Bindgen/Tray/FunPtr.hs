{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Tray.FunPtr (
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_CreateTray,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_SetTrayIcon,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_SetTrayTooltip,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_CreateTrayMenu,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_CreateTraySubmenu,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_GetTrayMenu,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_GetTraySubmenu,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_GetTrayEntries,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_RemoveTrayEntry,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_InsertTrayEntryAt,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_SetTrayEntryLabel,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_GetTrayEntryLabel,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_SetTrayEntryChecked,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_GetTrayEntryChecked,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_SetTrayEntryEnabled,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_GetTrayEntryEnabled,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_SetTrayEntryCallback,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_ClickTrayEntry,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_DestroyTray,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_GetTrayEntryParent,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_GetTrayMenuParentEntry,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_GetTrayMenuParentTray,
  SDL3.Sys.Bindgen.Tray.FunPtr.sDL_UpdateTrays,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Surface qualified
import SDL3.Sys.Bindgen.Tray

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_tray.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_CreateTray */"
         , "__attribute__ ((const))"
         , "SDL_Tray *(*hs_bindgen_e0b641cea81dd78b (void)) ("
         , "  SDL_Surface *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateTray;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayIcon */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_4c9964d8c06580ec (void)) ("
         , "  SDL_Tray *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetTrayIcon;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayTooltip */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_783d3d9ca84c197c (void)) ("
         , "  SDL_Tray *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetTrayTooltip;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_CreateTrayMenu */"
         , "__attribute__ ((const))"
         , "SDL_TrayMenu *(*hs_bindgen_e6418e186102af71 (void)) ("
         , "  SDL_Tray *arg1"
         , ")"
         , "{"
         , "  return &SDL_CreateTrayMenu;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_CreateTraySubmenu */"
         , "__attribute__ ((const))"
         , "SDL_TrayMenu *(*hs_bindgen_7979c3b75512dd28 (void)) ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return &SDL_CreateTraySubmenu;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayMenu */"
         , "__attribute__ ((const))"
         , "SDL_TrayMenu *(*hs_bindgen_487b4a68acb6ce70 (void)) ("
         , "  SDL_Tray *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTrayMenu;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTraySubmenu */"
         , "__attribute__ ((const))"
         , "SDL_TrayMenu *(*hs_bindgen_fa3f90a24097169c (void)) ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTraySubmenu;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntries */"
         , "__attribute__ ((const))"
         , "SDL_TrayEntry const **(*hs_bindgen_924f686f0f9c486a (void)) ("
         , "  SDL_TrayMenu *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetTrayEntries;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_RemoveTrayEntry */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_207a05e5b588636c (void)) ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return &SDL_RemoveTrayEntry;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_InsertTrayEntryAt */"
         , "__attribute__ ((const))"
         , "SDL_TrayEntry *(*hs_bindgen_4f1eb15eda9eecc5 (void)) ("
         , "  SDL_TrayMenu *arg1,"
         , "  signed int arg2,"
         , "  char const *arg3,"
         , "  SDL_TrayEntryFlags arg4"
         , ")"
         , "{"
         , "  return &SDL_InsertTrayEntryAt;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayEntryLabel */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_db2f3045cf28b5d5 (void)) ("
         , "  SDL_TrayEntry *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetTrayEntryLabel;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntryLabel */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_f9b74cb4f55c043f (void)) ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTrayEntryLabel;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayEntryChecked */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_815ad50438649e5d (void)) ("
         , "  SDL_TrayEntry *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetTrayEntryChecked;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntryChecked */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_89a7fa670bbdd4aa (void)) ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTrayEntryChecked;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayEntryEnabled */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_d2ae14ecd73c137a (void)) ("
         , "  SDL_TrayEntry *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetTrayEntryEnabled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntryEnabled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_aacde4500657f4c0 (void)) ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTrayEntryEnabled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayEntryCallback */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_624772d3d1eca5e3 (void)) ("
         , "  SDL_TrayEntry *arg1,"
         , "  SDL_TrayCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_SetTrayEntryCallback;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_ClickTrayEntry */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_7aff8a582dc1af42 (void)) ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return &SDL_ClickTrayEntry;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_DestroyTray */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_ac5647a4ad9aa76d (void)) ("
         , "  SDL_Tray *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyTray;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntryParent */"
         , "__attribute__ ((const))"
         , "SDL_TrayMenu *(*hs_bindgen_14c614d00cef77fa (void)) ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTrayEntryParent;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayMenuParentEntry */"
         , "__attribute__ ((const))"
         , "SDL_TrayEntry *(*hs_bindgen_5521b8512f50cc76 (void)) ("
         , "  SDL_TrayMenu *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTrayMenuParentEntry;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayMenuParentTray */"
         , "__attribute__ ((const))"
         , "SDL_Tray *(*hs_bindgen_43523d65356b241b (void)) ("
         , "  SDL_TrayMenu *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTrayMenuParentTray;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_UpdateTrays */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_108816203a48fe42 (void)) (void)"
         , "{"
         , "  return &SDL_UpdateTrays;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_CreateTray@
foreign import ccall unsafe "hs_bindgen_e0b641cea81dd78b"
  hs_bindgen_e0b641cea81dd78b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_CreateTray@
hs_bindgen_e0b641cea81dd78b
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_Tray))
       )
hs_bindgen_e0b641cea81dd78b =
  BG.fromFFIType hs_bindgen_e0b641cea81dd78b_base

{-# NOINLINE sDL_CreateTray #-}

-- | Create an icon to be placed in the operating system\'s tray, or equivalent.
--
--     Many platforms advise not using a system tray unless persistence is a necessary feature. Avoid needlessly creating a tray icon, as the user may feel like it clutters their interface.
--
--     Using tray icons require the video subsystem.
--
--     [@icon@]: a surface to be used as icon. May be NULL.
--
--     [@tooltip@]: a tooltip to be displayed when the mouse hovers the icon in UTF-8 encoding. Not supported on all platforms. May be NULL.
--
--     [Returns]: The newly created system tray icon.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTrayMenu', 'sDL_GetTrayMenu', 'sDL_DestroyTray'
--
--     [C declaration]: @SDL_CreateTray@, defined at @SDL3\/SDL_tray.h 121:40@
sDL_CreateTray
  :: BG.FunPtr
       (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_Tray))
sDL_CreateTray =
  BG.unsafePerformIO hs_bindgen_e0b641cea81dd78b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayIcon@
foreign import ccall unsafe "hs_bindgen_4c9964d8c06580ec"
  hs_bindgen_4c9964d8c06580ec_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayIcon@
hs_bindgen_4c9964d8c06580ec
  :: IO (BG.FunPtr (BG.Ptr SDL_Tray -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> IO ()))
hs_bindgen_4c9964d8c06580ec =
  BG.fromFFIType hs_bindgen_4c9964d8c06580ec_base

{-# NOINLINE sDL_SetTrayIcon #-}

-- | Updates the system tray icon\'s icon.
--
--     [@tray@]: the tray icon to be updated.
--
--     [@icon@]: the new icon. May be NULL.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTray'
--
--     [C declaration]: @SDL_SetTrayIcon@, defined at @SDL3\/SDL_tray.h 136:34@
sDL_SetTrayIcon
  :: BG.FunPtr (BG.Ptr SDL_Tray -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> IO ())
sDL_SetTrayIcon =
  BG.unsafePerformIO hs_bindgen_4c9964d8c06580ec

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayTooltip@
foreign import ccall unsafe "hs_bindgen_783d3d9ca84c197c"
  hs_bindgen_783d3d9ca84c197c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayTooltip@
hs_bindgen_783d3d9ca84c197c
  :: IO (BG.FunPtr (BG.Ptr SDL_Tray -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_783d3d9ca84c197c =
  BG.fromFFIType hs_bindgen_783d3d9ca84c197c_base

{-# NOINLINE sDL_SetTrayTooltip #-}

-- | Updates the system tray icon\'s tooltip.
--
--     [@tray@]: the tray icon to be updated.
--
--     [@tooltip@]: the new tooltip in UTF-8 encoding. May be NULL.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTray'
--
--     [C declaration]: @SDL_SetTrayTooltip@, defined at @SDL3\/SDL_tray.h 151:34@
sDL_SetTrayTooltip :: BG.FunPtr (BG.Ptr SDL_Tray -> PtrConst.PtrConst BG.CChar -> IO ())
sDL_SetTrayTooltip =
  BG.unsafePerformIO hs_bindgen_783d3d9ca84c197c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_CreateTrayMenu@
foreign import ccall unsafe "hs_bindgen_e6418e186102af71"
  hs_bindgen_e6418e186102af71_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_CreateTrayMenu@
hs_bindgen_e6418e186102af71 :: IO (BG.FunPtr (BG.Ptr SDL_Tray -> IO (BG.Ptr SDL_TrayMenu)))
hs_bindgen_e6418e186102af71 =
  BG.fromFFIType hs_bindgen_e6418e186102af71_base

{-# NOINLINE sDL_CreateTrayMenu #-}

-- | Create a menu for a system tray.
--
--     This should be called at most once per tray icon.
--
--     This function does the same thing as @SDL_CreateTraySubmenu()@, except that it takes a 'SDL_Tray' instead of a 'SDL_TrayEntry'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
--
--     [@tray@]: the tray to bind the menu to.
--
--     [Returns]: the newly created menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTray', 'sDL_GetTrayMenu', 'sDL_GetTrayMenuParentTray'
--
--     [C declaration]: @SDL_CreateTrayMenu@, defined at @SDL3\/SDL_tray.h 175:44@
sDL_CreateTrayMenu :: BG.FunPtr (BG.Ptr SDL_Tray -> IO (BG.Ptr SDL_TrayMenu))
sDL_CreateTrayMenu =
  BG.unsafePerformIO hs_bindgen_e6418e186102af71

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_CreateTraySubmenu@
foreign import ccall unsafe "hs_bindgen_7979c3b75512dd28"
  hs_bindgen_7979c3b75512dd28_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_CreateTraySubmenu@
hs_bindgen_7979c3b75512dd28 :: IO (BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO (BG.Ptr SDL_TrayMenu)))
hs_bindgen_7979c3b75512dd28 =
  BG.fromFFIType hs_bindgen_7979c3b75512dd28_base

{-# NOINLINE sDL_CreateTraySubmenu #-}

-- | Create a submenu for a system tray entry.
--
--     This should be called at most once per tray entry.
--
--     This function does the same thing as SDL_CreateTrayMenu, except that it takes a 'SDL_TrayEntry' instead of a 'SDL_Tray'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
--
--     [@entry@]: the tray entry to bind the menu to.
--
--     [Returns]: the newly created menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_InsertTrayEntryAt', 'sDL_GetTraySubmenu', 'sDL_GetTrayMenuParentEntry'
--
--     [C declaration]: @SDL_CreateTraySubmenu@, defined at @SDL3\/SDL_tray.h 199:44@
sDL_CreateTraySubmenu :: BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO (BG.Ptr SDL_TrayMenu))
sDL_CreateTraySubmenu =
  BG.unsafePerformIO hs_bindgen_7979c3b75512dd28

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayMenu@
foreign import ccall unsafe "hs_bindgen_487b4a68acb6ce70"
  hs_bindgen_487b4a68acb6ce70_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayMenu@
hs_bindgen_487b4a68acb6ce70 :: IO (BG.FunPtr (BG.Ptr SDL_Tray -> IO (BG.Ptr SDL_TrayMenu)))
hs_bindgen_487b4a68acb6ce70 =
  BG.fromFFIType hs_bindgen_487b4a68acb6ce70_base

{-# NOINLINE sDL_GetTrayMenu #-}

-- | Gets a previously created tray menu.
--
--     You should have called @SDL_CreateTrayMenu()@ on the tray object. This function allows you to fetch it again later.
--
--     This function does the same thing as @SDL_GetTraySubmenu()@, except that it takes a 'SDL_Tray' instead of a 'SDL_TrayEntry'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
--
--     [@tray@]: the tray entry to bind the menu to.
--
--     [Returns]: the newly created menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTray', 'sDL_CreateTrayMenu'
--
--     [C declaration]: @SDL_GetTrayMenu@, defined at @SDL3\/SDL_tray.h 223:44@
sDL_GetTrayMenu :: BG.FunPtr (BG.Ptr SDL_Tray -> IO (BG.Ptr SDL_TrayMenu))
sDL_GetTrayMenu =
  BG.unsafePerformIO hs_bindgen_487b4a68acb6ce70

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTraySubmenu@
foreign import ccall unsafe "hs_bindgen_fa3f90a24097169c"
  hs_bindgen_fa3f90a24097169c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTraySubmenu@
hs_bindgen_fa3f90a24097169c :: IO (BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO (BG.Ptr SDL_TrayMenu)))
hs_bindgen_fa3f90a24097169c =
  BG.fromFFIType hs_bindgen_fa3f90a24097169c_base

{-# NOINLINE sDL_GetTraySubmenu #-}

-- | Gets a previously created tray entry submenu.
--
--     You should have called @SDL_CreateTraySubmenu()@ on the entry object. This function allows you to fetch it again later.
--
--     This function does the same thing as @SDL_GetTrayMenu()@, except that it takes a 'SDL_TrayEntry' instead of a 'SDL_Tray'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
--
--     [@entry@]: the tray entry to bind the menu to.
--
--     [Returns]: the newly created menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_InsertTrayEntryAt', 'sDL_CreateTraySubmenu'
--
--     [C declaration]: @SDL_GetTraySubmenu@, defined at @SDL3\/SDL_tray.h 247:44@
sDL_GetTraySubmenu :: BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO (BG.Ptr SDL_TrayMenu))
sDL_GetTraySubmenu =
  BG.unsafePerformIO hs_bindgen_fa3f90a24097169c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntries@
foreign import ccall unsafe "hs_bindgen_924f686f0f9c486a"
  hs_bindgen_924f686f0f9c486a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntries@
hs_bindgen_924f686f0f9c486a
  :: IO
       (BG.FunPtr (BG.Ptr SDL_TrayMenu -> BG.Ptr BG.CInt -> IO (BG.Ptr (PtrConst.PtrConst SDL_TrayEntry))))
hs_bindgen_924f686f0f9c486a =
  BG.fromFFIType hs_bindgen_924f686f0f9c486a_base

{-# NOINLINE sDL_GetTrayEntries #-}

-- | Returns a list of entries in the menu, in order.
--
--     [@menu@]: The menu to get entries from.
--
--     [@count@]: An optional pointer to obtain the number of entries in the menu.
--
--     [Returns]: a NULL-terminated list of entries within the given menu. The pointer becomes invalid when any function that inserts or deletes entries in the menu is called.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RemoveTrayEntry', 'sDL_InsertTrayEntryAt'
--
--     [C declaration]: @SDL_GetTrayEntries@, defined at @SDL3\/SDL_tray.h 267:52@
sDL_GetTrayEntries
  :: BG.FunPtr (BG.Ptr SDL_TrayMenu -> BG.Ptr BG.CInt -> IO (BG.Ptr (PtrConst.PtrConst SDL_TrayEntry)))
sDL_GetTrayEntries =
  BG.unsafePerformIO hs_bindgen_924f686f0f9c486a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_RemoveTrayEntry@
foreign import ccall unsafe "hs_bindgen_207a05e5b588636c"
  hs_bindgen_207a05e5b588636c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_RemoveTrayEntry@
hs_bindgen_207a05e5b588636c :: IO (BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO ()))
hs_bindgen_207a05e5b588636c =
  BG.fromFFIType hs_bindgen_207a05e5b588636c_base

{-# NOINLINE sDL_RemoveTrayEntry #-}

-- | Removes a tray entry.
--
--     [@entry@]: The entry to be deleted.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt'
--
--     [C declaration]: @SDL_RemoveTrayEntry@, defined at @SDL3\/SDL_tray.h 282:34@
sDL_RemoveTrayEntry :: BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO ())
sDL_RemoveTrayEntry =
  BG.unsafePerformIO hs_bindgen_207a05e5b588636c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_InsertTrayEntryAt@
foreign import ccall unsafe "hs_bindgen_4f1eb15eda9eecc5"
  hs_bindgen_4f1eb15eda9eecc5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_InsertTrayEntryAt@
hs_bindgen_4f1eb15eda9eecc5
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_TrayMenu
             -> BG.CInt
             -> PtrConst.PtrConst BG.CChar
             -> SDL_TrayEntryFlags
             -> IO (BG.Ptr SDL_TrayEntry)
           )
       )
hs_bindgen_4f1eb15eda9eecc5 =
  BG.fromFFIType hs_bindgen_4f1eb15eda9eecc5_base

{-# NOINLINE sDL_InsertTrayEntryAt #-}

-- | Insert a tray entry at a given position.
--
--     If label is NULL, the entry will be a separator. Many functions won\'t work for an entry that is a separator.
--
--     An entry does not need to be destroyed; it will be destroyed with the tray.
--
--     [@menu@]: the menu to append the entry to.
--
--     [@pos@]: the desired position for the new entry. Entries at or following this place will be moved. If pos is -1, the entry is appended.
--
--     [@label@]: the text to be displayed on the entry, in UTF-8 encoding, or NULL for a separator.
--
--     [@flags@]: a combination of flags, some of which are mandatory.
--
--     [Returns]: the newly created entry, or NULL if pos is out of bounds.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_TrayEntryFlags', 'sDL_GetTrayEntries', 'sDL_RemoveTrayEntry', 'sDL_GetTrayEntryParent'
--
--     [C declaration]: @SDL_InsertTrayEntryAt@, defined at @SDL3\/SDL_tray.h 310:45@
sDL_InsertTrayEntryAt
  :: BG.FunPtr
       ( BG.Ptr SDL_TrayMenu
         -> BG.CInt
         -> PtrConst.PtrConst BG.CChar
         -> SDL_TrayEntryFlags
         -> IO (BG.Ptr SDL_TrayEntry)
       )
sDL_InsertTrayEntryAt =
  BG.unsafePerformIO hs_bindgen_4f1eb15eda9eecc5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayEntryLabel@
foreign import ccall unsafe "hs_bindgen_db2f3045cf28b5d5"
  hs_bindgen_db2f3045cf28b5d5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayEntryLabel@
hs_bindgen_db2f3045cf28b5d5
  :: IO (BG.FunPtr (BG.Ptr SDL_TrayEntry -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_db2f3045cf28b5d5 =
  BG.fromFFIType hs_bindgen_db2f3045cf28b5d5_base

{-# NOINLINE sDL_SetTrayEntryLabel #-}

-- | Sets the label of an entry.
--
--     An entry cannot change between a separator and an ordinary entry; that is, it is not possible to set a non-NULL label on an entry that has a NULL label (separators), or to set a NULL label to an entry that has a non-NULL label. The function will silently fail if that happens.
--
--     [@entry@]: the entry to be updated.
--
--     [@label@]: the new label for the entry in UTF-8 encoding.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt', 'sDL_GetTrayEntryLabel'
--
--     [C declaration]: @SDL_SetTrayEntryLabel@, defined at @SDL3\/SDL_tray.h 332:34@
sDL_SetTrayEntryLabel :: BG.FunPtr (BG.Ptr SDL_TrayEntry -> PtrConst.PtrConst BG.CChar -> IO ())
sDL_SetTrayEntryLabel =
  BG.unsafePerformIO hs_bindgen_db2f3045cf28b5d5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntryLabel@
foreign import ccall unsafe "hs_bindgen_f9b74cb4f55c043f"
  hs_bindgen_f9b74cb4f55c043f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntryLabel@
hs_bindgen_f9b74cb4f55c043f
  :: IO (BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_f9b74cb4f55c043f =
  BG.fromFFIType hs_bindgen_f9b74cb4f55c043f_base

{-# NOINLINE sDL_GetTrayEntryLabel #-}

-- | Gets the label of an entry.
--
--     If the returned value is NULL, the entry is a separator.
--
--     [@entry@]: the entry to be read.
--
--     [Returns]: the label of the entry in UTF-8 encoding.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt', 'sDL_SetTrayEntryLabel'
--
--     [C declaration]: @SDL_GetTrayEntryLabel@, defined at @SDL3\/SDL_tray.h 351:42@
sDL_GetTrayEntryLabel :: BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetTrayEntryLabel =
  BG.unsafePerformIO hs_bindgen_f9b74cb4f55c043f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayEntryChecked@
foreign import ccall unsafe "hs_bindgen_815ad50438649e5d"
  hs_bindgen_815ad50438649e5d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayEntryChecked@
hs_bindgen_815ad50438649e5d :: IO (BG.FunPtr (BG.Ptr SDL_TrayEntry -> BG.CBool -> IO ()))
hs_bindgen_815ad50438649e5d =
  BG.fromFFIType hs_bindgen_815ad50438649e5d_base

{-# NOINLINE sDL_SetTrayEntryChecked #-}

-- | Sets whether or not an entry is checked.
--
--     The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.
--
--     [@entry@]: the entry to be updated.
--
--     [@checked@]: true if the entry should be checked; false otherwise.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt', 'sDL_GetTrayEntryChecked'
--
--     [C declaration]: @SDL_SetTrayEntryChecked@, defined at @SDL3\/SDL_tray.h 370:34@
sDL_SetTrayEntryChecked :: BG.FunPtr (BG.Ptr SDL_TrayEntry -> BG.CBool -> IO ())
sDL_SetTrayEntryChecked =
  BG.unsafePerformIO hs_bindgen_815ad50438649e5d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntryChecked@
foreign import ccall unsafe "hs_bindgen_89a7fa670bbdd4aa"
  hs_bindgen_89a7fa670bbdd4aa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntryChecked@
hs_bindgen_89a7fa670bbdd4aa :: IO (BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO BG.CBool))
hs_bindgen_89a7fa670bbdd4aa =
  BG.fromFFIType hs_bindgen_89a7fa670bbdd4aa_base

{-# NOINLINE sDL_GetTrayEntryChecked #-}

-- | Gets whether or not an entry is checked.
--
--     The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.
--
--     [@entry@]: the entry to be read.
--
--     [Returns]: true if the entry is checked; false otherwise.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt', 'sDL_SetTrayEntryChecked'
--
--     [C declaration]: @SDL_GetTrayEntryChecked@, defined at @SDL3\/SDL_tray.h 389:34@
sDL_GetTrayEntryChecked :: BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO BG.CBool)
sDL_GetTrayEntryChecked =
  BG.unsafePerformIO hs_bindgen_89a7fa670bbdd4aa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayEntryEnabled@
foreign import ccall unsafe "hs_bindgen_d2ae14ecd73c137a"
  hs_bindgen_d2ae14ecd73c137a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayEntryEnabled@
hs_bindgen_d2ae14ecd73c137a :: IO (BG.FunPtr (BG.Ptr SDL_TrayEntry -> BG.CBool -> IO ()))
hs_bindgen_d2ae14ecd73c137a =
  BG.fromFFIType hs_bindgen_d2ae14ecd73c137a_base

{-# NOINLINE sDL_SetTrayEntryEnabled #-}

-- | Sets whether or not an entry is enabled.
--
--     [@entry@]: the entry to be updated.
--
--     [@enabled@]: true if the entry should be enabled; false otherwise.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt', 'sDL_GetTrayEntryEnabled'
--
--     [C declaration]: @SDL_SetTrayEntryEnabled@, defined at @SDL3\/SDL_tray.h 406:34@
sDL_SetTrayEntryEnabled :: BG.FunPtr (BG.Ptr SDL_TrayEntry -> BG.CBool -> IO ())
sDL_SetTrayEntryEnabled =
  BG.unsafePerformIO hs_bindgen_d2ae14ecd73c137a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntryEnabled@
foreign import ccall unsafe "hs_bindgen_aacde4500657f4c0"
  hs_bindgen_aacde4500657f4c0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntryEnabled@
hs_bindgen_aacde4500657f4c0 :: IO (BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO BG.CBool))
hs_bindgen_aacde4500657f4c0 =
  BG.fromFFIType hs_bindgen_aacde4500657f4c0_base

{-# NOINLINE sDL_GetTrayEntryEnabled #-}

-- | Gets whether or not an entry is enabled.
--
--     [@entry@]: the entry to be read.
--
--     [Returns]: true if the entry is enabled; false otherwise.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt', 'sDL_SetTrayEntryEnabled'
--
--     [C declaration]: @SDL_GetTrayEntryEnabled@, defined at @SDL3\/SDL_tray.h 423:34@
sDL_GetTrayEntryEnabled :: BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO BG.CBool)
sDL_GetTrayEntryEnabled =
  BG.unsafePerformIO hs_bindgen_aacde4500657f4c0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayEntryCallback@
foreign import ccall unsafe "hs_bindgen_624772d3d1eca5e3"
  hs_bindgen_624772d3d1eca5e3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_SetTrayEntryCallback@
hs_bindgen_624772d3d1eca5e3
  :: IO (BG.FunPtr (BG.Ptr SDL_TrayEntry -> SDL_TrayCallback -> BG.Ptr BG.Void -> IO ()))
hs_bindgen_624772d3d1eca5e3 =
  BG.fromFFIType hs_bindgen_624772d3d1eca5e3_base

{-# NOINLINE sDL_SetTrayEntryCallback #-}

-- | Sets a callback to be invoked when the entry is selected.
--
--     [@entry@]: the entry to be updated.
--
--     [@callback@]: a callback to be invoked when the entry is selected.
--
--     [@userdata@]: an optional pointer to pass extra data to the callback when it will be invoked.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt'
--
--     [C declaration]: @SDL_SetTrayEntryCallback@, defined at @SDL3\/SDL_tray.h 441:34@
sDL_SetTrayEntryCallback
  :: BG.FunPtr (BG.Ptr SDL_TrayEntry -> SDL_TrayCallback -> BG.Ptr BG.Void -> IO ())
sDL_SetTrayEntryCallback =
  BG.unsafePerformIO hs_bindgen_624772d3d1eca5e3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_ClickTrayEntry@
foreign import ccall unsafe "hs_bindgen_7aff8a582dc1af42"
  hs_bindgen_7aff8a582dc1af42_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_ClickTrayEntry@
hs_bindgen_7aff8a582dc1af42 :: IO (BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO ()))
hs_bindgen_7aff8a582dc1af42 =
  BG.fromFFIType hs_bindgen_7aff8a582dc1af42_base

{-# NOINLINE sDL_ClickTrayEntry #-}

-- | Simulate a click on a tray entry.
--
--     [@entry@]: The entry to activate.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ClickTrayEntry@, defined at @SDL3\/SDL_tray.h 453:34@
sDL_ClickTrayEntry :: BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO ())
sDL_ClickTrayEntry =
  BG.unsafePerformIO hs_bindgen_7aff8a582dc1af42

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_DestroyTray@
foreign import ccall unsafe "hs_bindgen_ac5647a4ad9aa76d"
  hs_bindgen_ac5647a4ad9aa76d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_DestroyTray@
hs_bindgen_ac5647a4ad9aa76d :: IO (BG.FunPtr (BG.Ptr SDL_Tray -> IO ()))
hs_bindgen_ac5647a4ad9aa76d =
  BG.fromFFIType hs_bindgen_ac5647a4ad9aa76d_base

{-# NOINLINE sDL_DestroyTray #-}

-- | Destroys a tray object.
--
--     This also destroys all associated menus and entries.
--
--     [@tray@]: the tray icon to be destroyed.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTray'
--
--     [C declaration]: @SDL_DestroyTray@, defined at @SDL3\/SDL_tray.h 469:34@
sDL_DestroyTray :: BG.FunPtr (BG.Ptr SDL_Tray -> IO ())
sDL_DestroyTray =
  BG.unsafePerformIO hs_bindgen_ac5647a4ad9aa76d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntryParent@
foreign import ccall unsafe "hs_bindgen_14c614d00cef77fa"
  hs_bindgen_14c614d00cef77fa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayEntryParent@
hs_bindgen_14c614d00cef77fa :: IO (BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO (BG.Ptr SDL_TrayMenu)))
hs_bindgen_14c614d00cef77fa =
  BG.fromFFIType hs_bindgen_14c614d00cef77fa_base

{-# NOINLINE sDL_GetTrayEntryParent #-}

-- | Gets the menu containing a certain tray entry.
--
--     [@entry@]: the entry for which to get the parent menu.
--
--     [Returns]: the parent menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_InsertTrayEntryAt'
--
--     [C declaration]: @SDL_GetTrayEntryParent@, defined at @SDL3\/SDL_tray.h 484:44@
sDL_GetTrayEntryParent :: BG.FunPtr (BG.Ptr SDL_TrayEntry -> IO (BG.Ptr SDL_TrayMenu))
sDL_GetTrayEntryParent =
  BG.unsafePerformIO hs_bindgen_14c614d00cef77fa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayMenuParentEntry@
foreign import ccall unsafe "hs_bindgen_5521b8512f50cc76"
  hs_bindgen_5521b8512f50cc76_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayMenuParentEntry@
hs_bindgen_5521b8512f50cc76 :: IO (BG.FunPtr (BG.Ptr SDL_TrayMenu -> IO (BG.Ptr SDL_TrayEntry)))
hs_bindgen_5521b8512f50cc76 =
  BG.fromFFIType hs_bindgen_5521b8512f50cc76_base

{-# NOINLINE sDL_GetTrayMenuParentEntry #-}

-- | Gets the entry for which the menu is a submenu, if the current menu is a submenu.
--
--     Either this function or @SDL_GetTrayMenuParentTray()@ will return non-NULL for any given menu.
--
--     [@menu@]: the menu for which to get the parent entry.
--
--     [Returns]: the parent entry, or NULL if this menu is not a submenu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTraySubmenu', 'sDL_GetTrayMenuParentTray'
--
--     [C declaration]: @SDL_GetTrayMenuParentEntry@, defined at @SDL3\/SDL_tray.h 504:45@
sDL_GetTrayMenuParentEntry :: BG.FunPtr (BG.Ptr SDL_TrayMenu -> IO (BG.Ptr SDL_TrayEntry))
sDL_GetTrayMenuParentEntry =
  BG.unsafePerformIO hs_bindgen_5521b8512f50cc76

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayMenuParentTray@
foreign import ccall unsafe "hs_bindgen_43523d65356b241b"
  hs_bindgen_43523d65356b241b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_GetTrayMenuParentTray@
hs_bindgen_43523d65356b241b :: IO (BG.FunPtr (BG.Ptr SDL_TrayMenu -> IO (BG.Ptr SDL_Tray)))
hs_bindgen_43523d65356b241b =
  BG.fromFFIType hs_bindgen_43523d65356b241b_base

{-# NOINLINE sDL_GetTrayMenuParentTray #-}

-- | Gets the tray for which this menu is the first-level menu, if the current menu isn\'t a submenu.
--
--     Either this function or @SDL_GetTrayMenuParentEntry()@ will return non-NULL for any given menu.
--
--     [@menu@]: the menu for which to get the parent enttrayry.
--
--     [Returns]: the parent tray, or NULL if this menu is a submenu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTrayMenu', 'sDL_GetTrayMenuParentEntry'
--
--     [C declaration]: @SDL_GetTrayMenuParentTray@, defined at @SDL3\/SDL_tray.h 524:40@
sDL_GetTrayMenuParentTray :: BG.FunPtr (BG.Ptr SDL_TrayMenu -> IO (BG.Ptr SDL_Tray))
sDL_GetTrayMenuParentTray =
  BG.unsafePerformIO hs_bindgen_43523d65356b241b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_UpdateTrays@
foreign import ccall unsafe "hs_bindgen_108816203a48fe42"
  hs_bindgen_108816203a48fe42_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_get_SDL_UpdateTrays@
hs_bindgen_108816203a48fe42 :: IO (BG.FunPtr (IO ()))
hs_bindgen_108816203a48fe42 =
  BG.fromFFIType hs_bindgen_108816203a48fe42_base

{-# NOINLINE sDL_UpdateTrays #-}

-- | Update the trays.
--
--     This is called automatically by the event loop and is only needed if you\'re using trays but aren\'t handling SDL events.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UpdateTrays@, defined at @SDL3\/SDL_tray.h 536:34@
sDL_UpdateTrays :: BG.FunPtr (IO ())
sDL_UpdateTrays =
  BG.unsafePerformIO hs_bindgen_108816203a48fe42

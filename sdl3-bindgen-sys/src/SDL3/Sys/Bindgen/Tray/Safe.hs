{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Tray.Safe (
  SDL3.Sys.Bindgen.Tray.Safe.sDL_CreateTray,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_SetTrayIcon,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_SetTrayTooltip,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_CreateTrayMenu,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_CreateTraySubmenu,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_GetTrayMenu,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_GetTraySubmenu,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_GetTrayEntries,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_RemoveTrayEntry,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_InsertTrayEntryAt,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_SetTrayEntryLabel,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_GetTrayEntryLabel,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_SetTrayEntryChecked,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_GetTrayEntryChecked,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_SetTrayEntryEnabled,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_GetTrayEntryEnabled,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_SetTrayEntryCallback,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_ClickTrayEntry,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_DestroyTray,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_GetTrayEntryParent,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_GetTrayMenuParentEntry,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_GetTrayMenuParentTray,
  SDL3.Sys.Bindgen.Tray.Safe.sDL_UpdateTrays,
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
         , "SDL_Tray *hs_bindgen_883df5f31028a1a4 ("
         , "  SDL_Surface *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateTray)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_e4467c5dfb0eefec ("
         , "  SDL_Tray *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  (SDL_SetTrayIcon)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_f0fbabccc349ab12 ("
         , "  SDL_Tray *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (SDL_SetTrayTooltip)(arg1, arg2);"
         , "}"
         , "SDL_TrayMenu *hs_bindgen_591a284511251aa4 ("
         , "  SDL_Tray *arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateTrayMenu)(arg1);"
         , "}"
         , "SDL_TrayMenu *hs_bindgen_519964613c2d0dd2 ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateTraySubmenu)(arg1);"
         , "}"
         , "SDL_TrayMenu *hs_bindgen_d00b06b7312eb4e3 ("
         , "  SDL_Tray *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayMenu)(arg1);"
         , "}"
         , "SDL_TrayMenu *hs_bindgen_ac4f72f06dc56c8f ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTraySubmenu)(arg1);"
         , "}"
         , "SDL_TrayEntry const **hs_bindgen_db28f928b77b3b21 ("
         , "  SDL_TrayMenu *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetTrayEntries)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_760690f62725f41d ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  (SDL_RemoveTrayEntry)(arg1);"
         , "}"
         , "SDL_TrayEntry *hs_bindgen_97f828a3ddf4bda6 ("
         , "  SDL_TrayMenu *arg1,"
         , "  signed int arg2,"
         , "  char const *arg3,"
         , "  SDL_TrayEntryFlags arg4"
         , ")"
         , "{"
         , "  return (SDL_InsertTrayEntryAt)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_d259c08f8b2fea97 ("
         , "  SDL_TrayEntry *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (SDL_SetTrayEntryLabel)(arg1, arg2);"
         , "}"
         , "char const *hs_bindgen_f42afcfe13e00a9d ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayEntryLabel)(arg1);"
         , "}"
         , "void hs_bindgen_c732ae30d80c2bac ("
         , "  SDL_TrayEntry *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  (SDL_SetTrayEntryChecked)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_9ab5ede401963c0b ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayEntryChecked)(arg1);"
         , "}"
         , "void hs_bindgen_a82f265fc5763bf3 ("
         , "  SDL_TrayEntry *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  (SDL_SetTrayEntryEnabled)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_102ba65c8464342f ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayEntryEnabled)(arg1);"
         , "}"
         , "void hs_bindgen_94ff69ef9d4fdfe8 ("
         , "  SDL_TrayEntry *arg1,"
         , "  SDL_TrayCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  (SDL_SetTrayEntryCallback)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_0157d583c118c3cc ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  (SDL_ClickTrayEntry)(arg1);"
         , "}"
         , "void hs_bindgen_8b1a746817e6df61 ("
         , "  SDL_Tray *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyTray)(arg1);"
         , "}"
         , "SDL_TrayMenu *hs_bindgen_7ca22a5fb9c165d8 ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayEntryParent)(arg1);"
         , "}"
         , "SDL_TrayEntry *hs_bindgen_6e7d37f626feacc8 ("
         , "  SDL_TrayMenu *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayMenuParentEntry)(arg1);"
         , "}"
         , "SDL_Tray *hs_bindgen_9e7d7b320d4c4ce1 ("
         , "  SDL_TrayMenu *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayMenuParentTray)(arg1);"
         , "}"
         , "void hs_bindgen_92bb76cd94576ed5 (void)"
         , "{"
         , "  (SDL_UpdateTrays)();"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_CreateTray@
foreign import ccall safe "hs_bindgen_883df5f31028a1a4"
  hs_bindgen_883df5f31028a1a4_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_CreateTray@
hs_bindgen_883df5f31028a1a4
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr SDL_Tray)
hs_bindgen_883df5f31028a1a4 =
  BG.fromFFIType hs_bindgen_883df5f31028a1a4_base

-- | Create an icon to be placed in the operating system\'s tray, or equivalent.
--
--     Many platforms advise not using a system tray unless persistence is a necessary feature. Avoid needlessly creating a tray icon, as the user may feel like it clutters their interface.
--
--     Using tray icons require the video subsystem.
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
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@icon@]: a surface to be used as icon. May be NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@tooltip@]: a tooltip to be displayed when the mouse hovers the icon in UTF-8 encoding. Not supported on all platforms. May be NULL.
  -> IO (BG.Ptr SDL_Tray)
sDL_CreateTray = hs_bindgen_883df5f31028a1a4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_SetTrayIcon@
foreign import ccall safe "hs_bindgen_e4467c5dfb0eefec"
  hs_bindgen_e4467c5dfb0eefec_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_SetTrayIcon@
hs_bindgen_e4467c5dfb0eefec
  :: BG.Ptr SDL_Tray
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> IO ()
hs_bindgen_e4467c5dfb0eefec =
  BG.fromFFIType hs_bindgen_e4467c5dfb0eefec_base

-- | Updates the system tray icon\'s icon.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTray'
--
--     [C declaration]: @SDL_SetTrayIcon@, defined at @SDL3\/SDL_tray.h 136:34@
sDL_SetTrayIcon
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray icon to be updated.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@icon@]: the new icon. May be NULL.
  -> IO ()
sDL_SetTrayIcon = hs_bindgen_e4467c5dfb0eefec

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_SetTrayTooltip@
foreign import ccall safe "hs_bindgen_f0fbabccc349ab12"
  hs_bindgen_f0fbabccc349ab12_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_SetTrayTooltip@
hs_bindgen_f0fbabccc349ab12
  :: BG.Ptr SDL_Tray
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_f0fbabccc349ab12 =
  BG.fromFFIType hs_bindgen_f0fbabccc349ab12_base

-- | Updates the system tray icon\'s tooltip.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTray'
--
--     [C declaration]: @SDL_SetTrayTooltip@, defined at @SDL3\/SDL_tray.h 151:34@
sDL_SetTrayTooltip
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray icon to be updated.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@tooltip@]: the new tooltip in UTF-8 encoding. May be NULL.
  -> IO ()
sDL_SetTrayTooltip = hs_bindgen_f0fbabccc349ab12

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_CreateTrayMenu@
foreign import ccall safe "hs_bindgen_591a284511251aa4"
  hs_bindgen_591a284511251aa4_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_CreateTrayMenu@
hs_bindgen_591a284511251aa4
  :: BG.Ptr SDL_Tray
  -> IO (BG.Ptr SDL_TrayMenu)
hs_bindgen_591a284511251aa4 =
  BG.fromFFIType hs_bindgen_591a284511251aa4_base

-- | Create a menu for a system tray.
--
--     This should be called at most once per tray icon.
--
--     This function does the same thing as @SDL_CreateTraySubmenu()@, except that it takes a 'SDL_Tray' instead of a 'SDL_TrayEntry'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
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
sDL_CreateTrayMenu
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray to bind the menu to.
  -> IO (BG.Ptr SDL_TrayMenu)
sDL_CreateTrayMenu = hs_bindgen_591a284511251aa4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_CreateTraySubmenu@
foreign import ccall safe "hs_bindgen_519964613c2d0dd2"
  hs_bindgen_519964613c2d0dd2_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_CreateTraySubmenu@
hs_bindgen_519964613c2d0dd2
  :: BG.Ptr SDL_TrayEntry
  -> IO (BG.Ptr SDL_TrayMenu)
hs_bindgen_519964613c2d0dd2 =
  BG.fromFFIType hs_bindgen_519964613c2d0dd2_base

-- | Create a submenu for a system tray entry.
--
--     This should be called at most once per tray entry.
--
--     This function does the same thing as SDL_CreateTrayMenu, except that it takes a 'SDL_TrayEntry' instead of a 'SDL_Tray'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
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
sDL_CreateTraySubmenu
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the tray entry to bind the menu to.
  -> IO (BG.Ptr SDL_TrayMenu)
sDL_CreateTraySubmenu = hs_bindgen_519964613c2d0dd2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayMenu@
foreign import ccall safe "hs_bindgen_d00b06b7312eb4e3"
  hs_bindgen_d00b06b7312eb4e3_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayMenu@
hs_bindgen_d00b06b7312eb4e3
  :: BG.Ptr SDL_Tray
  -> IO (BG.Ptr SDL_TrayMenu)
hs_bindgen_d00b06b7312eb4e3 =
  BG.fromFFIType hs_bindgen_d00b06b7312eb4e3_base

-- | Gets a previously created tray menu.
--
--     You should have called @SDL_CreateTrayMenu()@ on the tray object. This function allows you to fetch it again later.
--
--     This function does the same thing as @SDL_GetTraySubmenu()@, except that it takes a 'SDL_Tray' instead of a 'SDL_TrayEntry'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
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
sDL_GetTrayMenu
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray entry to bind the menu to.
  -> IO (BG.Ptr SDL_TrayMenu)
sDL_GetTrayMenu = hs_bindgen_d00b06b7312eb4e3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTraySubmenu@
foreign import ccall safe "hs_bindgen_ac4f72f06dc56c8f"
  hs_bindgen_ac4f72f06dc56c8f_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTraySubmenu@
hs_bindgen_ac4f72f06dc56c8f
  :: BG.Ptr SDL_TrayEntry
  -> IO (BG.Ptr SDL_TrayMenu)
hs_bindgen_ac4f72f06dc56c8f =
  BG.fromFFIType hs_bindgen_ac4f72f06dc56c8f_base

-- | Gets a previously created tray entry submenu.
--
--     You should have called @SDL_CreateTraySubmenu()@ on the entry object. This function allows you to fetch it again later.
--
--     This function does the same thing as @SDL_GetTrayMenu()@, except that it takes a 'SDL_TrayEntry' instead of a 'SDL_Tray'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
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
sDL_GetTraySubmenu
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the tray entry to bind the menu to.
  -> IO (BG.Ptr SDL_TrayMenu)
sDL_GetTraySubmenu = hs_bindgen_ac4f72f06dc56c8f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayEntries@
foreign import ccall safe "hs_bindgen_db28f928b77b3b21"
  hs_bindgen_db28f928b77b3b21_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayEntries@
hs_bindgen_db28f928b77b3b21
  :: BG.Ptr SDL_TrayMenu
  -> BG.Ptr BG.CInt
  -> IO (BG.Ptr (PtrConst.PtrConst SDL_TrayEntry))
hs_bindgen_db28f928b77b3b21 =
  BG.fromFFIType hs_bindgen_db28f928b77b3b21_base

-- | Returns a list of entries in the menu, in order.
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
  :: BG.Ptr SDL_TrayMenu
  -- ^
  --
  --           [@menu@]: The menu to get entries from.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: An optional pointer to obtain the number of entries in the menu.
  -> IO (BG.Ptr (PtrConst.PtrConst SDL_TrayEntry))
sDL_GetTrayEntries = hs_bindgen_db28f928b77b3b21

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_RemoveTrayEntry@
foreign import ccall safe "hs_bindgen_760690f62725f41d"
  hs_bindgen_760690f62725f41d_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_RemoveTrayEntry@
hs_bindgen_760690f62725f41d
  :: BG.Ptr SDL_TrayEntry
  -> IO ()
hs_bindgen_760690f62725f41d =
  BG.fromFFIType hs_bindgen_760690f62725f41d_base

-- | Removes a tray entry.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt'
--
--     [C declaration]: @SDL_RemoveTrayEntry@, defined at @SDL3\/SDL_tray.h 282:34@
sDL_RemoveTrayEntry
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: The entry to be deleted.
  -> IO ()
sDL_RemoveTrayEntry = hs_bindgen_760690f62725f41d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_InsertTrayEntryAt@
foreign import ccall safe "hs_bindgen_97f828a3ddf4bda6"
  hs_bindgen_97f828a3ddf4bda6_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_InsertTrayEntryAt@
hs_bindgen_97f828a3ddf4bda6
  :: BG.Ptr SDL_TrayMenu
  -> BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> SDL_TrayEntryFlags
  -> IO (BG.Ptr SDL_TrayEntry)
hs_bindgen_97f828a3ddf4bda6 =
  BG.fromFFIType hs_bindgen_97f828a3ddf4bda6_base

-- | Insert a tray entry at a given position.
--
--     If label is NULL, the entry will be a separator. Many functions won\'t work for an entry that is a separator.
--
--     An entry does not need to be destroyed; it will be destroyed with the tray.
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
  :: BG.Ptr SDL_TrayMenu
  -- ^
  --
  --           [@menu@]: the menu to append the entry to.
  -> BG.CInt
  -- ^
  --
  --           [@pos@]: the desired position for the new entry. Entries at or following this place will be moved. If pos is -1, the entry is appended.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@label@]: the text to be displayed on the entry, in UTF-8 encoding, or NULL for a separator.
  -> SDL_TrayEntryFlags
  -- ^
  --
  --           [@flags@]: a combination of flags, some of which are mandatory.
  -> IO (BG.Ptr SDL_TrayEntry)
sDL_InsertTrayEntryAt = hs_bindgen_97f828a3ddf4bda6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_SetTrayEntryLabel@
foreign import ccall safe "hs_bindgen_d259c08f8b2fea97"
  hs_bindgen_d259c08f8b2fea97_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_SetTrayEntryLabel@
hs_bindgen_d259c08f8b2fea97
  :: BG.Ptr SDL_TrayEntry
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_d259c08f8b2fea97 =
  BG.fromFFIType hs_bindgen_d259c08f8b2fea97_base

-- | Sets the label of an entry.
--
--     An entry cannot change between a separator and an ordinary entry; that is, it is not possible to set a non-NULL label on an entry that has a NULL label (separators), or to set a NULL label to an entry that has a non-NULL label. The function will silently fail if that happens.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt', 'sDL_GetTrayEntryLabel'
--
--     [C declaration]: @SDL_SetTrayEntryLabel@, defined at @SDL3\/SDL_tray.h 332:34@
sDL_SetTrayEntryLabel
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be updated.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@label@]: the new label for the entry in UTF-8 encoding.
  -> IO ()
sDL_SetTrayEntryLabel = hs_bindgen_d259c08f8b2fea97

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayEntryLabel@
foreign import ccall safe "hs_bindgen_f42afcfe13e00a9d"
  hs_bindgen_f42afcfe13e00a9d_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayEntryLabel@
hs_bindgen_f42afcfe13e00a9d
  :: BG.Ptr SDL_TrayEntry
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_f42afcfe13e00a9d =
  BG.fromFFIType hs_bindgen_f42afcfe13e00a9d_base

-- | Gets the label of an entry.
--
--     If the returned value is NULL, the entry is a separator.
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
sDL_GetTrayEntryLabel
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be read.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetTrayEntryLabel = hs_bindgen_f42afcfe13e00a9d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_SetTrayEntryChecked@
foreign import ccall safe "hs_bindgen_c732ae30d80c2bac"
  hs_bindgen_c732ae30d80c2bac_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_SetTrayEntryChecked@
hs_bindgen_c732ae30d80c2bac
  :: BG.Ptr SDL_TrayEntry
  -> BG.CBool
  -> IO ()
hs_bindgen_c732ae30d80c2bac =
  BG.fromFFIType hs_bindgen_c732ae30d80c2bac_base

-- | Sets whether or not an entry is checked.
--
--     The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt', 'sDL_GetTrayEntryChecked'
--
--     [C declaration]: @SDL_SetTrayEntryChecked@, defined at @SDL3\/SDL_tray.h 370:34@
sDL_SetTrayEntryChecked
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be updated.
  -> BG.CBool
  -- ^
  --
  --           [@checked@]: true if the entry should be checked; false otherwise.
  -> IO ()
sDL_SetTrayEntryChecked = hs_bindgen_c732ae30d80c2bac

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayEntryChecked@
foreign import ccall safe "hs_bindgen_9ab5ede401963c0b"
  hs_bindgen_9ab5ede401963c0b_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayEntryChecked@
hs_bindgen_9ab5ede401963c0b
  :: BG.Ptr SDL_TrayEntry
  -> IO BG.CBool
hs_bindgen_9ab5ede401963c0b =
  BG.fromFFIType hs_bindgen_9ab5ede401963c0b_base

-- | Gets whether or not an entry is checked.
--
--     The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.
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
sDL_GetTrayEntryChecked
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be read.
  -> IO BG.CBool
sDL_GetTrayEntryChecked = hs_bindgen_9ab5ede401963c0b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_SetTrayEntryEnabled@
foreign import ccall safe "hs_bindgen_a82f265fc5763bf3"
  hs_bindgen_a82f265fc5763bf3_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_SetTrayEntryEnabled@
hs_bindgen_a82f265fc5763bf3
  :: BG.Ptr SDL_TrayEntry
  -> BG.CBool
  -> IO ()
hs_bindgen_a82f265fc5763bf3 =
  BG.fromFFIType hs_bindgen_a82f265fc5763bf3_base

-- | Sets whether or not an entry is enabled.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt', 'sDL_GetTrayEntryEnabled'
--
--     [C declaration]: @SDL_SetTrayEntryEnabled@, defined at @SDL3\/SDL_tray.h 406:34@
sDL_SetTrayEntryEnabled
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be updated.
  -> BG.CBool
  -- ^
  --
  --           [@enabled@]: true if the entry should be enabled; false otherwise.
  -> IO ()
sDL_SetTrayEntryEnabled = hs_bindgen_a82f265fc5763bf3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayEntryEnabled@
foreign import ccall safe "hs_bindgen_102ba65c8464342f"
  hs_bindgen_102ba65c8464342f_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayEntryEnabled@
hs_bindgen_102ba65c8464342f
  :: BG.Ptr SDL_TrayEntry
  -> IO BG.CBool
hs_bindgen_102ba65c8464342f =
  BG.fromFFIType hs_bindgen_102ba65c8464342f_base

-- | Gets whether or not an entry is enabled.
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
sDL_GetTrayEntryEnabled
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be read.
  -> IO BG.CBool
sDL_GetTrayEntryEnabled = hs_bindgen_102ba65c8464342f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_SetTrayEntryCallback@
foreign import ccall safe "hs_bindgen_94ff69ef9d4fdfe8"
  hs_bindgen_94ff69ef9d4fdfe8_base
    :: BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_SetTrayEntryCallback@
hs_bindgen_94ff69ef9d4fdfe8
  :: BG.Ptr SDL_TrayEntry
  -> SDL_TrayCallback
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_94ff69ef9d4fdfe8 =
  BG.fromFFIType hs_bindgen_94ff69ef9d4fdfe8_base

-- | Sets a callback to be invoked when the entry is selected.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTrayEntries', 'sDL_InsertTrayEntryAt'
--
--     [C declaration]: @SDL_SetTrayEntryCallback@, defined at @SDL3\/SDL_tray.h 441:34@
sDL_SetTrayEntryCallback
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be updated.
  -> SDL_TrayCallback
  -- ^
  --
  --           [@callback@]: a callback to be invoked when the entry is selected.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an optional pointer to pass extra data to the callback when it will be invoked.
  -> IO ()
sDL_SetTrayEntryCallback =
  hs_bindgen_94ff69ef9d4fdfe8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_ClickTrayEntry@
foreign import ccall safe "hs_bindgen_0157d583c118c3cc"
  hs_bindgen_0157d583c118c3cc_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_ClickTrayEntry@
hs_bindgen_0157d583c118c3cc
  :: BG.Ptr SDL_TrayEntry
  -> IO ()
hs_bindgen_0157d583c118c3cc =
  BG.fromFFIType hs_bindgen_0157d583c118c3cc_base

-- | Simulate a click on a tray entry.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ClickTrayEntry@, defined at @SDL3\/SDL_tray.h 453:34@
sDL_ClickTrayEntry
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: The entry to activate.
  -> IO ()
sDL_ClickTrayEntry = hs_bindgen_0157d583c118c3cc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_DestroyTray@
foreign import ccall safe "hs_bindgen_8b1a746817e6df61"
  hs_bindgen_8b1a746817e6df61_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_DestroyTray@
hs_bindgen_8b1a746817e6df61
  :: BG.Ptr SDL_Tray
  -> IO ()
hs_bindgen_8b1a746817e6df61 =
  BG.fromFFIType hs_bindgen_8b1a746817e6df61_base

-- | Destroys a tray object.
--
--     This also destroys all associated menus and entries.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTray'
--
--     [C declaration]: @SDL_DestroyTray@, defined at @SDL3\/SDL_tray.h 469:34@
sDL_DestroyTray
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray icon to be destroyed.
  -> IO ()
sDL_DestroyTray = hs_bindgen_8b1a746817e6df61

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayEntryParent@
foreign import ccall safe "hs_bindgen_7ca22a5fb9c165d8"
  hs_bindgen_7ca22a5fb9c165d8_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayEntryParent@
hs_bindgen_7ca22a5fb9c165d8
  :: BG.Ptr SDL_TrayEntry
  -> IO (BG.Ptr SDL_TrayMenu)
hs_bindgen_7ca22a5fb9c165d8 =
  BG.fromFFIType hs_bindgen_7ca22a5fb9c165d8_base

-- | Gets the menu containing a certain tray entry.
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
sDL_GetTrayEntryParent
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry for which to get the parent menu.
  -> IO (BG.Ptr SDL_TrayMenu)
sDL_GetTrayEntryParent = hs_bindgen_7ca22a5fb9c165d8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayMenuParentEntry@
foreign import ccall safe "hs_bindgen_6e7d37f626feacc8"
  hs_bindgen_6e7d37f626feacc8_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayMenuParentEntry@
hs_bindgen_6e7d37f626feacc8
  :: BG.Ptr SDL_TrayMenu
  -> IO (BG.Ptr SDL_TrayEntry)
hs_bindgen_6e7d37f626feacc8 =
  BG.fromFFIType hs_bindgen_6e7d37f626feacc8_base

-- | Gets the entry for which the menu is a submenu, if the current menu is a submenu.
--
--     Either this function or @SDL_GetTrayMenuParentTray()@ will return non-NULL for any given menu.
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
sDL_GetTrayMenuParentEntry
  :: BG.Ptr SDL_TrayMenu
  -- ^
  --
  --           [@menu@]: the menu for which to get the parent entry.
  -> IO (BG.Ptr SDL_TrayEntry)
sDL_GetTrayMenuParentEntry =
  hs_bindgen_6e7d37f626feacc8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayMenuParentTray@
foreign import ccall safe "hs_bindgen_9e7d7b320d4c4ce1"
  hs_bindgen_9e7d7b320d4c4ce1_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_GetTrayMenuParentTray@
hs_bindgen_9e7d7b320d4c4ce1
  :: BG.Ptr SDL_TrayMenu
  -> IO (BG.Ptr SDL_Tray)
hs_bindgen_9e7d7b320d4c4ce1 =
  BG.fromFFIType hs_bindgen_9e7d7b320d4c4ce1_base

-- | Gets the tray for which this menu is the first-level menu, if the current menu isn\'t a submenu.
--
--     Either this function or @SDL_GetTrayMenuParentEntry()@ will return non-NULL for any given menu.
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
sDL_GetTrayMenuParentTray
  :: BG.Ptr SDL_TrayMenu
  -- ^
  --
  --           [@menu@]: the menu for which to get the parent enttrayry.
  -> IO (BG.Ptr SDL_Tray)
sDL_GetTrayMenuParentTray =
  hs_bindgen_9e7d7b320d4c4ce1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_UpdateTrays@
foreign import ccall safe "hs_bindgen_92bb76cd94576ed5"
  hs_bindgen_92bb76cd94576ed5_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Safe_SDL_UpdateTrays@
hs_bindgen_92bb76cd94576ed5 :: IO ()
hs_bindgen_92bb76cd94576ed5 =
  BG.fromFFIType hs_bindgen_92bb76cd94576ed5_base

-- | Update the trays.
--
--     This is called automatically by the event loop and is only needed if you\'re using trays but aren\'t handling SDL events.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UpdateTrays@, defined at @SDL3\/SDL_tray.h 536:34@
sDL_UpdateTrays :: IO ()
sDL_UpdateTrays = hs_bindgen_92bb76cd94576ed5

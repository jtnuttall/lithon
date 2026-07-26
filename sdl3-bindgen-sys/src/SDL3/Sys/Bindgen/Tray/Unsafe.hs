{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Tray.Unsafe (
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_CreateTray,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_SetTrayIcon,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_SetTrayTooltip,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_CreateTrayMenu,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_CreateTraySubmenu,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_GetTrayMenu,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_GetTraySubmenu,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_GetTrayEntries,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_RemoveTrayEntry,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_InsertTrayEntryAt,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_SetTrayEntryLabel,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_GetTrayEntryLabel,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_SetTrayEntryChecked,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_GetTrayEntryChecked,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_SetTrayEntryEnabled,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_GetTrayEntryEnabled,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_SetTrayEntryCallback,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_ClickTrayEntry,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_DestroyTray,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_GetTrayEntryParent,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_GetTrayMenuParentEntry,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_GetTrayMenuParentTray,
  SDL3.Sys.Bindgen.Tray.Unsafe.sDL_UpdateTrays,
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
         , "SDL_Tray *hs_bindgen_e85818417f6c25aa ("
         , "  SDL_Surface *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateTray)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_9aff16c03b0f79a4 ("
         , "  SDL_Tray *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  (SDL_SetTrayIcon)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_3a0f6abbabc3be43 ("
         , "  SDL_Tray *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (SDL_SetTrayTooltip)(arg1, arg2);"
         , "}"
         , "SDL_TrayMenu *hs_bindgen_bd35a68090435dd7 ("
         , "  SDL_Tray *arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateTrayMenu)(arg1);"
         , "}"
         , "SDL_TrayMenu *hs_bindgen_c024bcab15166d09 ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateTraySubmenu)(arg1);"
         , "}"
         , "SDL_TrayMenu *hs_bindgen_a75b79185593c812 ("
         , "  SDL_Tray *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayMenu)(arg1);"
         , "}"
         , "SDL_TrayMenu *hs_bindgen_a4e00099ee20fd23 ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTraySubmenu)(arg1);"
         , "}"
         , "SDL_TrayEntry const **hs_bindgen_210fd2f6b416750d ("
         , "  SDL_TrayMenu *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetTrayEntries)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_6b3503beb8dd3ba3 ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  (SDL_RemoveTrayEntry)(arg1);"
         , "}"
         , "SDL_TrayEntry *hs_bindgen_cc14c44dbb0c78cb ("
         , "  SDL_TrayMenu *arg1,"
         , "  signed int arg2,"
         , "  char const *arg3,"
         , "  SDL_TrayEntryFlags arg4"
         , ")"
         , "{"
         , "  return (SDL_InsertTrayEntryAt)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_504886286a699c39 ("
         , "  SDL_TrayEntry *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (SDL_SetTrayEntryLabel)(arg1, arg2);"
         , "}"
         , "char const *hs_bindgen_9759e7e644805c7d ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayEntryLabel)(arg1);"
         , "}"
         , "void hs_bindgen_74cb41035d525059 ("
         , "  SDL_TrayEntry *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  (SDL_SetTrayEntryChecked)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_fe94492d1c67a601 ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayEntryChecked)(arg1);"
         , "}"
         , "void hs_bindgen_5263a949bd152767 ("
         , "  SDL_TrayEntry *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  (SDL_SetTrayEntryEnabled)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_76a35c1dee9b4197 ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayEntryEnabled)(arg1);"
         , "}"
         , "void hs_bindgen_3a82abfce11b4c94 ("
         , "  SDL_TrayEntry *arg1,"
         , "  SDL_TrayCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  (SDL_SetTrayEntryCallback)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_a8a4d1df90923df2 ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  (SDL_ClickTrayEntry)(arg1);"
         , "}"
         , "void hs_bindgen_fe47cafa5c754a5a ("
         , "  SDL_Tray *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyTray)(arg1);"
         , "}"
         , "SDL_TrayMenu *hs_bindgen_3e7aeb66ff2f2f10 ("
         , "  SDL_TrayEntry *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayEntryParent)(arg1);"
         , "}"
         , "SDL_TrayEntry *hs_bindgen_89d0a7d911ebcebd ("
         , "  SDL_TrayMenu *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayMenuParentEntry)(arg1);"
         , "}"
         , "SDL_Tray *hs_bindgen_48fcf0bd7a472bcb ("
         , "  SDL_TrayMenu *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTrayMenuParentTray)(arg1);"
         , "}"
         , "void hs_bindgen_03e94a19f107d107 (void)"
         , "{"
         , "  (SDL_UpdateTrays)();"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_CreateTray@
foreign import ccall unsafe "hs_bindgen_e85818417f6c25aa"
  hs_bindgen_e85818417f6c25aa_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_CreateTray@
hs_bindgen_e85818417f6c25aa
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr SDL_Tray)
hs_bindgen_e85818417f6c25aa =
  BG.fromFFIType hs_bindgen_e85818417f6c25aa_base

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
sDL_CreateTray = hs_bindgen_e85818417f6c25aa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_SetTrayIcon@
foreign import ccall unsafe "hs_bindgen_9aff16c03b0f79a4"
  hs_bindgen_9aff16c03b0f79a4_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_SetTrayIcon@
hs_bindgen_9aff16c03b0f79a4
  :: BG.Ptr SDL_Tray
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> IO ()
hs_bindgen_9aff16c03b0f79a4 =
  BG.fromFFIType hs_bindgen_9aff16c03b0f79a4_base

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
sDL_SetTrayIcon = hs_bindgen_9aff16c03b0f79a4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_SetTrayTooltip@
foreign import ccall unsafe "hs_bindgen_3a0f6abbabc3be43"
  hs_bindgen_3a0f6abbabc3be43_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_SetTrayTooltip@
hs_bindgen_3a0f6abbabc3be43
  :: BG.Ptr SDL_Tray
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_3a0f6abbabc3be43 =
  BG.fromFFIType hs_bindgen_3a0f6abbabc3be43_base

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
sDL_SetTrayTooltip = hs_bindgen_3a0f6abbabc3be43

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_CreateTrayMenu@
foreign import ccall unsafe "hs_bindgen_bd35a68090435dd7"
  hs_bindgen_bd35a68090435dd7_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_CreateTrayMenu@
hs_bindgen_bd35a68090435dd7
  :: BG.Ptr SDL_Tray
  -> IO (BG.Ptr SDL_TrayMenu)
hs_bindgen_bd35a68090435dd7 =
  BG.fromFFIType hs_bindgen_bd35a68090435dd7_base

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
sDL_CreateTrayMenu = hs_bindgen_bd35a68090435dd7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_CreateTraySubmenu@
foreign import ccall unsafe "hs_bindgen_c024bcab15166d09"
  hs_bindgen_c024bcab15166d09_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_CreateTraySubmenu@
hs_bindgen_c024bcab15166d09
  :: BG.Ptr SDL_TrayEntry
  -> IO (BG.Ptr SDL_TrayMenu)
hs_bindgen_c024bcab15166d09 =
  BG.fromFFIType hs_bindgen_c024bcab15166d09_base

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
sDL_CreateTraySubmenu = hs_bindgen_c024bcab15166d09

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayMenu@
foreign import ccall unsafe "hs_bindgen_a75b79185593c812"
  hs_bindgen_a75b79185593c812_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayMenu@
hs_bindgen_a75b79185593c812
  :: BG.Ptr SDL_Tray
  -> IO (BG.Ptr SDL_TrayMenu)
hs_bindgen_a75b79185593c812 =
  BG.fromFFIType hs_bindgen_a75b79185593c812_base

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
sDL_GetTrayMenu = hs_bindgen_a75b79185593c812

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTraySubmenu@
foreign import ccall unsafe "hs_bindgen_a4e00099ee20fd23"
  hs_bindgen_a4e00099ee20fd23_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTraySubmenu@
hs_bindgen_a4e00099ee20fd23
  :: BG.Ptr SDL_TrayEntry
  -> IO (BG.Ptr SDL_TrayMenu)
hs_bindgen_a4e00099ee20fd23 =
  BG.fromFFIType hs_bindgen_a4e00099ee20fd23_base

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
sDL_GetTraySubmenu = hs_bindgen_a4e00099ee20fd23

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayEntries@
foreign import ccall unsafe "hs_bindgen_210fd2f6b416750d"
  hs_bindgen_210fd2f6b416750d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayEntries@
hs_bindgen_210fd2f6b416750d
  :: BG.Ptr SDL_TrayMenu
  -> BG.Ptr BG.CInt
  -> IO (BG.Ptr (PtrConst.PtrConst SDL_TrayEntry))
hs_bindgen_210fd2f6b416750d =
  BG.fromFFIType hs_bindgen_210fd2f6b416750d_base

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
sDL_GetTrayEntries = hs_bindgen_210fd2f6b416750d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_RemoveTrayEntry@
foreign import ccall unsafe "hs_bindgen_6b3503beb8dd3ba3"
  hs_bindgen_6b3503beb8dd3ba3_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_RemoveTrayEntry@
hs_bindgen_6b3503beb8dd3ba3
  :: BG.Ptr SDL_TrayEntry
  -> IO ()
hs_bindgen_6b3503beb8dd3ba3 =
  BG.fromFFIType hs_bindgen_6b3503beb8dd3ba3_base

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
sDL_RemoveTrayEntry = hs_bindgen_6b3503beb8dd3ba3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_InsertTrayEntryAt@
foreign import ccall unsafe "hs_bindgen_cc14c44dbb0c78cb"
  hs_bindgen_cc14c44dbb0c78cb_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_InsertTrayEntryAt@
hs_bindgen_cc14c44dbb0c78cb
  :: BG.Ptr SDL_TrayMenu
  -> BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> SDL_TrayEntryFlags
  -> IO (BG.Ptr SDL_TrayEntry)
hs_bindgen_cc14c44dbb0c78cb =
  BG.fromFFIType hs_bindgen_cc14c44dbb0c78cb_base

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
sDL_InsertTrayEntryAt = hs_bindgen_cc14c44dbb0c78cb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_SetTrayEntryLabel@
foreign import ccall unsafe "hs_bindgen_504886286a699c39"
  hs_bindgen_504886286a699c39_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_SetTrayEntryLabel@
hs_bindgen_504886286a699c39
  :: BG.Ptr SDL_TrayEntry
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_504886286a699c39 =
  BG.fromFFIType hs_bindgen_504886286a699c39_base

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
sDL_SetTrayEntryLabel = hs_bindgen_504886286a699c39

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayEntryLabel@
foreign import ccall unsafe "hs_bindgen_9759e7e644805c7d"
  hs_bindgen_9759e7e644805c7d_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayEntryLabel@
hs_bindgen_9759e7e644805c7d
  :: BG.Ptr SDL_TrayEntry
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_9759e7e644805c7d =
  BG.fromFFIType hs_bindgen_9759e7e644805c7d_base

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
sDL_GetTrayEntryLabel = hs_bindgen_9759e7e644805c7d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_SetTrayEntryChecked@
foreign import ccall unsafe "hs_bindgen_74cb41035d525059"
  hs_bindgen_74cb41035d525059_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_SetTrayEntryChecked@
hs_bindgen_74cb41035d525059
  :: BG.Ptr SDL_TrayEntry
  -> BG.CBool
  -> IO ()
hs_bindgen_74cb41035d525059 =
  BG.fromFFIType hs_bindgen_74cb41035d525059_base

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
sDL_SetTrayEntryChecked = hs_bindgen_74cb41035d525059

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayEntryChecked@
foreign import ccall unsafe "hs_bindgen_fe94492d1c67a601"
  hs_bindgen_fe94492d1c67a601_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayEntryChecked@
hs_bindgen_fe94492d1c67a601
  :: BG.Ptr SDL_TrayEntry
  -> IO BG.CBool
hs_bindgen_fe94492d1c67a601 =
  BG.fromFFIType hs_bindgen_fe94492d1c67a601_base

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
sDL_GetTrayEntryChecked = hs_bindgen_fe94492d1c67a601

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_SetTrayEntryEnabled@
foreign import ccall unsafe "hs_bindgen_5263a949bd152767"
  hs_bindgen_5263a949bd152767_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_SetTrayEntryEnabled@
hs_bindgen_5263a949bd152767
  :: BG.Ptr SDL_TrayEntry
  -> BG.CBool
  -> IO ()
hs_bindgen_5263a949bd152767 =
  BG.fromFFIType hs_bindgen_5263a949bd152767_base

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
sDL_SetTrayEntryEnabled = hs_bindgen_5263a949bd152767

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayEntryEnabled@
foreign import ccall unsafe "hs_bindgen_76a35c1dee9b4197"
  hs_bindgen_76a35c1dee9b4197_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayEntryEnabled@
hs_bindgen_76a35c1dee9b4197
  :: BG.Ptr SDL_TrayEntry
  -> IO BG.CBool
hs_bindgen_76a35c1dee9b4197 =
  BG.fromFFIType hs_bindgen_76a35c1dee9b4197_base

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
sDL_GetTrayEntryEnabled = hs_bindgen_76a35c1dee9b4197

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_SetTrayEntryCallback@
foreign import ccall unsafe "hs_bindgen_3a82abfce11b4c94"
  hs_bindgen_3a82abfce11b4c94_base
    :: BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_SetTrayEntryCallback@
hs_bindgen_3a82abfce11b4c94
  :: BG.Ptr SDL_TrayEntry
  -> SDL_TrayCallback
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_3a82abfce11b4c94 =
  BG.fromFFIType hs_bindgen_3a82abfce11b4c94_base

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
  hs_bindgen_3a82abfce11b4c94

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_ClickTrayEntry@
foreign import ccall unsafe "hs_bindgen_a8a4d1df90923df2"
  hs_bindgen_a8a4d1df90923df2_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_ClickTrayEntry@
hs_bindgen_a8a4d1df90923df2
  :: BG.Ptr SDL_TrayEntry
  -> IO ()
hs_bindgen_a8a4d1df90923df2 =
  BG.fromFFIType hs_bindgen_a8a4d1df90923df2_base

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
sDL_ClickTrayEntry = hs_bindgen_a8a4d1df90923df2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_DestroyTray@
foreign import ccall unsafe "hs_bindgen_fe47cafa5c754a5a"
  hs_bindgen_fe47cafa5c754a5a_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_DestroyTray@
hs_bindgen_fe47cafa5c754a5a
  :: BG.Ptr SDL_Tray
  -> IO ()
hs_bindgen_fe47cafa5c754a5a =
  BG.fromFFIType hs_bindgen_fe47cafa5c754a5a_base

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
sDL_DestroyTray = hs_bindgen_fe47cafa5c754a5a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayEntryParent@
foreign import ccall unsafe "hs_bindgen_3e7aeb66ff2f2f10"
  hs_bindgen_3e7aeb66ff2f2f10_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayEntryParent@
hs_bindgen_3e7aeb66ff2f2f10
  :: BG.Ptr SDL_TrayEntry
  -> IO (BG.Ptr SDL_TrayMenu)
hs_bindgen_3e7aeb66ff2f2f10 =
  BG.fromFFIType hs_bindgen_3e7aeb66ff2f2f10_base

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
sDL_GetTrayEntryParent = hs_bindgen_3e7aeb66ff2f2f10

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayMenuParentEntry@
foreign import ccall unsafe "hs_bindgen_89d0a7d911ebcebd"
  hs_bindgen_89d0a7d911ebcebd_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayMenuParentEntry@
hs_bindgen_89d0a7d911ebcebd
  :: BG.Ptr SDL_TrayMenu
  -> IO (BG.Ptr SDL_TrayEntry)
hs_bindgen_89d0a7d911ebcebd =
  BG.fromFFIType hs_bindgen_89d0a7d911ebcebd_base

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
  hs_bindgen_89d0a7d911ebcebd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayMenuParentTray@
foreign import ccall unsafe "hs_bindgen_48fcf0bd7a472bcb"
  hs_bindgen_48fcf0bd7a472bcb_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_GetTrayMenuParentTray@
hs_bindgen_48fcf0bd7a472bcb
  :: BG.Ptr SDL_TrayMenu
  -> IO (BG.Ptr SDL_Tray)
hs_bindgen_48fcf0bd7a472bcb =
  BG.fromFFIType hs_bindgen_48fcf0bd7a472bcb_base

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
  hs_bindgen_48fcf0bd7a472bcb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_UpdateTrays@
foreign import ccall unsafe "hs_bindgen_03e94a19f107d107"
  hs_bindgen_03e94a19f107d107_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Tray_Unsafe_SDL_UpdateTrays@
hs_bindgen_03e94a19f107d107 :: IO ()
hs_bindgen_03e94a19f107d107 =
  BG.fromFFIType hs_bindgen_03e94a19f107d107_base

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
sDL_UpdateTrays = hs_bindgen_03e94a19f107d107

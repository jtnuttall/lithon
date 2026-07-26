{-# LANGUAGE PatternSynonyms #-}

-- | SDL offers a way to add items to the \"system tray\" (more correctly called the \"notification area\" on Windows). On platforms that offer this concept, an SDL app can add a tray icon, submenus, checkboxes, and clickable entries, and register a callback that is fired when the user clicks on these pieces. An opaque handle representing a toplevel system tray object.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Tray.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Tray (
  module SDL3.Sys.Bindgen.Tray,

  -- * Typed constants
  pattern SDL3.Sys.Tray.SDL_TRAYENTRY_BUTTON,
  pattern SDL3.Sys.Tray.SDL_TRAYENTRY_CHECKBOX,
  pattern SDL3.Sys.Tray.SDL_TRAYENTRY_SUBMENU,
  pattern SDL3.Sys.Tray.SDL_TRAYENTRY_DISABLED,
  pattern SDL3.Sys.Tray.SDL_TRAYENTRY_CHECKED,

  -- * Function aliases
  SDL3.Sys.Tray.createTray,
  SDL3.Sys.Tray.createTraySafe,
  SDL3.Sys.Tray.setTrayIcon,
  SDL3.Sys.Tray.setTrayIconSafe,
  SDL3.Sys.Tray.setTrayTooltip,
  SDL3.Sys.Tray.setTrayTooltipSafe,
  SDL3.Sys.Tray.createTrayMenu,
  SDL3.Sys.Tray.createTrayMenuSafe,
  SDL3.Sys.Tray.createTraySubmenu,
  SDL3.Sys.Tray.createTraySubmenuSafe,
  SDL3.Sys.Tray.getTrayMenu,
  SDL3.Sys.Tray.getTrayMenuSafe,
  SDL3.Sys.Tray.getTraySubmenu,
  SDL3.Sys.Tray.getTraySubmenuSafe,
  SDL3.Sys.Tray.getTrayEntries,
  SDL3.Sys.Tray.getTrayEntriesSafe,
  SDL3.Sys.Tray.removeTrayEntry,
  SDL3.Sys.Tray.removeTrayEntrySafe,
  SDL3.Sys.Tray.insertTrayEntryAt,
  SDL3.Sys.Tray.insertTrayEntryAtSafe,
  SDL3.Sys.Tray.setTrayEntryLabel,
  SDL3.Sys.Tray.setTrayEntryLabelSafe,
  SDL3.Sys.Tray.getTrayEntryLabel,
  SDL3.Sys.Tray.getTrayEntryLabelSafe,
  SDL3.Sys.Tray.setTrayEntryChecked,
  SDL3.Sys.Tray.setTrayEntryCheckedSafe,
  SDL3.Sys.Tray.getTrayEntryChecked,
  SDL3.Sys.Tray.getTrayEntryCheckedSafe,
  SDL3.Sys.Tray.setTrayEntryEnabled,
  SDL3.Sys.Tray.setTrayEntryEnabledSafe,
  SDL3.Sys.Tray.getTrayEntryEnabled,
  SDL3.Sys.Tray.getTrayEntryEnabledSafe,
  SDL3.Sys.Tray.setTrayEntryCallback,
  SDL3.Sys.Tray.setTrayEntryCallbackSafe,
  SDL3.Sys.Tray.clickTrayEntry,
  SDL3.Sys.Tray.clickTrayEntrySafe,
  SDL3.Sys.Tray.destroyTray,
  SDL3.Sys.Tray.destroyTraySafe,
  SDL3.Sys.Tray.getTrayEntryParent,
  SDL3.Sys.Tray.getTrayEntryParentSafe,
  SDL3.Sys.Tray.getTrayMenuParentEntry,
  SDL3.Sys.Tray.getTrayMenuParentEntrySafe,
  SDL3.Sys.Tray.getTrayMenuParentTray,
  SDL3.Sys.Tray.getTrayMenuParentTraySafe,
  SDL3.Sys.Tray.updateTrays,
  SDL3.Sys.Tray.updateTraysSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Surface qualified
import SDL3.Sys.Bindgen.Tray
import SDL3.Sys.Bindgen.Tray.Safe qualified as Safe
import SDL3.Sys.Bindgen.Tray.Unsafe qualified as Unsafe

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
--     [See also]: 'createTrayMenu', 'getTrayMenu', 'destroyTray'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateTray@.
--                   The safe flavor is 'createTraySafe'
--                   .
--
--     [C declaration]: @SDL_CreateTray@, defined at @SDL3\/SDL_tray.h 121:40@
createTray
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@icon@]: a surface to be used as icon. May be NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@tooltip@]: a tooltip to be displayed when the mouse hovers the icon in UTF-8 encoding. Not supported on all platforms. May be NULL.
  -> IO (BG.Ptr SDL_Tray)
createTray = Unsafe.sDL_CreateTray

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
--     [See also]: 'createTrayMenu', 'getTrayMenu', 'destroyTray'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateTray@.
--                   The unsafe flavor is 'createTray'
--                   .
--
--     [C declaration]: @SDL_CreateTray@, defined at @SDL3\/SDL_tray.h 121:40@
createTraySafe
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@icon@]: a surface to be used as icon. May be NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@tooltip@]: a tooltip to be displayed when the mouse hovers the icon in UTF-8 encoding. Not supported on all platforms. May be NULL.
  -> IO (BG.Ptr SDL_Tray)
createTraySafe = Safe.sDL_CreateTray

-- | Updates the system tray icon\'s icon.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTray'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTrayIcon@.
--                   The safe flavor is 'setTrayIconSafe'
--                   .
--
--     [C declaration]: @SDL_SetTrayIcon@, defined at @SDL3\/SDL_tray.h 136:34@
setTrayIcon
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray icon to be updated.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@icon@]: the new icon. May be NULL.
  -> IO ()
setTrayIcon = Unsafe.sDL_SetTrayIcon

-- | Updates the system tray icon\'s icon.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTray'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTrayIcon@.
--                   The unsafe flavor is 'setTrayIcon'
--                   .
--
--     [C declaration]: @SDL_SetTrayIcon@, defined at @SDL3\/SDL_tray.h 136:34@
setTrayIconSafe
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray icon to be updated.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@icon@]: the new icon. May be NULL.
  -> IO ()
setTrayIconSafe = Safe.sDL_SetTrayIcon

-- | Updates the system tray icon\'s tooltip.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTray'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTrayTooltip@.
--                   The safe flavor is 'setTrayTooltipSafe'
--                   .
--
--     [C declaration]: @SDL_SetTrayTooltip@, defined at @SDL3\/SDL_tray.h 151:34@
setTrayTooltip
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray icon to be updated.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@tooltip@]: the new tooltip in UTF-8 encoding. May be NULL.
  -> IO ()
setTrayTooltip = Unsafe.sDL_SetTrayTooltip

-- | Updates the system tray icon\'s tooltip.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTray'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTrayTooltip@.
--                   The unsafe flavor is 'setTrayTooltip'
--                   .
--
--     [C declaration]: @SDL_SetTrayTooltip@, defined at @SDL3\/SDL_tray.h 151:34@
setTrayTooltipSafe
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray icon to be updated.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@tooltip@]: the new tooltip in UTF-8 encoding. May be NULL.
  -> IO ()
setTrayTooltipSafe = Safe.sDL_SetTrayTooltip

-- | Create a menu for a system tray.
--
--     This should be called at most once per tray icon.
--
--     This function does the same thing as @'createTraySubmenu'@, except that it takes a 'SDL_Tray' instead of a 'SDL_TrayEntry'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
--
--     [Returns]: the newly created menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTray', 'getTrayMenu', 'getTrayMenuParentTray'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateTrayMenu@.
--                   The safe flavor is 'createTrayMenuSafe'
--                   .
--
--     [C declaration]: @SDL_CreateTrayMenu@, defined at @SDL3\/SDL_tray.h 175:44@
createTrayMenu
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray to bind the menu to.
  -> IO (BG.Ptr SDL_TrayMenu)
createTrayMenu = Unsafe.sDL_CreateTrayMenu

-- | Create a menu for a system tray.
--
--     This should be called at most once per tray icon.
--
--     This function does the same thing as @'createTraySubmenu'@, except that it takes a 'SDL_Tray' instead of a 'SDL_TrayEntry'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
--
--     [Returns]: the newly created menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTray', 'getTrayMenu', 'getTrayMenuParentTray'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateTrayMenu@.
--                   The unsafe flavor is 'createTrayMenu'
--                   .
--
--     [C declaration]: @SDL_CreateTrayMenu@, defined at @SDL3\/SDL_tray.h 175:44@
createTrayMenuSafe
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray to bind the menu to.
  -> IO (BG.Ptr SDL_TrayMenu)
createTrayMenuSafe = Safe.sDL_CreateTrayMenu

-- | Create a submenu for a system tray entry.
--
--     This should be called at most once per tray entry.
--
--     This function does the same thing as 'createTrayMenu', except that it takes a 'SDL_TrayEntry' instead of a 'SDL_Tray'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
--
--     [Returns]: the newly created menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'insertTrayEntryAt', 'getTraySubmenu', 'getTrayMenuParentEntry'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateTraySubmenu@.
--                   The safe flavor is 'createTraySubmenuSafe'
--                   .
--
--     [C declaration]: @SDL_CreateTraySubmenu@, defined at @SDL3\/SDL_tray.h 199:44@
createTraySubmenu
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the tray entry to bind the menu to.
  -> IO (BG.Ptr SDL_TrayMenu)
createTraySubmenu = Unsafe.sDL_CreateTraySubmenu

-- | Create a submenu for a system tray entry.
--
--     This should be called at most once per tray entry.
--
--     This function does the same thing as 'createTrayMenu', except that it takes a 'SDL_TrayEntry' instead of a 'SDL_Tray'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
--
--     [Returns]: the newly created menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'insertTrayEntryAt', 'getTraySubmenu', 'getTrayMenuParentEntry'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateTraySubmenu@.
--                   The unsafe flavor is 'createTraySubmenu'
--                   .
--
--     [C declaration]: @SDL_CreateTraySubmenu@, defined at @SDL3\/SDL_tray.h 199:44@
createTraySubmenuSafe
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the tray entry to bind the menu to.
  -> IO (BG.Ptr SDL_TrayMenu)
createTraySubmenuSafe = Safe.sDL_CreateTraySubmenu

-- | Gets a previously created tray menu.
--
--     You should have called @'createTrayMenu'@ on the tray object. This function allows you to fetch it again later.
--
--     This function does the same thing as @'getTraySubmenu'@, except that it takes a 'SDL_Tray' instead of a 'SDL_TrayEntry'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
--
--     [Returns]: the newly created menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTray', 'createTrayMenu'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTrayMenu@.
--                   The safe flavor is 'getTrayMenuSafe'
--                   .
--
--     [C declaration]: @SDL_GetTrayMenu@, defined at @SDL3\/SDL_tray.h 223:44@
getTrayMenu
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray entry to bind the menu to.
  -> IO (BG.Ptr SDL_TrayMenu)
getTrayMenu = Unsafe.sDL_GetTrayMenu

-- | Gets a previously created tray menu.
--
--     You should have called @'createTrayMenu'@ on the tray object. This function allows you to fetch it again later.
--
--     This function does the same thing as @'getTraySubmenu'@, except that it takes a 'SDL_Tray' instead of a 'SDL_TrayEntry'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
--
--     [Returns]: the newly created menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTray', 'createTrayMenu'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTrayMenu@.
--                   The unsafe flavor is 'getTrayMenu'
--                   .
--
--     [C declaration]: @SDL_GetTrayMenu@, defined at @SDL3\/SDL_tray.h 223:44@
getTrayMenuSafe
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray entry to bind the menu to.
  -> IO (BG.Ptr SDL_TrayMenu)
getTrayMenuSafe = Safe.sDL_GetTrayMenu

-- | Gets a previously created tray entry submenu.
--
--     You should have called @'createTraySubmenu'@ on the entry object. This function allows you to fetch it again later.
--
--     This function does the same thing as @'getTrayMenu'@, except that it takes a 'SDL_TrayEntry' instead of a 'SDL_Tray'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
--
--     [Returns]: the newly created menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'insertTrayEntryAt', 'createTraySubmenu'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTraySubmenu@.
--                   The safe flavor is 'getTraySubmenuSafe'
--                   .
--
--     [C declaration]: @SDL_GetTraySubmenu@, defined at @SDL3\/SDL_tray.h 247:44@
getTraySubmenu
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the tray entry to bind the menu to.
  -> IO (BG.Ptr SDL_TrayMenu)
getTraySubmenu = Unsafe.sDL_GetTraySubmenu

-- | Gets a previously created tray entry submenu.
--
--     You should have called @'createTraySubmenu'@ on the entry object. This function allows you to fetch it again later.
--
--     This function does the same thing as @'getTrayMenu'@, except that it takes a 'SDL_TrayEntry' instead of a 'SDL_Tray'.
--
--     A menu does not need to be destroyed; it will be destroyed with the tray.
--
--     [Returns]: the newly created menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'insertTrayEntryAt', 'createTraySubmenu'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTraySubmenu@.
--                   The unsafe flavor is 'getTraySubmenu'
--                   .
--
--     [C declaration]: @SDL_GetTraySubmenu@, defined at @SDL3\/SDL_tray.h 247:44@
getTraySubmenuSafe
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the tray entry to bind the menu to.
  -> IO (BG.Ptr SDL_TrayMenu)
getTraySubmenuSafe = Safe.sDL_GetTraySubmenu

-- | Returns a list of entries in the menu, in order.
--
--     [Returns]: a NULL-terminated list of entries within the given menu. The pointer becomes invalid when any function that inserts or deletes entries in the menu is called.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'removeTrayEntry', 'insertTrayEntryAt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTrayEntries@.
--                   The safe flavor is 'getTrayEntriesSafe'
--                   .
--
--     [C declaration]: @SDL_GetTrayEntries@, defined at @SDL3\/SDL_tray.h 267:52@
getTrayEntries
  :: BG.Ptr SDL_TrayMenu
  -- ^
  --
  --           [@menu@]: The menu to get entries from.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: An optional pointer to obtain the number of entries in the menu.
  -> IO (BG.Ptr (PtrConst.PtrConst SDL_TrayEntry))
getTrayEntries = Unsafe.sDL_GetTrayEntries

-- | Returns a list of entries in the menu, in order.
--
--     [Returns]: a NULL-terminated list of entries within the given menu. The pointer becomes invalid when any function that inserts or deletes entries in the menu is called.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'removeTrayEntry', 'insertTrayEntryAt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTrayEntries@.
--                   The unsafe flavor is 'getTrayEntries'
--                   .
--
--     [C declaration]: @SDL_GetTrayEntries@, defined at @SDL3\/SDL_tray.h 267:52@
getTrayEntriesSafe
  :: BG.Ptr SDL_TrayMenu
  -- ^
  --
  --           [@menu@]: The menu to get entries from.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: An optional pointer to obtain the number of entries in the menu.
  -> IO (BG.Ptr (PtrConst.PtrConst SDL_TrayEntry))
getTrayEntriesSafe = Safe.sDL_GetTrayEntries

-- | Removes a tray entry.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RemoveTrayEntry@.
--                   The safe flavor is 'removeTrayEntrySafe'
--                   .
--
--     [C declaration]: @SDL_RemoveTrayEntry@, defined at @SDL3\/SDL_tray.h 282:34@
removeTrayEntry
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: The entry to be deleted.
  -> IO ()
removeTrayEntry = Unsafe.sDL_RemoveTrayEntry

-- | Removes a tray entry.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RemoveTrayEntry@.
--                   The unsafe flavor is 'removeTrayEntry'
--                   .
--
--     [C declaration]: @SDL_RemoveTrayEntry@, defined at @SDL3\/SDL_tray.h 282:34@
removeTrayEntrySafe
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: The entry to be deleted.
  -> IO ()
removeTrayEntrySafe = Safe.sDL_RemoveTrayEntry

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
--     [See also]: 'SDL_TrayEntryFlags', 'getTrayEntries', 'removeTrayEntry', 'getTrayEntryParent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_InsertTrayEntryAt@.
--                   The safe flavor is 'insertTrayEntryAtSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_InsertTrayEntryAt@, defined at @SDL3\/SDL_tray.h 310:45@
insertTrayEntryAt
  :: BG.Ptr SDL_TrayMenu
  -- ^
  --
  --           [@menu@]: the menu to append the entry to.
  -> BG.Int32
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
insertTrayEntryAt =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_InsertTrayEntryAt x00 (Coerce.coerce x11) x22 x33

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
--     [See also]: 'SDL_TrayEntryFlags', 'getTrayEntries', 'removeTrayEntry', 'getTrayEntryParent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_InsertTrayEntryAt@.
--                   The unsafe flavor is 'insertTrayEntryAt'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_InsertTrayEntryAt@, defined at @SDL3\/SDL_tray.h 310:45@
insertTrayEntryAtSafe
  :: BG.Ptr SDL_TrayMenu
  -- ^
  --
  --           [@menu@]: the menu to append the entry to.
  -> BG.Int32
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
insertTrayEntryAtSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_InsertTrayEntryAt x00 (Coerce.coerce x11) x22 x33

-- | Sets the label of an entry.
--
--     An entry cannot change between a separator and an ordinary entry; that is, it is not possible to set a non-NULL label on an entry that has a NULL label (separators), or to set a NULL label to an entry that has a non-NULL label. The function will silently fail if that happens.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt', 'getTrayEntryLabel'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTrayEntryLabel@.
--                   The safe flavor is 'setTrayEntryLabelSafe'
--                   .
--
--     [C declaration]: @SDL_SetTrayEntryLabel@, defined at @SDL3\/SDL_tray.h 332:34@
setTrayEntryLabel
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be updated.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@label@]: the new label for the entry in UTF-8 encoding.
  -> IO ()
setTrayEntryLabel = Unsafe.sDL_SetTrayEntryLabel

-- | Sets the label of an entry.
--
--     An entry cannot change between a separator and an ordinary entry; that is, it is not possible to set a non-NULL label on an entry that has a NULL label (separators), or to set a NULL label to an entry that has a non-NULL label. The function will silently fail if that happens.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt', 'getTrayEntryLabel'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTrayEntryLabel@.
--                   The unsafe flavor is 'setTrayEntryLabel'
--                   .
--
--     [C declaration]: @SDL_SetTrayEntryLabel@, defined at @SDL3\/SDL_tray.h 332:34@
setTrayEntryLabelSafe
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be updated.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@label@]: the new label for the entry in UTF-8 encoding.
  -> IO ()
setTrayEntryLabelSafe = Safe.sDL_SetTrayEntryLabel

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
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt', 'setTrayEntryLabel'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTrayEntryLabel@.
--                   The safe flavor is 'getTrayEntryLabelSafe'
--                   .
--
--     [C declaration]: @SDL_GetTrayEntryLabel@, defined at @SDL3\/SDL_tray.h 351:42@
getTrayEntryLabel
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be read.
  -> IO (PtrConst.PtrConst BG.CChar)
getTrayEntryLabel = Unsafe.sDL_GetTrayEntryLabel

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
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt', 'setTrayEntryLabel'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTrayEntryLabel@.
--                   The unsafe flavor is 'getTrayEntryLabel'
--                   .
--
--     [C declaration]: @SDL_GetTrayEntryLabel@, defined at @SDL3\/SDL_tray.h 351:42@
getTrayEntryLabelSafe
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be read.
  -> IO (PtrConst.PtrConst BG.CChar)
getTrayEntryLabelSafe = Safe.sDL_GetTrayEntryLabel

-- | Sets whether or not an entry is checked.
--
--     The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt', 'getTrayEntryChecked'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTrayEntryChecked@.
--                   The safe flavor is 'setTrayEntryCheckedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTrayEntryChecked@, defined at @SDL3\/SDL_tray.h 370:34@
setTrayEntryChecked
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be updated.
  -> Bool
  -- ^
  --
  --           [@checked@]: true if the entry should be checked; false otherwise.
  -> IO ()
setTrayEntryChecked =
  \x00 ->
    \x11 ->
      Unsafe.sDL_SetTrayEntryChecked x00 (CBool.fromBool x11)

-- | Sets whether or not an entry is checked.
--
--     The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt', 'getTrayEntryChecked'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTrayEntryChecked@.
--                   The unsafe flavor is 'setTrayEntryChecked'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTrayEntryChecked@, defined at @SDL3\/SDL_tray.h 370:34@
setTrayEntryCheckedSafe
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be updated.
  -> Bool
  -- ^
  --
  --           [@checked@]: true if the entry should be checked; false otherwise.
  -> IO ()
setTrayEntryCheckedSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_SetTrayEntryChecked x00 (CBool.fromBool x11)

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
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt', 'setTrayEntryChecked'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTrayEntryChecked@.
--                   The safe flavor is 'getTrayEntryCheckedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTrayEntryChecked@, defined at @SDL3\/SDL_tray.h 389:34@
getTrayEntryChecked
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be read.
  -> IO Bool
getTrayEntryChecked =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GetTrayEntryChecked x00)

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
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt', 'setTrayEntryChecked'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTrayEntryChecked@.
--                   The unsafe flavor is 'getTrayEntryChecked'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTrayEntryChecked@, defined at @SDL3\/SDL_tray.h 389:34@
getTrayEntryCheckedSafe
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be read.
  -> IO Bool
getTrayEntryCheckedSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GetTrayEntryChecked x00)

-- | Sets whether or not an entry is enabled.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt', 'getTrayEntryEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTrayEntryEnabled@.
--                   The safe flavor is 'setTrayEntryEnabledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTrayEntryEnabled@, defined at @SDL3\/SDL_tray.h 406:34@
setTrayEntryEnabled
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be updated.
  -> Bool
  -- ^
  --
  --           [@enabled@]: true if the entry should be enabled; false otherwise.
  -> IO ()
setTrayEntryEnabled =
  \x00 ->
    \x11 ->
      Unsafe.sDL_SetTrayEntryEnabled x00 (CBool.fromBool x11)

-- | Sets whether or not an entry is enabled.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt', 'getTrayEntryEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTrayEntryEnabled@.
--                   The unsafe flavor is 'setTrayEntryEnabled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTrayEntryEnabled@, defined at @SDL3\/SDL_tray.h 406:34@
setTrayEntryEnabledSafe
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be updated.
  -> Bool
  -- ^
  --
  --           [@enabled@]: true if the entry should be enabled; false otherwise.
  -> IO ()
setTrayEntryEnabledSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_SetTrayEntryEnabled x00 (CBool.fromBool x11)

-- | Gets whether or not an entry is enabled.
--
--     [Returns]: true if the entry is enabled; false otherwise.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt', 'setTrayEntryEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTrayEntryEnabled@.
--                   The safe flavor is 'getTrayEntryEnabledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTrayEntryEnabled@, defined at @SDL3\/SDL_tray.h 423:34@
getTrayEntryEnabled
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be read.
  -> IO Bool
getTrayEntryEnabled =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GetTrayEntryEnabled x00)

-- | Gets whether or not an entry is enabled.
--
--     [Returns]: true if the entry is enabled; false otherwise.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt', 'setTrayEntryEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTrayEntryEnabled@.
--                   The unsafe flavor is 'getTrayEntryEnabled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTrayEntryEnabled@, defined at @SDL3\/SDL_tray.h 423:34@
getTrayEntryEnabledSafe
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry to be read.
  -> IO Bool
getTrayEntryEnabledSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GetTrayEntryEnabled x00)

-- | Sets a callback to be invoked when the entry is selected.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTrayEntryCallback@.
--                   The safe flavor is 'setTrayEntryCallbackSafe'
--                   : registration; fires from the event loop.
--
--     [C declaration]: @SDL_SetTrayEntryCallback@, defined at @SDL3\/SDL_tray.h 441:34@
setTrayEntryCallback
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
setTrayEntryCallback =
  Unsafe.sDL_SetTrayEntryCallback

-- | Sets a callback to be invoked when the entry is selected.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'getTrayEntries', 'insertTrayEntryAt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTrayEntryCallback@.
--                   The unsafe flavor is 'setTrayEntryCallback'
--                   : registration; fires from the event loop.
--
--     [C declaration]: @SDL_SetTrayEntryCallback@, defined at @SDL3\/SDL_tray.h 441:34@
setTrayEntryCallbackSafe
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
setTrayEntryCallbackSafe =
  Safe.sDL_SetTrayEntryCallback

-- | Simulate a click on a tray entry.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ClickTrayEntry@.
--                   The safe flavor is 'clickTrayEntrySafe'
--                   .
--
--     [C declaration]: @SDL_ClickTrayEntry@, defined at @SDL3\/SDL_tray.h 453:34@
clickTrayEntry
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: The entry to activate.
  -> IO ()
clickTrayEntry = Unsafe.sDL_ClickTrayEntry

-- | Simulate a click on a tray entry.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ClickTrayEntry@.
--                   The unsafe flavor is 'clickTrayEntry'
--                   .
--
--     [C declaration]: @SDL_ClickTrayEntry@, defined at @SDL3\/SDL_tray.h 453:34@
clickTrayEntrySafe
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: The entry to activate.
  -> IO ()
clickTrayEntrySafe = Safe.sDL_ClickTrayEntry

-- | Destroys a tray object.
--
--     This also destroys all associated menus and entries.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTray'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyTray@.
--                   The safe flavor is 'destroyTraySafe'
--                   .
--
--     [C declaration]: @SDL_DestroyTray@, defined at @SDL3\/SDL_tray.h 469:34@
destroyTray
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray icon to be destroyed.
  -> IO ()
destroyTray = Unsafe.sDL_DestroyTray

-- | Destroys a tray object.
--
--     This also destroys all associated menus and entries.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTray'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyTray@.
--                   The unsafe flavor is 'destroyTray'
--                   .
--
--     [C declaration]: @SDL_DestroyTray@, defined at @SDL3\/SDL_tray.h 469:34@
destroyTraySafe
  :: BG.Ptr SDL_Tray
  -- ^
  --
  --           [@tray@]: the tray icon to be destroyed.
  -> IO ()
destroyTraySafe = Safe.sDL_DestroyTray

-- | Gets the menu containing a certain tray entry.
--
--     [Returns]: the parent menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'insertTrayEntryAt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTrayEntryParent@.
--                   The safe flavor is 'getTrayEntryParentSafe'
--                   .
--
--     [C declaration]: @SDL_GetTrayEntryParent@, defined at @SDL3\/SDL_tray.h 484:44@
getTrayEntryParent
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry for which to get the parent menu.
  -> IO (BG.Ptr SDL_TrayMenu)
getTrayEntryParent = Unsafe.sDL_GetTrayEntryParent

-- | Gets the menu containing a certain tray entry.
--
--     [Returns]: the parent menu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'insertTrayEntryAt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTrayEntryParent@.
--                   The unsafe flavor is 'getTrayEntryParent'
--                   .
--
--     [C declaration]: @SDL_GetTrayEntryParent@, defined at @SDL3\/SDL_tray.h 484:44@
getTrayEntryParentSafe
  :: BG.Ptr SDL_TrayEntry
  -- ^
  --
  --           [@entry@]: the entry for which to get the parent menu.
  -> IO (BG.Ptr SDL_TrayMenu)
getTrayEntryParentSafe = Safe.sDL_GetTrayEntryParent

-- | Gets the entry for which the menu is a submenu, if the current menu is a submenu.
--
--     Either this function or @'getTrayMenuParentTray'@ will return non-NULL for any given menu.
--
--     [Returns]: the parent entry, or NULL if this menu is not a submenu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTraySubmenu', 'getTrayMenuParentTray'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTrayMenuParentEntry@.
--                   The safe flavor is 'getTrayMenuParentEntrySafe'
--                   .
--
--     [C declaration]: @SDL_GetTrayMenuParentEntry@, defined at @SDL3\/SDL_tray.h 504:45@
getTrayMenuParentEntry
  :: BG.Ptr SDL_TrayMenu
  -- ^
  --
  --           [@menu@]: the menu for which to get the parent entry.
  -> IO (BG.Ptr SDL_TrayEntry)
getTrayMenuParentEntry =
  Unsafe.sDL_GetTrayMenuParentEntry

-- | Gets the entry for which the menu is a submenu, if the current menu is a submenu.
--
--     Either this function or @'getTrayMenuParentTray'@ will return non-NULL for any given menu.
--
--     [Returns]: the parent entry, or NULL if this menu is not a submenu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTraySubmenu', 'getTrayMenuParentTray'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTrayMenuParentEntry@.
--                   The unsafe flavor is 'getTrayMenuParentEntry'
--                   .
--
--     [C declaration]: @SDL_GetTrayMenuParentEntry@, defined at @SDL3\/SDL_tray.h 504:45@
getTrayMenuParentEntrySafe
  :: BG.Ptr SDL_TrayMenu
  -- ^
  --
  --           [@menu@]: the menu for which to get the parent entry.
  -> IO (BG.Ptr SDL_TrayEntry)
getTrayMenuParentEntrySafe =
  Safe.sDL_GetTrayMenuParentEntry

-- | Gets the tray for which this menu is the first-level menu, if the current menu isn\'t a submenu.
--
--     Either this function or @'getTrayMenuParentEntry'@ will return non-NULL for any given menu.
--
--     [Returns]: the parent tray, or NULL if this menu is a submenu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTrayMenu', 'getTrayMenuParentEntry'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTrayMenuParentTray@.
--                   The safe flavor is 'getTrayMenuParentTraySafe'
--                   .
--
--     [C declaration]: @SDL_GetTrayMenuParentTray@, defined at @SDL3\/SDL_tray.h 524:40@
getTrayMenuParentTray
  :: BG.Ptr SDL_TrayMenu
  -- ^
  --
  --           [@menu@]: the menu for which to get the parent enttrayry.
  -> IO (BG.Ptr SDL_Tray)
getTrayMenuParentTray =
  Unsafe.sDL_GetTrayMenuParentTray

-- | Gets the tray for which this menu is the first-level menu, if the current menu isn\'t a submenu.
--
--     Either this function or @'getTrayMenuParentEntry'@ will return non-NULL for any given menu.
--
--     [Returns]: the parent tray, or NULL if this menu is a submenu.
--
--     [Thread safety]: This function should be called on the thread that created the tray.
--
--     @since 3.2.0
--
--     [See also]: 'createTrayMenu', 'getTrayMenuParentEntry'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTrayMenuParentTray@.
--                   The unsafe flavor is 'getTrayMenuParentTray'
--                   .
--
--     [C declaration]: @SDL_GetTrayMenuParentTray@, defined at @SDL3\/SDL_tray.h 524:40@
getTrayMenuParentTraySafe
  :: BG.Ptr SDL_TrayMenu
  -- ^
  --
  --           [@menu@]: the menu for which to get the parent enttrayry.
  -> IO (BG.Ptr SDL_Tray)
getTrayMenuParentTraySafe =
  Safe.sDL_GetTrayMenuParentTray

-- | Update the trays.
--
--     This is called automatically by the event loop and is only needed if you\'re using trays but aren\'t handling SDL events.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UpdateTrays@.
--                   The safe flavor is 'updateTraysSafe'
--                   .
--
--     [C declaration]: @SDL_UpdateTrays@, defined at @SDL3\/SDL_tray.h 536:34@
updateTrays :: IO ()
updateTrays = Unsafe.sDL_UpdateTrays

-- | Update the trays.
--
--     This is called automatically by the event loop and is only needed if you\'re using trays but aren\'t handling SDL events.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UpdateTrays@.
--                   The unsafe flavor is 'updateTrays'
--                   .
--
--     [C declaration]: @SDL_UpdateTrays@, defined at @SDL3\/SDL_tray.h 536:34@
updateTraysSafe :: IO ()
updateTraysSafe = Safe.sDL_UpdateTrays

-- | Typed constant for macro @SDL_TRAYENTRY_BUTTON@. Combine with @.|.@ from "Data.Bits".
pattern SDL_TRAYENTRY_BUTTON :: SDL_TrayEntryFlags
pattern SDL_TRAYENTRY_BUTTON = SDL_TrayEntryFlags 0x00000001

-- | Typed constant for macro @SDL_TRAYENTRY_CHECKBOX@. Combine with @.|.@ from "Data.Bits".
pattern SDL_TRAYENTRY_CHECKBOX :: SDL_TrayEntryFlags
pattern SDL_TRAYENTRY_CHECKBOX = SDL_TrayEntryFlags 0x00000002

-- | Typed constant for macro @SDL_TRAYENTRY_SUBMENU@. Combine with @.|.@ from "Data.Bits".
pattern SDL_TRAYENTRY_SUBMENU :: SDL_TrayEntryFlags
pattern SDL_TRAYENTRY_SUBMENU = SDL_TrayEntryFlags 0x00000004

-- | Typed constant for macro @SDL_TRAYENTRY_DISABLED@. Combine with @.|.@ from "Data.Bits".
pattern SDL_TRAYENTRY_DISABLED :: SDL_TrayEntryFlags
pattern SDL_TRAYENTRY_DISABLED = SDL_TrayEntryFlags 0x80000000

-- | Typed constant for macro @SDL_TRAYENTRY_CHECKED@. Combine with @.|.@ from "Data.Bits".
pattern SDL_TRAYENTRY_CHECKED :: SDL_TrayEntryFlags
pattern SDL_TRAYENTRY_CHECKED = SDL_TrayEntryFlags 0x40000000

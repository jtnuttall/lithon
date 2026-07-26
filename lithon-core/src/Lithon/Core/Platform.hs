-- | Opaque platform (window-system) types.
--
-- Lithon emits every platform extension unconditionally — no CPP. The
-- platform handle types referenced by those extensions are represented here
-- as opaque newtypes (for by-value handles) or empty data types (for
-- entities only ever referenced through a pointer). Interop with the actual
-- window system happens outside lithon: windowing libraries hand you these
-- values as raw pointers/words, and you coerce at the boundary.
--
-- lithon-codegen validates that the curated registry's external types are
-- all covered here and errors on novelty.
module Lithon.Core.Platform (
  -- * Win32
  HWND (..),
  HINSTANCE (..),
  HMONITOR (..),
  HANDLE (..),
  DWORD (..),
  LPCWSTR (..),
  SECURITY_ATTRIBUTES,

  -- * Xlib
  XlibDisplay,
  XlibWindow (..),
  XlibVisualID (..),
  RROutput (..),

  -- * XCB
  XcbConnection,
  XcbWindow (..),
  XcbVisualid (..),

  -- * Wayland
  WlDisplay,
  WlSurface,

  -- * Metal
  CAMetalLayer,
) where

import Data.Word (Word16, Word32, Word64)
import Foreign.Ptr (Ptr)
import Foreign.Storable (Storable)

-- Win32 ---------------------------------------------------------------------

-- | Win32 window handle (a pointer-sized value handle).
newtype HWND = HWND (Ptr ())
  deriving newtype (Eq, Show, Storable)

-- | Win32 module instance handle.
newtype HINSTANCE = HINSTANCE (Ptr ())
  deriving newtype (Eq, Show, Storable)

-- | Win32 monitor handle.
newtype HMONITOR = HMONITOR (Ptr ())
  deriving newtype (Eq, Show, Storable)

-- | Generic Win32 kernel handle (external memory\/semaphore\/fence import
-- and export).
newtype HANDLE = HANDLE (Ptr ())
  deriving newtype (Eq, Show, Storable)

-- | Win32 @DWORD@.
newtype DWORD = DWORD Word32
  deriving newtype (Eq, Ord, Show, Storable)

-- | Win32 wide string pointer (UTF-16, NUL-terminated).
newtype LPCWSTR = LPCWSTR (Ptr Word16)
  deriving newtype (Eq, Show, Storable)

-- | Opaque; only ever referenced as @const SECURITY_ATTRIBUTES*@.
data SECURITY_ATTRIBUTES

-- Xlib ----------------------------------------------------------------------

-- | Opaque @Display@; only ever referenced as @Display*@.
data XlibDisplay

-- | X11 @Window@ (an XID; 64-bit under LP64 Xlib).
newtype XlibWindow = XlibWindow Word64
  deriving newtype (Eq, Ord, Show, Storable)

-- | X11 @VisualID@ (an XID).
newtype XlibVisualID = XlibVisualID Word64
  deriving newtype (Eq, Ord, Show, Storable)

-- | XRandR output (an XID).
newtype RROutput = RROutput Word64
  deriving newtype (Eq, Ord, Show, Storable)

-- XCB -----------------------------------------------------------------------

-- | Opaque @xcb_connection_t@; only ever referenced through a pointer.
data XcbConnection

-- | @xcb_window_t@.
newtype XcbWindow = XcbWindow Word32
  deriving newtype (Eq, Ord, Show, Storable)

-- | @xcb_visualid_t@.
newtype XcbVisualid = XcbVisualid Word32
  deriving newtype (Eq, Ord, Show, Storable)

-- Wayland -------------------------------------------------------------------

-- | Opaque @wl_display@; referenced through a pointer.
data WlDisplay

-- | Opaque @wl_surface@; referenced through a pointer.
data WlSurface

-- Metal ---------------------------------------------------------------------

-- | Opaque @CAMetalLayer@; referenced through a pointer.
data CAMetalLayer

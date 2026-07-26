{-# LANGUAGE DuplicateRecordFields #-}

-- |
-- Curated low-level SDL3 surface: Re-exports every per-header module.
--
-- This is a low-level module intended to provide the building blocks for
-- higher-level libraries.
--
-- Contributing is encouraged. Please submit either an issue or PR to the
-- upstream repository if you run into problems with these generated bindings.
--
-- These bindings are still experimental and in flux, and will not stabilize
-- at least until hs-bindgen is itself released stably.
--
-- Pin to a minor version (e.g. `>=0.0.0.1 && <0.0.1`) until this library hits `0.1.0.0`.
--
-- __Conventions__
--
-- * Every function's foreign-import flavor is classified deterministically
--   by the checked-in registry. Most functions export both @safe@ and @unsafe@
--   FFI bindings.
--
-- * Function aliases follow the camel-segments rule: strip @SDL_@ and
--   join the underscore segments (@SDL_CreateWindow@ -> @createWindow@,
--   @SDL_GL_SwapWindow@ -> @glSwapWindow@, @SDL_GUIDToString@ ->
--   @guidToString@).
--
-- * An /unsuffixed/ alias is always the __unsafe__ foreign import; a
--   @Safe@-suffixed alias is always the __safe__ one.
--
-- * Functions that unavoidably invoke a callback during the call export
--   only the @Safe@ alias — re-entering Haskell from an unsafe call is undefined
--   behavior, so the footgun is simply not handed out. NB: A non-Haskell
--   callback function (e.g., written in C or Rust) cannot re-enter the runtime;
--   for that case the unsafe imports stay available under the
--   @SDL3.Sys.Bindgen.*.Unsafe@ modules.
--
-- * Functions curated @unsafe-only@ — quick, nonblocking, callback-free —
--   export only the unsuffixed alias: paying the safe-call overhead for
--   them buys nothing. Each alias's documentation records its rationale.
--
-- * Types, enum patterns, macro constants, and property keys re-export
--   verbatim from the @SDL3.Sys.Bindgen.*@ base modules.
--
-- * This layer additionally provides typed pattern synonyms for
--   the macro constant groups in SDL headers.
--
-- * Some aliases (@free@, @abs@, @init@, …) collide with the "Prelude";
--   import this module qualified or curate your import list.
--
-- == Families
--
-- * "SDL3.Sys.Assert" — A helpful assertion macro!
-- * "SDL3.Sys.Asyncio" — SDL offers a way to perform I/O asynchronously.
-- * "SDL3.Sys.Atomic" — Atomic operations.
-- * "SDL3.Sys.Audio" — Audio functionality for the SDL library.
-- * "SDL3.Sys.Bits" — Functions for fiddling with bits and bitmasks.
-- * "SDL3.Sys.Blendmode" — Blend modes decide how two colors will mix together.
-- * "SDL3.Sys.Camera" — Video capture for the SDL library.
-- * "SDL3.Sys.Clipboard" — SDL provides access to the system clipboard, both for reading information from other processes and publishing information of its own.
-- * "SDL3.Sys.Cpuinfo" — CPU feature detection for SDL.
-- * "SDL3.Sys.Dialog" — File dialog support.
-- * "SDL3.Sys.Dlopennote" — This header allows you to annotate your code so external tools know about dynamic shared library dependencies.
-- * "SDL3.Sys.Endian" — Functions for reading and writing endian-specific values.
-- * "SDL3.Sys.Error" — Simple error message routines for SDL.
-- * "SDL3.Sys.Events" — Event queue management.
-- * "SDL3.Sys.Filesystem" — SDL offers an API for examining and manipulating the system's filesystem.
-- * "SDL3.Sys.Gamepad" — SDL provides a low-level joystick API, which just treats joysticks as an arbitrary pile of buttons, axes, and hat switches.
-- * "SDL3.Sys.Gpu" — The GPU API offers a cross-platform way for apps to talk to modern graphics hardware.
-- * "SDL3.Sys.Guid" — A GUID is a 128-bit value that represents something that is uniquely identifiable by this value: "globally unique."
-- * "SDL3.Sys.Haptic" — The SDL haptic subsystem manages haptic (force feedback) devices.
-- * "SDL3.Sys.Hidapi" — Header file for SDL HIDAPI functions.
-- * "SDL3.Sys.Hints" — This file contains functions to set and get configuration hints, as well as listing each of them alphabetically.
-- * "SDL3.Sys.Init" — All SDL programs need to initialize the library before starting to work with it.
-- * "SDL3.Sys.Iostream" — SDL provides an abstract interface for reading and writing data streams.
-- * "SDL3.Sys.Joystick" — SDL joystick support.
-- * "SDL3.Sys.Keyboard" — SDL keyboard management.
-- * "SDL3.Sys.Keycode" — Defines constants which identify keyboard keys and modifiers.
-- * "SDL3.Sys.Loadso" — System-dependent library loading routines.
-- * "SDL3.Sys.Locale" — SDL locale services.
-- * "SDL3.Sys.Log" — Simple log messages with priorities and categories.
-- * "SDL3.Sys.Main" — App entry-point handling; SDL_main is not bound here.
-- * "SDL3.Sys.Messagebox" — SDL offers a simple message box API, which is useful for simple alerts, such as informing the user when something fatal happens at startup without the need to build a UI for it (or informing the user before your UI is ready).
-- * "SDL3.Sys.Metal" — Functions to creating Metal layers and views on SDL windows.
-- * "SDL3.Sys.Misc" — SDL API functions that don't fit elsewhere.
-- * "SDL3.Sys.Mouse" — Any GUI application has to deal with the mouse, and SDL provides functions to manage mouse input and the displayed cursor.
-- * "SDL3.Sys.Mutex" — Thread synchronization primitives: mutexes, semaphores, condition variables, and read/write locks.
-- * "SDL3.Sys.Pen" — SDL pen event handling.
-- * "SDL3.Sys.Pixels" — SDL offers facilities for pixel management.
-- * "SDL3.Sys.Platform" — SDL provides a means to identify the app's platform, both at compile time and runtime.
-- * "SDL3.Sys.PlatformDefines" — Platform-detection defines, baked at generation time.
-- * "SDL3.Sys.Power" — SDL power management routines.
-- * "SDL3.Sys.Process" — Process control support.
-- * "SDL3.Sys.Properties" — A property is a variable that can be created and retrieved by name at runtime.
-- * "SDL3.Sys.Rect" — Some helper functions for managing rectangles and 2D points, in both integer and floating point versions.
-- * "SDL3.Sys.Render" — Header file for SDL 2D rendering functions.
-- * "SDL3.Sys.Runtime" — Bridge vocabulary: C99 bool and C enum conversions, curated from the runtime.
-- * "SDL3.Sys.Scancode" — Defines keyboard scancodes.
-- * "SDL3.Sys.Sensor" — SDL sensor management.
-- * "SDL3.Sys.Stdinc" — SDL's C-library replacements: memory, strings, math, and conversions.
-- * "SDL3.Sys.Storage" — The storage API is a high-level API designed to abstract away the portability issues that come up when using something lower-level (in SDL's case, this sits on top of the [Filesystem](https://wiki.libsdl.org/SDL3/CategoryFilesystem) and [IOStream](https://wiki.libsdl.org/SDL3/CategoryIOStream) subsystems).
-- * "SDL3.Sys.Surface" — SDL surfaces are buffers of pixels in system RAM.
-- * "SDL3.Sys.System" — Platform-specific SDL API functions.
-- * "SDL3.Sys.Thread" — SDL offers cross-platform thread management functions.
-- * "SDL3.Sys.Time" — SDL realtime clock and date/time routines.
-- * "SDL3.Sys.Timer" — SDL provides time management functionality.
-- * "SDL3.Sys.Touch" — SDL offers touch input, on platforms that support it.
-- * "SDL3.Sys.Tray" — SDL offers a way to add items to the "system tray" (more correctly called the "notification area" on Windows).
-- * "SDL3.Sys.Version" — Functionality to query the current SDL version, both as headers the app was compiled against, and a library the app is linked to.
-- * "SDL3.Sys.Video" — SDL's video subsystem is largely interested in abstracting window management from the underlying operating system.
-- * "SDL3.Sys.Vulkan" — Functions for creating Vulkan surfaces on SDL windows.
module SDL3.Sys (
  module SDL3.Sys.Assert,
  module SDL3.Sys.Asyncio,
  module SDL3.Sys.Atomic,
  module SDL3.Sys.Audio,
  module SDL3.Sys.Bits,
  module SDL3.Sys.Blendmode,
  module SDL3.Sys.Camera,
  module SDL3.Sys.Clipboard,
  module SDL3.Sys.Cpuinfo,
  module SDL3.Sys.Dialog,
  module SDL3.Sys.Dlopennote,
  module SDL3.Sys.Endian,
  module SDL3.Sys.Error,
  module SDL3.Sys.Events,
  module SDL3.Sys.Filesystem,
  module SDL3.Sys.Gamepad,
  module SDL3.Sys.Gpu,
  module SDL3.Sys.Guid,
  module SDL3.Sys.Haptic,
  module SDL3.Sys.Hidapi,
  module SDL3.Sys.Hints,
  module SDL3.Sys.Init,
  module SDL3.Sys.Iostream,
  module SDL3.Sys.Joystick,
  module SDL3.Sys.Keyboard,
  module SDL3.Sys.Keycode,
  module SDL3.Sys.Loadso,
  module SDL3.Sys.Locale,
  module SDL3.Sys.Log,
  module SDL3.Sys.Main,
  module SDL3.Sys.Messagebox,
  module SDL3.Sys.Metal,
  module SDL3.Sys.Misc,
  module SDL3.Sys.Mouse,
  module SDL3.Sys.Mutex,
  module SDL3.Sys.Pen,
  module SDL3.Sys.Pixels,
  module SDL3.Sys.Platform,
  module SDL3.Sys.PlatformDefines,
  module SDL3.Sys.Power,
  module SDL3.Sys.Process,
  module SDL3.Sys.Properties,
  module SDL3.Sys.Rect,
  module SDL3.Sys.Render,
  module SDL3.Sys.Runtime,
  module SDL3.Sys.Scancode,
  module SDL3.Sys.Sensor,
  module SDL3.Sys.Stdinc,
  module SDL3.Sys.Storage,
  module SDL3.Sys.Surface,
  module SDL3.Sys.System,
  module SDL3.Sys.Thread,
  module SDL3.Sys.Time,
  module SDL3.Sys.Timer,
  module SDL3.Sys.Touch,
  module SDL3.Sys.Tray,
  module SDL3.Sys.Version,
  module SDL3.Sys.Video,
  module SDL3.Sys.Vulkan,
)
where

import SDL3.Sys.Assert
import SDL3.Sys.Asyncio
import SDL3.Sys.Atomic
import SDL3.Sys.Audio
import SDL3.Sys.Bits
import SDL3.Sys.Blendmode
import SDL3.Sys.Camera
import SDL3.Sys.Clipboard
import SDL3.Sys.Cpuinfo
import SDL3.Sys.Dialog
import SDL3.Sys.Dlopennote
import SDL3.Sys.Endian
import SDL3.Sys.Error
import SDL3.Sys.Events
import SDL3.Sys.Filesystem
import SDL3.Sys.Gamepad
import SDL3.Sys.Gpu
import SDL3.Sys.Guid
import SDL3.Sys.Haptic
import SDL3.Sys.Hidapi
import SDL3.Sys.Hints
import SDL3.Sys.Init
import SDL3.Sys.Iostream
import SDL3.Sys.Joystick
import SDL3.Sys.Keyboard
import SDL3.Sys.Keycode
import SDL3.Sys.Loadso
import SDL3.Sys.Locale
import SDL3.Sys.Log
import SDL3.Sys.Main
import SDL3.Sys.Messagebox
import SDL3.Sys.Metal
import SDL3.Sys.Misc
import SDL3.Sys.Mouse
import SDL3.Sys.Mutex
import SDL3.Sys.Pen
import SDL3.Sys.Pixels
import SDL3.Sys.Platform
import SDL3.Sys.PlatformDefines
import SDL3.Sys.Power
import SDL3.Sys.Process
import SDL3.Sys.Properties
import SDL3.Sys.Rect
import SDL3.Sys.Render
import SDL3.Sys.Runtime
import SDL3.Sys.Scancode
import SDL3.Sys.Sensor
import SDL3.Sys.Stdinc
import SDL3.Sys.Storage
import SDL3.Sys.Surface
import SDL3.Sys.System
import SDL3.Sys.Thread
import SDL3.Sys.Time
import SDL3.Sys.Timer
import SDL3.Sys.Touch
import SDL3.Sys.Tray
import SDL3.Sys.Version
import SDL3.Sys.Video
import SDL3.Sys.Vulkan

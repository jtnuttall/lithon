{-# LANGUAGE PatternSynonyms #-}

-- | SDL pen event handling.
--
--     SDL provides an API for pressure-sensitive pen (stylus and\/or eraser) handling, e.g., for input and drawing tablets or suitably equipped mobile \/ tablet devices.
--
--     To get started with pens, simply handle pen events:
--
--     * SDL_EVENT_PEN_PROXIMITY_IN, SDL_EVENT_PEN_PROXIMITY_OUT (SDL_PenProximityEvent)
--
--     * SDL_EVENT_PEN_DOWN, SDL_EVENT_PEN_UP (SDL_PenTouchEvent)
--
--     * SDL_EVENT_PEN_MOTION (SDL_PenMotionEvent)
--
--     * SDL_EVENT_PEN_BUTTON_DOWN, SDL_EVENT_PEN_BUTTON_UP (SDL_PenButtonEvent)
--
--     * SDL_EVENT_PEN_AXIS (SDL_PenAxisEvent)
--
--     Pens may provide more than simple touch input; they might have other axes, such as pressure, tilt, rotation, etc.
--
--     When a pen starts providing input, SDL will assign it a unique 'SDL_PenID', which will remain for the life of the process, as long as the pen stays connected. A pen leaving proximity (being taken far enough away from the digitizer tablet that it no longer reponds) and then coming back should fire proximity events, but the 'SDL_PenID' should remain consistent. Unplugging the digitizer and reconnecting may cause future input to have a new 'SDL_PenID', as SDL may not know that this is the same hardware.
--
--     Please note that various platforms vary wildly in how (and how well) they support pen input. If your pen supports some piece of functionality but SDL doesn\'t seem to, it might actually be the operating system\'s fault. For example, some platforms can manage multiple devices at the same time, but others will make any connected pens look like a single logical device, much how all USB mice connected to a computer will move the same system cursor. cursor. Other platforms might not support pen buttons, or the distance axis, etc. Very few platforms can even report /what/ functionality the pen supports in the first place, so best practices is to either build UI to let the user configure their pens, or be prepared to handle new functionality for a pen the first time an event is reported. SDL pen instance IDs.
--
--     Zero is used to signify an invalid\/null device.
--
--     These show up in pen events when SDL sees input from them. They remain consistent as long as SDL can recognize a tool to be the same pen; but if a pen\'s digitizer table is physically detached from the computer, it might get a new ID when reconnected, as SDL won\'t know it\'s the same device.
--
--     These IDs are only stable within a single run of a program; the next time a program is run, the pen\'s ID will likely be different, even if the hardware hasn\'t been disconnected, etc.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Pen.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Pen (
  module SDL3.Sys.Bindgen.Pen,

  -- * Typed constants
  pattern SDL3.Sys.Pen.SDL_PEN_INPUT_DOWN,
  pattern SDL3.Sys.Pen.SDL_PEN_INPUT_BUTTON_1,
  pattern SDL3.Sys.Pen.SDL_PEN_INPUT_BUTTON_2,
  pattern SDL3.Sys.Pen.SDL_PEN_INPUT_BUTTON_3,
  pattern SDL3.Sys.Pen.SDL_PEN_INPUT_BUTTON_4,
  pattern SDL3.Sys.Pen.SDL_PEN_INPUT_BUTTON_5,
  pattern SDL3.Sys.Pen.SDL_PEN_INPUT_ERASER_TIP,
  pattern SDL3.Sys.Pen.SDL_PEN_INPUT_IN_PROXIMITY,

  -- * Function aliases
  SDL3.Sys.Pen.getPenDeviceType,
  SDL3.Sys.Pen.getPenDeviceTypeSafe,
)
where

import SDL3.Sys.Bindgen.Pen
import SDL3.Sys.Bindgen.Pen.Safe qualified as Safe
import SDL3.Sys.Bindgen.Pen.Unsafe qualified as Unsafe

-- | Get the device type of the given pen.
--
--     Many platforms do not supply this information, so an app must always be prepared to get an SDL_PEN_DEVICE_TYPE_UNKNOWN result.
--
--     [Returns]: the device type of the given pen, or SDL_PEN_DEVICE_TYPE_INVALID on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPenDeviceType@.
--                   The safe flavor is 'getPenDeviceTypeSafe'
--                   .
--
--     [C declaration]: @SDL_GetPenDeviceType@, defined at @SDL3\/SDL_pen.h 189:47@
getPenDeviceType
  :: SDL_PenID
  -- ^
  --
  --           [@instance_id@]: the pen instance ID.
  -> IO SDL_PenDeviceType
getPenDeviceType = Unsafe.sDL_GetPenDeviceType

-- | Get the device type of the given pen.
--
--     Many platforms do not supply this information, so an app must always be prepared to get an SDL_PEN_DEVICE_TYPE_UNKNOWN result.
--
--     [Returns]: the device type of the given pen, or SDL_PEN_DEVICE_TYPE_INVALID on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPenDeviceType@.
--                   The unsafe flavor is 'getPenDeviceType'
--                   .
--
--     [C declaration]: @SDL_GetPenDeviceType@, defined at @SDL3\/SDL_pen.h 189:47@
getPenDeviceTypeSafe
  :: SDL_PenID
  -- ^
  --
  --           [@instance_id@]: the pen instance ID.
  -> IO SDL_PenDeviceType
getPenDeviceTypeSafe = Safe.sDL_GetPenDeviceType

-- | Typed constant for macro @SDL_PEN_INPUT_DOWN@. Combine with @.|.@ from "Data.Bits".
pattern SDL_PEN_INPUT_DOWN :: SDL_PenInputFlags
pattern SDL_PEN_INPUT_DOWN = SDL_PenInputFlags 0x00000001

-- | Typed constant for macro @SDL_PEN_INPUT_BUTTON_1@. Combine with @.|.@ from "Data.Bits".
pattern SDL_PEN_INPUT_BUTTON_1 :: SDL_PenInputFlags
pattern SDL_PEN_INPUT_BUTTON_1 = SDL_PenInputFlags 0x00000002

-- | Typed constant for macro @SDL_PEN_INPUT_BUTTON_2@. Combine with @.|.@ from "Data.Bits".
pattern SDL_PEN_INPUT_BUTTON_2 :: SDL_PenInputFlags
pattern SDL_PEN_INPUT_BUTTON_2 = SDL_PenInputFlags 0x00000004

-- | Typed constant for macro @SDL_PEN_INPUT_BUTTON_3@. Combine with @.|.@ from "Data.Bits".
pattern SDL_PEN_INPUT_BUTTON_3 :: SDL_PenInputFlags
pattern SDL_PEN_INPUT_BUTTON_3 = SDL_PenInputFlags 0x00000008

-- | Typed constant for macro @SDL_PEN_INPUT_BUTTON_4@. Combine with @.|.@ from "Data.Bits".
pattern SDL_PEN_INPUT_BUTTON_4 :: SDL_PenInputFlags
pattern SDL_PEN_INPUT_BUTTON_4 = SDL_PenInputFlags 0x00000010

-- | Typed constant for macro @SDL_PEN_INPUT_BUTTON_5@. Combine with @.|.@ from "Data.Bits".
pattern SDL_PEN_INPUT_BUTTON_5 :: SDL_PenInputFlags
pattern SDL_PEN_INPUT_BUTTON_5 = SDL_PenInputFlags 0x00000020

-- | Typed constant for macro @SDL_PEN_INPUT_ERASER_TIP@. Combine with @.|.@ from "Data.Bits".
pattern SDL_PEN_INPUT_ERASER_TIP :: SDL_PenInputFlags
pattern SDL_PEN_INPUT_ERASER_TIP = SDL_PenInputFlags 0x40000000

-- | Typed constant for macro @SDL_PEN_INPUT_IN_PROXIMITY@. Combine with @.|.@ from "Data.Bits".
pattern SDL_PEN_INPUT_IN_PROXIMITY :: SDL_PenInputFlags
pattern SDL_PEN_INPUT_IN_PROXIMITY = SDL_PenInputFlags 0x80000000

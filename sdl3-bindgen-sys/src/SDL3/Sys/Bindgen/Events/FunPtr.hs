{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Events.FunPtr (
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_PumpEvents,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_PeepEvents,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_HasEvent,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_HasEvents,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_FlushEvent,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_FlushEvents,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_PollEvent,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_WaitEvent,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_WaitEventTimeout,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_PushEvent,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_SetEventFilter,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_GetEventFilter,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_AddEventWatch,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_RemoveEventWatch,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_FilterEvents,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_SetEventEnabled,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_EventEnabled,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_RegisterEvents,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_GetWindowFromEvent,
  SDL3.Sys.Bindgen.Events.FunPtr.sDL_GetEventDescription,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Events
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Video qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_events.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_PumpEvents */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_9917baac4ce08ba8 (void)) (void)"
         , "{"
         , "  return &SDL_PumpEvents;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_PeepEvents */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_a86a903c6648c81b (void)) ("
         , "  SDL_Event *arg1,"
         , "  signed int arg2,"
         , "  SDL_EventAction arg3,"
         , "  Uint32 arg4,"
         , "  Uint32 arg5"
         , ")"
         , "{"
         , "  return &SDL_PeepEvents;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_HasEvent */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7e16852183b91d19 (void)) ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return &SDL_HasEvent;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_HasEvents */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_87deab19d987ab47 (void)) ("
         , "  Uint32 arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return &SDL_HasEvents;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_FlushEvent */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_3d397e2de8f614cb (void)) ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return &SDL_FlushEvent;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_FlushEvents */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_7409f3af10ababea (void)) ("
         , "  Uint32 arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return &SDL_FlushEvents;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_PollEvent */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e695618acb9426fb (void)) ("
         , "  SDL_Event *arg1"
         , ")"
         , "{"
         , "  return &SDL_PollEvent;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_WaitEvent */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_94029194304d5c31 (void)) ("
         , "  SDL_Event *arg1"
         , ")"
         , "{"
         , "  return &SDL_WaitEvent;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_WaitEventTimeout */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7e78b9d3527f4720 (void)) ("
         , "  SDL_Event *arg1,"
         , "  Sint32 arg2"
         , ")"
         , "{"
         , "  return &SDL_WaitEventTimeout;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_PushEvent */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_949def362b6a6d49 (void)) ("
         , "  SDL_Event *arg1"
         , ")"
         , "{"
         , "  return &SDL_PushEvent;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_SetEventFilter */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_b512227bb5014eea (void)) ("
         , "  SDL_EventFilter arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetEventFilter;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_GetEventFilter */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_55ed84f0612cc8ac (void)) ("
         , "  SDL_EventFilter *arg1,"
         , "  void **arg2"
         , ")"
         , "{"
         , "  return &SDL_GetEventFilter;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_AddEventWatch */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a03e121760f6b6d3 (void)) ("
         , "  SDL_EventFilter arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return &SDL_AddEventWatch;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_RemoveEventWatch */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_25dfb37d4e519ab9 (void)) ("
         , "  SDL_EventFilter arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return &SDL_RemoveEventWatch;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_FilterEvents */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_53f4b12fdab2103a (void)) ("
         , "  SDL_EventFilter arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return &SDL_FilterEvents;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_SetEventEnabled */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_aa066d1126b2d52a (void)) ("
         , "  Uint32 arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetEventEnabled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_EventEnabled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_22ccd2bcfeb8819e (void)) ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return &SDL_EventEnabled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_RegisterEvents */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_1bc1c2cf7c7f16d2 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_RegisterEvents;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_GetWindowFromEvent */"
         , "__attribute__ ((const))"
         , "SDL_Window *(*hs_bindgen_9835b9a553ca5082 (void)) ("
         , "  SDL_Event const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowFromEvent;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_GetEventDescription */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_1326a7cde53572c5 (void)) ("
         , "  SDL_Event const *arg1,"
         , "  char *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_GetEventDescription;"
         , "#else"
         , "  SDL_SetError(\"SDL_GetEventDescription requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_PumpEvents@
foreign import ccall unsafe "hs_bindgen_9917baac4ce08ba8"
  hs_bindgen_9917baac4ce08ba8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_PumpEvents@
hs_bindgen_9917baac4ce08ba8 :: IO (BG.FunPtr (IO ()))
hs_bindgen_9917baac4ce08ba8 =
  BG.fromFFIType hs_bindgen_9917baac4ce08ba8_base

{-# NOINLINE sDL_PumpEvents #-}

-- | Pump the event loop, gathering events from the input devices.
--
--     This function updates the event queue and internal input device state.
--
--     @SDL_PumpEvents()@ gathers all the pending input information from devices and places it in the event queue. Without calls to @SDL_PumpEvents()@ no events would ever be placed on the queue. Often the need for calls to @SDL_PumpEvents()@ is hidden from the user since @SDL_PollEvent()@ and @SDL_WaitEvent()@ implicitly call @SDL_PumpEvents()@. However, if you are not polling or waiting for events (e.g. you are filtering them), then you must call @SDL_PumpEvents()@ to force an event queue update.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PollEvent', 'sDL_WaitEvent'
--
--     [C declaration]: @SDL_PumpEvents@, defined at @SDL3\/SDL_events.h 1100:34@
sDL_PumpEvents :: BG.FunPtr (IO ())
sDL_PumpEvents =
  BG.unsafePerformIO hs_bindgen_9917baac4ce08ba8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_PeepEvents@
foreign import ccall unsafe "hs_bindgen_a86a903c6648c81b"
  hs_bindgen_a86a903c6648c81b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_PeepEvents@
hs_bindgen_a86a903c6648c81b
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Event
             -> BG.CInt
             -> SDL_EventAction
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CInt
           )
       )
hs_bindgen_a86a903c6648c81b =
  BG.fromFFIType hs_bindgen_a86a903c6648c81b_base

{-# NOINLINE sDL_PeepEvents #-}

-- | Check the event queue for messages and optionally return them.
--
--     @action@ may be any of the following:
--
--     * @SDL_ADDEVENT@: up to @numevents@ events will be added to the back of the event queue.
--
--     * @SDL_PEEKEVENT@: @numevents@ events at the front of the event queue, within the specified minimum and maximum type, will be returned to the caller and will /not/ be removed from the queue. If you pass NULL for @events@, then @numevents@ is ignored and the total number of matching events will be returned.
--
--     * @SDL_GETEVENT@: up to @numevents@ events at the front of the event queue, within the specified minimum and maximum type, will be returned to the caller and will be removed from the queue.
--
--     You may have to call @SDL_PumpEvents()@ before calling this function. Otherwise, the events may not be ready to be filtered when you call @SDL_PeepEvents()@.
--
--     [@events@]: destination buffer for the retrieved events, may be NULL to leave the events in the queue and return the number of events that would have been stored.
--
--     [@numevents@]: if action is SDL_ADDEVENT, the number of events to add back to the event queue; if action is SDL_PEEKEVENT or SDL_GETEVENT, the maximum number of events to retrieve.
--
--     [@action@]: action to take; see Remarks for details.
--
--     [@minType@]: minimum value of the event type to be considered; SDL_EVENT_FIRST is a safe choice.
--
--     [@maxType@]: maximum value of the event type to be considered; SDL_EVENT_LAST is a safe choice.
--
--     [Returns]: the number of events actually stored or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PollEvent', 'sDL_PumpEvents', 'sDL_PushEvent'
--
--     [C declaration]: @SDL_PeepEvents@, defined at @SDL3\/SDL_events.h 1158:33@
sDL_PeepEvents
  :: BG.FunPtr
       ( BG.Ptr SDL_Event
         -> BG.CInt
         -> SDL_EventAction
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CInt
       )
sDL_PeepEvents =
  BG.unsafePerformIO hs_bindgen_a86a903c6648c81b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_HasEvent@
foreign import ccall unsafe "hs_bindgen_7e16852183b91d19"
  hs_bindgen_7e16852183b91d19_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_HasEvent@
hs_bindgen_7e16852183b91d19 :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_7e16852183b91d19 =
  BG.fromFFIType hs_bindgen_7e16852183b91d19_base

{-# NOINLINE sDL_HasEvent #-}

-- | Check for the existence of a certain event type in the event queue.
--
--     If you need to check for a range of event types, use @SDL_HasEvents()@ instead.
--
--     [@type@]: the type of event to be queried; see 'SDL_EventType' for details.
--
--     [Returns]: true if events matching @type@ are present, or false if events matching @type@ are not present.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasEvents'
--
--     [C declaration]: @SDL_HasEvent@, defined at @SDL3\/SDL_events.h 1177:34@
sDL_HasEvent :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_HasEvent =
  BG.unsafePerformIO hs_bindgen_7e16852183b91d19

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_HasEvents@
foreign import ccall unsafe "hs_bindgen_87deab19d987ab47"
  hs_bindgen_87deab19d987ab47_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_HasEvents@
hs_bindgen_87deab19d987ab47
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_87deab19d987ab47 =
  BG.fromFFIType hs_bindgen_87deab19d987ab47_base

{-# NOINLINE sDL_HasEvents #-}

-- | Check for the existence of certain event types in the event queue.
--
--     If you need to check for a single event type, use @SDL_HasEvent()@ instead.
--
--     [@minType@]: the low end of event type to be queried, inclusive; see 'SDL_EventType' for details.
--
--     [@maxType@]: the high end of event type to be queried, inclusive; see 'SDL_EventType' for details.
--
--     [Returns]: true if events with type >= @minType@ and \<= @maxType@ are present, or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasEvents'
--
--     [C declaration]: @SDL_HasEvents@, defined at @SDL3\/SDL_events.h 1198:34@
sDL_HasEvents
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_HasEvents =
  BG.unsafePerformIO hs_bindgen_87deab19d987ab47

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_FlushEvent@
foreign import ccall unsafe "hs_bindgen_3d397e2de8f614cb"
  hs_bindgen_3d397e2de8f614cb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_FlushEvent@
hs_bindgen_3d397e2de8f614cb :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO ()))
hs_bindgen_3d397e2de8f614cb =
  BG.fromFFIType hs_bindgen_3d397e2de8f614cb_base

{-# NOINLINE sDL_FlushEvent #-}

-- | Clear events of a specific type from the event queue.
--
--     This will unconditionally remove any events from the queue that match @type@. If you need to remove a range of event types, use @SDL_FlushEvents()@ instead.
--
--     It\'s also normal to just ignore events you don\'t care about in your event loop without calling this function.
--
--     This function only affects currently queued events. If you want to make sure that all pending OS events are flushed, you can call @SDL_PumpEvents()@ on the main thread immediately before the flush call.
--
--     If you have user events with custom data that needs to be freed, you should use @SDL_PeepEvents()@ to remove and clean up those events before calling this function.
--
--     [@type@]: the type of event to be cleared; see 'SDL_EventType' for details.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_FlushEvents'
--
--     [C declaration]: @SDL_FlushEvent@, defined at @SDL3\/SDL_events.h 1226:34@
sDL_FlushEvent :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO ())
sDL_FlushEvent =
  BG.unsafePerformIO hs_bindgen_3d397e2de8f614cb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_FlushEvents@
foreign import ccall unsafe "hs_bindgen_7409f3af10ababea"
  hs_bindgen_7409f3af10ababea_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_FlushEvents@
hs_bindgen_7409f3af10ababea
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO ()))
hs_bindgen_7409f3af10ababea =
  BG.fromFFIType hs_bindgen_7409f3af10ababea_base

{-# NOINLINE sDL_FlushEvents #-}

-- | Clear events of a range of types from the event queue.
--
--     This will unconditionally remove any events from the queue that are in the range of @minType@ to @maxType@, inclusive. If you need to remove a single event type, use @SDL_FlushEvent()@ instead.
--
--     It\'s also normal to just ignore events you don\'t care about in your event loop without calling this function.
--
--     This function only affects currently queued events. If you want to make sure that all pending OS events are flushed, you can call @SDL_PumpEvents()@ on the main thread immediately before the flush call.
--
--     [@minType@]: the low end of event type to be cleared, inclusive; see 'SDL_EventType' for details.
--
--     [@maxType@]: the high end of event type to be cleared, inclusive; see 'SDL_EventType' for details.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_FlushEvent'
--
--     [C declaration]: @SDL_FlushEvents@, defined at @SDL3\/SDL_events.h 1253:34@
sDL_FlushEvents
  :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO ())
sDL_FlushEvents =
  BG.unsafePerformIO hs_bindgen_7409f3af10ababea

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_PollEvent@
foreign import ccall unsafe "hs_bindgen_e695618acb9426fb"
  hs_bindgen_e695618acb9426fb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_PollEvent@
hs_bindgen_e695618acb9426fb :: IO (BG.FunPtr (BG.Ptr SDL_Event -> IO BG.CBool))
hs_bindgen_e695618acb9426fb =
  BG.fromFFIType hs_bindgen_e695618acb9426fb_base

{-# NOINLINE sDL_PollEvent #-}

-- | Poll for currently pending events.
--
--     If @event@ is not NULL, the next event is removed from the queue and stored in the 'SDL_Event' structure pointed to by @event@.
--
--     If @event@ is NULL, it simply returns true if there is an event in the queue, but will not remove it from the queue.
--
--     As this function may implicitly call @SDL_PumpEvents()@, you can only call this function in the thread that initialized the video subsystem.
--
--     @SDL_PollEvent()@ is the favored way of receiving system events since it can be done from the main loop and does not suspend the main loop while waiting on an event to be posted.
--
--     The common practice is to fully process the event queue once every frame, usually as a first step before updating the game\'s state:
--
--     @
--     while (game_is_still_running) {
--         SDL_Event event;
--         while (SDL_PollEvent(&event)) {  \/\/ poll until all events are handled!
--             \/\/ decide what to do with this event.
--         }
--
--         \/\/ update game state, draw the current frame
--     }
--     @
--
--     Note that Windows (and possibly other platforms) has a quirk about how it handles events while dragging\/resizing a window, which can cause this function to block for significant amounts of time. Technical explanations and solutions are discussed on the wiki:
--
--     [https:\/\/wiki.libsdl.org\/SDL3\/AppFreezeDuringDrag](https://wiki.libsdl.org/SDL3/AppFreezeDuringDrag)
--
--     [@event@]: the 'SDL_Event' structure to be filled with the next event from the queue, or NULL.
--
--     [Returns]: true if this got an event or false if there are none available.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PushEvent', 'sDL_WaitEvent', 'sDL_WaitEventTimeout'
--
--     [C declaration]: @SDL_PollEvent@, defined at @SDL3\/SDL_events.h 1304:34@
sDL_PollEvent :: BG.FunPtr (BG.Ptr SDL_Event -> IO BG.CBool)
sDL_PollEvent =
  BG.unsafePerformIO hs_bindgen_e695618acb9426fb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_WaitEvent@
foreign import ccall unsafe "hs_bindgen_94029194304d5c31"
  hs_bindgen_94029194304d5c31_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_WaitEvent@
hs_bindgen_94029194304d5c31 :: IO (BG.FunPtr (BG.Ptr SDL_Event -> IO BG.CBool))
hs_bindgen_94029194304d5c31 =
  BG.fromFFIType hs_bindgen_94029194304d5c31_base

{-# NOINLINE sDL_WaitEvent #-}

-- | Wait indefinitely for the next available event.
--
--     If @event@ is not NULL, the next event is removed from the queue and stored in the 'SDL_Event' structure pointed to by @event@.
--
--     As this function may implicitly call @SDL_PumpEvents()@, you can only call this function in the thread that initialized the video subsystem.
--
--     [@event@]: the 'SDL_Event' structure to be filled in with the next event from the queue, or NULL.
--
--     [Returns]: true on success or false if there was an error while waiting for events; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PollEvent', 'sDL_PushEvent', 'sDL_WaitEventTimeout'
--
--     [C declaration]: @SDL_WaitEvent@, defined at @SDL3\/SDL_events.h 1328:34@
sDL_WaitEvent :: BG.FunPtr (BG.Ptr SDL_Event -> IO BG.CBool)
sDL_WaitEvent =
  BG.unsafePerformIO hs_bindgen_94029194304d5c31

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_WaitEventTimeout@
foreign import ccall unsafe "hs_bindgen_7e78b9d3527f4720"
  hs_bindgen_7e78b9d3527f4720_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_WaitEventTimeout@
hs_bindgen_7e78b9d3527f4720
  :: IO (BG.FunPtr (BG.Ptr SDL_Event -> SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool))
hs_bindgen_7e78b9d3527f4720 =
  BG.fromFFIType hs_bindgen_7e78b9d3527f4720_base

{-# NOINLINE sDL_WaitEventTimeout #-}

-- | Wait until the specified timeout (in milliseconds) for the next available event.
--
--     If @event@ is not NULL, the next event is removed from the queue and stored in the 'SDL_Event' structure pointed to by @event@.
--
--     As this function may implicitly call @SDL_PumpEvents()@, you can only call this function in the thread that initialized the video subsystem.
--
--     The timeout is not guaranteed, the actual wait time could be longer due to system scheduling.
--
--     [@event@]: the 'SDL_Event' structure to be filled in with the next event from the queue, or NULL.
--
--     [@timeoutMS@]: the maximum number of milliseconds to wait for the next available event.
--
--     [Returns]: true if this got an event or false if the timeout elapsed without any events available.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PollEvent', 'sDL_PushEvent', 'sDL_WaitEvent'
--
--     [C declaration]: @SDL_WaitEventTimeout@, defined at @SDL3\/SDL_events.h 1358:34@
sDL_WaitEventTimeout
  :: BG.FunPtr (BG.Ptr SDL_Event -> SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool)
sDL_WaitEventTimeout =
  BG.unsafePerformIO hs_bindgen_7e78b9d3527f4720

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_PushEvent@
foreign import ccall unsafe "hs_bindgen_949def362b6a6d49"
  hs_bindgen_949def362b6a6d49_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_PushEvent@
hs_bindgen_949def362b6a6d49 :: IO (BG.FunPtr (BG.Ptr SDL_Event -> IO BG.CBool))
hs_bindgen_949def362b6a6d49 =
  BG.fromFFIType hs_bindgen_949def362b6a6d49_base

{-# NOINLINE sDL_PushEvent #-}

-- | Add an event to the event queue.
--
--     The event queue can actually be used as a two way communication channel. Not only can events be read from the queue, but the user can also push their own events onto it. @event@ is a pointer to the event structure you wish to push onto the queue. The event is copied into the queue, and the caller may dispose of the memory pointed to after @SDL_PushEvent()@ returns.
--
--     Note: Pushing device input events onto the queue doesn\'t modify the state of the device within SDL.
--
--     Note: Events pushed onto the queue with @SDL_PushEvent()@ get passed through the event filter but events added with @SDL_PeepEvents()@ do not.
--
--     For pushing application-specific events, please use @SDL_RegisterEvents()@ to get an event type that does not conflict with other code that also wants its own custom event types.
--
--     [@event@]: the 'SDL_Event' to be added to the queue.
--
--     [Returns]: true on success, false if the event was filtered or on failure; call SDL_GetError() for more information. A common reason for error is the event queue being full.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PeepEvents', 'sDL_PollEvent', 'sDL_RegisterEvents'
--
--     [C declaration]: @SDL_PushEvent@, defined at @SDL3\/SDL_events.h 1392:34@
sDL_PushEvent :: BG.FunPtr (BG.Ptr SDL_Event -> IO BG.CBool)
sDL_PushEvent =
  BG.unsafePerformIO hs_bindgen_949def362b6a6d49

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_SetEventFilter@
foreign import ccall unsafe "hs_bindgen_b512227bb5014eea"
  hs_bindgen_b512227bb5014eea_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_SetEventFilter@
hs_bindgen_b512227bb5014eea :: IO (BG.FunPtr (SDL_EventFilter -> BG.Ptr BG.Void -> IO ()))
hs_bindgen_b512227bb5014eea =
  BG.fromFFIType hs_bindgen_b512227bb5014eea_base

{-# NOINLINE sDL_SetEventFilter #-}

-- | Set up a filter to process all events before they are added to the internal event queue.
--
--     If you just want to see events without modifying them or preventing them from being queued, you should use @SDL_AddEventWatch()@ instead.
--
--     If the filter function returns true when called, then the event will be added to the internal queue. If it returns false, then the event will be dropped from the queue, but the internal state will still be updated. This allows selective filtering of dynamically arriving events.
--
--     __WARNING__: Be very careful of what you do in the event filter function, as it may run in a different thread! The exception is handling of SDL_EVENT_WINDOW_EXPOSED, which is guaranteed to be sent from the OS on the main thread and you are expected to redraw your window in response to this event.
--
--     On platforms that support it, if the quit event is generated by an interrupt signal (e.g. pressing Ctrl-C), it will be delivered to the application at the next event poll.
--
--     Note: Disabled events never make it to the event filter function; see @SDL_SetEventEnabled()@.
--
--     Note: Events pushed onto the queue with @SDL_PushEvent()@ get passed through the event filter, but events pushed onto the queue with @SDL_PeepEvents()@ do not.
--
--     [@filter@]: a function to call when an event happens.
--
--     [@userdata@]: a pointer that is passed to @filter@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddEventWatch', 'sDL_SetEventEnabled', 'sDL_GetEventFilter', 'sDL_PeepEvents', 'sDL_PushEvent'
--
--     [C declaration]: @SDL_SetEventFilter@, defined at @SDL3\/SDL_events.h 1457:34@
sDL_SetEventFilter :: BG.FunPtr (SDL_EventFilter -> BG.Ptr BG.Void -> IO ())
sDL_SetEventFilter =
  BG.unsafePerformIO hs_bindgen_b512227bb5014eea

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_GetEventFilter@
foreign import ccall unsafe "hs_bindgen_55ed84f0612cc8ac"
  hs_bindgen_55ed84f0612cc8ac_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_GetEventFilter@
hs_bindgen_55ed84f0612cc8ac
  :: IO (BG.FunPtr (BG.Ptr SDL_EventFilter -> BG.Ptr (BG.Ptr BG.Void) -> IO BG.CBool))
hs_bindgen_55ed84f0612cc8ac =
  BG.fromFFIType hs_bindgen_55ed84f0612cc8ac_base

{-# NOINLINE sDL_GetEventFilter #-}

-- | Query the current event filter.
--
--     This function can be used to \"chain\" filters, by saving the existing filter before replacing it with a function that will call that saved filter.
--
--     [@filter@]: the current callback function will be stored here.
--
--     [@userdata@]: the pointer that is passed to the current event filter will be stored here.
--
--     [Returns]: true on success or false if there is no event filter set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetEventFilter'
--
--     [C declaration]: @SDL_GetEventFilter@, defined at @SDL3\/SDL_events.h 1476:34@
sDL_GetEventFilter :: BG.FunPtr (BG.Ptr SDL_EventFilter -> BG.Ptr (BG.Ptr BG.Void) -> IO BG.CBool)
sDL_GetEventFilter =
  BG.unsafePerformIO hs_bindgen_55ed84f0612cc8ac

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_AddEventWatch@
foreign import ccall unsafe "hs_bindgen_a03e121760f6b6d3"
  hs_bindgen_a03e121760f6b6d3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_AddEventWatch@
hs_bindgen_a03e121760f6b6d3 :: IO (BG.FunPtr (SDL_EventFilter -> BG.Ptr BG.Void -> IO BG.CBool))
hs_bindgen_a03e121760f6b6d3 =
  BG.fromFFIType hs_bindgen_a03e121760f6b6d3_base

{-# NOINLINE sDL_AddEventWatch #-}

-- | Add a callback to be triggered when an event is added to the event queue.
--
--     @filter@ will be called when an event happens, and its return value is ignored.
--
--     __WARNING__: Be very careful of what you do in the event filter function, as it may run in a different thread!
--
--     If the quit event is generated by a signal (e.g. SIGINT), it will bypass the internal queue and be delivered to the watch callback immediately, and arrive at the next event poll.
--
--     Note: the callback is called for events posted by the user through @SDL_PushEvent()@, but not for disabled events, nor for events by a filter callback set with @SDL_SetEventFilter()@, nor for events posted by the user through @SDL_PeepEvents()@.
--
--     [@filter@]: an 'SDL_EventFilter' function to call when an event happens.
--
--     [@userdata@]: a pointer that is passed to @filter@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RemoveEventWatch', 'sDL_SetEventFilter'
--
--     [C declaration]: @SDL_AddEventWatch@, defined at @SDL3\/SDL_events.h 1508:34@
sDL_AddEventWatch :: BG.FunPtr (SDL_EventFilter -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_AddEventWatch =
  BG.unsafePerformIO hs_bindgen_a03e121760f6b6d3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_RemoveEventWatch@
foreign import ccall unsafe "hs_bindgen_25dfb37d4e519ab9"
  hs_bindgen_25dfb37d4e519ab9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_RemoveEventWatch@
hs_bindgen_25dfb37d4e519ab9 :: IO (BG.FunPtr (SDL_EventFilter -> BG.Ptr BG.Void -> IO ()))
hs_bindgen_25dfb37d4e519ab9 =
  BG.fromFFIType hs_bindgen_25dfb37d4e519ab9_base

{-# NOINLINE sDL_RemoveEventWatch #-}

-- | Remove an event watch callback added with @SDL_AddEventWatch()@.
--
--     This function takes the same input as @SDL_AddEventWatch()@ to identify and delete the corresponding callback.
--
--     [@filter@]: the function originally passed to @SDL_AddEventWatch()@.
--
--     [@userdata@]: the pointer originally passed to @SDL_AddEventWatch()@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddEventWatch'
--
--     [C declaration]: @SDL_RemoveEventWatch@, defined at @SDL3\/SDL_events.h 1525:34@
sDL_RemoveEventWatch :: BG.FunPtr (SDL_EventFilter -> BG.Ptr BG.Void -> IO ())
sDL_RemoveEventWatch =
  BG.unsafePerformIO hs_bindgen_25dfb37d4e519ab9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_FilterEvents@
foreign import ccall unsafe "hs_bindgen_53f4b12fdab2103a"
  hs_bindgen_53f4b12fdab2103a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_FilterEvents@
hs_bindgen_53f4b12fdab2103a :: IO (BG.FunPtr (SDL_EventFilter -> BG.Ptr BG.Void -> IO ()))
hs_bindgen_53f4b12fdab2103a =
  BG.fromFFIType hs_bindgen_53f4b12fdab2103a_base

{-# NOINLINE sDL_FilterEvents #-}

-- | Run a specific filter function on the current event queue, removing any events for which the filter returns false.
--
--     See @SDL_SetEventFilter()@ for more information. Unlike @SDL_SetEventFilter()@, this function does not change the filter permanently, it only uses the supplied filter until this function returns.
--
--     [@filter@]: the 'SDL_EventFilter' function to call when an event happens.
--
--     [@userdata@]: a pointer that is passed to @filter@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetEventFilter', 'sDL_SetEventFilter'
--
--     [C declaration]: @SDL_FilterEvents@, defined at @SDL3\/SDL_events.h 1545:34@
sDL_FilterEvents :: BG.FunPtr (SDL_EventFilter -> BG.Ptr BG.Void -> IO ())
sDL_FilterEvents =
  BG.unsafePerformIO hs_bindgen_53f4b12fdab2103a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_SetEventEnabled@
foreign import ccall unsafe "hs_bindgen_aa066d1126b2d52a"
  hs_bindgen_aa066d1126b2d52a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_SetEventEnabled@
hs_bindgen_aa066d1126b2d52a :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> BG.CBool -> IO ()))
hs_bindgen_aa066d1126b2d52a =
  BG.fromFFIType hs_bindgen_aa066d1126b2d52a_base

{-# NOINLINE sDL_SetEventEnabled #-}

-- | Set the state of processing events by type.
--
--     [@type@]: the type of event; see 'SDL_EventType' for details.
--
--     [@enabled@]: whether to process the event or not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_EventEnabled'
--
--     [C declaration]: @SDL_SetEventEnabled@, defined at @SDL3\/SDL_events.h 1559:34@
sDL_SetEventEnabled :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> BG.CBool -> IO ())
sDL_SetEventEnabled =
  BG.unsafePerformIO hs_bindgen_aa066d1126b2d52a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_EventEnabled@
foreign import ccall unsafe "hs_bindgen_22ccd2bcfeb8819e"
  hs_bindgen_22ccd2bcfeb8819e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_EventEnabled@
hs_bindgen_22ccd2bcfeb8819e :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_22ccd2bcfeb8819e =
  BG.fromFFIType hs_bindgen_22ccd2bcfeb8819e_base

{-# NOINLINE sDL_EventEnabled #-}

-- | Query the state of processing events by type.
--
--     [@type@]: the type of event; see 'SDL_EventType' for details.
--
--     [Returns]: true if the event is being processed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetEventEnabled'
--
--     [C declaration]: @SDL_EventEnabled@, defined at @SDL3\/SDL_events.h 1573:34@
sDL_EventEnabled :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_EventEnabled =
  BG.unsafePerformIO hs_bindgen_22ccd2bcfeb8819e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_RegisterEvents@
foreign import ccall unsafe "hs_bindgen_1bc1c2cf7c7f16d2"
  hs_bindgen_1bc1c2cf7c7f16d2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_RegisterEvents@
hs_bindgen_1bc1c2cf7c7f16d2 :: IO (BG.FunPtr (BG.CInt -> IO SDL3.Sys.Bindgen.Stdinc.Uint32))
hs_bindgen_1bc1c2cf7c7f16d2 =
  BG.fromFFIType hs_bindgen_1bc1c2cf7c7f16d2_base

{-# NOINLINE sDL_RegisterEvents #-}

-- | Allocate a set of user-defined events, and return the beginning event number for that set of events.
--
--     [@numevents@]: the number of events to be allocated.
--
--     [Returns]: the beginning event number, or 0 if numevents is invalid or if there are not enough user-defined events left.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PushEvent'
--
--     [C declaration]: @SDL_RegisterEvents@, defined at @SDL3\/SDL_events.h 1589:36@
sDL_RegisterEvents :: BG.FunPtr (BG.CInt -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
sDL_RegisterEvents =
  BG.unsafePerformIO hs_bindgen_1bc1c2cf7c7f16d2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_GetWindowFromEvent@
foreign import ccall unsafe "hs_bindgen_9835b9a553ca5082"
  hs_bindgen_9835b9a553ca5082_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_GetWindowFromEvent@
hs_bindgen_9835b9a553ca5082
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL_Event -> IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)))
hs_bindgen_9835b9a553ca5082 =
  BG.fromFFIType hs_bindgen_9835b9a553ca5082_base

{-# NOINLINE sDL_GetWindowFromEvent #-}

-- | Get window associated with an event.
--
--     [@event@]: an event containing a @windowID@.
--
--     [Returns]: the associated window on success or NULL if there is none.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PollEvent', 'sDL_WaitEvent', 'sDL_WaitEventTimeout'
--
--     [C declaration]: @SDL_GetWindowFromEvent@, defined at @SDL3\/SDL_events.h 1605:42@
sDL_GetWindowFromEvent
  :: BG.FunPtr (PtrConst.PtrConst SDL_Event -> IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window))
sDL_GetWindowFromEvent =
  BG.unsafePerformIO hs_bindgen_9835b9a553ca5082

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_GetEventDescription@
foreign import ccall unsafe "hs_bindgen_1326a7cde53572c5"
  hs_bindgen_1326a7cde53572c5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_get_SDL_GetEventDescription@
hs_bindgen_1326a7cde53572c5
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL_Event -> BG.Ptr BG.CChar -> BG.CInt -> IO BG.CInt))
hs_bindgen_1326a7cde53572c5 =
  BG.fromFFIType hs_bindgen_1326a7cde53572c5_base

{-# NOINLINE sDL_GetEventDescription #-}

-- | Generate an English description of an event.
--
--     This will fill @buf@ with a null-terminated string that might look something like this:
--
--     @
--     SDL_EVENT_MOUSE_MOTION (timestamp=1140256324 windowid=2 which=0 state=0 x=492.99 y=139.09 xrel=52 yrel=6)
--     @
--
--     The exact format of the string is not guaranteed; it is intended for logging purposes, to be read by a human, and not parsed by a computer.
--
--     The returned value follows the same rules as SDL_snprintf(): @buf@ will always be NULL-terminated (unless @buflen@ is zero), and will be truncated if @buflen@ is too small. The return code is the number of bytes needed for the complete string, not counting the NULL-terminator, whether the string was truncated or not. Unlike SDL_snprintf(), though, this function never returns -1.
--
--     [@event@]: an event to describe. May be NULL.
--
--     [@buf@]: the buffer to fill with the description string. May be NULL.
--
--     [@buflen@]: the maximum bytes that can be written to @buf@.
--
--     [Returns]: number of bytes needed for the full string, not counting the null-terminator byte.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetEventDescription@, defined at @SDL3\/SDL_events.h 1637:33@
sDL_GetEventDescription
  :: BG.FunPtr (PtrConst.PtrConst SDL_Event -> BG.Ptr BG.CChar -> BG.CInt -> IO BG.CInt)
sDL_GetEventDescription =
  BG.unsafePerformIO hs_bindgen_1326a7cde53572c5

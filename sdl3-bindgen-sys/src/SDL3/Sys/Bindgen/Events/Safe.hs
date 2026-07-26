{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Events.Safe (
  SDL3.Sys.Bindgen.Events.Safe.sDL_PumpEvents,
  SDL3.Sys.Bindgen.Events.Safe.sDL_PeepEvents,
  SDL3.Sys.Bindgen.Events.Safe.sDL_HasEvent,
  SDL3.Sys.Bindgen.Events.Safe.sDL_HasEvents,
  SDL3.Sys.Bindgen.Events.Safe.sDL_FlushEvent,
  SDL3.Sys.Bindgen.Events.Safe.sDL_FlushEvents,
  SDL3.Sys.Bindgen.Events.Safe.sDL_PollEvent,
  SDL3.Sys.Bindgen.Events.Safe.sDL_WaitEvent,
  SDL3.Sys.Bindgen.Events.Safe.sDL_WaitEventTimeout,
  SDL3.Sys.Bindgen.Events.Safe.sDL_PushEvent,
  SDL3.Sys.Bindgen.Events.Safe.sDL_SetEventFilter,
  SDL3.Sys.Bindgen.Events.Safe.sDL_GetEventFilter,
  SDL3.Sys.Bindgen.Events.Safe.sDL_AddEventWatch,
  SDL3.Sys.Bindgen.Events.Safe.sDL_RemoveEventWatch,
  SDL3.Sys.Bindgen.Events.Safe.sDL_FilterEvents,
  SDL3.Sys.Bindgen.Events.Safe.sDL_SetEventEnabled,
  SDL3.Sys.Bindgen.Events.Safe.sDL_EventEnabled,
  SDL3.Sys.Bindgen.Events.Safe.sDL_RegisterEvents,
  SDL3.Sys.Bindgen.Events.Safe.sDL_GetWindowFromEvent,
  SDL3.Sys.Bindgen.Events.Safe.sDL_GetEventDescription,
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
         , "void hs_bindgen_1f67d12e30b7c737 (void)"
         , "{"
         , "  (SDL_PumpEvents)();"
         , "}"
         , "signed int hs_bindgen_955ad135478289d8 ("
         , "  SDL_Event *arg1,"
         , "  signed int arg2,"
         , "  SDL_EventAction arg3,"
         , "  Uint32 arg4,"
         , "  Uint32 arg5"
         , ")"
         , "{"
         , "  return (SDL_PeepEvents)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_97c2d6376377c17b ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return (SDL_HasEvent)(arg1);"
         , "}"
         , "_Bool hs_bindgen_313622652a8473b1 ("
         , "  Uint32 arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return (SDL_HasEvents)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_2d03a2b249bf7669 ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  (SDL_FlushEvent)(arg1);"
         , "}"
         , "void hs_bindgen_445ea0272a2d7d08 ("
         , "  Uint32 arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  (SDL_FlushEvents)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_ceef91a4b9f5e02b ("
         , "  SDL_Event *arg1"
         , ")"
         , "{"
         , "  return (SDL_PollEvent)(arg1);"
         , "}"
         , "_Bool hs_bindgen_23e78ed0fb51a6da ("
         , "  SDL_Event *arg1"
         , ")"
         , "{"
         , "  return (SDL_WaitEvent)(arg1);"
         , "}"
         , "_Bool hs_bindgen_556eff19f5f71f6a ("
         , "  SDL_Event *arg1,"
         , "  Sint32 arg2"
         , ")"
         , "{"
         , "  return (SDL_WaitEventTimeout)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_b43b72b75f8fc0a4 ("
         , "  SDL_Event *arg1"
         , ")"
         , "{"
         , "  return (SDL_PushEvent)(arg1);"
         , "}"
         , "void hs_bindgen_2af28699d7398805 ("
         , "  SDL_EventFilter arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  (SDL_SetEventFilter)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_be8f273c9471fe63 ("
         , "  SDL_EventFilter *arg1,"
         , "  void **arg2"
         , ")"
         , "{"
         , "  return (SDL_GetEventFilter)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_1032b9b1e1b3559e ("
         , "  SDL_EventFilter arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return (SDL_AddEventWatch)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_3dfeb3d0c0d67825 ("
         , "  SDL_EventFilter arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  (SDL_RemoveEventWatch)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_6c8e2afc32ccc02a ("
         , "  SDL_EventFilter arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  (SDL_FilterEvents)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_980b7ed1ad20c98e ("
         , "  Uint32 arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  (SDL_SetEventEnabled)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_581f5ed4b389f9ad ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return (SDL_EventEnabled)(arg1);"
         , "}"
         , "Uint32 hs_bindgen_68df500d3720ae65 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_RegisterEvents)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_bf32d25772bf7533 ("
         , "  SDL_Event const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowFromEvent)(arg1);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "signed int hs_bindgen_791dc84efb7c9255 ("
         , "  SDL_Event const *arg1,"
         , "  char *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetEventDescription)(arg1, arg2, arg3);"
         , "#else"
         , "  (void)arg1; (void)arg2; (void)arg3; SDL_SetError(\"SDL_GetEventDescription requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_PumpEvents@
foreign import ccall safe "hs_bindgen_1f67d12e30b7c737"
  hs_bindgen_1f67d12e30b7c737_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_PumpEvents@
hs_bindgen_1f67d12e30b7c737 :: IO ()
hs_bindgen_1f67d12e30b7c737 =
  BG.fromFFIType hs_bindgen_1f67d12e30b7c737_base

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
sDL_PumpEvents :: IO ()
sDL_PumpEvents = hs_bindgen_1f67d12e30b7c737

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_PeepEvents@
foreign import ccall safe "hs_bindgen_955ad135478289d8"
  hs_bindgen_955ad135478289d8_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_PeepEvents@
hs_bindgen_955ad135478289d8
  :: BG.Ptr SDL_Event
  -> BG.CInt
  -> SDL_EventAction
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CInt
hs_bindgen_955ad135478289d8 =
  BG.fromFFIType hs_bindgen_955ad135478289d8_base

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
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@events@]: destination buffer for the retrieved events, may be NULL to leave the events in the queue and return the number of events that would have been stored.
  -> BG.CInt
  -- ^
  --
  --           [@numevents@]: if action is SDL_ADDEVENT, the number of events to add back to the event queue; if action is SDL_PEEKEVENT or SDL_GETEVENT, the maximum number of events to retrieve.
  -> SDL_EventAction
  -- ^
  --
  --           [@action@]: action to take; see Remarks for details.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@minType@]: minimum value of the event type to be considered; SDL_EVENT_FIRST is a safe choice.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@maxType@]: maximum value of the event type to be considered; SDL_EVENT_LAST is a safe choice.
  -> IO BG.CInt
sDL_PeepEvents = hs_bindgen_955ad135478289d8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_HasEvent@
foreign import ccall safe "hs_bindgen_97c2d6376377c17b"
  hs_bindgen_97c2d6376377c17b_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_HasEvent@
hs_bindgen_97c2d6376377c17b
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_97c2d6376377c17b =
  BG.fromFFIType hs_bindgen_97c2d6376377c17b_base

-- | Check for the existence of a certain event type in the event queue.
--
--     If you need to check for a range of event types, use @SDL_HasEvents()@ instead.
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
sDL_HasEvent
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@type@]: the type of event to be queried; see 'SDL_EventType' for details.
  -> IO BG.CBool
sDL_HasEvent = hs_bindgen_97c2d6376377c17b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_HasEvents@
foreign import ccall safe "hs_bindgen_313622652a8473b1"
  hs_bindgen_313622652a8473b1_base
    :: BG.Word32
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_HasEvents@
hs_bindgen_313622652a8473b1
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_313622652a8473b1 =
  BG.fromFFIType hs_bindgen_313622652a8473b1_base

-- | Check for the existence of certain event types in the event queue.
--
--     If you need to check for a single event type, use @SDL_HasEvent()@ instead.
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
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@minType@]: the low end of event type to be queried, inclusive; see 'SDL_EventType' for details.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@maxType@]: the high end of event type to be queried, inclusive; see 'SDL_EventType' for details.
  -> IO BG.CBool
sDL_HasEvents = hs_bindgen_313622652a8473b1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_FlushEvent@
foreign import ccall safe "hs_bindgen_2d03a2b249bf7669"
  hs_bindgen_2d03a2b249bf7669_base
    :: BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_FlushEvent@
hs_bindgen_2d03a2b249bf7669
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_2d03a2b249bf7669 =
  BG.fromFFIType hs_bindgen_2d03a2b249bf7669_base

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
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_FlushEvents'
--
--     [C declaration]: @SDL_FlushEvent@, defined at @SDL3\/SDL_events.h 1226:34@
sDL_FlushEvent
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@type@]: the type of event to be cleared; see 'SDL_EventType' for details.
  -> IO ()
sDL_FlushEvent = hs_bindgen_2d03a2b249bf7669

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_FlushEvents@
foreign import ccall safe "hs_bindgen_445ea0272a2d7d08"
  hs_bindgen_445ea0272a2d7d08_base
    :: BG.Word32
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_FlushEvents@
hs_bindgen_445ea0272a2d7d08
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_445ea0272a2d7d08 =
  BG.fromFFIType hs_bindgen_445ea0272a2d7d08_base

-- | Clear events of a range of types from the event queue.
--
--     This will unconditionally remove any events from the queue that are in the range of @minType@ to @maxType@, inclusive. If you need to remove a single event type, use @SDL_FlushEvent()@ instead.
--
--     It\'s also normal to just ignore events you don\'t care about in your event loop without calling this function.
--
--     This function only affects currently queued events. If you want to make sure that all pending OS events are flushed, you can call @SDL_PumpEvents()@ on the main thread immediately before the flush call.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_FlushEvent'
--
--     [C declaration]: @SDL_FlushEvents@, defined at @SDL3\/SDL_events.h 1253:34@
sDL_FlushEvents
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@minType@]: the low end of event type to be cleared, inclusive; see 'SDL_EventType' for details.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@maxType@]: the high end of event type to be cleared, inclusive; see 'SDL_EventType' for details.
  -> IO ()
sDL_FlushEvents = hs_bindgen_445ea0272a2d7d08

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_PollEvent@
foreign import ccall safe "hs_bindgen_ceef91a4b9f5e02b"
  hs_bindgen_ceef91a4b9f5e02b_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_PollEvent@
hs_bindgen_ceef91a4b9f5e02b
  :: BG.Ptr SDL_Event
  -> IO BG.CBool
hs_bindgen_ceef91a4b9f5e02b =
  BG.fromFFIType hs_bindgen_ceef91a4b9f5e02b_base

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
--     [Returns]: true if this got an event or false if there are none available.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PushEvent', 'sDL_WaitEvent', 'sDL_WaitEventTimeout'
--
--     [C declaration]: @SDL_PollEvent@, defined at @SDL3\/SDL_events.h 1304:34@
sDL_PollEvent
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@event@]: the 'SDL_Event' structure to be filled with the next event from the queue, or NULL.
  -> IO BG.CBool
sDL_PollEvent = hs_bindgen_ceef91a4b9f5e02b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_WaitEvent@
foreign import ccall safe "hs_bindgen_23e78ed0fb51a6da"
  hs_bindgen_23e78ed0fb51a6da_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_WaitEvent@
hs_bindgen_23e78ed0fb51a6da
  :: BG.Ptr SDL_Event
  -> IO BG.CBool
hs_bindgen_23e78ed0fb51a6da =
  BG.fromFFIType hs_bindgen_23e78ed0fb51a6da_base

-- | Wait indefinitely for the next available event.
--
--     If @event@ is not NULL, the next event is removed from the queue and stored in the 'SDL_Event' structure pointed to by @event@.
--
--     As this function may implicitly call @SDL_PumpEvents()@, you can only call this function in the thread that initialized the video subsystem.
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
sDL_WaitEvent
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@event@]: the 'SDL_Event' structure to be filled in with the next event from the queue, or NULL.
  -> IO BG.CBool
sDL_WaitEvent = hs_bindgen_23e78ed0fb51a6da

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_WaitEventTimeout@
foreign import ccall safe "hs_bindgen_556eff19f5f71f6a"
  hs_bindgen_556eff19f5f71f6a_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_WaitEventTimeout@
hs_bindgen_556eff19f5f71f6a
  :: BG.Ptr SDL_Event
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -> IO BG.CBool
hs_bindgen_556eff19f5f71f6a =
  BG.fromFFIType hs_bindgen_556eff19f5f71f6a_base

-- | Wait until the specified timeout (in milliseconds) for the next available event.
--
--     If @event@ is not NULL, the next event is removed from the queue and stored in the 'SDL_Event' structure pointed to by @event@.
--
--     As this function may implicitly call @SDL_PumpEvents()@, you can only call this function in the thread that initialized the video subsystem.
--
--     The timeout is not guaranteed, the actual wait time could be longer due to system scheduling.
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
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@event@]: the 'SDL_Event' structure to be filled in with the next event from the queue, or NULL.
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@timeoutMS@]: the maximum number of milliseconds to wait for the next available event.
  -> IO BG.CBool
sDL_WaitEventTimeout = hs_bindgen_556eff19f5f71f6a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_PushEvent@
foreign import ccall safe "hs_bindgen_b43b72b75f8fc0a4"
  hs_bindgen_b43b72b75f8fc0a4_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_PushEvent@
hs_bindgen_b43b72b75f8fc0a4
  :: BG.Ptr SDL_Event
  -> IO BG.CBool
hs_bindgen_b43b72b75f8fc0a4 =
  BG.fromFFIType hs_bindgen_b43b72b75f8fc0a4_base

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
--     [Returns]: true on success, false if the event was filtered or on failure; call SDL_GetError() for more information. A common reason for error is the event queue being full.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PeepEvents', 'sDL_PollEvent', 'sDL_RegisterEvents'
--
--     [C declaration]: @SDL_PushEvent@, defined at @SDL3\/SDL_events.h 1392:34@
sDL_PushEvent
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@event@]: the 'SDL_Event' to be added to the queue.
  -> IO BG.CBool
sDL_PushEvent = hs_bindgen_b43b72b75f8fc0a4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_SetEventFilter@
foreign import ccall safe "hs_bindgen_2af28699d7398805"
  hs_bindgen_2af28699d7398805_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_SetEventFilter@
hs_bindgen_2af28699d7398805
  :: SDL_EventFilter
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_2af28699d7398805 =
  BG.fromFFIType hs_bindgen_2af28699d7398805_base

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
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddEventWatch', 'sDL_SetEventEnabled', 'sDL_GetEventFilter', 'sDL_PeepEvents', 'sDL_PushEvent'
--
--     [C declaration]: @SDL_SetEventFilter@, defined at @SDL3\/SDL_events.h 1457:34@
sDL_SetEventFilter
  :: SDL_EventFilter
  -- ^
  --
  --           [@filter@]: a function to call when an event happens.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @filter@.
  -> IO ()
sDL_SetEventFilter = hs_bindgen_2af28699d7398805

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_GetEventFilter@
foreign import ccall safe "hs_bindgen_be8f273c9471fe63"
  hs_bindgen_be8f273c9471fe63_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_GetEventFilter@
hs_bindgen_be8f273c9471fe63
  :: BG.Ptr SDL_EventFilter
  -> BG.Ptr (BG.Ptr BG.Void)
  -> IO BG.CBool
hs_bindgen_be8f273c9471fe63 =
  BG.fromFFIType hs_bindgen_be8f273c9471fe63_base

-- | Query the current event filter.
--
--     This function can be used to \"chain\" filters, by saving the existing filter before replacing it with a function that will call that saved filter.
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
sDL_GetEventFilter
  :: BG.Ptr SDL_EventFilter
  -- ^
  --
  --           [@filter@]: the current callback function will be stored here.
  -> BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@userdata@]: the pointer that is passed to the current event filter will be stored here.
  -> IO BG.CBool
sDL_GetEventFilter = hs_bindgen_be8f273c9471fe63

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_AddEventWatch@
foreign import ccall safe "hs_bindgen_1032b9b1e1b3559e"
  hs_bindgen_1032b9b1e1b3559e_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_AddEventWatch@
hs_bindgen_1032b9b1e1b3559e
  :: SDL_EventFilter
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_1032b9b1e1b3559e =
  BG.fromFFIType hs_bindgen_1032b9b1e1b3559e_base

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
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RemoveEventWatch', 'sDL_SetEventFilter'
--
--     [C declaration]: @SDL_AddEventWatch@, defined at @SDL3\/SDL_events.h 1508:34@
sDL_AddEventWatch
  :: SDL_EventFilter
  -- ^
  --
  --           [@filter@]: an 'SDL_EventFilter' function to call when an event happens.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @filter@.
  -> IO BG.CBool
sDL_AddEventWatch = hs_bindgen_1032b9b1e1b3559e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_RemoveEventWatch@
foreign import ccall safe "hs_bindgen_3dfeb3d0c0d67825"
  hs_bindgen_3dfeb3d0c0d67825_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_RemoveEventWatch@
hs_bindgen_3dfeb3d0c0d67825
  :: SDL_EventFilter
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_3dfeb3d0c0d67825 =
  BG.fromFFIType hs_bindgen_3dfeb3d0c0d67825_base

-- | Remove an event watch callback added with @SDL_AddEventWatch()@.
--
--     This function takes the same input as @SDL_AddEventWatch()@ to identify and delete the corresponding callback.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddEventWatch'
--
--     [C declaration]: @SDL_RemoveEventWatch@, defined at @SDL3\/SDL_events.h 1525:34@
sDL_RemoveEventWatch
  :: SDL_EventFilter
  -- ^
  --
  --           [@filter@]: the function originally passed to @SDL_AddEventWatch()@.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: the pointer originally passed to @SDL_AddEventWatch()@.
  -> IO ()
sDL_RemoveEventWatch = hs_bindgen_3dfeb3d0c0d67825

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_FilterEvents@
foreign import ccall safe "hs_bindgen_6c8e2afc32ccc02a"
  hs_bindgen_6c8e2afc32ccc02a_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_FilterEvents@
hs_bindgen_6c8e2afc32ccc02a
  :: SDL_EventFilter
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_6c8e2afc32ccc02a =
  BG.fromFFIType hs_bindgen_6c8e2afc32ccc02a_base

-- | Run a specific filter function on the current event queue, removing any events for which the filter returns false.
--
--     See @SDL_SetEventFilter()@ for more information. Unlike @SDL_SetEventFilter()@, this function does not change the filter permanently, it only uses the supplied filter until this function returns.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetEventFilter', 'sDL_SetEventFilter'
--
--     [C declaration]: @SDL_FilterEvents@, defined at @SDL3\/SDL_events.h 1545:34@
sDL_FilterEvents
  :: SDL_EventFilter
  -- ^
  --
  --           [@filter@]: the 'SDL_EventFilter' function to call when an event happens.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @filter@.
  -> IO ()
sDL_FilterEvents = hs_bindgen_6c8e2afc32ccc02a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_SetEventEnabled@
foreign import ccall safe "hs_bindgen_980b7ed1ad20c98e"
  hs_bindgen_980b7ed1ad20c98e_base
    :: BG.Word32
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_SetEventEnabled@
hs_bindgen_980b7ed1ad20c98e
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> BG.CBool
  -> IO ()
hs_bindgen_980b7ed1ad20c98e =
  BG.fromFFIType hs_bindgen_980b7ed1ad20c98e_base

-- | Set the state of processing events by type.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_EventEnabled'
--
--     [C declaration]: @SDL_SetEventEnabled@, defined at @SDL3\/SDL_events.h 1559:34@
sDL_SetEventEnabled
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@type@]: the type of event; see 'SDL_EventType' for details.
  -> BG.CBool
  -- ^
  --
  --           [@enabled@]: whether to process the event or not.
  -> IO ()
sDL_SetEventEnabled = hs_bindgen_980b7ed1ad20c98e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_EventEnabled@
foreign import ccall safe "hs_bindgen_581f5ed4b389f9ad"
  hs_bindgen_581f5ed4b389f9ad_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_EventEnabled@
hs_bindgen_581f5ed4b389f9ad
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_581f5ed4b389f9ad =
  BG.fromFFIType hs_bindgen_581f5ed4b389f9ad_base

-- | Query the state of processing events by type.
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
sDL_EventEnabled
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@type@]: the type of event; see 'SDL_EventType' for details.
  -> IO BG.CBool
sDL_EventEnabled = hs_bindgen_581f5ed4b389f9ad

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_RegisterEvents@
foreign import ccall safe "hs_bindgen_68df500d3720ae65"
  hs_bindgen_68df500d3720ae65_base
    :: BG.Int32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_RegisterEvents@
hs_bindgen_68df500d3720ae65
  :: BG.CInt
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_68df500d3720ae65 =
  BG.fromFFIType hs_bindgen_68df500d3720ae65_base

-- | Allocate a set of user-defined events, and return the beginning event number for that set of events.
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
sDL_RegisterEvents
  :: BG.CInt
  -- ^
  --
  --           [@numevents@]: the number of events to be allocated.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
sDL_RegisterEvents = hs_bindgen_68df500d3720ae65

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_GetWindowFromEvent@
foreign import ccall safe "hs_bindgen_bf32d25772bf7533"
  hs_bindgen_bf32d25772bf7533_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_GetWindowFromEvent@
hs_bindgen_bf32d25772bf7533
  :: PtrConst.PtrConst SDL_Event
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
hs_bindgen_bf32d25772bf7533 =
  BG.fromFFIType hs_bindgen_bf32d25772bf7533_base

-- | Get window associated with an event.
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
  :: PtrConst.PtrConst SDL_Event
  -- ^
  --
  --           [@event@]: an event containing a @windowID@.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
sDL_GetWindowFromEvent = hs_bindgen_bf32d25772bf7533

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_GetEventDescription@
foreign import ccall safe "hs_bindgen_791dc84efb7c9255"
  hs_bindgen_791dc84efb7c9255_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Events_Safe_SDL_GetEventDescription@
hs_bindgen_791dc84efb7c9255
  :: PtrConst.PtrConst SDL_Event
  -> BG.Ptr BG.CChar
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_791dc84efb7c9255 =
  BG.fromFFIType hs_bindgen_791dc84efb7c9255_base

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
--     [Returns]: number of bytes needed for the full string, not counting the null-terminator byte.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetEventDescription@, defined at @SDL3\/SDL_events.h 1637:33@
sDL_GetEventDescription
  :: PtrConst.PtrConst SDL_Event
  -- ^
  --
  --           [@event@]: an event to describe. May be NULL.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@buf@]: the buffer to fill with the description string. May be NULL.
  -> BG.CInt
  -- ^
  --
  --           [@buflen@]: the maximum bytes that can be written to @buf@.
  -> IO BG.CInt
sDL_GetEventDescription = hs_bindgen_791dc84efb7c9255

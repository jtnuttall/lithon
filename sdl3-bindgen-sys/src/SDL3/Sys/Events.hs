-- | Event queue management.
--
--     It\'s extremely common often required that an app deal with SDL\'s event queue. Almost all useful information about interactions with the real world flow through here: the user interacting with the computer and app, hardware coming and going, the system changing in some way, etc.
--
--     An app generally takes a moment, perhaps at the start of a new frame, to examine any events that have occurred since the last time and process or ignore them. This is generally done by calling @'pollEvent'@ in a loop until it returns false (or, if using the main callbacks, events are provided one at a time in calls to SDL_AppEvent() before the next call to SDL_AppIterate(); in this scenario, the app does not call @'pollEvent'@ at all).
--
--     There is other forms of control, too: @'peepEvents'@ has more functionality at the cost of more complexity, and @'waitEvent'@ can block the process until something interesting happens, which might be beneficial for certain types of programs on low-power hardware. One may also call @'addEventWatch'@ to set a callback when new events arrive.
--
--     The app is free to generate their own events, too: 'pushEvent' allows the app to put events onto the queue for later retrieval; 'registerEvents' can guarantee that these events have a type that isn\'t in use by other parts of the system. The types of events that can be delivered.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Events.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
--
--     == Reading events
--
--     @SDL_Event@ is a C union: poll into an @alloca@ buffer, read the event-type discriminant first, then peek the payload member for that type. The @sdl3-raw@ example in the repository shows the full idiom; 'pollEvent' and the @SDL_EVENT_*@ patterns live in this module.
module SDL3.Sys.Events (
  module SDL3.Sys.Bindgen.Events,

  -- * Function aliases
  SDL3.Sys.Events.pumpEvents,
  SDL3.Sys.Events.pumpEventsSafe,
  SDL3.Sys.Events.peepEvents,
  SDL3.Sys.Events.peepEventsSafe,
  SDL3.Sys.Events.hasEvent,
  SDL3.Sys.Events.hasEventSafe,
  SDL3.Sys.Events.hasEvents,
  SDL3.Sys.Events.hasEventsSafe,
  SDL3.Sys.Events.flushEvent,
  SDL3.Sys.Events.flushEventSafe,
  SDL3.Sys.Events.flushEvents,
  SDL3.Sys.Events.flushEventsSafe,
  SDL3.Sys.Events.pollEvent,
  SDL3.Sys.Events.pollEventSafe,
  SDL3.Sys.Events.waitEvent,
  SDL3.Sys.Events.waitEventSafe,
  SDL3.Sys.Events.waitEventTimeout,
  SDL3.Sys.Events.waitEventTimeoutSafe,
  SDL3.Sys.Events.pushEvent,
  SDL3.Sys.Events.pushEventSafe,
  SDL3.Sys.Events.setEventFilter,
  SDL3.Sys.Events.setEventFilterSafe,
  SDL3.Sys.Events.getEventFilter,
  SDL3.Sys.Events.getEventFilterSafe,
  SDL3.Sys.Events.addEventWatch,
  SDL3.Sys.Events.addEventWatchSafe,
  SDL3.Sys.Events.removeEventWatch,
  SDL3.Sys.Events.removeEventWatchSafe,
  SDL3.Sys.Events.filterEventsSafe,
  SDL3.Sys.Events.setEventEnabled,
  SDL3.Sys.Events.setEventEnabledSafe,
  SDL3.Sys.Events.eventEnabled,
  SDL3.Sys.Events.eventEnabledSafe,
  SDL3.Sys.Events.registerEvents,
  SDL3.Sys.Events.registerEventsSafe,
  SDL3.Sys.Events.getWindowFromEvent,
  SDL3.Sys.Events.getWindowFromEventSafe,
  SDL3.Sys.Events.getEventDescription,
  SDL3.Sys.Events.getEventDescriptionSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Events
import SDL3.Sys.Bindgen.Events.Safe qualified as Safe
import SDL3.Sys.Bindgen.Events.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Video qualified

-- | Pump the event loop, gathering events from the input devices.
--
--     This function updates the event queue and internal input device state.
--
--     @'pumpEvents'@ gathers all the pending input information from devices and places it in the event queue. Without calls to @'pumpEvents'@ no events would ever be placed on the queue. Often the need for calls to @'pumpEvents'@ is hidden from the user since @'pollEvent'@ and @'waitEvent'@ implicitly call @'pumpEvents'@. However, if you are not polling or waiting for events (e.g. you are filtering them), then you must call @'pumpEvents'@ to force an event queue update.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'pollEvent', 'waitEvent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PumpEvents@.
--                   The safe flavor is 'pumpEventsSafe'
--                   : may re-enter registered watchers\/filters\/hit tests.
--
--     [C declaration]: @SDL_PumpEvents@, defined at @SDL3\/SDL_events.h 1100:34@
pumpEvents :: IO ()
pumpEvents = Unsafe.sDL_PumpEvents

-- | Pump the event loop, gathering events from the input devices.
--
--     This function updates the event queue and internal input device state.
--
--     @'pumpEvents'@ gathers all the pending input information from devices and places it in the event queue. Without calls to @'pumpEvents'@ no events would ever be placed on the queue. Often the need for calls to @'pumpEvents'@ is hidden from the user since @'pollEvent'@ and @'waitEvent'@ implicitly call @'pumpEvents'@. However, if you are not polling or waiting for events (e.g. you are filtering them), then you must call @'pumpEvents'@ to force an event queue update.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'pollEvent', 'waitEvent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PumpEvents@.
--                   The unsafe flavor is 'pumpEvents'
--                   : may re-enter registered watchers\/filters\/hit tests.
--
--     [C declaration]: @SDL_PumpEvents@, defined at @SDL3\/SDL_events.h 1100:34@
pumpEventsSafe :: IO ()
pumpEventsSafe = Safe.sDL_PumpEvents

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
--     You may have to call @'pumpEvents'@ before calling this function. Otherwise, the events may not be ready to be filtered when you call @'peepEvents'@.
--
--     [Returns]: the number of events actually stored or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'pollEvent', 'pumpEvents', 'pushEvent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PeepEvents@.
--                   The safe flavor is 'peepEventsSafe'
--                   : SDL_ADDEVENT runs registered event filters\/watchers synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PeepEvents@, defined at @SDL3\/SDL_events.h 1158:33@
peepEvents
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@events@]: destination buffer for the retrieved events, may be NULL to leave the events in the queue and return the number of events that would have been stored.
  -> BG.Int32
  -- ^
  --
  --           [@numevents@]: if action is SDL_ADDEVENT, the number of events to add back to the event queue; if action is SDL_PEEKEVENT or SDL_GETEVENT, the maximum number of events to retrieve.
  -> SDL_EventAction
  -- ^
  --
  --           [@action@]: action to take; see Remarks for details.
  -> BG.Word32
  -- ^
  --
  --           [@minType@]: minimum value of the event type to be considered; SDL_EVENT_FIRST is a safe choice.
  -> BG.Word32
  -- ^
  --
  --           [@maxType@]: maximum value of the event type to be considered; SDL_EVENT_LAST is a safe choice.
  -> IO BG.Int32
peepEvents =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              Coerce.coerce
              (Unsafe.sDL_PeepEvents x00 (Coerce.coerce x11) x22 (Coerce.coerce x33) (Coerce.coerce x44))

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
--     You may have to call @'pumpEvents'@ before calling this function. Otherwise, the events may not be ready to be filtered when you call @'peepEvents'@.
--
--     [Returns]: the number of events actually stored or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'pollEvent', 'pumpEvents', 'pushEvent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PeepEvents@.
--                   The unsafe flavor is 'peepEvents'
--                   : SDL_ADDEVENT runs registered event filters\/watchers synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PeepEvents@, defined at @SDL3\/SDL_events.h 1158:33@
peepEventsSafe
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@events@]: destination buffer for the retrieved events, may be NULL to leave the events in the queue and return the number of events that would have been stored.
  -> BG.Int32
  -- ^
  --
  --           [@numevents@]: if action is SDL_ADDEVENT, the number of events to add back to the event queue; if action is SDL_PEEKEVENT or SDL_GETEVENT, the maximum number of events to retrieve.
  -> SDL_EventAction
  -- ^
  --
  --           [@action@]: action to take; see Remarks for details.
  -> BG.Word32
  -- ^
  --
  --           [@minType@]: minimum value of the event type to be considered; SDL_EVENT_FIRST is a safe choice.
  -> BG.Word32
  -- ^
  --
  --           [@maxType@]: maximum value of the event type to be considered; SDL_EVENT_LAST is a safe choice.
  -> IO BG.Int32
peepEventsSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              Coerce.coerce
              (Safe.sDL_PeepEvents x00 (Coerce.coerce x11) x22 (Coerce.coerce x33) (Coerce.coerce x44))

-- | Check for the existence of a certain event type in the event queue.
--
--     If you need to check for a range of event types, use @'hasEvents'@ instead.
--
--     [Returns]: true if events matching @type@ are present, or false if events matching @type@ are not present.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasEvents'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasEvent@.
--                   The safe flavor is 'hasEventSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasEvent@, defined at @SDL3\/SDL_events.h 1177:34@
hasEvent
  :: BG.Word32
  -- ^
  --
  --           [@type@]: the type of event to be queried; see 'SDL_EventType' for details.
  -> IO Bool
hasEvent =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_HasEvent (Coerce.coerce x00))

-- | Check for the existence of a certain event type in the event queue.
--
--     If you need to check for a range of event types, use @'hasEvents'@ instead.
--
--     [Returns]: true if events matching @type@ are present, or false if events matching @type@ are not present.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasEvents'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasEvent@.
--                   The unsafe flavor is 'hasEvent'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasEvent@, defined at @SDL3\/SDL_events.h 1177:34@
hasEventSafe
  :: BG.Word32
  -- ^
  --
  --           [@type@]: the type of event to be queried; see 'SDL_EventType' for details.
  -> IO Bool
hasEventSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_HasEvent (Coerce.coerce x00))

-- | Check for the existence of certain event types in the event queue.
--
--     If you need to check for a single event type, use @'hasEvent'@ instead.
--
--     [Returns]: true if events with type >= @minType@ and \<= @maxType@ are present, or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasEvents'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasEvents@.
--                   The safe flavor is 'hasEventsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasEvents@, defined at @SDL3\/SDL_events.h 1198:34@
hasEvents
  :: BG.Word32
  -- ^
  --
  --           [@minType@]: the low end of event type to be queried, inclusive; see 'SDL_EventType' for details.
  -> BG.Word32
  -- ^
  --
  --           [@maxType@]: the high end of event type to be queried, inclusive; see 'SDL_EventType' for details.
  -> IO Bool
hasEvents =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_HasEvents (Coerce.coerce x00) (Coerce.coerce x11))

-- | Check for the existence of certain event types in the event queue.
--
--     If you need to check for a single event type, use @'hasEvent'@ instead.
--
--     [Returns]: true if events with type >= @minType@ and \<= @maxType@ are present, or false if not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasEvents'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasEvents@.
--                   The unsafe flavor is 'hasEvents'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasEvents@, defined at @SDL3\/SDL_events.h 1198:34@
hasEventsSafe
  :: BG.Word32
  -- ^
  --
  --           [@minType@]: the low end of event type to be queried, inclusive; see 'SDL_EventType' for details.
  -> BG.Word32
  -- ^
  --
  --           [@maxType@]: the high end of event type to be queried, inclusive; see 'SDL_EventType' for details.
  -> IO Bool
hasEventsSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_HasEvents (Coerce.coerce x00) (Coerce.coerce x11))

-- | Clear events of a specific type from the event queue.
--
--     This will unconditionally remove any events from the queue that match @type@. If you need to remove a range of event types, use @'flushEvents'@ instead.
--
--     It\'s also normal to just ignore events you don\'t care about in your event loop without calling this function.
--
--     This function only affects currently queued events. If you want to make sure that all pending OS events are flushed, you can call @'pumpEvents'@ on the main thread immediately before the flush call.
--
--     If you have user events with custom data that needs to be freed, you should use @'peepEvents'@ to remove and clean up those events before calling this function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'flushEvents'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_FlushEvent@.
--                   The safe flavor is 'flushEventSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlushEvent@, defined at @SDL3\/SDL_events.h 1226:34@
flushEvent
  :: BG.Word32
  -- ^
  --
  --           [@type@]: the type of event to be cleared; see 'SDL_EventType' for details.
  -> IO ()
flushEvent =
  \x00 -> Unsafe.sDL_FlushEvent (Coerce.coerce x00)

-- | Clear events of a specific type from the event queue.
--
--     This will unconditionally remove any events from the queue that match @type@. If you need to remove a range of event types, use @'flushEvents'@ instead.
--
--     It\'s also normal to just ignore events you don\'t care about in your event loop without calling this function.
--
--     This function only affects currently queued events. If you want to make sure that all pending OS events are flushed, you can call @'pumpEvents'@ on the main thread immediately before the flush call.
--
--     If you have user events with custom data that needs to be freed, you should use @'peepEvents'@ to remove and clean up those events before calling this function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'flushEvents'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_FlushEvent@.
--                   The unsafe flavor is 'flushEvent'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlushEvent@, defined at @SDL3\/SDL_events.h 1226:34@
flushEventSafe
  :: BG.Word32
  -- ^
  --
  --           [@type@]: the type of event to be cleared; see 'SDL_EventType' for details.
  -> IO ()
flushEventSafe =
  \x00 -> Safe.sDL_FlushEvent (Coerce.coerce x00)

-- | Clear events of a range of types from the event queue.
--
--     This will unconditionally remove any events from the queue that are in the range of @minType@ to @maxType@, inclusive. If you need to remove a single event type, use @'flushEvent'@ instead.
--
--     It\'s also normal to just ignore events you don\'t care about in your event loop without calling this function.
--
--     This function only affects currently queued events. If you want to make sure that all pending OS events are flushed, you can call @'pumpEvents'@ on the main thread immediately before the flush call.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'flushEvent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_FlushEvents@.
--                   The safe flavor is 'flushEventsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlushEvents@, defined at @SDL3\/SDL_events.h 1253:34@
flushEvents
  :: BG.Word32
  -- ^
  --
  --           [@minType@]: the low end of event type to be cleared, inclusive; see 'SDL_EventType' for details.
  -> BG.Word32
  -- ^
  --
  --           [@maxType@]: the high end of event type to be cleared, inclusive; see 'SDL_EventType' for details.
  -> IO ()
flushEvents =
  \x00 ->
    \x11 ->
      Unsafe.sDL_FlushEvents (Coerce.coerce x00) (Coerce.coerce x11)

-- | Clear events of a range of types from the event queue.
--
--     This will unconditionally remove any events from the queue that are in the range of @minType@ to @maxType@, inclusive. If you need to remove a single event type, use @'flushEvent'@ instead.
--
--     It\'s also normal to just ignore events you don\'t care about in your event loop without calling this function.
--
--     This function only affects currently queued events. If you want to make sure that all pending OS events are flushed, you can call @'pumpEvents'@ on the main thread immediately before the flush call.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'flushEvent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_FlushEvents@.
--                   The unsafe flavor is 'flushEvents'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlushEvents@, defined at @SDL3\/SDL_events.h 1253:34@
flushEventsSafe
  :: BG.Word32
  -- ^
  --
  --           [@minType@]: the low end of event type to be cleared, inclusive; see 'SDL_EventType' for details.
  -> BG.Word32
  -- ^
  --
  --           [@maxType@]: the high end of event type to be cleared, inclusive; see 'SDL_EventType' for details.
  -> IO ()
flushEventsSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_FlushEvents (Coerce.coerce x00) (Coerce.coerce x11)

-- | Poll for currently pending events.
--
--     If @event@ is not NULL, the next event is removed from the queue and stored in the 'SDL_Event' structure pointed to by @event@.
--
--     If @event@ is NULL, it simply returns true if there is an event in the queue, but will not remove it from the queue.
--
--     As this function may implicitly call @'pumpEvents'@, you can only call this function in the thread that initialized the video subsystem.
--
--     @'pollEvent'@ is the favored way of receiving system events since it can be done from the main loop and does not suspend the main loop while waiting on an event to be posted.
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
--     [See also]: 'pushEvent', 'waitEvent', 'waitEventTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PollEvent@.
--                   The safe flavor is 'pollEventSafe'
--                   : pumps events; may re-enter registered watchers\/filters\/hit tests.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PollEvent@, defined at @SDL3\/SDL_events.h 1304:34@
pollEvent
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@event@]: the 'SDL_Event' structure to be filled with the next event from the queue, or NULL.
  -> IO Bool
pollEvent =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_PollEvent x00)

-- | Poll for currently pending events.
--
--     If @event@ is not NULL, the next event is removed from the queue and stored in the 'SDL_Event' structure pointed to by @event@.
--
--     If @event@ is NULL, it simply returns true if there is an event in the queue, but will not remove it from the queue.
--
--     As this function may implicitly call @'pumpEvents'@, you can only call this function in the thread that initialized the video subsystem.
--
--     @'pollEvent'@ is the favored way of receiving system events since it can be done from the main loop and does not suspend the main loop while waiting on an event to be posted.
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
--     [See also]: 'pushEvent', 'waitEvent', 'waitEventTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PollEvent@.
--                   The unsafe flavor is 'pollEvent'
--                   : pumps events; may re-enter registered watchers\/filters\/hit tests.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PollEvent@, defined at @SDL3\/SDL_events.h 1304:34@
pollEventSafe
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@event@]: the 'SDL_Event' structure to be filled with the next event from the queue, or NULL.
  -> IO Bool
pollEventSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_PollEvent x00)

-- | Wait indefinitely for the next available event.
--
--     If @event@ is not NULL, the next event is removed from the queue and stored in the 'SDL_Event' structure pointed to by @event@.
--
--     As this function may implicitly call @'pumpEvents'@, you can only call this function in the thread that initialized the video subsystem.
--
--     [Returns]: true on success or false if there was an error while waiting for events; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'pollEvent', 'pushEvent', 'waitEventTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitEvent@.
--                   The safe flavor is 'waitEventSafe'
--                   : blocks the calling capability; a blocking unsafe call stalls GC program-wide.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitEvent@, defined at @SDL3\/SDL_events.h 1328:34@
waitEvent
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@event@]: the 'SDL_Event' structure to be filled in with the next event from the queue, or NULL.
  -> IO Bool
waitEvent =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_WaitEvent x00)

-- | Wait indefinitely for the next available event.
--
--     If @event@ is not NULL, the next event is removed from the queue and stored in the 'SDL_Event' structure pointed to by @event@.
--
--     As this function may implicitly call @'pumpEvents'@, you can only call this function in the thread that initialized the video subsystem.
--
--     [Returns]: true on success or false if there was an error while waiting for events; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'pollEvent', 'pushEvent', 'waitEventTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitEvent@.
--                   The unsafe flavor is 'waitEvent'
--                   : blocks the calling capability; a blocking unsafe call stalls GC program-wide.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitEvent@, defined at @SDL3\/SDL_events.h 1328:34@
waitEventSafe
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@event@]: the 'SDL_Event' structure to be filled in with the next event from the queue, or NULL.
  -> IO Bool
waitEventSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_WaitEvent x00)

-- | Wait until the specified timeout (in milliseconds) for the next available event.
--
--     If @event@ is not NULL, the next event is removed from the queue and stored in the 'SDL_Event' structure pointed to by @event@.
--
--     As this function may implicitly call @'pumpEvents'@, you can only call this function in the thread that initialized the video subsystem.
--
--     The timeout is not guaranteed, the actual wait time could be longer due to system scheduling.
--
--     [Returns]: true if this got an event or false if the timeout elapsed without any events available.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'pollEvent', 'pushEvent', 'waitEvent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitEventTimeout@.
--                   The safe flavor is 'waitEventTimeoutSafe'
--                   : blocks up to the timeout.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitEventTimeout@, defined at @SDL3\/SDL_events.h 1358:34@
waitEventTimeout
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@event@]: the 'SDL_Event' structure to be filled in with the next event from the queue, or NULL.
  -> BG.Int32
  -- ^
  --
  --           [@timeoutMS@]: the maximum number of milliseconds to wait for the next available event.
  -> IO Bool
waitEventTimeout =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WaitEventTimeout x00 (Coerce.coerce x11))

-- | Wait until the specified timeout (in milliseconds) for the next available event.
--
--     If @event@ is not NULL, the next event is removed from the queue and stored in the 'SDL_Event' structure pointed to by @event@.
--
--     As this function may implicitly call @'pumpEvents'@, you can only call this function in the thread that initialized the video subsystem.
--
--     The timeout is not guaranteed, the actual wait time could be longer due to system scheduling.
--
--     [Returns]: true if this got an event or false if the timeout elapsed without any events available.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'pollEvent', 'pushEvent', 'waitEvent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitEventTimeout@.
--                   The unsafe flavor is 'waitEventTimeout'
--                   : blocks up to the timeout.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitEventTimeout@, defined at @SDL3\/SDL_events.h 1358:34@
waitEventTimeoutSafe
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@event@]: the 'SDL_Event' structure to be filled in with the next event from the queue, or NULL.
  -> BG.Int32
  -- ^
  --
  --           [@timeoutMS@]: the maximum number of milliseconds to wait for the next available event.
  -> IO Bool
waitEventTimeoutSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WaitEventTimeout x00 (Coerce.coerce x11))

-- | Add an event to the event queue.
--
--     The event queue can actually be used as a two way communication channel. Not only can events be read from the queue, but the user can also push their own events onto it. @event@ is a pointer to the event structure you wish to push onto the queue. The event is copied into the queue, and the caller may dispose of the memory pointed to after @'pushEvent'@ returns.
--
--     Note: Pushing device input events onto the queue doesn\'t modify the state of the device within SDL.
--
--     Note: Events pushed onto the queue with @'pushEvent'@ get passed through the event filter but events added with @'peepEvents'@ do not.
--
--     For pushing application-specific events, please use @'registerEvents'@ to get an event type that does not conflict with other code that also wants its own custom event types.
--
--     [Returns]: true on success, false if the event was filtered or on failure; call 'SDL3.Sys.Error.getError' for more information. A common reason for error is the event queue being full.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'peepEvents', 'pollEvent', 'registerEvents'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PushEvent@.
--                   The safe flavor is 'pushEventSafe'
--                   : runs registered event filters\/watchers synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PushEvent@, defined at @SDL3\/SDL_events.h 1392:34@
pushEvent
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@event@]: the 'SDL_Event' to be added to the queue.
  -> IO Bool
pushEvent =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_PushEvent x00)

-- | Add an event to the event queue.
--
--     The event queue can actually be used as a two way communication channel. Not only can events be read from the queue, but the user can also push their own events onto it. @event@ is a pointer to the event structure you wish to push onto the queue. The event is copied into the queue, and the caller may dispose of the memory pointed to after @'pushEvent'@ returns.
--
--     Note: Pushing device input events onto the queue doesn\'t modify the state of the device within SDL.
--
--     Note: Events pushed onto the queue with @'pushEvent'@ get passed through the event filter but events added with @'peepEvents'@ do not.
--
--     For pushing application-specific events, please use @'registerEvents'@ to get an event type that does not conflict with other code that also wants its own custom event types.
--
--     [Returns]: true on success, false if the event was filtered or on failure; call 'SDL3.Sys.Error.getError' for more information. A common reason for error is the event queue being full.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'peepEvents', 'pollEvent', 'registerEvents'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PushEvent@.
--                   The unsafe flavor is 'pushEvent'
--                   : runs registered event filters\/watchers synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PushEvent@, defined at @SDL3\/SDL_events.h 1392:34@
pushEventSafe
  :: BG.Ptr SDL_Event
  -- ^
  --
  --           [@event@]: the 'SDL_Event' to be added to the queue.
  -> IO Bool
pushEventSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_PushEvent x00)

-- | Set up a filter to process all events before they are added to the internal event queue.
--
--     If you just want to see events without modifying them or preventing them from being queued, you should use @'addEventWatch'@ instead.
--
--     If the filter function returns true when called, then the event will be added to the internal queue. If it returns false, then the event will be dropped from the queue, but the internal state will still be updated. This allows selective filtering of dynamically arriving events.
--
--     __WARNING__: Be very careful of what you do in the event filter function, as it may run in a different thread! The exception is handling of SDL_EVENT_WINDOW_EXPOSED, which is guaranteed to be sent from the OS on the main thread and you are expected to redraw your window in response to this event.
--
--     On platforms that support it, if the quit event is generated by an interrupt signal (e.g. pressing Ctrl-C), it will be delivered to the application at the next event poll.
--
--     Note: Disabled events never make it to the event filter function; see @'setEventEnabled'@.
--
--     Note: Events pushed onto the queue with @'pushEvent'@ get passed through the event filter, but events pushed onto the queue with @'peepEvents'@ do not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addEventWatch', 'setEventEnabled', 'getEventFilter', 'peepEvents', 'pushEvent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetEventFilter@.
--                   The safe flavor is 'setEventFilterSafe'
--                   : registration; the filter runs from later event calls.
--
--     [C declaration]: @SDL_SetEventFilter@, defined at @SDL3\/SDL_events.h 1457:34@
setEventFilter
  :: SDL_EventFilter
  -- ^
  --
  --           [@filter@]: a function to call when an event happens.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @filter@.
  -> IO ()
setEventFilter = Unsafe.sDL_SetEventFilter

-- | Set up a filter to process all events before they are added to the internal event queue.
--
--     If you just want to see events without modifying them or preventing them from being queued, you should use @'addEventWatch'@ instead.
--
--     If the filter function returns true when called, then the event will be added to the internal queue. If it returns false, then the event will be dropped from the queue, but the internal state will still be updated. This allows selective filtering of dynamically arriving events.
--
--     __WARNING__: Be very careful of what you do in the event filter function, as it may run in a different thread! The exception is handling of SDL_EVENT_WINDOW_EXPOSED, which is guaranteed to be sent from the OS on the main thread and you are expected to redraw your window in response to this event.
--
--     On platforms that support it, if the quit event is generated by an interrupt signal (e.g. pressing Ctrl-C), it will be delivered to the application at the next event poll.
--
--     Note: Disabled events never make it to the event filter function; see @'setEventEnabled'@.
--
--     Note: Events pushed onto the queue with @'pushEvent'@ get passed through the event filter, but events pushed onto the queue with @'peepEvents'@ do not.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addEventWatch', 'setEventEnabled', 'getEventFilter', 'peepEvents', 'pushEvent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetEventFilter@.
--                   The unsafe flavor is 'setEventFilter'
--                   : registration; the filter runs from later event calls.
--
--     [C declaration]: @SDL_SetEventFilter@, defined at @SDL3\/SDL_events.h 1457:34@
setEventFilterSafe
  :: SDL_EventFilter
  -- ^
  --
  --           [@filter@]: a function to call when an event happens.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @filter@.
  -> IO ()
setEventFilterSafe = Safe.sDL_SetEventFilter

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
--     [See also]: 'setEventFilter'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetEventFilter@.
--                   The safe flavor is 'getEventFilterSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetEventFilter@, defined at @SDL3\/SDL_events.h 1476:34@
getEventFilter
  :: BG.Ptr SDL_EventFilter
  -- ^
  --
  --           [@filter@]: the current callback function will be stored here.
  -> BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@userdata@]: the pointer that is passed to the current event filter will be stored here.
  -> IO Bool
getEventFilter =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetEventFilter x00 x11)

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
--     [See also]: 'setEventFilter'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetEventFilter@.
--                   The unsafe flavor is 'getEventFilter'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetEventFilter@, defined at @SDL3\/SDL_events.h 1476:34@
getEventFilterSafe
  :: BG.Ptr SDL_EventFilter
  -- ^
  --
  --           [@filter@]: the current callback function will be stored here.
  -> BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@userdata@]: the pointer that is passed to the current event filter will be stored here.
  -> IO Bool
getEventFilterSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetEventFilter x00 x11)

-- | Add a callback to be triggered when an event is added to the event queue.
--
--     @filter@ will be called when an event happens, and its return value is ignored.
--
--     __WARNING__: Be very careful of what you do in the event filter function, as it may run in a different thread!
--
--     If the quit event is generated by a signal (e.g. SIGINT), it will bypass the internal queue and be delivered to the watch callback immediately, and arrive at the next event poll.
--
--     Note: the callback is called for events posted by the user through @'pushEvent'@, but not for disabled events, nor for events by a filter callback set with @'setEventFilter'@, nor for events posted by the user through @'peepEvents'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'removeEventWatch', 'setEventFilter'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AddEventWatch@.
--                   The safe flavor is 'addEventWatchSafe'
--                   : registration; the watch runs from later event pumping.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddEventWatch@, defined at @SDL3\/SDL_events.h 1508:34@
addEventWatch
  :: SDL_EventFilter
  -- ^
  --
  --           [@filter@]: an 'SDL_EventFilter' function to call when an event happens.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @filter@.
  -> IO Bool
addEventWatch =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_AddEventWatch x00 x11)

-- | Add a callback to be triggered when an event is added to the event queue.
--
--     @filter@ will be called when an event happens, and its return value is ignored.
--
--     __WARNING__: Be very careful of what you do in the event filter function, as it may run in a different thread!
--
--     If the quit event is generated by a signal (e.g. SIGINT), it will bypass the internal queue and be delivered to the watch callback immediately, and arrive at the next event poll.
--
--     Note: the callback is called for events posted by the user through @'pushEvent'@, but not for disabled events, nor for events by a filter callback set with @'setEventFilter'@, nor for events posted by the user through @'peepEvents'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'removeEventWatch', 'setEventFilter'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AddEventWatch@.
--                   The unsafe flavor is 'addEventWatch'
--                   : registration; the watch runs from later event pumping.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddEventWatch@, defined at @SDL3\/SDL_events.h 1508:34@
addEventWatchSafe
  :: SDL_EventFilter
  -- ^
  --
  --           [@filter@]: an 'SDL_EventFilter' function to call when an event happens.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @filter@.
  -> IO Bool
addEventWatchSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_AddEventWatch x00 x11)

-- | Remove an event watch callback added with @'addEventWatch'@.
--
--     This function takes the same input as @'addEventWatch'@ to identify and delete the corresponding callback.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addEventWatch'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RemoveEventWatch@.
--                   The safe flavor is 'removeEventWatchSafe'
--                   : deregistration only.
--
--     [C declaration]: @SDL_RemoveEventWatch@, defined at @SDL3\/SDL_events.h 1525:34@
removeEventWatch
  :: SDL_EventFilter
  -- ^
  --
  --           [@filter@]: the function originally passed to @'addEventWatch'@.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: the pointer originally passed to @'addEventWatch'@.
  -> IO ()
removeEventWatch = Unsafe.sDL_RemoveEventWatch

-- | Remove an event watch callback added with @'addEventWatch'@.
--
--     This function takes the same input as @'addEventWatch'@ to identify and delete the corresponding callback.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addEventWatch'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RemoveEventWatch@.
--                   The unsafe flavor is 'removeEventWatch'
--                   : deregistration only.
--
--     [C declaration]: @SDL_RemoveEventWatch@, defined at @SDL3\/SDL_events.h 1525:34@
removeEventWatchSafe
  :: SDL_EventFilter
  -- ^
  --
  --           [@filter@]: the function originally passed to @'addEventWatch'@.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: the pointer originally passed to @'addEventWatch'@.
  -> IO ()
removeEventWatchSafe = Safe.sDL_RemoveEventWatch

-- | Run a specific filter function on the current event queue, removing any events for which the filter returns false.
--
--     See @'setEventFilter'@ for more information. Unlike @'setEventFilter'@, this function does not change the filter permanently, it only uses the supplied filter until this function returns.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getEventFilter', 'setEventFilter'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_FilterEvents@.
--                   The unsafe import is not exported
--                   : runs the filter over the queue synchronously.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Events.Unsafe.sDL_FilterEvents@.
--
--     [C declaration]: @SDL_FilterEvents@, defined at @SDL3\/SDL_events.h 1545:34@
filterEventsSafe
  :: SDL_EventFilter
  -- ^
  --
  --           [@filter@]: the 'SDL_EventFilter' function to call when an event happens.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @filter@.
  -> IO ()
filterEventsSafe = Safe.sDL_FilterEvents

-- | Set the state of processing events by type.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'eventEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetEventEnabled@.
--                   The safe flavor is 'setEventEnabledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetEventEnabled@, defined at @SDL3\/SDL_events.h 1559:34@
setEventEnabled
  :: BG.Word32
  -- ^
  --
  --           [@type@]: the type of event; see 'SDL_EventType' for details.
  -> Bool
  -- ^
  --
  --           [@enabled@]: whether to process the event or not.
  -> IO ()
setEventEnabled =
  \x00 ->
    \x11 ->
      Unsafe.sDL_SetEventEnabled (Coerce.coerce x00) (CBool.fromBool x11)

-- | Set the state of processing events by type.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'eventEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetEventEnabled@.
--                   The unsafe flavor is 'setEventEnabled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetEventEnabled@, defined at @SDL3\/SDL_events.h 1559:34@
setEventEnabledSafe
  :: BG.Word32
  -- ^
  --
  --           [@type@]: the type of event; see 'SDL_EventType' for details.
  -> Bool
  -- ^
  --
  --           [@enabled@]: whether to process the event or not.
  -> IO ()
setEventEnabledSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_SetEventEnabled (Coerce.coerce x00) (CBool.fromBool x11)

-- | Query the state of processing events by type.
--
--     [Returns]: true if the event is being processed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setEventEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_EventEnabled@.
--                   The safe flavor is 'eventEnabledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_EventEnabled@, defined at @SDL3\/SDL_events.h 1573:34@
eventEnabled
  :: BG.Word32
  -- ^
  --
  --           [@type@]: the type of event; see 'SDL_EventType' for details.
  -> IO Bool
eventEnabled =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_EventEnabled (Coerce.coerce x00))

-- | Query the state of processing events by type.
--
--     [Returns]: true if the event is being processed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setEventEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EventEnabled@.
--                   The unsafe flavor is 'eventEnabled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_EventEnabled@, defined at @SDL3\/SDL_events.h 1573:34@
eventEnabledSafe
  :: BG.Word32
  -- ^
  --
  --           [@type@]: the type of event; see 'SDL_EventType' for details.
  -> IO Bool
eventEnabledSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_EventEnabled (Coerce.coerce x00))

-- | Allocate a set of user-defined events, and return the beginning event number for that set of events.
--
--     [Returns]: the beginning event number, or 0 if numevents is invalid or if there are not enough user-defined events left.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'pushEvent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RegisterEvents@.
--                   The safe flavor is 'registerEventsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RegisterEvents@, defined at @SDL3\/SDL_events.h 1589:36@
registerEvents
  :: BG.Int32
  -- ^
  --
  --           [@numevents@]: the number of events to be allocated.
  -> IO BG.Word32
registerEvents =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_RegisterEvents (Coerce.coerce x00))

-- | Allocate a set of user-defined events, and return the beginning event number for that set of events.
--
--     [Returns]: the beginning event number, or 0 if numevents is invalid or if there are not enough user-defined events left.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'pushEvent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RegisterEvents@.
--                   The unsafe flavor is 'registerEvents'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RegisterEvents@, defined at @SDL3\/SDL_events.h 1589:36@
registerEventsSafe
  :: BG.Int32
  -- ^
  --
  --           [@numevents@]: the number of events to be allocated.
  -> IO BG.Word32
registerEventsSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_RegisterEvents (Coerce.coerce x00))

-- | Get window associated with an event.
--
--     [Returns]: the associated window on success or NULL if there is none.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'pollEvent', 'waitEvent', 'waitEventTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowFromEvent@.
--                   The safe flavor is 'getWindowFromEventSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowFromEvent@, defined at @SDL3\/SDL_events.h 1605:42@
getWindowFromEvent
  :: PtrConst.PtrConst SDL_Event
  -- ^
  --
  --           [@event@]: an event containing a @windowID@.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
getWindowFromEvent = Unsafe.sDL_GetWindowFromEvent

-- | Get window associated with an event.
--
--     [Returns]: the associated window on success or NULL if there is none.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'pollEvent', 'waitEvent', 'waitEventTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowFromEvent@.
--                   The unsafe flavor is 'getWindowFromEvent'
--                   .
--
--     [C declaration]: @SDL_GetWindowFromEvent@, defined at @SDL3\/SDL_events.h 1605:42@
getWindowFromEventSafe
  :: PtrConst.PtrConst SDL_Event
  -- ^
  --
  --           [@event@]: an event containing a @windowID@.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
getWindowFromEventSafe = Safe.sDL_GetWindowFromEvent

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetEventDescription@.
--                   The safe flavor is 'getEventDescriptionSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetEventDescription@, defined at @SDL3\/SDL_events.h 1637:33@
getEventDescription
  :: PtrConst.PtrConst SDL_Event
  -- ^
  --
  --           [@event@]: an event to describe. May be NULL.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@buf@]: the buffer to fill with the description string. May be NULL.
  -> BG.Int32
  -- ^
  --
  --           [@buflen@]: the maximum bytes that can be written to @buf@.
  -> IO BG.Int32
getEventDescription =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_GetEventDescription x00 x11 (Coerce.coerce x22))

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetEventDescription@.
--                   The unsafe flavor is 'getEventDescription'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetEventDescription@, defined at @SDL3\/SDL_events.h 1637:33@
getEventDescriptionSafe
  :: PtrConst.PtrConst SDL_Event
  -- ^
  --
  --           [@event@]: an event to describe. May be NULL.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@buf@]: the buffer to fill with the description string. May be NULL.
  -> BG.Int32
  -- ^
  --
  --           [@buflen@]: the maximum bytes that can be written to @buf@.
  -> IO BG.Int32
getEventDescriptionSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_GetEventDescription x00 x11 (Coerce.coerce x22))

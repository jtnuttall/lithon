-- | Custom stream protocols via user callbacks.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @Mpv.Sys.Bindgen.StreamCb.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "Mpv.Sys".
module Mpv.Sys.StreamCb (
  module Mpv.Sys.Bindgen.StreamCb,

  -- * Function aliases
  Mpv.Sys.StreamCb.streamCbAddRo,
  Mpv.Sys.StreamCb.streamCbAddRoSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import Mpv.Sys.Bindgen.Client qualified
import Mpv.Sys.Bindgen.StreamCb
import Mpv.Sys.Bindgen.StreamCb.Safe qualified as Safe
import Mpv.Sys.Bindgen.StreamCb.Unsafe qualified as Unsafe

-- | Add a custom stream protocol. This will register a protocol handler under the given protocol prefix, and invoke the given callbacks if an URI with the matching protocol prefix is opened.
--
--     The \"ro\" is for read-only - only read-only streams can be registered with this function.
--
--     The callback remains registered until the mpv core is registered.
--
--     If a custom stream with the same name is already registered, then the MPV_ERROR_INVALID_PARAMETER error is returned.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_stream_cb_add_ro@.
--                   The safe flavor is 'streamCbAddRoSafe'
--                   : registration; open_fn and the stream callbacks it installs fire later on mpv\'s threads; takes the client-list lock, like mpv_create_client.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_stream_cb_add_ro@, defined at @mpv\/stream_cb.h 233:16@
streamCbAddRo
  :: BG.Ptr Mpv.Sys.Bindgen.Client.Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@protocol@]: protocol prefix, for example \"foo\" for \"foo:\/\/\" URIs
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@user_data@]: opaque pointer passed into the mpv_stream_cb_open_fn callback.
  -> Mpv_stream_cb_open_ro_fn
  -- ^ [C declaration]: @open_fn@
  -> IO BG.Int32
streamCbAddRo =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Unsafe.mpv_stream_cb_add_ro x00 x11 x22 x33)

-- | Add a custom stream protocol. This will register a protocol handler under the given protocol prefix, and invoke the given callbacks if an URI with the matching protocol prefix is opened.
--
--     The \"ro\" is for read-only - only read-only streams can be registered with this function.
--
--     The callback remains registered until the mpv core is registered.
--
--     If a custom stream with the same name is already registered, then the MPV_ERROR_INVALID_PARAMETER error is returned.
--
--     [Returns]: error code
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_stream_cb_add_ro@.
--                   The unsafe flavor is 'streamCbAddRo'
--                   : registration; open_fn and the stream callbacks it installs fire later on mpv\'s threads; takes the client-list lock, like mpv_create_client.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_stream_cb_add_ro@, defined at @mpv\/stream_cb.h 233:16@
streamCbAddRoSafe
  :: BG.Ptr Mpv.Sys.Bindgen.Client.Mpv_handle
  -- ^ [C declaration]: @ctx@
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@protocol@]: protocol prefix, for example \"foo\" for \"foo:\/\/\" URIs
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@user_data@]: opaque pointer passed into the mpv_stream_cb_open_fn callback.
  -> Mpv_stream_cb_open_ro_fn
  -- ^ [C declaration]: @open_fn@
  -> IO BG.Int32
streamCbAddRoSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Safe.mpv_stream_cb_add_ro x00 x11 x22 x33)

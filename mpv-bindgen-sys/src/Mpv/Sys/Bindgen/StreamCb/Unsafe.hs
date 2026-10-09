{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module Mpv.Sys.Bindgen.StreamCb.Unsafe (
  Mpv.Sys.Bindgen.StreamCb.Unsafe.mpv_stream_cb_add_ro,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import Mpv.Sys.Bindgen.Client qualified
import Mpv.Sys.Bindgen.StreamCb

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <mpv/stream_cb.h>"
         , "signed int hs_bindgen_e269f44daece4f0b ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2,"
         , "  void *arg3,"
         , "  mpv_stream_cb_open_ro_fn arg4"
         , ")"
         , "{"
         , "  return (mpv_stream_cb_add_ro)(arg1, arg2, arg3, arg4);"
         , "}"
         ]
     )
 )

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.StreamCb_Unsafe_mpv_stream_cb_add_ro@
foreign import ccall unsafe "hs_bindgen_e269f44daece4f0b"
  hs_bindgen_e269f44daece4f0b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> IO BG.CInt

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.StreamCb_Unsafe_mpv_stream_cb_add_ro@
hs_bindgen_e269f44daece4f0b
  :: BG.Ptr Mpv.Sys.Bindgen.Client.Mpv_handle
  -> PtrConst.PtrConst BG.CChar
  -> BG.Ptr BG.Void
  -> Mpv_stream_cb_open_ro_fn
  -> IO BG.CInt
hs_bindgen_e269f44daece4f0b =
  \x0 ->
    \x1 ->
      \x2 ->
        \x3 ->
          fmap
            BG.fromFFIType
            ( hs_bindgen_e269f44daece4f0b_base
                (BG.toFFIType x0)
                (BG.toFFIType x1)
                (BG.toFFIType x2)
                (BG.toFFIType x3)
            )

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
--     [C declaration]: @mpv_stream_cb_add_ro@, defined at @mpv\/stream_cb.h 233:16@
mpv_stream_cb_add_ro
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
  -> IO BG.CInt
mpv_stream_cb_add_ro = hs_bindgen_e269f44daece4f0b

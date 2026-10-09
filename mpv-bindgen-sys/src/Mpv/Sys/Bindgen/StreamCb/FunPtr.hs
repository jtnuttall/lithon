{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module Mpv.Sys.Bindgen.StreamCb.FunPtr (
  Mpv.Sys.Bindgen.StreamCb.FunPtr.mpv_stream_cb_add_ro,
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
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.StreamCb_get_mpv_stream_cb_add_ro */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_8ac773ddcf93ffba (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2,"
         , "  void *arg3,"
         , "  mpv_stream_cb_open_ro_fn arg4"
         , ")"
         , "{"
         , "  return &mpv_stream_cb_add_ro;"
         , "}"
         ]
     )
 )

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.StreamCb_get_mpv_stream_cb_add_ro@
foreign import ccall unsafe "hs_bindgen_8ac773ddcf93ffba"
  hs_bindgen_8ac773ddcf93ffba_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.StreamCb_get_mpv_stream_cb_add_ro@
hs_bindgen_8ac773ddcf93ffba
  :: IO
       ( BG.FunPtr
           ( BG.Ptr Mpv.Sys.Bindgen.Client.Mpv_handle
             -> PtrConst.PtrConst BG.CChar
             -> BG.Ptr BG.Void
             -> Mpv_stream_cb_open_ro_fn
             -> IO BG.CInt
           )
       )
hs_bindgen_8ac773ddcf93ffba =
  fmap BG.fromFFIType hs_bindgen_8ac773ddcf93ffba_base

{-# NOINLINE mpv_stream_cb_add_ro #-}

-- | Add a custom stream protocol. This will register a protocol handler under the given protocol prefix, and invoke the given callbacks if an URI with the matching protocol prefix is opened.
--
--     The \"ro\" is for read-only - only read-only streams can be registered with this function.
--
--     The callback remains registered until the mpv core is registered.
--
--     If a custom stream with the same name is already registered, then the MPV_ERROR_INVALID_PARAMETER error is returned.
--
--     [@protocol@]: protocol prefix, for example \"foo\" for \"foo:\/\/\" URIs
--
--     [@user_data@]: opaque pointer passed into the mpv_stream_cb_open_fn callback.
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_stream_cb_add_ro@, defined at @mpv\/stream_cb.h 233:16@
mpv_stream_cb_add_ro
  :: BG.FunPtr
       ( BG.Ptr Mpv.Sys.Bindgen.Client.Mpv_handle
         -> PtrConst.PtrConst BG.CChar
         -> BG.Ptr BG.Void
         -> Mpv_stream_cb_open_ro_fn
         -> IO BG.CInt
       )
mpv_stream_cb_add_ro =
  BG.unsafePerformIO hs_bindgen_8ac773ddcf93ffba

{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module Mpv.Sys.Bindgen.Client.FunPtr (
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_error_string,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_free,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_client_name,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_client_id,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_create,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_initialize,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_destroy,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_terminate_destroy,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_create_client,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_create_weak_client,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_load_config_file,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_get_time_ns,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_get_time_us,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_free_node_contents,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_set_option,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_set_option_string,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_command,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_command_node,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_command_ret,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_command_string,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_command_async,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_command_node_async,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_abort_async_command,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_set_property,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_set_property_string,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_del_property,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_set_property_async,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_get_property,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_get_property_string,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_get_property_osd_string,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_get_property_async,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_observe_property,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_unobserve_property,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_event_name,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_event_to_node,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_request_event,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_request_log_messages,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_wait_event,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_wakeup,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_set_wakeup_callback,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_wait_async_requests,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_hook_add,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_hook_continue,
  Mpv.Sys.Bindgen.Client.FunPtr.mpv_get_wakeup_pipe,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import Mpv.Sys.Bindgen.Client

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <mpv/client.h>"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_error_string */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_e4db6cf8b03b668c (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &mpv_error_string;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_free */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_c287f22cc152de5b (void)) ("
         , "  void *arg1"
         , ")"
         , "{"
         , "  return &mpv_free;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_client_name */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_6c747f31b6ccceea (void)) ("
         , "  mpv_handle *arg1"
         , ")"
         , "{"
         , "  return &mpv_client_name;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_client_id */"
         , "__attribute__ ((const))"
         , "int64_t (*hs_bindgen_6cbde23774546dd4 (void)) ("
         , "  mpv_handle *arg1"
         , ")"
         , "{"
         , "  return &mpv_client_id;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_create */"
         , "__attribute__ ((const))"
         , "mpv_handle *(*hs_bindgen_d1da8aba12aedf29 (void)) (void)"
         , "{"
         , "  return &mpv_create;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_initialize */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_3d3c99088133ce2d (void)) ("
         , "  mpv_handle *arg1"
         , ")"
         , "{"
         , "  return &mpv_initialize;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_destroy */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_afbd8c099116ca9a (void)) ("
         , "  mpv_handle *arg1"
         , ")"
         , "{"
         , "  return &mpv_destroy;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_terminate_destroy */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_f9b6bb3e638f3201 (void)) ("
         , "  mpv_handle *arg1"
         , ")"
         , "{"
         , "  return &mpv_terminate_destroy;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_create_client */"
         , "__attribute__ ((const))"
         , "mpv_handle *(*hs_bindgen_593f2845bb5c47f1 (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &mpv_create_client;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_create_weak_client */"
         , "__attribute__ ((const))"
         , "mpv_handle *(*hs_bindgen_5ff7205dc19a4792 (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &mpv_create_weak_client;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_load_config_file */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_c94ae9a2e2c3d7ff (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &mpv_load_config_file;"
         , "}"
         , "#include <mpv/client.h>"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_time_ns */"
         , "__attribute__ ((const))"
         , "int64_t (*hs_bindgen_651221056d2e619a (void)) ("
         , "  mpv_handle *arg1"
         , ")"
         , "{"
         , "#if MPV_CLIENT_API_VERSION >= MPV_MAKE_VERSION(2, 2)"
         , "  return &mpv_get_time_ns;"
         , "#else"
         , "  return 0;"
         , "#endif"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_time_us */"
         , "__attribute__ ((const))"
         , "int64_t (*hs_bindgen_023ca386e91d99fb (void)) ("
         , "  mpv_handle *arg1"
         , ")"
         , "{"
         , "  return &mpv_get_time_us;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_free_node_contents */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_b002aa5add927b4c (void)) ("
         , "  mpv_node *arg1"
         , ")"
         , "{"
         , "  return &mpv_free_node_contents;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_option */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_c1fd2384d1c980dc (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2,"
         , "  mpv_format arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  return &mpv_set_option;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_option_string */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_73c92079dbf4d0ca (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return &mpv_set_option_string;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_e3ec6b54ccf6ab32 (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const **arg2"
         , ")"
         , "{"
         , "  return &mpv_command;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_node */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_5aaa232e69143889 (void)) ("
         , "  mpv_handle *arg1,"
         , "  mpv_node *arg2,"
         , "  mpv_node *arg3"
         , ")"
         , "{"
         , "  return &mpv_command_node;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_ret */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_0deb52786a23a532 (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const **arg2,"
         , "  mpv_node *arg3"
         , ")"
         , "{"
         , "  return &mpv_command_ret;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_string */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_f856b885c8ea171c (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &mpv_command_string;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_async */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_887ffa76a5de94eb (void)) ("
         , "  mpv_handle *arg1,"
         , "  uint64_t arg2,"
         , "  char const **arg3"
         , ")"
         , "{"
         , "  return &mpv_command_async;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_node_async */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_dc9afc85267e5695 (void)) ("
         , "  mpv_handle *arg1,"
         , "  uint64_t arg2,"
         , "  mpv_node *arg3"
         , ")"
         , "{"
         , "  return &mpv_command_node_async;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_abort_async_command */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_34e4edd15d21c3fc (void)) ("
         , "  mpv_handle *arg1,"
         , "  uint64_t arg2"
         , ")"
         , "{"
         , "  return &mpv_abort_async_command;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_property */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_9d182040b443f98d (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2,"
         , "  mpv_format arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  return &mpv_set_property;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_property_string */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_bba8776a54a154c9 (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return &mpv_set_property_string;"
         , "}"
         , "#include <mpv/client.h>"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_del_property */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_a5b312e8252b72cf (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "#if MPV_CLIENT_API_VERSION >= MPV_MAKE_VERSION(2, 1)"
         , "  return &mpv_del_property;"
         , "#else"
         , "  return 0;"
         , "#endif"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_property_async */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_d5c9b75bd8d4a749 (void)) ("
         , "  mpv_handle *arg1,"
         , "  uint64_t arg2,"
         , "  char const *arg3,"
         , "  mpv_format arg4,"
         , "  void *arg5"
         , ")"
         , "{"
         , "  return &mpv_set_property_async;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_property */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_89dce700857d062e (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2,"
         , "  mpv_format arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  return &mpv_get_property;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_property_string */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_1d23dd8b31bd1f63 (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &mpv_get_property_string;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_property_osd_string */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_a3dedf4c1e485ba9 (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &mpv_get_property_osd_string;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_property_async */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_4eec801becaf8e6e (void)) ("
         , "  mpv_handle *arg1,"
         , "  uint64_t arg2,"
         , "  char const *arg3,"
         , "  mpv_format arg4"
         , ")"
         , "{"
         , "  return &mpv_get_property_async;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_observe_property */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_bf4537aeaa969151 (void)) ("
         , "  mpv_handle *arg1,"
         , "  uint64_t arg2,"
         , "  char const *arg3,"
         , "  mpv_format arg4"
         , ")"
         , "{"
         , "  return &mpv_observe_property;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_unobserve_property */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_7096d655a7275acc (void)) ("
         , "  mpv_handle *arg1,"
         , "  uint64_t arg2"
         , ")"
         , "{"
         , "  return &mpv_unobserve_property;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_event_name */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_1857a83a197aea05 (void)) ("
         , "  mpv_event_id arg1"
         , ")"
         , "{"
         , "  return &mpv_event_name;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_event_to_node */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_233d1d141f540094 (void)) ("
         , "  mpv_node *arg1,"
         , "  mpv_event *arg2"
         , ")"
         , "{"
         , "  return &mpv_event_to_node;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_request_event */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_9f65f136209adff9 (void)) ("
         , "  mpv_handle *arg1,"
         , "  mpv_event_id arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &mpv_request_event;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_request_log_messages */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_57cfe9d93ce070ca (void)) ("
         , "  mpv_handle *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &mpv_request_log_messages;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_wait_event */"
         , "__attribute__ ((const))"
         , "mpv_event *(*hs_bindgen_99eab11e9895f600 (void)) ("
         , "  mpv_handle *arg1,"
         , "  double arg2"
         , ")"
         , "{"
         , "  return &mpv_wait_event;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_wakeup */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_fae19300cc8a2bd1 (void)) ("
         , "  mpv_handle *arg1"
         , ")"
         , "{"
         , "  return &mpv_wakeup;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_wakeup_callback */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_46224d63a95386bd (void)) ("
         , "  mpv_handle *arg1,"
         , "  void (*arg2) ("
         , "  void *arg1"
         , "),"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &mpv_set_wakeup_callback;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_wait_async_requests */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_7d38686a69d22551 (void)) ("
         , "  mpv_handle *arg1"
         , ")"
         , "{"
         , "  return &mpv_wait_async_requests;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_hook_add */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_c604fcdadcfcee34 (void)) ("
         , "  mpv_handle *arg1,"
         , "  uint64_t arg2,"
         , "  char const *arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "  return &mpv_hook_add;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_hook_continue */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_15f8b4010dc2f31f (void)) ("
         , "  mpv_handle *arg1,"
         , "  uint64_t arg2"
         , ")"
         , "{"
         , "  return &mpv_hook_continue;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_wakeup_pipe */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_9a8885ffe905d9ee (void)) ("
         , "  mpv_handle *arg1"
         , ")"
         , "{"
         , "  return &mpv_get_wakeup_pipe;"
         , "}"
         ]
     )
 )

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_error_string@
foreign import ccall unsafe "hs_bindgen_e4db6cf8b03b668c"
  hs_bindgen_e4db6cf8b03b668c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_error_string@
hs_bindgen_e4db6cf8b03b668c :: IO (BG.FunPtr (BG.CInt -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_e4db6cf8b03b668c =
  fmap BG.fromFFIType hs_bindgen_e4db6cf8b03b668c_base

{-# NOINLINE mpv_error_string #-}

-- | Return a string describing the error. For unknown errors, the string \"unknown error\" is returned.
--
--     [@error@]: error number, see enum 'Mpv_error'
--
--     [Returns]: A static string describing the error. The string is completely static, i.e. doesn\'t need to be deallocated, and is valid forever.
--
--     [C declaration]: @mpv_error_string@, defined at @mpv\/client.h 390:24@
mpv_error_string :: BG.FunPtr (BG.CInt -> IO (PtrConst.PtrConst BG.CChar))
mpv_error_string =
  BG.unsafePerformIO hs_bindgen_e4db6cf8b03b668c

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_free@
foreign import ccall unsafe "hs_bindgen_c287f22cc152de5b"
  hs_bindgen_c287f22cc152de5b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_free@
hs_bindgen_c287f22cc152de5b :: IO (BG.FunPtr (BG.Ptr BG.Void -> IO ()))
hs_bindgen_c287f22cc152de5b =
  fmap BG.fromFFIType hs_bindgen_c287f22cc152de5b_base

{-# NOINLINE mpv_free #-}

-- | General function to deallocate memory returned by some of the API functions. Call this only if it\'s explicitly documented as allowed. Calling this on mpv memory not owned by the caller will lead to undefined behavior.
--
--     [@data@]: A valid pointer returned by the API, or NULL.
--
--     [C declaration]: @mpv_free@, defined at @mpv\/client.h 399:17@
mpv_free :: BG.FunPtr (BG.Ptr BG.Void -> IO ())
mpv_free =
  BG.unsafePerformIO hs_bindgen_c287f22cc152de5b

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_client_name@
foreign import ccall unsafe "hs_bindgen_6c747f31b6ccceea"
  hs_bindgen_6c747f31b6ccceea_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_client_name@
hs_bindgen_6c747f31b6ccceea :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_6c747f31b6ccceea =
  fmap BG.fromFFIType hs_bindgen_6c747f31b6ccceea_base

{-# NOINLINE mpv_client_name #-}

-- | Return the name of this client handle. Every client has its own unique name, which is mostly used for user interface purposes.
--
--     [Returns]: The client name. The string is read-only and is valid until the 'Mpv_handle' is destroyed.
--
--     [C declaration]: @mpv_client_name@, defined at @mpv\/client.h 408:24@
mpv_client_name :: BG.FunPtr (BG.Ptr Mpv_handle -> IO (PtrConst.PtrConst BG.CChar))
mpv_client_name =
  BG.unsafePerformIO hs_bindgen_6c747f31b6ccceea

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_client_id@
foreign import ccall unsafe "hs_bindgen_6cbde23774546dd4"
  hs_bindgen_6cbde23774546dd4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_client_id@
hs_bindgen_6cbde23774546dd4 :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> IO HsBindgen.Runtime.LibC.Int64))
hs_bindgen_6cbde23774546dd4 =
  fmap BG.fromFFIType hs_bindgen_6cbde23774546dd4_base

{-# NOINLINE mpv_client_id #-}

-- | Return the ID of this client handle. Every client has its own unique ID. This ID is never reused by the core, even if the 'Mpv_handle' at hand gets destroyed and new handles get allocated.
--
--     IDs are never 0 or negative.
--
--     Some mpv APIs (not necessarily all) accept a name in the form \"\@\<id>\" in addition of the proper @mpv_client_name()@, where \"\<id>\" is the ID in decimal form (e.g. \"\@123\"). For example, the \"script-message-to\" command takes the client name as first argument, but also accepts the client ID formatted in this manner.
--
--     [Returns]: The client ID.
--
--     [C declaration]: @mpv_client_id@, defined at @mpv\/client.h 425:20@
mpv_client_id :: BG.FunPtr (BG.Ptr Mpv_handle -> IO HsBindgen.Runtime.LibC.Int64)
mpv_client_id =
  BG.unsafePerformIO hs_bindgen_6cbde23774546dd4

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_create@
foreign import ccall unsafe "hs_bindgen_d1da8aba12aedf29"
  hs_bindgen_d1da8aba12aedf29_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_create@
hs_bindgen_d1da8aba12aedf29 :: IO (BG.FunPtr (IO (BG.Ptr Mpv_handle)))
hs_bindgen_d1da8aba12aedf29 =
  fmap BG.fromFFIType hs_bindgen_d1da8aba12aedf29_base

{-# NOINLINE mpv_create #-}

-- | Create a new mpv instance and an associated client API handle to control the mpv instance. This instance is in a pre-initialized state, and needs to be initialized to be actually used with most other API functions.
--
--     Some API functions will return MPV_ERROR_UNINITIALIZED in the uninitialized state. You can call @mpv_set_property()@ (or @mpv_set_property_string()@ and other variants, and before mpv 0.21.0 @mpv_set_option()@ etc.) to set initial options. After this, call @mpv_initialize()@ to start the player, and then use e.g. @mpv_command()@ to start playback of a file.
--
--     The point of separating handle creation and actual initialization is that you can configure things which can\'t be changed during runtime.
--
--     Unlike the command line player, this will have initial settings suitable for embedding in applications. The following settings are different:
--
--     * stdin\/stdout\/stderr and the terminal will never be accessed. This is equivalent to setting the no-terminal option. (Technically, this also suppresses C signal handling.)
--
--     * No config files will be loaded. This is roughly equivalent to using config=no. Since libmpv 1.15, you can actually re-enable this option, which will make libmpv load config files during @mpv_initialize()@. If you do this, you are strongly encouraged to set the \"config-dir\" option too. (Otherwise it will load the mpv command line player\'s config.) For example: mpv_set_option_string(mpv, \"config-dir\", \"\/my\/path\"); \/\/ set config root mpv_set_option_string(mpv, \"config\", \"yes\"); \/\/ enable config loading (call @mpv_initialize()@ /after/ this)
--
--     * Idle mode is enabled, which means the playback core will enter idle mode if there are no more files to play on the internal playlist, instead of exiting. This is equivalent to the idle option.
--
--     * Disable parts of input handling.
--
--     * Most of the different settings can be viewed with the command line player by running \"mpv --show-profile=libmpv\".
--
--     All this assumes that API users want a mpv instance that is strictly isolated from the command line player\'s configuration, user settings, and so on. You can re-enable disabled features by setting the appropriate options.
--
--     The mpv command line parser is not available through this API, but you can set individual options with @mpv_set_property()@. Files for playback must be loaded with @mpv_command()@ or others.
--
--     Note that you should avoid doing concurrent accesses on the uninitialized client handle. (Whether concurrent access is definitely allowed or not has yet to be decided.)
--
--     [Returns]: a new mpv client API handle. Returns NULL on error. Currently, this can happen in the following situations:
--                * out of memory
--                * LC_NUMERIC is not set to \"C\" (see general remarks)
--
--     [C declaration]: @mpv_create@, defined at @mpv\/client.h 481:24@
mpv_create :: BG.FunPtr (IO (BG.Ptr Mpv_handle))
mpv_create =
  BG.unsafePerformIO hs_bindgen_d1da8aba12aedf29

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_initialize@
foreign import ccall unsafe "hs_bindgen_3d3c99088133ce2d"
  hs_bindgen_3d3c99088133ce2d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_initialize@
hs_bindgen_3d3c99088133ce2d :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> IO BG.CInt))
hs_bindgen_3d3c99088133ce2d =
  fmap BG.fromFFIType hs_bindgen_3d3c99088133ce2d_base

{-# NOINLINE mpv_initialize #-}

-- | Initialize an uninitialized mpv instance. If the mpv instance is already running, an error is returned.
--
--     This function needs to be called to make full use of the client API if the client API handle was created with @mpv_create()@.
--
--     Only the following options are required to be set /before/ @mpv_initialize()@:
--
--     * options which are only read at initialization time:
--       * config
--       * config-dir
--       * input-conf
--       * load-scripts
--       * script
--       * player-operation-mode
--       * input-app-events (macOS)
--
--     * all encoding mode options
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_initialize@, defined at @mpv\/client.h 503:16@
mpv_initialize :: BG.FunPtr (BG.Ptr Mpv_handle -> IO BG.CInt)
mpv_initialize =
  BG.unsafePerformIO hs_bindgen_3d3c99088133ce2d

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_destroy@
foreign import ccall unsafe "hs_bindgen_afbd8c099116ca9a"
  hs_bindgen_afbd8c099116ca9a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_destroy@
hs_bindgen_afbd8c099116ca9a :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> IO ()))
hs_bindgen_afbd8c099116ca9a =
  fmap BG.fromFFIType hs_bindgen_afbd8c099116ca9a_base

{-# NOINLINE mpv_destroy #-}

-- | Disconnect and destroy the 'Mpv_handle'. ctx will be deallocated with this API call.
--
--     If the last 'Mpv_handle' is detached, the core player is destroyed. In addition, if there are only weak mpv_handles (such as created by @mpv_create_weak_client()@ or internal scripts), these mpv_handles will be sent MPV_EVENT_SHUTDOWN. This function may block until these clients have responded to the shutdown event, and the core is finally destroyed.
--
--     [C declaration]: @mpv_destroy@, defined at @mpv\/client.h 515:17@
mpv_destroy :: BG.FunPtr (BG.Ptr Mpv_handle -> IO ())
mpv_destroy =
  BG.unsafePerformIO hs_bindgen_afbd8c099116ca9a

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_terminate_destroy@
foreign import ccall unsafe "hs_bindgen_f9b6bb3e638f3201"
  hs_bindgen_f9b6bb3e638f3201_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_terminate_destroy@
hs_bindgen_f9b6bb3e638f3201 :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> IO ()))
hs_bindgen_f9b6bb3e638f3201 =
  fmap BG.fromFFIType hs_bindgen_f9b6bb3e638f3201_base

{-# NOINLINE mpv_terminate_destroy #-}

-- | Similar to @mpv_destroy()@, but brings the player and all clients down as well, and waits until all of them are destroyed. This function blocks. The advantage over @mpv_destroy()@ is that while @mpv_destroy()@ merely detaches the client handle from the player, this function quits the player, waits until all other clients are destroyed (i.e. all mpv_handles are detached), and also waits for the final termination of the player.
--
--     Since @mpv_destroy()@ is called somewhere on the way, it\'s not safe to call other functions concurrently on the same context.
--
--     Since mpv client API version 1.29: The first call on any 'Mpv_handle' will block until the core is destroyed. This means it will wait until other 'Mpv_handle' have been destroyed. If you want asynchronous destruction, just run the \"quit\" command, and then react to the MPV_EVENT_SHUTDOWN event. If another 'Mpv_handle' already called @mpv_terminate_destroy()@, this call will not actually block. It will destroy the 'Mpv_handle', and exit immediately, while other mpv_handles might still be uninitializing.
--
--     Before mpv client API version 1.29: If this is called on a 'Mpv_handle' that was not created with @mpv_create()@, this function will merely send a quit command and then call @mpv_destroy()@, without waiting for the actual shutdown.
--
--     [C declaration]: @mpv_terminate_destroy@, defined at @mpv\/client.h 542:17@
mpv_terminate_destroy :: BG.FunPtr (BG.Ptr Mpv_handle -> IO ())
mpv_terminate_destroy =
  BG.unsafePerformIO hs_bindgen_f9b6bb3e638f3201

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_create_client@
foreign import ccall unsafe "hs_bindgen_593f2845bb5c47f1"
  hs_bindgen_593f2845bb5c47f1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_create_client@
hs_bindgen_593f2845bb5c47f1
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr Mpv_handle)))
hs_bindgen_593f2845bb5c47f1 =
  fmap BG.fromFFIType hs_bindgen_593f2845bb5c47f1_base

{-# NOINLINE mpv_create_client #-}

-- | Create a new client handle connected to the same player core as ctx. This context has its own event queue, its own @mpv_request_event()@ state, its own @mpv_request_log_messages()@ state, its own set of observed properties, and its own state for asynchronous operations. Otherwise, everything is shared.
--
--     This handle should be destroyed with @mpv_destroy()@ if no longer needed. The core will live as long as there is at least 1 handle referencing it. Any handle can make the core quit, which will result in every handle receiving MPV_EVENT_SHUTDOWN.
--
--     This function can not be called before the main handle was initialized with @mpv_initialize()@. The new handle is always initialized, unless ctx=NULL was passed.
--
--     [@ctx@]: Used to get the reference to the mpv core; handle-specific settings and parameters are not used. If NULL, this function behaves like @mpv_create()@ (ignores name).
--
--     [@name@]: The client name. This will be returned by @mpv_client_name()@. If the name is already in use, or contains non-alphanumeric characters (other than \'_\'), the name is modified to fit. If NULL, an arbitrary name is automatically chosen.
--
--     [Returns]: a new handle, or NULL on error
--
--     [C declaration]: @mpv_create_client@, defined at @mpv\/client.h 568:24@
mpv_create_client
  :: BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr Mpv_handle))
mpv_create_client =
  BG.unsafePerformIO hs_bindgen_593f2845bb5c47f1

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_create_weak_client@
foreign import ccall unsafe "hs_bindgen_5ff7205dc19a4792"
  hs_bindgen_5ff7205dc19a4792_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_create_weak_client@
hs_bindgen_5ff7205dc19a4792
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr Mpv_handle)))
hs_bindgen_5ff7205dc19a4792 =
  fmap BG.fromFFIType hs_bindgen_5ff7205dc19a4792_base

{-# NOINLINE mpv_create_weak_client #-}

-- | This is the same as @mpv_create_client()@, but the created 'Mpv_handle' is treated as a weak reference. If all mpv_handles referencing a core are weak references, the core is automatically destroyed. (This still goes through normal uninit of course. Effectively, if the last non-weak 'Mpv_handle' is destroyed, then the weak mpv_handles receive MPV_EVENT_SHUTDOWN and are asked to terminate as well.)
--
--     Note if you want to use this like refcounting: you have to be aware that @mpv_terminate_destroy()@ /and/ @mpv_destroy()@ for the last non-weak 'Mpv_handle' will block until all weak mpv_handles are destroyed.
--
--     [C declaration]: @mpv_create_weak_client@, defined at @mpv\/client.h 582:24@
mpv_create_weak_client
  :: BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr Mpv_handle))
mpv_create_weak_client =
  BG.unsafePerformIO hs_bindgen_5ff7205dc19a4792

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_load_config_file@
foreign import ccall unsafe "hs_bindgen_c94ae9a2e2c3d7ff"
  hs_bindgen_c94ae9a2e2c3d7ff_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_load_config_file@
hs_bindgen_c94ae9a2e2c3d7ff
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO BG.CInt))
hs_bindgen_c94ae9a2e2c3d7ff =
  fmap BG.fromFFIType hs_bindgen_c94ae9a2e2c3d7ff_base

{-# NOINLINE mpv_load_config_file #-}

-- | Load a config file. This loads and parses the file, and sets every entry in the config file\'s default section as if @mpv_set_option_string()@ is called.
--
--     The filename should be an absolute path. If it isn\'t, the actual path used is unspecified. (Note: an absolute path starts with \'\/\' on UNIX.) If the file wasn\'t found, MPV_ERROR_INVALID_PARAMETER is returned.
--
--     If a fatal error happens when parsing a config file, MPV_ERROR_OPTION_ERROR is returned. Errors when setting options as well as other types or errors are ignored (even if options do not exist). You can still try to capture the resulting error messages with @mpv_request_log_messages()@. Note that it\'s possible that some options were successfully set even if any of these errors happen.
--
--     [@filename@]: absolute path to the config file on the local filesystem
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_load_config_file@, defined at @mpv\/client.h 602:16@
mpv_load_config_file :: BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO BG.CInt)
mpv_load_config_file =
  BG.unsafePerformIO hs_bindgen_c94ae9a2e2c3d7ff

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_time_ns@
foreign import ccall unsafe "hs_bindgen_651221056d2e619a"
  hs_bindgen_651221056d2e619a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_time_ns@
hs_bindgen_651221056d2e619a :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> IO HsBindgen.Runtime.LibC.Int64))
hs_bindgen_651221056d2e619a =
  fmap BG.fromFFIType hs_bindgen_651221056d2e619a_base

{-# NOINLINE mpv_get_time_ns #-}

-- | Return the internal time in nanoseconds. This has an arbitrary start offset, but will never wrap or go backwards.
--
--     Note that this is always the real time, and doesn\'t necessarily have to do with playback time. For example, playback could go faster or slower due to playback speed, or due to playback being paused. Use the \"time-pos\" property instead to get the playback status.
--
--     Unlike other libmpv APIs, this can be called at absolutely any time (even within wakeup callbacks), as long as the context is valid.
--
--     Safe to be called from mpv render API threads.
--
--     [C declaration]: @mpv_get_time_ns@, defined at @mpv\/client.h 618:20@
mpv_get_time_ns :: BG.FunPtr (BG.Ptr Mpv_handle -> IO HsBindgen.Runtime.LibC.Int64)
mpv_get_time_ns =
  BG.unsafePerformIO hs_bindgen_651221056d2e619a

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_time_us@
foreign import ccall unsafe "hs_bindgen_023ca386e91d99fb"
  hs_bindgen_023ca386e91d99fb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_time_us@
hs_bindgen_023ca386e91d99fb :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> IO HsBindgen.Runtime.LibC.Int64))
hs_bindgen_023ca386e91d99fb =
  fmap BG.fromFFIType hs_bindgen_023ca386e91d99fb_base

{-# NOINLINE mpv_get_time_us #-}

-- | Same as mpv_get_time_ns but in microseconds.
--
--     [C declaration]: @mpv_get_time_us@, defined at @mpv\/client.h 623:20@
mpv_get_time_us :: BG.FunPtr (BG.Ptr Mpv_handle -> IO HsBindgen.Runtime.LibC.Int64)
mpv_get_time_us =
  BG.unsafePerformIO hs_bindgen_023ca386e91d99fb

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_free_node_contents@
foreign import ccall unsafe "hs_bindgen_b002aa5add927b4c"
  hs_bindgen_b002aa5add927b4c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_free_node_contents@
hs_bindgen_b002aa5add927b4c :: IO (BG.FunPtr (BG.Ptr Mpv_node -> IO ()))
hs_bindgen_b002aa5add927b4c =
  fmap BG.fromFFIType hs_bindgen_b002aa5add927b4c_base

{-# NOINLINE mpv_free_node_contents #-}

-- | Frees any data referenced by the node. It doesn\'t free the node itself. Call this only if the mpv client API set the node. If you constructed the node yourself (manually), you have to free it yourself.
--
--     If node->format is MPV_FORMAT_NONE, this call does nothing. Likewise, if the client API sets a node with this format, this function doesn\'t need to be called. (This is just a clarification that there\'s no danger of anything strange happening in these cases.)
--
--     [C declaration]: @mpv_free_node_contents@, defined at @mpv\/client.h 857:17@
mpv_free_node_contents :: BG.FunPtr (BG.Ptr Mpv_node -> IO ())
mpv_free_node_contents =
  BG.unsafePerformIO hs_bindgen_b002aa5add927b4c

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_option@
foreign import ccall unsafe "hs_bindgen_c1fd2384d1c980dc"
  hs_bindgen_c1fd2384d1c980dc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_option@
hs_bindgen_c1fd2384d1c980dc
  :: IO
       ( BG.FunPtr
           (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> Mpv_format -> BG.Ptr BG.Void -> IO BG.CInt)
       )
hs_bindgen_c1fd2384d1c980dc =
  fmap BG.fromFFIType hs_bindgen_c1fd2384d1c980dc_base

{-# NOINLINE mpv_set_option #-}

-- | Set an option. Note that you can\'t normally set options during runtime. It works in uninitialized state (see @mpv_create()@), and in some cases in at runtime.
--
--     Using a format other than MPV_FORMAT_NODE is equivalent to constructing a 'Mpv_node' with the given format and data, and passing the 'Mpv_node' to this function.
--
--     Note: this is semi-deprecated. For most purposes, this is not needed anymore. Starting with mpv version 0.21.0 (version 1.23) most options can be set with @mpv_set_property()@ (and related functions), and even before @mpv_initialize()@. In some obscure corner cases, using this function to set options might still be required (see \"Inconsistencies between options and properties\" in the manpage). Once these are resolved, the option setting functions might be fully deprecated.
--
--     [@name@]: Option name. This is the same as on the mpv command line, but without the leading \"--\".
--
--     [@format@]: see enum 'Mpv_format'.
--
--     [@data@]: /(input)/
--               Option value (according to the format).
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_set_option@, defined at @mpv\/client.h 883:16@
mpv_set_option
  :: BG.FunPtr
       (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> Mpv_format -> BG.Ptr BG.Void -> IO BG.CInt)
mpv_set_option =
  BG.unsafePerformIO hs_bindgen_c1fd2384d1c980dc

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_option_string@
foreign import ccall unsafe "hs_bindgen_73c92079dbf4d0ca"
  hs_bindgen_73c92079dbf4d0ca_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_option_string@
hs_bindgen_73c92079dbf4d0ca
  :: IO
       ( BG.FunPtr
           (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CInt)
       )
hs_bindgen_73c92079dbf4d0ca =
  fmap BG.fromFFIType hs_bindgen_73c92079dbf4d0ca_base

{-# NOINLINE mpv_set_option_string #-}

-- | Convenience function to set an option to a string value. This is like calling @mpv_set_option()@ with MPV_FORMAT_STRING.
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_set_option_string@, defined at @mpv\/client.h 892:16@
mpv_set_option_string
  :: BG.FunPtr
       (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CInt)
mpv_set_option_string =
  BG.unsafePerformIO hs_bindgen_73c92079dbf4d0ca

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command@
foreign import ccall unsafe "hs_bindgen_e3ec6b54ccf6ab32"
  hs_bindgen_e3ec6b54ccf6ab32_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command@
hs_bindgen_e3ec6b54ccf6ab32
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> BG.Ptr (PtrConst.PtrConst BG.CChar) -> IO BG.CInt))
hs_bindgen_e3ec6b54ccf6ab32 =
  fmap BG.fromFFIType hs_bindgen_e3ec6b54ccf6ab32_base

{-# NOINLINE mpv_command #-}

-- | Send a command to the player. Commands are the same as those used in input.conf, except that this function takes parameters in a pre-split form.
--
--     The commands and their parameters are documented in input.rst.
--
--     Does not use OSD and string expansion by default (unlike @mpv_command_string()@ and input.conf).
--
--     [@args@]: /(input)/
--               NULL-terminated list of strings. Usually, the first item is the command, and the following items are arguments.
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_command@, defined at @mpv\/client.h 908:16@
mpv_command :: BG.FunPtr (BG.Ptr Mpv_handle -> BG.Ptr (PtrConst.PtrConst BG.CChar) -> IO BG.CInt)
mpv_command =
  BG.unsafePerformIO hs_bindgen_e3ec6b54ccf6ab32

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_node@
foreign import ccall unsafe "hs_bindgen_5aaa232e69143889"
  hs_bindgen_5aaa232e69143889_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_node@
hs_bindgen_5aaa232e69143889
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> BG.Ptr Mpv_node -> BG.Ptr Mpv_node -> IO BG.CInt))
hs_bindgen_5aaa232e69143889 =
  fmap BG.fromFFIType hs_bindgen_5aaa232e69143889_base

{-# NOINLINE mpv_command_node #-}

-- | Same as @mpv_command()@, but allows passing structured data in any format. In particular, calling @mpv_command()@ is exactly like calling @mpv_command_node()@ with the format set to MPV_FORMAT_NODE_ARRAY, and every arg passed in order as MPV_FORMAT_STRING.
--
--     Does not use OSD and string expansion by default.
--
--     The args argument can have one of the following formats:
--
--     MPV_FORMAT_NODE_ARRAY: Positional arguments. Each entry is an argument using an arbitrary format (the format must be compatible to the used command). Usually, the first item is the command name (as MPV_FORMAT_STRING). The order of arguments is as documented in each command description.
--
--     MPV_FORMAT_NODE_MAP: Named arguments. This requires at least an entry with the key \"name\" to be present, which must be a string, and contains the command name. The special entry \"_flags\" is optional, and if present, must be an array of strings, each being a command prefix to apply. All other entries are interpreted as arguments. They must use the argument names as documented in each command description. Some commands do not support named arguments at all, and must use MPV_FORMAT_NODE_ARRAY.
--
--     [@args@]: /(input)/
--               'Mpv_node' with format set to one of the values documented above (see there for details)
--
--     [@result@]: /(output)/
--                 Optional, pass NULL if unused. If not NULL, and if the function succeeds, this is set to command-specific return data. You must call @mpv_free_node_contents()@ to free it (again, only if the command actually succeeds). Not many commands actually use this at all.
--
--     [Returns]: error code (the result parameter is not set on error)
--
--     [C declaration]: @mpv_command_node@, defined at @mpv\/client.h 944:16@
mpv_command_node
  :: BG.FunPtr (BG.Ptr Mpv_handle -> BG.Ptr Mpv_node -> BG.Ptr Mpv_node -> IO BG.CInt)
mpv_command_node =
  BG.unsafePerformIO hs_bindgen_5aaa232e69143889

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_ret@
foreign import ccall unsafe "hs_bindgen_0deb52786a23a532"
  hs_bindgen_0deb52786a23a532_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_ret@
hs_bindgen_0deb52786a23a532
  :: IO
       ( BG.FunPtr
           (BG.Ptr Mpv_handle -> BG.Ptr (PtrConst.PtrConst BG.CChar) -> BG.Ptr Mpv_node -> IO BG.CInt)
       )
hs_bindgen_0deb52786a23a532 =
  fmap BG.fromFFIType hs_bindgen_0deb52786a23a532_base

{-# NOINLINE mpv_command_ret #-}

-- | This is essentially identical to @mpv_command()@ but it also returns a result.
--
--     Does not use OSD and string expansion by default.
--
--     [@args@]: /(input)/
--               NULL-terminated list of strings. Usually, the first item is the command, and the following items are arguments.
--
--     [@result@]: /(output)/
--                 Optional, pass NULL if unused. If not NULL, and if the function succeeds, this is set to command-specific return data. You must call @mpv_free_node_contents()@ to free it (again, only if the command actually succeeds). Not many commands actually use this at all.
--
--     [Returns]: error code (the result parameter is not set on error)
--
--     [C declaration]: @mpv_command_ret@, defined at @mpv\/client.h 960:16@
mpv_command_ret
  :: BG.FunPtr
       (BG.Ptr Mpv_handle -> BG.Ptr (PtrConst.PtrConst BG.CChar) -> BG.Ptr Mpv_node -> IO BG.CInt)
mpv_command_ret =
  BG.unsafePerformIO hs_bindgen_0deb52786a23a532

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_string@
foreign import ccall unsafe "hs_bindgen_f856b885c8ea171c"
  hs_bindgen_f856b885c8ea171c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_string@
hs_bindgen_f856b885c8ea171c
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO BG.CInt))
hs_bindgen_f856b885c8ea171c =
  fmap BG.fromFFIType hs_bindgen_f856b885c8ea171c_base

{-# NOINLINE mpv_command_string #-}

-- | Same as mpv_command, but use input.conf parsing for splitting arguments. This is slightly simpler, but also more error prone, since arguments may need quoting\/escaping.
--
--     This also has OSD and string expansion enabled by default.
--
--     [C declaration]: @mpv_command_string@, defined at @mpv\/client.h 969:16@
mpv_command_string :: BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO BG.CInt)
mpv_command_string =
  BG.unsafePerformIO hs_bindgen_f856b885c8ea171c

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_async@
foreign import ccall unsafe "hs_bindgen_887ffa76a5de94eb"
  hs_bindgen_887ffa76a5de94eb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_async@
hs_bindgen_887ffa76a5de94eb
  :: IO
       ( BG.FunPtr
           ( BG.Ptr Mpv_handle
             -> HsBindgen.Runtime.LibC.Word64
             -> BG.Ptr (PtrConst.PtrConst BG.CChar)
             -> IO BG.CInt
           )
       )
hs_bindgen_887ffa76a5de94eb =
  fmap BG.fromFFIType hs_bindgen_887ffa76a5de94eb_base

{-# NOINLINE mpv_command_async #-}

-- | Same as mpv_command, but run the command asynchronously.
--
--     Commands are executed asynchronously. You will receive a MPV_EVENT_COMMAND_REPLY event. This event will also have an error code set if running the command failed. For commands that return data, the data is put into @mpv_event_command.result@.
--
--     The only case when you do not receive an event is when the function call itself fails. This happens only if parsing the command itself (or otherwise validating it) fails, i.e. the return code of the API call is not 0 or positive.
--
--     Safe to be called from mpv render API threads.
--
--     [@reply_userdata@]: the value @mpv_event.reply_userdata@ of the reply will be set to (see section about asynchronous calls)
--
--     [@args@]: NULL-terminated list of strings (see @mpv_command()@)
--
--     [Returns]: error code (if parsing or queuing the command fails)
--
--     [C declaration]: @mpv_command_async@, defined at @mpv\/client.h 991:16@
mpv_command_async
  :: BG.FunPtr
       ( BG.Ptr Mpv_handle
         -> HsBindgen.Runtime.LibC.Word64
         -> BG.Ptr (PtrConst.PtrConst BG.CChar)
         -> IO BG.CInt
       )
mpv_command_async =
  BG.unsafePerformIO hs_bindgen_887ffa76a5de94eb

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_node_async@
foreign import ccall unsafe "hs_bindgen_dc9afc85267e5695"
  hs_bindgen_dc9afc85267e5695_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_command_node_async@
hs_bindgen_dc9afc85267e5695
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> HsBindgen.Runtime.LibC.Word64 -> BG.Ptr Mpv_node -> IO BG.CInt))
hs_bindgen_dc9afc85267e5695 =
  fmap BG.fromFFIType hs_bindgen_dc9afc85267e5695_base

{-# NOINLINE mpv_command_node_async #-}

-- | Same as @mpv_command_node()@, but run it asynchronously. Basically, this function is to @mpv_command_node()@ what @mpv_command_async()@ is to @mpv_command()@.
--
--     See @mpv_command_async()@ for details.
--
--     Safe to be called from mpv render API threads.
--
--     [@reply_userdata@]: the value @mpv_event.reply_userdata@ of the reply will be set to (see section about asynchronous calls)
--
--     [@args@]: as in @mpv_command_node()@
--
--     [Returns]: error code (if parsing or queuing the command fails)
--
--     [C declaration]: @mpv_command_node_async@, defined at @mpv\/client.h 1008:16@
mpv_command_node_async
  :: BG.FunPtr (BG.Ptr Mpv_handle -> HsBindgen.Runtime.LibC.Word64 -> BG.Ptr Mpv_node -> IO BG.CInt)
mpv_command_node_async =
  BG.unsafePerformIO hs_bindgen_dc9afc85267e5695

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_abort_async_command@
foreign import ccall unsafe "hs_bindgen_34e4edd15d21c3fc"
  hs_bindgen_34e4edd15d21c3fc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_abort_async_command@
hs_bindgen_34e4edd15d21c3fc
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> HsBindgen.Runtime.LibC.Word64 -> IO ()))
hs_bindgen_34e4edd15d21c3fc =
  fmap BG.fromFFIType hs_bindgen_34e4edd15d21c3fc_base

{-# NOINLINE mpv_abort_async_command #-}

-- | Signal to all async requests with the matching ID to abort. This affects the following API calls: mpv_command_async
--  mpv_command_node_async
--
--     All of these functions take a reply_userdata parameter. This API function tells all requests with the matching reply_userdata value to try to return as soon as possible. If there are multiple requests with matching ID, it aborts all of them.
--
--     This API function is mostly asynchronous itself. It will not wait until the command is aborted. Instead, the command will terminate as usual, but with some work not done. How this is signaled depends on the specific command (for example, the \"subprocess\" command will indicate it by \"killed_by_us\" set to true in the result). How long it takes also depends on the situation. The aborting process is completely asynchronous.
--
--     Not all commands may support this functionality. In this case, this function will have no effect. The same is true if the request using the passed reply_userdata has already terminated, has not been started yet, or was never in use at all.
--
--     You have to be careful of race conditions: the time during which the abort request will be effective is /after/ e.g. @mpv_command_async()@ has returned, and before the command has signaled completion with MPV_EVENT_COMMAND_REPLY.
--
--     [@reply_userdata@]: ID of the request to be aborted (see above)
--
--     [C declaration]: @mpv_abort_async_command@, defined at @mpv\/client.h 1041:17@
mpv_abort_async_command :: BG.FunPtr (BG.Ptr Mpv_handle -> HsBindgen.Runtime.LibC.Word64 -> IO ())
mpv_abort_async_command =
  BG.unsafePerformIO hs_bindgen_34e4edd15d21c3fc

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_property@
foreign import ccall unsafe "hs_bindgen_9d182040b443f98d"
  hs_bindgen_9d182040b443f98d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_property@
hs_bindgen_9d182040b443f98d
  :: IO
       ( BG.FunPtr
           (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> Mpv_format -> BG.Ptr BG.Void -> IO BG.CInt)
       )
hs_bindgen_9d182040b443f98d =
  fmap BG.fromFFIType hs_bindgen_9d182040b443f98d_base

{-# NOINLINE mpv_set_property #-}

-- | Set a property to a given value. Properties are essentially variables which can be queried or set at runtime. For example, writing to the pause property will actually pause or unpause playback.
--
--     If the format doesn\'t match with the internal format of the property, access usually will fail with MPV_ERROR_PROPERTY_FORMAT. In some cases, the data is automatically converted and access succeeds. For example, MPV_FORMAT_INT64 is always converted to MPV_FORMAT_DOUBLE, and access using MPV_FORMAT_STRING usually invokes a string parser. The same happens when calling this function with MPV_FORMAT_NODE: the underlying format may be converted to another type if possible.
--
--     Using a format other than MPV_FORMAT_NODE is equivalent to constructing a 'Mpv_node' with the given format and data, and passing the 'Mpv_node' to this function. (Before API version 1.21, this was different.)
--
--     Note: starting with mpv 0.21.0 (client API version 1.23), this can be used to set options in general. It even can be used before @mpv_initialize()@ has been called. If called before @mpv_initialize()@, setting properties not backed by options will result in MPV_ERROR_PROPERTY_UNAVAILABLE. In some cases, properties and options still conflict. In these cases, @mpv_set_property()@ accesses the options before @mpv_initialize()@, and the properties after @mpv_initialize()@. These conflicts will be removed in mpv 0.23.0. See @mpv_set_option()@ for further remarks.
--
--     [@name@]: The property name. See input.rst for a list of properties.
--
--     [@format@]: see enum 'Mpv_format'.
--
--     [@data@]: /(input)/
--               Option value.
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_set_property@, defined at @mpv\/client.h 1074:16@
mpv_set_property
  :: BG.FunPtr
       (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> Mpv_format -> BG.Ptr BG.Void -> IO BG.CInt)
mpv_set_property =
  BG.unsafePerformIO hs_bindgen_9d182040b443f98d

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_property_string@
foreign import ccall unsafe "hs_bindgen_bba8776a54a154c9"
  hs_bindgen_bba8776a54a154c9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_property_string@
hs_bindgen_bba8776a54a154c9
  :: IO
       ( BG.FunPtr
           (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CInt)
       )
hs_bindgen_bba8776a54a154c9 =
  fmap BG.fromFFIType hs_bindgen_bba8776a54a154c9_base

{-# NOINLINE mpv_set_property_string #-}

-- | Convenience function to set a property to a string value.
--
--     This is like calling @mpv_set_property()@ with MPV_FORMAT_STRING.
--
--     [C declaration]: @mpv_set_property_string@, defined at @mpv\/client.h 1082:16@
mpv_set_property_string
  :: BG.FunPtr
       (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CInt)
mpv_set_property_string =
  BG.unsafePerformIO hs_bindgen_bba8776a54a154c9

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_del_property@
foreign import ccall unsafe "hs_bindgen_a5b312e8252b72cf"
  hs_bindgen_a5b312e8252b72cf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_del_property@
hs_bindgen_a5b312e8252b72cf
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO BG.CInt))
hs_bindgen_a5b312e8252b72cf =
  fmap BG.fromFFIType hs_bindgen_a5b312e8252b72cf_base

{-# NOINLINE mpv_del_property #-}

-- | Convenience function to delete a property.
--
--     This is equivalent to running the command \"del [name]\".
--
--     [@name@]: The property name. See input.rst for a list of properties.
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_del_property@, defined at @mpv\/client.h 1092:16@
mpv_del_property :: BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO BG.CInt)
mpv_del_property =
  BG.unsafePerformIO hs_bindgen_a5b312e8252b72cf

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_property_async@
foreign import ccall unsafe "hs_bindgen_d5c9b75bd8d4a749"
  hs_bindgen_d5c9b75bd8d4a749_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_property_async@
hs_bindgen_d5c9b75bd8d4a749
  :: IO
       ( BG.FunPtr
           ( BG.Ptr Mpv_handle
             -> HsBindgen.Runtime.LibC.Word64
             -> PtrConst.PtrConst BG.CChar
             -> Mpv_format
             -> BG.Ptr BG.Void
             -> IO BG.CInt
           )
       )
hs_bindgen_d5c9b75bd8d4a749 =
  fmap BG.fromFFIType hs_bindgen_d5c9b75bd8d4a749_base

{-# NOINLINE mpv_set_property_async #-}

-- | Set a property asynchronously. You will receive the result of the operation as MPV_EVENT_SET_PROPERTY_REPLY event. The @mpv_event.error@ field will contain the result status of the operation. Otherwise, this function is similar to @mpv_set_property()@.
--
--     Safe to be called from mpv render API threads.
--
--     [@reply_userdata@]: see section about asynchronous calls
--
--     [@name@]: The property name.
--
--     [@format@]: see enum 'Mpv_format'.
--
--     [@data@]: /(input)/
--               Option value. The value will be copied by the function. It will never be modified by the client API.
--
--     [Returns]: error code if sending the request failed
--
--     [C declaration]: @mpv_set_property_async@, defined at @mpv\/client.h 1109:16@
mpv_set_property_async
  :: BG.FunPtr
       ( BG.Ptr Mpv_handle
         -> HsBindgen.Runtime.LibC.Word64
         -> PtrConst.PtrConst BG.CChar
         -> Mpv_format
         -> BG.Ptr BG.Void
         -> IO BG.CInt
       )
mpv_set_property_async =
  BG.unsafePerformIO hs_bindgen_d5c9b75bd8d4a749

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_property@
foreign import ccall unsafe "hs_bindgen_89dce700857d062e"
  hs_bindgen_89dce700857d062e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_property@
hs_bindgen_89dce700857d062e
  :: IO
       ( BG.FunPtr
           (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> Mpv_format -> BG.Ptr BG.Void -> IO BG.CInt)
       )
hs_bindgen_89dce700857d062e =
  fmap BG.fromFFIType hs_bindgen_89dce700857d062e_base

{-# NOINLINE mpv_get_property #-}

-- | Read the value of the given property.
--
--     If the format doesn\'t match with the internal format of the property, access usually will fail with MPV_ERROR_PROPERTY_FORMAT. In some cases, the data is automatically converted and access succeeds. For example, MPV_FORMAT_INT64 is always converted to MPV_FORMAT_DOUBLE, and access using MPV_FORMAT_STRING usually invokes a string formatter.
--
--     [@name@]: The property name.
--
--     [@format@]: see enum 'Mpv_format'.
--
--     [@data@]: /(output)/
--               Pointer to the variable holding the option value. On success, the variable will be set to a copy of the option value. For formats that require dynamic memory allocation, you can free the value with @mpv_free()@ (strings) or @mpv_free_node_contents()@ (MPV_FORMAT_NODE).
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_get_property@, defined at @mpv\/client.h 1130:16@
mpv_get_property
  :: BG.FunPtr
       (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> Mpv_format -> BG.Ptr BG.Void -> IO BG.CInt)
mpv_get_property =
  BG.unsafePerformIO hs_bindgen_89dce700857d062e

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_property_string@
foreign import ccall unsafe "hs_bindgen_1d23dd8b31bd1f63"
  hs_bindgen_1d23dd8b31bd1f63_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_property_string@
hs_bindgen_1d23dd8b31bd1f63
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar)))
hs_bindgen_1d23dd8b31bd1f63 =
  fmap BG.fromFFIType hs_bindgen_1d23dd8b31bd1f63_base

{-# NOINLINE mpv_get_property_string #-}

-- | Return the value of the property with the given name as string. This is equivalent to @mpv_get_property()@ with MPV_FORMAT_STRING.
--
--     See MPV_FORMAT_STRING for character encoding issues.
--
--     On error, NULL is returned. Use @mpv_get_property()@ if you want fine-grained error reporting.
--
--     [@name@]: The property name.
--
--     [Returns]: Property value, or NULL if the property can\'t be retrieved. Free the string with @mpv_free()@.
--
--     [C declaration]: @mpv_get_property_string@, defined at @mpv\/client.h 1146:18@
mpv_get_property_string
  :: BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar))
mpv_get_property_string =
  BG.unsafePerformIO hs_bindgen_1d23dd8b31bd1f63

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_property_osd_string@
foreign import ccall unsafe "hs_bindgen_a3dedf4c1e485ba9"
  hs_bindgen_a3dedf4c1e485ba9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_property_osd_string@
hs_bindgen_a3dedf4c1e485ba9
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar)))
hs_bindgen_a3dedf4c1e485ba9 =
  fmap BG.fromFFIType hs_bindgen_a3dedf4c1e485ba9_base

{-# NOINLINE mpv_get_property_osd_string #-}

-- | Return the property as \"OSD\" formatted string. This is the same as mpv_get_property_string, but using MPV_FORMAT_OSD_STRING.
--
--     [Returns]: Property value, or NULL if the property can\'t be retrieved. Free the string with @mpv_free()@.
--
--     [C declaration]: @mpv_get_property_osd_string@, defined at @mpv\/client.h 1155:18@
mpv_get_property_osd_string
  :: BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar))
mpv_get_property_osd_string =
  BG.unsafePerformIO hs_bindgen_a3dedf4c1e485ba9

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_property_async@
foreign import ccall unsafe "hs_bindgen_4eec801becaf8e6e"
  hs_bindgen_4eec801becaf8e6e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_property_async@
hs_bindgen_4eec801becaf8e6e
  :: IO
       ( BG.FunPtr
           ( BG.Ptr Mpv_handle
             -> HsBindgen.Runtime.LibC.Word64
             -> PtrConst.PtrConst BG.CChar
             -> Mpv_format
             -> IO BG.CInt
           )
       )
hs_bindgen_4eec801becaf8e6e =
  fmap BG.fromFFIType hs_bindgen_4eec801becaf8e6e_base

{-# NOINLINE mpv_get_property_async #-}

-- | Get a property asynchronously. You will receive the result of the operation as well as the property data with the MPV_EVENT_GET_PROPERTY_REPLY event. You should check the @mpv_event.error@ field on the reply event.
--
--     Safe to be called from mpv render API threads.
--
--     [@reply_userdata@]: see section about asynchronous calls
--
--     [@name@]: The property name.
--
--     [@format@]: see enum 'Mpv_format'.
--
--     [Returns]: error code if sending the request failed
--
--     [C declaration]: @mpv_get_property_async@, defined at @mpv\/client.h 1169:16@
mpv_get_property_async
  :: BG.FunPtr
       ( BG.Ptr Mpv_handle
         -> HsBindgen.Runtime.LibC.Word64
         -> PtrConst.PtrConst BG.CChar
         -> Mpv_format
         -> IO BG.CInt
       )
mpv_get_property_async =
  BG.unsafePerformIO hs_bindgen_4eec801becaf8e6e

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_observe_property@
foreign import ccall unsafe "hs_bindgen_bf4537aeaa969151"
  hs_bindgen_bf4537aeaa969151_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_observe_property@
hs_bindgen_bf4537aeaa969151
  :: IO
       ( BG.FunPtr
           ( BG.Ptr Mpv_handle
             -> HsBindgen.Runtime.LibC.Word64
             -> PtrConst.PtrConst BG.CChar
             -> Mpv_format
             -> IO BG.CInt
           )
       )
hs_bindgen_bf4537aeaa969151 =
  fmap BG.fromFFIType hs_bindgen_bf4537aeaa969151_base

{-# NOINLINE mpv_observe_property #-}

-- | Get a notification whenever the given property changes. You will receive updates as MPV_EVENT_PROPERTY_CHANGE. Note that this is not very precise: for some properties, it may not send updates even if the property changed. This depends on the property, and it\'s a valid feature request to ask for better update handling of a specific property. (For some properties, like @clock@, which shows the wall clock, this mechanism doesn\'t make too much sense anyway.)
--
--     Property changes are coalesced: the change events are returned only once the event queue becomes empty (e.g. @mpv_wait_event()@ would block or return MPV_EVENT_NONE), and then only one event per changed property is returned.
--
--     You always get an initial change notification. This is meant to initialize the user\'s state to the current value of the property.
--
--     Normally, change events are sent only if the property value changes according to the requested format. 'Mpv_event_property' will contain the property value as data member.
--
--     Warning: if a property is unavailable or retrieving it caused an error, MPV_FORMAT_NONE will be set in 'Mpv_event_property', even if the format parameter was set to a different value. In this case, the @mpv_event_property.data@ field is invalid.
--
--     If the property is observed with the format parameter set to MPV_FORMAT_NONE, you get low-level notifications whether the property /may/ have changed, and the data member in 'Mpv_event_property' will be unset. With this mode, you will have to determine yourself whether the property really changed. On the other hand, this mechanism can be faster and uses less resources.
--
--     Observing a property that doesn\'t exist is allowed. (Although it may still cause some sporadic change events.)
--
--     Keep in mind that you will get change notifications even if you change a property yourself. Try to avoid endless feedback loops, which could happen if you react to the change notifications triggered by your own change.
--
--     Only the 'Mpv_handle' on which this was called will receive the property change events, or can unobserve them.
--
--     Safe to be called from mpv render API threads.
--
--     [@reply_userdata@]: This will be used for the @mpv_event.reply_userdata@ field for the received MPV_EVENT_PROPERTY_CHANGE events. (Also see section about asynchronous calls, although this function is somewhat different from actual asynchronous calls.) If you have no use for this, pass 0. Also see @mpv_unobserve_property()@.
--
--     [@name@]: The property name.
--
--     [@format@]: see enum 'Mpv_format'. Can be MPV_FORMAT_NONE to omit values from the change events.
--
--     [Returns]: error code (usually fails only on OOM or unsupported format)
--
--     [C declaration]: @mpv_observe_property@, defined at @mpv\/client.h 1227:16@
mpv_observe_property
  :: BG.FunPtr
       ( BG.Ptr Mpv_handle
         -> HsBindgen.Runtime.LibC.Word64
         -> PtrConst.PtrConst BG.CChar
         -> Mpv_format
         -> IO BG.CInt
       )
mpv_observe_property =
  BG.unsafePerformIO hs_bindgen_bf4537aeaa969151

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_unobserve_property@
foreign import ccall unsafe "hs_bindgen_7096d655a7275acc"
  hs_bindgen_7096d655a7275acc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_unobserve_property@
hs_bindgen_7096d655a7275acc
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> HsBindgen.Runtime.LibC.Word64 -> IO BG.CInt))
hs_bindgen_7096d655a7275acc =
  fmap BG.fromFFIType hs_bindgen_7096d655a7275acc_base

{-# NOINLINE mpv_unobserve_property #-}

-- | Undo @mpv_observe_property()@. This will remove all observed properties for which the given number was passed as reply_userdata to mpv_observe_property.
--
--     Safe to be called from mpv render API threads.
--
--     [@registered_reply_userdata@]: ID that was passed to mpv_observe_property
--
--     [Returns]: negative value is an error code, >=0 is number of removed properties on success (includes the case when 0 were removed)
--
--     [C declaration]: @mpv_unobserve_property@, defined at @mpv\/client.h 1240:16@
mpv_unobserve_property
  :: BG.FunPtr (BG.Ptr Mpv_handle -> HsBindgen.Runtime.LibC.Word64 -> IO BG.CInt)
mpv_unobserve_property =
  BG.unsafePerformIO hs_bindgen_7096d655a7275acc

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_event_name@
foreign import ccall unsafe "hs_bindgen_1857a83a197aea05"
  hs_bindgen_1857a83a197aea05_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_event_name@
hs_bindgen_1857a83a197aea05 :: IO (BG.FunPtr (Mpv_event_id -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_1857a83a197aea05 =
  fmap BG.fromFFIType hs_bindgen_1857a83a197aea05_base

{-# NOINLINE mpv_event_name #-}

-- | Return a string describing the event. For unknown events, NULL is returned.
--
--     Note that all events actually returned by the API will also yield a non-NULL string with this function.
--
--     [@event@]: event ID, see see enum 'Mpv_event_id'
--
--     [Returns]: A static string giving a short symbolic name of the event. It consists of lower-case alphanumeric characters and can include \"-\" characters. This string is suitable for use in e.g. scripting interfaces. The string is completely static, i.e. doesn\'t need to be deallocated, and is valid forever.
--
--     [C declaration]: @mpv_event_name@, defined at @mpv\/client.h 1388:24@
mpv_event_name :: BG.FunPtr (Mpv_event_id -> IO (PtrConst.PtrConst BG.CChar))
mpv_event_name =
  BG.unsafePerformIO hs_bindgen_1857a83a197aea05

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_event_to_node@
foreign import ccall unsafe "hs_bindgen_233d1d141f540094"
  hs_bindgen_233d1d141f540094_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_event_to_node@
hs_bindgen_233d1d141f540094 :: IO (BG.FunPtr (BG.Ptr Mpv_node -> BG.Ptr Mpv_event -> IO BG.CInt))
hs_bindgen_233d1d141f540094 =
  fmap BG.fromFFIType hs_bindgen_233d1d141f540094_base

{-# NOINLINE mpv_event_to_node #-}

-- | Convert the given src event to a 'Mpv_node', and set /dst to the result. *dst is set to a MPV_FORMAT_NODE_MAP, with fields for corresponding 'Mpv_event' and @mpv_event.data@ \/mpv_event_/ fields.
--
--     The exact details are not completely documented out of laziness. A start is located in the \"Events\" section of the manpage.
--
--     *dst may point to newly allocated memory, or pointers in 'Mpv_event'. You must copy the entire 'Mpv_node' if you want to reference it after 'Mpv_event' becomes invalid (such as making a new @mpv_wait_event()@ call, or destroying the 'Mpv_handle' from which it was returned). Call @mpv_free_node_contents()@ to free any memory allocations made by this API function.
--
--     Safe to be called from mpv render API threads.
--
--     [@dst@]: Target. This is not read and fully overwritten. Must be released with @mpv_free_node_contents()@. Do not write to pointers returned by it. (On error, this may be left as an empty node.)
--
--     [@src@]: The source event. Not modified (it\'s not const due to the author\'s prejudice of the C version of const).
--
--     [Returns]: error code (MPV_ERROR_NOMEM only, if at all)
--
--     [C declaration]: @mpv_event_to_node@, defined at @mpv\/client.h 1651:16@
mpv_event_to_node :: BG.FunPtr (BG.Ptr Mpv_node -> BG.Ptr Mpv_event -> IO BG.CInt)
mpv_event_to_node =
  BG.unsafePerformIO hs_bindgen_233d1d141f540094

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_request_event@
foreign import ccall unsafe "hs_bindgen_9f65f136209adff9"
  hs_bindgen_9f65f136209adff9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_request_event@
hs_bindgen_9f65f136209adff9
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> Mpv_event_id -> BG.CInt -> IO BG.CInt))
hs_bindgen_9f65f136209adff9 =
  fmap BG.fromFFIType hs_bindgen_9f65f136209adff9_base

{-# NOINLINE mpv_request_event #-}

-- | Enable or disable the given event.
--
--     Some events are enabled by default. Some events can\'t be disabled.
--
--     (Informational note: currently, all events are enabled by default, except MPV_EVENT_TICK.)
--
--     Safe to be called from mpv render API threads.
--
--     [@event@]: See enum 'Mpv_event_id'.
--
--     [@enable@]: 1 to enable receiving this event, 0 to disable it.
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_request_event@, defined at @mpv\/client.h 1667:16@
mpv_request_event :: BG.FunPtr (BG.Ptr Mpv_handle -> Mpv_event_id -> BG.CInt -> IO BG.CInt)
mpv_request_event =
  BG.unsafePerformIO hs_bindgen_9f65f136209adff9

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_request_log_messages@
foreign import ccall unsafe "hs_bindgen_57cfe9d93ce070ca"
  hs_bindgen_57cfe9d93ce070ca_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_request_log_messages@
hs_bindgen_57cfe9d93ce070ca
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO BG.CInt))
hs_bindgen_57cfe9d93ce070ca =
  fmap BG.fromFFIType hs_bindgen_57cfe9d93ce070ca_base

{-# NOINLINE mpv_request_log_messages #-}

-- | Enable or disable receiving of log messages. These are the messages the command line player prints to the terminal. This call sets the minimum required log level for a message to be received with MPV_EVENT_LOG_MESSAGE.
--
--     [@min_level@]: Minimal log level as string. Valid log levels: no fatal error warn info v debug trace The value \"no\" disables all messages. This is the default. An exception is the value \"terminal-default\", which uses the log level as set by the \"--msg-level\" option. This works even if the terminal is disabled. (Since API version 1.19.) Also see 'Mpv_log_level'.
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_request_log_messages@, defined at @mpv\/client.h 1683:16@
mpv_request_log_messages
  :: BG.FunPtr (BG.Ptr Mpv_handle -> PtrConst.PtrConst BG.CChar -> IO BG.CInt)
mpv_request_log_messages =
  BG.unsafePerformIO hs_bindgen_57cfe9d93ce070ca

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_wait_event@
foreign import ccall unsafe "hs_bindgen_99eab11e9895f600"
  hs_bindgen_99eab11e9895f600_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_wait_event@
hs_bindgen_99eab11e9895f600
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> BG.CDouble -> IO (BG.Ptr Mpv_event)))
hs_bindgen_99eab11e9895f600 =
  fmap BG.fromFFIType hs_bindgen_99eab11e9895f600_base

{-# NOINLINE mpv_wait_event #-}

-- | Wait for the next event, or until the timeout expires, or if another thread makes a call to @mpv_wakeup()@. Passing 0 as timeout will never wait, and is suitable for polling.
--
--     The internal event queue has a limited size (per client handle). If you don\'t empty the event queue quickly enough with @mpv_wait_event()@, it will overflow and silently discard further events. If this happens, making asynchronous requests will fail as well (with MPV_ERROR_EVENT_QUEUE_FULL).
--
--     Only one thread is allowed to call this on the same 'Mpv_handle' at a time. The API won\'t complain if more than one thread calls this, but it will cause race conditions in the client when accessing the shared 'Mpv_event' struct. Note that most other API functions are not restricted by this, and no API function internally calls @mpv_wait_event()@. Additionally, concurrent calls to different mpv_handles are always safe.
--
--     As long as the timeout is 0, this is safe to be called from mpv render API threads.
--
--     [@timeout@]: Timeout in seconds, after which the function returns even if no event was received. A MPV_EVENT_NONE is returned on timeout. A value of 0 will disable waiting. Negative values will wait with an infinite timeout.
--
--     [Returns]: A struct containing the event ID and other data. The pointer (and fields in the struct) stay valid until the next @mpv_wait_event()@ call, or until the 'Mpv_handle' is destroyed. You must not write to the struct, and all memory referenced by it will be automatically released by the API on the next @mpv_wait_event()@ call, or when the context is destroyed. The return value is never NULL.
--
--     [C declaration]: @mpv_wait_event@, defined at @mpv\/client.h 1716:23@
mpv_wait_event :: BG.FunPtr (BG.Ptr Mpv_handle -> BG.CDouble -> IO (BG.Ptr Mpv_event))
mpv_wait_event =
  BG.unsafePerformIO hs_bindgen_99eab11e9895f600

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_wakeup@
foreign import ccall unsafe "hs_bindgen_fae19300cc8a2bd1"
  hs_bindgen_fae19300cc8a2bd1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_wakeup@
hs_bindgen_fae19300cc8a2bd1 :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> IO ()))
hs_bindgen_fae19300cc8a2bd1 =
  fmap BG.fromFFIType hs_bindgen_fae19300cc8a2bd1_base

{-# NOINLINE mpv_wakeup #-}

-- | Interrupt the current @mpv_wait_event()@ call. This will wake up the thread currently waiting in @mpv_wait_event()@. If no thread is waiting, the next @mpv_wait_event()@ call will return immediately (this is to avoid lost wakeups).
--
--     @mpv_wait_event()@ will receive a MPV_EVENT_NONE if it\'s woken up due to this call. But note that this dummy event might be skipped if there are already other events queued. All what counts is that the waiting thread is woken up at all.
--
--     Safe to be called from mpv render API threads.
--
--     [C declaration]: @mpv_wakeup@, defined at @mpv\/client.h 1731:17@
mpv_wakeup :: BG.FunPtr (BG.Ptr Mpv_handle -> IO ())
mpv_wakeup =
  BG.unsafePerformIO hs_bindgen_fae19300cc8a2bd1

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_wakeup_callback@
foreign import ccall unsafe "hs_bindgen_46224d63a95386bd"
  hs_bindgen_46224d63a95386bd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_set_wakeup_callback@
hs_bindgen_46224d63a95386bd
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> BG.FunPtr (BG.Ptr BG.Void -> IO ()) -> BG.Ptr BG.Void -> IO ()))
hs_bindgen_46224d63a95386bd =
  fmap BG.fromFFIType hs_bindgen_46224d63a95386bd_base

{-# NOINLINE mpv_set_wakeup_callback #-}

-- | Set a custom function that should be called when there are new events. Use this if blocking in @mpv_wait_event()@ to wait for new events is not feasible.
--
--     Keep in mind that the callback will be called from foreign threads. You must not make any assumptions of the environment, and you must return as soon as possible (i.e. no long blocking waits). Exiting the callback through any other means than a normal return is forbidden (no throwing exceptions, no longjmp() calls). You must not change any local thread state (such as the C floating point environment).
--
--     You are not allowed to call any client API functions inside of the callback. In particular, you should not do any processing in the callback, but wake up another thread that does all the work. The callback is meant strictly for notification only, and is called from arbitrary core parts of the player, that make no considerations for reentrant API use or allowing the callee to spend a lot of time doing other things. Keep in mind that it\'s also possible that the callback is called from a thread while a mpv API function is called (i.e. it can be reentrant).
--
--     In general, the client API expects you to call @mpv_wait_event()@ to receive notifications, and the wakeup callback is merely a helper utility to make this easier in certain situations. Note that it\'s possible that there\'s only one wakeup callback invocation for multiple events. You should call @mpv_wait_event()@ with no timeout until MPV_EVENT_NONE is reached, at which point the event queue is empty.
--
--     If you actually want to do processing in a callback, spawn a thread that does nothing but call @mpv_wait_event()@ in a loop and dispatches the result to a callback.
--
--     Only one wakeup callback can be set.
--
--     [@cb@]: function that should be called if a wakeup is required
--
--     [@d@]: arbitrary userdata passed to cb
--
--     [C declaration]: @mpv_set_wakeup_callback@, defined at @mpv\/client.h 1769:17@
mpv_set_wakeup_callback
  :: BG.FunPtr (BG.Ptr Mpv_handle -> BG.FunPtr (BG.Ptr BG.Void -> IO ()) -> BG.Ptr BG.Void -> IO ())
mpv_set_wakeup_callback =
  BG.unsafePerformIO hs_bindgen_46224d63a95386bd

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_wait_async_requests@
foreign import ccall unsafe "hs_bindgen_7d38686a69d22551"
  hs_bindgen_7d38686a69d22551_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_wait_async_requests@
hs_bindgen_7d38686a69d22551 :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> IO ()))
hs_bindgen_7d38686a69d22551 =
  fmap BG.fromFFIType hs_bindgen_7d38686a69d22551_base

{-# NOINLINE mpv_wait_async_requests #-}

-- | Block until all asynchronous requests are done. This affects functions like @mpv_command_async()@, which return immediately and return their result as events.
--
--     This is a helper, and somewhat equivalent to calling @mpv_wait_event()@ in a loop until all known asynchronous requests have sent their reply as event, except that the event queue is not emptied.
--
--     In case you called mpv_suspend() before, this will also forcibly reset the suspend counter of the given handle.
--
--     [C declaration]: @mpv_wait_async_requests@, defined at @mpv\/client.h 1783:17@
mpv_wait_async_requests :: BG.FunPtr (BG.Ptr Mpv_handle -> IO ())
mpv_wait_async_requests =
  BG.unsafePerformIO hs_bindgen_7d38686a69d22551

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_hook_add@
foreign import ccall unsafe "hs_bindgen_c604fcdadcfcee34"
  hs_bindgen_c604fcdadcfcee34_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_hook_add@
hs_bindgen_c604fcdadcfcee34
  :: IO
       ( BG.FunPtr
           ( BG.Ptr Mpv_handle
             -> HsBindgen.Runtime.LibC.Word64
             -> PtrConst.PtrConst BG.CChar
             -> BG.CInt
             -> IO BG.CInt
           )
       )
hs_bindgen_c604fcdadcfcee34 =
  fmap BG.fromFFIType hs_bindgen_c604fcdadcfcee34_base

{-# NOINLINE mpv_hook_add #-}

-- | A hook is like a synchronous event that blocks the player. You register a hook handler with this function. You will get an event, which you need to handle, and once things are ready, you can let the player continue with @mpv_hook_continue()@.
--
--     Currently, hooks can\'t be removed explicitly. But they will be implicitly removed if the 'Mpv_handle' it was registered with is destroyed. This also continues the hook if it was being handled by the destroyed 'Mpv_handle' (but this should be avoided, as it might mess up order of hook execution).
--
--     Hook handlers are ordered globally by priority and order of registration. Handlers for the same hook with same priority are invoked in order of registration (the handler registered first is run first). Handlers with lower priority are run first (which seems backward).
--
--     See the \"Hooks\" section in the manpage to see which hooks are currently defined.
--
--     Some hooks might be reentrant (so you get multiple MPV_EVENT_HOOK for the same hook). If this can happen for a specific hook type, it will be explicitly documented in the manpage.
--
--     Only the 'Mpv_handle' on which this was called will receive the hook events, or can \"continue\" them.
--
--     [@reply_userdata@]: This will be used for the @mpv_event.reply_userdata@ field for the received MPV_EVENT_HOOK events. If you have no use for this, pass 0.
--
--     [@name@]: The hook name. This should be one of the documented names. But if the name is unknown, the hook event will simply be never raised.
--
--     [@priority@]: See remarks above. Use 0 as a neutral default.
--
--     [Returns]: error code (usually fails only on OOM)
--
--     [C declaration]: @mpv_hook_add@, defined at @mpv\/client.h 1820:16@
mpv_hook_add
  :: BG.FunPtr
       ( BG.Ptr Mpv_handle
         -> HsBindgen.Runtime.LibC.Word64
         -> PtrConst.PtrConst BG.CChar
         -> BG.CInt
         -> IO BG.CInt
       )
mpv_hook_add =
  BG.unsafePerformIO hs_bindgen_c604fcdadcfcee34

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_hook_continue@
foreign import ccall unsafe "hs_bindgen_15f8b4010dc2f31f"
  hs_bindgen_15f8b4010dc2f31f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_hook_continue@
hs_bindgen_15f8b4010dc2f31f
  :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> HsBindgen.Runtime.LibC.Word64 -> IO BG.CInt))
hs_bindgen_15f8b4010dc2f31f =
  fmap BG.fromFFIType hs_bindgen_15f8b4010dc2f31f_base

{-# NOINLINE mpv_hook_continue #-}

-- | Respond to a MPV_EVENT_HOOK event. You must call this after you have handled the event. There is no way to \"cancel\" or \"stop\" the hook.
--
--     Calling this will will typically unblock the player for whatever the hook is responsible for (e.g. for the \"on_load\" hook it lets it continue playback).
--
--     It is explicitly undefined behavior to call this more than once for each MPV_EVENT_HOOK, to pass an incorrect ID, or to call this on a 'Mpv_handle' different from the one that registered the handler and received the event.
--
--     [@id@]: This must be the value of the @mpv_event_hook.id@ field for the corresponding MPV_EVENT_HOOK.
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_hook_continue@, defined at @mpv\/client.h 1839:16@
mpv_hook_continue :: BG.FunPtr (BG.Ptr Mpv_handle -> HsBindgen.Runtime.LibC.Word64 -> IO BG.CInt)
mpv_hook_continue =
  BG.unsafePerformIO hs_bindgen_15f8b4010dc2f31f

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_wakeup_pipe@
foreign import ccall unsafe "hs_bindgen_9a8885ffe905d9ee"
  hs_bindgen_9a8885ffe905d9ee_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Client_get_mpv_get_wakeup_pipe@
hs_bindgen_9a8885ffe905d9ee :: IO (BG.FunPtr (BG.Ptr Mpv_handle -> IO BG.CInt))
hs_bindgen_9a8885ffe905d9ee =
  fmap BG.fromFFIType hs_bindgen_9a8885ffe905d9ee_base

{-# NOINLINE mpv_get_wakeup_pipe #-}

-- | Return a UNIX file descriptor referring to the read end of a pipe. This pipe can be used to wake up a poll() based processing loop. The purpose of this function is very similar to @mpv_set_wakeup_callback()@, and provides a primitive mechanism to handle coordinating a foreign event loop and the libmpv event loop. The pipe is non-blocking. It\'s closed when the 'Mpv_handle' is destroyed. This function always returns the same value (on success).
--
--     This is in fact implemented using the same underlying code as for @mpv_set_wakeup_callback()@ (though they don\'t conflict), and it is as if each callback invocation writes a single 0 byte to the pipe. When the pipe becomes readable, the code calling poll() (or select()) on the pipe should read all contents of the pipe and then call mpv_wait_event(c, 0) until no new events are returned. The pipe contents do not matter and can just be discarded. There is not necessarily one byte per readable event in the pipe. For example, the pipes are non-blocking, and mpv won\'t block if the pipe is full. Pipes are normally limited to 4096 bytes, so if there are more than 4096 events, the number of readable bytes can not equal the number of events queued. Also, it\'s possible that mpv does not write to the pipe once it\'s guaranteed that the client was already signaled. See the example below how to do it correctly.
--
--     Example:
--
--     int pipefd = mpv_get_wakeup_pipe(mpv); if (pipefd \< 0) error(); while (1) { struct pollfd pfds[1] = { { .fd = pipefd, .events = POLLIN }, }; \/\/ Wait until there are possibly new mpv events. poll(pfds, 1, -1); if (pfds[0].revents & POLLIN) { \/\/ Empty the pipe. Doing this before calling @mpv_wait_event()@ \/\/ ensures that no wakeups are missed. It\'s not so important to \/\/ make sure the pipe is really empty (it will just cause some \/\/ additional wakeups in unlikely corner cases). char unused[256]; read(pipefd, unused, sizeof(unused)); while (1) {'Mpv_event' *ev = mpv_wait_event(mpv, 0); \/\/ If MPV_EVENT_NONE is received, the event queue is empty. if (ev->event_id == MPV_EVENT_NONE) break; \/\/ Process the event. ... } } }
--
--     [Deprecated]: this function will be removed in the future. If you need this functionality, use @mpv_set_wakeup_callback()@, create a pipe manually, and call write() on your pipe in the callback.
--
--     [Returns]: A UNIX FD of the read end of the wakeup pipe, or -1 on error. On MS Windows\/MinGW, this will always return -1.
--
--     [C declaration]: @mpv_get_wakeup_pipe@, defined at @mpv\/client.h 1901:16@
mpv_get_wakeup_pipe :: BG.FunPtr (BG.Ptr Mpv_handle -> IO BG.CInt)
mpv_get_wakeup_pipe =
  BG.unsafePerformIO hs_bindgen_9a8885ffe905d9ee

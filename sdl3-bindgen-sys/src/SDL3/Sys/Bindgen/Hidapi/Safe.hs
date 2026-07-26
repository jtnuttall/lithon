{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Hidapi.Safe (
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_init,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_exit,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_device_change_count,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_enumerate,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_free_enumeration,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_open,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_open_path,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_get_properties,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_write,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_read_timeout,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_read,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_set_nonblocking,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_send_feature_report,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_get_feature_report,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_get_input_report,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_close,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_get_manufacturer_string,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_get_product_string,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_get_serial_number_string,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_get_indexed_string,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_get_device_info,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_get_report_descriptor,
  SDL3.Sys.Bindgen.Hidapi.Safe.sDL_hid_ble_scan,
)
where

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Hidapi
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_hidapi.h>"
         , "signed int hs_bindgen_e23ad4638e4651c5 (void)"
         , "{"
         , "  return (SDL_hid_init)();"
         , "}"
         , "signed int hs_bindgen_7eaeed138e676c34 (void)"
         , "{"
         , "  return (SDL_hid_exit)();"
         , "}"
         , "Uint32 hs_bindgen_68b6879ddc50fc82 (void)"
         , "{"
         , "  return (SDL_hid_device_change_count)();"
         , "}"
         , "SDL_hid_device_info *hs_bindgen_eb498439d31d5942 ("
         , "  unsigned short arg1,"
         , "  unsigned short arg2"
         , ")"
         , "{"
         , "  return (SDL_hid_enumerate)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_1de5e5c103bbeb76 ("
         , "  SDL_hid_device_info *arg1"
         , ")"
         , "{"
         , "  (SDL_hid_free_enumeration)(arg1);"
         , "}"
         , "SDL_hid_device *hs_bindgen_4dc258d14565e3b1 ("
         , "  unsigned short arg1,"
         , "  unsigned short arg2,"
         , "  wchar_t const *arg3"
         , ")"
         , "{"
         , "  return (SDL_hid_open)(arg1, arg2, arg3);"
         , "}"
         , "SDL_hid_device *hs_bindgen_c079ea49eff1706e ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_hid_open_path)(arg1);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef Uint32 SDL_PropertiesID;"
         , "#endif"
         , "SDL_PropertiesID hs_bindgen_18716020d09fa299 ("
         , "  SDL_hid_device *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_hid_get_properties)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_hid_get_properties requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "signed int hs_bindgen_7ffa302bd453f29d ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_hid_write)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_a9bb09f6978bf010 ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char *arg2,"
         , "  size_t arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "  return (SDL_hid_read_timeout)(arg1, arg2, arg3, arg4);"
         , "}"
         , "signed int hs_bindgen_71bc97f6f0149b6b ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_hid_read)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_a4718c506d2c7f0f ("
         , "  SDL_hid_device *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_hid_set_nonblocking)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_3f1829d40ff45783 ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_hid_send_feature_report)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_9bc7b92776c7a78c ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_hid_get_feature_report)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_71a9fd2459b81356 ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_hid_get_input_report)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_ac431d883efee041 ("
         , "  SDL_hid_device *arg1"
         , ")"
         , "{"
         , "  return (SDL_hid_close)(arg1);"
         , "}"
         , "signed int hs_bindgen_d928c5175963fa2b ("
         , "  SDL_hid_device *arg1,"
         , "  wchar_t *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_hid_get_manufacturer_string)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_6efd06cbd0be2ac4 ("
         , "  SDL_hid_device *arg1,"
         , "  wchar_t *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_hid_get_product_string)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_d39732d6a3cf4069 ("
         , "  SDL_hid_device *arg1,"
         , "  wchar_t *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_hid_get_serial_number_string)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_b1f4db11ff770839 ("
         , "  SDL_hid_device *arg1,"
         , "  signed int arg2,"
         , "  wchar_t *arg3,"
         , "  size_t arg4"
         , ")"
         , "{"
         , "  return (SDL_hid_get_indexed_string)(arg1, arg2, arg3, arg4);"
         , "}"
         , "SDL_hid_device_info *hs_bindgen_16acf6e683b8f908 ("
         , "  SDL_hid_device *arg1"
         , ")"
         , "{"
         , "  return (SDL_hid_get_device_info)(arg1);"
         , "}"
         , "signed int hs_bindgen_a73f2ef51699b1a7 ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_hid_get_report_descriptor)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_5f872b3d74ffb765 ("
         , "  _Bool arg1"
         , ")"
         , "{"
         , "  (SDL_hid_ble_scan)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_init@
foreign import ccall safe "hs_bindgen_e23ad4638e4651c5"
  hs_bindgen_e23ad4638e4651c5_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_init@
hs_bindgen_e23ad4638e4651c5 :: IO BG.CInt
hs_bindgen_e23ad4638e4651c5 =
  BG.fromFFIType hs_bindgen_e23ad4638e4651c5_base

-- | Initialize the HIDAPI library.
--
--     This function initializes the HIDAPI library. Calling it is not strictly necessary, as it will be called automatically by @SDL_hid_enumerate()@ and any of the SDL_hid_open_*() functions if it is needed. This function should be called at the beginning of execution however, if there is a chance of HIDAPI handles being opened by different threads simultaneously.
--
--     Each call to this function should have a matching call to @SDL_hid_exit()@
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_hid_exit'
--
--     [C declaration]: @SDL_hid_init@, defined at @SDL3\/SDL_hidapi.h 177:33@
sDL_hid_init :: IO BG.CInt
sDL_hid_init = hs_bindgen_e23ad4638e4651c5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_exit@
foreign import ccall safe "hs_bindgen_7eaeed138e676c34"
  hs_bindgen_7eaeed138e676c34_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_exit@
hs_bindgen_7eaeed138e676c34 :: IO BG.CInt
hs_bindgen_7eaeed138e676c34 =
  BG.fromFFIType hs_bindgen_7eaeed138e676c34_base

-- | Finalize the HIDAPI library.
--
--     This function frees all of the static data associated with HIDAPI. It should be called at the end of execution to avoid memory leaks.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_hid_init'
--
--     [C declaration]: @SDL_hid_exit@, defined at @SDL3\/SDL_hidapi.h 192:33@
sDL_hid_exit :: IO BG.CInt
sDL_hid_exit = hs_bindgen_7eaeed138e676c34

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_device_change_count@
foreign import ccall safe "hs_bindgen_68b6879ddc50fc82"
  hs_bindgen_68b6879ddc50fc82_base
    :: IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_device_change_count@
hs_bindgen_68b6879ddc50fc82 :: IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_68b6879ddc50fc82 =
  BG.fromFFIType hs_bindgen_68b6879ddc50fc82_base

-- | Check to see if devices may have been added or removed.
--
--     Enumerating the HID devices is an expensive operation, so you can call this to see if there have been any system device changes since the last call to this function. A change in the counter returned doesn\'t necessarily mean that anything has changed, but you can call @SDL_hid_enumerate()@ to get an updated device list.
--
--     Calling this function for the first time may cause a thread or other system resource to be allocated to track device change notifications.
--
--     [Returns]: a change counter that is incremented with each potential device change, or 0 if device change detection isn\'t available.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_hid_enumerate'
--
--     [C declaration]: @SDL_hid_device_change_count@, defined at @SDL3\/SDL_hidapi.h 213:36@
sDL_hid_device_change_count :: IO SDL3.Sys.Bindgen.Stdinc.Uint32
sDL_hid_device_change_count =
  hs_bindgen_68b6879ddc50fc82

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_enumerate@
foreign import ccall safe "hs_bindgen_eb498439d31d5942"
  hs_bindgen_eb498439d31d5942_base
    :: BG.Word16
    -> BG.Word16
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_enumerate@
hs_bindgen_eb498439d31d5942
  :: BG.CUShort
  -> BG.CUShort
  -> IO (BG.Ptr SDL_hid_device_info)
hs_bindgen_eb498439d31d5942 =
  BG.fromFFIType hs_bindgen_eb498439d31d5942_base

-- | Enumerate the HID Devices.
--
--     This function returns a linked list of all the HID devices attached to the system which match vendor_id and product_id. If @vendor_id@ is set to 0 then any vendor matches. If @product_id@ is set to 0 then any product matches. If @vendor_id@ and @product_id@ are both set to 0, then all HID devices will be returned.
--
--     By default SDL will only enumerate controllers, to reduce risk of hanging or crashing on bad drivers, but SDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS can be set to \"0\" to enumerate all HID devices.
--
--     [Returns]: a pointer to a linked list of type 'SDL_hid_device_info', containing information about the HID devices attached to the system, or NULL in the case of failure. Free this linked list by calling @SDL_hid_free_enumeration()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_hid_device_change_count'
--
--     [C declaration]: @SDL_hid_enumerate@, defined at @SDL3\/SDL_hidapi.h 241:51@
sDL_hid_enumerate
  :: BG.CUShort
  -- ^
  --
  --           [@vendor_id@]: the Vendor ID (VID) of the types of device to open, or 0 to match any vendor.
  -> BG.CUShort
  -- ^
  --
  --           [@product_id@]: the Product ID (PID) of the types of device to open, or 0 to match any product.
  -> IO (BG.Ptr SDL_hid_device_info)
sDL_hid_enumerate = hs_bindgen_eb498439d31d5942

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_free_enumeration@
foreign import ccall safe "hs_bindgen_1de5e5c103bbeb76"
  hs_bindgen_1de5e5c103bbeb76_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_free_enumeration@
hs_bindgen_1de5e5c103bbeb76
  :: BG.Ptr SDL_hid_device_info
  -> IO ()
hs_bindgen_1de5e5c103bbeb76 =
  BG.fromFFIType hs_bindgen_1de5e5c103bbeb76_base

-- | Free an enumeration linked list.
--
--     This function frees a linked list created by @SDL_hid_enumerate()@.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_free_enumeration@, defined at @SDL3\/SDL_hidapi.h 253:34@
sDL_hid_free_enumeration
  :: BG.Ptr SDL_hid_device_info
  -- ^
  --
  --           [@devs@]: pointer to a list of struct_device returned from @SDL_hid_enumerate()@.
  -> IO ()
sDL_hid_free_enumeration =
  hs_bindgen_1de5e5c103bbeb76

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_open@
foreign import ccall safe "hs_bindgen_4dc258d14565e3b1"
  hs_bindgen_4dc258d14565e3b1_base
    :: BG.Word16
    -> BG.Word16
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_open@
hs_bindgen_4dc258d14565e3b1
  :: BG.CUShort
  -> BG.CUShort
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> IO (BG.Ptr SDL_hid_device)
hs_bindgen_4dc258d14565e3b1 =
  BG.fromFFIType hs_bindgen_4dc258d14565e3b1_base

-- | Open a HID device using a Vendor ID (VID), Product ID (PID) and optionally a serial number.
--
--     If @serial_number@ is NULL, the first device with the specified VID and PID is opened.
--
--     [Returns]: a pointer to a 'SDL_hid_device' object on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_open@, defined at @SDL3\/SDL_hidapi.h 271:46@
sDL_hid_open
  :: BG.CUShort
  -- ^
  --
  --           [@vendor_id@]: the Vendor ID (VID) of the device to open.
  -> BG.CUShort
  -- ^
  --
  --           [@product_id@]: the Product ID (PID) of the device to open.
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@serial_number@]: the Serial Number of the device to open (Optionally NULL).
  -> IO (BG.Ptr SDL_hid_device)
sDL_hid_open = hs_bindgen_4dc258d14565e3b1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_open_path@
foreign import ccall safe "hs_bindgen_c079ea49eff1706e"
  hs_bindgen_c079ea49eff1706e_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_open_path@
hs_bindgen_c079ea49eff1706e
  :: PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr SDL_hid_device)
hs_bindgen_c079ea49eff1706e =
  BG.fromFFIType hs_bindgen_c079ea49eff1706e_base

-- | Open a HID device by its path name.
--
--     The path name be determined by calling @SDL_hid_enumerate()@, or a platform-specific path name can be used (eg: \/dev\/hidraw0 on Linux).
--
--     [Returns]: a pointer to a 'SDL_hid_device' object on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_open_path@, defined at @SDL3\/SDL_hidapi.h 285:46@
sDL_hid_open_path
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path name of the device to open.
  -> IO (BG.Ptr SDL_hid_device)
sDL_hid_open_path = hs_bindgen_c079ea49eff1706e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_properties@
foreign import ccall safe "hs_bindgen_18716020d09fa299"
  hs_bindgen_18716020d09fa299_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_properties@
hs_bindgen_18716020d09fa299
  :: BG.Ptr SDL_hid_device
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_18716020d09fa299 =
  BG.fromFFIType hs_bindgen_18716020d09fa299_base

-- | Get the properties associated with an 'SDL_hid_device'.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER'@: the libusb_device_handle associated with the device, if it was opened using libusb.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_hid_get_properties@, defined at @SDL3\/SDL_hidapi.h 301:46@
sDL_hid_get_properties
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_hid_get_properties = hs_bindgen_18716020d09fa299

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_write@
foreign import ccall safe "hs_bindgen_7ffa302bd453f29d"
  hs_bindgen_7ffa302bd453f29d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_write@
hs_bindgen_7ffa302bd453f29d
  :: BG.Ptr SDL_hid_device
  -> PtrConst.PtrConst BG.CUChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_7ffa302bd453f29d =
  BG.fromFFIType hs_bindgen_7ffa302bd453f29d_base

-- | Write an Output report to a HID device.
--
--     The first byte of @data@ must contain the Report ID. For devices which only support a single report, this must be set to 0x0. The remaining bytes contain the report data. Since the Report ID is mandatory, calls to @SDL_hid_write()@ will always contain one more byte than the report contains. For example, if a hid report is 16 bytes long, 17 bytes must be passed to @SDL_hid_write()@, the Report ID (or 0x0, for devices with a single report), followed by the report data (16 bytes). In this example, the length passed in would be 17.
--
--     @SDL_hid_write()@ will send the data on the first OUT endpoint, if one exists. If it does not, it will send the data through the Control Endpoint (Endpoint 0).
--
--     [Returns]: the actual number of bytes written and -1 on on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_write@, defined at @SDL3\/SDL_hidapi.h 330:33@
sDL_hid_write
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> PtrConst.PtrConst BG.CUChar
  -- ^
  --
  --           [@data@]: the data to send, including the report number as the first byte.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@length@]: the length in bytes of the data to send.
  -> IO BG.CInt
sDL_hid_write = hs_bindgen_7ffa302bd453f29d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_read_timeout@
foreign import ccall safe "hs_bindgen_a9bb09f6978bf010"
  hs_bindgen_a9bb09f6978bf010_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_read_timeout@
hs_bindgen_a9bb09f6978bf010
  :: BG.Ptr SDL_hid_device
  -> BG.Ptr BG.CUChar
  -> HsBindgen.Runtime.LibC.CSize
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_a9bb09f6978bf010 =
  BG.fromFFIType hs_bindgen_a9bb09f6978bf010_base

-- | Read an Input report from a HID device with timeout.
--
--     Input reports are returned to the host through the INTERRUPT IN endpoint. The first byte will contain the Report number if the device uses numbered reports.
--
--     [Returns]: the actual number of bytes read and -1 on on failure; call SDL_GetError() for more information. If no packet was available to be read within the timeout period, this function returns 0.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_read_timeout@, defined at @SDL3\/SDL_hidapi.h 351:33@
sDL_hid_read_timeout
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@data@]: a buffer to put the read data into.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@length@]: the number of bytes to read. For devices with multiple reports, make sure to read an extra byte for the report number.
  -> BG.CInt
  -- ^
  --
  --           [@milliseconds@]: timeout in milliseconds or -1 for blocking wait.
  -> IO BG.CInt
sDL_hid_read_timeout = hs_bindgen_a9bb09f6978bf010

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_read@
foreign import ccall safe "hs_bindgen_71bc97f6f0149b6b"
  hs_bindgen_71bc97f6f0149b6b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_read@
hs_bindgen_71bc97f6f0149b6b
  :: BG.Ptr SDL_hid_device
  -> BG.Ptr BG.CUChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_71bc97f6f0149b6b =
  BG.fromFFIType hs_bindgen_71bc97f6f0149b6b_base

-- | Read an Input report from a HID device.
--
--     Input reports are returned to the host through the INTERRUPT IN endpoint. The first byte will contain the Report number if the device uses numbered reports.
--
--     [Returns]: the actual number of bytes read and -1 on failure; call SDL_GetError() for more information. If no packet was available to be read and the handle is in non-blocking mode, this function returns 0.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_read@, defined at @SDL3\/SDL_hidapi.h 372:33@
sDL_hid_read
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@data@]: a buffer to put the read data into.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@length@]: the number of bytes to read. For devices with multiple reports, make sure to read an extra byte for the report number.
  -> IO BG.CInt
sDL_hid_read = hs_bindgen_71bc97f6f0149b6b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_set_nonblocking@
foreign import ccall safe "hs_bindgen_a4718c506d2c7f0f"
  hs_bindgen_a4718c506d2c7f0f_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_set_nonblocking@
hs_bindgen_a4718c506d2c7f0f
  :: BG.Ptr SDL_hid_device
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_a4718c506d2c7f0f =
  BG.fromFFIType hs_bindgen_a4718c506d2c7f0f_base

-- | Set the device handle to be non-blocking.
--
--     In non-blocking mode calls to @SDL_hid_read()@ will return immediately with a value of 0 if there is no data to be read. In blocking mode, @SDL_hid_read()@ will wait (block) until there is data to read before returning.
--
--     Nonblocking can be turned on and off at any time.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_set_nonblocking@, defined at @SDL3\/SDL_hidapi.h 391:33@
sDL_hid_set_nonblocking
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> BG.CInt
  -- ^
  --
  --           [@nonblock@]: enable or not the nonblocking reads - 1 to enable nonblocking - 0 to disable nonblocking.
  -> IO BG.CInt
sDL_hid_set_nonblocking = hs_bindgen_a4718c506d2c7f0f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_send_feature_report@
foreign import ccall safe "hs_bindgen_3f1829d40ff45783"
  hs_bindgen_3f1829d40ff45783_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_send_feature_report@
hs_bindgen_3f1829d40ff45783
  :: BG.Ptr SDL_hid_device
  -> PtrConst.PtrConst BG.CUChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_3f1829d40ff45783 =
  BG.fromFFIType hs_bindgen_3f1829d40ff45783_base

-- | Send a Feature report to the device.
--
--     Feature reports are sent over the Control endpoint as a Set_Report transfer. The first byte of @data@ must contain the Report ID. For devices which only support a single report, this must be set to 0x0. The remaining bytes contain the report data. Since the Report ID is mandatory, calls to @SDL_hid_send_feature_report()@ will always contain one more byte than the report contains. For example, if a hid report is 16 bytes long, 17 bytes must be passed to @SDL_hid_send_feature_report()@: the Report ID (or 0x0, for devices which do not use numbered reports), followed by the report data (16 bytes). In this example, the length passed in would be 17.
--
--     [Returns]: the actual number of bytes written and -1 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_send_feature_report@, defined at @SDL3\/SDL_hidapi.h 416:33@
sDL_hid_send_feature_report
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> PtrConst.PtrConst BG.CUChar
  -- ^
  --
  --           [@data@]: the data to send, including the report number as the first byte.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@length@]: the length in bytes of the data to send, including the report number.
  -> IO BG.CInt
sDL_hid_send_feature_report =
  hs_bindgen_3f1829d40ff45783

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_feature_report@
foreign import ccall safe "hs_bindgen_9bc7b92776c7a78c"
  hs_bindgen_9bc7b92776c7a78c_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_feature_report@
hs_bindgen_9bc7b92776c7a78c
  :: BG.Ptr SDL_hid_device
  -> BG.Ptr BG.CUChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_9bc7b92776c7a78c =
  BG.fromFFIType hs_bindgen_9bc7b92776c7a78c_base

-- | Get a feature report from a HID device.
--
--     Set the first byte of @data@ to the Report ID of the report to be read. Make sure to allow space for this extra byte in @data@. Upon return, the first byte will still contain the Report ID, and the report data will start in data[1].
--
--     [Returns]: the number of bytes read plus one for the report ID (which is still in the first byte), or -1 on on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_feature_report@, defined at @SDL3\/SDL_hidapi.h 439:33@
sDL_hid_get_feature_report
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@data@]: a buffer to put the read data into, including the Report ID. Set the first byte of @data@ to the Report ID of the report to be read, or set it to zero if your device does not use numbered reports.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@length@]: the number of bytes to read, including an extra byte for the report ID. The buffer can be longer than the actual report.
  -> IO BG.CInt
sDL_hid_get_feature_report =
  hs_bindgen_9bc7b92776c7a78c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_input_report@
foreign import ccall safe "hs_bindgen_71a9fd2459b81356"
  hs_bindgen_71a9fd2459b81356_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_input_report@
hs_bindgen_71a9fd2459b81356
  :: BG.Ptr SDL_hid_device
  -> BG.Ptr BG.CUChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_71a9fd2459b81356 =
  BG.fromFFIType hs_bindgen_71a9fd2459b81356_base

-- | Get an input report from a HID device.
--
--     Set the first byte of @data@ to the Report ID of the report to be read. Make sure to allow space for this extra byte in @data@. Upon return, the first byte will still contain the Report ID, and the report data will start in data[1].
--
--     [Returns]: the number of bytes read plus one for the report ID (which is still in the first byte), or -1 on on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_input_report@, defined at @SDL3\/SDL_hidapi.h 462:33@
sDL_hid_get_input_report
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@data@]: a buffer to put the read data into, including the Report ID. Set the first byte of @data@ to the Report ID of the report to be read, or set it to zero if your device does not use numbered reports.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@length@]: the number of bytes to read, including an extra byte for the report ID. The buffer can be longer than the actual report.
  -> IO BG.CInt
sDL_hid_get_input_report =
  hs_bindgen_71a9fd2459b81356

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_close@
foreign import ccall safe "hs_bindgen_ac431d883efee041"
  hs_bindgen_ac431d883efee041_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_close@
hs_bindgen_ac431d883efee041
  :: BG.Ptr SDL_hid_device
  -> IO BG.CInt
hs_bindgen_ac431d883efee041 =
  BG.fromFFIType hs_bindgen_ac431d883efee041_base

-- | Close a HID device.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_close@, defined at @SDL3\/SDL_hidapi.h 473:33@
sDL_hid_close
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> IO BG.CInt
sDL_hid_close = hs_bindgen_ac431d883efee041

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_manufacturer_string@
foreign import ccall safe "hs_bindgen_d928c5175963fa2b"
  hs_bindgen_d928c5175963fa2b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_manufacturer_string@
hs_bindgen_d928c5175963fa2b
  :: BG.Ptr SDL_hid_device
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_d928c5175963fa2b =
  BG.fromFFIType hs_bindgen_d928c5175963fa2b_base

-- | Get The Manufacturer String from a HID device.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_manufacturer_string@, defined at @SDL3\/SDL_hidapi.h 486:33@
sDL_hid_get_manufacturer_string
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@string@]: a wide string buffer to put the data into.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: the length of the buffer in multiples of wchar_t.
  -> IO BG.CInt
sDL_hid_get_manufacturer_string =
  hs_bindgen_d928c5175963fa2b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_product_string@
foreign import ccall safe "hs_bindgen_6efd06cbd0be2ac4"
  hs_bindgen_6efd06cbd0be2ac4_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_product_string@
hs_bindgen_6efd06cbd0be2ac4
  :: BG.Ptr SDL_hid_device
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_6efd06cbd0be2ac4 =
  BG.fromFFIType hs_bindgen_6efd06cbd0be2ac4_base

-- | Get The Product String from a HID device.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_product_string@, defined at @SDL3\/SDL_hidapi.h 499:33@
sDL_hid_get_product_string
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@string@]: a wide string buffer to put the data into.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: the length of the buffer in multiples of wchar_t.
  -> IO BG.CInt
sDL_hid_get_product_string =
  hs_bindgen_6efd06cbd0be2ac4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_serial_number_string@
foreign import ccall safe "hs_bindgen_d39732d6a3cf4069"
  hs_bindgen_d39732d6a3cf4069_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_serial_number_string@
hs_bindgen_d39732d6a3cf4069
  :: BG.Ptr SDL_hid_device
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_d39732d6a3cf4069 =
  BG.fromFFIType hs_bindgen_d39732d6a3cf4069_base

-- | Get The Serial Number String from a HID device.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_serial_number_string@, defined at @SDL3\/SDL_hidapi.h 512:33@
sDL_hid_get_serial_number_string
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@string@]: a wide string buffer to put the data into.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: the length of the buffer in multiples of wchar_t.
  -> IO BG.CInt
sDL_hid_get_serial_number_string =
  hs_bindgen_d39732d6a3cf4069

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_indexed_string@
foreign import ccall safe "hs_bindgen_b1f4db11ff770839"
  hs_bindgen_b1f4db11ff770839_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_indexed_string@
hs_bindgen_b1f4db11ff770839
  :: BG.Ptr SDL_hid_device
  -> BG.CInt
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_b1f4db11ff770839 =
  BG.fromFFIType hs_bindgen_b1f4db11ff770839_base

-- | Get a string from a HID device, based on its string index.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_indexed_string@, defined at @SDL3\/SDL_hidapi.h 526:33@
sDL_hid_get_indexed_string
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> BG.CInt
  -- ^
  --
  --           [@string_index@]: the index of the string to get.
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@string@]: a wide string buffer to put the data into.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: the length of the buffer in multiples of wchar_t.
  -> IO BG.CInt
sDL_hid_get_indexed_string =
  hs_bindgen_b1f4db11ff770839

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_device_info@
foreign import ccall safe "hs_bindgen_16acf6e683b8f908"
  hs_bindgen_16acf6e683b8f908_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_device_info@
hs_bindgen_16acf6e683b8f908
  :: BG.Ptr SDL_hid_device
  -> IO (BG.Ptr SDL_hid_device_info)
hs_bindgen_16acf6e683b8f908 =
  BG.fromFFIType hs_bindgen_16acf6e683b8f908_base

-- | Get the device info from a HID device.
--
--     [Returns]: a pointer to the 'SDL_hid_device_info' for this hid_device or NULL on failure; call SDL_GetError() for more information. This struct is valid until the device is closed with @SDL_hid_close()@.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_device_info@, defined at @SDL3\/SDL_hidapi.h 538:51@
sDL_hid_get_device_info
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> IO (BG.Ptr SDL_hid_device_info)
sDL_hid_get_device_info = hs_bindgen_16acf6e683b8f908

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_report_descriptor@
foreign import ccall safe "hs_bindgen_a73f2ef51699b1a7"
  hs_bindgen_a73f2ef51699b1a7_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_get_report_descriptor@
hs_bindgen_a73f2ef51699b1a7
  :: BG.Ptr SDL_hid_device
  -> BG.Ptr BG.CUChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_a73f2ef51699b1a7 =
  BG.fromFFIType hs_bindgen_a73f2ef51699b1a7_base

-- | Get a report descriptor from a HID device.
--
--     User has to provide a preallocated buffer where descriptor will be copied to. The recommended size for a preallocated buffer is 4096 bytes.
--
--     [Returns]: the number of bytes actually copied or -1 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_report_descriptor@, defined at @SDL3\/SDL_hidapi.h 554:33@
sDL_hid_get_report_descriptor
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @SDL_hid_open()@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@buf@]: the buffer to copy descriptor into.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@buf_size@]: the size of the buffer in bytes.
  -> IO BG.CInt
sDL_hid_get_report_descriptor =
  hs_bindgen_a73f2ef51699b1a7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_ble_scan@
foreign import ccall safe "hs_bindgen_5f872b3d74ffb765"
  hs_bindgen_5f872b3d74ffb765_base
    :: BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_Safe_SDL_hid_ble_scan@
hs_bindgen_5f872b3d74ffb765
  :: BG.CBool
  -> IO ()
hs_bindgen_5f872b3d74ffb765 =
  BG.fromFFIType hs_bindgen_5f872b3d74ffb765_base

-- | Start or stop a BLE scan on iOS and tvOS to pair Steam Controllers.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_ble_scan@, defined at @SDL3\/SDL_hidapi.h 563:34@
sDL_hid_ble_scan
  :: BG.CBool
  -- ^
  --
  --           [@active@]: true to start the scan, false to stop the scan.
  -> IO ()
sDL_hid_ble_scan = hs_bindgen_5f872b3d74ffb765

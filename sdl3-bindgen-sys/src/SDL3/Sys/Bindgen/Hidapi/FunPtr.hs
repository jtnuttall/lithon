{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Hidapi.FunPtr (
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_init,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_exit,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_device_change_count,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_enumerate,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_free_enumeration,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_open,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_open_path,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_get_properties,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_write,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_read_timeout,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_read,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_set_nonblocking,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_send_feature_report,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_get_feature_report,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_get_input_report,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_close,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_get_manufacturer_string,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_get_product_string,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_get_serial_number_string,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_get_indexed_string,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_get_device_info,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_get_report_descriptor,
  SDL3.Sys.Bindgen.Hidapi.FunPtr.sDL_hid_ble_scan,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_init */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_32091c4e86355dc7 (void)) (void)"
         , "{"
         , "  return &SDL_hid_init;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_exit */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_26665e772cf695e7 (void)) (void)"
         , "{"
         , "  return &SDL_hid_exit;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_device_change_count */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_1ed9703a6ccb5ef9 (void)) (void)"
         , "{"
         , "  return &SDL_hid_device_change_count;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_enumerate */"
         , "__attribute__ ((const))"
         , "SDL_hid_device_info *(*hs_bindgen_4922fe8bf9d9ed1b (void)) ("
         , "  unsigned short arg1,"
         , "  unsigned short arg2"
         , ")"
         , "{"
         , "  return &SDL_hid_enumerate;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_free_enumeration */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_3b866ca94af10a38 (void)) ("
         , "  SDL_hid_device_info *arg1"
         , ")"
         , "{"
         , "  return &SDL_hid_free_enumeration;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_open */"
         , "__attribute__ ((const))"
         , "SDL_hid_device *(*hs_bindgen_8d0a3f3bb4b21256 (void)) ("
         , "  unsigned short arg1,"
         , "  unsigned short arg2,"
         , "  wchar_t const *arg3"
         , ")"
         , "{"
         , "  return &SDL_hid_open;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_open_path */"
         , "__attribute__ ((const))"
         , "SDL_hid_device *(*hs_bindgen_39c4427d9dd0caf0 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_hid_open_path;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef Uint32 SDL_PropertiesID;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_properties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_4b11bd7f6e7541a7 (void)) ("
         , "  SDL_hid_device *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_hid_get_properties;"
         , "#else"
         , "  SDL_SetError(\"SDL_hid_get_properties requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_write */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_1bf3f0f5190069e0 (void)) ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_hid_write;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_read_timeout */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_5383d32d2b5eeb41 (void)) ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char *arg2,"
         , "  size_t arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "  return &SDL_hid_read_timeout;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_read */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_7c7263baa49b4db7 (void)) ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_hid_read;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_set_nonblocking */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_bc3545d8ad76b094 (void)) ("
         , "  SDL_hid_device *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_hid_set_nonblocking;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_send_feature_report */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_4dc350ff8dbbd851 (void)) ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_hid_send_feature_report;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_feature_report */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_d11cee38ea38b8b0 (void)) ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_hid_get_feature_report;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_input_report */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_f7e6c98c847d43b6 (void)) ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_hid_get_input_report;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_close */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_a3778a783d0b375c (void)) ("
         , "  SDL_hid_device *arg1"
         , ")"
         , "{"
         , "  return &SDL_hid_close;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_manufacturer_string */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_2886098b9152b5a2 (void)) ("
         , "  SDL_hid_device *arg1,"
         , "  wchar_t *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_hid_get_manufacturer_string;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_product_string */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_e9dcf914acc87392 (void)) ("
         , "  SDL_hid_device *arg1,"
         , "  wchar_t *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_hid_get_product_string;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_serial_number_string */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_6d6557d49ee90dad (void)) ("
         , "  SDL_hid_device *arg1,"
         , "  wchar_t *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_hid_get_serial_number_string;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_indexed_string */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_5cef67d9ce2e1563 (void)) ("
         , "  SDL_hid_device *arg1,"
         , "  signed int arg2,"
         , "  wchar_t *arg3,"
         , "  size_t arg4"
         , ")"
         , "{"
         , "  return &SDL_hid_get_indexed_string;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_device_info */"
         , "__attribute__ ((const))"
         , "SDL_hid_device_info *(*hs_bindgen_9b2d929812d327f4 (void)) ("
         , "  SDL_hid_device *arg1"
         , ")"
         , "{"
         , "  return &SDL_hid_get_device_info;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_report_descriptor */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_056ff18230bbb5e2 (void)) ("
         , "  SDL_hid_device *arg1,"
         , "  unsigned char *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_hid_get_report_descriptor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_ble_scan */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_7634f6f83062373e (void)) ("
         , "  _Bool arg1"
         , ")"
         , "{"
         , "  return &SDL_hid_ble_scan;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_init@
foreign import ccall unsafe "hs_bindgen_32091c4e86355dc7"
  hs_bindgen_32091c4e86355dc7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_init@
hs_bindgen_32091c4e86355dc7 :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_32091c4e86355dc7 =
  BG.fromFFIType hs_bindgen_32091c4e86355dc7_base

{-# NOINLINE sDL_hid_init #-}

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
sDL_hid_init :: BG.FunPtr (IO BG.CInt)
sDL_hid_init =
  BG.unsafePerformIO hs_bindgen_32091c4e86355dc7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_exit@
foreign import ccall unsafe "hs_bindgen_26665e772cf695e7"
  hs_bindgen_26665e772cf695e7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_exit@
hs_bindgen_26665e772cf695e7 :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_26665e772cf695e7 =
  BG.fromFFIType hs_bindgen_26665e772cf695e7_base

{-# NOINLINE sDL_hid_exit #-}

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
sDL_hid_exit :: BG.FunPtr (IO BG.CInt)
sDL_hid_exit =
  BG.unsafePerformIO hs_bindgen_26665e772cf695e7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_device_change_count@
foreign import ccall unsafe "hs_bindgen_1ed9703a6ccb5ef9"
  hs_bindgen_1ed9703a6ccb5ef9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_device_change_count@
hs_bindgen_1ed9703a6ccb5ef9 :: IO (BG.FunPtr (IO SDL3.Sys.Bindgen.Stdinc.Uint32))
hs_bindgen_1ed9703a6ccb5ef9 =
  BG.fromFFIType hs_bindgen_1ed9703a6ccb5ef9_base

{-# NOINLINE sDL_hid_device_change_count #-}

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
sDL_hid_device_change_count :: BG.FunPtr (IO SDL3.Sys.Bindgen.Stdinc.Uint32)
sDL_hid_device_change_count =
  BG.unsafePerformIO hs_bindgen_1ed9703a6ccb5ef9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_enumerate@
foreign import ccall unsafe "hs_bindgen_4922fe8bf9d9ed1b"
  hs_bindgen_4922fe8bf9d9ed1b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_enumerate@
hs_bindgen_4922fe8bf9d9ed1b
  :: IO (BG.FunPtr (BG.CUShort -> BG.CUShort -> IO (BG.Ptr SDL_hid_device_info)))
hs_bindgen_4922fe8bf9d9ed1b =
  BG.fromFFIType hs_bindgen_4922fe8bf9d9ed1b_base

{-# NOINLINE sDL_hid_enumerate #-}

-- | Enumerate the HID Devices.
--
--     This function returns a linked list of all the HID devices attached to the system which match vendor_id and product_id. If @vendor_id@ is set to 0 then any vendor matches. If @product_id@ is set to 0 then any product matches. If @vendor_id@ and @product_id@ are both set to 0, then all HID devices will be returned.
--
--     By default SDL will only enumerate controllers, to reduce risk of hanging or crashing on bad drivers, but SDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS can be set to \"0\" to enumerate all HID devices.
--
--     [@vendor_id@]: the Vendor ID (VID) of the types of device to open, or 0 to match any vendor.
--
--     [@product_id@]: the Product ID (PID) of the types of device to open, or 0 to match any product.
--
--     [Returns]: a pointer to a linked list of type 'SDL_hid_device_info', containing information about the HID devices attached to the system, or NULL in the case of failure. Free this linked list by calling @SDL_hid_free_enumeration()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_hid_device_change_count'
--
--     [C declaration]: @SDL_hid_enumerate@, defined at @SDL3\/SDL_hidapi.h 241:51@
sDL_hid_enumerate :: BG.FunPtr (BG.CUShort -> BG.CUShort -> IO (BG.Ptr SDL_hid_device_info))
sDL_hid_enumerate =
  BG.unsafePerformIO hs_bindgen_4922fe8bf9d9ed1b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_free_enumeration@
foreign import ccall unsafe "hs_bindgen_3b866ca94af10a38"
  hs_bindgen_3b866ca94af10a38_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_free_enumeration@
hs_bindgen_3b866ca94af10a38 :: IO (BG.FunPtr (BG.Ptr SDL_hid_device_info -> IO ()))
hs_bindgen_3b866ca94af10a38 =
  BG.fromFFIType hs_bindgen_3b866ca94af10a38_base

{-# NOINLINE sDL_hid_free_enumeration #-}

-- | Free an enumeration linked list.
--
--     This function frees a linked list created by @SDL_hid_enumerate()@.
--
--     [@devs@]: pointer to a list of struct_device returned from @SDL_hid_enumerate()@.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_free_enumeration@, defined at @SDL3\/SDL_hidapi.h 253:34@
sDL_hid_free_enumeration :: BG.FunPtr (BG.Ptr SDL_hid_device_info -> IO ())
sDL_hid_free_enumeration =
  BG.unsafePerformIO hs_bindgen_3b866ca94af10a38

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_open@
foreign import ccall unsafe "hs_bindgen_8d0a3f3bb4b21256"
  hs_bindgen_8d0a3f3bb4b21256_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_open@
hs_bindgen_8d0a3f3bb4b21256
  :: IO
       ( BG.FunPtr
           ( BG.CUShort
             -> BG.CUShort
             -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> IO (BG.Ptr SDL_hid_device)
           )
       )
hs_bindgen_8d0a3f3bb4b21256 =
  BG.fromFFIType hs_bindgen_8d0a3f3bb4b21256_base

{-# NOINLINE sDL_hid_open #-}

-- | Open a HID device using a Vendor ID (VID), Product ID (PID) and optionally a serial number.
--
--     If @serial_number@ is NULL, the first device with the specified VID and PID is opened.
--
--     [@vendor_id@]: the Vendor ID (VID) of the device to open.
--
--     [@product_id@]: the Product ID (PID) of the device to open.
--
--     [@serial_number@]: the Serial Number of the device to open (Optionally NULL).
--
--     [Returns]: a pointer to a 'SDL_hid_device' object on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_open@, defined at @SDL3\/SDL_hidapi.h 271:46@
sDL_hid_open
  :: BG.FunPtr
       ( BG.CUShort
         -> BG.CUShort
         -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> IO (BG.Ptr SDL_hid_device)
       )
sDL_hid_open =
  BG.unsafePerformIO hs_bindgen_8d0a3f3bb4b21256

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_open_path@
foreign import ccall unsafe "hs_bindgen_39c4427d9dd0caf0"
  hs_bindgen_39c4427d9dd0caf0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_open_path@
hs_bindgen_39c4427d9dd0caf0
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_hid_device)))
hs_bindgen_39c4427d9dd0caf0 =
  BG.fromFFIType hs_bindgen_39c4427d9dd0caf0_base

{-# NOINLINE sDL_hid_open_path #-}

-- | Open a HID device by its path name.
--
--     The path name be determined by calling @SDL_hid_enumerate()@, or a platform-specific path name can be used (eg: \/dev\/hidraw0 on Linux).
--
--     [@path@]: the path name of the device to open.
--
--     [Returns]: a pointer to a 'SDL_hid_device' object on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_open_path@, defined at @SDL3\/SDL_hidapi.h 285:46@
sDL_hid_open_path :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_hid_device))
sDL_hid_open_path =
  BG.unsafePerformIO hs_bindgen_39c4427d9dd0caf0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_properties@
foreign import ccall unsafe "hs_bindgen_4b11bd7f6e7541a7"
  hs_bindgen_4b11bd7f6e7541a7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_properties@
hs_bindgen_4b11bd7f6e7541a7
  :: IO (BG.FunPtr (BG.Ptr SDL_hid_device -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_4b11bd7f6e7541a7 =
  BG.fromFFIType hs_bindgen_4b11bd7f6e7541a7_base

{-# NOINLINE sDL_hid_get_properties #-}

-- | Get the properties associated with an 'SDL_hid_device'.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER'@: the libusb_device_handle associated with the device, if it was opened using libusb.
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_hid_get_properties@, defined at @SDL3\/SDL_hidapi.h 301:46@
sDL_hid_get_properties
  :: BG.FunPtr (BG.Ptr SDL_hid_device -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_hid_get_properties =
  BG.unsafePerformIO hs_bindgen_4b11bd7f6e7541a7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_write@
foreign import ccall unsafe "hs_bindgen_1bf3f0f5190069e0"
  hs_bindgen_1bf3f0f5190069e0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_write@
hs_bindgen_1bf3f0f5190069e0
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_hid_device -> PtrConst.PtrConst BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt)
       )
hs_bindgen_1bf3f0f5190069e0 =
  BG.fromFFIType hs_bindgen_1bf3f0f5190069e0_base

{-# NOINLINE sDL_hid_write #-}

-- | Write an Output report to a HID device.
--
--     The first byte of @data@ must contain the Report ID. For devices which only support a single report, this must be set to 0x0. The remaining bytes contain the report data. Since the Report ID is mandatory, calls to @SDL_hid_write()@ will always contain one more byte than the report contains. For example, if a hid report is 16 bytes long, 17 bytes must be passed to @SDL_hid_write()@, the Report ID (or 0x0, for devices with a single report), followed by the report data (16 bytes). In this example, the length passed in would be 17.
--
--     @SDL_hid_write()@ will send the data on the first OUT endpoint, if one exists. If it does not, it will send the data through the Control Endpoint (Endpoint 0).
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [@data@]: the data to send, including the report number as the first byte.
--
--     [@length@]: the length in bytes of the data to send.
--
--     [Returns]: the actual number of bytes written and -1 on on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_write@, defined at @SDL3\/SDL_hidapi.h 330:33@
sDL_hid_write
  :: BG.FunPtr
       (BG.Ptr SDL_hid_device -> PtrConst.PtrConst BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt)
sDL_hid_write =
  BG.unsafePerformIO hs_bindgen_1bf3f0f5190069e0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_read_timeout@
foreign import ccall unsafe "hs_bindgen_5383d32d2b5eeb41"
  hs_bindgen_5383d32d2b5eeb41_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_read_timeout@
hs_bindgen_5383d32d2b5eeb41
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_hid_device -> BG.Ptr BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> BG.CInt -> IO BG.CInt)
       )
hs_bindgen_5383d32d2b5eeb41 =
  BG.fromFFIType hs_bindgen_5383d32d2b5eeb41_base

{-# NOINLINE sDL_hid_read_timeout #-}

-- | Read an Input report from a HID device with timeout.
--
--     Input reports are returned to the host through the INTERRUPT IN endpoint. The first byte will contain the Report number if the device uses numbered reports.
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [@data@]: a buffer to put the read data into.
--
--     [@length@]: the number of bytes to read. For devices with multiple reports, make sure to read an extra byte for the report number.
--
--     [@milliseconds@]: timeout in milliseconds or -1 for blocking wait.
--
--     [Returns]: the actual number of bytes read and -1 on on failure; call SDL_GetError() for more information. If no packet was available to be read within the timeout period, this function returns 0.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_read_timeout@, defined at @SDL3\/SDL_hidapi.h 351:33@
sDL_hid_read_timeout
  :: BG.FunPtr
       (BG.Ptr SDL_hid_device -> BG.Ptr BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> BG.CInt -> IO BG.CInt)
sDL_hid_read_timeout =
  BG.unsafePerformIO hs_bindgen_5383d32d2b5eeb41

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_read@
foreign import ccall unsafe "hs_bindgen_7c7263baa49b4db7"
  hs_bindgen_7c7263baa49b4db7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_read@
hs_bindgen_7c7263baa49b4db7
  :: IO
       (BG.FunPtr (BG.Ptr SDL_hid_device -> BG.Ptr BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt))
hs_bindgen_7c7263baa49b4db7 =
  BG.fromFFIType hs_bindgen_7c7263baa49b4db7_base

{-# NOINLINE sDL_hid_read #-}

-- | Read an Input report from a HID device.
--
--     Input reports are returned to the host through the INTERRUPT IN endpoint. The first byte will contain the Report number if the device uses numbered reports.
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [@data@]: a buffer to put the read data into.
--
--     [@length@]: the number of bytes to read. For devices with multiple reports, make sure to read an extra byte for the report number.
--
--     [Returns]: the actual number of bytes read and -1 on failure; call SDL_GetError() for more information. If no packet was available to be read and the handle is in non-blocking mode, this function returns 0.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_read@, defined at @SDL3\/SDL_hidapi.h 372:33@
sDL_hid_read
  :: BG.FunPtr (BG.Ptr SDL_hid_device -> BG.Ptr BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt)
sDL_hid_read =
  BG.unsafePerformIO hs_bindgen_7c7263baa49b4db7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_set_nonblocking@
foreign import ccall unsafe "hs_bindgen_bc3545d8ad76b094"
  hs_bindgen_bc3545d8ad76b094_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_set_nonblocking@
hs_bindgen_bc3545d8ad76b094 :: IO (BG.FunPtr (BG.Ptr SDL_hid_device -> BG.CInt -> IO BG.CInt))
hs_bindgen_bc3545d8ad76b094 =
  BG.fromFFIType hs_bindgen_bc3545d8ad76b094_base

{-# NOINLINE sDL_hid_set_nonblocking #-}

-- | Set the device handle to be non-blocking.
--
--     In non-blocking mode calls to @SDL_hid_read()@ will return immediately with a value of 0 if there is no data to be read. In blocking mode, @SDL_hid_read()@ will wait (block) until there is data to read before returning.
--
--     Nonblocking can be turned on and off at any time.
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [@nonblock@]: enable or not the nonblocking reads - 1 to enable nonblocking - 0 to disable nonblocking.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_set_nonblocking@, defined at @SDL3\/SDL_hidapi.h 391:33@
sDL_hid_set_nonblocking :: BG.FunPtr (BG.Ptr SDL_hid_device -> BG.CInt -> IO BG.CInt)
sDL_hid_set_nonblocking =
  BG.unsafePerformIO hs_bindgen_bc3545d8ad76b094

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_send_feature_report@
foreign import ccall unsafe "hs_bindgen_4dc350ff8dbbd851"
  hs_bindgen_4dc350ff8dbbd851_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_send_feature_report@
hs_bindgen_4dc350ff8dbbd851
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_hid_device -> PtrConst.PtrConst BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt)
       )
hs_bindgen_4dc350ff8dbbd851 =
  BG.fromFFIType hs_bindgen_4dc350ff8dbbd851_base

{-# NOINLINE sDL_hid_send_feature_report #-}

-- | Send a Feature report to the device.
--
--     Feature reports are sent over the Control endpoint as a Set_Report transfer. The first byte of @data@ must contain the Report ID. For devices which only support a single report, this must be set to 0x0. The remaining bytes contain the report data. Since the Report ID is mandatory, calls to @SDL_hid_send_feature_report()@ will always contain one more byte than the report contains. For example, if a hid report is 16 bytes long, 17 bytes must be passed to @SDL_hid_send_feature_report()@: the Report ID (or 0x0, for devices which do not use numbered reports), followed by the report data (16 bytes). In this example, the length passed in would be 17.
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [@data@]: the data to send, including the report number as the first byte.
--
--     [@length@]: the length in bytes of the data to send, including the report number.
--
--     [Returns]: the actual number of bytes written and -1 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_send_feature_report@, defined at @SDL3\/SDL_hidapi.h 416:33@
sDL_hid_send_feature_report
  :: BG.FunPtr
       (BG.Ptr SDL_hid_device -> PtrConst.PtrConst BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt)
sDL_hid_send_feature_report =
  BG.unsafePerformIO hs_bindgen_4dc350ff8dbbd851

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_feature_report@
foreign import ccall unsafe "hs_bindgen_d11cee38ea38b8b0"
  hs_bindgen_d11cee38ea38b8b0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_feature_report@
hs_bindgen_d11cee38ea38b8b0
  :: IO
       (BG.FunPtr (BG.Ptr SDL_hid_device -> BG.Ptr BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt))
hs_bindgen_d11cee38ea38b8b0 =
  BG.fromFFIType hs_bindgen_d11cee38ea38b8b0_base

{-# NOINLINE sDL_hid_get_feature_report #-}

-- | Get a feature report from a HID device.
--
--     Set the first byte of @data@ to the Report ID of the report to be read. Make sure to allow space for this extra byte in @data@. Upon return, the first byte will still contain the Report ID, and the report data will start in data[1].
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [@data@]: a buffer to put the read data into, including the Report ID. Set the first byte of @data@ to the Report ID of the report to be read, or set it to zero if your device does not use numbered reports.
--
--     [@length@]: the number of bytes to read, including an extra byte for the report ID. The buffer can be longer than the actual report.
--
--     [Returns]: the number of bytes read plus one for the report ID (which is still in the first byte), or -1 on on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_feature_report@, defined at @SDL3\/SDL_hidapi.h 439:33@
sDL_hid_get_feature_report
  :: BG.FunPtr (BG.Ptr SDL_hid_device -> BG.Ptr BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt)
sDL_hid_get_feature_report =
  BG.unsafePerformIO hs_bindgen_d11cee38ea38b8b0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_input_report@
foreign import ccall unsafe "hs_bindgen_f7e6c98c847d43b6"
  hs_bindgen_f7e6c98c847d43b6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_input_report@
hs_bindgen_f7e6c98c847d43b6
  :: IO
       (BG.FunPtr (BG.Ptr SDL_hid_device -> BG.Ptr BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt))
hs_bindgen_f7e6c98c847d43b6 =
  BG.fromFFIType hs_bindgen_f7e6c98c847d43b6_base

{-# NOINLINE sDL_hid_get_input_report #-}

-- | Get an input report from a HID device.
--
--     Set the first byte of @data@ to the Report ID of the report to be read. Make sure to allow space for this extra byte in @data@. Upon return, the first byte will still contain the Report ID, and the report data will start in data[1].
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [@data@]: a buffer to put the read data into, including the Report ID. Set the first byte of @data@ to the Report ID of the report to be read, or set it to zero if your device does not use numbered reports.
--
--     [@length@]: the number of bytes to read, including an extra byte for the report ID. The buffer can be longer than the actual report.
--
--     [Returns]: the number of bytes read plus one for the report ID (which is still in the first byte), or -1 on on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_input_report@, defined at @SDL3\/SDL_hidapi.h 462:33@
sDL_hid_get_input_report
  :: BG.FunPtr (BG.Ptr SDL_hid_device -> BG.Ptr BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt)
sDL_hid_get_input_report =
  BG.unsafePerformIO hs_bindgen_f7e6c98c847d43b6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_close@
foreign import ccall unsafe "hs_bindgen_a3778a783d0b375c"
  hs_bindgen_a3778a783d0b375c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_close@
hs_bindgen_a3778a783d0b375c :: IO (BG.FunPtr (BG.Ptr SDL_hid_device -> IO BG.CInt))
hs_bindgen_a3778a783d0b375c =
  BG.fromFFIType hs_bindgen_a3778a783d0b375c_base

{-# NOINLINE sDL_hid_close #-}

-- | Close a HID device.
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_close@, defined at @SDL3\/SDL_hidapi.h 473:33@
sDL_hid_close :: BG.FunPtr (BG.Ptr SDL_hid_device -> IO BG.CInt)
sDL_hid_close =
  BG.unsafePerformIO hs_bindgen_a3778a783d0b375c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_manufacturer_string@
foreign import ccall unsafe "hs_bindgen_2886098b9152b5a2"
  hs_bindgen_2886098b9152b5a2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_manufacturer_string@
hs_bindgen_2886098b9152b5a2
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_hid_device
             -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO BG.CInt
           )
       )
hs_bindgen_2886098b9152b5a2 =
  BG.fromFFIType hs_bindgen_2886098b9152b5a2_base

{-# NOINLINE sDL_hid_get_manufacturer_string #-}

-- | Get The Manufacturer String from a HID device.
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [@string@]: a wide string buffer to put the data into.
--
--     [@maxlen@]: the length of the buffer in multiples of wchar_t.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_manufacturer_string@, defined at @SDL3\/SDL_hidapi.h 486:33@
sDL_hid_get_manufacturer_string
  :: BG.FunPtr
       ( BG.Ptr SDL_hid_device
         -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO BG.CInt
       )
sDL_hid_get_manufacturer_string =
  BG.unsafePerformIO hs_bindgen_2886098b9152b5a2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_product_string@
foreign import ccall unsafe "hs_bindgen_e9dcf914acc87392"
  hs_bindgen_e9dcf914acc87392_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_product_string@
hs_bindgen_e9dcf914acc87392
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_hid_device
             -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO BG.CInt
           )
       )
hs_bindgen_e9dcf914acc87392 =
  BG.fromFFIType hs_bindgen_e9dcf914acc87392_base

{-# NOINLINE sDL_hid_get_product_string #-}

-- | Get The Product String from a HID device.
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [@string@]: a wide string buffer to put the data into.
--
--     [@maxlen@]: the length of the buffer in multiples of wchar_t.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_product_string@, defined at @SDL3\/SDL_hidapi.h 499:33@
sDL_hid_get_product_string
  :: BG.FunPtr
       ( BG.Ptr SDL_hid_device
         -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO BG.CInt
       )
sDL_hid_get_product_string =
  BG.unsafePerformIO hs_bindgen_e9dcf914acc87392

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_serial_number_string@
foreign import ccall unsafe "hs_bindgen_6d6557d49ee90dad"
  hs_bindgen_6d6557d49ee90dad_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_serial_number_string@
hs_bindgen_6d6557d49ee90dad
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_hid_device
             -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO BG.CInt
           )
       )
hs_bindgen_6d6557d49ee90dad =
  BG.fromFFIType hs_bindgen_6d6557d49ee90dad_base

{-# NOINLINE sDL_hid_get_serial_number_string #-}

-- | Get The Serial Number String from a HID device.
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [@string@]: a wide string buffer to put the data into.
--
--     [@maxlen@]: the length of the buffer in multiples of wchar_t.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_serial_number_string@, defined at @SDL3\/SDL_hidapi.h 512:33@
sDL_hid_get_serial_number_string
  :: BG.FunPtr
       ( BG.Ptr SDL_hid_device
         -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO BG.CInt
       )
sDL_hid_get_serial_number_string =
  BG.unsafePerformIO hs_bindgen_6d6557d49ee90dad

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_indexed_string@
foreign import ccall unsafe "hs_bindgen_5cef67d9ce2e1563"
  hs_bindgen_5cef67d9ce2e1563_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_indexed_string@
hs_bindgen_5cef67d9ce2e1563
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_hid_device
             -> BG.CInt
             -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO BG.CInt
           )
       )
hs_bindgen_5cef67d9ce2e1563 =
  BG.fromFFIType hs_bindgen_5cef67d9ce2e1563_base

{-# NOINLINE sDL_hid_get_indexed_string #-}

-- | Get a string from a HID device, based on its string index.
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [@string_index@]: the index of the string to get.
--
--     [@string@]: a wide string buffer to put the data into.
--
--     [@maxlen@]: the length of the buffer in multiples of wchar_t.
--
--     [Returns]: 0 on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_indexed_string@, defined at @SDL3\/SDL_hidapi.h 526:33@
sDL_hid_get_indexed_string
  :: BG.FunPtr
       ( BG.Ptr SDL_hid_device
         -> BG.CInt
         -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO BG.CInt
       )
sDL_hid_get_indexed_string =
  BG.unsafePerformIO hs_bindgen_5cef67d9ce2e1563

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_device_info@
foreign import ccall unsafe "hs_bindgen_9b2d929812d327f4"
  hs_bindgen_9b2d929812d327f4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_device_info@
hs_bindgen_9b2d929812d327f4
  :: IO (BG.FunPtr (BG.Ptr SDL_hid_device -> IO (BG.Ptr SDL_hid_device_info)))
hs_bindgen_9b2d929812d327f4 =
  BG.fromFFIType hs_bindgen_9b2d929812d327f4_base

{-# NOINLINE sDL_hid_get_device_info #-}

-- | Get the device info from a HID device.
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [Returns]: a pointer to the 'SDL_hid_device_info' for this hid_device or NULL on failure; call SDL_GetError() for more information. This struct is valid until the device is closed with @SDL_hid_close()@.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_device_info@, defined at @SDL3\/SDL_hidapi.h 538:51@
sDL_hid_get_device_info :: BG.FunPtr (BG.Ptr SDL_hid_device -> IO (BG.Ptr SDL_hid_device_info))
sDL_hid_get_device_info =
  BG.unsafePerformIO hs_bindgen_9b2d929812d327f4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_report_descriptor@
foreign import ccall unsafe "hs_bindgen_056ff18230bbb5e2"
  hs_bindgen_056ff18230bbb5e2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_get_report_descriptor@
hs_bindgen_056ff18230bbb5e2
  :: IO
       (BG.FunPtr (BG.Ptr SDL_hid_device -> BG.Ptr BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt))
hs_bindgen_056ff18230bbb5e2 =
  BG.fromFFIType hs_bindgen_056ff18230bbb5e2_base

{-# NOINLINE sDL_hid_get_report_descriptor #-}

-- | Get a report descriptor from a HID device.
--
--     User has to provide a preallocated buffer where descriptor will be copied to. The recommended size for a preallocated buffer is 4096 bytes.
--
--     [@dev@]: a device handle returned from @SDL_hid_open()@.
--
--     [@buf@]: the buffer to copy descriptor into.
--
--     [@buf_size@]: the size of the buffer in bytes.
--
--     [Returns]: the number of bytes actually copied or -1 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_get_report_descriptor@, defined at @SDL3\/SDL_hidapi.h 554:33@
sDL_hid_get_report_descriptor
  :: BG.FunPtr (BG.Ptr SDL_hid_device -> BG.Ptr BG.CUChar -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt)
sDL_hid_get_report_descriptor =
  BG.unsafePerformIO hs_bindgen_056ff18230bbb5e2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_ble_scan@
foreign import ccall unsafe "hs_bindgen_7634f6f83062373e"
  hs_bindgen_7634f6f83062373e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Hidapi_get_SDL_hid_ble_scan@
hs_bindgen_7634f6f83062373e :: IO (BG.FunPtr (BG.CBool -> IO ()))
hs_bindgen_7634f6f83062373e =
  BG.fromFFIType hs_bindgen_7634f6f83062373e_base

{-# NOINLINE sDL_hid_ble_scan #-}

-- | Start or stop a BLE scan on iOS and tvOS to pair Steam Controllers.
--
--     [@active@]: true to start the scan, false to stop the scan.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_hid_ble_scan@, defined at @SDL3\/SDL_hidapi.h 563:34@
sDL_hid_ble_scan :: BG.FunPtr (BG.CBool -> IO ())
sDL_hid_ble_scan =
  BG.unsafePerformIO hs_bindgen_7634f6f83062373e

-- | Header file for SDL HIDAPI functions.
--
--     This is an adaptation of the original HIDAPI interface by Alan Ott, and includes source code licensed under the following license:
--
--     @
--     HIDAPI - Multi-Platform library for
--     communication with HID devices.
--
--     Copyright 2009, Alan Ott, Signal 11 Software.
--     All Rights Reserved.
--
--     This software may be used by anyone for any reason so
--     long as the copyright notice in the source files
--     remains intact.
--     @
--
--     (Note that this license is the same as item three of SDL\'s zlib license, so it adds no new requirements on the user.)
--
--     If you would like a version of SDL without this code, you can build SDL with SDL_HIDAPI_DISABLED defined to 1. You might want to do this for example on iOS or tvOS to avoid a dependency on the CoreBluetooth framework. An opaque handle representing an open HID device.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Hidapi.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Hidapi (
  module SDL3.Sys.Bindgen.Hidapi,

  -- * Function aliases
  SDL3.Sys.Hidapi.hidInit,
  SDL3.Sys.Hidapi.hidInitSafe,
  SDL3.Sys.Hidapi.hidExit,
  SDL3.Sys.Hidapi.hidExitSafe,
  SDL3.Sys.Hidapi.hidDeviceChangeCount,
  SDL3.Sys.Hidapi.hidDeviceChangeCountSafe,
  SDL3.Sys.Hidapi.hidEnumerate,
  SDL3.Sys.Hidapi.hidEnumerateSafe,
  SDL3.Sys.Hidapi.hidFreeEnumeration,
  SDL3.Sys.Hidapi.hidFreeEnumerationSafe,
  SDL3.Sys.Hidapi.hidOpen,
  SDL3.Sys.Hidapi.hidOpenSafe,
  SDL3.Sys.Hidapi.hidOpenPath,
  SDL3.Sys.Hidapi.hidOpenPathSafe,
  SDL3.Sys.Hidapi.hidGetProperties,
  SDL3.Sys.Hidapi.hidGetPropertiesSafe,
  SDL3.Sys.Hidapi.hidWrite,
  SDL3.Sys.Hidapi.hidWriteSafe,
  SDL3.Sys.Hidapi.hidReadTimeout,
  SDL3.Sys.Hidapi.hidReadTimeoutSafe,
  SDL3.Sys.Hidapi.hidRead,
  SDL3.Sys.Hidapi.hidReadSafe,
  SDL3.Sys.Hidapi.hidSetNonblocking,
  SDL3.Sys.Hidapi.hidSetNonblockingSafe,
  SDL3.Sys.Hidapi.hidSendFeatureReport,
  SDL3.Sys.Hidapi.hidSendFeatureReportSafe,
  SDL3.Sys.Hidapi.hidGetFeatureReport,
  SDL3.Sys.Hidapi.hidGetFeatureReportSafe,
  SDL3.Sys.Hidapi.hidGetInputReport,
  SDL3.Sys.Hidapi.hidGetInputReportSafe,
  SDL3.Sys.Hidapi.hidClose,
  SDL3.Sys.Hidapi.hidCloseSafe,
  SDL3.Sys.Hidapi.hidGetManufacturerString,
  SDL3.Sys.Hidapi.hidGetManufacturerStringSafe,
  SDL3.Sys.Hidapi.hidGetProductString,
  SDL3.Sys.Hidapi.hidGetProductStringSafe,
  SDL3.Sys.Hidapi.hidGetSerialNumberString,
  SDL3.Sys.Hidapi.hidGetSerialNumberStringSafe,
  SDL3.Sys.Hidapi.hidGetIndexedString,
  SDL3.Sys.Hidapi.hidGetIndexedStringSafe,
  SDL3.Sys.Hidapi.hidGetDeviceInfo,
  SDL3.Sys.Hidapi.hidGetDeviceInfoSafe,
  SDL3.Sys.Hidapi.hidGetReportDescriptor,
  SDL3.Sys.Hidapi.hidGetReportDescriptorSafe,
  SDL3.Sys.Hidapi.hidBleScan,
  SDL3.Sys.Hidapi.hidBleScanSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Hidapi
import SDL3.Sys.Bindgen.Hidapi.Safe qualified as Safe
import SDL3.Sys.Bindgen.Hidapi.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified

-- | Initialize the HIDAPI library.
--
--     This function initializes the HIDAPI library. Calling it is not strictly necessary, as it will be called automatically by @'hidEnumerate'@ and any of the SDL_hid_open_*() functions if it is needed. This function should be called at the beginning of execution however, if there is a chance of HIDAPI handles being opened by different threads simultaneously.
--
--     Each call to this function should have a matching call to @'hidExit'@
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'hidExit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_init@.
--                   The safe flavor is 'hidInitSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_init@, defined at @SDL3\/SDL_hidapi.h 177:33@
hidInit :: IO BG.Int32
hidInit = fmap Coerce.coerce Unsafe.sDL_hid_init

-- | Initialize the HIDAPI library.
--
--     This function initializes the HIDAPI library. Calling it is not strictly necessary, as it will be called automatically by @'hidEnumerate'@ and any of the SDL_hid_open_*() functions if it is needed. This function should be called at the beginning of execution however, if there is a chance of HIDAPI handles being opened by different threads simultaneously.
--
--     Each call to this function should have a matching call to @'hidExit'@
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'hidExit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_init@.
--                   The unsafe flavor is 'hidInit'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_init@, defined at @SDL3\/SDL_hidapi.h 177:33@
hidInitSafe :: IO BG.Int32
hidInitSafe = fmap Coerce.coerce Safe.sDL_hid_init

-- | Finalize the HIDAPI library.
--
--     This function frees all of the static data associated with HIDAPI. It should be called at the end of execution to avoid memory leaks.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'hidInit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_exit@.
--                   The safe flavor is 'hidExitSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_exit@, defined at @SDL3\/SDL_hidapi.h 192:33@
hidExit :: IO BG.Int32
hidExit = fmap Coerce.coerce Unsafe.sDL_hid_exit

-- | Finalize the HIDAPI library.
--
--     This function frees all of the static data associated with HIDAPI. It should be called at the end of execution to avoid memory leaks.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'hidInit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_exit@.
--                   The unsafe flavor is 'hidExit'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_exit@, defined at @SDL3\/SDL_hidapi.h 192:33@
hidExitSafe :: IO BG.Int32
hidExitSafe = fmap Coerce.coerce Safe.sDL_hid_exit

-- | Check to see if devices may have been added or removed.
--
--     Enumerating the HID devices is an expensive operation, so you can call this to see if there have been any system device changes since the last call to this function. A change in the counter returned doesn\'t necessarily mean that anything has changed, but you can call @'hidEnumerate'@ to get an updated device list.
--
--     Calling this function for the first time may cause a thread or other system resource to be allocated to track device change notifications.
--
--     [Returns]: a change counter that is incremented with each potential device change, or 0 if device change detection isn\'t available.
--
--     @since 3.2.0
--
--     [See also]: 'hidEnumerate'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_device_change_count@.
--                   The safe flavor is 'hidDeviceChangeCountSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_device_change_count@, defined at @SDL3\/SDL_hidapi.h 213:36@
hidDeviceChangeCount :: IO BG.Word32
hidDeviceChangeCount =
  fmap Coerce.coerce Unsafe.sDL_hid_device_change_count

-- | Check to see if devices may have been added or removed.
--
--     Enumerating the HID devices is an expensive operation, so you can call this to see if there have been any system device changes since the last call to this function. A change in the counter returned doesn\'t necessarily mean that anything has changed, but you can call @'hidEnumerate'@ to get an updated device list.
--
--     Calling this function for the first time may cause a thread or other system resource to be allocated to track device change notifications.
--
--     [Returns]: a change counter that is incremented with each potential device change, or 0 if device change detection isn\'t available.
--
--     @since 3.2.0
--
--     [See also]: 'hidEnumerate'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_device_change_count@.
--                   The unsafe flavor is 'hidDeviceChangeCount'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_device_change_count@, defined at @SDL3\/SDL_hidapi.h 213:36@
hidDeviceChangeCountSafe :: IO BG.Word32
hidDeviceChangeCountSafe =
  fmap Coerce.coerce Safe.sDL_hid_device_change_count

-- | Enumerate the HID Devices.
--
--     This function returns a linked list of all the HID devices attached to the system which match vendor_id and product_id. If @vendor_id@ is set to 0 then any vendor matches. If @product_id@ is set to 0 then any product matches. If @vendor_id@ and @product_id@ are both set to 0, then all HID devices will be returned.
--
--     By default SDL will only enumerate controllers, to reduce risk of hanging or crashing on bad drivers, but SDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS can be set to \"0\" to enumerate all HID devices.
--
--     [Returns]: a pointer to a linked list of type 'SDL_hid_device_info', containing information about the HID devices attached to the system, or NULL in the case of failure. Free this linked list by calling @'hidFreeEnumeration'@.
--
--     @since 3.2.0
--
--     [See also]: 'hidDeviceChangeCount'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_enumerate@.
--                   The safe flavor is 'hidEnumerateSafe'
--                   : USB round-trip; blocks on device enumeration.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_enumerate@, defined at @SDL3\/SDL_hidapi.h 241:51@
hidEnumerate
  :: BG.Word16
  -- ^
  --
  --           [@vendor_id@]: the Vendor ID (VID) of the types of device to open, or 0 to match any vendor.
  -> BG.Word16
  -- ^
  --
  --           [@product_id@]: the Product ID (PID) of the types of device to open, or 0 to match any product.
  -> IO (BG.Ptr SDL_hid_device_info)
hidEnumerate =
  \x00 ->
    \x11 ->
      Unsafe.sDL_hid_enumerate (Coerce.coerce x00) (Coerce.coerce x11)

-- | Enumerate the HID Devices.
--
--     This function returns a linked list of all the HID devices attached to the system which match vendor_id and product_id. If @vendor_id@ is set to 0 then any vendor matches. If @product_id@ is set to 0 then any product matches. If @vendor_id@ and @product_id@ are both set to 0, then all HID devices will be returned.
--
--     By default SDL will only enumerate controllers, to reduce risk of hanging or crashing on bad drivers, but SDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS can be set to \"0\" to enumerate all HID devices.
--
--     [Returns]: a pointer to a linked list of type 'SDL_hid_device_info', containing information about the HID devices attached to the system, or NULL in the case of failure. Free this linked list by calling @'hidFreeEnumeration'@.
--
--     @since 3.2.0
--
--     [See also]: 'hidDeviceChangeCount'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_enumerate@.
--                   The unsafe flavor is 'hidEnumerate'
--                   : USB round-trip; blocks on device enumeration.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_enumerate@, defined at @SDL3\/SDL_hidapi.h 241:51@
hidEnumerateSafe
  :: BG.Word16
  -- ^
  --
  --           [@vendor_id@]: the Vendor ID (VID) of the types of device to open, or 0 to match any vendor.
  -> BG.Word16
  -- ^
  --
  --           [@product_id@]: the Product ID (PID) of the types of device to open, or 0 to match any product.
  -> IO (BG.Ptr SDL_hid_device_info)
hidEnumerateSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_hid_enumerate (Coerce.coerce x00) (Coerce.coerce x11)

-- | Free an enumeration linked list.
--
--     This function frees a linked list created by @'hidEnumerate'@.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_free_enumeration@.
--                   The safe flavor is 'hidFreeEnumerationSafe'
--                   .
--
--     [C declaration]: @SDL_hid_free_enumeration@, defined at @SDL3\/SDL_hidapi.h 253:34@
hidFreeEnumeration
  :: BG.Ptr SDL_hid_device_info
  -- ^
  --
  --           [@devs@]: pointer to a list of struct_device returned from @'hidEnumerate'@.
  -> IO ()
hidFreeEnumeration = Unsafe.sDL_hid_free_enumeration

-- | Free an enumeration linked list.
--
--     This function frees a linked list created by @'hidEnumerate'@.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_free_enumeration@.
--                   The unsafe flavor is 'hidFreeEnumeration'
--                   .
--
--     [C declaration]: @SDL_hid_free_enumeration@, defined at @SDL3\/SDL_hidapi.h 253:34@
hidFreeEnumerationSafe
  :: BG.Ptr SDL_hid_device_info
  -- ^
  --
  --           [@devs@]: pointer to a list of struct_device returned from @'hidEnumerate'@.
  -> IO ()
hidFreeEnumerationSafe =
  Safe.sDL_hid_free_enumeration

-- | Open a HID device using a Vendor ID (VID), Product ID (PID) and optionally a serial number.
--
--     If @serial_number@ is NULL, the first device with the specified VID and PID is opened.
--
--     [Returns]: a pointer to a 'SDL_hid_device' object on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_open@.
--                   The safe flavor is 'hidOpenSafe'
--                   : USB round-trip; blocks on the device.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_open@, defined at @SDL3\/SDL_hidapi.h 271:46@
hidOpen
  :: BG.Word16
  -- ^
  --
  --           [@vendor_id@]: the Vendor ID (VID) of the device to open.
  -> BG.Word16
  -- ^
  --
  --           [@product_id@]: the Product ID (PID) of the device to open.
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@serial_number@]: the Serial Number of the device to open (Optionally NULL).
  -> IO (BG.Ptr SDL_hid_device)
hidOpen =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_hid_open (Coerce.coerce x00) (Coerce.coerce x11) x22

-- | Open a HID device using a Vendor ID (VID), Product ID (PID) and optionally a serial number.
--
--     If @serial_number@ is NULL, the first device with the specified VID and PID is opened.
--
--     [Returns]: a pointer to a 'SDL_hid_device' object on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_open@.
--                   The unsafe flavor is 'hidOpen'
--                   : USB round-trip; blocks on the device.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_open@, defined at @SDL3\/SDL_hidapi.h 271:46@
hidOpenSafe
  :: BG.Word16
  -- ^
  --
  --           [@vendor_id@]: the Vendor ID (VID) of the device to open.
  -> BG.Word16
  -- ^
  --
  --           [@product_id@]: the Product ID (PID) of the device to open.
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@serial_number@]: the Serial Number of the device to open (Optionally NULL).
  -> IO (BG.Ptr SDL_hid_device)
hidOpenSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.sDL_hid_open (Coerce.coerce x00) (Coerce.coerce x11) x22

-- | Open a HID device by its path name.
--
--     The path name be determined by calling @'hidEnumerate'@, or a platform-specific path name can be used (eg: \/dev\/hidraw0 on Linux).
--
--     [Returns]: a pointer to a 'SDL_hid_device' object on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_open_path@.
--                   The safe flavor is 'hidOpenPathSafe'
--                   .
--
--     [C declaration]: @SDL_hid_open_path@, defined at @SDL3\/SDL_hidapi.h 285:46@
hidOpenPath
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path name of the device to open.
  -> IO (BG.Ptr SDL_hid_device)
hidOpenPath = Unsafe.sDL_hid_open_path

-- | Open a HID device by its path name.
--
--     The path name be determined by calling @'hidEnumerate'@, or a platform-specific path name can be used (eg: \/dev\/hidraw0 on Linux).
--
--     [Returns]: a pointer to a 'SDL_hid_device' object on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_open_path@.
--                   The unsafe flavor is 'hidOpenPath'
--                   .
--
--     [C declaration]: @SDL_hid_open_path@, defined at @SDL3\/SDL_hidapi.h 285:46@
hidOpenPathSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path name of the device to open.
  -> IO (BG.Ptr SDL_hid_device)
hidOpenPathSafe = Safe.sDL_hid_open_path

-- | Get the properties associated with an 'SDL_hid_device'.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER'@: the libusb_device_handle associated with the device, if it was opened using libusb.
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_get_properties@.
--                   The safe flavor is 'hidGetPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_hid_get_properties@, defined at @SDL3\/SDL_hidapi.h 301:46@
hidGetProperties
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hidGetProperties = Unsafe.sDL_hid_get_properties

-- | Get the properties associated with an 'SDL_hid_device'.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER'@: the libusb_device_handle associated with the device, if it was opened using libusb.
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_get_properties@.
--                   The unsafe flavor is 'hidGetProperties'
--                   .
--
--     [C declaration]: @SDL_hid_get_properties@, defined at @SDL3\/SDL_hidapi.h 301:46@
hidGetPropertiesSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hidGetPropertiesSafe = Safe.sDL_hid_get_properties

-- | Write an Output report to a HID device.
--
--     The first byte of @data@ must contain the Report ID. For devices which only support a single report, this must be set to 0x0. The remaining bytes contain the report data. Since the Report ID is mandatory, calls to @'hidWrite'@ will always contain one more byte than the report contains. For example, if a hid report is 16 bytes long, 17 bytes must be passed to @'hidWrite'@, the Report ID (or 0x0, for devices with a single report), followed by the report data (16 bytes). In this example, the length passed in would be 17.
--
--     @'hidWrite'@ will send the data on the first OUT endpoint, if one exists. If it does not, it will send the data through the Control Endpoint (Endpoint 0).
--
--     [Returns]: the actual number of bytes written and -1 on on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_write@.
--                   The safe flavor is 'hidWriteSafe'
--                   : USB round-trip; blocks on the device.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_write@, defined at @SDL3\/SDL_hidapi.h 330:33@
hidWrite
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> PtrConst.PtrConst BG.CUChar
  -- ^
  --
  --           [@data@]: the data to send, including the report number as the first byte.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the length in bytes of the data to send.
  -> IO BG.Int32
hidWrite =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_hid_write x00 x11 (Coerce.coerce x22))

-- | Write an Output report to a HID device.
--
--     The first byte of @data@ must contain the Report ID. For devices which only support a single report, this must be set to 0x0. The remaining bytes contain the report data. Since the Report ID is mandatory, calls to @'hidWrite'@ will always contain one more byte than the report contains. For example, if a hid report is 16 bytes long, 17 bytes must be passed to @'hidWrite'@, the Report ID (or 0x0, for devices with a single report), followed by the report data (16 bytes). In this example, the length passed in would be 17.
--
--     @'hidWrite'@ will send the data on the first OUT endpoint, if one exists. If it does not, it will send the data through the Control Endpoint (Endpoint 0).
--
--     [Returns]: the actual number of bytes written and -1 on on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_write@.
--                   The unsafe flavor is 'hidWrite'
--                   : USB round-trip; blocks on the device.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_write@, defined at @SDL3\/SDL_hidapi.h 330:33@
hidWriteSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> PtrConst.PtrConst BG.CUChar
  -- ^
  --
  --           [@data@]: the data to send, including the report number as the first byte.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the length in bytes of the data to send.
  -> IO BG.Int32
hidWriteSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_hid_write x00 x11 (Coerce.coerce x22))

-- | Read an Input report from a HID device with timeout.
--
--     Input reports are returned to the host through the INTERRUPT IN endpoint. The first byte will contain the Report number if the device uses numbered reports.
--
--     [Returns]: the actual number of bytes read and -1 on on failure; call 'SDL3.Sys.Error.getError' for more information. If no packet was available to be read within the timeout period, this function returns 0.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_read_timeout@.
--                   The safe flavor is 'hidReadTimeoutSafe'
--                   : blocks up to the timeout.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_read_timeout@, defined at @SDL3\/SDL_hidapi.h 351:33@
hidReadTimeout
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@data@]: a buffer to put the read data into.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the number of bytes to read. For devices with multiple reports, make sure to read an extra byte for the report number.
  -> BG.Int32
  -- ^
  --
  --           [@milliseconds@]: timeout in milliseconds or -1 for blocking wait.
  -> IO BG.Int32
hidReadTimeout =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Unsafe.sDL_hid_read_timeout x00 x11 (Coerce.coerce x22) (Coerce.coerce x33))

-- | Read an Input report from a HID device with timeout.
--
--     Input reports are returned to the host through the INTERRUPT IN endpoint. The first byte will contain the Report number if the device uses numbered reports.
--
--     [Returns]: the actual number of bytes read and -1 on on failure; call 'SDL3.Sys.Error.getError' for more information. If no packet was available to be read within the timeout period, this function returns 0.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_read_timeout@.
--                   The unsafe flavor is 'hidReadTimeout'
--                   : blocks up to the timeout.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_read_timeout@, defined at @SDL3\/SDL_hidapi.h 351:33@
hidReadTimeoutSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@data@]: a buffer to put the read data into.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the number of bytes to read. For devices with multiple reports, make sure to read an extra byte for the report number.
  -> BG.Int32
  -- ^
  --
  --           [@milliseconds@]: timeout in milliseconds or -1 for blocking wait.
  -> IO BG.Int32
hidReadTimeoutSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Safe.sDL_hid_read_timeout x00 x11 (Coerce.coerce x22) (Coerce.coerce x33))

-- | Read an Input report from a HID device.
--
--     Input reports are returned to the host through the INTERRUPT IN endpoint. The first byte will contain the Report number if the device uses numbered reports.
--
--     [Returns]: the actual number of bytes read and -1 on failure; call 'SDL3.Sys.Error.getError' for more information. If no packet was available to be read and the handle is in non-blocking mode, this function returns 0.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_read@.
--                   The safe flavor is 'hidReadSafe'
--                   : blocks in the device\'s blocking mode (the default); an unsafe call stalls every capability and GC.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_read@, defined at @SDL3\/SDL_hidapi.h 372:33@
hidRead
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@data@]: a buffer to put the read data into.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the number of bytes to read. For devices with multiple reports, make sure to read an extra byte for the report number.
  -> IO BG.Int32
hidRead =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_hid_read x00 x11 (Coerce.coerce x22))

-- | Read an Input report from a HID device.
--
--     Input reports are returned to the host through the INTERRUPT IN endpoint. The first byte will contain the Report number if the device uses numbered reports.
--
--     [Returns]: the actual number of bytes read and -1 on failure; call 'SDL3.Sys.Error.getError' for more information. If no packet was available to be read and the handle is in non-blocking mode, this function returns 0.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_read@.
--                   The unsafe flavor is 'hidRead'
--                   : blocks in the device\'s blocking mode (the default); an unsafe call stalls every capability and GC.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_read@, defined at @SDL3\/SDL_hidapi.h 372:33@
hidReadSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@data@]: a buffer to put the read data into.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the number of bytes to read. For devices with multiple reports, make sure to read an extra byte for the report number.
  -> IO BG.Int32
hidReadSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_hid_read x00 x11 (Coerce.coerce x22))

-- | Set the device handle to be non-blocking.
--
--     In non-blocking mode calls to @'hidRead'@ will return immediately with a value of 0 if there is no data to be read. In blocking mode, @'hidRead'@ will wait (block) until there is data to read before returning.
--
--     Nonblocking can be turned on and off at any time.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_set_nonblocking@.
--                   The safe flavor is 'hidSetNonblockingSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_set_nonblocking@, defined at @SDL3\/SDL_hidapi.h 391:33@
hidSetNonblocking
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Int32
  -- ^
  --
  --           [@nonblock@]: enable or not the nonblocking reads - 1 to enable nonblocking - 0 to disable nonblocking.
  -> IO BG.Int32
hidSetNonblocking =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_hid_set_nonblocking x00 (Coerce.coerce x11))

-- | Set the device handle to be non-blocking.
--
--     In non-blocking mode calls to @'hidRead'@ will return immediately with a value of 0 if there is no data to be read. In blocking mode, @'hidRead'@ will wait (block) until there is data to read before returning.
--
--     Nonblocking can be turned on and off at any time.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_set_nonblocking@.
--                   The unsafe flavor is 'hidSetNonblocking'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_set_nonblocking@, defined at @SDL3\/SDL_hidapi.h 391:33@
hidSetNonblockingSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Int32
  -- ^
  --
  --           [@nonblock@]: enable or not the nonblocking reads - 1 to enable nonblocking - 0 to disable nonblocking.
  -> IO BG.Int32
hidSetNonblockingSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_hid_set_nonblocking x00 (Coerce.coerce x11))

-- | Send a Feature report to the device.
--
--     Feature reports are sent over the Control endpoint as a Set_Report transfer. The first byte of @data@ must contain the Report ID. For devices which only support a single report, this must be set to 0x0. The remaining bytes contain the report data. Since the Report ID is mandatory, calls to @'hidSendFeatureReport'@ will always contain one more byte than the report contains. For example, if a hid report is 16 bytes long, 17 bytes must be passed to @'hidSendFeatureReport'@: the Report ID (or 0x0, for devices which do not use numbered reports), followed by the report data (16 bytes). In this example, the length passed in would be 17.
--
--     [Returns]: the actual number of bytes written and -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_send_feature_report@.
--                   The safe flavor is 'hidSendFeatureReportSafe'
--                   : USB round-trip; blocks on the device.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_send_feature_report@, defined at @SDL3\/SDL_hidapi.h 416:33@
hidSendFeatureReport
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> PtrConst.PtrConst BG.CUChar
  -- ^
  --
  --           [@data@]: the data to send, including the report number as the first byte.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the length in bytes of the data to send, including the report number.
  -> IO BG.Int32
hidSendFeatureReport =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_hid_send_feature_report x00 x11 (Coerce.coerce x22))

-- | Send a Feature report to the device.
--
--     Feature reports are sent over the Control endpoint as a Set_Report transfer. The first byte of @data@ must contain the Report ID. For devices which only support a single report, this must be set to 0x0. The remaining bytes contain the report data. Since the Report ID is mandatory, calls to @'hidSendFeatureReport'@ will always contain one more byte than the report contains. For example, if a hid report is 16 bytes long, 17 bytes must be passed to @'hidSendFeatureReport'@: the Report ID (or 0x0, for devices which do not use numbered reports), followed by the report data (16 bytes). In this example, the length passed in would be 17.
--
--     [Returns]: the actual number of bytes written and -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_send_feature_report@.
--                   The unsafe flavor is 'hidSendFeatureReport'
--                   : USB round-trip; blocks on the device.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_send_feature_report@, defined at @SDL3\/SDL_hidapi.h 416:33@
hidSendFeatureReportSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> PtrConst.PtrConst BG.CUChar
  -- ^
  --
  --           [@data@]: the data to send, including the report number as the first byte.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the length in bytes of the data to send, including the report number.
  -> IO BG.Int32
hidSendFeatureReportSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_hid_send_feature_report x00 x11 (Coerce.coerce x22))

-- | Get a feature report from a HID device.
--
--     Set the first byte of @data@ to the Report ID of the report to be read. Make sure to allow space for this extra byte in @data@. Upon return, the first byte will still contain the Report ID, and the report data will start in data[1].
--
--     [Returns]: the number of bytes read plus one for the report ID (which is still in the first byte), or -1 on on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_get_feature_report@.
--                   The safe flavor is 'hidGetFeatureReportSafe'
--                   : USB round-trip; blocks on the device.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_feature_report@, defined at @SDL3\/SDL_hidapi.h 439:33@
hidGetFeatureReport
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@data@]: a buffer to put the read data into, including the Report ID. Set the first byte of @data@ to the Report ID of the report to be read, or set it to zero if your device does not use numbered reports.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the number of bytes to read, including an extra byte for the report ID. The buffer can be longer than the actual report.
  -> IO BG.Int32
hidGetFeatureReport =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_hid_get_feature_report x00 x11 (Coerce.coerce x22))

-- | Get a feature report from a HID device.
--
--     Set the first byte of @data@ to the Report ID of the report to be read. Make sure to allow space for this extra byte in @data@. Upon return, the first byte will still contain the Report ID, and the report data will start in data[1].
--
--     [Returns]: the number of bytes read plus one for the report ID (which is still in the first byte), or -1 on on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_get_feature_report@.
--                   The unsafe flavor is 'hidGetFeatureReport'
--                   : USB round-trip; blocks on the device.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_feature_report@, defined at @SDL3\/SDL_hidapi.h 439:33@
hidGetFeatureReportSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@data@]: a buffer to put the read data into, including the Report ID. Set the first byte of @data@ to the Report ID of the report to be read, or set it to zero if your device does not use numbered reports.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the number of bytes to read, including an extra byte for the report ID. The buffer can be longer than the actual report.
  -> IO BG.Int32
hidGetFeatureReportSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_hid_get_feature_report x00 x11 (Coerce.coerce x22))

-- | Get an input report from a HID device.
--
--     Set the first byte of @data@ to the Report ID of the report to be read. Make sure to allow space for this extra byte in @data@. Upon return, the first byte will still contain the Report ID, and the report data will start in data[1].
--
--     [Returns]: the number of bytes read plus one for the report ID (which is still in the first byte), or -1 on on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_get_input_report@.
--                   The safe flavor is 'hidGetInputReportSafe'
--                   : USB round-trip; blocks on the device.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_input_report@, defined at @SDL3\/SDL_hidapi.h 462:33@
hidGetInputReport
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@data@]: a buffer to put the read data into, including the Report ID. Set the first byte of @data@ to the Report ID of the report to be read, or set it to zero if your device does not use numbered reports.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the number of bytes to read, including an extra byte for the report ID. The buffer can be longer than the actual report.
  -> IO BG.Int32
hidGetInputReport =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_hid_get_input_report x00 x11 (Coerce.coerce x22))

-- | Get an input report from a HID device.
--
--     Set the first byte of @data@ to the Report ID of the report to be read. Make sure to allow space for this extra byte in @data@. Upon return, the first byte will still contain the Report ID, and the report data will start in data[1].
--
--     [Returns]: the number of bytes read plus one for the report ID (which is still in the first byte), or -1 on on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_get_input_report@.
--                   The unsafe flavor is 'hidGetInputReport'
--                   : USB round-trip; blocks on the device.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_input_report@, defined at @SDL3\/SDL_hidapi.h 462:33@
hidGetInputReportSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@data@]: a buffer to put the read data into, including the Report ID. Set the first byte of @data@ to the Report ID of the report to be read, or set it to zero if your device does not use numbered reports.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the number of bytes to read, including an extra byte for the report ID. The buffer can be longer than the actual report.
  -> IO BG.Int32
hidGetInputReportSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_hid_get_input_report x00 x11 (Coerce.coerce x22))

-- | Close a HID device.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_close@.
--                   The safe flavor is 'hidCloseSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_close@, defined at @SDL3\/SDL_hidapi.h 473:33@
hidClose
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> IO BG.Int32
hidClose =
  \x00 -> fmap Coerce.coerce (Unsafe.sDL_hid_close x00)

-- | Close a HID device.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_close@.
--                   The unsafe flavor is 'hidClose'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_close@, defined at @SDL3\/SDL_hidapi.h 473:33@
hidCloseSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> IO BG.Int32
hidCloseSafe =
  \x00 -> fmap Coerce.coerce (Safe.sDL_hid_close x00)

-- | Get The Manufacturer String from a HID device.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_get_manufacturer_string@.
--                   The safe flavor is 'hidGetManufacturerStringSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_manufacturer_string@, defined at @SDL3\/SDL_hidapi.h 486:33@
hidGetManufacturerString
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@string@]: a wide string buffer to put the data into.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the length of the buffer in multiples of wchar_t.
  -> IO BG.Int32
hidGetManufacturerString =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_hid_get_manufacturer_string x00 x11 (Coerce.coerce x22))

-- | Get The Manufacturer String from a HID device.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_get_manufacturer_string@.
--                   The unsafe flavor is 'hidGetManufacturerString'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_manufacturer_string@, defined at @SDL3\/SDL_hidapi.h 486:33@
hidGetManufacturerStringSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@string@]: a wide string buffer to put the data into.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the length of the buffer in multiples of wchar_t.
  -> IO BG.Int32
hidGetManufacturerStringSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_hid_get_manufacturer_string x00 x11 (Coerce.coerce x22))

-- | Get The Product String from a HID device.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_get_product_string@.
--                   The safe flavor is 'hidGetProductStringSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_product_string@, defined at @SDL3\/SDL_hidapi.h 499:33@
hidGetProductString
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@string@]: a wide string buffer to put the data into.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the length of the buffer in multiples of wchar_t.
  -> IO BG.Int32
hidGetProductString =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_hid_get_product_string x00 x11 (Coerce.coerce x22))

-- | Get The Product String from a HID device.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_get_product_string@.
--                   The unsafe flavor is 'hidGetProductString'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_product_string@, defined at @SDL3\/SDL_hidapi.h 499:33@
hidGetProductStringSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@string@]: a wide string buffer to put the data into.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the length of the buffer in multiples of wchar_t.
  -> IO BG.Int32
hidGetProductStringSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_hid_get_product_string x00 x11 (Coerce.coerce x22))

-- | Get The Serial Number String from a HID device.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_get_serial_number_string@.
--                   The safe flavor is 'hidGetSerialNumberStringSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_serial_number_string@, defined at @SDL3\/SDL_hidapi.h 512:33@
hidGetSerialNumberString
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@string@]: a wide string buffer to put the data into.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the length of the buffer in multiples of wchar_t.
  -> IO BG.Int32
hidGetSerialNumberString =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_hid_get_serial_number_string x00 x11 (Coerce.coerce x22))

-- | Get The Serial Number String from a HID device.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_get_serial_number_string@.
--                   The unsafe flavor is 'hidGetSerialNumberString'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_serial_number_string@, defined at @SDL3\/SDL_hidapi.h 512:33@
hidGetSerialNumberStringSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@string@]: a wide string buffer to put the data into.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the length of the buffer in multiples of wchar_t.
  -> IO BG.Int32
hidGetSerialNumberStringSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_hid_get_serial_number_string x00 x11 (Coerce.coerce x22))

-- | Get a string from a HID device, based on its string index.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_get_indexed_string@.
--                   The safe flavor is 'hidGetIndexedStringSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_indexed_string@, defined at @SDL3\/SDL_hidapi.h 526:33@
hidGetIndexedString
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Int32
  -- ^
  --
  --           [@string_index@]: the index of the string to get.
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@string@]: a wide string buffer to put the data into.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the length of the buffer in multiples of wchar_t.
  -> IO BG.Int32
hidGetIndexedString =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            Coerce.coerce
            (Unsafe.sDL_hid_get_indexed_string x00 (Coerce.coerce x11) x22 (Coerce.coerce x33))

-- | Get a string from a HID device, based on its string index.
--
--     [Returns]: 0 on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_get_indexed_string@.
--                   The unsafe flavor is 'hidGetIndexedString'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_indexed_string@, defined at @SDL3\/SDL_hidapi.h 526:33@
hidGetIndexedStringSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Int32
  -- ^
  --
  --           [@string_index@]: the index of the string to get.
  -> BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@string@]: a wide string buffer to put the data into.
  -> BG.Word64
  -- ^
  --
  --           [@maxlen@]: the length of the buffer in multiples of wchar_t.
  -> IO BG.Int32
hidGetIndexedStringSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap Coerce.coerce (Safe.sDL_hid_get_indexed_string x00 (Coerce.coerce x11) x22 (Coerce.coerce x33))

-- | Get the device info from a HID device.
--
--     [Returns]: a pointer to the 'SDL_hid_device_info' for this hid_device or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This struct is valid until the device is closed with @'hidClose'@.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_get_device_info@.
--                   The safe flavor is 'hidGetDeviceInfoSafe'
--                   .
--
--     [C declaration]: @SDL_hid_get_device_info@, defined at @SDL3\/SDL_hidapi.h 538:51@
hidGetDeviceInfo
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> IO (BG.Ptr SDL_hid_device_info)
hidGetDeviceInfo = Unsafe.sDL_hid_get_device_info

-- | Get the device info from a HID device.
--
--     [Returns]: a pointer to the 'SDL_hid_device_info' for this hid_device or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This struct is valid until the device is closed with @'hidClose'@.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_get_device_info@.
--                   The unsafe flavor is 'hidGetDeviceInfo'
--                   .
--
--     [C declaration]: @SDL_hid_get_device_info@, defined at @SDL3\/SDL_hidapi.h 538:51@
hidGetDeviceInfoSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> IO (BG.Ptr SDL_hid_device_info)
hidGetDeviceInfoSafe = Safe.sDL_hid_get_device_info

-- | Get a report descriptor from a HID device.
--
--     User has to provide a preallocated buffer where descriptor will be copied to. The recommended size for a preallocated buffer is 4096 bytes.
--
--     [Returns]: the number of bytes actually copied or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_get_report_descriptor@.
--                   The safe flavor is 'hidGetReportDescriptorSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_report_descriptor@, defined at @SDL3\/SDL_hidapi.h 554:33@
hidGetReportDescriptor
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@buf@]: the buffer to copy descriptor into.
  -> BG.Word64
  -- ^
  --
  --           [@buf_size@]: the size of the buffer in bytes.
  -> IO BG.Int32
hidGetReportDescriptor =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_hid_get_report_descriptor x00 x11 (Coerce.coerce x22))

-- | Get a report descriptor from a HID device.
--
--     User has to provide a preallocated buffer where descriptor will be copied to. The recommended size for a preallocated buffer is 4096 bytes.
--
--     [Returns]: the number of bytes actually copied or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_get_report_descriptor@.
--                   The unsafe flavor is 'hidGetReportDescriptor'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_get_report_descriptor@, defined at @SDL3\/SDL_hidapi.h 554:33@
hidGetReportDescriptorSafe
  :: BG.Ptr SDL_hid_device
  -- ^
  --
  --           [@dev@]: a device handle returned from @'hidOpen'@.
  -> BG.Ptr BG.CUChar
  -- ^
  --
  --           [@buf@]: the buffer to copy descriptor into.
  -> BG.Word64
  -- ^
  --
  --           [@buf_size@]: the size of the buffer in bytes.
  -> IO BG.Int32
hidGetReportDescriptorSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_hid_get_report_descriptor x00 x11 (Coerce.coerce x22))

-- | Start or stop a BLE scan on iOS and tvOS to pair Steam Controllers.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_hid_ble_scan@.
--                   The safe flavor is 'hidBleScanSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_ble_scan@, defined at @SDL3\/SDL_hidapi.h 563:34@
hidBleScan
  :: Bool
  -- ^
  --
  --           [@active@]: true to start the scan, false to stop the scan.
  -> IO ()
hidBleScan =
  \x00 -> Unsafe.sDL_hid_ble_scan (CBool.fromBool x00)

-- | Start or stop a BLE scan on iOS and tvOS to pair Steam Controllers.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_hid_ble_scan@.
--                   The unsafe flavor is 'hidBleScan'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_hid_ble_scan@, defined at @SDL3\/SDL_hidapi.h 563:34@
hidBleScanSafe
  :: Bool
  -- ^
  --
  --           [@active@]: true to start the scan, false to stop the scan.
  -> IO ()
hidBleScanSafe =
  \x00 -> Safe.sDL_hid_ble_scan (CBool.fromBool x00)

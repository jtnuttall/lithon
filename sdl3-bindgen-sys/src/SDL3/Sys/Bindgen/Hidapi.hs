{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

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
module SDL3.Sys.Bindgen.Hidapi (
  SDL3.Sys.Bindgen.Hidapi.SDL_hid_device,
  SDL3.Sys.Bindgen.Hidapi.SDL_hid_bus_type (..),
  pattern SDL3.Sys.Bindgen.Hidapi.SDL_HID_API_BUS_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Hidapi.SDL_HID_API_BUS_USB,
  pattern SDL3.Sys.Bindgen.Hidapi.SDL_HID_API_BUS_BLUETOOTH,
  pattern SDL3.Sys.Bindgen.Hidapi.SDL_HID_API_BUS_I2C,
  pattern SDL3.Sys.Bindgen.Hidapi.SDL_HID_API_BUS_SPI,
  SDL3.Sys.Bindgen.Hidapi.SDL_hid_device_info (..),
  SDL3.Sys.Bindgen.Hidapi.sDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @struct SDL_hid_device@, defined at @SDL3\/SDL_hidapi.h 71:16@
data SDL_hid_device

-- | HID underlying bus types.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_hid_bus_type@, defined at @SDL3\/SDL_hidapi.h 78:14@
newtype SDL_hid_bus_type = SDL_hid_bus_type
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_hid_bus_type where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_hid_bus_type where
  readRaw =
    \ptr0 ->
      pure SDL_hid_bus_type
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_hid_bus_type where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_hid_bus_type unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_hid_bus_type instance BG.Storable SDL_hid_bus_type

deriving via BG.CUInt instance BG.Prim SDL_hid_bus_type

instance CEnum.CEnum SDL_hid_bus_type where
  type CEnumZ SDL_hid_bus_type = BG.CUInt

  toCEnum = SDL_hid_bus_type

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_HID_API_BUS_UNKNOWN")
        , (1, BG.singleton "SDL_HID_API_BUS_USB")
        , (2, BG.singleton "SDL_HID_API_BUS_BLUETOOTH")
        , (3, BG.singleton "SDL_HID_API_BUS_I2C")
        , (4, BG.singleton "SDL_HID_API_BUS_SPI")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_hid_bus_type"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_hid_bus_type"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_hid_bus_type where
  minDeclaredValue = SDL_HID_API_BUS_UNKNOWN

  maxDeclaredValue = SDL_HID_API_BUS_SPI

instance Show SDL_hid_bus_type where
  showsPrec = CEnum.shows

instance Read SDL_hid_bus_type where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_hid_bus_type ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_bus_type{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_hid_bus_type) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_hid_bus_type "unwrap" where
  type CFieldType SDL_hid_bus_type "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Unknown bus type
--
--     [C declaration]: @SDL_HID_API_BUS_UNKNOWN@, defined at @SDL3\/SDL_hidapi.h 80:5@
pattern SDL_HID_API_BUS_UNKNOWN :: SDL_hid_bus_type
pattern SDL_HID_API_BUS_UNKNOWN = SDL_hid_bus_type 0

-- | USB bus Specifications: [https:\/\/usb.org\/hid](https://usb.org/hid)
--
--     [C declaration]: @SDL_HID_API_BUS_USB@, defined at @SDL3\/SDL_hidapi.h 85:5@
pattern SDL_HID_API_BUS_USB :: SDL_hid_bus_type
pattern SDL_HID_API_BUS_USB = SDL_hid_bus_type 1

-- | Bluetooth or Bluetooth LE bus Specifications: [https:\/\/www.bluetooth.com\/specifications\/specs\/human-interface-device-profile-1-1-1\/](https://www.bluetooth.com/specifications/specs/human-interface-device-profile-1-1-1/) [https:\/\/www.bluetooth.com\/specifications\/specs\/hid-service-1-0\/](https://www.bluetooth.com/specifications/specs/hid-service-1-0/) [https:\/\/www.bluetooth.com\/specifications\/specs\/hid-over-gatt-profile-1-0\/](https://www.bluetooth.com/specifications/specs/hid-over-gatt-profile-1-0/)
--
--     [C declaration]: @SDL_HID_API_BUS_BLUETOOTH@, defined at @SDL3\/SDL_hidapi.h 92:5@
pattern SDL_HID_API_BUS_BLUETOOTH :: SDL_hid_bus_type
pattern SDL_HID_API_BUS_BLUETOOTH = SDL_hid_bus_type 2

-- | I2C bus Specifications: [https:\/\/docs.microsoft.com\/previous-versions\/windows\/hardware\/design\/dn642101(v=vs.85)](https://docs.microsoft.com/previous-versions/windows/hardware/design/dn642101(v=vs.85))
--
--     [C declaration]: @SDL_HID_API_BUS_I2C@, defined at @SDL3\/SDL_hidapi.h 97:5@
pattern SDL_HID_API_BUS_I2C :: SDL_hid_bus_type
pattern SDL_HID_API_BUS_I2C = SDL_hid_bus_type 3

-- | SPI bus Specifications: [https:\/\/www.microsoft.com\/download\/details.aspx?id=103325](https://www.microsoft.com/download/details.aspx?id=103325)
--
--     [C declaration]: @SDL_HID_API_BUS_SPI@, defined at @SDL3\/SDL_hidapi.h 102:5@
pattern SDL_HID_API_BUS_SPI :: SDL_hid_bus_type
pattern SDL_HID_API_BUS_SPI = SDL_hid_bus_type 4

-- | hidapi info structure Information about a connected HID device
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_hid_device_info@, defined at @SDL3\/SDL_hidapi.h 113:16@
data SDL_hid_device_info = SDL_hid_device_info
  { path :: BG.Ptr BG.CChar
  -- ^ Platform-specific device path
  --
  --          [C declaration]: @path@, defined at @SDL3\/SDL_hidapi.h 116:11@
  , vendor_id :: BG.CUShort
  -- ^ Device Vendor ID
  --
  --          [C declaration]: @vendor_id@, defined at @SDL3\/SDL_hidapi.h 118:20@
  , product_id :: BG.CUShort
  -- ^ Device Product ID
  --
  --          [C declaration]: @product_id@, defined at @SDL3\/SDL_hidapi.h 120:20@
  , serial_number :: BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^ Serial Number
  --
  --          [C declaration]: @serial_number@, defined at @SDL3\/SDL_hidapi.h 122:14@
  , release_number :: BG.CUShort
  -- ^ Device Release Number in binary-coded decimal, also known as Device Version Number
  --
  --          [C declaration]: @release_number@, defined at @SDL3\/SDL_hidapi.h 125:20@
  , manufacturer_string :: BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^ Manufacturer String
  --
  --          [C declaration]: @manufacturer_string@, defined at @SDL3\/SDL_hidapi.h 127:14@
  , product_string :: BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^ Product string
  --
  --          [C declaration]: @product_string@, defined at @SDL3\/SDL_hidapi.h 129:14@
  , usage_page :: BG.CUShort
  -- ^ Usage Page for this Device\/Interface (Windows\/Mac\/hidraw only)
  --
  --          [C declaration]: @usage_page@, defined at @SDL3\/SDL_hidapi.h 132:20@
  , usage :: BG.CUShort
  -- ^ Usage for this Device\/Interface (Windows\/Mac\/hidraw only)
  --
  --          [C declaration]: @usage@, defined at @SDL3\/SDL_hidapi.h 135:20@
  , interface_number :: BG.CInt
  -- ^ The USB interface which this logical device represents.
  --
  --          Valid only if the device is a USB HID device. Set to -1 in all other cases.
  --
  --          [C declaration]: @interface_number@, defined at @SDL3\/SDL_hidapi.h 142:9@
  , interface_class :: BG.CInt
  -- ^ Additional information about the USB interface. Valid on libusb and Android implementations.
  --
  --          [C declaration]: @interface_class@, defined at @SDL3\/SDL_hidapi.h 146:9@
  , interface_subclass :: BG.CInt
  -- ^ [C declaration]: @interface_subclass@, defined at @SDL3\/SDL_hidapi.h 147:9@
  , interface_protocol :: BG.CInt
  -- ^ [C declaration]: @interface_protocol@, defined at @SDL3\/SDL_hidapi.h 148:9@
  , bus_type :: SDL_hid_bus_type
  -- ^ Underlying bus type
  --
  --          [C declaration]: @bus_type@, defined at @SDL3\/SDL_hidapi.h 151:22@
  , next :: BG.Ptr SDL_hid_device_info
  -- ^ Pointer to the next device
  --
  --          [C declaration]: @next@, defined at @SDL3\/SDL_hidapi.h 154:33@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_hid_device_info where
  staticSizeOf = \_ -> (80 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_hid_device_info where
  readRaw =
    \ptr0 ->
      pure SDL_hid_device_info
        <*> HasCField.readRaw (BG.Proxy @"path") ptr0
        <*> HasCField.readRaw (BG.Proxy @"vendor_id") ptr0
        <*> HasCField.readRaw (BG.Proxy @"product_id") ptr0
        <*> HasCField.readRaw (BG.Proxy @"serial_number") ptr0
        <*> HasCField.readRaw (BG.Proxy @"release_number") ptr0
        <*> HasCField.readRaw (BG.Proxy @"manufacturer_string") ptr0
        <*> HasCField.readRaw (BG.Proxy @"product_string") ptr0
        <*> HasCField.readRaw (BG.Proxy @"usage_page") ptr0
        <*> HasCField.readRaw (BG.Proxy @"usage") ptr0
        <*> HasCField.readRaw (BG.Proxy @"interface_number") ptr0
        <*> HasCField.readRaw (BG.Proxy @"interface_class") ptr0
        <*> HasCField.readRaw (BG.Proxy @"interface_subclass") ptr0
        <*> HasCField.readRaw (BG.Proxy @"interface_protocol") ptr0
        <*> HasCField.readRaw (BG.Proxy @"bus_type") ptr0
        <*> HasCField.readRaw (BG.Proxy @"next") ptr0

instance Marshal.WriteRaw SDL_hid_device_info where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_hid_device_info
            path2
            vendor_id3
            product_id4
            serial_number5
            release_number6
            manufacturer_string7
            product_string8
            usage_page9
            usage10
            interface_number11
            interface_class12
            interface_subclass13
            interface_protocol14
            bus_type15
            next16 ->
              HasCField.writeRaw (BG.Proxy @"path") ptr0 path2
                >> HasCField.writeRaw (BG.Proxy @"vendor_id") ptr0 vendor_id3
                >> HasCField.writeRaw (BG.Proxy @"product_id") ptr0 product_id4
                >> HasCField.writeRaw (BG.Proxy @"serial_number") ptr0 serial_number5
                >> HasCField.writeRaw (BG.Proxy @"release_number") ptr0 release_number6
                >> HasCField.writeRaw (BG.Proxy @"manufacturer_string") ptr0 manufacturer_string7
                >> HasCField.writeRaw (BG.Proxy @"product_string") ptr0 product_string8
                >> HasCField.writeRaw (BG.Proxy @"usage_page") ptr0 usage_page9
                >> HasCField.writeRaw (BG.Proxy @"usage") ptr0 usage10
                >> HasCField.writeRaw (BG.Proxy @"interface_number") ptr0 interface_number11
                >> HasCField.writeRaw (BG.Proxy @"interface_class") ptr0 interface_class12
                >> HasCField.writeRaw (BG.Proxy @"interface_subclass") ptr0 interface_subclass13
                >> HasCField.writeRaw (BG.Proxy @"interface_protocol") ptr0 interface_protocol14
                >> HasCField.writeRaw (BG.Proxy @"bus_type") ptr0 bus_type15
                >> HasCField.writeRaw (BG.Proxy @"next") ptr0 next16

deriving via Marshal.EquivStorable SDL_hid_device_info instance BG.Storable SDL_hid_device_info

instance
  (ty ~ BG.Ptr BG.CChar)
  => BG.CompatHasField.HasField "path" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { path = y1
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"path" x0
      )

instance
  (ty ~ BG.Ptr BG.CChar)
  => BG.HasField "path" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"path")

instance HasCField.HasCField SDL_hid_device_info "path" where
  type
    CFieldType SDL_hid_device_info "path" =
      BG.Ptr BG.CChar

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CUShort)
  => BG.CompatHasField.HasField "vendor_id" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { vendor_id = y1
            , path = BG.getField @"path" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"vendor_id" x0
      )

instance
  (ty ~ BG.CUShort)
  => BG.HasField "vendor_id" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"vendor_id")

instance HasCField.HasCField SDL_hid_device_info "vendor_id" where
  type
    CFieldType SDL_hid_device_info "vendor_id" =
      BG.CUShort

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.CUShort)
  => BG.CompatHasField.HasField "product_id" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { product_id = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"product_id" x0
      )

instance
  (ty ~ BG.CUShort)
  => BG.HasField "product_id" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"product_id")

instance HasCField.HasCField SDL_hid_device_info "product_id" where
  type
    CFieldType SDL_hid_device_info "product_id" =
      BG.CUShort

  offset# = \_ -> \_ -> 10

instance
  (ty ~ BG.Ptr HsBindgen.Runtime.LibC.CWchar)
  => BG.CompatHasField.HasField "serial_number" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { serial_number = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"serial_number" x0
      )

instance
  (ty ~ BG.Ptr HsBindgen.Runtime.LibC.CWchar)
  => BG.HasField "serial_number" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"serial_number")

instance HasCField.HasCField SDL_hid_device_info "serial_number" where
  type
    CFieldType SDL_hid_device_info "serial_number" =
      BG.Ptr HsBindgen.Runtime.LibC.CWchar

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CUShort)
  => BG.CompatHasField.HasField "release_number" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { release_number = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"release_number" x0
      )

instance
  (ty ~ BG.CUShort)
  => BG.HasField "release_number" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"release_number")

instance HasCField.HasCField SDL_hid_device_info "release_number" where
  type
    CFieldType SDL_hid_device_info "release_number" =
      BG.CUShort

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.Ptr HsBindgen.Runtime.LibC.CWchar)
  => BG.CompatHasField.HasField "manufacturer_string" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { manufacturer_string = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"manufacturer_string" x0
      )

instance
  (ty ~ BG.Ptr HsBindgen.Runtime.LibC.CWchar)
  => BG.HasField "manufacturer_string" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"manufacturer_string")

instance HasCField.HasCField SDL_hid_device_info "manufacturer_string" where
  type
    CFieldType SDL_hid_device_info "manufacturer_string" =
      BG.Ptr HsBindgen.Runtime.LibC.CWchar

  offset# = \_ -> \_ -> 32

instance
  (ty ~ BG.Ptr HsBindgen.Runtime.LibC.CWchar)
  => BG.CompatHasField.HasField "product_string" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { product_string = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"product_string" x0
      )

instance
  (ty ~ BG.Ptr HsBindgen.Runtime.LibC.CWchar)
  => BG.HasField "product_string" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"product_string")

instance HasCField.HasCField SDL_hid_device_info "product_string" where
  type
    CFieldType SDL_hid_device_info "product_string" =
      BG.Ptr HsBindgen.Runtime.LibC.CWchar

  offset# = \_ -> \_ -> 40

instance
  (ty ~ BG.CUShort)
  => BG.CompatHasField.HasField "usage_page" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { usage_page = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"usage_page" x0
      )

instance
  (ty ~ BG.CUShort)
  => BG.HasField "usage_page" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"usage_page")

instance HasCField.HasCField SDL_hid_device_info "usage_page" where
  type
    CFieldType SDL_hid_device_info "usage_page" =
      BG.CUShort

  offset# = \_ -> \_ -> 48

instance
  (ty ~ BG.CUShort)
  => BG.CompatHasField.HasField "usage" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { usage = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"usage" x0
      )

instance
  (ty ~ BG.CUShort)
  => BG.HasField "usage" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"usage")

instance HasCField.HasCField SDL_hid_device_info "usage" where
  type
    CFieldType SDL_hid_device_info "usage" =
      BG.CUShort

  offset# = \_ -> \_ -> 50

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "interface_number" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { interface_number = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"interface_number" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "interface_number" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"interface_number")

instance HasCField.HasCField SDL_hid_device_info "interface_number" where
  type
    CFieldType SDL_hid_device_info "interface_number" =
      BG.CInt

  offset# = \_ -> \_ -> 52

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "interface_class" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { interface_class = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"interface_class" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "interface_class" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"interface_class")

instance HasCField.HasCField SDL_hid_device_info "interface_class" where
  type
    CFieldType SDL_hid_device_info "interface_class" =
      BG.CInt

  offset# = \_ -> \_ -> 56

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "interface_subclass" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { interface_subclass = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"interface_subclass" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "interface_subclass" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"interface_subclass")

instance HasCField.HasCField SDL_hid_device_info "interface_subclass" where
  type
    CFieldType SDL_hid_device_info "interface_subclass" =
      BG.CInt

  offset# = \_ -> \_ -> 60

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "interface_protocol" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { interface_protocol = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , bus_type = BG.getField @"bus_type" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"interface_protocol" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "interface_protocol" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"interface_protocol")

instance HasCField.HasCField SDL_hid_device_info "interface_protocol" where
  type
    CFieldType SDL_hid_device_info "interface_protocol" =
      BG.CInt

  offset# = \_ -> \_ -> 64

instance
  (ty ~ SDL_hid_bus_type)
  => BG.CompatHasField.HasField "bus_type" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { bus_type = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"bus_type" x0
      )

instance
  (ty ~ SDL_hid_bus_type)
  => BG.HasField "bus_type" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"bus_type")

instance HasCField.HasCField SDL_hid_device_info "bus_type" where
  type
    CFieldType SDL_hid_device_info "bus_type" =
      SDL_hid_bus_type

  offset# = \_ -> \_ -> 68

instance
  (ty ~ BG.Ptr SDL_hid_device_info)
  => BG.CompatHasField.HasField "next" SDL_hid_device_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_hid_device_info
            { next = y1
            , path = BG.getField @"path" x0
            , vendor_id = BG.getField @"vendor_id" x0
            , product_id = BG.getField @"product_id" x0
            , serial_number = BG.getField @"serial_number" x0
            , release_number = BG.getField @"release_number" x0
            , manufacturer_string = BG.getField @"manufacturer_string" x0
            , product_string = BG.getField @"product_string" x0
            , usage_page = BG.getField @"usage_page" x0
            , usage = BG.getField @"usage" x0
            , interface_number = BG.getField @"interface_number" x0
            , interface_class = BG.getField @"interface_class" x0
            , interface_subclass = BG.getField @"interface_subclass" x0
            , interface_protocol = BG.getField @"interface_protocol" x0
            , bus_type = BG.getField @"bus_type" x0
            }
      , BG.getField @"next" x0
      )

instance
  (ty ~ BG.Ptr SDL_hid_device_info)
  => BG.HasField "next" (BG.Ptr SDL_hid_device_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"next")

instance HasCField.HasCField SDL_hid_device_info "next" where
  type
    CFieldType SDL_hid_device_info "next" =
      BG.Ptr SDL_hid_device_info

  offset# = \_ -> \_ -> 72

-- | [C declaration]: @macro SDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER@, literal @\"SDL.hidapi.libusb.device.handle\"@, defined at @SDL3\/SDL_hidapi.h 303:9@
sDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER :: BG.ByteString
sDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x68
    , 0x69
    , 0x64
    , 0x61
    , 0x70
    , 0x69
    , 0x2E
    , 0x6C
    , 0x69
    , 0x62
    , 0x75
    , 0x73
    , 0x62
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x68
    , 0x61
    , 0x6E
    , 0x64
    , 0x6C
    , 0x65
    ]

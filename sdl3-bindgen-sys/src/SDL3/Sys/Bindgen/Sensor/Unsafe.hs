{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Sensor.Unsafe (
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_GetSensors,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_GetSensorNameForID,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_GetSensorTypeForID,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_GetSensorNonPortableTypeForID,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_OpenSensor,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_GetSensorFromID,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_GetSensorProperties,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_GetSensorName,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_GetSensorType,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_GetSensorNonPortableType,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_GetSensorID,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_GetSensorData,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_CloseSensor,
  SDL3.Sys.Bindgen.Sensor.Unsafe.sDL_UpdateSensors,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Sensor

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_sensor.h>"
         , "SDL_SensorID *hs_bindgen_ee6d720498ccfcf9 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSensors)(arg1);"
         , "}"
         , "char const *hs_bindgen_fa9519ef92359fd7 ("
         , "  SDL_SensorID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSensorNameForID)(arg1);"
         , "}"
         , "SDL_SensorType hs_bindgen_b228ff19dccc3470 ("
         , "  SDL_SensorID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSensorTypeForID)(arg1);"
         , "}"
         , "signed int hs_bindgen_55dc63ea84b90dfd ("
         , "  SDL_SensorID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSensorNonPortableTypeForID)(arg1);"
         , "}"
         , "SDL_Sensor *hs_bindgen_96a064de06af7f5b ("
         , "  SDL_SensorID arg1"
         , ")"
         , "{"
         , "  return (SDL_OpenSensor)(arg1);"
         , "}"
         , "SDL_Sensor *hs_bindgen_538466d72bb89e2a ("
         , "  SDL_SensorID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSensorFromID)(arg1);"
         , "}"
         , "SDL_PropertiesID hs_bindgen_bd4281541ec37b4a ("
         , "  SDL_Sensor *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSensorProperties)(arg1);"
         , "}"
         , "char const *hs_bindgen_0b99eed337a49b0f ("
         , "  SDL_Sensor *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSensorName)(arg1);"
         , "}"
         , "SDL_SensorType hs_bindgen_a8f08b8d675c0eb3 ("
         , "  SDL_Sensor *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSensorType)(arg1);"
         , "}"
         , "signed int hs_bindgen_559a0243cc021a62 ("
         , "  SDL_Sensor *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSensorNonPortableType)(arg1);"
         , "}"
         , "SDL_SensorID hs_bindgen_83b38918f593ff72 ("
         , "  SDL_Sensor *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSensorID)(arg1);"
         , "}"
         , "_Bool hs_bindgen_e4251a0c2836940f ("
         , "  SDL_Sensor *arg1,"
         , "  float *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_GetSensorData)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_55183617e9522a14 ("
         , "  SDL_Sensor *arg1"
         , ")"
         , "{"
         , "  (SDL_CloseSensor)(arg1);"
         , "}"
         , "void hs_bindgen_da4b495835d9041d (void)"
         , "{"
         , "  (SDL_UpdateSensors)();"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensors@
foreign import ccall unsafe "hs_bindgen_ee6d720498ccfcf9"
  hs_bindgen_ee6d720498ccfcf9_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensors@
hs_bindgen_ee6d720498ccfcf9
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL_SensorID)
hs_bindgen_ee6d720498ccfcf9 =
  BG.fromFFIType hs_bindgen_ee6d720498ccfcf9_base

-- | Get a list of currently connected sensors.
--
--     [Returns]: a 0 terminated array of sensor instance IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensors@, defined at @SDL3\/SDL_sensor.h 159:44@
sDL_GetSensors
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of sensors returned, may be NULL.
  -> IO (BG.Ptr SDL_SensorID)
sDL_GetSensors = hs_bindgen_ee6d720498ccfcf9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorNameForID@
foreign import ccall unsafe "hs_bindgen_fa9519ef92359fd7"
  hs_bindgen_fa9519ef92359fd7_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorNameForID@
hs_bindgen_fa9519ef92359fd7
  :: SDL_SensorID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_fa9519ef92359fd7 =
  BG.fromFFIType hs_bindgen_fa9519ef92359fd7_base

-- | Get the implementation dependent name of a sensor.
--
--     This can be called before any sensors are opened.
--
--     [Returns]: the sensor name, or NULL if @instance_id@ is not valid.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorNameForID@, defined at @SDL3\/SDL_sensor.h 171:42@
sDL_GetSensorNameForID
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetSensorNameForID = hs_bindgen_fa9519ef92359fd7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorTypeForID@
foreign import ccall unsafe "hs_bindgen_b228ff19dccc3470"
  hs_bindgen_b228ff19dccc3470_base
    :: BG.Word32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorTypeForID@
hs_bindgen_b228ff19dccc3470
  :: SDL_SensorID
  -> IO SDL_SensorType
hs_bindgen_b228ff19dccc3470 =
  BG.fromFFIType hs_bindgen_b228ff19dccc3470_base

-- | Get the type of a sensor.
--
--     This can be called before any sensors are opened.
--
--     [Returns]: the 'SDL_SensorType', or @SDL_SENSOR_INVALID@ if @instance_id@ is not valid.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorTypeForID@, defined at @SDL3\/SDL_sensor.h 184:44@
sDL_GetSensorTypeForID
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO SDL_SensorType
sDL_GetSensorTypeForID = hs_bindgen_b228ff19dccc3470

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorNonPortableTypeForID@
foreign import ccall unsafe "hs_bindgen_55dc63ea84b90dfd"
  hs_bindgen_55dc63ea84b90dfd_base
    :: BG.Word32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorNonPortableTypeForID@
hs_bindgen_55dc63ea84b90dfd
  :: SDL_SensorID
  -> IO BG.CInt
hs_bindgen_55dc63ea84b90dfd =
  BG.fromFFIType hs_bindgen_55dc63ea84b90dfd_base

-- | Get the platform dependent type of a sensor.
--
--     This can be called before any sensors are opened.
--
--     [Returns]: the sensor platform dependent type, or -1 if @instance_id@ is not valid.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorNonPortableTypeForID@, defined at @SDL3\/SDL_sensor.h 197:33@
sDL_GetSensorNonPortableTypeForID
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO BG.CInt
sDL_GetSensorNonPortableTypeForID =
  hs_bindgen_55dc63ea84b90dfd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_OpenSensor@
foreign import ccall unsafe "hs_bindgen_96a064de06af7f5b"
  hs_bindgen_96a064de06af7f5b_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_OpenSensor@
hs_bindgen_96a064de06af7f5b
  :: SDL_SensorID
  -> IO (BG.Ptr SDL_Sensor)
hs_bindgen_96a064de06af7f5b =
  BG.fromFFIType hs_bindgen_96a064de06af7f5b_base

-- | Open a sensor for use.
--
--     [Returns]: an 'SDL_Sensor' object or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OpenSensor@, defined at @SDL3\/SDL_sensor.h 208:42@
sDL_OpenSensor
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO (BG.Ptr SDL_Sensor)
sDL_OpenSensor = hs_bindgen_96a064de06af7f5b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorFromID@
foreign import ccall unsafe "hs_bindgen_538466d72bb89e2a"
  hs_bindgen_538466d72bb89e2a_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorFromID@
hs_bindgen_538466d72bb89e2a
  :: SDL_SensorID
  -> IO (BG.Ptr SDL_Sensor)
hs_bindgen_538466d72bb89e2a =
  BG.fromFFIType hs_bindgen_538466d72bb89e2a_base

-- | Return the 'SDL_Sensor' associated with an instance ID.
--
--     [Returns]: an 'SDL_Sensor' object or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorFromID@, defined at @SDL3\/SDL_sensor.h 219:42@
sDL_GetSensorFromID
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO (BG.Ptr SDL_Sensor)
sDL_GetSensorFromID = hs_bindgen_538466d72bb89e2a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorProperties@
foreign import ccall unsafe "hs_bindgen_bd4281541ec37b4a"
  hs_bindgen_bd4281541ec37b4a_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorProperties@
hs_bindgen_bd4281541ec37b4a
  :: BG.Ptr SDL_Sensor
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_bd4281541ec37b4a =
  BG.fromFFIType hs_bindgen_bd4281541ec37b4a_base

-- | Get the properties associated with a sensor.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorProperties@, defined at @SDL3\/SDL_sensor.h 230:46@
sDL_GetSensorProperties
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_GetSensorProperties = hs_bindgen_bd4281541ec37b4a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorName@
foreign import ccall unsafe "hs_bindgen_0b99eed337a49b0f"
  hs_bindgen_0b99eed337a49b0f_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorName@
hs_bindgen_0b99eed337a49b0f
  :: BG.Ptr SDL_Sensor
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_0b99eed337a49b0f =
  BG.fromFFIType hs_bindgen_0b99eed337a49b0f_base

-- | Get the implementation dependent name of a sensor.
--
--     [Returns]: the sensor name or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorName@, defined at @SDL3\/SDL_sensor.h 241:42@
sDL_GetSensorName
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetSensorName = hs_bindgen_0b99eed337a49b0f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorType@
foreign import ccall unsafe "hs_bindgen_a8f08b8d675c0eb3"
  hs_bindgen_a8f08b8d675c0eb3_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorType@
hs_bindgen_a8f08b8d675c0eb3
  :: BG.Ptr SDL_Sensor
  -> IO SDL_SensorType
hs_bindgen_a8f08b8d675c0eb3 =
  BG.fromFFIType hs_bindgen_a8f08b8d675c0eb3_base

-- | Get the type of a sensor.
--
--     [Returns]: the 'SDL_SensorType' type, or @SDL_SENSOR_INVALID@ if @sensor@ is NULL.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorType@, defined at @SDL3\/SDL_sensor.h 252:44@
sDL_GetSensorType
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to inspect.
  -> IO SDL_SensorType
sDL_GetSensorType = hs_bindgen_a8f08b8d675c0eb3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorNonPortableType@
foreign import ccall unsafe "hs_bindgen_559a0243cc021a62"
  hs_bindgen_559a0243cc021a62_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorNonPortableType@
hs_bindgen_559a0243cc021a62
  :: BG.Ptr SDL_Sensor
  -> IO BG.CInt
hs_bindgen_559a0243cc021a62 =
  BG.fromFFIType hs_bindgen_559a0243cc021a62_base

-- | Get the platform dependent type of a sensor.
--
--     [Returns]: the sensor platform dependent type, or -1 if @sensor@ is NULL.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorNonPortableType@, defined at @SDL3\/SDL_sensor.h 262:33@
sDL_GetSensorNonPortableType
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to inspect.
  -> IO BG.CInt
sDL_GetSensorNonPortableType =
  hs_bindgen_559a0243cc021a62

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorID@
foreign import ccall unsafe "hs_bindgen_83b38918f593ff72"
  hs_bindgen_83b38918f593ff72_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorID@
hs_bindgen_83b38918f593ff72
  :: BG.Ptr SDL_Sensor
  -> IO SDL_SensorID
hs_bindgen_83b38918f593ff72 =
  BG.fromFFIType hs_bindgen_83b38918f593ff72_base

-- | Get the instance ID of a sensor.
--
--     [Returns]: the sensor instance ID, or 0 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorID@, defined at @SDL3\/SDL_sensor.h 273:42@
sDL_GetSensorID
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to inspect.
  -> IO SDL_SensorID
sDL_GetSensorID = hs_bindgen_83b38918f593ff72

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorData@
foreign import ccall unsafe "hs_bindgen_e4251a0c2836940f"
  hs_bindgen_e4251a0c2836940f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_GetSensorData@
hs_bindgen_e4251a0c2836940f
  :: BG.Ptr SDL_Sensor
  -> BG.Ptr BG.CFloat
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_e4251a0c2836940f =
  BG.fromFFIType hs_bindgen_e4251a0c2836940f_base

-- | Get the current state of an opened sensor.
--
--     The number of values and interpretation of the data is sensor dependent.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorData@, defined at @SDL3\/SDL_sensor.h 288:34@
sDL_GetSensorData
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to query.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@data@]: a pointer filled with the current sensor state.
  -> BG.CInt
  -- ^
  --
  --           [@num_values@]: the number of values to write to data.
  -> IO BG.CBool
sDL_GetSensorData = hs_bindgen_e4251a0c2836940f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_CloseSensor@
foreign import ccall unsafe "hs_bindgen_55183617e9522a14"
  hs_bindgen_55183617e9522a14_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_CloseSensor@
hs_bindgen_55183617e9522a14
  :: BG.Ptr SDL_Sensor
  -> IO ()
hs_bindgen_55183617e9522a14 =
  BG.fromFFIType hs_bindgen_55183617e9522a14_base

-- | Close a sensor previously opened with @SDL_OpenSensor()@.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CloseSensor@, defined at @SDL3\/SDL_sensor.h 297:34@
sDL_CloseSensor
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to close.
  -> IO ()
sDL_CloseSensor = hs_bindgen_55183617e9522a14

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_UpdateSensors@
foreign import ccall unsafe "hs_bindgen_da4b495835d9041d"
  hs_bindgen_da4b495835d9041d_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_Unsafe_SDL_UpdateSensors@
hs_bindgen_da4b495835d9041d :: IO ()
hs_bindgen_da4b495835d9041d =
  BG.fromFFIType hs_bindgen_da4b495835d9041d_base

-- | Update the current state of the open sensors.
--
--     This is called automatically by the event loop if sensor events are enabled.
--
--     This needs to be called from the thread that initialized the sensor subsystem.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UpdateSensors@, defined at @SDL3\/SDL_sensor.h 310:34@
sDL_UpdateSensors :: IO ()
sDL_UpdateSensors = hs_bindgen_da4b495835d9041d

{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Sensor.FunPtr (
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_GetSensors,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_GetSensorNameForID,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_GetSensorTypeForID,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_GetSensorNonPortableTypeForID,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_OpenSensor,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_GetSensorFromID,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_GetSensorProperties,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_GetSensorName,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_GetSensorType,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_GetSensorNonPortableType,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_GetSensorID,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_GetSensorData,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_CloseSensor,
  SDL3.Sys.Bindgen.Sensor.FunPtr.sDL_UpdateSensors,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensors */"
         , "__attribute__ ((const))"
         , "SDL_SensorID *(*hs_bindgen_7d117dd7b42cc40e (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSensors;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorNameForID */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_064803dcda1d2e45 (void)) ("
         , "  SDL_SensorID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSensorNameForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorTypeForID */"
         , "__attribute__ ((const))"
         , "SDL_SensorType (*hs_bindgen_15067de6fd7eab81 (void)) ("
         , "  SDL_SensorID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSensorTypeForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorNonPortableTypeForID */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_93df6e86c5ae7de1 (void)) ("
         , "  SDL_SensorID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSensorNonPortableTypeForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_OpenSensor */"
         , "__attribute__ ((const))"
         , "SDL_Sensor *(*hs_bindgen_3ddd92169c898cc5 (void)) ("
         , "  SDL_SensorID arg1"
         , ")"
         , "{"
         , "  return &SDL_OpenSensor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorFromID */"
         , "__attribute__ ((const))"
         , "SDL_Sensor *(*hs_bindgen_599e05d453695d54 (void)) ("
         , "  SDL_SensorID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSensorFromID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_4164cf08823b4939 (void)) ("
         , "  SDL_Sensor *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSensorProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_73c9e66388d63d79 (void)) ("
         , "  SDL_Sensor *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSensorName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorType */"
         , "__attribute__ ((const))"
         , "SDL_SensorType (*hs_bindgen_d2b64d0316fa8124 (void)) ("
         , "  SDL_Sensor *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSensorType;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorNonPortableType */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_0e763d01bffcfa1a (void)) ("
         , "  SDL_Sensor *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSensorNonPortableType;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorID */"
         , "__attribute__ ((const))"
         , "SDL_SensorID (*hs_bindgen_ccc4b71ce529cea1 (void)) ("
         , "  SDL_Sensor *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSensorID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorData */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_63c226fd6c34b399 (void)) ("
         , "  SDL_Sensor *arg1,"
         , "  float *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_GetSensorData;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_CloseSensor */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_a117a0cf60dc00d1 (void)) ("
         , "  SDL_Sensor *arg1"
         , ")"
         , "{"
         , "  return &SDL_CloseSensor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_UpdateSensors */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_bbc7d6be143f2f1d (void)) (void)"
         , "{"
         , "  return &SDL_UpdateSensors;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensors@
foreign import ccall unsafe "hs_bindgen_7d117dd7b42cc40e"
  hs_bindgen_7d117dd7b42cc40e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensors@
hs_bindgen_7d117dd7b42cc40e :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_SensorID)))
hs_bindgen_7d117dd7b42cc40e =
  BG.fromFFIType hs_bindgen_7d117dd7b42cc40e_base

{-# NOINLINE sDL_GetSensors #-}

-- | Get a list of currently connected sensors.
--
--     [@count@]: a pointer filled in with the number of sensors returned, may be NULL.
--
--     [Returns]: a 0 terminated array of sensor instance IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensors@, defined at @SDL3\/SDL_sensor.h 159:44@
sDL_GetSensors :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_SensorID))
sDL_GetSensors =
  BG.unsafePerformIO hs_bindgen_7d117dd7b42cc40e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorNameForID@
foreign import ccall unsafe "hs_bindgen_064803dcda1d2e45"
  hs_bindgen_064803dcda1d2e45_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorNameForID@
hs_bindgen_064803dcda1d2e45 :: IO (BG.FunPtr (SDL_SensorID -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_064803dcda1d2e45 =
  BG.fromFFIType hs_bindgen_064803dcda1d2e45_base

{-# NOINLINE sDL_GetSensorNameForID #-}

-- | Get the implementation dependent name of a sensor.
--
--     This can be called before any sensors are opened.
--
--     [@instance_id@]: the sensor instance ID.
--
--     [Returns]: the sensor name, or NULL if @instance_id@ is not valid.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorNameForID@, defined at @SDL3\/SDL_sensor.h 171:42@
sDL_GetSensorNameForID :: BG.FunPtr (SDL_SensorID -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetSensorNameForID =
  BG.unsafePerformIO hs_bindgen_064803dcda1d2e45

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorTypeForID@
foreign import ccall unsafe "hs_bindgen_15067de6fd7eab81"
  hs_bindgen_15067de6fd7eab81_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorTypeForID@
hs_bindgen_15067de6fd7eab81 :: IO (BG.FunPtr (SDL_SensorID -> IO SDL_SensorType))
hs_bindgen_15067de6fd7eab81 =
  BG.fromFFIType hs_bindgen_15067de6fd7eab81_base

{-# NOINLINE sDL_GetSensorTypeForID #-}

-- | Get the type of a sensor.
--
--     This can be called before any sensors are opened.
--
--     [@instance_id@]: the sensor instance ID.
--
--     [Returns]: the 'SDL_SensorType', or @SDL_SENSOR_INVALID@ if @instance_id@ is not valid.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorTypeForID@, defined at @SDL3\/SDL_sensor.h 184:44@
sDL_GetSensorTypeForID :: BG.FunPtr (SDL_SensorID -> IO SDL_SensorType)
sDL_GetSensorTypeForID =
  BG.unsafePerformIO hs_bindgen_15067de6fd7eab81

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorNonPortableTypeForID@
foreign import ccall unsafe "hs_bindgen_93df6e86c5ae7de1"
  hs_bindgen_93df6e86c5ae7de1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorNonPortableTypeForID@
hs_bindgen_93df6e86c5ae7de1 :: IO (BG.FunPtr (SDL_SensorID -> IO BG.CInt))
hs_bindgen_93df6e86c5ae7de1 =
  BG.fromFFIType hs_bindgen_93df6e86c5ae7de1_base

{-# NOINLINE sDL_GetSensorNonPortableTypeForID #-}

-- | Get the platform dependent type of a sensor.
--
--     This can be called before any sensors are opened.
--
--     [@instance_id@]: the sensor instance ID.
--
--     [Returns]: the sensor platform dependent type, or -1 if @instance_id@ is not valid.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorNonPortableTypeForID@, defined at @SDL3\/SDL_sensor.h 197:33@
sDL_GetSensorNonPortableTypeForID :: BG.FunPtr (SDL_SensorID -> IO BG.CInt)
sDL_GetSensorNonPortableTypeForID =
  BG.unsafePerformIO hs_bindgen_93df6e86c5ae7de1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_OpenSensor@
foreign import ccall unsafe "hs_bindgen_3ddd92169c898cc5"
  hs_bindgen_3ddd92169c898cc5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_OpenSensor@
hs_bindgen_3ddd92169c898cc5 :: IO (BG.FunPtr (SDL_SensorID -> IO (BG.Ptr SDL_Sensor)))
hs_bindgen_3ddd92169c898cc5 =
  BG.fromFFIType hs_bindgen_3ddd92169c898cc5_base

{-# NOINLINE sDL_OpenSensor #-}

-- | Open a sensor for use.
--
--     [@instance_id@]: the sensor instance ID.
--
--     [Returns]: an 'SDL_Sensor' object or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OpenSensor@, defined at @SDL3\/SDL_sensor.h 208:42@
sDL_OpenSensor :: BG.FunPtr (SDL_SensorID -> IO (BG.Ptr SDL_Sensor))
sDL_OpenSensor =
  BG.unsafePerformIO hs_bindgen_3ddd92169c898cc5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorFromID@
foreign import ccall unsafe "hs_bindgen_599e05d453695d54"
  hs_bindgen_599e05d453695d54_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorFromID@
hs_bindgen_599e05d453695d54 :: IO (BG.FunPtr (SDL_SensorID -> IO (BG.Ptr SDL_Sensor)))
hs_bindgen_599e05d453695d54 =
  BG.fromFFIType hs_bindgen_599e05d453695d54_base

{-# NOINLINE sDL_GetSensorFromID #-}

-- | Return the 'SDL_Sensor' associated with an instance ID.
--
--     [@instance_id@]: the sensor instance ID.
--
--     [Returns]: an 'SDL_Sensor' object or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorFromID@, defined at @SDL3\/SDL_sensor.h 219:42@
sDL_GetSensorFromID :: BG.FunPtr (SDL_SensorID -> IO (BG.Ptr SDL_Sensor))
sDL_GetSensorFromID =
  BG.unsafePerformIO hs_bindgen_599e05d453695d54

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorProperties@
foreign import ccall unsafe "hs_bindgen_4164cf08823b4939"
  hs_bindgen_4164cf08823b4939_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorProperties@
hs_bindgen_4164cf08823b4939
  :: IO (BG.FunPtr (BG.Ptr SDL_Sensor -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_4164cf08823b4939 =
  BG.fromFFIType hs_bindgen_4164cf08823b4939_base

{-# NOINLINE sDL_GetSensorProperties #-}

-- | Get the properties associated with a sensor.
--
--     [@sensor@]: the 'SDL_Sensor' object.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorProperties@, defined at @SDL3\/SDL_sensor.h 230:46@
sDL_GetSensorProperties
  :: BG.FunPtr (BG.Ptr SDL_Sensor -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetSensorProperties =
  BG.unsafePerformIO hs_bindgen_4164cf08823b4939

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorName@
foreign import ccall unsafe "hs_bindgen_73c9e66388d63d79"
  hs_bindgen_73c9e66388d63d79_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorName@
hs_bindgen_73c9e66388d63d79 :: IO (BG.FunPtr (BG.Ptr SDL_Sensor -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_73c9e66388d63d79 =
  BG.fromFFIType hs_bindgen_73c9e66388d63d79_base

{-# NOINLINE sDL_GetSensorName #-}

-- | Get the implementation dependent name of a sensor.
--
--     [@sensor@]: the 'SDL_Sensor' object.
--
--     [Returns]: the sensor name or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorName@, defined at @SDL3\/SDL_sensor.h 241:42@
sDL_GetSensorName :: BG.FunPtr (BG.Ptr SDL_Sensor -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetSensorName =
  BG.unsafePerformIO hs_bindgen_73c9e66388d63d79

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorType@
foreign import ccall unsafe "hs_bindgen_d2b64d0316fa8124"
  hs_bindgen_d2b64d0316fa8124_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorType@
hs_bindgen_d2b64d0316fa8124 :: IO (BG.FunPtr (BG.Ptr SDL_Sensor -> IO SDL_SensorType))
hs_bindgen_d2b64d0316fa8124 =
  BG.fromFFIType hs_bindgen_d2b64d0316fa8124_base

{-# NOINLINE sDL_GetSensorType #-}

-- | Get the type of a sensor.
--
--     [@sensor@]: the 'SDL_Sensor' object to inspect.
--
--     [Returns]: the 'SDL_SensorType' type, or @SDL_SENSOR_INVALID@ if @sensor@ is NULL.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorType@, defined at @SDL3\/SDL_sensor.h 252:44@
sDL_GetSensorType :: BG.FunPtr (BG.Ptr SDL_Sensor -> IO SDL_SensorType)
sDL_GetSensorType =
  BG.unsafePerformIO hs_bindgen_d2b64d0316fa8124

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorNonPortableType@
foreign import ccall unsafe "hs_bindgen_0e763d01bffcfa1a"
  hs_bindgen_0e763d01bffcfa1a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorNonPortableType@
hs_bindgen_0e763d01bffcfa1a :: IO (BG.FunPtr (BG.Ptr SDL_Sensor -> IO BG.CInt))
hs_bindgen_0e763d01bffcfa1a =
  BG.fromFFIType hs_bindgen_0e763d01bffcfa1a_base

{-# NOINLINE sDL_GetSensorNonPortableType #-}

-- | Get the platform dependent type of a sensor.
--
--     [@sensor@]: the 'SDL_Sensor' object to inspect.
--
--     [Returns]: the sensor platform dependent type, or -1 if @sensor@ is NULL.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorNonPortableType@, defined at @SDL3\/SDL_sensor.h 262:33@
sDL_GetSensorNonPortableType :: BG.FunPtr (BG.Ptr SDL_Sensor -> IO BG.CInt)
sDL_GetSensorNonPortableType =
  BG.unsafePerformIO hs_bindgen_0e763d01bffcfa1a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorID@
foreign import ccall unsafe "hs_bindgen_ccc4b71ce529cea1"
  hs_bindgen_ccc4b71ce529cea1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorID@
hs_bindgen_ccc4b71ce529cea1 :: IO (BG.FunPtr (BG.Ptr SDL_Sensor -> IO SDL_SensorID))
hs_bindgen_ccc4b71ce529cea1 =
  BG.fromFFIType hs_bindgen_ccc4b71ce529cea1_base

{-# NOINLINE sDL_GetSensorID #-}

-- | Get the instance ID of a sensor.
--
--     [@sensor@]: the 'SDL_Sensor' object to inspect.
--
--     [Returns]: the sensor instance ID, or 0 on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorID@, defined at @SDL3\/SDL_sensor.h 273:42@
sDL_GetSensorID :: BG.FunPtr (BG.Ptr SDL_Sensor -> IO SDL_SensorID)
sDL_GetSensorID =
  BG.unsafePerformIO hs_bindgen_ccc4b71ce529cea1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorData@
foreign import ccall unsafe "hs_bindgen_63c226fd6c34b399"
  hs_bindgen_63c226fd6c34b399_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_GetSensorData@
hs_bindgen_63c226fd6c34b399
  :: IO (BG.FunPtr (BG.Ptr SDL_Sensor -> BG.Ptr BG.CFloat -> BG.CInt -> IO BG.CBool))
hs_bindgen_63c226fd6c34b399 =
  BG.fromFFIType hs_bindgen_63c226fd6c34b399_base

{-# NOINLINE sDL_GetSensorData #-}

-- | Get the current state of an opened sensor.
--
--     The number of values and interpretation of the data is sensor dependent.
--
--     [@sensor@]: the 'SDL_Sensor' object to query.
--
--     [@data@]: a pointer filled with the current sensor state.
--
--     [@num_values@]: the number of values to write to data.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSensorData@, defined at @SDL3\/SDL_sensor.h 288:34@
sDL_GetSensorData :: BG.FunPtr (BG.Ptr SDL_Sensor -> BG.Ptr BG.CFloat -> BG.CInt -> IO BG.CBool)
sDL_GetSensorData =
  BG.unsafePerformIO hs_bindgen_63c226fd6c34b399

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_CloseSensor@
foreign import ccall unsafe "hs_bindgen_a117a0cf60dc00d1"
  hs_bindgen_a117a0cf60dc00d1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_CloseSensor@
hs_bindgen_a117a0cf60dc00d1 :: IO (BG.FunPtr (BG.Ptr SDL_Sensor -> IO ()))
hs_bindgen_a117a0cf60dc00d1 =
  BG.fromFFIType hs_bindgen_a117a0cf60dc00d1_base

{-# NOINLINE sDL_CloseSensor #-}

-- | Close a sensor previously opened with @SDL_OpenSensor()@.
--
--     [@sensor@]: the 'SDL_Sensor' object to close.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CloseSensor@, defined at @SDL3\/SDL_sensor.h 297:34@
sDL_CloseSensor :: BG.FunPtr (BG.Ptr SDL_Sensor -> IO ())
sDL_CloseSensor =
  BG.unsafePerformIO hs_bindgen_a117a0cf60dc00d1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_UpdateSensors@
foreign import ccall unsafe "hs_bindgen_bbc7d6be143f2f1d"
  hs_bindgen_bbc7d6be143f2f1d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Sensor_get_SDL_UpdateSensors@
hs_bindgen_bbc7d6be143f2f1d :: IO (BG.FunPtr (IO ()))
hs_bindgen_bbc7d6be143f2f1d =
  BG.fromFFIType hs_bindgen_bbc7d6be143f2f1d_base

{-# NOINLINE sDL_UpdateSensors #-}

-- | Update the current state of the open sensors.
--
--     This is called automatically by the event loop if sensor events are enabled.
--
--     This needs to be called from the thread that initialized the sensor subsystem.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UpdateSensors@, defined at @SDL3\/SDL_sensor.h 310:34@
sDL_UpdateSensors :: BG.FunPtr (IO ())
sDL_UpdateSensors =
  BG.unsafePerformIO hs_bindgen_bbc7d6be143f2f1d

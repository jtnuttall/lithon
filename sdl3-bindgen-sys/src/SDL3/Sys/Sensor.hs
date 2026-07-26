-- | SDL sensor management.
--
--     These APIs grant access to gyros and accelerometers on various platforms.
--
--     In order to use these functions, 'SDL3.Sys.Init.init' must have been called with the SDL_INIT_SENSOR flag. This causes SDL to scan the system for sensors, and load appropriate drivers. The opaque structure used to identify an opened SDL sensor.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Sensor.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Sensor (
  module SDL3.Sys.Bindgen.Sensor,

  -- * Function aliases
  SDL3.Sys.Sensor.getSensors,
  SDL3.Sys.Sensor.getSensorsSafe,
  SDL3.Sys.Sensor.getSensorNameForID,
  SDL3.Sys.Sensor.getSensorNameForIDSafe,
  SDL3.Sys.Sensor.getSensorTypeForID,
  SDL3.Sys.Sensor.getSensorTypeForIDSafe,
  SDL3.Sys.Sensor.getSensorNonPortableTypeForID,
  SDL3.Sys.Sensor.getSensorNonPortableTypeForIDSafe,
  SDL3.Sys.Sensor.openSensor,
  SDL3.Sys.Sensor.openSensorSafe,
  SDL3.Sys.Sensor.getSensorFromID,
  SDL3.Sys.Sensor.getSensorFromIDSafe,
  SDL3.Sys.Sensor.getSensorProperties,
  SDL3.Sys.Sensor.getSensorPropertiesSafe,
  SDL3.Sys.Sensor.getSensorName,
  SDL3.Sys.Sensor.getSensorNameSafe,
  SDL3.Sys.Sensor.getSensorType,
  SDL3.Sys.Sensor.getSensorTypeSafe,
  SDL3.Sys.Sensor.getSensorNonPortableType,
  SDL3.Sys.Sensor.getSensorNonPortableTypeSafe,
  SDL3.Sys.Sensor.getSensorID,
  SDL3.Sys.Sensor.getSensorIDSafe,
  SDL3.Sys.Sensor.getSensorData,
  SDL3.Sys.Sensor.getSensorDataSafe,
  SDL3.Sys.Sensor.closeSensor,
  SDL3.Sys.Sensor.closeSensorSafe,
  SDL3.Sys.Sensor.updateSensors,
  SDL3.Sys.Sensor.updateSensorsSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Sensor
import SDL3.Sys.Bindgen.Sensor.Safe qualified as Safe
import SDL3.Sys.Bindgen.Sensor.Unsafe qualified as Unsafe

-- | Get a list of currently connected sensors.
--
--     [Returns]: a 0 terminated array of sensor instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSensors@.
--                   The safe flavor is 'getSensorsSafe'
--                   .
--
--     [C declaration]: @SDL_GetSensors@, defined at @SDL3\/SDL_sensor.h 159:44@
getSensors
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of sensors returned, may be NULL.
  -> IO (BG.Ptr SDL_SensorID)
getSensors = Unsafe.sDL_GetSensors

-- | Get a list of currently connected sensors.
--
--     [Returns]: a 0 terminated array of sensor instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSensors@.
--                   The unsafe flavor is 'getSensors'
--                   .
--
--     [C declaration]: @SDL_GetSensors@, defined at @SDL3\/SDL_sensor.h 159:44@
getSensorsSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of sensors returned, may be NULL.
  -> IO (BG.Ptr SDL_SensorID)
getSensorsSafe = Safe.sDL_GetSensors

-- | Get the implementation dependent name of a sensor.
--
--     This can be called before any sensors are opened.
--
--     [Returns]: the sensor name, or NULL if @instance_id@ is not valid.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSensorNameForID@.
--                   The safe flavor is 'getSensorNameForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetSensorNameForID@, defined at @SDL3\/SDL_sensor.h 171:42@
getSensorNameForID
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getSensorNameForID = Unsafe.sDL_GetSensorNameForID

-- | Get the implementation dependent name of a sensor.
--
--     This can be called before any sensors are opened.
--
--     [Returns]: the sensor name, or NULL if @instance_id@ is not valid.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSensorNameForID@.
--                   The unsafe flavor is 'getSensorNameForID'
--                   .
--
--     [C declaration]: @SDL_GetSensorNameForID@, defined at @SDL3\/SDL_sensor.h 171:42@
getSensorNameForIDSafe
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getSensorNameForIDSafe = Safe.sDL_GetSensorNameForID

-- | Get the type of a sensor.
--
--     This can be called before any sensors are opened.
--
--     [Returns]: the 'SDL_SensorType', or @SDL_SENSOR_INVALID@ if @instance_id@ is not valid.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSensorTypeForID@.
--                   The safe flavor is 'getSensorTypeForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetSensorTypeForID@, defined at @SDL3\/SDL_sensor.h 184:44@
getSensorTypeForID
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO SDL_SensorType
getSensorTypeForID = Unsafe.sDL_GetSensorTypeForID

-- | Get the type of a sensor.
--
--     This can be called before any sensors are opened.
--
--     [Returns]: the 'SDL_SensorType', or @SDL_SENSOR_INVALID@ if @instance_id@ is not valid.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSensorTypeForID@.
--                   The unsafe flavor is 'getSensorTypeForID'
--                   .
--
--     [C declaration]: @SDL_GetSensorTypeForID@, defined at @SDL3\/SDL_sensor.h 184:44@
getSensorTypeForIDSafe
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO SDL_SensorType
getSensorTypeForIDSafe = Safe.sDL_GetSensorTypeForID

-- | Get the platform dependent type of a sensor.
--
--     This can be called before any sensors are opened.
--
--     [Returns]: the sensor platform dependent type, or -1 if @instance_id@ is not valid.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSensorNonPortableTypeForID@.
--                   The safe flavor is 'getSensorNonPortableTypeForIDSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSensorNonPortableTypeForID@, defined at @SDL3\/SDL_sensor.h 197:33@
getSensorNonPortableTypeForID
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO BG.Int32
getSensorNonPortableTypeForID =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetSensorNonPortableTypeForID x00)

-- | Get the platform dependent type of a sensor.
--
--     This can be called before any sensors are opened.
--
--     [Returns]: the sensor platform dependent type, or -1 if @instance_id@ is not valid.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSensorNonPortableTypeForID@.
--                   The unsafe flavor is 'getSensorNonPortableTypeForID'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSensorNonPortableTypeForID@, defined at @SDL3\/SDL_sensor.h 197:33@
getSensorNonPortableTypeForIDSafe
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO BG.Int32
getSensorNonPortableTypeForIDSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetSensorNonPortableTypeForID x00)

-- | Open a sensor for use.
--
--     [Returns]: an 'SDL_Sensor' object or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenSensor@.
--                   The safe flavor is 'openSensorSafe'
--                   .
--
--     [C declaration]: @SDL_OpenSensor@, defined at @SDL3\/SDL_sensor.h 208:42@
openSensor
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO (BG.Ptr SDL_Sensor)
openSensor = Unsafe.sDL_OpenSensor

-- | Open a sensor for use.
--
--     [Returns]: an 'SDL_Sensor' object or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenSensor@.
--                   The unsafe flavor is 'openSensor'
--                   .
--
--     [C declaration]: @SDL_OpenSensor@, defined at @SDL3\/SDL_sensor.h 208:42@
openSensorSafe
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO (BG.Ptr SDL_Sensor)
openSensorSafe = Safe.sDL_OpenSensor

-- | Return the 'SDL_Sensor' associated with an instance ID.
--
--     [Returns]: an 'SDL_Sensor' object or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSensorFromID@.
--                   The safe flavor is 'getSensorFromIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetSensorFromID@, defined at @SDL3\/SDL_sensor.h 219:42@
getSensorFromID
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO (BG.Ptr SDL_Sensor)
getSensorFromID = Unsafe.sDL_GetSensorFromID

-- | Return the 'SDL_Sensor' associated with an instance ID.
--
--     [Returns]: an 'SDL_Sensor' object or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSensorFromID@.
--                   The unsafe flavor is 'getSensorFromID'
--                   .
--
--     [C declaration]: @SDL_GetSensorFromID@, defined at @SDL3\/SDL_sensor.h 219:42@
getSensorFromIDSafe
  :: SDL_SensorID
  -- ^
  --
  --           [@instance_id@]: the sensor instance ID.
  -> IO (BG.Ptr SDL_Sensor)
getSensorFromIDSafe = Safe.sDL_GetSensorFromID

-- | Get the properties associated with a sensor.
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSensorProperties@.
--                   The safe flavor is 'getSensorPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetSensorProperties@, defined at @SDL3\/SDL_sensor.h 230:46@
getSensorProperties
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getSensorProperties = Unsafe.sDL_GetSensorProperties

-- | Get the properties associated with a sensor.
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSensorProperties@.
--                   The unsafe flavor is 'getSensorProperties'
--                   .
--
--     [C declaration]: @SDL_GetSensorProperties@, defined at @SDL3\/SDL_sensor.h 230:46@
getSensorPropertiesSafe
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getSensorPropertiesSafe =
  Safe.sDL_GetSensorProperties

-- | Get the implementation dependent name of a sensor.
--
--     [Returns]: the sensor name or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSensorName@.
--                   The safe flavor is 'getSensorNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetSensorName@, defined at @SDL3\/SDL_sensor.h 241:42@
getSensorName
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object.
  -> IO (PtrConst.PtrConst BG.CChar)
getSensorName = Unsafe.sDL_GetSensorName

-- | Get the implementation dependent name of a sensor.
--
--     [Returns]: the sensor name or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSensorName@.
--                   The unsafe flavor is 'getSensorName'
--                   .
--
--     [C declaration]: @SDL_GetSensorName@, defined at @SDL3\/SDL_sensor.h 241:42@
getSensorNameSafe
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object.
  -> IO (PtrConst.PtrConst BG.CChar)
getSensorNameSafe = Safe.sDL_GetSensorName

-- | Get the type of a sensor.
--
--     [Returns]: the 'SDL_SensorType' type, or @SDL_SENSOR_INVALID@ if @sensor@ is NULL.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSensorType@.
--                   The safe flavor is 'getSensorTypeSafe'
--                   .
--
--     [C declaration]: @SDL_GetSensorType@, defined at @SDL3\/SDL_sensor.h 252:44@
getSensorType
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to inspect.
  -> IO SDL_SensorType
getSensorType = Unsafe.sDL_GetSensorType

-- | Get the type of a sensor.
--
--     [Returns]: the 'SDL_SensorType' type, or @SDL_SENSOR_INVALID@ if @sensor@ is NULL.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSensorType@.
--                   The unsafe flavor is 'getSensorType'
--                   .
--
--     [C declaration]: @SDL_GetSensorType@, defined at @SDL3\/SDL_sensor.h 252:44@
getSensorTypeSafe
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to inspect.
  -> IO SDL_SensorType
getSensorTypeSafe = Safe.sDL_GetSensorType

-- | Get the platform dependent type of a sensor.
--
--     [Returns]: the sensor platform dependent type, or -1 if @sensor@ is NULL.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSensorNonPortableType@.
--                   The safe flavor is 'getSensorNonPortableTypeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSensorNonPortableType@, defined at @SDL3\/SDL_sensor.h 262:33@
getSensorNonPortableType
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to inspect.
  -> IO BG.Int32
getSensorNonPortableType =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetSensorNonPortableType x00)

-- | Get the platform dependent type of a sensor.
--
--     [Returns]: the sensor platform dependent type, or -1 if @sensor@ is NULL.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSensorNonPortableType@.
--                   The unsafe flavor is 'getSensorNonPortableType'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSensorNonPortableType@, defined at @SDL3\/SDL_sensor.h 262:33@
getSensorNonPortableTypeSafe
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to inspect.
  -> IO BG.Int32
getSensorNonPortableTypeSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetSensorNonPortableType x00)

-- | Get the instance ID of a sensor.
--
--     [Returns]: the sensor instance ID, or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSensorID@.
--                   The safe flavor is 'getSensorIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetSensorID@, defined at @SDL3\/SDL_sensor.h 273:42@
getSensorID
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to inspect.
  -> IO SDL_SensorID
getSensorID = Unsafe.sDL_GetSensorID

-- | Get the instance ID of a sensor.
--
--     [Returns]: the sensor instance ID, or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSensorID@.
--                   The unsafe flavor is 'getSensorID'
--                   .
--
--     [C declaration]: @SDL_GetSensorID@, defined at @SDL3\/SDL_sensor.h 273:42@
getSensorIDSafe
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to inspect.
  -> IO SDL_SensorID
getSensorIDSafe = Safe.sDL_GetSensorID

-- | Get the current state of an opened sensor.
--
--     The number of values and interpretation of the data is sensor dependent.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSensorData@.
--                   The safe flavor is 'getSensorDataSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSensorData@, defined at @SDL3\/SDL_sensor.h 288:34@
getSensorData
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to query.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@data@]: a pointer filled with the current sensor state.
  -> BG.Int32
  -- ^
  --
  --           [@num_values@]: the number of values to write to data.
  -> IO Bool
getSensorData =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetSensorData x00 x11 (Coerce.coerce x22))

-- | Get the current state of an opened sensor.
--
--     The number of values and interpretation of the data is sensor dependent.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSensorData@.
--                   The unsafe flavor is 'getSensorData'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSensorData@, defined at @SDL3\/SDL_sensor.h 288:34@
getSensorDataSafe
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to query.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@data@]: a pointer filled with the current sensor state.
  -> BG.Int32
  -- ^
  --
  --           [@num_values@]: the number of values to write to data.
  -> IO Bool
getSensorDataSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetSensorData x00 x11 (Coerce.coerce x22))

-- | Close a sensor previously opened with @'openSensor'@.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CloseSensor@.
--                   The safe flavor is 'closeSensorSafe'
--                   .
--
--     [C declaration]: @SDL_CloseSensor@, defined at @SDL3\/SDL_sensor.h 297:34@
closeSensor
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to close.
  -> IO ()
closeSensor = Unsafe.sDL_CloseSensor

-- | Close a sensor previously opened with @'openSensor'@.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CloseSensor@.
--                   The unsafe flavor is 'closeSensor'
--                   .
--
--     [C declaration]: @SDL_CloseSensor@, defined at @SDL3\/SDL_sensor.h 297:34@
closeSensorSafe
  :: BG.Ptr SDL_Sensor
  -- ^
  --
  --           [@sensor@]: the 'SDL_Sensor' object to close.
  -> IO ()
closeSensorSafe = Safe.sDL_CloseSensor

-- | Update the current state of the open sensors.
--
--     This is called automatically by the event loop if sensor events are enabled.
--
--     This needs to be called from the thread that initialized the sensor subsystem.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UpdateSensors@.
--                   The safe flavor is 'updateSensorsSafe'
--                   : routes through joystick update; virtual-device callbacks run synchronously.
--
--     [C declaration]: @SDL_UpdateSensors@, defined at @SDL3\/SDL_sensor.h 310:34@
updateSensors :: IO ()
updateSensors = Unsafe.sDL_UpdateSensors

-- | Update the current state of the open sensors.
--
--     This is called automatically by the event loop if sensor events are enabled.
--
--     This needs to be called from the thread that initialized the sensor subsystem.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UpdateSensors@.
--                   The unsafe flavor is 'updateSensors'
--                   : routes through joystick update; virtual-device callbacks run synchronously.
--
--     [C declaration]: @SDL_UpdateSensors@, defined at @SDL3\/SDL_sensor.h 310:34@
updateSensorsSafe :: IO ()
updateSensorsSafe = Safe.sDL_UpdateSensors

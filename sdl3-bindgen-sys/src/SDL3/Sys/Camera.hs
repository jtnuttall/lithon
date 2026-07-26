-- | Video capture for the SDL library.
--
--     This API lets apps read input from video sources, like webcams. Camera devices can be enumerated, queried, and opened. Once opened, it will provide SDL_Surface objects as new frames of video come in. These surfaces can be uploaded to an SDL_Texture or processed as pixels in memory.
--
--     Several platforms will alert the user if an app tries to access a camera, and some will present a UI asking the user if your application should be allowed to obtain images at all, which they can deny. A successfully opened camera will not provide images until permission is granted. Applications, after opening a camera device, can see if they were granted access by either polling with the @'getCameraPermissionState'@ function, or waiting for an SDL_EVENT_CAMERA_DEVICE_APPROVED or SDL_EVENT_CAMERA_DEVICE_DENIED event. Platforms that don\'t have any user approval process will report approval immediately.
--
--     Note that SDL cameras only provide video as individual frames; they will not provide full-motion video encoded in a movie file format, although an app is free to encode the acquired frames into any format it likes. It also does not provide audio from the camera hardware through this API; not only do many webcams not have microphones at all, many people from streamers to people on Zoom calls will want to use a separate microphone regardless of the camera. In any case, recorded audio will be available through SDL\'s audio API no matter what hardware provides the microphone.
--
--     Camera gotchas
--
--     Consumer-level camera hardware tends to take a little while to warm up, once the device has been opened. Generally most camera apps have some sort of UI to take a picture (a button to snap a pic while a preview is showing, some sort of multi-second countdown for the user to pose, like a photo booth), which puts control in the users\' hands, or they are intended to stay on for long times (Pokemon Go, etc).
--
--     It\'s not uncommon that a newly-opened camera will provide a couple of completely black frames, maybe followed by some under-exposed images. If taking a single frame automatically, or recording video from a camera\'s input without the user initiating it from a preview, it could be wise to drop the first several frames (if not the first several /seconds/ worth of frames!) before using images from a camera. This is a unique ID for a camera device for the time it is connected to the system, and is never reused for the lifetime of the application.
--
--     If the device is disconnected and reconnected, it will get a new ID.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
--
--     [See also]: 'getCameras'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Camera.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Camera (
  module SDL3.Sys.Bindgen.Camera,

  -- * Function aliases
  SDL3.Sys.Camera.getNumCameraDrivers,
  SDL3.Sys.Camera.getNumCameraDriversSafe,
  SDL3.Sys.Camera.getCameraDriver,
  SDL3.Sys.Camera.getCameraDriverSafe,
  SDL3.Sys.Camera.getCurrentCameraDriver,
  SDL3.Sys.Camera.getCurrentCameraDriverSafe,
  SDL3.Sys.Camera.getCameras,
  SDL3.Sys.Camera.getCamerasSafe,
  SDL3.Sys.Camera.getCameraSupportedFormats,
  SDL3.Sys.Camera.getCameraSupportedFormatsSafe,
  SDL3.Sys.Camera.getCameraName,
  SDL3.Sys.Camera.getCameraNameSafe,
  SDL3.Sys.Camera.getCameraPosition,
  SDL3.Sys.Camera.getCameraPositionSafe,
  SDL3.Sys.Camera.openCamera,
  SDL3.Sys.Camera.openCameraSafe,
  SDL3.Sys.Camera.getCameraPermissionState,
  SDL3.Sys.Camera.getCameraPermissionStateSafe,
  SDL3.Sys.Camera.getCameraID,
  SDL3.Sys.Camera.getCameraIDSafe,
  SDL3.Sys.Camera.getCameraProperties,
  SDL3.Sys.Camera.getCameraPropertiesSafe,
  SDL3.Sys.Camera.getCameraFormat,
  SDL3.Sys.Camera.getCameraFormatSafe,
  SDL3.Sys.Camera.acquireCameraFrame,
  SDL3.Sys.Camera.acquireCameraFrameSafe,
  SDL3.Sys.Camera.releaseCameraFrame,
  SDL3.Sys.Camera.releaseCameraFrameSafe,
  SDL3.Sys.Camera.closeCamera,
  SDL3.Sys.Camera.closeCameraSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Camera
import SDL3.Sys.Bindgen.Camera.Safe qualified as Safe
import SDL3.Sys.Bindgen.Camera.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Surface qualified

-- | Use this function to get the number of built-in camera drivers.
--
--     This function returns a hardcoded number. This never returns a negative value; if there are no drivers compiled into this build of SDL, this function returns zero. The presence of a driver in this list does not mean it will function, it just means SDL is capable of interacting with that interface. For example, a build of SDL might have v4l2 support, but if there\'s no kernel support available, SDL\'s v4l2 driver would fail if used.
--
--     By default, SDL tries all drivers, in its preferred order, until one is found to be usable.
--
--     [Returns]: the number of built-in camera drivers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCameraDriver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumCameraDrivers@.
--                   The safe flavor is 'getNumCameraDriversSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumCameraDrivers@, defined at @SDL3\/SDL_camera.h 175:33@
getNumCameraDrivers :: IO BG.Int32
getNumCameraDrivers =
  fmap Coerce.coerce Unsafe.sDL_GetNumCameraDrivers

-- | Use this function to get the number of built-in camera drivers.
--
--     This function returns a hardcoded number. This never returns a negative value; if there are no drivers compiled into this build of SDL, this function returns zero. The presence of a driver in this list does not mean it will function, it just means SDL is capable of interacting with that interface. For example, a build of SDL might have v4l2 support, but if there\'s no kernel support available, SDL\'s v4l2 driver would fail if used.
--
--     By default, SDL tries all drivers, in its preferred order, until one is found to be usable.
--
--     [Returns]: the number of built-in camera drivers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCameraDriver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumCameraDrivers@.
--                   The unsafe flavor is 'getNumCameraDrivers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumCameraDrivers@, defined at @SDL3\/SDL_camera.h 175:33@
getNumCameraDriversSafe :: IO BG.Int32
getNumCameraDriversSafe =
  fmap Coerce.coerce Safe.sDL_GetNumCameraDrivers

-- | Use this function to get the name of a built in camera driver.
--
--     The list of camera drivers is given in the order that they are normally initialized by default; the drivers that seem more reasonable to choose first (as far as the SDL developers believe) are earlier in the list.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"v4l2\", \"coremedia\" or \"android\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the camera driver at the requested index, or NULL if an invalid index was specified.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumCameraDrivers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCameraDriver@.
--                   The safe flavor is 'getCameraDriverSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetCameraDriver@, defined at @SDL3\/SDL_camera.h 199:42@
getCameraDriver
  :: BG.Int32
  -- ^
  --
  --           [@index@]: the index of the camera driver; the value ranges from 0 to @'getNumCameraDrivers'@ - 1.
  -> IO (PtrConst.PtrConst BG.CChar)
getCameraDriver =
  \x00 ->
    Unsafe.sDL_GetCameraDriver (Coerce.coerce x00)

-- | Use this function to get the name of a built in camera driver.
--
--     The list of camera drivers is given in the order that they are normally initialized by default; the drivers that seem more reasonable to choose first (as far as the SDL developers believe) are earlier in the list.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"v4l2\", \"coremedia\" or \"android\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the camera driver at the requested index, or NULL if an invalid index was specified.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumCameraDrivers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCameraDriver@.
--                   The unsafe flavor is 'getCameraDriver'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetCameraDriver@, defined at @SDL3\/SDL_camera.h 199:42@
getCameraDriverSafe
  :: BG.Int32
  -- ^
  --
  --           [@index@]: the index of the camera driver; the value ranges from 0 to @'getNumCameraDrivers'@ - 1.
  -> IO (PtrConst.PtrConst BG.CChar)
getCameraDriverSafe =
  \x00 -> Safe.sDL_GetCameraDriver (Coerce.coerce x00)

-- | Get the name of the current camera driver.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"v4l2\", \"coremedia\" or \"android\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the current camera driver or NULL if no driver has been initialized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCurrentCameraDriver@.
--                   The safe flavor is 'getCurrentCameraDriverSafe'
--                   .
--
--     [C declaration]: @SDL_GetCurrentCameraDriver@, defined at @SDL3\/SDL_camera.h 215:42@
getCurrentCameraDriver :: IO (PtrConst.PtrConst BG.CChar)
getCurrentCameraDriver =
  Unsafe.sDL_GetCurrentCameraDriver

-- | Get the name of the current camera driver.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"v4l2\", \"coremedia\" or \"android\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the current camera driver or NULL if no driver has been initialized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCurrentCameraDriver@.
--                   The unsafe flavor is 'getCurrentCameraDriver'
--                   .
--
--     [C declaration]: @SDL_GetCurrentCameraDriver@, defined at @SDL3\/SDL_camera.h 215:42@
getCurrentCameraDriverSafe :: IO (PtrConst.PtrConst BG.CChar)
getCurrentCameraDriverSafe =
  Safe.sDL_GetCurrentCameraDriver

-- | Get a list of currently connected camera devices.
--
--     [Returns]: a 0 terminated array of camera instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openCamera'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCameras@.
--                   The safe flavor is 'getCamerasSafe'
--                   .
--
--     [C declaration]: @SDL_GetCameras@, defined at @SDL3\/SDL_camera.h 232:44@
getCameras
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of cameras returned, may be NULL.
  -> IO (BG.Ptr SDL_CameraID)
getCameras = Unsafe.sDL_GetCameras

-- | Get a list of currently connected camera devices.
--
--     [Returns]: a 0 terminated array of camera instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openCamera'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCameras@.
--                   The unsafe flavor is 'getCameras'
--                   .
--
--     [C declaration]: @SDL_GetCameras@, defined at @SDL3\/SDL_camera.h 232:44@
getCamerasSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of cameras returned, may be NULL.
  -> IO (BG.Ptr SDL_CameraID)
getCamerasSafe = Safe.sDL_GetCameras

-- | Get the list of native formats\/sizes a camera supports.
--
--     This returns a list of all formats and frame sizes that a specific camera can offer. This is useful if your app can accept a variety of image formats and sizes and so want to find the optimal spec that doesn\'t require conversion.
--
--     This function isn\'t strictly required; if you call 'openCamera' with a NULL spec, SDL will choose a native format for you, and if you instead specify a desired format, it will transparently convert to the requested format on your behalf.
--
--     If @count@ is not NULL, it will be filled with the number of elements in the returned array.
--
--     Note that it\'s legal for a camera to supply an empty list. This is what will happen on Emscripten builds, since that platform won\'t tell /anything/ about available cameras until you\'ve opened one, and won\'t even tell if there /is/ a camera until the user has given you permission to check through a scary warning popup.
--
--     [Returns]: a NULL terminated array of pointers to 'SDL_CameraSpec' or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCameras', 'openCamera'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCameraSupportedFormats@.
--                   The safe flavor is 'getCameraSupportedFormatsSafe'
--                   .
--
--     [C declaration]: @SDL_GetCameraSupportedFormats@, defined at @SDL3\/SDL_camera.h 271:47@
getCameraSupportedFormats
  :: SDL_CameraID
  -- ^
  --
  --           [@instance_id@]: the camera device instance ID.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of elements in the list, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_CameraSpec))
getCameraSupportedFormats =
  Unsafe.sDL_GetCameraSupportedFormats

-- | Get the list of native formats\/sizes a camera supports.
--
--     This returns a list of all formats and frame sizes that a specific camera can offer. This is useful if your app can accept a variety of image formats and sizes and so want to find the optimal spec that doesn\'t require conversion.
--
--     This function isn\'t strictly required; if you call 'openCamera' with a NULL spec, SDL will choose a native format for you, and if you instead specify a desired format, it will transparently convert to the requested format on your behalf.
--
--     If @count@ is not NULL, it will be filled with the number of elements in the returned array.
--
--     Note that it\'s legal for a camera to supply an empty list. This is what will happen on Emscripten builds, since that platform won\'t tell /anything/ about available cameras until you\'ve opened one, and won\'t even tell if there /is/ a camera until the user has given you permission to check through a scary warning popup.
--
--     [Returns]: a NULL terminated array of pointers to 'SDL_CameraSpec' or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCameras', 'openCamera'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCameraSupportedFormats@.
--                   The unsafe flavor is 'getCameraSupportedFormats'
--                   .
--
--     [C declaration]: @SDL_GetCameraSupportedFormats@, defined at @SDL3\/SDL_camera.h 271:47@
getCameraSupportedFormatsSafe
  :: SDL_CameraID
  -- ^
  --
  --           [@instance_id@]: the camera device instance ID.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of elements in the list, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_CameraSpec))
getCameraSupportedFormatsSafe =
  Safe.sDL_GetCameraSupportedFormats

-- | Get the human-readable device name for a camera.
--
--     [Returns]: a human-readable device name or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCameras'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCameraName@.
--                   The safe flavor is 'getCameraNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetCameraName@, defined at @SDL3\/SDL_camera.h 286:42@
getCameraName
  :: SDL_CameraID
  -- ^
  --
  --           [@instance_id@]: the camera device instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getCameraName = Unsafe.sDL_GetCameraName

-- | Get the human-readable device name for a camera.
--
--     [Returns]: a human-readable device name or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCameras'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCameraName@.
--                   The unsafe flavor is 'getCameraName'
--                   .
--
--     [C declaration]: @SDL_GetCameraName@, defined at @SDL3\/SDL_camera.h 286:42@
getCameraNameSafe
  :: SDL_CameraID
  -- ^
  --
  --           [@instance_id@]: the camera device instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getCameraNameSafe = Safe.sDL_GetCameraName

-- | Get the position of the camera in relation to the system.
--
--     Most platforms will report UNKNOWN, but mobile devices, like phones, can often make a distinction between cameras on the front of the device (that points towards the user, for taking \"selfies\") and cameras on the back (for filming in the direction the user is facing).
--
--     [Returns]: the position of the camera on the system hardware.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCameras'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCameraPosition@.
--                   The safe flavor is 'getCameraPositionSafe'
--                   .
--
--     [C declaration]: @SDL_GetCameraPosition@, defined at @SDL3\/SDL_camera.h 305:48@
getCameraPosition
  :: SDL_CameraID
  -- ^
  --
  --           [@instance_id@]: the camera device instance ID.
  -> IO SDL_CameraPosition
getCameraPosition = Unsafe.sDL_GetCameraPosition

-- | Get the position of the camera in relation to the system.
--
--     Most platforms will report UNKNOWN, but mobile devices, like phones, can often make a distinction between cameras on the front of the device (that points towards the user, for taking \"selfies\") and cameras on the back (for filming in the direction the user is facing).
--
--     [Returns]: the position of the camera on the system hardware.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCameras'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCameraPosition@.
--                   The unsafe flavor is 'getCameraPosition'
--                   .
--
--     [C declaration]: @SDL_GetCameraPosition@, defined at @SDL3\/SDL_camera.h 305:48@
getCameraPositionSafe
  :: SDL_CameraID
  -- ^
  --
  --           [@instance_id@]: the camera device instance ID.
  -> IO SDL_CameraPosition
getCameraPositionSafe = Safe.sDL_GetCameraPosition

-- | Open a video recording device (a \"camera\").
--
--     You can open the device with any reasonable spec, and if the hardware can\'t directly support it, it will convert data seamlessly to the requested format. This might incur overhead, including scaling of image data.
--
--     If you would rather accept whatever format the device offers, you can pass a NULL spec here and it will choose one for you (and you can use SDL_Surface\'s conversion\/scaling functions directly if necessary).
--
--     You can call @'getCameraFormat'@ to get the actual data format if passing a NULL spec here. You can see the exact specs a device can support without conversion with @'getCameraSupportedFormats'@.
--
--     SDL will not attempt to emulate framerate; it will try to set the hardware to the rate closest to the requested speed, but it won\'t attempt to limit or duplicate frames artificially; call @'getCameraFormat'@ to see the actual framerate of the opened the device, and check your timestamps if this is crucial to your app!
--
--     Note that the camera is not usable until the user approves its use! On some platforms, the operating system will prompt the user to permit access to the camera, and they can choose Yes or No at that point. Until they do, the camera will not be usable. The app should either wait for an SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event, or poll @'getCameraPermissionState'@ occasionally until it returns non-zero. On platforms that don\'t require explicit user approval (and perhaps in places where the user previously permitted access), the approval event might come immediately, but it might come seconds, minutes, or hours later!
--
--     [Returns]: an 'SDL_Camera' object or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCameras', 'getCameraFormat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenCamera@.
--                   The safe flavor is 'openCameraSafe'
--                   .
--
--     [C declaration]: @SDL_OpenCamera@, defined at @SDL3\/SDL_camera.h 352:42@
openCamera
  :: SDL_CameraID
  -- ^
  --
  --           [@instance_id@]: the camera device instance ID.
  -> PtrConst.PtrConst SDL_CameraSpec
  -- ^
  --
  --           [@spec@]: the desired format for data the device will provide. Can be NULL.
  -> IO (BG.Ptr SDL_Camera)
openCamera = Unsafe.sDL_OpenCamera

-- | Open a video recording device (a \"camera\").
--
--     You can open the device with any reasonable spec, and if the hardware can\'t directly support it, it will convert data seamlessly to the requested format. This might incur overhead, including scaling of image data.
--
--     If you would rather accept whatever format the device offers, you can pass a NULL spec here and it will choose one for you (and you can use SDL_Surface\'s conversion\/scaling functions directly if necessary).
--
--     You can call @'getCameraFormat'@ to get the actual data format if passing a NULL spec here. You can see the exact specs a device can support without conversion with @'getCameraSupportedFormats'@.
--
--     SDL will not attempt to emulate framerate; it will try to set the hardware to the rate closest to the requested speed, but it won\'t attempt to limit or duplicate frames artificially; call @'getCameraFormat'@ to see the actual framerate of the opened the device, and check your timestamps if this is crucial to your app!
--
--     Note that the camera is not usable until the user approves its use! On some platforms, the operating system will prompt the user to permit access to the camera, and they can choose Yes or No at that point. Until they do, the camera will not be usable. The app should either wait for an SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event, or poll @'getCameraPermissionState'@ occasionally until it returns non-zero. On platforms that don\'t require explicit user approval (and perhaps in places where the user previously permitted access), the approval event might come immediately, but it might come seconds, minutes, or hours later!
--
--     [Returns]: an 'SDL_Camera' object or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCameras', 'getCameraFormat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenCamera@.
--                   The unsafe flavor is 'openCamera'
--                   .
--
--     [C declaration]: @SDL_OpenCamera@, defined at @SDL3\/SDL_camera.h 352:42@
openCameraSafe
  :: SDL_CameraID
  -- ^
  --
  --           [@instance_id@]: the camera device instance ID.
  -> PtrConst.PtrConst SDL_CameraSpec
  -- ^
  --
  --           [@spec@]: the desired format for data the device will provide. Can be NULL.
  -> IO (BG.Ptr SDL_Camera)
openCameraSafe = Safe.sDL_OpenCamera

-- | Query if camera access has been approved by the user.
--
--     Cameras will not function between when the device is opened by the app and when the user permits access to the hardware. On some platforms, this presents as a popup dialog where the user has to explicitly approve access; on others the approval might be implicit and not alert the user at all.
--
--     This function can be used to check the status of that approval. It will return SDL_CAMERA_PERMISSION_STATE_PENDING if waiting for user response, SDL_CAMERA_PERMISSION_STATE_APPROVED if the camera is approved for use, and SDL_CAMERA_PERMISSION_STATE_DENIED if the user denied access.
--
--     Instead of polling with this function, you can wait for a SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event in the standard SDL event loop, which is guaranteed to be sent once when permission to use the camera is decided.
--
--     If a camera is declined, there\'s nothing to be done but call @'closeCamera'@ to dispose of it.
--
--     [Returns]: an 'SDL_CameraPermissionState' value indicating if access is granted, or @SDL_CAMERA_PERMISSION_STATE_PENDING@ if the decision is still pending.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openCamera', 'closeCamera'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCameraPermissionState@.
--                   The safe flavor is 'getCameraPermissionStateSafe'
--                   .
--
--     [C declaration]: @SDL_GetCameraPermissionState@, defined at @SDL3\/SDL_camera.h 387:55@
getCameraPermissionState
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: the opened camera device to query.
  -> IO SDL_CameraPermissionState
getCameraPermissionState =
  Unsafe.sDL_GetCameraPermissionState

-- | Query if camera access has been approved by the user.
--
--     Cameras will not function between when the device is opened by the app and when the user permits access to the hardware. On some platforms, this presents as a popup dialog where the user has to explicitly approve access; on others the approval might be implicit and not alert the user at all.
--
--     This function can be used to check the status of that approval. It will return SDL_CAMERA_PERMISSION_STATE_PENDING if waiting for user response, SDL_CAMERA_PERMISSION_STATE_APPROVED if the camera is approved for use, and SDL_CAMERA_PERMISSION_STATE_DENIED if the user denied access.
--
--     Instead of polling with this function, you can wait for a SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event in the standard SDL event loop, which is guaranteed to be sent once when permission to use the camera is decided.
--
--     If a camera is declined, there\'s nothing to be done but call @'closeCamera'@ to dispose of it.
--
--     [Returns]: an 'SDL_CameraPermissionState' value indicating if access is granted, or @SDL_CAMERA_PERMISSION_STATE_PENDING@ if the decision is still pending.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openCamera', 'closeCamera'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCameraPermissionState@.
--                   The unsafe flavor is 'getCameraPermissionState'
--                   .
--
--     [C declaration]: @SDL_GetCameraPermissionState@, defined at @SDL3\/SDL_camera.h 387:55@
getCameraPermissionStateSafe
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: the opened camera device to query.
  -> IO SDL_CameraPermissionState
getCameraPermissionStateSafe =
  Safe.sDL_GetCameraPermissionState

-- | Get the instance ID of an opened camera.
--
--     [Returns]: the instance ID of the specified camera on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openCamera'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCameraID@.
--                   The safe flavor is 'getCameraIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetCameraID@, defined at @SDL3\/SDL_camera.h 402:42@
getCameraID
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: an 'SDL_Camera' to query.
  -> IO SDL_CameraID
getCameraID = Unsafe.sDL_GetCameraID

-- | Get the instance ID of an opened camera.
--
--     [Returns]: the instance ID of the specified camera on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openCamera'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCameraID@.
--                   The unsafe flavor is 'getCameraID'
--                   .
--
--     [C declaration]: @SDL_GetCameraID@, defined at @SDL3\/SDL_camera.h 402:42@
getCameraIDSafe
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: an 'SDL_Camera' to query.
  -> IO SDL_CameraID
getCameraIDSafe = Safe.sDL_GetCameraID

-- | Get the properties associated with an opened camera.
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCameraProperties@.
--                   The safe flavor is 'getCameraPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetCameraProperties@, defined at @SDL3\/SDL_camera.h 415:46@
getCameraProperties
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: the 'SDL_Camera' obtained from @'openCamera'@.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getCameraProperties = Unsafe.sDL_GetCameraProperties

-- | Get the properties associated with an opened camera.
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCameraProperties@.
--                   The unsafe flavor is 'getCameraProperties'
--                   .
--
--     [C declaration]: @SDL_GetCameraProperties@, defined at @SDL3\/SDL_camera.h 415:46@
getCameraPropertiesSafe
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: the 'SDL_Camera' obtained from @'openCamera'@.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getCameraPropertiesSafe =
  Safe.sDL_GetCameraProperties

-- | Get the spec that a camera is using when generating images.
--
--     Note that this might not be the native format of the hardware, as SDL might be converting to this format behind the scenes.
--
--     If the system is waiting for the user to approve access to the camera, as some platforms require, this will return false, but this isn\'t necessarily a fatal error; you should either wait for an SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event, or poll @'getCameraPermissionState'@ occasionally until it returns non-zero.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openCamera'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCameraFormat@.
--                   The safe flavor is 'getCameraFormatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetCameraFormat@, defined at @SDL3\/SDL_camera.h 441:34@
getCameraFormat
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: opened camera device.
  -> BG.Ptr SDL_CameraSpec
  -- ^
  --
  --           [@spec@]: the 'SDL_CameraSpec' to be initialized by this function.
  -> IO Bool
getCameraFormat =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetCameraFormat x00 x11)

-- | Get the spec that a camera is using when generating images.
--
--     Note that this might not be the native format of the hardware, as SDL might be converting to this format behind the scenes.
--
--     If the system is waiting for the user to approve access to the camera, as some platforms require, this will return false, but this isn\'t necessarily a fatal error; you should either wait for an SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event, or poll @'getCameraPermissionState'@ occasionally until it returns non-zero.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openCamera'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCameraFormat@.
--                   The unsafe flavor is 'getCameraFormat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetCameraFormat@, defined at @SDL3\/SDL_camera.h 441:34@
getCameraFormatSafe
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: opened camera device.
  -> BG.Ptr SDL_CameraSpec
  -- ^
  --
  --           [@spec@]: the 'SDL_CameraSpec' to be initialized by this function.
  -> IO Bool
getCameraFormatSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetCameraFormat x00 x11)

-- | Acquire a frame.
--
--     The frame is a memory pointer to the image data, whose size and format are given by the spec requested when opening the device.
--
--     This is a non blocking API. If there is a frame available, a non-NULL surface is returned, and timestampNS will be filled with a non-zero value.
--
--     Note that an error case can also return NULL, but a NULL by itself is normal and just signifies that a new frame is not yet available. Note that even if a camera device fails outright (a USB camera is unplugged while in use, etc), SDL will send an event separately to notify the app, but continue to provide blank frames at ongoing intervals until @'closeCamera'@ is called, so real failure here is almost always an out of memory condition.
--
--     After use, the frame should be released with @'releaseCameraFrame'@. If you don\'t do this, the system may stop providing more video!
--
--     Do not call 'SDL3.Sys.Surface.destroySurface' on the returned surface! It must be given back to the camera subsystem with 'releaseCameraFrame'!
--
--     If the system is waiting for the user to approve access to the camera, as some platforms require, this will return NULL (no frames available); you should either wait for an SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event, or poll @'getCameraPermissionState'@ occasionally until it returns non-zero.
--
--     [Returns]: a new frame of video on success, NULL if none is currently available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'releaseCameraFrame'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AcquireCameraFrame@.
--                   The safe flavor is 'acquireCameraFrameSafe'
--                   .
--
--     [C declaration]: @SDL_AcquireCameraFrame@, defined at @SDL3\/SDL_camera.h 484:43@
acquireCameraFrame
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: opened camera device.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@timestampNS@]: a pointer filled in with the frame\'s timestamp, or 0 on error. Can be NULL.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
acquireCameraFrame = Unsafe.sDL_AcquireCameraFrame

-- | Acquire a frame.
--
--     The frame is a memory pointer to the image data, whose size and format are given by the spec requested when opening the device.
--
--     This is a non blocking API. If there is a frame available, a non-NULL surface is returned, and timestampNS will be filled with a non-zero value.
--
--     Note that an error case can also return NULL, but a NULL by itself is normal and just signifies that a new frame is not yet available. Note that even if a camera device fails outright (a USB camera is unplugged while in use, etc), SDL will send an event separately to notify the app, but continue to provide blank frames at ongoing intervals until @'closeCamera'@ is called, so real failure here is almost always an out of memory condition.
--
--     After use, the frame should be released with @'releaseCameraFrame'@. If you don\'t do this, the system may stop providing more video!
--
--     Do not call 'SDL3.Sys.Surface.destroySurface' on the returned surface! It must be given back to the camera subsystem with 'releaseCameraFrame'!
--
--     If the system is waiting for the user to approve access to the camera, as some platforms require, this will return NULL (no frames available); you should either wait for an SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event, or poll @'getCameraPermissionState'@ occasionally until it returns non-zero.
--
--     [Returns]: a new frame of video on success, NULL if none is currently available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'releaseCameraFrame'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AcquireCameraFrame@.
--                   The unsafe flavor is 'acquireCameraFrame'
--                   .
--
--     [C declaration]: @SDL_AcquireCameraFrame@, defined at @SDL3\/SDL_camera.h 484:43@
acquireCameraFrameSafe
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: opened camera device.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@timestampNS@]: a pointer filled in with the frame\'s timestamp, or 0 on error. Can be NULL.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
acquireCameraFrameSafe = Safe.sDL_AcquireCameraFrame

-- | Release a frame of video acquired from a camera.
--
--     Let the back-end re-use the internal buffer for camera.
--
--     This function /must/ be called only on surface objects returned by @'acquireCameraFrame'@. This function should be called as quickly as possible after acquisition, as SDL keeps a small FIFO queue of surfaces for video frames; if surfaces aren\'t released in a timely manner, SDL may drop upcoming video frames from the camera.
--
--     If the app needs to keep the surface for a significant time, they should make a copy of it and release the original.
--
--     The app should not use the surface again after calling this function; assume the surface is freed and the pointer is invalid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'acquireCameraFrame'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReleaseCameraFrame@.
--                   The safe flavor is 'releaseCameraFrameSafe'
--                   .
--
--     [C declaration]: @SDL_ReleaseCameraFrame@, defined at @SDL3\/SDL_camera.h 512:34@
releaseCameraFrame
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: opened camera device.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@frame@]: the video frame surface to release.
  -> IO ()
releaseCameraFrame = Unsafe.sDL_ReleaseCameraFrame

-- | Release a frame of video acquired from a camera.
--
--     Let the back-end re-use the internal buffer for camera.
--
--     This function /must/ be called only on surface objects returned by @'acquireCameraFrame'@. This function should be called as quickly as possible after acquisition, as SDL keeps a small FIFO queue of surfaces for video frames; if surfaces aren\'t released in a timely manner, SDL may drop upcoming video frames from the camera.
--
--     If the app needs to keep the surface for a significant time, they should make a copy of it and release the original.
--
--     The app should not use the surface again after calling this function; assume the surface is freed and the pointer is invalid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'acquireCameraFrame'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReleaseCameraFrame@.
--                   The unsafe flavor is 'releaseCameraFrame'
--                   .
--
--     [C declaration]: @SDL_ReleaseCameraFrame@, defined at @SDL3\/SDL_camera.h 512:34@
releaseCameraFrameSafe
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: opened camera device.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@frame@]: the video frame surface to release.
  -> IO ()
releaseCameraFrameSafe = Safe.sDL_ReleaseCameraFrame

-- | Use this function to shut down camera processing and close the camera device.
--
--     [Thread safety]: It is safe to call this function from any thread, but no thread may reference @device@ once this function is called.
--
--     @since 3.2.0
--
--     [See also]: 'openCamera'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CloseCamera@.
--                   The safe flavor is 'closeCameraSafe'
--                   .
--
--     [C declaration]: @SDL_CloseCamera@, defined at @SDL3\/SDL_camera.h 527:34@
closeCamera
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: opened camera device.
  -> IO ()
closeCamera = Unsafe.sDL_CloseCamera

-- | Use this function to shut down camera processing and close the camera device.
--
--     [Thread safety]: It is safe to call this function from any thread, but no thread may reference @device@ once this function is called.
--
--     @since 3.2.0
--
--     [See also]: 'openCamera'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CloseCamera@.
--                   The unsafe flavor is 'closeCamera'
--                   .
--
--     [C declaration]: @SDL_CloseCamera@, defined at @SDL3\/SDL_camera.h 527:34@
closeCameraSafe
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: opened camera device.
  -> IO ()
closeCameraSafe = Safe.sDL_CloseCamera

{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Camera.Safe (
  SDL3.Sys.Bindgen.Camera.Safe.sDL_GetNumCameraDrivers,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_GetCameraDriver,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_GetCurrentCameraDriver,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_GetCameras,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_GetCameraSupportedFormats,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_GetCameraName,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_GetCameraPosition,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_OpenCamera,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_GetCameraPermissionState,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_GetCameraID,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_GetCameraProperties,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_GetCameraFormat,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_AcquireCameraFrame,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_ReleaseCameraFrame,
  SDL3.Sys.Bindgen.Camera.Safe.sDL_CloseCamera,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Camera
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Surface qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_camera.h>"
         , "signed int hs_bindgen_cd72562c40895f9d (void)"
         , "{"
         , "  return (SDL_GetNumCameraDrivers)();"
         , "}"
         , "char const *hs_bindgen_1b2353edfbc61157 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_GetCameraDriver)(arg1);"
         , "}"
         , "char const *hs_bindgen_eb2b917f28fc96fd (void)"
         , "{"
         , "  return (SDL_GetCurrentCameraDriver)();"
         , "}"
         , "SDL_CameraID *hs_bindgen_1ba2aef0a8cc6032 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetCameras)(arg1);"
         , "}"
         , "SDL_CameraSpec **hs_bindgen_5a031667f9d45a0d ("
         , "  SDL_CameraID arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetCameraSupportedFormats)(arg1, arg2);"
         , "}"
         , "char const *hs_bindgen_1fe2503ad9612c29 ("
         , "  SDL_CameraID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetCameraName)(arg1);"
         , "}"
         , "SDL_CameraPosition hs_bindgen_53c0436c6140f231 ("
         , "  SDL_CameraID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetCameraPosition)(arg1);"
         , "}"
         , "SDL_Camera *hs_bindgen_9c29b271631f7c6f ("
         , "  SDL_CameraID arg1,"
         , "  SDL_CameraSpec const *arg2"
         , ")"
         , "{"
         , "  return (SDL_OpenCamera)(arg1, arg2);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_CameraPermissionState;"
         , "#endif"
         , "SDL_CameraPermissionState hs_bindgen_77d5a87752cf6936 ("
         , "  SDL_Camera *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetCameraPermissionState)(arg1);"
         , "}"
         , "SDL_CameraID hs_bindgen_bcdd620eca919b2e ("
         , "  SDL_Camera *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetCameraID)(arg1);"
         , "}"
         , "SDL_PropertiesID hs_bindgen_052b8e57c4e6c7b6 ("
         , "  SDL_Camera *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetCameraProperties)(arg1);"
         , "}"
         , "_Bool hs_bindgen_077520cc55e1919f ("
         , "  SDL_Camera *arg1,"
         , "  SDL_CameraSpec *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetCameraFormat)(arg1, arg2);"
         , "}"
         , "SDL_Surface *hs_bindgen_ea5de39cea6d2cc9 ("
         , "  SDL_Camera *arg1,"
         , "  Uint64 *arg2"
         , ")"
         , "{"
         , "  return (SDL_AcquireCameraFrame)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_9abaf64e06b4eeb3 ("
         , "  SDL_Camera *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  (SDL_ReleaseCameraFrame)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_2ca914bb2dfa2f4d ("
         , "  SDL_Camera *arg1"
         , ")"
         , "{"
         , "  (SDL_CloseCamera)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetNumCameraDrivers@
foreign import ccall safe "hs_bindgen_cd72562c40895f9d"
  hs_bindgen_cd72562c40895f9d_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetNumCameraDrivers@
hs_bindgen_cd72562c40895f9d :: IO BG.CInt
hs_bindgen_cd72562c40895f9d =
  BG.fromFFIType hs_bindgen_cd72562c40895f9d_base

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
--     [See also]: 'sDL_GetCameraDriver'
--
--     [C declaration]: @SDL_GetNumCameraDrivers@, defined at @SDL3\/SDL_camera.h 175:33@
sDL_GetNumCameraDrivers :: IO BG.CInt
sDL_GetNumCameraDrivers = hs_bindgen_cd72562c40895f9d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraDriver@
foreign import ccall safe "hs_bindgen_1b2353edfbc61157"
  hs_bindgen_1b2353edfbc61157_base
    :: BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraDriver@
hs_bindgen_1b2353edfbc61157
  :: BG.CInt
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_1b2353edfbc61157 =
  BG.fromFFIType hs_bindgen_1b2353edfbc61157_base

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
--     [See also]: 'sDL_GetNumCameraDrivers'
--
--     [C declaration]: @SDL_GetCameraDriver@, defined at @SDL3\/SDL_camera.h 199:42@
sDL_GetCameraDriver
  :: BG.CInt
  -- ^
  --
  --           [@index@]: the index of the camera driver; the value ranges from 0 to @SDL_GetNumCameraDrivers()@ - 1.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetCameraDriver = hs_bindgen_1b2353edfbc61157

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCurrentCameraDriver@
foreign import ccall safe "hs_bindgen_eb2b917f28fc96fd"
  hs_bindgen_eb2b917f28fc96fd_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCurrentCameraDriver@
hs_bindgen_eb2b917f28fc96fd :: IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_eb2b917f28fc96fd =
  BG.fromFFIType hs_bindgen_eb2b917f28fc96fd_base

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
--     [C declaration]: @SDL_GetCurrentCameraDriver@, defined at @SDL3\/SDL_camera.h 215:42@
sDL_GetCurrentCameraDriver :: IO (PtrConst.PtrConst BG.CChar)
sDL_GetCurrentCameraDriver =
  hs_bindgen_eb2b917f28fc96fd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameras@
foreign import ccall safe "hs_bindgen_1ba2aef0a8cc6032"
  hs_bindgen_1ba2aef0a8cc6032_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameras@
hs_bindgen_1ba2aef0a8cc6032
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL_CameraID)
hs_bindgen_1ba2aef0a8cc6032 =
  BG.fromFFIType hs_bindgen_1ba2aef0a8cc6032_base

-- | Get a list of currently connected camera devices.
--
--     [Returns]: a 0 terminated array of camera instance IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenCamera'
--
--     [C declaration]: @SDL_GetCameras@, defined at @SDL3\/SDL_camera.h 232:44@
sDL_GetCameras
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of cameras returned, may be NULL.
  -> IO (BG.Ptr SDL_CameraID)
sDL_GetCameras = hs_bindgen_1ba2aef0a8cc6032

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraSupportedFormats@
foreign import ccall safe "hs_bindgen_5a031667f9d45a0d"
  hs_bindgen_5a031667f9d45a0d_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraSupportedFormats@
hs_bindgen_5a031667f9d45a0d
  :: SDL_CameraID
  -> BG.Ptr BG.CInt
  -> IO (BG.Ptr (BG.Ptr SDL_CameraSpec))
hs_bindgen_5a031667f9d45a0d =
  BG.fromFFIType hs_bindgen_5a031667f9d45a0d_base

-- | Get the list of native formats\/sizes a camera supports.
--
--     This returns a list of all formats and frame sizes that a specific camera can offer. This is useful if your app can accept a variety of image formats and sizes and so want to find the optimal spec that doesn\'t require conversion.
--
--     This function isn\'t strictly required; if you call SDL_OpenCamera with a NULL spec, SDL will choose a native format for you, and if you instead specify a desired format, it will transparently convert to the requested format on your behalf.
--
--     If @count@ is not NULL, it will be filled with the number of elements in the returned array.
--
--     Note that it\'s legal for a camera to supply an empty list. This is what will happen on Emscripten builds, since that platform won\'t tell /anything/ about available cameras until you\'ve opened one, and won\'t even tell if there /is/ a camera until the user has given you permission to check through a scary warning popup.
--
--     [Returns]: a NULL terminated array of pointers to 'SDL_CameraSpec' or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetCameras', 'sDL_OpenCamera'
--
--     [C declaration]: @SDL_GetCameraSupportedFormats@, defined at @SDL3\/SDL_camera.h 271:47@
sDL_GetCameraSupportedFormats
  :: SDL_CameraID
  -- ^
  --
  --           [@instance_id@]: the camera device instance ID.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of elements in the list, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_CameraSpec))
sDL_GetCameraSupportedFormats =
  hs_bindgen_5a031667f9d45a0d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraName@
foreign import ccall safe "hs_bindgen_1fe2503ad9612c29"
  hs_bindgen_1fe2503ad9612c29_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraName@
hs_bindgen_1fe2503ad9612c29
  :: SDL_CameraID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_1fe2503ad9612c29 =
  BG.fromFFIType hs_bindgen_1fe2503ad9612c29_base

-- | Get the human-readable device name for a camera.
--
--     [Returns]: a human-readable device name or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetCameras'
--
--     [C declaration]: @SDL_GetCameraName@, defined at @SDL3\/SDL_camera.h 286:42@
sDL_GetCameraName
  :: SDL_CameraID
  -- ^
  --
  --           [@instance_id@]: the camera device instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetCameraName = hs_bindgen_1fe2503ad9612c29

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraPosition@
foreign import ccall safe "hs_bindgen_53c0436c6140f231"
  hs_bindgen_53c0436c6140f231_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraPosition@
hs_bindgen_53c0436c6140f231
  :: SDL_CameraID
  -> IO SDL_CameraPosition
hs_bindgen_53c0436c6140f231 =
  BG.fromFFIType hs_bindgen_53c0436c6140f231_base

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
--     [See also]: 'sDL_GetCameras'
--
--     [C declaration]: @SDL_GetCameraPosition@, defined at @SDL3\/SDL_camera.h 305:48@
sDL_GetCameraPosition
  :: SDL_CameraID
  -- ^
  --
  --           [@instance_id@]: the camera device instance ID.
  -> IO SDL_CameraPosition
sDL_GetCameraPosition = hs_bindgen_53c0436c6140f231

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_OpenCamera@
foreign import ccall safe "hs_bindgen_9c29b271631f7c6f"
  hs_bindgen_9c29b271631f7c6f_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_OpenCamera@
hs_bindgen_9c29b271631f7c6f
  :: SDL_CameraID
  -> PtrConst.PtrConst SDL_CameraSpec
  -> IO (BG.Ptr SDL_Camera)
hs_bindgen_9c29b271631f7c6f =
  BG.fromFFIType hs_bindgen_9c29b271631f7c6f_base

-- | Open a video recording device (a \"camera\").
--
--     You can open the device with any reasonable spec, and if the hardware can\'t directly support it, it will convert data seamlessly to the requested format. This might incur overhead, including scaling of image data.
--
--     If you would rather accept whatever format the device offers, you can pass a NULL spec here and it will choose one for you (and you can use SDL_Surface\'s conversion\/scaling functions directly if necessary).
--
--     You can call @SDL_GetCameraFormat()@ to get the actual data format if passing a NULL spec here. You can see the exact specs a device can support without conversion with @SDL_GetCameraSupportedFormats()@.
--
--     SDL will not attempt to emulate framerate; it will try to set the hardware to the rate closest to the requested speed, but it won\'t attempt to limit or duplicate frames artificially; call @SDL_GetCameraFormat()@ to see the actual framerate of the opened the device, and check your timestamps if this is crucial to your app!
--
--     Note that the camera is not usable until the user approves its use! On some platforms, the operating system will prompt the user to permit access to the camera, and they can choose Yes or No at that point. Until they do, the camera will not be usable. The app should either wait for an SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event, or poll @SDL_GetCameraPermissionState()@ occasionally until it returns non-zero. On platforms that don\'t require explicit user approval (and perhaps in places where the user previously permitted access), the approval event might come immediately, but it might come seconds, minutes, or hours later!
--
--     [Returns]: an 'SDL_Camera' object or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetCameras', 'sDL_GetCameraFormat'
--
--     [C declaration]: @SDL_OpenCamera@, defined at @SDL3\/SDL_camera.h 352:42@
sDL_OpenCamera
  :: SDL_CameraID
  -- ^
  --
  --           [@instance_id@]: the camera device instance ID.
  -> PtrConst.PtrConst SDL_CameraSpec
  -- ^
  --
  --           [@spec@]: the desired format for data the device will provide. Can be NULL.
  -> IO (BG.Ptr SDL_Camera)
sDL_OpenCamera = hs_bindgen_9c29b271631f7c6f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraPermissionState@
foreign import ccall safe "hs_bindgen_77d5a87752cf6936"
  hs_bindgen_77d5a87752cf6936_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraPermissionState@
hs_bindgen_77d5a87752cf6936
  :: BG.Ptr SDL_Camera
  -> IO SDL_CameraPermissionState
hs_bindgen_77d5a87752cf6936 =
  BG.fromFFIType hs_bindgen_77d5a87752cf6936_base

-- | Query if camera access has been approved by the user.
--
--     Cameras will not function between when the device is opened by the app and when the user permits access to the hardware. On some platforms, this presents as a popup dialog where the user has to explicitly approve access; on others the approval might be implicit and not alert the user at all.
--
--     This function can be used to check the status of that approval. It will return SDL_CAMERA_PERMISSION_STATE_PENDING if waiting for user response, SDL_CAMERA_PERMISSION_STATE_APPROVED if the camera is approved for use, and SDL_CAMERA_PERMISSION_STATE_DENIED if the user denied access.
--
--     Instead of polling with this function, you can wait for a SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event in the standard SDL event loop, which is guaranteed to be sent once when permission to use the camera is decided.
--
--     If a camera is declined, there\'s nothing to be done but call @SDL_CloseCamera()@ to dispose of it.
--
--     [Returns]: an 'SDL_CameraPermissionState' value indicating if access is granted, or @SDL_CAMERA_PERMISSION_STATE_PENDING@ if the decision is still pending.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenCamera', 'sDL_CloseCamera'
--
--     [C declaration]: @SDL_GetCameraPermissionState@, defined at @SDL3\/SDL_camera.h 387:55@
sDL_GetCameraPermissionState
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: the opened camera device to query.
  -> IO SDL_CameraPermissionState
sDL_GetCameraPermissionState =
  hs_bindgen_77d5a87752cf6936

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraID@
foreign import ccall safe "hs_bindgen_bcdd620eca919b2e"
  hs_bindgen_bcdd620eca919b2e_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraID@
hs_bindgen_bcdd620eca919b2e
  :: BG.Ptr SDL_Camera
  -> IO SDL_CameraID
hs_bindgen_bcdd620eca919b2e =
  BG.fromFFIType hs_bindgen_bcdd620eca919b2e_base

-- | Get the instance ID of an opened camera.
--
--     [Returns]: the instance ID of the specified camera on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenCamera'
--
--     [C declaration]: @SDL_GetCameraID@, defined at @SDL3\/SDL_camera.h 402:42@
sDL_GetCameraID
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: an 'SDL_Camera' to query.
  -> IO SDL_CameraID
sDL_GetCameraID = hs_bindgen_bcdd620eca919b2e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraProperties@
foreign import ccall safe "hs_bindgen_052b8e57c4e6c7b6"
  hs_bindgen_052b8e57c4e6c7b6_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraProperties@
hs_bindgen_052b8e57c4e6c7b6
  :: BG.Ptr SDL_Camera
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_052b8e57c4e6c7b6 =
  BG.fromFFIType hs_bindgen_052b8e57c4e6c7b6_base

-- | Get the properties associated with an opened camera.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetCameraProperties@, defined at @SDL3\/SDL_camera.h 415:46@
sDL_GetCameraProperties
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: the 'SDL_Camera' obtained from @SDL_OpenCamera()@.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_GetCameraProperties = hs_bindgen_052b8e57c4e6c7b6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraFormat@
foreign import ccall safe "hs_bindgen_077520cc55e1919f"
  hs_bindgen_077520cc55e1919f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_GetCameraFormat@
hs_bindgen_077520cc55e1919f
  :: BG.Ptr SDL_Camera
  -> BG.Ptr SDL_CameraSpec
  -> IO BG.CBool
hs_bindgen_077520cc55e1919f =
  BG.fromFFIType hs_bindgen_077520cc55e1919f_base

-- | Get the spec that a camera is using when generating images.
--
--     Note that this might not be the native format of the hardware, as SDL might be converting to this format behind the scenes.
--
--     If the system is waiting for the user to approve access to the camera, as some platforms require, this will return false, but this isn\'t necessarily a fatal error; you should either wait for an SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event, or poll @SDL_GetCameraPermissionState()@ occasionally until it returns non-zero.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenCamera'
--
--     [C declaration]: @SDL_GetCameraFormat@, defined at @SDL3\/SDL_camera.h 441:34@
sDL_GetCameraFormat
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: opened camera device.
  -> BG.Ptr SDL_CameraSpec
  -- ^
  --
  --           [@spec@]: the 'SDL_CameraSpec' to be initialized by this function.
  -> IO BG.CBool
sDL_GetCameraFormat = hs_bindgen_077520cc55e1919f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_AcquireCameraFrame@
foreign import ccall safe "hs_bindgen_ea5de39cea6d2cc9"
  hs_bindgen_ea5de39cea6d2cc9_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_AcquireCameraFrame@
hs_bindgen_ea5de39cea6d2cc9
  :: BG.Ptr SDL_Camera
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
hs_bindgen_ea5de39cea6d2cc9 =
  BG.fromFFIType hs_bindgen_ea5de39cea6d2cc9_base

-- | Acquire a frame.
--
--     The frame is a memory pointer to the image data, whose size and format are given by the spec requested when opening the device.
--
--     This is a non blocking API. If there is a frame available, a non-NULL surface is returned, and timestampNS will be filled with a non-zero value.
--
--     Note that an error case can also return NULL, but a NULL by itself is normal and just signifies that a new frame is not yet available. Note that even if a camera device fails outright (a USB camera is unplugged while in use, etc), SDL will send an event separately to notify the app, but continue to provide blank frames at ongoing intervals until @SDL_CloseCamera()@ is called, so real failure here is almost always an out of memory condition.
--
--     After use, the frame should be released with @SDL_ReleaseCameraFrame()@. If you don\'t do this, the system may stop providing more video!
--
--     Do not call SDL_DestroySurface() on the returned surface! It must be given back to the camera subsystem with SDL_ReleaseCameraFrame!
--
--     If the system is waiting for the user to approve access to the camera, as some platforms require, this will return NULL (no frames available); you should either wait for an SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event, or poll @SDL_GetCameraPermissionState()@ occasionally until it returns non-zero.
--
--     [Returns]: a new frame of video on success, NULL if none is currently available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ReleaseCameraFrame'
--
--     [C declaration]: @SDL_AcquireCameraFrame@, defined at @SDL3\/SDL_camera.h 484:43@
sDL_AcquireCameraFrame
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: opened camera device.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@timestampNS@]: a pointer filled in with the frame\'s timestamp, or 0 on error. Can be NULL.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
sDL_AcquireCameraFrame = hs_bindgen_ea5de39cea6d2cc9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_ReleaseCameraFrame@
foreign import ccall safe "hs_bindgen_9abaf64e06b4eeb3"
  hs_bindgen_9abaf64e06b4eeb3_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_ReleaseCameraFrame@
hs_bindgen_9abaf64e06b4eeb3
  :: BG.Ptr SDL_Camera
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> IO ()
hs_bindgen_9abaf64e06b4eeb3 =
  BG.fromFFIType hs_bindgen_9abaf64e06b4eeb3_base

-- | Release a frame of video acquired from a camera.
--
--     Let the back-end re-use the internal buffer for camera.
--
--     This function /must/ be called only on surface objects returned by @SDL_AcquireCameraFrame()@. This function should be called as quickly as possible after acquisition, as SDL keeps a small FIFO queue of surfaces for video frames; if surfaces aren\'t released in a timely manner, SDL may drop upcoming video frames from the camera.
--
--     If the app needs to keep the surface for a significant time, they should make a copy of it and release the original.
--
--     The app should not use the surface again after calling this function; assume the surface is freed and the pointer is invalid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AcquireCameraFrame'
--
--     [C declaration]: @SDL_ReleaseCameraFrame@, defined at @SDL3\/SDL_camera.h 512:34@
sDL_ReleaseCameraFrame
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: opened camera device.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@frame@]: the video frame surface to release.
  -> IO ()
sDL_ReleaseCameraFrame = hs_bindgen_9abaf64e06b4eeb3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_CloseCamera@
foreign import ccall safe "hs_bindgen_2ca914bb2dfa2f4d"
  hs_bindgen_2ca914bb2dfa2f4d_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_Safe_SDL_CloseCamera@
hs_bindgen_2ca914bb2dfa2f4d
  :: BG.Ptr SDL_Camera
  -> IO ()
hs_bindgen_2ca914bb2dfa2f4d =
  BG.fromFFIType hs_bindgen_2ca914bb2dfa2f4d_base

-- | Use this function to shut down camera processing and close the camera device.
--
--     [Thread safety]: It is safe to call this function from any thread, but no thread may reference @device@ once this function is called.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenCamera'
--
--     [C declaration]: @SDL_CloseCamera@, defined at @SDL3\/SDL_camera.h 527:34@
sDL_CloseCamera
  :: BG.Ptr SDL_Camera
  -- ^
  --
  --           [@camera@]: opened camera device.
  -> IO ()
sDL_CloseCamera = hs_bindgen_2ca914bb2dfa2f4d

{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Camera.FunPtr (
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_GetNumCameraDrivers,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_GetCameraDriver,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_GetCurrentCameraDriver,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_GetCameras,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_GetCameraSupportedFormats,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_GetCameraName,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_GetCameraPosition,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_OpenCamera,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_GetCameraPermissionState,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_GetCameraID,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_GetCameraProperties,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_GetCameraFormat,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_AcquireCameraFrame,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_ReleaseCameraFrame,
  SDL3.Sys.Bindgen.Camera.FunPtr.sDL_CloseCamera,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetNumCameraDrivers */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_2fe56f3f652d0579 (void)) (void)"
         , "{"
         , "  return &SDL_GetNumCameraDrivers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraDriver */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_c446a6779ba24477 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_GetCameraDriver;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCurrentCameraDriver */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_450b62c8a8bdad25 (void)) (void)"
         , "{"
         , "  return &SDL_GetCurrentCameraDriver;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameras */"
         , "__attribute__ ((const))"
         , "SDL_CameraID *(*hs_bindgen_bc1a5321dad7fcb1 (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetCameras;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraSupportedFormats */"
         , "__attribute__ ((const))"
         , "SDL_CameraSpec **(*hs_bindgen_bf28278a90a763f1 (void)) ("
         , "  SDL_CameraID arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetCameraSupportedFormats;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_55dbe06bac2f3a2a (void)) ("
         , "  SDL_CameraID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetCameraName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraPosition */"
         , "__attribute__ ((const))"
         , "SDL_CameraPosition (*hs_bindgen_9aa8f16a3313e368 (void)) ("
         , "  SDL_CameraID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetCameraPosition;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_OpenCamera */"
         , "__attribute__ ((const))"
         , "SDL_Camera *(*hs_bindgen_b00c5599a7791662 (void)) ("
         , "  SDL_CameraID arg1,"
         , "  SDL_CameraSpec const *arg2"
         , ")"
         , "{"
         , "  return &SDL_OpenCamera;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_CameraPermissionState;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraPermissionState */"
         , "__attribute__ ((const))"
         , "SDL_CameraPermissionState (*hs_bindgen_48f0024f18d7e07c (void)) ("
         , "  SDL_Camera *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetCameraPermissionState;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraID */"
         , "__attribute__ ((const))"
         , "SDL_CameraID (*hs_bindgen_0229aa426471e9f3 (void)) ("
         , "  SDL_Camera *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetCameraID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_811d109afab05470 (void)) ("
         , "  SDL_Camera *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetCameraProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraFormat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c31156109d01dac2 (void)) ("
         , "  SDL_Camera *arg1,"
         , "  SDL_CameraSpec *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetCameraFormat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_AcquireCameraFrame */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_15418e0f8c1b74ab (void)) ("
         , "  SDL_Camera *arg1,"
         , "  Uint64 *arg2"
         , ")"
         , "{"
         , "  return &SDL_AcquireCameraFrame;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_ReleaseCameraFrame */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_e130359542808d09 (void)) ("
         , "  SDL_Camera *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReleaseCameraFrame;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_CloseCamera */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_bdcef6daeaf762cd (void)) ("
         , "  SDL_Camera *arg1"
         , ")"
         , "{"
         , "  return &SDL_CloseCamera;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetNumCameraDrivers@
foreign import ccall unsafe "hs_bindgen_2fe56f3f652d0579"
  hs_bindgen_2fe56f3f652d0579_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetNumCameraDrivers@
hs_bindgen_2fe56f3f652d0579 :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_2fe56f3f652d0579 =
  BG.fromFFIType hs_bindgen_2fe56f3f652d0579_base

{-# NOINLINE sDL_GetNumCameraDrivers #-}

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
sDL_GetNumCameraDrivers :: BG.FunPtr (IO BG.CInt)
sDL_GetNumCameraDrivers =
  BG.unsafePerformIO hs_bindgen_2fe56f3f652d0579

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraDriver@
foreign import ccall unsafe "hs_bindgen_c446a6779ba24477"
  hs_bindgen_c446a6779ba24477_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraDriver@
hs_bindgen_c446a6779ba24477 :: IO (BG.FunPtr (BG.CInt -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_c446a6779ba24477 =
  BG.fromFFIType hs_bindgen_c446a6779ba24477_base

{-# NOINLINE sDL_GetCameraDriver #-}

-- | Use this function to get the name of a built in camera driver.
--
--     The list of camera drivers is given in the order that they are normally initialized by default; the drivers that seem more reasonable to choose first (as far as the SDL developers believe) are earlier in the list.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"v4l2\", \"coremedia\" or \"android\". These never have Unicode characters, and are not meant to be proper names.
--
--     [@index@]: the index of the camera driver; the value ranges from 0 to @SDL_GetNumCameraDrivers()@ - 1.
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
sDL_GetCameraDriver :: BG.FunPtr (BG.CInt -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetCameraDriver =
  BG.unsafePerformIO hs_bindgen_c446a6779ba24477

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCurrentCameraDriver@
foreign import ccall unsafe "hs_bindgen_450b62c8a8bdad25"
  hs_bindgen_450b62c8a8bdad25_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCurrentCameraDriver@
hs_bindgen_450b62c8a8bdad25 :: IO (BG.FunPtr (IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_450b62c8a8bdad25 =
  BG.fromFFIType hs_bindgen_450b62c8a8bdad25_base

{-# NOINLINE sDL_GetCurrentCameraDriver #-}

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
sDL_GetCurrentCameraDriver :: BG.FunPtr (IO (PtrConst.PtrConst BG.CChar))
sDL_GetCurrentCameraDriver =
  BG.unsafePerformIO hs_bindgen_450b62c8a8bdad25

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameras@
foreign import ccall unsafe "hs_bindgen_bc1a5321dad7fcb1"
  hs_bindgen_bc1a5321dad7fcb1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameras@
hs_bindgen_bc1a5321dad7fcb1 :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_CameraID)))
hs_bindgen_bc1a5321dad7fcb1 =
  BG.fromFFIType hs_bindgen_bc1a5321dad7fcb1_base

{-# NOINLINE sDL_GetCameras #-}

-- | Get a list of currently connected camera devices.
--
--     [@count@]: a pointer filled in with the number of cameras returned, may be NULL.
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
sDL_GetCameras :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_CameraID))
sDL_GetCameras =
  BG.unsafePerformIO hs_bindgen_bc1a5321dad7fcb1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraSupportedFormats@
foreign import ccall unsafe "hs_bindgen_bf28278a90a763f1"
  hs_bindgen_bf28278a90a763f1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraSupportedFormats@
hs_bindgen_bf28278a90a763f1
  :: IO (BG.FunPtr (SDL_CameraID -> BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr SDL_CameraSpec))))
hs_bindgen_bf28278a90a763f1 =
  BG.fromFFIType hs_bindgen_bf28278a90a763f1_base

{-# NOINLINE sDL_GetCameraSupportedFormats #-}

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
--     [@instance_id@]: the camera device instance ID.
--
--     [@count@]: a pointer filled in with the number of elements in the list, may be NULL.
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
  :: BG.FunPtr (SDL_CameraID -> BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr SDL_CameraSpec)))
sDL_GetCameraSupportedFormats =
  BG.unsafePerformIO hs_bindgen_bf28278a90a763f1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraName@
foreign import ccall unsafe "hs_bindgen_55dbe06bac2f3a2a"
  hs_bindgen_55dbe06bac2f3a2a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraName@
hs_bindgen_55dbe06bac2f3a2a :: IO (BG.FunPtr (SDL_CameraID -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_55dbe06bac2f3a2a =
  BG.fromFFIType hs_bindgen_55dbe06bac2f3a2a_base

{-# NOINLINE sDL_GetCameraName #-}

-- | Get the human-readable device name for a camera.
--
--     [@instance_id@]: the camera device instance ID.
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
sDL_GetCameraName :: BG.FunPtr (SDL_CameraID -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetCameraName =
  BG.unsafePerformIO hs_bindgen_55dbe06bac2f3a2a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraPosition@
foreign import ccall unsafe "hs_bindgen_9aa8f16a3313e368"
  hs_bindgen_9aa8f16a3313e368_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraPosition@
hs_bindgen_9aa8f16a3313e368 :: IO (BG.FunPtr (SDL_CameraID -> IO SDL_CameraPosition))
hs_bindgen_9aa8f16a3313e368 =
  BG.fromFFIType hs_bindgen_9aa8f16a3313e368_base

{-# NOINLINE sDL_GetCameraPosition #-}

-- | Get the position of the camera in relation to the system.
--
--     Most platforms will report UNKNOWN, but mobile devices, like phones, can often make a distinction between cameras on the front of the device (that points towards the user, for taking \"selfies\") and cameras on the back (for filming in the direction the user is facing).
--
--     [@instance_id@]: the camera device instance ID.
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
sDL_GetCameraPosition :: BG.FunPtr (SDL_CameraID -> IO SDL_CameraPosition)
sDL_GetCameraPosition =
  BG.unsafePerformIO hs_bindgen_9aa8f16a3313e368

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_OpenCamera@
foreign import ccall unsafe "hs_bindgen_b00c5599a7791662"
  hs_bindgen_b00c5599a7791662_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_OpenCamera@
hs_bindgen_b00c5599a7791662
  :: IO (BG.FunPtr (SDL_CameraID -> PtrConst.PtrConst SDL_CameraSpec -> IO (BG.Ptr SDL_Camera)))
hs_bindgen_b00c5599a7791662 =
  BG.fromFFIType hs_bindgen_b00c5599a7791662_base

{-# NOINLINE sDL_OpenCamera #-}

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
--     [@instance_id@]: the camera device instance ID.
--
--     [@spec@]: the desired format for data the device will provide. Can be NULL.
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
  :: BG.FunPtr (SDL_CameraID -> PtrConst.PtrConst SDL_CameraSpec -> IO (BG.Ptr SDL_Camera))
sDL_OpenCamera =
  BG.unsafePerformIO hs_bindgen_b00c5599a7791662

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraPermissionState@
foreign import ccall unsafe "hs_bindgen_48f0024f18d7e07c"
  hs_bindgen_48f0024f18d7e07c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraPermissionState@
hs_bindgen_48f0024f18d7e07c :: IO (BG.FunPtr (BG.Ptr SDL_Camera -> IO SDL_CameraPermissionState))
hs_bindgen_48f0024f18d7e07c =
  BG.fromFFIType hs_bindgen_48f0024f18d7e07c_base

{-# NOINLINE sDL_GetCameraPermissionState #-}

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
--     [@camera@]: the opened camera device to query.
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
sDL_GetCameraPermissionState :: BG.FunPtr (BG.Ptr SDL_Camera -> IO SDL_CameraPermissionState)
sDL_GetCameraPermissionState =
  BG.unsafePerformIO hs_bindgen_48f0024f18d7e07c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraID@
foreign import ccall unsafe "hs_bindgen_0229aa426471e9f3"
  hs_bindgen_0229aa426471e9f3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraID@
hs_bindgen_0229aa426471e9f3 :: IO (BG.FunPtr (BG.Ptr SDL_Camera -> IO SDL_CameraID))
hs_bindgen_0229aa426471e9f3 =
  BG.fromFFIType hs_bindgen_0229aa426471e9f3_base

{-# NOINLINE sDL_GetCameraID #-}

-- | Get the instance ID of an opened camera.
--
--     [@camera@]: an 'SDL_Camera' to query.
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
sDL_GetCameraID :: BG.FunPtr (BG.Ptr SDL_Camera -> IO SDL_CameraID)
sDL_GetCameraID =
  BG.unsafePerformIO hs_bindgen_0229aa426471e9f3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraProperties@
foreign import ccall unsafe "hs_bindgen_811d109afab05470"
  hs_bindgen_811d109afab05470_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraProperties@
hs_bindgen_811d109afab05470
  :: IO (BG.FunPtr (BG.Ptr SDL_Camera -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_811d109afab05470 =
  BG.fromFFIType hs_bindgen_811d109afab05470_base

{-# NOINLINE sDL_GetCameraProperties #-}

-- | Get the properties associated with an opened camera.
--
--     [@camera@]: the 'SDL_Camera' obtained from @SDL_OpenCamera()@.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetCameraProperties@, defined at @SDL3\/SDL_camera.h 415:46@
sDL_GetCameraProperties
  :: BG.FunPtr (BG.Ptr SDL_Camera -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetCameraProperties =
  BG.unsafePerformIO hs_bindgen_811d109afab05470

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraFormat@
foreign import ccall unsafe "hs_bindgen_c31156109d01dac2"
  hs_bindgen_c31156109d01dac2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_GetCameraFormat@
hs_bindgen_c31156109d01dac2
  :: IO (BG.FunPtr (BG.Ptr SDL_Camera -> BG.Ptr SDL_CameraSpec -> IO BG.CBool))
hs_bindgen_c31156109d01dac2 =
  BG.fromFFIType hs_bindgen_c31156109d01dac2_base

{-# NOINLINE sDL_GetCameraFormat #-}

-- | Get the spec that a camera is using when generating images.
--
--     Note that this might not be the native format of the hardware, as SDL might be converting to this format behind the scenes.
--
--     If the system is waiting for the user to approve access to the camera, as some platforms require, this will return false, but this isn\'t necessarily a fatal error; you should either wait for an SDL_EVENT_CAMERA_DEVICE_APPROVED (or SDL_EVENT_CAMERA_DEVICE_DENIED) event, or poll @SDL_GetCameraPermissionState()@ occasionally until it returns non-zero.
--
--     [@camera@]: opened camera device.
--
--     [@spec@]: the 'SDL_CameraSpec' to be initialized by this function.
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
sDL_GetCameraFormat :: BG.FunPtr (BG.Ptr SDL_Camera -> BG.Ptr SDL_CameraSpec -> IO BG.CBool)
sDL_GetCameraFormat =
  BG.unsafePerformIO hs_bindgen_c31156109d01dac2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_AcquireCameraFrame@
foreign import ccall unsafe "hs_bindgen_15418e0f8c1b74ab"
  hs_bindgen_15418e0f8c1b74ab_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_AcquireCameraFrame@
hs_bindgen_15418e0f8c1b74ab
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Camera
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
             -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
           )
       )
hs_bindgen_15418e0f8c1b74ab =
  BG.fromFFIType hs_bindgen_15418e0f8c1b74ab_base

{-# NOINLINE sDL_AcquireCameraFrame #-}

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
--     [@camera@]: opened camera device.
--
--     [@timestampNS@]: a pointer filled in with the frame\'s timestamp, or 0 on error. Can be NULL.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Camera
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
         -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
       )
sDL_AcquireCameraFrame =
  BG.unsafePerformIO hs_bindgen_15418e0f8c1b74ab

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_ReleaseCameraFrame@
foreign import ccall unsafe "hs_bindgen_e130359542808d09"
  hs_bindgen_e130359542808d09_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_ReleaseCameraFrame@
hs_bindgen_e130359542808d09
  :: IO (BG.FunPtr (BG.Ptr SDL_Camera -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> IO ()))
hs_bindgen_e130359542808d09 =
  BG.fromFFIType hs_bindgen_e130359542808d09_base

{-# NOINLINE sDL_ReleaseCameraFrame #-}

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
--     [@camera@]: opened camera device.
--
--     [@frame@]: the video frame surface to release.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AcquireCameraFrame'
--
--     [C declaration]: @SDL_ReleaseCameraFrame@, defined at @SDL3\/SDL_camera.h 512:34@
sDL_ReleaseCameraFrame
  :: BG.FunPtr (BG.Ptr SDL_Camera -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> IO ())
sDL_ReleaseCameraFrame =
  BG.unsafePerformIO hs_bindgen_e130359542808d09

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_CloseCamera@
foreign import ccall unsafe "hs_bindgen_bdcef6daeaf762cd"
  hs_bindgen_bdcef6daeaf762cd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Camera_get_SDL_CloseCamera@
hs_bindgen_bdcef6daeaf762cd :: IO (BG.FunPtr (BG.Ptr SDL_Camera -> IO ()))
hs_bindgen_bdcef6daeaf762cd =
  BG.fromFFIType hs_bindgen_bdcef6daeaf762cd_base

{-# NOINLINE sDL_CloseCamera #-}

-- | Use this function to shut down camera processing and close the camera device.
--
--     [@camera@]: opened camera device.
--
--     [Thread safety]: It is safe to call this function from any thread, but no thread may reference @device@ once this function is called.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenCamera'
--
--     [C declaration]: @SDL_CloseCamera@, defined at @SDL3\/SDL_camera.h 527:34@
sDL_CloseCamera :: BG.FunPtr (BG.Ptr SDL_Camera -> IO ())
sDL_CloseCamera =
  BG.unsafePerformIO hs_bindgen_bdcef6daeaf762cd

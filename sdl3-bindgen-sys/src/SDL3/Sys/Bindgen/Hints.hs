{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
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

-- | This file contains functions to set and get configuration hints, as well as listing each of them alphabetically.
--
--     The convention for naming hints is SDL_HINT_X, where \"SDL_X\" is the environment variable that can be used to override the default.
--
--     In general these hints are just that - they may or may not be supported or applicable on any given platform, but they provide a way for an application or user to give the library a hint as to how they would like the library to work. Specify the behavior of Alt+Tab while the keyboard is grabbed.
--
--     By default, SDL emulates Alt+Tab functionality while the keyboard is grabbed and your window is full-screen. This prevents the user from getting stuck in your application if you\'ve enabled keyboard grab.
--
--     The variable can be set to the following values:
--
--     * \"0\": SDL will not handle Alt+Tab. Your application is responsible for handling Alt+Tab while the keyboard is grabbed.
--
--     * \"1\": SDL will minimize your window when Alt+Tab is pressed (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Hints (
  SDL3.Sys.Bindgen.Hints.sDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_ANDROID_ALLOW_RECREATE_ACTIVITY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_ANDROID_BLOCK_ON_PAUSE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_ANDROID_LOW_LATENCY_AUDIO,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_ANDROID_TRAP_BACK_BUTTON,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_APP_ID,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_APP_NAME,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_ALSA_DEFAULT_DEVICE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_CATEGORY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_CHANNELS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_DEVICE_APP_ICON_NAME,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_DEVICE_SAMPLE_FRAMES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_DEVICE_STREAM_NAME,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_DEVICE_STREAM_ROLE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_DEVICE_RAW_STREAM,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_DISK_INPUT_FILE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_DISK_OUTPUT_FILE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_DISK_TIMESCALE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_DRIVER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_DUMMY_TIMESCALE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_FORMAT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_FREQUENCY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUDIO_INCLUDE_MONITORS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUTO_UPDATE_JOYSTICKS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_AUTO_UPDATE_SENSORS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_BMP_SAVE_LEGACY_FORMAT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_CAMERA_DRIVER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_CPU_FEATURE_MASK,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_DIRECTINPUT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_FILE_DIALOG_DRIVER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_DISPLAY_USABLE_BOUNDS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_INVALID_PARAM_CHECKS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_EMSCRIPTEN_ASYNCIFY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_EMSCRIPTEN_CANVAS_SELECTOR,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_ENABLE_SCREEN_KEYBOARD,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_EVDEV_DEVICES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_EVENT_LOGGING,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_FORCE_RAISEWINDOW,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_FRAMEBUFFER_ACCELERATION,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_GAMECONTROLLERCONFIG,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_GAMECONTROLLERCONFIG_FILE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_GAMECONTROLLERTYPE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_GAMECONTROLLER_IGNORE_DEVICES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_GAMECONTROLLER_SENSOR_FUSION,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_GDK_TEXTINPUT_DEFAULT_TEXT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_GDK_TEXTINPUT_DESCRIPTION,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_GDK_TEXTINPUT_MAX_LENGTH,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_GDK_TEXTINPUT_SCOPE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_GDK_TEXTINPUT_TITLE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_HIDAPI_LIBUSB,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_HIDAPI_LIBUSB_GAMECUBE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_HIDAPI_LIBUSB_WHITELIST,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_HIDAPI_UDEV,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_GPU_DRIVER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_HIDAPI_IGNORE_DEVICES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_IME_IMPLEMENTED_UI,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_IOS_HIDE_HOME_INDICATOR,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_ARCADESTICK_DEVICES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_BLACKLIST_DEVICES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_DEVICE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_ENHANCED_REPORTS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_GAMEINPUT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_GAMECUBE_DEVICES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_GAMECUBE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_JOY_CONS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_LUNA,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_PS3,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_PS4,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_PS5,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_SHIELD,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_STADIA,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_STEAM,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_STEAM_HOME_LED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_STEAMDECK,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_STEAM_HORI,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_LG4FF,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_8BITDO,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_SINPUT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_ZUIKI,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_FLYDIGI,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_SWITCH,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_SWITCH2,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_WII,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_XBOX,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_XBOX_360,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_GIP,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HIDAPI_GIP_RESET_FOR_METADATA,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_IOKIT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_LINUX_CLASSIC,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_LINUX_DEADZONES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_LINUX_DIGITAL_HATS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_LINUX_HAT_DEADZONES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_MFI,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_RAWINPUT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_ROG_CHAKRAM,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_THREAD,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_THROTTLE_DEVICES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_THROTTLE_DEVICES_EXCLUDED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_WGI,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_WHEEL_DEVICES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_WHEEL_DEVICES_EXCLUDED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_ZERO_CENTERED_DEVICES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_JOYSTICK_HAPTIC_AXES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_KEYCODE_OPTIONS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_KMSDRM_DEVICE_INDEX,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_KMSDRM_REQUIRE_DRM_MASTER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_KMSDRM_ATOMIC,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_LOGGING,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MAC_BACKGROUND_APP,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MAC_OPENGL_ASYNC_DISPATCH,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MAC_OPTION_AS_ALT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MAC_SCROLL_MOMENTUM,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MAC_PRESS_AND_HOLD,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MAIN_CALLBACK_RATE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_AUTO_CAPTURE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_DOUBLE_CLICK_TIME,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_DEFAULT_SYSTEM_CURSOR,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_DPI_SCALE_CURSORS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_EMULATE_WARP_WITH_RELATIVE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_FOCUS_CLICKTHROUGH,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_NORMAL_SPEED_SCALE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_RELATIVE_MODE_CENTER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_RELATIVE_SPEED_SCALE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_RELATIVE_WARP_MOTION,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_RELATIVE_CURSOR_VISIBLE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MOUSE_TOUCH_EVENTS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_MUTE_CONSOLE_KEYBOARD,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_NO_SIGNAL_HANDLERS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_OPENGL_LIBRARY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_EGL_LIBRARY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_OPENGL_ES_DRIVER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_OPENGL_FORCE_SRGB_FRAMEBUFFER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_OPENVR_LIBRARY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_ORIENTATIONS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_POLL_SENTINEL,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_PREFERRED_LOCALES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_RENDER_DIRECT3D_THREADSAFE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_RENDER_DIRECT3D11_DEBUG,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_RENDER_DIRECT3D11_WARP,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_RENDER_VULKAN_DEBUG,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_RENDER_GPU_DEBUG,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_RENDER_GPU_LOW_POWER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_RENDER_DRIVER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_RENDER_LINE_METHOD,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_RENDER_METAL_PREFER_LOW_POWER_DEVICE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_RENDER_VSYNC,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_RETURN_KEY_HIDES_IME,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_ROG_GAMEPAD_MICE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_ROG_GAMEPAD_MICE_EXCLUDED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_PS2_GS_WIDTH,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_PS2_GS_HEIGHT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_PS2_GS_PROGRESSIVE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_PS2_GS_MODE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_RPI_VIDEO_LAYER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_SHUTDOWN_DBUS_ON_QUIT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_STORAGE_TITLE_DRIVER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_STORAGE_USER_DRIVER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_THREAD_PRIORITY_POLICY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_TIMER_RESOLUTION,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_TOUCH_MOUSE_EVENTS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_TRACKPAD_IS_TOUCH_ONLY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_TV_REMOTE_AS_JOYSTICK,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_ALLOW_SCREENSAVER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_DISPLAY_PRIORITY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_DOUBLE_BUFFER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_DRIVER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_DUMMY_SAVE_FRAMES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_FORCE_EGL,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_METAL_AUTO_RESIZE_DRAWABLE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_MATCH_EXCLUSIVE_MODE_ON_MOVE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_OFFSCREEN_SAVE_FRAMES,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_WAYLAND_MODE_EMULATION,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_WAYLAND_MODE_SCALING,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_WAYLAND_SCALE_TO_DISPLAY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_WIN_D3DCOMPILER,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_X11_EXTERNAL_WINDOW_INPUT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_X11_NET_WM_PING,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_X11_NODIRECTCOLOR,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_X11_SCALING_FACTOR,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_X11_VISUALID,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_X11_WINDOW_VISUALID,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VIDEO_X11_XRANDR,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VITA_ENABLE_BACK_TOUCH,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VITA_ENABLE_FRONT_TOUCH,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VITA_MODULE_PATH,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VITA_PVR_INIT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VITA_RESOLUTION,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VITA_PVR_OPENGL,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VITA_TOUCH_MOUSE_DEVICE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VULKAN_DISPLAY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_VULKAN_LIBRARY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WAVE_FACT_CHUNK,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WAVE_CHUNK_LIMIT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WAVE_RIFF_CHUNK_SIZE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WAVE_TRUNCATION,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOW_ACTIVATE_WHEN_RAISED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOW_ACTIVATE_WHEN_SHOWN,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOW_ALLOW_TOPMOST,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOWS_CLOSE_ON_ALT_F4,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOWS_ENABLE_MENU_MNEMONICS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOWS_ENABLE_MESSAGELOOP,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOWS_GAMEINPUT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOWS_RAW_KEYBOARD,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOWS_RAW_KEYBOARD_EXCLUDE_HOTKEYS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOWS_INTRESOURCE_ICON,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOWS_USE_D3D9EX,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_WINDOWS_ERASE_BACKGROUND_MODE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_X11_FORCE_OVERRIDE_REDIRECT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_X11_WINDOW_TYPE,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_X11_XCB_LIBRARY,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_XINPUT_ENABLED,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_ASSERT,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_PEN_MOUSE_EVENTS,
  SDL3.Sys.Bindgen.Hints.sDL_HINT_PEN_TOUCH_EVENTS,
  SDL3.Sys.Bindgen.Hints.SDL_HintPriority (..),
  pattern SDL3.Sys.Bindgen.Hints.SDL_HINT_DEFAULT,
  pattern SDL3.Sys.Bindgen.Hints.SDL_HINT_NORMAL,
  pattern SDL3.Sys.Bindgen.Hints.SDL_HINT_OVERRIDE,
  SDL3.Sys.Bindgen.Hints.SDL_HintCallback_Aux (..),
  SDL3.Sys.Bindgen.Hints.SDL_HintCallback (..),
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @macro SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED@, literal @\"SDL_ALLOW_ALT_TAB_WHILE_GRABBED\"@, defined at @SDL3\/SDL_hints.h 66:9@
sDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED :: BG.ByteString
sDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x4C
    , 0x4C
    , 0x4F
    , 0x57
    , 0x5F
    , 0x41
    , 0x4C
    , 0x54
    , 0x5F
    , 0x54
    , 0x41
    , 0x42
    , 0x5F
    , 0x57
    , 0x48
    , 0x49
    , 0x4C
    , 0x45
    , 0x5F
    , 0x47
    , 0x52
    , 0x41
    , 0x42
    , 0x42
    , 0x45
    , 0x44
    ]

-- | A variable to control whether the SDL activity is allowed to be re-created.
--
--     If this hint is true, the activity can be recreated on demand by the OS, and Java static data and C++ static data remain with their current values. If this hint is false, then SDL will call exit() when you return from your main function and the application will be terminated and then started fresh each time.
--
--     The variable can be set to the following values:
--
--     * \"0\": The application starts fresh at each launch. (default)
--
--     * \"1\": The application activity can be recreated by the OS.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_ANDROID_ALLOW_RECREATE_ACTIVITY@, literal @\"SDL_ANDROID_ALLOW_RECREATE_ACTIVITY\"@, defined at @SDL3\/SDL_hints.h 86:9@
sDL_HINT_ANDROID_ALLOW_RECREATE_ACTIVITY :: BG.ByteString
sDL_HINT_ANDROID_ALLOW_RECREATE_ACTIVITY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x4E
    , 0x44
    , 0x52
    , 0x4F
    , 0x49
    , 0x44
    , 0x5F
    , 0x41
    , 0x4C
    , 0x4C
    , 0x4F
    , 0x57
    , 0x5F
    , 0x52
    , 0x45
    , 0x43
    , 0x52
    , 0x45
    , 0x41
    , 0x54
    , 0x45
    , 0x5F
    , 0x41
    , 0x43
    , 0x54
    , 0x49
    , 0x56
    , 0x49
    , 0x54
    , 0x59
    ]

-- | A variable to control whether the event loop will block itself when the app is paused.
--
--     The variable can be set to the following values:
--
--     * \"0\": Non blocking.
--
--     * \"1\": Blocking. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_ANDROID_BLOCK_ON_PAUSE@, literal @\"SDL_ANDROID_BLOCK_ON_PAUSE\"@, defined at @SDL3\/SDL_hints.h 101:9@
sDL_HINT_ANDROID_BLOCK_ON_PAUSE :: BG.ByteString
sDL_HINT_ANDROID_BLOCK_ON_PAUSE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x4E
    , 0x44
    , 0x52
    , 0x4F
    , 0x49
    , 0x44
    , 0x5F
    , 0x42
    , 0x4C
    , 0x4F
    , 0x43
    , 0x4B
    , 0x5F
    , 0x4F
    , 0x4E
    , 0x5F
    , 0x50
    , 0x41
    , 0x55
    , 0x53
    , 0x45
    ]

-- | A variable to control whether low latency audio should be enabled.
--
--     Some devices have poor quality output when this is enabled, but this is usually an improvement in audio latency.
--
--     The variable can be set to the following values:
--
--     * \"0\": Low latency audio is not enabled.
--
--     * \"1\": Low latency audio is enabled. (default)
--
--     This hint should be set before SDL audio is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_ANDROID_LOW_LATENCY_AUDIO@, literal @\"SDL_ANDROID_LOW_LATENCY_AUDIO\"@, defined at @SDL3\/SDL_hints.h 118:9@
sDL_HINT_ANDROID_LOW_LATENCY_AUDIO :: BG.ByteString
sDL_HINT_ANDROID_LOW_LATENCY_AUDIO =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x4E
    , 0x44
    , 0x52
    , 0x4F
    , 0x49
    , 0x44
    , 0x5F
    , 0x4C
    , 0x4F
    , 0x57
    , 0x5F
    , 0x4C
    , 0x41
    , 0x54
    , 0x45
    , 0x4E
    , 0x43
    , 0x59
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    ]

-- | A variable to control whether we trap the Android back button to handle it manually.
--
--     This is necessary for the right mouse button to work on some Android devices, or to be able to trap the back button for use in your code reliably. If this hint is true, the back button will show up as an SDL_EVENT_KEY_DOWN \/ SDL_EVENT_KEY_UP pair with a keycode of SDL_SCANCODE_AC_BACK.
--
--     The variable can be set to the following values:
--
--     * \"0\": Back button will be handled as usual for system. (default)
--
--     * \"1\": Back button will be trapped, allowing you to handle the key press manually. (This will also let right mouse click work on systems where the right mouse button functions as back.)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_ANDROID_TRAP_BACK_BUTTON@, literal @\"SDL_ANDROID_TRAP_BACK_BUTTON\"@, defined at @SDL3\/SDL_hints.h 141:9@
sDL_HINT_ANDROID_TRAP_BACK_BUTTON :: BG.ByteString
sDL_HINT_ANDROID_TRAP_BACK_BUTTON =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x4E
    , 0x44
    , 0x52
    , 0x4F
    , 0x49
    , 0x44
    , 0x5F
    , 0x54
    , 0x52
    , 0x41
    , 0x50
    , 0x5F
    , 0x42
    , 0x41
    , 0x43
    , 0x4B
    , 0x5F
    , 0x42
    , 0x55
    , 0x54
    , 0x54
    , 0x4F
    , 0x4E
    ]

-- | A variable setting the app ID string.
--
--     This string is used by desktop compositors to identify and group windows together, as well as match applications with associated desktop settings and icons.
--
--     This will override SDL_PROP_APP_METADATA_IDENTIFIER_STRING, if set by the application.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_APP_ID@, literal @\"SDL_APP_ID\"@, defined at @SDL3\/SDL_hints.h 157:9@
sDL_HINT_APP_ID :: BG.ByteString
sDL_HINT_APP_ID =
  BG.pack [0x53, 0x44, 0x4C, 0x5F, 0x41, 0x50, 0x50, 0x5F, 0x49, 0x44]

-- | A variable setting the application name.
--
--     This hint lets you specify the application name sent to the OS when required. For example, this will often appear in volume control applets for audio streams, and in lists of applications which are inhibiting the screensaver. You should use a string that describes your program (\"My Game 2: The Revenge\")
--
--     This will override SDL_PROP_APP_METADATA_NAME_STRING, if set by the application.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_APP_NAME@, literal @\"SDL_APP_NAME\"@, defined at @SDL3\/SDL_hints.h 175:9@
sDL_HINT_APP_NAME :: BG.ByteString
sDL_HINT_APP_NAME =
  BG.pack [0x53, 0x44, 0x4C, 0x5F, 0x41, 0x50, 0x50, 0x5F, 0x4E, 0x41, 0x4D, 0x45]

-- | A variable controlling whether controllers used with the Apple TV generate UI events.
--
--     When UI events are generated by controller input, the app will be backgrounded when the Apple TV remote\'s menu button is pressed, and when the pause or B buttons on gamepads are pressed.
--
--     More information about properly making use of controllers for the Apple TV can be found here: [https:\/\/developer.apple.com\/tvos\/human-interface-guidelines\/remote-and-controllers\/](https://developer.apple.com/tvos/human-interface-guidelines/remote-and-controllers/)
--
--     The variable can be set to the following values:
--
--     * \"0\": Controller input does not generate UI events. (default)
--
--     * \"1\": Controller input generates UI events.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS@, literal @\"SDL_APPLE_TV_CONTROLLER_UI_EVENTS\"@, defined at @SDL3\/SDL_hints.h 198:9@
sDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS :: BG.ByteString
sDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x50
    , 0x50
    , 0x4C
    , 0x45
    , 0x5F
    , 0x54
    , 0x56
    , 0x5F
    , 0x43
    , 0x4F
    , 0x4E
    , 0x54
    , 0x52
    , 0x4F
    , 0x4C
    , 0x4C
    , 0x45
    , 0x52
    , 0x5F
    , 0x55
    , 0x49
    , 0x5F
    , 0x45
    , 0x56
    , 0x45
    , 0x4E
    , 0x54
    , 0x53
    ]

-- | A variable controlling whether the Apple TV remote\'s joystick axes will automatically match the rotation of the remote.
--
--     The variable can be set to the following values:
--
--     * \"0\": Remote orientation does not affect joystick axes. (default)
--
--     * \"1\": Joystick axes are based on the orientation of the remote.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION@, literal @\"SDL_APPLE_TV_REMOTE_ALLOW_ROTATION\"@, defined at @SDL3\/SDL_hints.h 213:9@
sDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION :: BG.ByteString
sDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x50
    , 0x50
    , 0x4C
    , 0x45
    , 0x5F
    , 0x54
    , 0x56
    , 0x5F
    , 0x52
    , 0x45
    , 0x4D
    , 0x4F
    , 0x54
    , 0x45
    , 0x5F
    , 0x41
    , 0x4C
    , 0x4C
    , 0x4F
    , 0x57
    , 0x5F
    , 0x52
    , 0x4F
    , 0x54
    , 0x41
    , 0x54
    , 0x49
    , 0x4F
    , 0x4E
    ]

-- | Specify the default ALSA audio device name.
--
--     This variable is a specific audio device to open when the \"default\" audio device is used.
--
--     This hint will be ignored when opening the default playback device if SDL_HINT_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE is set, or when opening the default recording device if SDL_HINT_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE is set.
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HINT_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE', 'sDL_HINT_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE'
--
--     [C declaration]: @macro SDL_HINT_AUDIO_ALSA_DEFAULT_DEVICE@, literal @\"SDL_AUDIO_ALSA_DEFAULT_DEVICE\"@, defined at @SDL3\/SDL_hints.h 233:9@
sDL_HINT_AUDIO_ALSA_DEFAULT_DEVICE :: BG.ByteString
sDL_HINT_AUDIO_ALSA_DEFAULT_DEVICE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x41
    , 0x4C
    , 0x53
    , 0x41
    , 0x5F
    , 0x44
    , 0x45
    , 0x46
    , 0x41
    , 0x55
    , 0x4C
    , 0x54
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    ]

-- | Specify the default ALSA audio playback device name.
--
--     This variable is a specific audio device to open for playback, when the \"default\" audio device is used.
--
--     If this hint isn\'t set, SDL will check SDL_HINT_AUDIO_ALSA_DEFAULT_DEVICE before choosing a reasonable default.
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HINT_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE', 'sDL_HINT_AUDIO_ALSA_DEFAULT_DEVICE'
--
--     [C declaration]: @macro SDL_HINT_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE@, literal @\"SDL_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE\"@, defined at @SDL3\/SDL_hints.h 251:9@
sDL_HINT_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE :: BG.ByteString
sDL_HINT_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x41
    , 0x4C
    , 0x53
    , 0x41
    , 0x5F
    , 0x44
    , 0x45
    , 0x46
    , 0x41
    , 0x55
    , 0x4C
    , 0x54
    , 0x5F
    , 0x50
    , 0x4C
    , 0x41
    , 0x59
    , 0x42
    , 0x41
    , 0x43
    , 0x4B
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    ]

-- | Specify the default ALSA audio recording device name.
--
--     This variable is a specific audio device to open for recording, when the \"default\" audio device is used.
--
--     If this hint isn\'t set, SDL will check SDL_HINT_AUDIO_ALSA_DEFAULT_DEVICE before choosing a reasonable default.
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HINT_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE', 'sDL_HINT_AUDIO_ALSA_DEFAULT_DEVICE'
--
--     [C declaration]: @macro SDL_HINT_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE@, literal @\"SDL_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE\"@, defined at @SDL3\/SDL_hints.h 269:9@
sDL_HINT_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE :: BG.ByteString
sDL_HINT_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x41
    , 0x4C
    , 0x53
    , 0x41
    , 0x5F
    , 0x44
    , 0x45
    , 0x46
    , 0x41
    , 0x55
    , 0x4C
    , 0x54
    , 0x5F
    , 0x52
    , 0x45
    , 0x43
    , 0x4F
    , 0x52
    , 0x44
    , 0x49
    , 0x4E
    , 0x47
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    ]

-- | A variable controlling the audio category on iOS and macOS.
--
--     The variable can be set to the following values:
--
--     * \"ambient\": Use the AVAudioSessionCategoryAmbient audio category, will be muted by the phone mute switch (default)
--
--     * \"playback\": Use the AVAudioSessionCategoryPlayback category.
--
--     For more information, see Apple\'s documentation: [https:\/\/developer.apple.com\/library\/content\/documentation\/Audio\/Conceptual\/AudioSessionProgrammingGuide\/AudioSessionCategoriesandModes\/AudioSessionCategoriesandModes.html](https://developer.apple.com/library/content/documentation/Audio/Conceptual/AudioSessionProgrammingGuide/AudioSessionCategoriesandModes/AudioSessionCategoriesandModes.html)
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_CATEGORY@, literal @\"SDL_AUDIO_CATEGORY\"@, defined at @SDL3\/SDL_hints.h 287:9@
sDL_HINT_AUDIO_CATEGORY :: BG.ByteString
sDL_HINT_AUDIO_CATEGORY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x43
    , 0x41
    , 0x54
    , 0x45
    , 0x47
    , 0x4F
    , 0x52
    , 0x59
    ]

-- | A variable controlling the default audio channel count.
--
--     If the application doesn\'t specify the audio channel count when opening the device, this hint can be used to specify a default channel count that will be used. This defaults to \"1\" for recording and \"2\" for playback devices.
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_CHANNELS@, literal @\"SDL_AUDIO_CHANNELS\"@, defined at @SDL3\/SDL_hints.h 300:9@
sDL_HINT_AUDIO_CHANNELS :: BG.ByteString
sDL_HINT_AUDIO_CHANNELS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x43
    , 0x48
    , 0x41
    , 0x4E
    , 0x4E
    , 0x45
    , 0x4C
    , 0x53
    ]

-- | Specify an application icon name for an audio device.
--
--     Some audio backends (such as Pulseaudio and Pipewire) allow you to set an XDG icon name for your application. Among other things, this icon might show up in a system control panel that lets the user adjust the volume on specific audio streams instead of using one giant master volume slider. Note that this is unrelated to the icon used by the windowing system, which may be set with SDL_SetWindowIcon (or via desktop file on Wayland).
--
--     Setting this to \"\" or leaving it unset will have SDL use a reasonable default, \"applications-games\", which is likely to be installed. See [https:\/\/specifications.freedesktop.org\/icon-theme-spec\/icon-theme-spec-latest.html](https://specifications.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html) and [https:\/\/specifications.freedesktop.org\/icon-naming-spec\/icon-naming-spec-latest.html](https://specifications.freedesktop.org/icon-naming-spec/icon-naming-spec-latest.html) for the relevant XDG icon specs.
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_DEVICE_APP_ICON_NAME@, literal @\"SDL_AUDIO_DEVICE_APP_ICON_NAME\"@, defined at @SDL3\/SDL_hints.h 323:9@
sDL_HINT_AUDIO_DEVICE_APP_ICON_NAME :: BG.ByteString
sDL_HINT_AUDIO_DEVICE_APP_ICON_NAME =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x5F
    , 0x41
    , 0x50
    , 0x50
    , 0x5F
    , 0x49
    , 0x43
    , 0x4F
    , 0x4E
    , 0x5F
    , 0x4E
    , 0x41
    , 0x4D
    , 0x45
    ]

-- | A variable controlling device buffer size.
--
--     This hint is an integer > 0, that represents the size of the device\'s buffer in sample frames (stereo audio data in 16-bit format is 4 bytes per sample frame, for example).
--
--     SDL3 generally decides this value on behalf of the app, but if for some reason the app needs to dictate this (because they want either lower latency or higher throughput AND ARE WILLING TO DEAL WITH what that might require of the app), they can specify it.
--
--     SDL will try to accommodate this value, but there is no promise you\'ll get the buffer size requested. Many platforms won\'t honor this request at all, or might adjust it.
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_DEVICE_SAMPLE_FRAMES@, literal @\"SDL_AUDIO_DEVICE_SAMPLE_FRAMES\"@, defined at @SDL3\/SDL_hints.h 345:9@
sDL_HINT_AUDIO_DEVICE_SAMPLE_FRAMES :: BG.ByteString
sDL_HINT_AUDIO_DEVICE_SAMPLE_FRAMES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x5F
    , 0x53
    , 0x41
    , 0x4D
    , 0x50
    , 0x4C
    , 0x45
    , 0x5F
    , 0x46
    , 0x52
    , 0x41
    , 0x4D
    , 0x45
    , 0x53
    ]

-- | Specify an audio stream name for an audio device.
--
--     Some audio backends (such as PulseAudio) allow you to describe your audio stream. Among other things, this description might show up in a system control panel that lets the user adjust the volume on specific audio streams instead of using one giant master volume slider.
--
--     This hints lets you transmit that information to the OS. The contents of this hint are used while opening an audio device. You should use a string that describes your what your program is playing (\"audio stream\" is probably sufficient in many cases, but this could be useful for something like \"team chat\" if you have a headset playing VoIP audio separately).
--
--     Setting this to \"\" or leaving it unset will have SDL use a reasonable default: \"audio stream\" or something similar.
--
--     Note that while this talks about audio streams, this is an OS-level concept, so it applies to a physical audio device in this case, and not an SDL_AudioStream, nor an SDL logical audio device.
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_DEVICE_STREAM_NAME@, literal @\"SDL_AUDIO_DEVICE_STREAM_NAME\"@, defined at @SDL3\/SDL_hints.h 372:9@
sDL_HINT_AUDIO_DEVICE_STREAM_NAME :: BG.ByteString
sDL_HINT_AUDIO_DEVICE_STREAM_NAME =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x5F
    , 0x53
    , 0x54
    , 0x52
    , 0x45
    , 0x41
    , 0x4D
    , 0x5F
    , 0x4E
    , 0x41
    , 0x4D
    , 0x45
    ]

-- | Specify an application role for an audio device.
--
--     Some audio backends (such as Pipewire) allow you to describe the role of your audio stream. Among other things, this description might show up in a system control panel or software for displaying and manipulating media playback\/recording graphs.
--
--     This hints lets you transmit that information to the OS. The contents of this hint are used while opening an audio device. You should use a string that describes your what your program is playing (Game, Music, Movie, etc...).
--
--     Setting this to \"\" or leaving it unset will have SDL use a reasonable default: \"Game\" or something similar.
--
--     Note that while this talks about audio streams, this is an OS-level concept, so it applies to a physical audio device in this case, and not an SDL_AudioStream, nor an SDL logical audio device.
--
--     For Windows WASAPI audio, the following roles are supported, and map to @AUDIO_STREAM_CATEGORY@:
--
--     * \"Other\" (default)
--
--     * \"Communications\" - Real-time communications, such as VOIP or chat
--
--     * \"Game\" - Game audio
--
--     * \"GameChat\" - Game chat audio, similar to \"Communications\" except that this will not attenuate other audio streams
--
--     * \"Movie\" - Music or sound with dialog
--
--     * \"Media\" - Music or sound without dialog
--
--     If your application applies its own echo cancellation, gain control, and noise reduction it should also set SDL_HINT_AUDIO_DEVICE_RAW_STREAM.
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_DEVICE_STREAM_ROLE@, literal @\"SDL_AUDIO_DEVICE_STREAM_ROLE\"@, defined at @SDL3\/SDL_hints.h 412:9@
sDL_HINT_AUDIO_DEVICE_STREAM_ROLE :: BG.ByteString
sDL_HINT_AUDIO_DEVICE_STREAM_ROLE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x5F
    , 0x53
    , 0x54
    , 0x52
    , 0x45
    , 0x41
    , 0x4D
    , 0x5F
    , 0x52
    , 0x4F
    , 0x4C
    , 0x45
    ]

-- | Specify whether this audio device should do audio processing.
--
--     Some operating systems perform echo cancellation, gain control, and noise reduction as needed. If your application already handles these, you can set this hint to prevent the OS from doing additional audio processing.
--
--     This corresponds to the WASAPI audio option @AUDCLNT_STREAMOPTIONS_RAW@.
--
--     The variable can be set to the following values:
--
--     * \"0\": audio processing can be done by the OS. (default)
--
--     * \"1\": audio processing is done by the application.
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_DEVICE_RAW_STREAM@, literal @\"SDL_AUDIO_DEVICE_RAW_STREAM\"@, defined at @SDL3\/SDL_hints.h 432:9@
sDL_HINT_AUDIO_DEVICE_RAW_STREAM :: BG.ByteString
sDL_HINT_AUDIO_DEVICE_RAW_STREAM =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x5F
    , 0x52
    , 0x41
    , 0x57
    , 0x5F
    , 0x53
    , 0x54
    , 0x52
    , 0x45
    , 0x41
    , 0x4D
    ]

-- | Specify the input file when recording audio using the disk audio driver.
--
--     This defaults to \"sdlaudio-in.raw\"
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_DISK_INPUT_FILE@, literal @\"SDL_AUDIO_DISK_INPUT_FILE\"@, defined at @SDL3\/SDL_hints.h 443:9@
sDL_HINT_AUDIO_DISK_INPUT_FILE :: BG.ByteString
sDL_HINT_AUDIO_DISK_INPUT_FILE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x44
    , 0x49
    , 0x53
    , 0x4B
    , 0x5F
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    , 0x5F
    , 0x46
    , 0x49
    , 0x4C
    , 0x45
    ]

-- | Specify the output file when playing audio using the disk audio driver.
--
--     This defaults to \"sdlaudio.raw\"
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_DISK_OUTPUT_FILE@, literal @\"SDL_AUDIO_DISK_OUTPUT_FILE\"@, defined at @SDL3\/SDL_hints.h 454:9@
sDL_HINT_AUDIO_DISK_OUTPUT_FILE :: BG.ByteString
sDL_HINT_AUDIO_DISK_OUTPUT_FILE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x44
    , 0x49
    , 0x53
    , 0x4B
    , 0x5F
    , 0x4F
    , 0x55
    , 0x54
    , 0x50
    , 0x55
    , 0x54
    , 0x5F
    , 0x46
    , 0x49
    , 0x4C
    , 0x45
    ]

-- | A variable controlling the audio rate when using the disk audio driver.
--
--     The disk audio driver normally simulates real-time for the audio rate that was specified, but you can use this variable to adjust this rate higher or lower down to 0. The default value is \"1.0\".
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_DISK_TIMESCALE@, literal @\"SDL_AUDIO_DISK_TIMESCALE\"@, defined at @SDL3\/SDL_hints.h 467:9@
sDL_HINT_AUDIO_DISK_TIMESCALE :: BG.ByteString
sDL_HINT_AUDIO_DISK_TIMESCALE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x44
    , 0x49
    , 0x53
    , 0x4B
    , 0x5F
    , 0x54
    , 0x49
    , 0x4D
    , 0x45
    , 0x53
    , 0x43
    , 0x41
    , 0x4C
    , 0x45
    ]

-- | A variable that specifies an audio backend to use.
--
--     By default, SDL will try all available audio backends in a reasonable order until it finds one that can work, but this hint allows the app or user to force a specific driver, such as \"pipewire\" if, say, you are on PulseAudio but want to try talking to the lower level instead.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_DRIVER@, literal @\"SDL_AUDIO_DRIVER\"@, defined at @SDL3\/SDL_hints.h 481:9@
sDL_HINT_AUDIO_DRIVER :: BG.ByteString
sDL_HINT_AUDIO_DRIVER =
  BG.pack
    [0x53, 0x44, 0x4C, 0x5F, 0x41, 0x55, 0x44, 0x49, 0x4F, 0x5F, 0x44, 0x52, 0x49, 0x56, 0x45, 0x52]

-- | A variable controlling the audio rate when using the dummy audio driver.
--
--     The dummy audio driver normally simulates real-time for the audio rate that was specified, but you can use this variable to adjust this rate higher or lower down to 0. The default value is \"1.0\".
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_DUMMY_TIMESCALE@, literal @\"SDL_AUDIO_DUMMY_TIMESCALE\"@, defined at @SDL3\/SDL_hints.h 494:9@
sDL_HINT_AUDIO_DUMMY_TIMESCALE :: BG.ByteString
sDL_HINT_AUDIO_DUMMY_TIMESCALE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x44
    , 0x55
    , 0x4D
    , 0x4D
    , 0x59
    , 0x5F
    , 0x54
    , 0x49
    , 0x4D
    , 0x45
    , 0x53
    , 0x43
    , 0x41
    , 0x4C
    , 0x45
    ]

-- | A variable controlling the default audio format.
--
--     If the application doesn\'t specify the audio format when opening the device, this hint can be used to specify a default format that will be used.
--
--     The variable can be set to the following values:
--
--     * \"U8\": Unsigned 8-bit audio
--
--     * \"S8\": Signed 8-bit audio
--
--     * \"S16LE\": Signed 16-bit little-endian audio
--
--     * \"S16BE\": Signed 16-bit big-endian audio
--
--     * \"S16\": Signed 16-bit native-endian audio (default)
--
--     * \"S32LE\": Signed 32-bit little-endian audio
--
--     * \"S32BE\": Signed 32-bit big-endian audio
--
--     * \"S32\": Signed 32-bit native-endian audio
--
--     * \"F32LE\": Floating point little-endian audio
--
--     * \"F32BE\": Floating point big-endian audio
--
--     * \"F32\": Floating point native-endian audio
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_FORMAT@, literal @\"SDL_AUDIO_FORMAT\"@, defined at @SDL3\/SDL_hints.h 521:9@
sDL_HINT_AUDIO_FORMAT :: BG.ByteString
sDL_HINT_AUDIO_FORMAT =
  BG.pack
    [0x53, 0x44, 0x4C, 0x5F, 0x41, 0x55, 0x44, 0x49, 0x4F, 0x5F, 0x46, 0x4F, 0x52, 0x4D, 0x41, 0x54]

-- | A variable controlling the default audio frequency.
--
--     If the application doesn\'t specify the audio frequency when opening the device, this hint can be used to specify a default frequency that will be used. This defaults to \"44100\".
--
--     This hint should be set before an audio device is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_FREQUENCY@, literal @\"SDL_AUDIO_FREQUENCY\"@, defined at @SDL3\/SDL_hints.h 534:9@
sDL_HINT_AUDIO_FREQUENCY :: BG.ByteString
sDL_HINT_AUDIO_FREQUENCY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x46
    , 0x52
    , 0x45
    , 0x51
    , 0x55
    , 0x45
    , 0x4E
    , 0x43
    , 0x59
    ]

-- | A variable that causes SDL to not ignore audio \"monitors\".
--
--     This is currently only used by the PulseAudio driver.
--
--     By default, SDL ignores audio devices that aren\'t associated with physical hardware. Changing this hint to \"1\" will expose anything SDL sees that appears to be an audio source or sink. This will add \"devices\" to the list that the user probably doesn\'t want or need, but it can be useful in scenarios where you want to hook up SDL to some sort of virtual device, etc.
--
--     The variable can be set to the following values:
--
--     * \"0\": Audio monitor devices will be ignored. (default)
--
--     * \"1\": Audio monitor devices will show up in the device list.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUDIO_INCLUDE_MONITORS@, literal @\"SDL_AUDIO_INCLUDE_MONITORS\"@, defined at @SDL3\/SDL_hints.h 557:9@
sDL_HINT_AUDIO_INCLUDE_MONITORS :: BG.ByteString
sDL_HINT_AUDIO_INCLUDE_MONITORS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x44
    , 0x49
    , 0x4F
    , 0x5F
    , 0x49
    , 0x4E
    , 0x43
    , 0x4C
    , 0x55
    , 0x44
    , 0x45
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x4E
    , 0x49
    , 0x54
    , 0x4F
    , 0x52
    , 0x53
    ]

-- | A variable controlling whether SDL updates joystick state when getting input events.
--
--     The variable can be set to the following values:
--
--     * \"0\": You\'ll call SDL_UpdateJoysticks() manually.
--
--     * \"1\": SDL will automatically call SDL_UpdateJoysticks(). (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUTO_UPDATE_JOYSTICKS@, literal @\"SDL_AUTO_UPDATE_JOYSTICKS\"@, defined at @SDL3\/SDL_hints.h 572:9@
sDL_HINT_AUTO_UPDATE_JOYSTICKS :: BG.ByteString
sDL_HINT_AUTO_UPDATE_JOYSTICKS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x54
    , 0x4F
    , 0x5F
    , 0x55
    , 0x50
    , 0x44
    , 0x41
    , 0x54
    , 0x45
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x53
    ]

-- | A variable controlling whether SDL updates sensor state when getting input events.
--
--     The variable can be set to the following values:
--
--     * \"0\": You\'ll call SDL_UpdateSensors() manually.
--
--     * \"1\": SDL will automatically call SDL_UpdateSensors(). (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_AUTO_UPDATE_SENSORS@, literal @\"SDL_AUTO_UPDATE_SENSORS\"@, defined at @SDL3\/SDL_hints.h 587:9@
sDL_HINT_AUTO_UPDATE_SENSORS :: BG.ByteString
sDL_HINT_AUTO_UPDATE_SENSORS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x54
    , 0x4F
    , 0x5F
    , 0x55
    , 0x50
    , 0x44
    , 0x41
    , 0x54
    , 0x45
    , 0x5F
    , 0x53
    , 0x45
    , 0x4E
    , 0x53
    , 0x4F
    , 0x52
    , 0x53
    ]

-- | Prevent SDL from using version 4 of the bitmap header when saving BMPs.
--
--     The bitmap header version 4 is required for proper alpha channel support and SDL will use it when required. Should this not be desired, this hint can force the use of the 40 byte header version which is supported everywhere.
--
--     The variable can be set to the following values:
--
--     * \"0\": Surfaces with a colorkey or an alpha channel are saved to a 32-bit BMP file with an alpha mask. SDL will use the bitmap header version 4 and set the alpha mask accordingly. (default)
--
--     * \"1\": Surfaces with a colorkey or an alpha channel are saved to a 32-bit BMP file without an alpha mask. The alpha channel data will be in the file, but applications are going to ignore it.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_BMP_SAVE_LEGACY_FORMAT@, literal @\"SDL_BMP_SAVE_LEGACY_FORMAT\"@, defined at @SDL3\/SDL_hints.h 610:9@
sDL_HINT_BMP_SAVE_LEGACY_FORMAT :: BG.ByteString
sDL_HINT_BMP_SAVE_LEGACY_FORMAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x42
    , 0x4D
    , 0x50
    , 0x5F
    , 0x53
    , 0x41
    , 0x56
    , 0x45
    , 0x5F
    , 0x4C
    , 0x45
    , 0x47
    , 0x41
    , 0x43
    , 0x59
    , 0x5F
    , 0x46
    , 0x4F
    , 0x52
    , 0x4D
    , 0x41
    , 0x54
    ]

-- | A variable that decides what camera backend to use.
--
--     By default, SDL will try all available camera backends in a reasonable order until it finds one that can work, but this hint allows the app or user to force a specific target, such as \"directshow\" if, say, you are on Windows Media Foundations but want to try DirectShow instead.
--
--     The default value is unset, in which case SDL will try to figure out the best camera backend on your behalf. This hint needs to be set before SDL_Init() is called to be useful.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_CAMERA_DRIVER@, literal @\"SDL_CAMERA_DRIVER\"@, defined at @SDL3\/SDL_hints.h 626:9@
sDL_HINT_CAMERA_DRIVER :: BG.ByteString
sDL_HINT_CAMERA_DRIVER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x43
    , 0x41
    , 0x4D
    , 0x45
    , 0x52
    , 0x41
    , 0x5F
    , 0x44
    , 0x52
    , 0x49
    , 0x56
    , 0x45
    , 0x52
    ]

-- | A variable that limits what CPU features are available.
--
--     By default, SDL marks all features the current CPU supports as available. This hint allows the enabled features to be limited to a subset.
--
--     When the hint is unset, or empty, SDL will enable all detected CPU features.
--
--     The variable can be set to a comma separated list containing the following items:
--
--     * \"all\"
--
--     * \"altivec\"
--
--     * \"sse\"
--
--     * \"sse2\"
--
--     * \"sse3\"
--
--     * \"sse41\"
--
--     * \"sse42\"
--
--     * \"avx\"
--
--     * \"avx2\"
--
--     * \"avx512f\"
--
--     * \"arm-simd\"
--
--     * \"neon\"
--
--     * \"lsx\"
--
--     * \"lasx\"
--
--     The items can be prefixed by \'+\'\/\'-\' to add\/remove features.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_CPU_FEATURE_MASK@, literal @\"SDL_CPU_FEATURE_MASK\"@, defined at @SDL3\/SDL_hints.h 659:9@
sDL_HINT_CPU_FEATURE_MASK :: BG.ByteString
sDL_HINT_CPU_FEATURE_MASK =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x43
    , 0x50
    , 0x55
    , 0x5F
    , 0x46
    , 0x45
    , 0x41
    , 0x54
    , 0x55
    , 0x52
    , 0x45
    , 0x5F
    , 0x4D
    , 0x41
    , 0x53
    , 0x4B
    ]

-- | A variable controlling whether DirectInput should be used for controllers.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable DirectInput detection.
--
--     * \"1\": Enable DirectInput detection. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_DIRECTINPUT@, literal @\"SDL_JOYSTICK_DIRECTINPUT\"@, defined at @SDL3\/SDL_hints.h 673:9@
sDL_HINT_JOYSTICK_DIRECTINPUT :: BG.ByteString
sDL_HINT_JOYSTICK_DIRECTINPUT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x44
    , 0x49
    , 0x52
    , 0x45
    , 0x43
    , 0x54
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    ]

-- | A variable that specifies a dialog backend to use.
--
--     By default, SDL will try all available dialog backends in a reasonable order until it finds one that can work, but this hint allows the app or user to force a specific target.
--
--     If the specified target does not exist or is not available, the dialog-related function calls will fail.
--
--     This hint currently only applies to platforms using the generic \"Unix\" dialog implementation, but may be extended to more platforms in the future. Note that some Unix and Unix-like platforms have their own implementation, such as macOS and Haiku.
--
--     The variable can be set to the following values:
--
--     * NULL: Select automatically (default, all platforms)
--
--     * \"portal\": Use XDG Portals through DBus (Unix only)
--
--     * \"zenity\": Use the Zenity program (Unix only)
--
--     More options may be added in the future.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_FILE_DIALOG_DRIVER@, literal @\"SDL_FILE_DIALOG_DRIVER\"@, defined at @SDL3\/SDL_hints.h 702:9@
sDL_HINT_FILE_DIALOG_DRIVER :: BG.ByteString
sDL_HINT_FILE_DIALOG_DRIVER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x46
    , 0x49
    , 0x4C
    , 0x45
    , 0x5F
    , 0x44
    , 0x49
    , 0x41
    , 0x4C
    , 0x4F
    , 0x47
    , 0x5F
    , 0x44
    , 0x52
    , 0x49
    , 0x56
    , 0x45
    , 0x52
    ]

-- | Override for SDL_GetDisplayUsableBounds().
--
--     If set, this hint will override the expected results for SDL_GetDisplayUsableBounds() for display index 0. Generally you don\'t want to do this, but this allows an embedded system to request that some of the screen be reserved for other uses when paired with a well-behaved application.
--
--     The contents of this hint must be 4 comma-separated integers, the first is the bounds x, then y, width and height, in that order.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_DISPLAY_USABLE_BOUNDS@, literal @\"SDL_DISPLAY_USABLE_BOUNDS\"@, defined at @SDL3\/SDL_hints.h 720:9@
sDL_HINT_DISPLAY_USABLE_BOUNDS :: BG.ByteString
sDL_HINT_DISPLAY_USABLE_BOUNDS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x44
    , 0x49
    , 0x53
    , 0x50
    , 0x4C
    , 0x41
    , 0x59
    , 0x5F
    , 0x55
    , 0x53
    , 0x41
    , 0x42
    , 0x4C
    , 0x45
    , 0x5F
    , 0x42
    , 0x4F
    , 0x55
    , 0x4E
    , 0x44
    , 0x53
    ]

-- | Set the level of checking for invalid parameters passed to SDL functions.
--
--     The variable can be set to the following values:
--
--     * \"1\": Enable fast parameter error checking, e.g. quick NULL checks, etc.
--
--     * \"2\": Enable full parameter error checking, e.g. validating objects are the correct type, etc. (default)
--
--     This hint can be set anytime.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_INVALID_PARAM_CHECKS@, literal @\"SDL_INVALID_PARAM_CHECKS\"@, defined at @SDL3\/SDL_hints.h 735:9@
sDL_HINT_INVALID_PARAM_CHECKS :: BG.ByteString
sDL_HINT_INVALID_PARAM_CHECKS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x49
    , 0x4E
    , 0x56
    , 0x41
    , 0x4C
    , 0x49
    , 0x44
    , 0x5F
    , 0x50
    , 0x41
    , 0x52
    , 0x41
    , 0x4D
    , 0x5F
    , 0x43
    , 0x48
    , 0x45
    , 0x43
    , 0x4B
    , 0x53
    ]

-- | Disable giving back control to the browser automatically when running with asyncify.
--
--     With -s ASYNCIFY, SDL calls emscripten_sleep during operations such as refreshing the screen or polling events.
--
--     This hint only applies to the emscripten platform.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable emscripten_sleep calls (if you give back browser control manually or use asyncify for other purposes).
--
--     * \"1\": Enable emscripten_sleep calls. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_EMSCRIPTEN_ASYNCIFY@, literal @\"SDL_EMSCRIPTEN_ASYNCIFY\"@, defined at @SDL3\/SDL_hints.h 756:9@
sDL_HINT_EMSCRIPTEN_ASYNCIFY :: BG.ByteString
sDL_HINT_EMSCRIPTEN_ASYNCIFY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x45
    , 0x4D
    , 0x53
    , 0x43
    , 0x52
    , 0x49
    , 0x50
    , 0x54
    , 0x45
    , 0x4E
    , 0x5F
    , 0x41
    , 0x53
    , 0x59
    , 0x4E
    , 0x43
    , 0x49
    , 0x46
    , 0x59
    ]

-- | Specify the CSS selector used for the \"default\" window\/canvas.
--
--     This hint only applies to the emscripten platform.
--
--     This hint should be set before creating a window.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_EMSCRIPTEN_CANVAS_SELECTOR@, literal @\"SDL_EMSCRIPTEN_CANVAS_SELECTOR\"@, defined at @SDL3\/SDL_hints.h 767:9@
sDL_HINT_EMSCRIPTEN_CANVAS_SELECTOR :: BG.ByteString
sDL_HINT_EMSCRIPTEN_CANVAS_SELECTOR =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x45
    , 0x4D
    , 0x53
    , 0x43
    , 0x52
    , 0x49
    , 0x50
    , 0x54
    , 0x45
    , 0x4E
    , 0x5F
    , 0x43
    , 0x41
    , 0x4E
    , 0x56
    , 0x41
    , 0x53
    , 0x5F
    , 0x53
    , 0x45
    , 0x4C
    , 0x45
    , 0x43
    , 0x54
    , 0x4F
    , 0x52
    ]

-- | Override the binding element for keyboard inputs for Emscripten builds.
--
--     This hint only applies to the emscripten platform.
--
--     The variable can be one of:
--
--     * \"\#window\": the javascript window object
--
--     * \"\#document\": the javascript document object
--
--     * \"\#screen\": the javascript window.screen object
--
--     * \"\#canvas\": the WebGL canvas element
--
--     * \"\#none\": Don\'t bind anything at all
--
--     * any other string without a leading \# sign applies to the element on the page with that ID.
--
--     This hint should be set before creating a window.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT@, literal @\"SDL_EMSCRIPTEN_KEYBOARD_ELEMENT\"@, defined at @SDL3\/SDL_hints.h 788:9@
sDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT :: BG.ByteString
sDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x45
    , 0x4D
    , 0x53
    , 0x43
    , 0x52
    , 0x49
    , 0x50
    , 0x54
    , 0x45
    , 0x4E
    , 0x5F
    , 0x4B
    , 0x45
    , 0x59
    , 0x42
    , 0x4F
    , 0x41
    , 0x52
    , 0x44
    , 0x5F
    , 0x45
    , 0x4C
    , 0x45
    , 0x4D
    , 0x45
    , 0x4E
    , 0x54
    ]

-- | A variable that controls whether the on-screen keyboard should be shown when text input is active.
--
--     The variable can be set to the following values:
--
--     * \"auto\": The on-screen keyboard will be shown if there is no physical keyboard attached. (default)
--
--     * \"0\": Do not show the on-screen keyboard.
--
--     * \"1\": Show the on-screen keyboard, if available.
--
--     This hint must be set before SDL_StartTextInput() is called
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_ENABLE_SCREEN_KEYBOARD@, literal @\"SDL_ENABLE_SCREEN_KEYBOARD\"@, defined at @SDL3\/SDL_hints.h 805:9@
sDL_HINT_ENABLE_SCREEN_KEYBOARD :: BG.ByteString
sDL_HINT_ENABLE_SCREEN_KEYBOARD =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x45
    , 0x4E
    , 0x41
    , 0x42
    , 0x4C
    , 0x45
    , 0x5F
    , 0x53
    , 0x43
    , 0x52
    , 0x45
    , 0x45
    , 0x4E
    , 0x5F
    , 0x4B
    , 0x45
    , 0x59
    , 0x42
    , 0x4F
    , 0x41
    , 0x52
    , 0x44
    ]

-- | A variable containing a list of evdev devices to use if udev is not available.
--
--     The list of devices is in the form:
--
--     deviceclass:path[,deviceclass:path[,...]]
--
--     where device class is an integer representing the SDL_UDEV_deviceclass and path is the full path to the event device.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_EVDEV_DEVICES@, literal @\"SDL_EVDEV_DEVICES\"@, defined at @SDL3\/SDL_hints.h 822:9@
sDL_HINT_EVDEV_DEVICES :: BG.ByteString
sDL_HINT_EVDEV_DEVICES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x45
    , 0x56
    , 0x44
    , 0x45
    , 0x56
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    ]

-- | A variable controlling verbosity of the logging of SDL events pushed onto the internal queue.
--
--     The variable can be set to the following values, from least to most verbose:
--
--     * \"0\": Don\'t log any events. (default)
--
--     * \"1\": Log most events (other than the really spammy ones).
--
--     * \"2\": Include mouse and finger motion events.
--
--     This is generally meant to be used to debug SDL itself, but can be useful for application developers that need better visibility into what is going on in the event queue. Logged events are sent through SDL_Log(), which means by default they appear on stdout on most platforms or maybe OutputDebugString() on Windows, and can be funneled by the app with SDL_SetLogOutputFunction(), etc.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_EVENT_LOGGING@, literal @\"SDL_EVENT_LOGGING\"@, defined at @SDL3\/SDL_hints.h 846:9@
sDL_HINT_EVENT_LOGGING :: BG.ByteString
sDL_HINT_EVENT_LOGGING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x45
    , 0x56
    , 0x45
    , 0x4E
    , 0x54
    , 0x5F
    , 0x4C
    , 0x4F
    , 0x47
    , 0x47
    , 0x49
    , 0x4E
    , 0x47
    ]

-- | A variable controlling whether raising the window should be done more forcefully.
--
--     The variable can be set to the following values:
--
--     * \"0\": Honor the OS policy for raising windows. (default)
--
--     * \"1\": Force the window to be raised, overriding any OS policy.
--
--     At present, this is only an issue under MS Windows, which makes it nearly impossible to programmatically move a window to the foreground, for \"security\" reasons. See [http:\/\/stackoverflow.com\/a\/34414846](http://stackoverflow.com/a/34414846) for a discussion.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_FORCE_RAISEWINDOW@, literal @\"SDL_FORCE_RAISEWINDOW\"@, defined at @SDL3\/SDL_hints.h 866:9@
sDL_HINT_FORCE_RAISEWINDOW :: BG.ByteString
sDL_HINT_FORCE_RAISEWINDOW =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x46
    , 0x4F
    , 0x52
    , 0x43
    , 0x45
    , 0x5F
    , 0x52
    , 0x41
    , 0x49
    , 0x53
    , 0x45
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    ]

-- | A variable controlling how 3D acceleration is used to accelerate the SDL screen surface.
--
--     SDL can try to accelerate the SDL screen surface by using streaming textures with a 3D rendering engine. This variable controls whether and how this is done.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable 3D acceleration
--
--     * \"1\": Enable 3D acceleration, using the default renderer. (default)
--
--     * \"X\": Enable 3D acceleration, using X where X is one of the valid rendering drivers. (e.g. \"direct3d\", \"opengl\", etc.)
--
--     This hint should be set before calling SDL_GetWindowSurface()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_FRAMEBUFFER_ACCELERATION@, literal @\"SDL_FRAMEBUFFER_ACCELERATION\"@, defined at @SDL3\/SDL_hints.h 887:9@
sDL_HINT_FRAMEBUFFER_ACCELERATION :: BG.ByteString
sDL_HINT_FRAMEBUFFER_ACCELERATION =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x46
    , 0x52
    , 0x41
    , 0x4D
    , 0x45
    , 0x42
    , 0x55
    , 0x46
    , 0x46
    , 0x45
    , 0x52
    , 0x5F
    , 0x41
    , 0x43
    , 0x43
    , 0x45
    , 0x4C
    , 0x45
    , 0x52
    , 0x41
    , 0x54
    , 0x49
    , 0x4F
    , 0x4E
    ]

-- | A variable that lets you manually hint extra gamecontroller db entries.
--
--     The variable should be newline delimited rows of gamecontroller config data, see SDL_gamepad.h
--
--     You can update mappings after SDL is initialized with SDL_GetGamepadMappingForGUID() and SDL_AddGamepadMapping()
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_GAMECONTROLLERCONFIG@, literal @\"SDL_GAMECONTROLLERCONFIG\"@, defined at @SDL3\/SDL_hints.h 902:9@
sDL_HINT_GAMECONTROLLERCONFIG :: BG.ByteString
sDL_HINT_GAMECONTROLLERCONFIG =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x43
    , 0x4F
    , 0x4E
    , 0x54
    , 0x52
    , 0x4F
    , 0x4C
    , 0x4C
    , 0x45
    , 0x52
    , 0x43
    , 0x4F
    , 0x4E
    , 0x46
    , 0x49
    , 0x47
    ]

-- | A variable that lets you provide a file with extra gamecontroller db entries.
--
--     The file should contain lines of gamecontroller config data, see SDL_gamepad.h
--
--     You can update mappings after SDL is initialized with SDL_GetGamepadMappingForGUID() and SDL_AddGamepadMapping()
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_GAMECONTROLLERCONFIG_FILE@, literal @\"SDL_GAMECONTROLLERCONFIG_FILE\"@, defined at @SDL3\/SDL_hints.h 918:9@
sDL_HINT_GAMECONTROLLERCONFIG_FILE :: BG.ByteString
sDL_HINT_GAMECONTROLLERCONFIG_FILE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x43
    , 0x4F
    , 0x4E
    , 0x54
    , 0x52
    , 0x4F
    , 0x4C
    , 0x4C
    , 0x45
    , 0x52
    , 0x43
    , 0x4F
    , 0x4E
    , 0x46
    , 0x49
    , 0x47
    , 0x5F
    , 0x46
    , 0x49
    , 0x4C
    , 0x45
    ]

-- | A variable that overrides the automatic controller type detection.
--
--     The variable should be comma separated entries, in the form: VID\/PID=type
--
--     The VID and PID should be hexadecimal with exactly 4 digits, e.g. 0x00fd
--
--     This hint affects what low level protocol is used with the HIDAPI driver.
--
--     The variable can be set to the following values:
--
--     * \"Xbox360\"
--
--     * \"XboxOne\"
--
--     * \"PS3\"
--
--     * \"PS4\"
--
--     * \"PS5\"
--
--     * \"SwitchPro\"
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_GAMECONTROLLERTYPE@, literal @\"SDL_GAMECONTROLLERTYPE\"@, defined at @SDL3\/SDL_hints.h 942:9@
sDL_HINT_GAMECONTROLLERTYPE :: BG.ByteString
sDL_HINT_GAMECONTROLLERTYPE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x43
    , 0x4F
    , 0x4E
    , 0x54
    , 0x52
    , 0x4F
    , 0x4C
    , 0x4C
    , 0x45
    , 0x52
    , 0x54
    , 0x59
    , 0x50
    , 0x45
    ]

-- | A variable containing a list of devices to skip when scanning for game controllers.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     0xAAAA\/0xBBBB,0xCCCC\/0xDDDD
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES@, literal @\"SDL_GAMECONTROLLER_IGNORE_DEVICES\"@, defined at @SDL3\/SDL_hints.h 960:9@
sDL_HINT_GAMECONTROLLER_IGNORE_DEVICES :: BG.ByteString
sDL_HINT_GAMECONTROLLER_IGNORE_DEVICES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x43
    , 0x4F
    , 0x4E
    , 0x54
    , 0x52
    , 0x4F
    , 0x4C
    , 0x4C
    , 0x45
    , 0x52
    , 0x5F
    , 0x49
    , 0x47
    , 0x4E
    , 0x4F
    , 0x52
    , 0x45
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    ]

-- | If set, all devices will be skipped when scanning for game controllers except for the ones listed in this variable.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     0xAAAA\/0xBBBB,0xCCCC\/0xDDDD
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT@, literal @\"SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT\"@, defined at @SDL3\/SDL_hints.h 978:9@
sDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT :: BG.ByteString
sDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x43
    , 0x4F
    , 0x4E
    , 0x54
    , 0x52
    , 0x4F
    , 0x4C
    , 0x4C
    , 0x45
    , 0x52
    , 0x5F
    , 0x49
    , 0x47
    , 0x4E
    , 0x4F
    , 0x52
    , 0x45
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    , 0x5F
    , 0x45
    , 0x58
    , 0x43
    , 0x45
    , 0x50
    , 0x54
    ]

-- | A variable that controls whether the device\'s built-in accelerometer and gyro should be used as sensors for gamepads.
--
--     The variable can be set to the following values:
--
--     * \"0\": Sensor fusion is disabled
--
--     * \"1\": Sensor fusion is enabled for all controllers that lack sensors
--
--     Or the variable can be a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     0xAAAA\/0xBBBB,0xCCCC\/0xDDDD
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint should be set before a gamepad is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_GAMECONTROLLER_SENSOR_FUSION@, literal @\"SDL_GAMECONTROLLER_SENSOR_FUSION\"@, defined at @SDL3\/SDL_hints.h 1001:9@
sDL_HINT_GAMECONTROLLER_SENSOR_FUSION :: BG.ByteString
sDL_HINT_GAMECONTROLLER_SENSOR_FUSION =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x43
    , 0x4F
    , 0x4E
    , 0x54
    , 0x52
    , 0x4F
    , 0x4C
    , 0x4C
    , 0x45
    , 0x52
    , 0x5F
    , 0x53
    , 0x45
    , 0x4E
    , 0x53
    , 0x4F
    , 0x52
    , 0x5F
    , 0x46
    , 0x55
    , 0x53
    , 0x49
    , 0x4F
    , 0x4E
    ]

-- | This variable sets the default text of the TextInput window on GDK platforms.
--
--     This hint is available only if SDL_GDK_TEXTINPUT defined.
--
--     This hint should be set before calling SDL_StartTextInput()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_GDK_TEXTINPUT_DEFAULT_TEXT@, literal @\"SDL_GDK_TEXTINPUT_DEFAULT_TEXT\"@, defined at @SDL3\/SDL_hints.h 1013:9@
sDL_HINT_GDK_TEXTINPUT_DEFAULT_TEXT :: BG.ByteString
sDL_HINT_GDK_TEXTINPUT_DEFAULT_TEXT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x47
    , 0x44
    , 0x4B
    , 0x5F
    , 0x54
    , 0x45
    , 0x58
    , 0x54
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    , 0x5F
    , 0x44
    , 0x45
    , 0x46
    , 0x41
    , 0x55
    , 0x4C
    , 0x54
    , 0x5F
    , 0x54
    , 0x45
    , 0x58
    , 0x54
    ]

-- | This variable sets the description of the TextInput window on GDK platforms.
--
--     This hint is available only if SDL_GDK_TEXTINPUT defined.
--
--     This hint should be set before calling SDL_StartTextInput()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_GDK_TEXTINPUT_DESCRIPTION@, literal @\"SDL_GDK_TEXTINPUT_DESCRIPTION\"@, defined at @SDL3\/SDL_hints.h 1025:9@
sDL_HINT_GDK_TEXTINPUT_DESCRIPTION :: BG.ByteString
sDL_HINT_GDK_TEXTINPUT_DESCRIPTION =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x47
    , 0x44
    , 0x4B
    , 0x5F
    , 0x54
    , 0x45
    , 0x58
    , 0x54
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    , 0x5F
    , 0x44
    , 0x45
    , 0x53
    , 0x43
    , 0x52
    , 0x49
    , 0x50
    , 0x54
    , 0x49
    , 0x4F
    , 0x4E
    ]

-- | This variable sets the maximum input length of the TextInput window on GDK platforms.
--
--     The value must be a stringified integer, for example \"10\" to allow for up to 10 characters of text input.
--
--     This hint is available only if SDL_GDK_TEXTINPUT defined.
--
--     This hint should be set before calling SDL_StartTextInput()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_GDK_TEXTINPUT_MAX_LENGTH@, literal @\"SDL_GDK_TEXTINPUT_MAX_LENGTH\"@, defined at @SDL3\/SDL_hints.h 1040:9@
sDL_HINT_GDK_TEXTINPUT_MAX_LENGTH :: BG.ByteString
sDL_HINT_GDK_TEXTINPUT_MAX_LENGTH =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x47
    , 0x44
    , 0x4B
    , 0x5F
    , 0x54
    , 0x45
    , 0x58
    , 0x54
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    , 0x5F
    , 0x4D
    , 0x41
    , 0x58
    , 0x5F
    , 0x4C
    , 0x45
    , 0x4E
    , 0x47
    , 0x54
    , 0x48
    ]

-- | This variable sets the input scope of the TextInput window on GDK platforms.
--
--     Set this hint to change the XGameUiTextEntryInputScope value that will be passed to the window creation function. The value must be a stringified integer, for example \"0\" for XGameUiTextEntryInputScope::Default.
--
--     This hint is available only if SDL_GDK_TEXTINPUT defined.
--
--     This hint should be set before calling SDL_StartTextInput()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_GDK_TEXTINPUT_SCOPE@, literal @\"SDL_GDK_TEXTINPUT_SCOPE\"@, defined at @SDL3\/SDL_hints.h 1056:9@
sDL_HINT_GDK_TEXTINPUT_SCOPE :: BG.ByteString
sDL_HINT_GDK_TEXTINPUT_SCOPE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x47
    , 0x44
    , 0x4B
    , 0x5F
    , 0x54
    , 0x45
    , 0x58
    , 0x54
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    , 0x5F
    , 0x53
    , 0x43
    , 0x4F
    , 0x50
    , 0x45
    ]

-- | This variable sets the title of the TextInput window on GDK platforms.
--
--     This hint is available only if SDL_GDK_TEXTINPUT defined.
--
--     This hint should be set before calling SDL_StartTextInput()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_GDK_TEXTINPUT_TITLE@, literal @\"SDL_GDK_TEXTINPUT_TITLE\"@, defined at @SDL3\/SDL_hints.h 1067:9@
sDL_HINT_GDK_TEXTINPUT_TITLE :: BG.ByteString
sDL_HINT_GDK_TEXTINPUT_TITLE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x47
    , 0x44
    , 0x4B
    , 0x5F
    , 0x54
    , 0x45
    , 0x58
    , 0x54
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    , 0x5F
    , 0x54
    , 0x49
    , 0x54
    , 0x4C
    , 0x45
    ]

-- | A variable to control whether HIDAPI uses libusb for device access.
--
--     By default libusb will only be used for a few devices that require direct USB access, and this can be controlled with SDL_HINT_HIDAPI_LIBUSB_WHITELIST.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI will not use libusb for device access.
--
--     * \"1\": HIDAPI will use libusb for device access if available. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_HIDAPI_LIBUSB@, literal @\"SDL_HIDAPI_LIBUSB\"@, defined at @SDL3\/SDL_hints.h 1085:9@
sDL_HINT_HIDAPI_LIBUSB :: BG.ByteString
sDL_HINT_HIDAPI_LIBUSB =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x4C
    , 0x49
    , 0x42
    , 0x55
    , 0x53
    , 0x42
    ]

-- | A variable to control whether HIDAPI uses libusb for GameCube adapters.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI will not use libusb for GameCube adapters.
--
--     * \"1\": HIDAPI will use libusb for GameCube adapters if available. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_HIDAPI_LIBUSB_GAMECUBE@, literal @\"SDL_HIDAPI_LIBUSB_GAMECUBE\"@, defined at @SDL3\/SDL_hints.h 1100:9@
sDL_HINT_HIDAPI_LIBUSB_GAMECUBE :: BG.ByteString
sDL_HINT_HIDAPI_LIBUSB_GAMECUBE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x4C
    , 0x49
    , 0x42
    , 0x55
    , 0x53
    , 0x42
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x43
    , 0x55
    , 0x42
    , 0x45
    ]

-- | A variable to control whether HIDAPI uses libusb only for whitelisted devices.
--
--     By default libusb will only be used for a few devices that require direct USB access.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI will use libusb for all device access.
--
--     * \"1\": HIDAPI will use libusb only for whitelisted devices. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_HIDAPI_LIBUSB_WHITELIST@, literal @\"SDL_HIDAPI_LIBUSB_WHITELIST\"@, defined at @SDL3\/SDL_hints.h 1118:9@
sDL_HINT_HIDAPI_LIBUSB_WHITELIST :: BG.ByteString
sDL_HINT_HIDAPI_LIBUSB_WHITELIST =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x4C
    , 0x49
    , 0x42
    , 0x55
    , 0x53
    , 0x42
    , 0x5F
    , 0x57
    , 0x48
    , 0x49
    , 0x54
    , 0x45
    , 0x4C
    , 0x49
    , 0x53
    , 0x54
    ]

-- | A variable to control whether HIDAPI uses udev for device detection.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI will poll for device changes.
--
--     * \"1\": HIDAPI will use udev for device detection. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_HIDAPI_UDEV@, literal @\"SDL_HIDAPI_UDEV\"@, defined at @SDL3\/SDL_hints.h 1132:9@
sDL_HINT_HIDAPI_UDEV :: BG.ByteString
sDL_HINT_HIDAPI_UDEV =
  BG.pack [0x53, 0x44, 0x4C, 0x5F, 0x48, 0x49, 0x44, 0x41, 0x50, 0x49, 0x5F, 0x55, 0x44, 0x45, 0x56]

-- | A variable that specifies a GPU backend to use.
--
--     By default, SDL will try all available GPU backends in a reasonable order until it finds one that can work, but this hint allows the app or user to force a specific target, such as \"direct3d12\" if, say, your hardware supports Vulkan but you want to try using D3D12 instead.
--
--     This hint should be set before any GPU functions are called.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_GPU_DRIVER@, literal @\"SDL_GPU_DRIVER\"@, defined at @SDL3\/SDL_hints.h 1146:9@
sDL_HINT_GPU_DRIVER :: BG.ByteString
sDL_HINT_GPU_DRIVER =
  BG.pack [0x53, 0x44, 0x4C, 0x5F, 0x47, 0x50, 0x55, 0x5F, 0x44, 0x52, 0x49, 0x56, 0x45, 0x52]

-- | A variable to control whether SDL_hid_enumerate() enumerates all HID devices or only controllers.
--
--     The variable can be set to the following values:
--
--     * \"0\": SDL_hid_enumerate() will enumerate all HID devices.
--
--     * \"1\": SDL_hid_enumerate() will only enumerate controllers. (default)
--
--     By default SDL will only enumerate controllers, to reduce risk of hanging or crashing on devices with bad drivers and avoiding macOS keyboard capture permission prompts.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS@, literal @\"SDL_HIDAPI_ENUMERATE_ONLY_CONTROLLERS\"@, defined at @SDL3\/SDL_hints.h 1165:9@
sDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS :: BG.ByteString
sDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x45
    , 0x4E
    , 0x55
    , 0x4D
    , 0x45
    , 0x52
    , 0x41
    , 0x54
    , 0x45
    , 0x5F
    , 0x4F
    , 0x4E
    , 0x4C
    , 0x59
    , 0x5F
    , 0x43
    , 0x4F
    , 0x4E
    , 0x54
    , 0x52
    , 0x4F
    , 0x4C
    , 0x4C
    , 0x45
    , 0x52
    , 0x53
    ]

-- | A variable containing a list of devices to ignore in SDL_hid_enumerate().
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     For example, to ignore the Shanwan DS3 controller and any Valve controller, you might use the string \"0x2563\/0x0523,0x28de\/0x0000\"
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_HIDAPI_IGNORE_DEVICES@, literal @\"SDL_HIDAPI_IGNORE_DEVICES\"@, defined at @SDL3\/SDL_hints.h 1182:9@
sDL_HINT_HIDAPI_IGNORE_DEVICES :: BG.ByteString
sDL_HINT_HIDAPI_IGNORE_DEVICES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x49
    , 0x47
    , 0x4E
    , 0x4F
    , 0x52
    , 0x45
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    ]

-- | A variable describing what IME UI elements the application can display.
--
--     By default IME UI is handled using native components by the OS where possible, however this can interfere with or not be visible when exclusive fullscreen mode is used.
--
--     The variable can be set to a comma separated list containing the following items:
--
--     * \"none\" or \"0\": The application can\'t render any IME elements, and native UI should be used. (default)
--
--     * \"composition\": The application handles SDL_EVENT_TEXT_EDITING events and can render the composition text.
--
--     * \"candidates\": The application handles SDL_EVENT_TEXT_EDITING_CANDIDATES and can render the candidate list.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_IME_IMPLEMENTED_UI@, literal @\"SDL_IME_IMPLEMENTED_UI\"@, defined at @SDL3\/SDL_hints.h 1205:9@
sDL_HINT_IME_IMPLEMENTED_UI :: BG.ByteString
sDL_HINT_IME_IMPLEMENTED_UI =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x49
    , 0x4D
    , 0x45
    , 0x5F
    , 0x49
    , 0x4D
    , 0x50
    , 0x4C
    , 0x45
    , 0x4D
    , 0x45
    , 0x4E
    , 0x54
    , 0x45
    , 0x44
    , 0x5F
    , 0x55
    , 0x49
    ]

-- | A variable controlling whether the home indicator bar on iPhone X and later should be hidden.
--
--     The variable can be set to the following values:
--
--     * \"0\": The indicator bar is not hidden. (default for windowed applications)
--
--     * \"1\": The indicator bar is hidden and is shown when the screen is touched (useful for movie playback applications).
--
--     * \"2\": The indicator bar is dim and the first swipe makes it visible and the second swipe performs the \"home\" action. (default for fullscreen applications)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_IOS_HIDE_HOME_INDICATOR@, literal @\"SDL_IOS_HIDE_HOME_INDICATOR\"@, defined at @SDL3\/SDL_hints.h 1224:9@
sDL_HINT_IOS_HIDE_HOME_INDICATOR :: BG.ByteString
sDL_HINT_IOS_HIDE_HOME_INDICATOR =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x49
    , 0x4F
    , 0x53
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x45
    , 0x5F
    , 0x48
    , 0x4F
    , 0x4D
    , 0x45
    , 0x5F
    , 0x49
    , 0x4E
    , 0x44
    , 0x49
    , 0x43
    , 0x41
    , 0x54
    , 0x4F
    , 0x52
    ]

-- | A variable that lets you enable joystick (and gamecontroller) events even when your app is in the background.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable joystick & gamecontroller input events when the application is in the background. (default)
--
--     * \"1\": Enable joystick & gamecontroller input events when the application is in the background.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS@, literal @\"SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS\"@, defined at @SDL3\/SDL_hints.h 1241:9@
sDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS :: BG.ByteString
sDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x41
    , 0x4C
    , 0x4C
    , 0x4F
    , 0x57
    , 0x5F
    , 0x42
    , 0x41
    , 0x43
    , 0x4B
    , 0x47
    , 0x52
    , 0x4F
    , 0x55
    , 0x4E
    , 0x44
    , 0x5F
    , 0x45
    , 0x56
    , 0x45
    , 0x4E
    , 0x54
    , 0x53
    ]

-- | A variable containing a list of arcade stick style controllers.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_ARCADESTICK_DEVICES@, literal @\"SDL_JOYSTICK_ARCADESTICK_DEVICES\"@, defined at @SDL3\/SDL_hints.h 1258:9@
sDL_HINT_JOYSTICK_ARCADESTICK_DEVICES :: BG.ByteString
sDL_HINT_JOYSTICK_ARCADESTICK_DEVICES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x41
    , 0x52
    , 0x43
    , 0x41
    , 0x44
    , 0x45
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    ]

-- | A variable containing a list of devices that are not arcade stick style controllers.
--
--     This will override SDL_HINT_JOYSTICK_ARCADESTICK_DEVICES and the built in device list.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED@, literal @\"SDL_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED\"@, defined at @SDL3\/SDL_hints.h 1279:9@
sDL_HINT_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED :: BG.ByteString
sDL_HINT_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x41
    , 0x52
    , 0x43
    , 0x41
    , 0x44
    , 0x45
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    , 0x5F
    , 0x45
    , 0x58
    , 0x43
    , 0x4C
    , 0x55
    , 0x44
    , 0x45
    , 0x44
    ]

-- | A variable containing a list of devices that should not be considered joysticks.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_BLACKLIST_DEVICES@, literal @\"SDL_JOYSTICK_BLACKLIST_DEVICES\"@, defined at @SDL3\/SDL_hints.h 1297:9@
sDL_HINT_JOYSTICK_BLACKLIST_DEVICES :: BG.ByteString
sDL_HINT_JOYSTICK_BLACKLIST_DEVICES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x42
    , 0x4C
    , 0x41
    , 0x43
    , 0x4B
    , 0x4C
    , 0x49
    , 0x53
    , 0x54
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    ]

-- | A variable containing a list of devices that should be considered joysticks.
--
--     This will override SDL_HINT_JOYSTICK_BLACKLIST_DEVICES and the built in device list.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED@, literal @\"SDL_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED\"@, defined at @SDL3\/SDL_hints.h 1318:9@
sDL_HINT_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED :: BG.ByteString
sDL_HINT_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x42
    , 0x4C
    , 0x41
    , 0x43
    , 0x4B
    , 0x4C
    , 0x49
    , 0x53
    , 0x54
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    , 0x5F
    , 0x45
    , 0x58
    , 0x43
    , 0x4C
    , 0x55
    , 0x44
    , 0x45
    , 0x44
    ]

-- | A variable containing a comma separated list of devices to open as joysticks.
--
--     This variable is currently only used by the Linux joystick driver.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_DEVICE@, literal @\"SDL_JOYSTICK_DEVICE\"@, defined at @SDL3\/SDL_hints.h 1328:9@
sDL_HINT_JOYSTICK_DEVICE :: BG.ByteString
sDL_HINT_JOYSTICK_DEVICE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    ]

-- | A variable controlling whether enhanced reports should be used for controllers when using the HIDAPI driver.
--
--     Enhanced reports allow rumble and effects on Bluetooth PlayStation controllers and gyro on Nintendo Switch controllers, but break Windows DirectInput for other applications that don\'t use SDL.
--
--     Once enhanced reports are enabled, they can\'t be disabled on PlayStation controllers without power cycling the controller.
--
--     The variable can be set to the following values:
--
--     * \"0\": enhanced reports are not enabled.
--
--     * \"1\": enhanced reports are enabled. (default)
--
--     * \"auto\": enhanced features are advertised to the application, but SDL doesn\'t change the controller report mode unless the application uses them.
--
--     This hint can be enabled anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_ENHANCED_REPORTS@, literal @\"SDL_JOYSTICK_ENHANCED_REPORTS\"@, defined at @SDL3\/SDL_hints.h 1353:9@
sDL_HINT_JOYSTICK_ENHANCED_REPORTS :: BG.ByteString
sDL_HINT_JOYSTICK_ENHANCED_REPORTS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x45
    , 0x4E
    , 0x48
    , 0x41
    , 0x4E
    , 0x43
    , 0x45
    , 0x44
    , 0x5F
    , 0x52
    , 0x45
    , 0x50
    , 0x4F
    , 0x52
    , 0x54
    , 0x53
    ]

-- | [C declaration]: @macro SDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES@, literal @\"SDL_JOYSTICK_FLIGHTSTICK_DEVICES\"@, defined at @SDL3\/SDL_hints.h 1370:9@
sDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES :: BG.ByteString
sDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x46
    , 0x4C
    , 0x49
    , 0x47
    , 0x48
    , 0x54
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    ]

-- | A variable containing a list of devices that are not flightstick style controllers.
--
--     This will override SDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES and the built in device list.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED@, literal @\"SDL_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED\"@, defined at @SDL3\/SDL_hints.h 1391:9@
sDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED :: BG.ByteString
sDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x46
    , 0x4C
    , 0x49
    , 0x47
    , 0x48
    , 0x54
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    , 0x5F
    , 0x45
    , 0x58
    , 0x43
    , 0x4C
    , 0x55
    , 0x44
    , 0x45
    , 0x44
    ]

-- | A variable controlling whether GameInput should be used for controller handling on Windows.
--
--     The variable can be set to the following values:
--
--     * \"0\": GameInput is not used.
--
--     * \"1\": GameInput is used.
--
--     The default is \"1\" on GDK platforms, and \"0\" otherwise.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_GAMEINPUT@, literal @\"SDL_JOYSTICK_GAMEINPUT\"@, defined at @SDL3\/SDL_hints.h 1408:9@
sDL_HINT_JOYSTICK_GAMEINPUT :: BG.ByteString
sDL_HINT_JOYSTICK_GAMEINPUT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    ]

-- | A variable containing a list of devices known to have a GameCube form factor.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_GAMECUBE_DEVICES@, literal @\"SDL_JOYSTICK_GAMECUBE_DEVICES\"@, defined at @SDL3\/SDL_hints.h 1426:9@
sDL_HINT_JOYSTICK_GAMECUBE_DEVICES :: BG.ByteString
sDL_HINT_JOYSTICK_GAMECUBE_DEVICES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x43
    , 0x55
    , 0x42
    , 0x45
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    ]

-- | A variable containing a list of devices known not to have a GameCube form factor.
--
--     This will override SDL_HINT_JOYSTICK_GAMECUBE_DEVICES and the built in device list.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED@, literal @\"SDL_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED\"@, defined at @SDL3\/SDL_hints.h 1447:9@
sDL_HINT_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED :: BG.ByteString
sDL_HINT_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x43
    , 0x55
    , 0x42
    , 0x45
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    , 0x5F
    , 0x45
    , 0x58
    , 0x43
    , 0x4C
    , 0x55
    , 0x44
    , 0x45
    , 0x44
    ]

-- | A variable controlling whether the HIDAPI joystick drivers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI drivers are not used.
--
--     * \"1\": HIDAPI drivers are used. (default)
--
--     This variable is the default for all drivers, but can be overridden by the hints for specific drivers below.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI@, literal @\"SDL_JOYSTICK_HIDAPI\"@, defined at @SDL3\/SDL_hints.h 1464:9@
sDL_HINT_JOYSTICK_HIDAPI :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    ]

-- | A variable controlling whether Nintendo Switch Joy-Con controllers will be combined into a single Pro-like controller when using the HIDAPI driver.
--
--     The variable can be set to the following values:
--
--     * \"0\": Left and right Joy-Con controllers will not be combined and each will be a mini-gamepad.
--
--     * \"1\": Left and right Joy-Con controllers will be combined into a single controller. (default)
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS@, literal @\"SDL_JOYSTICK_HIDAPI_COMBINE_JOY_CONS\"@, defined at @SDL3\/SDL_hints.h 1481:9@
sDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x43
    , 0x4F
    , 0x4D
    , 0x42
    , 0x49
    , 0x4E
    , 0x45
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x5F
    , 0x43
    , 0x4F
    , 0x4E
    , 0x53
    ]

-- | A variable controlling whether the HIDAPI driver for Nintendo GameCube controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE@, literal @\"SDL_JOYSTICK_HIDAPI_GAMECUBE\"@, defined at @SDL3\/SDL_hints.h 1498:9@
sDL_HINT_JOYSTICK_HIDAPI_GAMECUBE :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_GAMECUBE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x43
    , 0x55
    , 0x42
    , 0x45
    ]

-- | A variable controlling whether rumble is used to implement the GameCube controller\'s 3 rumble modes, Stop(0), Rumble(1), and StopHard(2).
--
--     This is useful for applications that need full compatibility for things like ADSR envelopes. - Stop is implemented by setting low_frequency_rumble to 0 and high_frequency_rumble >0 - Rumble is both at any arbitrary value - StopHard is implemented by setting both low_frequency_rumble and high_frequency_rumble to 0
--
--     The variable can be set to the following values:
--
--     * \"0\": Normal rumble behavior is behavior is used. (default)
--
--     * \"1\": Proper GameCube controller rumble behavior is used.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE@, literal @\"SDL_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE\"@, defined at @SDL3\/SDL_hints.h 1519:9@
sDL_HINT_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x43
    , 0x55
    , 0x42
    , 0x45
    , 0x5F
    , 0x52
    , 0x55
    , 0x4D
    , 0x42
    , 0x4C
    , 0x45
    , 0x5F
    , 0x42
    , 0x52
    , 0x41
    , 0x4B
    , 0x45
    ]

-- | A variable controlling whether the HIDAPI driver for Nintendo Switch Joy-Cons should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS@, literal @\"SDL_JOYSTICK_HIDAPI_JOY_CONS\"@, defined at @SDL3\/SDL_hints.h 1536:9@
sDL_HINT_JOYSTICK_HIDAPI_JOY_CONS :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_JOY_CONS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x5F
    , 0x43
    , 0x4F
    , 0x4E
    , 0x53
    ]

-- | A variable controlling whether the Home button LED should be turned on when a Nintendo Switch Joy-Con controller is opened.
--
--     The variable can be set to the following values:
--
--     * \"0\": home button LED is turned off
--
--     * \"1\": home button LED is turned on
--
--     By default the Home button LED state is not changed. This hint can also be set to a floating point value between 0.0 and 1.0 which controls the brightness of the Home button LED.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED@, literal @\"SDL_JOYSTICK_HIDAPI_JOYCON_HOME_LED\"@, defined at @SDL3\/SDL_hints.h 1555:9@
sDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x43
    , 0x4F
    , 0x4E
    , 0x5F
    , 0x48
    , 0x4F
    , 0x4D
    , 0x45
    , 0x5F
    , 0x4C
    , 0x45
    , 0x44
    ]

-- | A variable controlling whether the HIDAPI driver for Amazon Luna controllers connected via Bluetooth should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_LUNA@, literal @\"SDL_JOYSTICK_HIDAPI_LUNA\"@, defined at @SDL3\/SDL_hints.h 1572:9@
sDL_HINT_JOYSTICK_HIDAPI_LUNA :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_LUNA =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x4C
    , 0x55
    , 0x4E
    , 0x41
    ]

-- | A variable controlling whether the HIDAPI driver for Nintendo Online classic controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC@, literal @\"SDL_JOYSTICK_HIDAPI_NINTENDO_CLASSIC\"@, defined at @SDL3\/SDL_hints.h 1589:9@
sDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x4E
    , 0x49
    , 0x4E
    , 0x54
    , 0x45
    , 0x4E
    , 0x44
    , 0x4F
    , 0x5F
    , 0x43
    , 0x4C
    , 0x41
    , 0x53
    , 0x53
    , 0x49
    , 0x43
    ]

-- | A variable controlling whether the HIDAPI driver for PS3 controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI on macOS, and \"0\" on other platforms.
--
--     For official Sony driver (sixaxis.sys) use SDL_HINT_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER. See [https:\/\/github.com\/ViGEm\/DsHidMini](https://github.com/ViGEm/DsHidMini) for an alternative driver on Windows.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_PS3@, literal @\"SDL_JOYSTICK_HIDAPI_PS3\"@, defined at @SDL3\/SDL_hints.h 1611:9@
sDL_HINT_JOYSTICK_HIDAPI_PS3 :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_PS3 =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x50
    , 0x53
    , 0x33
    ]

-- | A variable controlling whether the Sony driver (sixaxis.sys) for PS3 controllers (Sixaxis\/DualShock 3) should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": Sony driver (sixaxis.sys) is not used.
--
--     * \"1\": Sony driver (sixaxis.sys) is used.
--
--     The default value is 0.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER@, literal @\"SDL_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER\"@, defined at @SDL3\/SDL_hints.h 1628:9@
sDL_HINT_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x50
    , 0x53
    , 0x33
    , 0x5F
    , 0x53
    , 0x49
    , 0x58
    , 0x41
    , 0x58
    , 0x49
    , 0x53
    , 0x5F
    , 0x44
    , 0x52
    , 0x49
    , 0x56
    , 0x45
    , 0x52
    ]

-- | A variable controlling whether the HIDAPI driver for PS4 controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_PS4@, literal @\"SDL_JOYSTICK_HIDAPI_PS4\"@, defined at @SDL3\/SDL_hints.h 1645:9@
sDL_HINT_JOYSTICK_HIDAPI_PS4 :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_PS4 =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x50
    , 0x53
    , 0x34
    ]

-- | A variable controlling the update rate of the PS4 controller over Bluetooth when using the HIDAPI driver.
--
--     This defaults to 4 ms, to match the behavior over USB, and to be more friendly to other Bluetooth devices and older Bluetooth hardware on the computer. It can be set to \"1\" (1000Hz), \"2\" (500Hz) and \"4\" (250Hz)
--
--     This hint can be set anytime, but only takes effect when extended input reports are enabled.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL@, literal @\"SDL_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL\"@, defined at @SDL3\/SDL_hints.h 1660:9@
sDL_HINT_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x50
    , 0x53
    , 0x34
    , 0x5F
    , 0x52
    , 0x45
    , 0x50
    , 0x4F
    , 0x52
    , 0x54
    , 0x5F
    , 0x49
    , 0x4E
    , 0x54
    , 0x45
    , 0x52
    , 0x56
    , 0x41
    , 0x4C
    ]

-- | A variable controlling whether the HIDAPI driver for PS5 controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_PS5@, literal @\"SDL_JOYSTICK_HIDAPI_PS5\"@, defined at @SDL3\/SDL_hints.h 1677:9@
sDL_HINT_JOYSTICK_HIDAPI_PS5 :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_PS5 =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x50
    , 0x53
    , 0x35
    ]

-- | A variable controlling whether the player LEDs should be lit to indicate which player is associated with a PS5 controller.
--
--     The variable can be set to the following values:
--
--     * \"0\": player LEDs are not enabled.
--
--     * \"1\": player LEDs are enabled. (default)
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED@, literal @\"SDL_JOYSTICK_HIDAPI_PS5_PLAYER_LED\"@, defined at @SDL3\/SDL_hints.h 1690:9@
sDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x50
    , 0x53
    , 0x35
    , 0x5F
    , 0x50
    , 0x4C
    , 0x41
    , 0x59
    , 0x45
    , 0x52
    , 0x5F
    , 0x4C
    , 0x45
    , 0x44
    ]

-- | A variable controlling whether the HIDAPI driver for NVIDIA SHIELD controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_SHIELD@, literal @\"SDL_JOYSTICK_HIDAPI_SHIELD\"@, defined at @SDL3\/SDL_hints.h 1707:9@
sDL_HINT_JOYSTICK_HIDAPI_SHIELD :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_SHIELD =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x53
    , 0x48
    , 0x49
    , 0x45
    , 0x4C
    , 0x44
    ]

-- | A variable controlling whether the HIDAPI driver for Google Stadia controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_STADIA@, literal @\"SDL_JOYSTICK_HIDAPI_STADIA\"@, defined at @SDL3\/SDL_hints.h 1722:9@
sDL_HINT_JOYSTICK_HIDAPI_STADIA :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_STADIA =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x53
    , 0x54
    , 0x41
    , 0x44
    , 0x49
    , 0x41
    ]

-- | A variable controlling whether the HIDAPI driver for Bluetooth Steam Controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used. (default)
--
--     * \"1\": HIDAPI driver is used for Steam Controllers, which requires Bluetooth access and may prompt the user for permission on iOS and Android.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_STEAM@, literal @\"SDL_JOYSTICK_HIDAPI_STEAM\"@, defined at @SDL3\/SDL_hints.h 1739:9@
sDL_HINT_JOYSTICK_HIDAPI_STEAM :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_STEAM =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x53
    , 0x54
    , 0x45
    , 0x41
    , 0x4D
    ]

-- | A variable controlling whether the Steam button LED should be turned on when a Steam controller is opened.
--
--     The variable can be set to the following values:
--
--     * \"0\": Steam button LED is turned off.
--
--     * \"1\": Steam button LED is turned on.
--
--     By default the Steam button LED state is not changed. This hint can also be set to a floating point value between 0.0 and 1.0 which controls the brightness of the Steam button LED.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_STEAM_HOME_LED@, literal @\"SDL_JOYSTICK_HIDAPI_STEAM_HOME_LED\"@, defined at @SDL3\/SDL_hints.h 1758:9@
sDL_HINT_JOYSTICK_HIDAPI_STEAM_HOME_LED :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_STEAM_HOME_LED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x53
    , 0x54
    , 0x45
    , 0x41
    , 0x4D
    , 0x5F
    , 0x48
    , 0x4F
    , 0x4D
    , 0x45
    , 0x5F
    , 0x4C
    , 0x45
    , 0x44
    ]

-- | A variable controlling whether the HIDAPI driver for the Steam Deck builtin controller should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_STEAMDECK@, literal @\"SDL_JOYSTICK_HIDAPI_STEAMDECK\"@, defined at @SDL3\/SDL_hints.h 1775:9@
sDL_HINT_JOYSTICK_HIDAPI_STEAMDECK :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_STEAMDECK =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x53
    , 0x54
    , 0x45
    , 0x41
    , 0x4D
    , 0x44
    , 0x45
    , 0x43
    , 0x4B
    ]

-- | A variable controlling whether the HIDAPI driver for HORI licensed Steam controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_STEAM_HORI@, literal @\"SDL_JOYSTICK_HIDAPI_STEAM_HORI\"@, defined at @SDL3\/SDL_hints.h 1792:9@
sDL_HINT_JOYSTICK_HIDAPI_STEAM_HORI :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_STEAM_HORI =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x53
    , 0x54
    , 0x45
    , 0x41
    , 0x4D
    , 0x5F
    , 0x48
    , 0x4F
    , 0x52
    , 0x49
    ]

-- | A variable controlling whether the HIDAPI driver for some Logitech wheels should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_LG4FF@, literal @\"SDL_JOYSTICK_HIDAPI_LG4FF\"@, defined at @SDL3\/SDL_hints.h 1809:9@
sDL_HINT_JOYSTICK_HIDAPI_LG4FF :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_LG4FF =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x4C
    , 0x47
    , 0x34
    , 0x46
    , 0x46
    ]

-- | A variable controlling whether the HIDAPI driver for 8BitDo controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_8BITDO@, literal @\"SDL_JOYSTICK_HIDAPI_8BITDO\"@, defined at @SDL3\/SDL_hints.h 1826:9@
sDL_HINT_JOYSTICK_HIDAPI_8BITDO :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_8BITDO =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x38
    , 0x42
    , 0x49
    , 0x54
    , 0x44
    , 0x4F
    ]

-- | A variable controlling whether the HIDAPI driver for SInput controllers should be used.
--
--     More info - [https:\/\/github.com\/HandHeldLegend\/SInput-HID](https://github.com/HandHeldLegend/SInput-HID)
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_SINPUT@, literal @\"SDL_JOYSTICK_HIDAPI_SINPUT\"@, defined at @SDL3\/SDL_hints.h 1845:9@
sDL_HINT_JOYSTICK_HIDAPI_SINPUT :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_SINPUT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x53
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    ]

-- | A variable controlling whether the HIDAPI driver for ZUIKI controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_ZUIKI@, literal @\"SDL_JOYSTICK_HIDAPI_ZUIKI\"@, defined at @SDL3\/SDL_hints.h 1862:9@
sDL_HINT_JOYSTICK_HIDAPI_ZUIKI :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_ZUIKI =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x5A
    , 0x55
    , 0x49
    , 0x4B
    , 0x49
    ]

-- | A variable controlling whether the HIDAPI driver for Flydigi controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_FLYDIGI@, literal @\"SDL_JOYSTICK_HIDAPI_FLYDIGI\"@, defined at @SDL3\/SDL_hints.h 1879:9@
sDL_HINT_JOYSTICK_HIDAPI_FLYDIGI :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_FLYDIGI =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x46
    , 0x4C
    , 0x59
    , 0x44
    , 0x49
    , 0x47
    , 0x49
    ]

-- | A variable controlling whether the HIDAPI driver for Nintendo Switch controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_SWITCH@, literal @\"SDL_JOYSTICK_HIDAPI_SWITCH\"@, defined at @SDL3\/SDL_hints.h 1896:9@
sDL_HINT_JOYSTICK_HIDAPI_SWITCH :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_SWITCH =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x53
    , 0x57
    , 0x49
    , 0x54
    , 0x43
    , 0x48
    ]

-- | A variable controlling whether the Home button LED should be turned on when a Nintendo Switch Pro controller is opened.
--
--     The variable can be set to the following values:
--
--     * \"0\": Home button LED is turned off.
--
--     * \"1\": Home button LED is turned on.
--
--     By default the Home button LED state is not changed. This hint can also be set to a floating point value between 0.0 and 1.0 which controls the brightness of the Home button LED.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED@, literal @\"SDL_JOYSTICK_HIDAPI_SWITCH_HOME_LED\"@, defined at @SDL3\/SDL_hints.h 1915:9@
sDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x53
    , 0x57
    , 0x49
    , 0x54
    , 0x43
    , 0x48
    , 0x5F
    , 0x48
    , 0x4F
    , 0x4D
    , 0x45
    , 0x5F
    , 0x4C
    , 0x45
    , 0x44
    ]

-- | A variable controlling whether the player LEDs should be lit to indicate which player is associated with a Nintendo Switch controller.
--
--     The variable can be set to the following values:
--
--     * \"0\": Player LEDs are not enabled.
--
--     * \"1\": Player LEDs are enabled. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED@, literal @\"SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED\"@, defined at @SDL3\/SDL_hints.h 1930:9@
sDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x53
    , 0x57
    , 0x49
    , 0x54
    , 0x43
    , 0x48
    , 0x5F
    , 0x50
    , 0x4C
    , 0x41
    , 0x59
    , 0x45
    , 0x52
    , 0x5F
    , 0x4C
    , 0x45
    , 0x44
    ]

-- | A variable controlling whether the HIDAPI driver for Nintendo Switch 2 controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_SWITCH2@, literal @\"SDL_JOYSTICK_HIDAPI_SWITCH2\"@, defined at @SDL3\/SDL_hints.h 1947:9@
sDL_HINT_JOYSTICK_HIDAPI_SWITCH2 :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_SWITCH2 =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x53
    , 0x57
    , 0x49
    , 0x54
    , 0x43
    , 0x48
    , 0x32
    ]

-- | A variable controlling whether Nintendo Switch Joy-Con controllers will be in vertical mode when using the HIDAPI driver.
--
--     The variable can be set to the following values:
--
--     * \"0\": Left and right Joy-Con controllers will not be in vertical mode. (default)
--
--     * \"1\": Left and right Joy-Con controllers will be in vertical mode.
--
--     This hint should be set before opening a Joy-Con controller.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS@, literal @\"SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS\"@, defined at @SDL3\/SDL_hints.h 1963:9@
sDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x56
    , 0x45
    , 0x52
    , 0x54
    , 0x49
    , 0x43
    , 0x41
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x5F
    , 0x43
    , 0x4F
    , 0x4E
    , 0x53
    ]

-- | A variable controlling whether the HIDAPI driver for Nintendo Wii and Wii U controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     This driver doesn\'t work with the dolphinbar, so the default is false for now.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_WII@, literal @\"SDL_JOYSTICK_HIDAPI_WII\"@, defined at @SDL3\/SDL_hints.h 1981:9@
sDL_HINT_JOYSTICK_HIDAPI_WII :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_WII =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x57
    , 0x49
    , 0x49
    ]

-- | A variable controlling whether the player LEDs should be lit to indicate which player is associated with a Wii controller.
--
--     The variable can be set to the following values:
--
--     * \"0\": Player LEDs are not enabled.
--
--     * \"1\": Player LEDs are enabled. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED@, literal @\"SDL_JOYSTICK_HIDAPI_WII_PLAYER_LED\"@, defined at @SDL3\/SDL_hints.h 1996:9@
sDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x57
    , 0x49
    , 0x49
    , 0x5F
    , 0x50
    , 0x4C
    , 0x41
    , 0x59
    , 0x45
    , 0x52
    , 0x5F
    , 0x4C
    , 0x45
    , 0x44
    ]

-- | A variable controlling whether the HIDAPI driver for XBox controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is \"0\" on Windows, otherwise the value of SDL_HINT_JOYSTICK_HIDAPI
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_XBOX@, literal @\"SDL_JOYSTICK_HIDAPI_XBOX\"@, defined at @SDL3\/SDL_hints.h 2014:9@
sDL_HINT_JOYSTICK_HIDAPI_XBOX :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_XBOX =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x58
    , 0x42
    , 0x4F
    , 0x58
    ]

-- | A variable controlling whether the HIDAPI driver for XBox 360 controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI_XBOX
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_XBOX_360@, literal @\"SDL_JOYSTICK_HIDAPI_XBOX_360\"@, defined at @SDL3\/SDL_hints.h 2031:9@
sDL_HINT_JOYSTICK_HIDAPI_XBOX_360 :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_XBOX_360 =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x58
    , 0x42
    , 0x4F
    , 0x58
    , 0x5F
    , 0x33
    , 0x36
    , 0x30
    ]

-- | A variable controlling whether the player LEDs should be lit to indicate which player is associated with an Xbox 360 controller.
--
--     The variable can be set to the following values:
--
--     * \"0\": Player LEDs are not enabled.
--
--     * \"1\": Player LEDs are enabled. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED@, literal @\"SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED\"@, defined at @SDL3\/SDL_hints.h 2046:9@
sDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x58
    , 0x42
    , 0x4F
    , 0x58
    , 0x5F
    , 0x33
    , 0x36
    , 0x30
    , 0x5F
    , 0x50
    , 0x4C
    , 0x41
    , 0x59
    , 0x45
    , 0x52
    , 0x5F
    , 0x4C
    , 0x45
    , 0x44
    ]

-- | A variable controlling whether the HIDAPI driver for XBox 360 wireless controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI_XBOX_360
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS@, literal @\"SDL_JOYSTICK_HIDAPI_XBOX_360_WIRELESS\"@, defined at @SDL3\/SDL_hints.h 2063:9@
sDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x58
    , 0x42
    , 0x4F
    , 0x58
    , 0x5F
    , 0x33
    , 0x36
    , 0x30
    , 0x5F
    , 0x57
    , 0x49
    , 0x52
    , 0x45
    , 0x4C
    , 0x45
    , 0x53
    , 0x53
    ]

-- | A variable controlling whether the HIDAPI driver for XBox One controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI_XBOX.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE@, literal @\"SDL_JOYSTICK_HIDAPI_XBOX_ONE\"@, defined at @SDL3\/SDL_hints.h 2080:9@
sDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x58
    , 0x42
    , 0x4F
    , 0x58
    , 0x5F
    , 0x4F
    , 0x4E
    , 0x45
    ]

-- | A variable controlling whether the Home button LED should be turned on when an Xbox One controller is opened.
--
--     The variable can be set to the following values:
--
--     * \"0\": Home button LED is turned off.
--
--     * \"1\": Home button LED is turned on.
--
--     By default the Home button LED state is not changed. This hint can also be set to a floating point value between 0.0 and 1.0 which controls the brightness of the Home button LED. The default brightness is 0.4.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED@, literal @\"SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED\"@, defined at @SDL3\/SDL_hints.h 2099:9@
sDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x58
    , 0x42
    , 0x4F
    , 0x58
    , 0x5F
    , 0x4F
    , 0x4E
    , 0x45
    , 0x5F
    , 0x48
    , 0x4F
    , 0x4D
    , 0x45
    , 0x5F
    , 0x4C
    , 0x45
    , 0x44
    ]

-- | A variable controlling whether the new HIDAPI driver for wired Xbox One (GIP) controllers should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": HIDAPI driver is not used.
--
--     * \"1\": HIDAPI driver is used.
--
--     The default is the value of SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_GIP@, literal @\"SDL_JOYSTICK_HIDAPI_GIP\"@, defined at @SDL3\/SDL_hints.h 2116:9@
sDL_HINT_JOYSTICK_HIDAPI_GIP :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_GIP =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x47
    , 0x49
    , 0x50
    ]

-- | A variable controlling whether the new HIDAPI driver for wired Xbox One (GIP) controllers should reset the controller if it can\'t get the metadata from the controller.
--
--     The variable can be set to the following values:
--
--     * \"0\": Assume this is a generic controller.
--
--     * \"1\": Reset the controller to get metadata.
--
--     By default the controller is not reset.
--
--     This hint should be set before initializing joysticks and gamepads.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HIDAPI_GIP_RESET_FOR_METADATA@, literal @\"SDL_JOYSTICK_HIDAPI_GIP_RESET_FOR_METADATA\"@, defined at @SDL3\/SDL_hints.h 2134:9@
sDL_HINT_JOYSTICK_HIDAPI_GIP_RESET_FOR_METADATA :: BG.ByteString
sDL_HINT_JOYSTICK_HIDAPI_GIP_RESET_FOR_METADATA =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x41
    , 0x50
    , 0x49
    , 0x5F
    , 0x47
    , 0x49
    , 0x50
    , 0x5F
    , 0x52
    , 0x45
    , 0x53
    , 0x45
    , 0x54
    , 0x5F
    , 0x46
    , 0x4F
    , 0x52
    , 0x5F
    , 0x4D
    , 0x45
    , 0x54
    , 0x41
    , 0x44
    , 0x41
    , 0x54
    , 0x41
    ]

-- | A variable controlling whether IOKit should be used for controller handling.
--
--     The variable can be set to the following values:
--
--     * \"0\": IOKit is not used.
--
--     * \"1\": IOKit is used. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_IOKIT@, literal @\"SDL_JOYSTICK_IOKIT\"@, defined at @SDL3\/SDL_hints.h 2149:9@
sDL_HINT_JOYSTICK_IOKIT :: BG.ByteString
sDL_HINT_JOYSTICK_IOKIT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x49
    , 0x4F
    , 0x4B
    , 0x49
    , 0x54
    ]

-- | A variable controlling whether to use the classic \/dev\/input\/js* joystick interface or the newer \/dev\/input\/event* joystick interface on Linux.
--
--     The variable can be set to the following values:
--
--     * \"0\": Use \/dev\/input\/event* (default)
--
--     * \"1\": Use \/dev\/input\/js*
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_LINUX_CLASSIC@, literal @\"SDL_JOYSTICK_LINUX_CLASSIC\"@, defined at @SDL3\/SDL_hints.h 2164:9@
sDL_HINT_JOYSTICK_LINUX_CLASSIC :: BG.ByteString
sDL_HINT_JOYSTICK_LINUX_CLASSIC =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x4C
    , 0x49
    , 0x4E
    , 0x55
    , 0x58
    , 0x5F
    , 0x43
    , 0x4C
    , 0x41
    , 0x53
    , 0x53
    , 0x49
    , 0x43
    ]

-- | A variable controlling whether joysticks on Linux adhere to their HID-defined deadzones or return unfiltered values.
--
--     The variable can be set to the following values:
--
--     * \"0\": Return unfiltered joystick axis values. (default)
--
--     * \"1\": Return axis values with deadzones taken into account.
--
--     This hint should be set before a controller is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_LINUX_DEADZONES@, literal @\"SDL_JOYSTICK_LINUX_DEADZONES\"@, defined at @SDL3\/SDL_hints.h 2179:9@
sDL_HINT_JOYSTICK_LINUX_DEADZONES :: BG.ByteString
sDL_HINT_JOYSTICK_LINUX_DEADZONES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x4C
    , 0x49
    , 0x4E
    , 0x55
    , 0x58
    , 0x5F
    , 0x44
    , 0x45
    , 0x41
    , 0x44
    , 0x5A
    , 0x4F
    , 0x4E
    , 0x45
    , 0x53
    ]

-- | A variable controlling whether joysticks on Linux will always treat \'hat\' axis inputs (ABS_HAT0X - ABS_HAT3Y) as 8-way digital hats without checking whether they may be analog.
--
--     The variable can be set to the following values:
--
--     * \"0\": Only map hat axis inputs to digital hat outputs if the input axes appear to actually be digital. (default)
--
--     * \"1\": Always handle the input axes numbered ABS_HAT0X to ABS_HAT3Y as digital hats.
--
--     This hint should be set before a controller is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_LINUX_DIGITAL_HATS@, literal @\"SDL_JOYSTICK_LINUX_DIGITAL_HATS\"@, defined at @SDL3\/SDL_hints.h 2197:9@
sDL_HINT_JOYSTICK_LINUX_DIGITAL_HATS :: BG.ByteString
sDL_HINT_JOYSTICK_LINUX_DIGITAL_HATS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x4C
    , 0x49
    , 0x4E
    , 0x55
    , 0x58
    , 0x5F
    , 0x44
    , 0x49
    , 0x47
    , 0x49
    , 0x54
    , 0x41
    , 0x4C
    , 0x5F
    , 0x48
    , 0x41
    , 0x54
    , 0x53
    ]

-- | A variable controlling whether digital hats on Linux will apply deadzones to their underlying input axes or use unfiltered values.
--
--     The variable can be set to the following values:
--
--     * \"0\": Return digital hat values based on unfiltered input axis values.
--
--     * \"1\": Return digital hat values with deadzones on the input axes taken into account. (default)
--
--     This hint should be set before a controller is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_LINUX_HAT_DEADZONES@, literal @\"SDL_JOYSTICK_LINUX_HAT_DEADZONES\"@, defined at @SDL3\/SDL_hints.h 2213:9@
sDL_HINT_JOYSTICK_LINUX_HAT_DEADZONES :: BG.ByteString
sDL_HINT_JOYSTICK_LINUX_HAT_DEADZONES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x4C
    , 0x49
    , 0x4E
    , 0x55
    , 0x58
    , 0x5F
    , 0x48
    , 0x41
    , 0x54
    , 0x5F
    , 0x44
    , 0x45
    , 0x41
    , 0x44
    , 0x5A
    , 0x4F
    , 0x4E
    , 0x45
    , 0x53
    ]

-- | A variable controlling whether GCController should be used for controller handling.
--
--     The variable can be set to the following values:
--
--     * \"0\": GCController is not used.
--
--     * \"1\": GCController is used. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_MFI@, literal @\"SDL_JOYSTICK_MFI\"@, defined at @SDL3\/SDL_hints.h 2228:9@
sDL_HINT_JOYSTICK_MFI :: BG.ByteString
sDL_HINT_JOYSTICK_MFI =
  BG.pack
    [0x53, 0x44, 0x4C, 0x5F, 0x4A, 0x4F, 0x59, 0x53, 0x54, 0x49, 0x43, 0x4B, 0x5F, 0x4D, 0x46, 0x49]

-- | A variable controlling whether the RAWINPUT joystick drivers should be used for better handling XInput-capable devices.
--
--     The variable can be set to the following values:
--
--     * \"0\": RAWINPUT drivers are not used. (default)
--
--     * \"1\": RAWINPUT drivers are used.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_RAWINPUT@, literal @\"SDL_JOYSTICK_RAWINPUT\"@, defined at @SDL3\/SDL_hints.h 2243:9@
sDL_HINT_JOYSTICK_RAWINPUT :: BG.ByteString
sDL_HINT_JOYSTICK_RAWINPUT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x52
    , 0x41
    , 0x57
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    ]

-- | A variable controlling whether the RAWINPUT driver should pull correlated data from XInput.
--
--     The variable can be set to the following values:
--
--     * \"0\": RAWINPUT driver will only use data from raw input APIs.
--
--     * \"1\": RAWINPUT driver will also pull data from XInput and Windows.Gaming.Input, providing better trigger axes, guide button presses, and rumble support for Xbox controllers. (default)
--
--     This hint should be set before a gamepad is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT@, literal @\"SDL_JOYSTICK_RAWINPUT_CORRELATE_XINPUT\"@, defined at @SDL3\/SDL_hints.h 2260:9@
sDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT :: BG.ByteString
sDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x52
    , 0x41
    , 0x57
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    , 0x5F
    , 0x43
    , 0x4F
    , 0x52
    , 0x52
    , 0x45
    , 0x4C
    , 0x41
    , 0x54
    , 0x45
    , 0x5F
    , 0x58
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    ]

-- | A variable controlling whether the ROG Chakram mice should show up as joysticks.
--
--     The variable can be set to the following values:
--
--     * \"0\": ROG Chakram mice do not show up as joysticks. (default)
--
--     * \"1\": ROG Chakram mice show up as joysticks.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_ROG_CHAKRAM@, literal @\"SDL_JOYSTICK_ROG_CHAKRAM\"@, defined at @SDL3\/SDL_hints.h 2275:9@
sDL_HINT_JOYSTICK_ROG_CHAKRAM :: BG.ByteString
sDL_HINT_JOYSTICK_ROG_CHAKRAM =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x52
    , 0x4F
    , 0x47
    , 0x5F
    , 0x43
    , 0x48
    , 0x41
    , 0x4B
    , 0x52
    , 0x41
    , 0x4D
    ]

-- | A variable controlling whether a separate thread should be used for handling joystick detection and raw input messages on Windows.
--
--     The variable can be set to the following values:
--
--     * \"0\": A separate thread is not used.
--
--     * \"1\": A separate thread is used for handling raw input messages. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_THREAD@, literal @\"SDL_JOYSTICK_THREAD\"@, defined at @SDL3\/SDL_hints.h 2290:9@
sDL_HINT_JOYSTICK_THREAD :: BG.ByteString
sDL_HINT_JOYSTICK_THREAD =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x54
    , 0x48
    , 0x52
    , 0x45
    , 0x41
    , 0x44
    ]

-- | A variable containing a list of throttle style controllers.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_THROTTLE_DEVICES@, literal @\"SDL_JOYSTICK_THROTTLE_DEVICES\"@, defined at @SDL3\/SDL_hints.h 2307:9@
sDL_HINT_JOYSTICK_THROTTLE_DEVICES :: BG.ByteString
sDL_HINT_JOYSTICK_THROTTLE_DEVICES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x54
    , 0x48
    , 0x52
    , 0x4F
    , 0x54
    , 0x54
    , 0x4C
    , 0x45
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    ]

-- | A variable containing a list of devices that are not throttle style controllers.
--
--     This will override SDL_HINT_JOYSTICK_THROTTLE_DEVICES and the built in device list.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_THROTTLE_DEVICES_EXCLUDED@, literal @\"SDL_JOYSTICK_THROTTLE_DEVICES_EXCLUDED\"@, defined at @SDL3\/SDL_hints.h 2328:9@
sDL_HINT_JOYSTICK_THROTTLE_DEVICES_EXCLUDED :: BG.ByteString
sDL_HINT_JOYSTICK_THROTTLE_DEVICES_EXCLUDED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x54
    , 0x48
    , 0x52
    , 0x4F
    , 0x54
    , 0x54
    , 0x4C
    , 0x45
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    , 0x5F
    , 0x45
    , 0x58
    , 0x43
    , 0x4C
    , 0x55
    , 0x44
    , 0x45
    , 0x44
    ]

-- | A variable controlling whether Windows.Gaming.Input should be used for controller handling.
--
--     The variable can be set to the following values:
--
--     * \"0\": WGI is not used. (default)
--
--     * \"1\": WGI is used.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_WGI@, literal @\"SDL_JOYSTICK_WGI\"@, defined at @SDL3\/SDL_hints.h 2343:9@
sDL_HINT_JOYSTICK_WGI :: BG.ByteString
sDL_HINT_JOYSTICK_WGI =
  BG.pack
    [0x53, 0x44, 0x4C, 0x5F, 0x4A, 0x4F, 0x59, 0x53, 0x54, 0x49, 0x43, 0x4B, 0x5F, 0x57, 0x47, 0x49]

-- | A variable containing a list of wheel style controllers.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_WHEEL_DEVICES@, literal @\"SDL_JOYSTICK_WHEEL_DEVICES\"@, defined at @SDL3\/SDL_hints.h 2360:9@
sDL_HINT_JOYSTICK_WHEEL_DEVICES :: BG.ByteString
sDL_HINT_JOYSTICK_WHEEL_DEVICES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x57
    , 0x48
    , 0x45
    , 0x45
    , 0x4C
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    ]

-- | A variable containing a list of devices that are not wheel style controllers.
--
--     This will override SDL_HINT_JOYSTICK_WHEEL_DEVICES and the built in device list.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_WHEEL_DEVICES_EXCLUDED@, literal @\"SDL_JOYSTICK_WHEEL_DEVICES_EXCLUDED\"@, defined at @SDL3\/SDL_hints.h 2381:9@
sDL_HINT_JOYSTICK_WHEEL_DEVICES_EXCLUDED :: BG.ByteString
sDL_HINT_JOYSTICK_WHEEL_DEVICES_EXCLUDED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x57
    , 0x48
    , 0x45
    , 0x45
    , 0x4C
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    , 0x5F
    , 0x45
    , 0x58
    , 0x43
    , 0x4C
    , 0x55
    , 0x44
    , 0x45
    , 0x44
    ]

-- | A variable containing a list of devices known to have all axes centered at zero.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint should be set before a controller is opened.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_ZERO_CENTERED_DEVICES@, literal @\"SDL_JOYSTICK_ZERO_CENTERED_DEVICES\"@, defined at @SDL3\/SDL_hints.h 2399:9@
sDL_HINT_JOYSTICK_ZERO_CENTERED_DEVICES :: BG.ByteString
sDL_HINT_JOYSTICK_ZERO_CENTERED_DEVICES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x5A
    , 0x45
    , 0x52
    , 0x4F
    , 0x5F
    , 0x43
    , 0x45
    , 0x4E
    , 0x54
    , 0x45
    , 0x52
    , 0x45
    , 0x44
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x53
    ]

-- | A variable containing a list of devices and their desired number of haptic (force feedback) enabled axis.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form plus the number of desired axes, e.g.
--
--     @0xAAAA\/0xBBBB\/1,0xCCCC\/0xDDDD\/3@
--
--     This hint supports a \"wildcard\" device that will set the number of haptic axes on all initialized haptic devices which were not defined explicitly in this hint.
--
--     @0xFFFF\/0xFFFF\/1@
--
--     This hint should be set before a controller is opened. The number of haptic axes won\'t exceed the number of real axes found on the device.
--
--     @since 3.2.5
--
--     [C declaration]: @macro SDL_HINT_JOYSTICK_HAPTIC_AXES@, literal @\"SDL_JOYSTICK_HAPTIC_AXES\"@, defined at @SDL3\/SDL_hints.h 2421:9@
sDL_HINT_JOYSTICK_HAPTIC_AXES :: BG.ByteString
sDL_HINT_JOYSTICK_HAPTIC_AXES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x48
    , 0x41
    , 0x50
    , 0x54
    , 0x49
    , 0x43
    , 0x5F
    , 0x41
    , 0x58
    , 0x45
    , 0x53
    ]

-- | A variable that controls keycode representation in keyboard events.
--
--     This variable is a comma separated set of options for translating keycodes in events:
--
--     * \"none\": Keycode options are cleared, this overrides other options.
--
--     * \"hide_numpad\": The numpad keysyms will be translated into their non-numpad versions based on the current NumLock state. For example, SDLK_KP_4 would become SDLK_4 if SDL_KMOD_NUM is set in the event modifiers, and SDLK_LEFT if it is unset.
--
--     * \"french_numbers\": The number row on French keyboards is inverted, so pressing the 1 key would yield the keycode SDLK_1, or \'1\', instead of SDLK_AMPERSAND, or \'&\'
--
--     * \"latin_letters\": For keyboards using non-Latin letters, such as Russian or Thai, the letter keys generate keycodes as though it had an English QWERTY layout. e.g. pressing the key associated with SDL_SCANCODE_A on a Russian keyboard would yield \'a\' instead of a Cyrillic letter.
--
--     The default value for this hint is \"french_numbers,latin_letters\"
--
--     Some platforms like Emscripten only provide modified keycodes and the options are not used.
--
--     These options do not affect the return value of SDL_GetKeyFromScancode() or SDL_GetScancodeFromKey(), they just apply to the keycode included in key events.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_KEYCODE_OPTIONS@, literal @\"SDL_KEYCODE_OPTIONS\"@, defined at @SDL3\/SDL_hints.h 2455:9@
sDL_HINT_KEYCODE_OPTIONS :: BG.ByteString
sDL_HINT_KEYCODE_OPTIONS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4B
    , 0x45
    , 0x59
    , 0x43
    , 0x4F
    , 0x44
    , 0x45
    , 0x5F
    , 0x4F
    , 0x50
    , 0x54
    , 0x49
    , 0x4F
    , 0x4E
    , 0x53
    ]

-- | A variable that controls what KMSDRM device to use.
--
--     SDL might open something like \"\/dev\/dri\/cardNN\" to access KMSDRM functionality, where \"NN\" is a device index number. SDL makes a guess at the best index to use (usually zero), but the app or user can set this hint to a number between 0 and 99 to force selection.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_KMSDRM_DEVICE_INDEX@, literal @\"SDL_KMSDRM_DEVICE_INDEX\"@, defined at @SDL3\/SDL_hints.h 2469:9@
sDL_HINT_KMSDRM_DEVICE_INDEX :: BG.ByteString
sDL_HINT_KMSDRM_DEVICE_INDEX =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4B
    , 0x4D
    , 0x53
    , 0x44
    , 0x52
    , 0x4D
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    , 0x5F
    , 0x49
    , 0x4E
    , 0x44
    , 0x45
    , 0x58
    ]

-- | A variable that controls whether SDL requires DRM master access in order to initialize the KMSDRM video backend.
--
--     The DRM subsystem has a concept of a \"DRM master\" which is a DRM client that has the ability to set planes, set cursor, etc. When SDL is DRM master, it can draw to the screen using the SDL rendering APIs. Without DRM master, SDL is still able to process input and query attributes of attached displays, but it cannot change display state or draw to the screen directly.
--
--     In some cases, it can be useful to have the KMSDRM backend even if it cannot be used for rendering. An app may want to use SDL for input processing while using another rendering API (such as an MMAL overlay on Raspberry Pi) or using its own code to render to DRM overlays that SDL doesn\'t support.
--
--     The variable can be set to the following values:
--
--     * \"0\": SDL will allow usage of the KMSDRM backend without DRM master.
--
--     * \"1\": SDL Will require DRM master to use the KMSDRM backend. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_KMSDRM_REQUIRE_DRM_MASTER@, literal @\"SDL_KMSDRM_REQUIRE_DRM_MASTER\"@, defined at @SDL3\/SDL_hints.h 2497:9@
sDL_HINT_KMSDRM_REQUIRE_DRM_MASTER :: BG.ByteString
sDL_HINT_KMSDRM_REQUIRE_DRM_MASTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4B
    , 0x4D
    , 0x53
    , 0x44
    , 0x52
    , 0x4D
    , 0x5F
    , 0x52
    , 0x45
    , 0x51
    , 0x55
    , 0x49
    , 0x52
    , 0x45
    , 0x5F
    , 0x44
    , 0x52
    , 0x4D
    , 0x5F
    , 0x4D
    , 0x41
    , 0x53
    , 0x54
    , 0x45
    , 0x52
    ]

-- | A variable that controls whether KMSDRM will use \"atomic\" functionality.
--
--     The KMSDRM backend can use atomic commits, if both DRM_CLIENT_CAP_ATOMIC and DRM_CLIENT_CAP_UNIVERSAL_PLANES is supported by the system. As of SDL 3.4.0, it will favor this functionality, but in case this doesn\'t work well on a given system or other surprises, this hint can be used to disable it.
--
--     This hint can not enable the functionality if it isn\'t available.
--
--     The variable can be set to the following values:
--
--     * \"0\": SDL will not use the KMSDRM \"atomic\" functionality.
--
--     * \"1\": SDL will allow usage of the KMSDRM \"atomic\" functionality. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_KMSDRM_ATOMIC@, literal @\"SDL_KMSDRM_ATOMIC\"@, defined at @SDL3\/SDL_hints.h 2518:9@
sDL_HINT_KMSDRM_ATOMIC :: BG.ByteString
sDL_HINT_KMSDRM_ATOMIC =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4B
    , 0x4D
    , 0x53
    , 0x44
    , 0x52
    , 0x4D
    , 0x5F
    , 0x41
    , 0x54
    , 0x4F
    , 0x4D
    , 0x49
    , 0x43
    ]

-- | A variable controlling the default SDL log levels.
--
--     This variable is a comma separated set of category=level tokens that define the default logging levels for SDL applications.
--
--     The category can be a numeric category, one of \"app\", \"error\", \"assert\", \"system\", \"audio\", \"video\", \"render\", \"input\", \"test\", or @*@ for any unspecified category.
--
--     The level can be a numeric level, one of \"verbose\", \"debug\", \"info\", \"warn\", \"error\", \"critical\", or \"quiet\" to disable that category.
--
--     You can omit the category if you want to set the logging level for all categories.
--
--     If this hint isn\'t set, the default log levels are equivalent to:
--
--     @app=info,assert=warn,test=verbose,*=error@
--
--     If the @DEBUG_INVOCATION@ environment variable is set to \"1\", the default log levels are equivalent to:
--
--     @assert=warn,test=verbose,*=debug@
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_LOGGING@, literal @\"SDL_LOGGING\"@, defined at @SDL3\/SDL_hints.h 2549:9@
sDL_HINT_LOGGING :: BG.ByteString
sDL_HINT_LOGGING =
  BG.pack [0x53, 0x44, 0x4C, 0x5F, 0x4C, 0x4F, 0x47, 0x47, 0x49, 0x4E, 0x47]

-- | A variable controlling whether to force the application to become the foreground process when launched on macOS.
--
--     The variable can be set to the following values:
--
--     * \"0\": The application is brought to the foreground when launched. (default)
--
--     * \"1\": The application may remain in the background when launched.
--
--     This hint needs to be set before SDL_Init().
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MAC_BACKGROUND_APP@, literal @\"SDL_MAC_BACKGROUND_APP\"@, defined at @SDL3\/SDL_hints.h 2565:9@
sDL_HINT_MAC_BACKGROUND_APP :: BG.ByteString
sDL_HINT_MAC_BACKGROUND_APP =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x41
    , 0x43
    , 0x5F
    , 0x42
    , 0x41
    , 0x43
    , 0x4B
    , 0x47
    , 0x52
    , 0x4F
    , 0x55
    , 0x4E
    , 0x44
    , 0x5F
    , 0x41
    , 0x50
    , 0x50
    ]

-- | A variable that determines whether Ctrl+Click should generate a right-click event on macOS.
--
--     The variable can be set to the following values:
--
--     * \"0\": Ctrl+Click does not generate a right mouse button click event. (default)
--
--     * \"1\": Ctrl+Click generated a right mouse button click event.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK@, literal @\"SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK\"@, defined at @SDL3\/SDL_hints.h 2581:9@
sDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK :: BG.ByteString
sDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x41
    , 0x43
    , 0x5F
    , 0x43
    , 0x54
    , 0x52
    , 0x4C
    , 0x5F
    , 0x43
    , 0x4C
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x45
    , 0x4D
    , 0x55
    , 0x4C
    , 0x41
    , 0x54
    , 0x45
    , 0x5F
    , 0x52
    , 0x49
    , 0x47
    , 0x48
    , 0x54
    , 0x5F
    , 0x43
    , 0x4C
    , 0x49
    , 0x43
    , 0x4B
    ]

-- | A variable controlling whether dispatching OpenGL context updates should block the dispatching thread until the main thread finishes processing on macOS.
--
--     The variable can be set to the following values:
--
--     * \"0\": Dispatching OpenGL context updates will block the dispatching thread until the main thread finishes processing. (default)
--
--     * \"1\": Dispatching OpenGL context updates will allow the dispatching thread to continue execution.
--
--     Generally you want the default, but if you have OpenGL code in a background thread on a Mac, and the main thread hangs because it\'s waiting for that background thread, but that background thread is also hanging because it\'s waiting for the main thread to do an update, this might fix your issue.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MAC_OPENGL_ASYNC_DISPATCH@, literal @\"SDL_MAC_OPENGL_ASYNC_DISPATCH\"@, defined at @SDL3\/SDL_hints.h 2604:9@
sDL_HINT_MAC_OPENGL_ASYNC_DISPATCH :: BG.ByteString
sDL_HINT_MAC_OPENGL_ASYNC_DISPATCH =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x41
    , 0x43
    , 0x5F
    , 0x4F
    , 0x50
    , 0x45
    , 0x4E
    , 0x47
    , 0x4C
    , 0x5F
    , 0x41
    , 0x53
    , 0x59
    , 0x4E
    , 0x43
    , 0x5F
    , 0x44
    , 0x49
    , 0x53
    , 0x50
    , 0x41
    , 0x54
    , 0x43
    , 0x48
    ]

-- | A variable controlling whether the Option key on macOS should be remapped to act as the Alt key.
--
--     The variable can be set to the following values:
--
--     * \"none\": The Option key is not remapped to Alt. (default)
--
--     * \"only_left\": Only the left Option key is remapped to Alt.
--
--     * \"only_right\": Only the right Option key is remapped to Alt.
--
--     * \"both\": Both Option keys are remapped to Alt.
--
--     This will prevent the triggering of key compositions that rely on the Option key, but will still send the Alt modifier for keyboard events. In the case that both Alt and Option are pressed, the Option key will be ignored. This is particularly useful for applications like terminal emulators and graphical user interfaces (GUIs) that rely on Alt key functionality for shortcuts or navigation. This does not apply to SDL_GetKeyFromScancode and only has an effect if IME is enabled.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MAC_OPTION_AS_ALT@, literal @\"SDL_MAC_OPTION_AS_ALT\"@, defined at @SDL3\/SDL_hints.h 2629:9@
sDL_HINT_MAC_OPTION_AS_ALT :: BG.ByteString
sDL_HINT_MAC_OPTION_AS_ALT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x41
    , 0x43
    , 0x5F
    , 0x4F
    , 0x50
    , 0x54
    , 0x49
    , 0x4F
    , 0x4E
    , 0x5F
    , 0x41
    , 0x53
    , 0x5F
    , 0x41
    , 0x4C
    , 0x54
    ]

-- | A variable controlling whether SDL_EVENT_MOUSE_WHEEL event values will have momentum on macOS.
--
--     The variable can be set to the following values:
--
--     * \"0\": The mouse wheel events will have no momentum. (default)
--
--     * \"1\": The mouse wheel events will have momentum.
--
--     This hint needs to be set before SDL_Init().
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MAC_SCROLL_MOMENTUM@, literal @\"SDL_MAC_SCROLL_MOMENTUM\"@, defined at @SDL3\/SDL_hints.h 2644:9@
sDL_HINT_MAC_SCROLL_MOMENTUM :: BG.ByteString
sDL_HINT_MAC_SCROLL_MOMENTUM =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x41
    , 0x43
    , 0x5F
    , 0x53
    , 0x43
    , 0x52
    , 0x4F
    , 0x4C
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x4D
    , 0x45
    , 0x4E
    , 0x54
    , 0x55
    , 0x4D
    ]

-- | A variable controlling whether holding down a key will repeat the pressed key or open the accents menu on macOS.
--
--     The variable can be set to the following values:
--
--     * \"0\": Holding a key will repeat the pressed key.
--
--     * \"1\": Holding a key will open the accents menu for that key. (default)
--
--     This hint needs to be set before SDL_Init().
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_MAC_PRESS_AND_HOLD@, literal @\"SDL_MAC_PRESS_AND_HOLD\"@, defined at @SDL3\/SDL_hints.h 2659:9@
sDL_HINT_MAC_PRESS_AND_HOLD :: BG.ByteString
sDL_HINT_MAC_PRESS_AND_HOLD =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x41
    , 0x43
    , 0x5F
    , 0x50
    , 0x52
    , 0x45
    , 0x53
    , 0x53
    , 0x5F
    , 0x41
    , 0x4E
    , 0x44
    , 0x5F
    , 0x48
    , 0x4F
    , 0x4C
    , 0x44
    ]

-- | Request SDL_AppIterate() be called at a specific rate.
--
--     If this is set to a number, it represents Hz, so \"60\" means try to iterate 60 times per second. \"0\" means to iterate as fast as possible. Negative values are illegal, but reserved, in case they are useful in a future revision of SDL.
--
--     There are other strings that have special meaning. If set to \"waitevent\", SDL_AppIterate will not be called until new event(s) have arrived (and been processed by SDL_AppEvent). This can be useful for apps that are completely idle except in response to input.
--
--     On some platforms, or if you are using SDL_main instead of SDL_AppIterate, this hint is ignored. When the hint can be used, it is allowed to be changed at any time.
--
--     This defaults to 0, and specifying NULL for the hint\'s value will restore the default.
--
--     This doesn\'t have to be an integer value. For example, \"59.94\" won\'t be rounded to an integer rate; the digits after the decimal are actually respected.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MAIN_CALLBACK_RATE@, literal @\"SDL_MAIN_CALLBACK_RATE\"@, defined at @SDL3\/SDL_hints.h 2689:9@
sDL_HINT_MAIN_CALLBACK_RATE :: BG.ByteString
sDL_HINT_MAIN_CALLBACK_RATE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x41
    , 0x49
    , 0x4E
    , 0x5F
    , 0x43
    , 0x41
    , 0x4C
    , 0x4C
    , 0x42
    , 0x41
    , 0x43
    , 0x4B
    , 0x5F
    , 0x52
    , 0x41
    , 0x54
    , 0x45
    ]

-- | A variable controlling whether the mouse is captured while mouse buttons are pressed.
--
--     The variable can be set to the following values:
--
--     * \"0\": The mouse is not captured while mouse buttons are pressed.
--
--     * \"1\": The mouse is captured while mouse buttons are pressed.
--
--     By default the mouse is captured while mouse buttons are pressed so if the mouse is dragged outside the window, the application continues to receive mouse events until the button is released.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_AUTO_CAPTURE@, literal @\"SDL_MOUSE_AUTO_CAPTURE\"@, defined at @SDL3\/SDL_hints.h 2708:9@
sDL_HINT_MOUSE_AUTO_CAPTURE :: BG.ByteString
sDL_HINT_MOUSE_AUTO_CAPTURE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x41
    , 0x55
    , 0x54
    , 0x4F
    , 0x5F
    , 0x43
    , 0x41
    , 0x50
    , 0x54
    , 0x55
    , 0x52
    , 0x45
    ]

-- | A variable setting the double click radius, in pixels.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS@, literal @\"SDL_MOUSE_DOUBLE_CLICK_RADIUS\"@, defined at @SDL3\/SDL_hints.h 2717:9@
sDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS :: BG.ByteString
sDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x44
    , 0x4F
    , 0x55
    , 0x42
    , 0x4C
    , 0x45
    , 0x5F
    , 0x43
    , 0x4C
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x52
    , 0x41
    , 0x44
    , 0x49
    , 0x55
    , 0x53
    ]

-- | A variable setting the double click time, in milliseconds.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_DOUBLE_CLICK_TIME@, literal @\"SDL_MOUSE_DOUBLE_CLICK_TIME\"@, defined at @SDL3\/SDL_hints.h 2726:9@
sDL_HINT_MOUSE_DOUBLE_CLICK_TIME :: BG.ByteString
sDL_HINT_MOUSE_DOUBLE_CLICK_TIME =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x44
    , 0x4F
    , 0x55
    , 0x42
    , 0x4C
    , 0x45
    , 0x5F
    , 0x43
    , 0x4C
    , 0x49
    , 0x43
    , 0x4B
    , 0x5F
    , 0x54
    , 0x49
    , 0x4D
    , 0x45
    ]

-- | A variable setting which system cursor to use as the default cursor.
--
--     This should be an integer corresponding to the SDL_SystemCursor enum. The default value is zero (SDL_SYSTEM_CURSOR_DEFAULT).
--
--     This hint needs to be set before SDL_Init().
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_DEFAULT_SYSTEM_CURSOR@, literal @\"SDL_MOUSE_DEFAULT_SYSTEM_CURSOR\"@, defined at @SDL3\/SDL_hints.h 2738:9@
sDL_HINT_MOUSE_DEFAULT_SYSTEM_CURSOR :: BG.ByteString
sDL_HINT_MOUSE_DEFAULT_SYSTEM_CURSOR =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x44
    , 0x45
    , 0x46
    , 0x41
    , 0x55
    , 0x4C
    , 0x54
    , 0x5F
    , 0x53
    , 0x59
    , 0x53
    , 0x54
    , 0x45
    , 0x4D
    , 0x5F
    , 0x43
    , 0x55
    , 0x52
    , 0x53
    , 0x4F
    , 0x52
    ]

-- | A variable setting whether we should scale cursors by the current display scale.
--
--     The variable can be set to the following values:
--
--     * \"0\": Cursors will not change size based on the display content scale. (default)
--
--     * \"1\": Cursors will automatically match the display content scale (e.g. a 2x sized cursor will be used when the window is on a monitor with 200% scale). This is currently implemented on Windows and Wayland.
--
--     This hint needs to be set before creating cursors.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_DPI_SCALE_CURSORS@, literal @\"SDL_MOUSE_DPI_SCALE_CURSORS\"@, defined at @SDL3\/SDL_hints.h 2756:9@
sDL_HINT_MOUSE_DPI_SCALE_CURSORS :: BG.ByteString
sDL_HINT_MOUSE_DPI_SCALE_CURSORS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x44
    , 0x50
    , 0x49
    , 0x5F
    , 0x53
    , 0x43
    , 0x41
    , 0x4C
    , 0x45
    , 0x5F
    , 0x43
    , 0x55
    , 0x52
    , 0x53
    , 0x4F
    , 0x52
    , 0x53
    ]

-- | A variable controlling whether warping a hidden mouse cursor will activate relative mouse mode.
--
--     When this hint is set, the mouse cursor is hidden, and multiple warps to the window center occur within a short time period, SDL will emulate mouse warps using relative mouse mode. This can provide smoother and more reliable mouse motion for some older games, which continuously calculate the distance traveled by the mouse pointer and warp it back to the center of the window, rather than using relative mouse motion.
--
--     Note that relative mouse mode may have different mouse acceleration behavior than pointer warps.
--
--     If your application needs to repeatedly warp the hidden mouse cursor at a high-frequency for other purposes, it should disable this hint.
--
--     The variable can be set to the following values:
--
--     * \"0\": Attempts to warp the mouse will always be made.
--
--     * \"1\": Some mouse warps will be emulated by forcing relative mouse mode. (default)
--
--     If not set, this is automatically enabled unless an application uses relative mouse mode directly.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_EMULATE_WARP_WITH_RELATIVE@, literal @\"SDL_MOUSE_EMULATE_WARP_WITH_RELATIVE\"@, defined at @SDL3\/SDL_hints.h 2788:9@
sDL_HINT_MOUSE_EMULATE_WARP_WITH_RELATIVE :: BG.ByteString
sDL_HINT_MOUSE_EMULATE_WARP_WITH_RELATIVE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x45
    , 0x4D
    , 0x55
    , 0x4C
    , 0x41
    , 0x54
    , 0x45
    , 0x5F
    , 0x57
    , 0x41
    , 0x52
    , 0x50
    , 0x5F
    , 0x57
    , 0x49
    , 0x54
    , 0x48
    , 0x5F
    , 0x52
    , 0x45
    , 0x4C
    , 0x41
    , 0x54
    , 0x49
    , 0x56
    , 0x45
    ]

-- | Allow mouse click events when clicking to focus an SDL window.
--
--     The variable can be set to the following values:
--
--     * \"0\": Ignore mouse clicks that activate a window. (default)
--
--     * \"1\": Generate events for mouse clicks that activate a window.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH@, literal @\"SDL_MOUSE_FOCUS_CLICKTHROUGH\"@, defined at @SDL3\/SDL_hints.h 2802:9@
sDL_HINT_MOUSE_FOCUS_CLICKTHROUGH :: BG.ByteString
sDL_HINT_MOUSE_FOCUS_CLICKTHROUGH =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x46
    , 0x4F
    , 0x43
    , 0x55
    , 0x53
    , 0x5F
    , 0x43
    , 0x4C
    , 0x49
    , 0x43
    , 0x4B
    , 0x54
    , 0x48
    , 0x52
    , 0x4F
    , 0x55
    , 0x47
    , 0x48
    ]

-- | A variable setting the speed scale for mouse motion, in floating point, when the mouse is not in relative mode.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_NORMAL_SPEED_SCALE@, literal @\"SDL_MOUSE_NORMAL_SPEED_SCALE\"@, defined at @SDL3\/SDL_hints.h 2812:9@
sDL_HINT_MOUSE_NORMAL_SPEED_SCALE :: BG.ByteString
sDL_HINT_MOUSE_NORMAL_SPEED_SCALE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x4E
    , 0x4F
    , 0x52
    , 0x4D
    , 0x41
    , 0x4C
    , 0x5F
    , 0x53
    , 0x50
    , 0x45
    , 0x45
    , 0x44
    , 0x5F
    , 0x53
    , 0x43
    , 0x41
    , 0x4C
    , 0x45
    ]

-- | A variable controlling whether relative mouse mode constrains the mouse to the center of the window.
--
--     Constraining to the center of the window works better for FPS games and when the application is running over RDP. Constraining to the whole window works better for 2D games and increases the chance that the mouse will be in the correct position when using high DPI mice.
--
--     The variable can be set to the following values:
--
--     * \"0\": Relative mouse mode constrains the mouse to the window.
--
--     * \"1\": Relative mouse mode constrains the mouse to the center of the window. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_RELATIVE_MODE_CENTER@, literal @\"SDL_MOUSE_RELATIVE_MODE_CENTER\"@, defined at @SDL3\/SDL_hints.h 2833:9@
sDL_HINT_MOUSE_RELATIVE_MODE_CENTER :: BG.ByteString
sDL_HINT_MOUSE_RELATIVE_MODE_CENTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x52
    , 0x45
    , 0x4C
    , 0x41
    , 0x54
    , 0x49
    , 0x56
    , 0x45
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x44
    , 0x45
    , 0x5F
    , 0x43
    , 0x45
    , 0x4E
    , 0x54
    , 0x45
    , 0x52
    ]

-- | A variable setting the scale for mouse motion, in floating point, when the mouse is in relative mode.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE@, literal @\"SDL_MOUSE_RELATIVE_SPEED_SCALE\"@, defined at @SDL3\/SDL_hints.h 2843:9@
sDL_HINT_MOUSE_RELATIVE_SPEED_SCALE :: BG.ByteString
sDL_HINT_MOUSE_RELATIVE_SPEED_SCALE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x52
    , 0x45
    , 0x4C
    , 0x41
    , 0x54
    , 0x49
    , 0x56
    , 0x45
    , 0x5F
    , 0x53
    , 0x50
    , 0x45
    , 0x45
    , 0x44
    , 0x5F
    , 0x53
    , 0x43
    , 0x41
    , 0x4C
    , 0x45
    ]

-- | A variable controlling whether the system mouse acceleration curve is used for relative mouse motion.
--
--     The variable can be set to the following values:
--
--     * \"0\": Relative mouse motion will be unscaled. (default)
--
--     * \"1\": Relative mouse motion will be scaled using the system mouse acceleration curve.
--
--     If SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE is set, that will be applied after system speed scale.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE@, literal @\"SDL_MOUSE_RELATIVE_SYSTEM_SCALE\"@, defined at @SDL3\/SDL_hints.h 2862:9@
sDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE :: BG.ByteString
sDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x52
    , 0x45
    , 0x4C
    , 0x41
    , 0x54
    , 0x49
    , 0x56
    , 0x45
    , 0x5F
    , 0x53
    , 0x59
    , 0x53
    , 0x54
    , 0x45
    , 0x4D
    , 0x5F
    , 0x53
    , 0x43
    , 0x41
    , 0x4C
    , 0x45
    ]

-- | A variable controlling whether a motion event should be generated for mouse warping in relative mode.
--
--     The variable can be set to the following values:
--
--     * \"0\": Warping the mouse will not generate a motion event in relative mode
--
--     * \"1\": Warping the mouse will generate a motion event in relative mode
--
--     By default warping the mouse will not generate motion events in relative mode. This avoids the application having to filter out large relative motion due to warping.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_RELATIVE_WARP_MOTION@, literal @\"SDL_MOUSE_RELATIVE_WARP_MOTION\"@, defined at @SDL3\/SDL_hints.h 2881:9@
sDL_HINT_MOUSE_RELATIVE_WARP_MOTION :: BG.ByteString
sDL_HINT_MOUSE_RELATIVE_WARP_MOTION =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x52
    , 0x45
    , 0x4C
    , 0x41
    , 0x54
    , 0x49
    , 0x56
    , 0x45
    , 0x5F
    , 0x57
    , 0x41
    , 0x52
    , 0x50
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x54
    , 0x49
    , 0x4F
    , 0x4E
    ]

-- | A variable controlling whether the hardware cursor stays visible when relative mode is active.
--
--     This variable can be set to the following values:
--
--     * \"0\": The cursor will be hidden while relative mode is active (default)
--
--     * \"1\": The cursor will remain visible while relative mode is active
--
--     Note that for systems without raw hardware inputs, relative mode is implemented using warping, so the hardware cursor will visibly warp between frames if this is enabled on those systems.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_RELATIVE_CURSOR_VISIBLE@, literal @\"SDL_MOUSE_RELATIVE_CURSOR_VISIBLE\"@, defined at @SDL3\/SDL_hints.h 2900:9@
sDL_HINT_MOUSE_RELATIVE_CURSOR_VISIBLE :: BG.ByteString
sDL_HINT_MOUSE_RELATIVE_CURSOR_VISIBLE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x52
    , 0x45
    , 0x4C
    , 0x41
    , 0x54
    , 0x49
    , 0x56
    , 0x45
    , 0x5F
    , 0x43
    , 0x55
    , 0x52
    , 0x53
    , 0x4F
    , 0x52
    , 0x5F
    , 0x56
    , 0x49
    , 0x53
    , 0x49
    , 0x42
    , 0x4C
    , 0x45
    ]

-- | A variable controlling whether mouse events should generate synthetic touch events.
--
--     The variable can be set to the following values:
--
--     * \"0\": Mouse events will not generate touch events. (default for desktop platforms)
--
--     * \"1\": Mouse events will generate touch events. (default for mobile platforms, such as Android and iOS)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MOUSE_TOUCH_EVENTS@, literal @\"SDL_MOUSE_TOUCH_EVENTS\"@, defined at @SDL3\/SDL_hints.h 2917:9@
sDL_HINT_MOUSE_TOUCH_EVENTS :: BG.ByteString
sDL_HINT_MOUSE_TOUCH_EVENTS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x54
    , 0x4F
    , 0x55
    , 0x43
    , 0x48
    , 0x5F
    , 0x45
    , 0x56
    , 0x45
    , 0x4E
    , 0x54
    , 0x53
    ]

-- | A variable controlling whether the keyboard should be muted on the console.
--
--     Normally the keyboard is muted while SDL applications are running so that keyboard input doesn\'t show up as key strokes on the console. This hint allows you to turn that off for debugging purposes.
--
--     The variable can be set to the following values:
--
--     * \"0\": Allow keystrokes to go through to the console.
--
--     * \"1\": Mute keyboard input so it doesn\'t show up on the console. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_MUTE_CONSOLE_KEYBOARD@, literal @\"SDL_MUTE_CONSOLE_KEYBOARD\"@, defined at @SDL3\/SDL_hints.h 2935:9@
sDL_HINT_MUTE_CONSOLE_KEYBOARD :: BG.ByteString
sDL_HINT_MUTE_CONSOLE_KEYBOARD =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4D
    , 0x55
    , 0x54
    , 0x45
    , 0x5F
    , 0x43
    , 0x4F
    , 0x4E
    , 0x53
    , 0x4F
    , 0x4C
    , 0x45
    , 0x5F
    , 0x4B
    , 0x45
    , 0x59
    , 0x42
    , 0x4F
    , 0x41
    , 0x52
    , 0x44
    ]

-- | Tell SDL not to catch the SIGINT or SIGTERM signals on POSIX platforms.
--
--     The variable can be set to the following values:
--
--     * \"0\": SDL will install a SIGINT and SIGTERM handler, and when it catches a signal, convert it into an SDL_EVENT_QUIT event. (default)
--
--     * \"1\": SDL will not install a signal handler at all.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_NO_SIGNAL_HANDLERS@, literal @\"SDL_NO_SIGNAL_HANDLERS\"@, defined at @SDL3\/SDL_hints.h 2950:9@
sDL_HINT_NO_SIGNAL_HANDLERS :: BG.ByteString
sDL_HINT_NO_SIGNAL_HANDLERS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4E
    , 0x4F
    , 0x5F
    , 0x53
    , 0x49
    , 0x47
    , 0x4E
    , 0x41
    , 0x4C
    , 0x5F
    , 0x48
    , 0x41
    , 0x4E
    , 0x44
    , 0x4C
    , 0x45
    , 0x52
    , 0x53
    ]

-- | Specify the OpenGL library to load.
--
--     This hint should be set before creating an OpenGL window or creating an OpenGL context. If this hint isn\'t set, SDL will choose a reasonable default.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_OPENGL_LIBRARY@, literal @\"SDL_OPENGL_LIBRARY\"@, defined at @SDL3\/SDL_hints.h 2961:9@
sDL_HINT_OPENGL_LIBRARY :: BG.ByteString
sDL_HINT_OPENGL_LIBRARY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4F
    , 0x50
    , 0x45
    , 0x4E
    , 0x47
    , 0x4C
    , 0x5F
    , 0x4C
    , 0x49
    , 0x42
    , 0x52
    , 0x41
    , 0x52
    , 0x59
    ]

-- | Specify the EGL library to load.
--
--     This hint should be set before creating an OpenGL window or creating an OpenGL context. This hint is only considered if SDL is using EGL to manage OpenGL contexts. If this hint isn\'t set, SDL will choose a reasonable default.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_EGL_LIBRARY@, literal @\"SDL_EGL_LIBRARY\"@, defined at @SDL3\/SDL_hints.h 2973:9@
sDL_HINT_EGL_LIBRARY :: BG.ByteString
sDL_HINT_EGL_LIBRARY =
  BG.pack [0x53, 0x44, 0x4C, 0x5F, 0x45, 0x47, 0x4C, 0x5F, 0x4C, 0x49, 0x42, 0x52, 0x41, 0x52, 0x59]

-- | A variable controlling what driver to use for OpenGL ES contexts.
--
--     On some platforms, currently Windows and X11, OpenGL drivers may support creating contexts with an OpenGL ES profile. By default SDL uses these profiles, when available, otherwise it attempts to load an OpenGL ES library, e.g. that provided by the ANGLE project. This variable controls whether SDL follows this default behaviour or will always load an OpenGL ES library.
--
--     Circumstances where this is useful include - Testing an app with a particular OpenGL ES implementation, e.g ANGLE, or emulator, e.g. those from ARM, Imagination or Qualcomm. - Resolving OpenGL ES function addresses at link time by linking with the OpenGL ES library instead of querying them at run time with SDL_GL_GetProcAddress().
--
--     Caution: for an application to work with the default behaviour across different OpenGL drivers it must query the OpenGL ES function addresses at run time using SDL_GL_GetProcAddress().
--
--     This variable is ignored on most platforms because OpenGL ES is native or not supported.
--
--     The variable can be set to the following values:
--
--     * \"0\": Use ES profile of OpenGL, if available. (default)
--
--     * \"1\": Load OpenGL ES library using the default library names.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_OPENGL_ES_DRIVER@, literal @\"SDL_OPENGL_ES_DRIVER\"@, defined at @SDL3\/SDL_hints.h 3007:9@
sDL_HINT_OPENGL_ES_DRIVER :: BG.ByteString
sDL_HINT_OPENGL_ES_DRIVER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4F
    , 0x50
    , 0x45
    , 0x4E
    , 0x47
    , 0x4C
    , 0x5F
    , 0x45
    , 0x53
    , 0x5F
    , 0x44
    , 0x52
    , 0x49
    , 0x56
    , 0x45
    , 0x52
    ]

-- | A variable controlling whether to force an sRGB-capable OpenGL context.
--
--     At OpenGL context creation time, some platforms can request an sRGB-capable context. However, sometimes any form of the request can cause surprising results on some drivers, platforms, and hardware. Usually the surprise is in the form of rendering that is either a little darker or a little brighter than intended.
--
--     This hint allows the user to override the app\'s sRGB requests and either force a specific value, or avoid requesting anything at all, depending on what makes things work correctly for their system.
--
--     This is meant as a fail-safe; apps should probably not explicitly set this, and most users should not, either.
--
--     Note that some platforms cannot make this request at all, and on all platforms this request can be denied by the operating system.
--
--     In addition to attempting to obtain the type of sRGB-capable OpenGL context requested by this hint, SDL will try to force the state of GL_FRAMEBUFFER_SRGB on the new context, if appropriate.
--
--     The variable can be set to the following values:
--
--     * \"0\": Force a request for an OpenGL context that is /not/ sRGB-capable.
--
--     * \"1\": Force a request for an OpenGL context that /is/ sRGB-capable.
--
--     * \"skip\": Don\'t make any request for an sRGB-capable context (don\'t specify the attribute at all during context creation time).
--
--     * any other string is undefined behavior.
--
--     If unset, or set to an empty string, SDL will make a request using the value the app specified with the SDL_GL_FRAMEBUFFER_SRGB_CAPABLE attribute.
--
--     This hint should be set before an OpenGL context is created.
--
--     @since 3.4.2
--
--     [C declaration]: @macro SDL_HINT_OPENGL_FORCE_SRGB_FRAMEBUFFER@, literal @\"SDL_OPENGL_FORCE_SRGB_FRAMEBUFFER\"@, defined at @SDL3\/SDL_hints.h 3047:9@
sDL_HINT_OPENGL_FORCE_SRGB_FRAMEBUFFER :: BG.ByteString
sDL_HINT_OPENGL_FORCE_SRGB_FRAMEBUFFER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4F
    , 0x50
    , 0x45
    , 0x4E
    , 0x47
    , 0x4C
    , 0x5F
    , 0x46
    , 0x4F
    , 0x52
    , 0x43
    , 0x45
    , 0x5F
    , 0x53
    , 0x52
    , 0x47
    , 0x42
    , 0x5F
    , 0x46
    , 0x52
    , 0x41
    , 0x4D
    , 0x45
    , 0x42
    , 0x55
    , 0x46
    , 0x46
    , 0x45
    , 0x52
    ]

-- | Mechanism to specify openvr_api library location
--
--     By default, when using the OpenVR driver, it will search for the API library in the current folder. But, if you wish to use a system API you can specify that by using this hint. This should be the full or relative path to a .dll on Windows or .so on Linux.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_OPENVR_LIBRARY@, literal @\"SDL_OPENVR_LIBRARY\"@, defined at @SDL3\/SDL_hints.h 3059:9@
sDL_HINT_OPENVR_LIBRARY :: BG.ByteString
sDL_HINT_OPENVR_LIBRARY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x4F
    , 0x50
    , 0x45
    , 0x4E
    , 0x56
    , 0x52
    , 0x5F
    , 0x4C
    , 0x49
    , 0x42
    , 0x52
    , 0x41
    , 0x52
    , 0x59
    ]

-- | A variable controlling which orientations are allowed on iOS\/Android.
--
--     In some circumstances it is necessary to be able to explicitly control which UI orientations are allowed.
--
--     This variable is a space delimited list of the following values:
--
--     * \"LandscapeLeft\"
--
--     * \"LandscapeRight\"
--
--     * \"Portrait\"
--
--     * \"PortraitUpsideDown\"
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_ORIENTATIONS@, literal @\"SDL_ORIENTATIONS\"@, defined at @SDL3\/SDL_hints.h 3078:9@
sDL_HINT_ORIENTATIONS :: BG.ByteString
sDL_HINT_ORIENTATIONS =
  BG.pack
    [0x53, 0x44, 0x4C, 0x5F, 0x4F, 0x52, 0x49, 0x45, 0x4E, 0x54, 0x41, 0x54, 0x49, 0x4F, 0x4E, 0x53]

-- | A variable controlling the use of a sentinel event when polling the event queue.
--
--     When polling for events, SDL_PumpEvents is used to gather new events from devices. If a device keeps producing new events between calls to SDL_PumpEvents, a poll loop will become stuck until the new events stop. This is most noticeable when moving a high frequency mouse.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable poll sentinels.
--
--     * \"1\": Enable poll sentinels. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_POLL_SENTINEL@, literal @\"SDL_POLL_SENTINEL\"@, defined at @SDL3\/SDL_hints.h 3098:9@
sDL_HINT_POLL_SENTINEL :: BG.ByteString
sDL_HINT_POLL_SENTINEL =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x50
    , 0x4F
    , 0x4C
    , 0x4C
    , 0x5F
    , 0x53
    , 0x45
    , 0x4E
    , 0x54
    , 0x49
    , 0x4E
    , 0x45
    , 0x4C
    ]

-- | Override for SDL_GetPreferredLocales().
--
--     If set, this will be favored over anything the OS might report for the user\'s preferred locales. Changing this hint at runtime will not generate a SDL_EVENT_LOCALE_CHANGED event (but if you can change the hint, you can push your own event, if you want).
--
--     The format of this hint is a comma-separated list of language and locale, combined with an underscore, as is a common format: \"en_GB\". Locale is optional: \"en\". So you might have a list like this: \"en_GB,jp,es_PT\"
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_PREFERRED_LOCALES@, literal @\"SDL_PREFERRED_LOCALES\"@, defined at @SDL3\/SDL_hints.h 3116:9@
sDL_HINT_PREFERRED_LOCALES :: BG.ByteString
sDL_HINT_PREFERRED_LOCALES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x50
    , 0x52
    , 0x45
    , 0x46
    , 0x45
    , 0x52
    , 0x52
    , 0x45
    , 0x44
    , 0x5F
    , 0x4C
    , 0x4F
    , 0x43
    , 0x41
    , 0x4C
    , 0x45
    , 0x53
    ]

-- | A variable that decides whether to send SDL_EVENT_QUIT when closing the last window.
--
--     The variable can be set to the following values:
--
--     * \"0\": SDL will not send an SDL_EVENT_QUIT event when the last window is requesting to close. Note that in this case, there are still other legitimate reasons one might get an SDL_EVENT_QUIT event: choosing \"Quit\" from the macOS menu bar, sending a SIGINT (ctrl-c) on Unix, etc.
--
--     * \"1\": SDL will send a quit event when the last window is requesting to close. (default)
--
--     If there is at least one active system tray icon, SDL_EVENT_QUIT will instead be sent when both the last window will be closed and the last tray icon will be destroyed.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE@, literal @\"SDL_QUIT_ON_LAST_WINDOW_CLOSE\"@, defined at @SDL3\/SDL_hints.h 3139:9@
sDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE :: BG.ByteString
sDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x51
    , 0x55
    , 0x49
    , 0x54
    , 0x5F
    , 0x4F
    , 0x4E
    , 0x5F
    , 0x4C
    , 0x41
    , 0x53
    , 0x54
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x5F
    , 0x43
    , 0x4C
    , 0x4F
    , 0x53
    , 0x45
    ]

-- | A variable controlling whether the Direct3D device is initialized for thread-safe operations.
--
--     The variable can be set to the following values:
--
--     * \"0\": Thread-safety is not enabled. (default)
--
--     * \"1\": Thread-safety is enabled.
--
--     This hint should be set before creating a renderer.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_RENDER_DIRECT3D_THREADSAFE@, literal @\"SDL_RENDER_DIRECT3D_THREADSAFE\"@, defined at @SDL3\/SDL_hints.h 3154:9@
sDL_HINT_RENDER_DIRECT3D_THREADSAFE :: BG.ByteString
sDL_HINT_RENDER_DIRECT3D_THREADSAFE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x45
    , 0x4E
    , 0x44
    , 0x45
    , 0x52
    , 0x5F
    , 0x44
    , 0x49
    , 0x52
    , 0x45
    , 0x43
    , 0x54
    , 0x33
    , 0x44
    , 0x5F
    , 0x54
    , 0x48
    , 0x52
    , 0x45
    , 0x41
    , 0x44
    , 0x53
    , 0x41
    , 0x46
    , 0x45
    ]

-- | A variable controlling whether to enable Direct3D 11+\'s Debug Layer.
--
--     This variable does not have any effect on the Direct3D 9 based renderer.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable Debug Layer use. (default)
--
--     * \"1\": Enable Debug Layer use.
--
--     This hint should be set before creating a renderer.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_RENDER_DIRECT3D11_DEBUG@, literal @\"SDL_RENDER_DIRECT3D11_DEBUG\"@, defined at @SDL3\/SDL_hints.h 3170:9@
sDL_HINT_RENDER_DIRECT3D11_DEBUG :: BG.ByteString
sDL_HINT_RENDER_DIRECT3D11_DEBUG =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x45
    , 0x4E
    , 0x44
    , 0x45
    , 0x52
    , 0x5F
    , 0x44
    , 0x49
    , 0x52
    , 0x45
    , 0x43
    , 0x54
    , 0x33
    , 0x44
    , 0x31
    , 0x31
    , 0x5F
    , 0x44
    , 0x45
    , 0x42
    , 0x55
    , 0x47
    ]

-- | A variable controlling whether to use the Direct3D 11 WARP software rasterizer.
--
--     For more information, see: [https:\/\/learn.microsoft.com\/en-us\/windows\/win32\/direct3darticles\/directx-warp](https://learn.microsoft.com/en-us/windows/win32/direct3darticles/directx-warp)
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable WARP rasterizer. (default)
--
--     * \"1\": Enable WARP rasterizer.
--
--     This hint should be set before creating a renderer.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_RENDER_DIRECT3D11_WARP@, literal @\"SDL_RENDER_DIRECT3D11_WARP\"@, defined at @SDL3\/SDL_hints.h 3188:9@
sDL_HINT_RENDER_DIRECT3D11_WARP :: BG.ByteString
sDL_HINT_RENDER_DIRECT3D11_WARP =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x45
    , 0x4E
    , 0x44
    , 0x45
    , 0x52
    , 0x5F
    , 0x44
    , 0x49
    , 0x52
    , 0x45
    , 0x43
    , 0x54
    , 0x33
    , 0x44
    , 0x31
    , 0x31
    , 0x5F
    , 0x57
    , 0x41
    , 0x52
    , 0x50
    ]

-- | A variable controlling whether to enable Vulkan Validation Layers.
--
--     This variable can be set to the following values:
--
--     * \"0\": Disable Validation Layer use
--
--     * \"1\": Enable Validation Layer use
--
--     By default, SDL does not use Vulkan Validation Layers.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_RENDER_VULKAN_DEBUG@, literal @\"SDL_RENDER_VULKAN_DEBUG\"@, defined at @SDL3\/SDL_hints.h 3202:9@
sDL_HINT_RENDER_VULKAN_DEBUG :: BG.ByteString
sDL_HINT_RENDER_VULKAN_DEBUG =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x45
    , 0x4E
    , 0x44
    , 0x45
    , 0x52
    , 0x5F
    , 0x56
    , 0x55
    , 0x4C
    , 0x4B
    , 0x41
    , 0x4E
    , 0x5F
    , 0x44
    , 0x45
    , 0x42
    , 0x55
    , 0x47
    ]

-- | A variable controlling whether to create the GPU device in debug mode.
--
--     This variable can be set to the following values:
--
--     * \"0\": Disable debug mode use (default)
--
--     * \"1\": Enable debug mode use
--
--     This hint should be set before creating a renderer.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_RENDER_GPU_DEBUG@, literal @\"SDL_RENDER_GPU_DEBUG\"@, defined at @SDL3\/SDL_hints.h 3216:9@
sDL_HINT_RENDER_GPU_DEBUG :: BG.ByteString
sDL_HINT_RENDER_GPU_DEBUG =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x45
    , 0x4E
    , 0x44
    , 0x45
    , 0x52
    , 0x5F
    , 0x47
    , 0x50
    , 0x55
    , 0x5F
    , 0x44
    , 0x45
    , 0x42
    , 0x55
    , 0x47
    ]

-- | A variable controlling whether to prefer a low-power GPU on multi-GPU systems.
--
--     This variable can be set to the following values:
--
--     * \"0\": Prefer high-performance GPU (default)
--
--     * \"1\": Prefer low-power GPU
--
--     This hint should be set before creating a renderer.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_RENDER_GPU_LOW_POWER@, literal @\"SDL_RENDER_GPU_LOW_POWER\"@, defined at @SDL3\/SDL_hints.h 3231:9@
sDL_HINT_RENDER_GPU_LOW_POWER :: BG.ByteString
sDL_HINT_RENDER_GPU_LOW_POWER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x45
    , 0x4E
    , 0x44
    , 0x45
    , 0x52
    , 0x5F
    , 0x47
    , 0x50
    , 0x55
    , 0x5F
    , 0x4C
    , 0x4F
    , 0x57
    , 0x5F
    , 0x50
    , 0x4F
    , 0x57
    , 0x45
    , 0x52
    ]

-- | A variable specifying which render driver to use.
--
--     If the application doesn\'t pick a specific renderer to use, this variable specifies the name of the preferred renderer. If the preferred renderer can\'t be initialized, creating a renderer will fail.
--
--     This variable is case insensitive and can be set to the following values:
--
--     * \"direct3d\"
--
--     * \"direct3d11\"
--
--     * \"direct3d12\"
--
--     * \"opengl\"
--
--     * \"opengles2\"
--
--     * \"opengles\"
--
--     * \"metal\"
--
--     * \"vulkan\"
--
--     * \"gpu\"
--
--     * \"software\"
--
--     This hint accepts a comma-separated list of driver names, and each will be tried in the order listed when creating a renderer until one succeeds or all of them fail.
--
--     The default varies by platform, but it\'s the first one in the list that is available on the current platform.
--
--     This hint should be set before creating a renderer.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_RENDER_DRIVER@, literal @\"SDL_RENDER_DRIVER\"@, defined at @SDL3\/SDL_hints.h 3264:9@
sDL_HINT_RENDER_DRIVER :: BG.ByteString
sDL_HINT_RENDER_DRIVER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x45
    , 0x4E
    , 0x44
    , 0x45
    , 0x52
    , 0x5F
    , 0x44
    , 0x52
    , 0x49
    , 0x56
    , 0x45
    , 0x52
    ]

-- | A variable controlling how the 2D render API renders lines.
--
--     The variable can be set to the following values:
--
--     * \"0\": Use the default line drawing method (Bresenham\'s line algorithm)
--
--     * \"1\": Use the driver point API using Bresenham\'s line algorithm (correct, draws many points)
--
--     * \"2\": Use the driver line API (occasionally misses line endpoints based on hardware driver quirks
--
--     * \"3\": Use the driver geometry API (correct, draws thicker diagonal lines)
--
--     This hint should be set before creating a renderer.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_RENDER_LINE_METHOD@, literal @\"SDL_RENDER_LINE_METHOD\"@, defined at @SDL3\/SDL_hints.h 3282:9@
sDL_HINT_RENDER_LINE_METHOD :: BG.ByteString
sDL_HINT_RENDER_LINE_METHOD =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x45
    , 0x4E
    , 0x44
    , 0x45
    , 0x52
    , 0x5F
    , 0x4C
    , 0x49
    , 0x4E
    , 0x45
    , 0x5F
    , 0x4D
    , 0x45
    , 0x54
    , 0x48
    , 0x4F
    , 0x44
    ]

-- | A variable controlling whether the Metal render driver select low power device over default one.
--
--     The variable can be set to the following values:
--
--     * \"0\": Use the preferred OS device. (default)
--
--     * \"1\": Select a low power device.
--
--     This hint should be set before creating a renderer.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_RENDER_METAL_PREFER_LOW_POWER_DEVICE@, literal @\"SDL_RENDER_METAL_PREFER_LOW_POWER_DEVICE\"@, defined at @SDL3\/SDL_hints.h 3297:9@
sDL_HINT_RENDER_METAL_PREFER_LOW_POWER_DEVICE :: BG.ByteString
sDL_HINT_RENDER_METAL_PREFER_LOW_POWER_DEVICE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x45
    , 0x4E
    , 0x44
    , 0x45
    , 0x52
    , 0x5F
    , 0x4D
    , 0x45
    , 0x54
    , 0x41
    , 0x4C
    , 0x5F
    , 0x50
    , 0x52
    , 0x45
    , 0x46
    , 0x45
    , 0x52
    , 0x5F
    , 0x4C
    , 0x4F
    , 0x57
    , 0x5F
    , 0x50
    , 0x4F
    , 0x57
    , 0x45
    , 0x52
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    ]

-- | A variable controlling whether updates to the SDL screen surface should be synchronized with the vertical refresh, to avoid tearing.
--
--     This hint overrides the application preference when creating a renderer.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable vsync. (default)
--
--     * \"1\": Enable vsync.
--
--     This hint should be set before creating a renderer.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_RENDER_VSYNC@, literal @\"SDL_RENDER_VSYNC\"@, defined at @SDL3\/SDL_hints.h 3314:9@
sDL_HINT_RENDER_VSYNC :: BG.ByteString
sDL_HINT_RENDER_VSYNC =
  BG.pack
    [0x53, 0x44, 0x4C, 0x5F, 0x52, 0x45, 0x4E, 0x44, 0x45, 0x52, 0x5F, 0x56, 0x53, 0x59, 0x4E, 0x43]

-- | A variable to control whether the return key on the soft keyboard should hide the soft keyboard on Android and iOS.
--
--     This hint sets the default value of SDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN.
--
--     The variable can be set to the following values:
--
--     * \"0\": The return key will be handled as a key event. (default)
--
--     * \"1\": The return key will hide the keyboard.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_RETURN_KEY_HIDES_IME@, literal @\"SDL_RETURN_KEY_HIDES_IME\"@, defined at @SDL3\/SDL_hints.h 3331:9@
sDL_HINT_RETURN_KEY_HIDES_IME :: BG.ByteString
sDL_HINT_RETURN_KEY_HIDES_IME =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x45
    , 0x54
    , 0x55
    , 0x52
    , 0x4E
    , 0x5F
    , 0x4B
    , 0x45
    , 0x59
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x45
    , 0x53
    , 0x5F
    , 0x49
    , 0x4D
    , 0x45
    ]

-- | A variable containing a list of ROG gamepad capable mice.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HINT_ROG_GAMEPAD_MICE_EXCLUDED'
--
--     [C declaration]: @macro SDL_HINT_ROG_GAMEPAD_MICE@, literal @\"SDL_ROG_GAMEPAD_MICE\"@, defined at @SDL3\/SDL_hints.h 3350:9@
sDL_HINT_ROG_GAMEPAD_MICE :: BG.ByteString
sDL_HINT_ROG_GAMEPAD_MICE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x4F
    , 0x47
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x50
    , 0x41
    , 0x44
    , 0x5F
    , 0x4D
    , 0x49
    , 0x43
    , 0x45
    ]

-- | A variable containing a list of devices that are not ROG gamepad capable mice.
--
--     This will override SDL_HINT_ROG_GAMEPAD_MICE and the built in device list.
--
--     The format of the string is a comma separated list of USB VID\/PID pairs in hexadecimal form, e.g.
--
--     @0xAAAA\/0xBBBB,0xCCCC\/0xDDDD@
--
--     The variable can also take the form of \"\@file\", in which case the named file will be loaded and interpreted as the value of the variable.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_ROG_GAMEPAD_MICE_EXCLUDED@, literal @\"SDL_ROG_GAMEPAD_MICE_EXCLUDED\"@, defined at @SDL3\/SDL_hints.h 3370:9@
sDL_HINT_ROG_GAMEPAD_MICE_EXCLUDED :: BG.ByteString
sDL_HINT_ROG_GAMEPAD_MICE_EXCLUDED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x4F
    , 0x47
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x50
    , 0x41
    , 0x44
    , 0x5F
    , 0x4D
    , 0x49
    , 0x43
    , 0x45
    , 0x5F
    , 0x45
    , 0x58
    , 0x43
    , 0x4C
    , 0x55
    , 0x44
    , 0x45
    , 0x44
    ]

-- | A variable controlling the width of the PS2\'s framebuffer in pixels.
--
--     By default, the variable is \"640\".
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_PS2_GS_WIDTH@, literal @\"SDL_PS2_GS_WIDTH\"@, defined at @SDL3\/SDL_hints.h 3379:9@
sDL_HINT_PS2_GS_WIDTH :: BG.ByteString
sDL_HINT_PS2_GS_WIDTH =
  BG.pack
    [0x53, 0x44, 0x4C, 0x5F, 0x50, 0x53, 0x32, 0x5F, 0x47, 0x53, 0x5F, 0x57, 0x49, 0x44, 0x54, 0x48]

-- | A variable controlling the height of the PS2\'s framebuffer in pixels.
--
--     By default, the variable is \"448\".
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_PS2_GS_HEIGHT@, literal @\"SDL_PS2_GS_HEIGHT\"@, defined at @SDL3\/SDL_hints.h 3388:9@
sDL_HINT_PS2_GS_HEIGHT :: BG.ByteString
sDL_HINT_PS2_GS_HEIGHT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x50
    , 0x53
    , 0x32
    , 0x5F
    , 0x47
    , 0x53
    , 0x5F
    , 0x48
    , 0x45
    , 0x49
    , 0x47
    , 0x48
    , 0x54
    ]

-- | A variable controlling whether the signal is interlaced or progressive.
--
--     The variable can be set to the following values:
--
--     * \"0\": Image is interlaced. (default)
--
--     * \"1\": Image is progressive.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_PS2_GS_PROGRESSIVE@, literal @\"SDL_PS2_GS_PROGRESSIVE\"@, defined at @SDL3\/SDL_hints.h 3400:9@
sDL_HINT_PS2_GS_PROGRESSIVE :: BG.ByteString
sDL_HINT_PS2_GS_PROGRESSIVE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x50
    , 0x53
    , 0x32
    , 0x5F
    , 0x47
    , 0x53
    , 0x5F
    , 0x50
    , 0x52
    , 0x4F
    , 0x47
    , 0x52
    , 0x45
    , 0x53
    , 0x53
    , 0x49
    , 0x56
    , 0x45
    ]

-- | A variable controlling the video mode of the console.
--
--     The variable can be set to the following values:
--
--     * \"\": Console-native. (default)
--
--     * \"NTSC\": 60hz region.
--
--     * \"PAL\": 50hz region.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_PS2_GS_MODE@, literal @\"SDL_PS2_GS_MODE\"@, defined at @SDL3\/SDL_hints.h 3413:9@
sDL_HINT_PS2_GS_MODE :: BG.ByteString
sDL_HINT_PS2_GS_MODE =
  BG.pack [0x53, 0x44, 0x4C, 0x5F, 0x50, 0x53, 0x32, 0x5F, 0x47, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45]

-- | A variable controlling which Dispmanx layer to use on a Raspberry PI.
--
--     Also known as Z-order. The variable can take a negative or positive value. The default is 10000.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_RPI_VIDEO_LAYER@, literal @\"SDL_RPI_VIDEO_LAYER\"@, defined at @SDL3\/SDL_hints.h 3425:9@
sDL_HINT_RPI_VIDEO_LAYER :: BG.ByteString
sDL_HINT_RPI_VIDEO_LAYER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x52
    , 0x50
    , 0x49
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x4C
    , 0x41
    , 0x59
    , 0x45
    , 0x52
    ]

-- | Specify an \"activity name\" for screensaver inhibition.
--
--     Some platforms, notably Linux desktops, list the applications which are inhibiting the screensaver or other power-saving features.
--
--     This hint lets you specify the \"activity name\" sent to the OS when SDL_DisableScreenSaver() is used (or the screensaver is automatically disabled). The contents of this hint are used when the screensaver is disabled. You should use a string that describes what your program is doing (and, therefore, why the screensaver is disabled). For example, \"Playing a game\" or \"Watching a video\".
--
--     Setting this to \"\" or leaving it unset will have SDL use a reasonable default: \"Playing a game\" or something similar.
--
--     This hint should be set before calling SDL_DisableScreenSaver()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME@, literal @\"SDL_SCREENSAVER_INHIBIT_ACTIVITY_NAME\"@, defined at @SDL3\/SDL_hints.h 3447:9@
sDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME :: BG.ByteString
sDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x53
    , 0x43
    , 0x52
    , 0x45
    , 0x45
    , 0x4E
    , 0x53
    , 0x41
    , 0x56
    , 0x45
    , 0x52
    , 0x5F
    , 0x49
    , 0x4E
    , 0x48
    , 0x49
    , 0x42
    , 0x49
    , 0x54
    , 0x5F
    , 0x41
    , 0x43
    , 0x54
    , 0x49
    , 0x56
    , 0x49
    , 0x54
    , 0x59
    , 0x5F
    , 0x4E
    , 0x41
    , 0x4D
    , 0x45
    ]

-- | A variable controlling whether SDL calls dbus_shutdown() on quit.
--
--     This is useful as a debug tool to validate memory leaks, but shouldn\'t ever be set in production applications, as other libraries used by the application might use dbus under the hood and this can cause crashes if they continue after SDL_Quit().
--
--     The variable can be set to the following values:
--
--     * \"0\": SDL will not call dbus_shutdown() on quit. (default)
--
--     * \"1\": SDL will call dbus_shutdown() on quit.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_SHUTDOWN_DBUS_ON_QUIT@, literal @\"SDL_SHUTDOWN_DBUS_ON_QUIT\"@, defined at @SDL3\/SDL_hints.h 3466:9@
sDL_HINT_SHUTDOWN_DBUS_ON_QUIT :: BG.ByteString
sDL_HINT_SHUTDOWN_DBUS_ON_QUIT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x53
    , 0x48
    , 0x55
    , 0x54
    , 0x44
    , 0x4F
    , 0x57
    , 0x4E
    , 0x5F
    , 0x44
    , 0x42
    , 0x55
    , 0x53
    , 0x5F
    , 0x4F
    , 0x4E
    , 0x5F
    , 0x51
    , 0x55
    , 0x49
    , 0x54
    ]

-- | A variable that specifies a backend to use for title storage.
--
--     By default, SDL will try all available storage backends in a reasonable order until it finds one that can work, but this hint allows the app or user to force a specific target, such as \"pc\" if, say, you are on Steam but want to avoid SteamRemoteStorage for title data.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_STORAGE_TITLE_DRIVER@, literal @\"SDL_STORAGE_TITLE_DRIVER\"@, defined at @SDL3\/SDL_hints.h 3480:9@
sDL_HINT_STORAGE_TITLE_DRIVER :: BG.ByteString
sDL_HINT_STORAGE_TITLE_DRIVER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x53
    , 0x54
    , 0x4F
    , 0x52
    , 0x41
    , 0x47
    , 0x45
    , 0x5F
    , 0x54
    , 0x49
    , 0x54
    , 0x4C
    , 0x45
    , 0x5F
    , 0x44
    , 0x52
    , 0x49
    , 0x56
    , 0x45
    , 0x52
    ]

-- | A variable that specifies a backend to use for user storage.
--
--     By default, SDL will try all available storage backends in a reasonable order until it finds one that can work, but this hint allows the app or user to force a specific target, such as \"pc\" if, say, you are on Steam but want to avoid SteamRemoteStorage for user data.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_STORAGE_USER_DRIVER@, literal @\"SDL_STORAGE_USER_DRIVER\"@, defined at @SDL3\/SDL_hints.h 3494:9@
sDL_HINT_STORAGE_USER_DRIVER :: BG.ByteString
sDL_HINT_STORAGE_USER_DRIVER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x53
    , 0x54
    , 0x4F
    , 0x52
    , 0x41
    , 0x47
    , 0x45
    , 0x5F
    , 0x55
    , 0x53
    , 0x45
    , 0x52
    , 0x5F
    , 0x44
    , 0x52
    , 0x49
    , 0x56
    , 0x45
    , 0x52
    ]

-- | Specifies whether SDL_THREAD_PRIORITY_TIME_CRITICAL should be treated as realtime.
--
--     On some platforms, like Linux, a realtime priority thread may be subject to restrictions that require special handling by the application. This hint exists to let SDL know that the app is prepared to handle said restrictions.
--
--     On Linux, SDL will apply the following configuration to any thread that becomes realtime:
--
--     * The SCHED_RESET_ON_FORK bit will be set on the scheduling policy,
--
--     * An RLIMIT_RTTIME budget will be configured to the rtkit specified limit.
--
--     * Exceeding this limit will result in the kernel sending SIGKILL to the app, refer to the man pages for more information.
--
--     The variable can be set to the following values:
--
--     * \"0\": default platform specific behaviour
--
--     * \"1\": Force SDL_THREAD_PRIORITY_TIME_CRITICAL to a realtime scheduling policy
--
--     This hint should be set before calling SDL_SetCurrentThreadPriority()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL@, literal @\"SDL_THREAD_FORCE_REALTIME_TIME_CRITICAL\"@, defined at @SDL3\/SDL_hints.h 3523:9@
sDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL :: BG.ByteString
sDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x54
    , 0x48
    , 0x52
    , 0x45
    , 0x41
    , 0x44
    , 0x5F
    , 0x46
    , 0x4F
    , 0x52
    , 0x43
    , 0x45
    , 0x5F
    , 0x52
    , 0x45
    , 0x41
    , 0x4C
    , 0x54
    , 0x49
    , 0x4D
    , 0x45
    , 0x5F
    , 0x54
    , 0x49
    , 0x4D
    , 0x45
    , 0x5F
    , 0x43
    , 0x52
    , 0x49
    , 0x54
    , 0x49
    , 0x43
    , 0x41
    , 0x4C
    ]

-- | A string specifying additional information to use with SDL_SetCurrentThreadPriority.
--
--     By default SDL_SetCurrentThreadPriority will make appropriate system changes in order to apply a thread priority. For example on systems using pthreads the scheduler policy is changed automatically to a policy that works well with a given priority. Code which has specific requirements can override SDL\'s default behavior with this hint.
--
--     pthread hint values are \"current\", \"other\", \"fifo\" and \"rr\". Currently no other platform hint values are defined but may be in the future.
--
--     On Linux, the kernel may send SIGKILL to realtime tasks which exceed the distro configured execution budget for rtkit. This budget can be queried through RLIMIT_RTTIME after calling SDL_SetCurrentThreadPriority().
--
--     This hint should be set before calling SDL_SetCurrentThreadPriority()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_THREAD_PRIORITY_POLICY@, literal @\"SDL_THREAD_PRIORITY_POLICY\"@, defined at @SDL3\/SDL_hints.h 3546:9@
sDL_HINT_THREAD_PRIORITY_POLICY :: BG.ByteString
sDL_HINT_THREAD_PRIORITY_POLICY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x54
    , 0x48
    , 0x52
    , 0x45
    , 0x41
    , 0x44
    , 0x5F
    , 0x50
    , 0x52
    , 0x49
    , 0x4F
    , 0x52
    , 0x49
    , 0x54
    , 0x59
    , 0x5F
    , 0x50
    , 0x4F
    , 0x4C
    , 0x49
    , 0x43
    , 0x59
    ]

-- | A variable that controls the timer resolution, in milliseconds.
--
--     The higher resolution the timer, the more frequently the CPU services timer interrupts, and the more precise delays are, but this takes up power and CPU time. This hint is only used on Windows.
--
--     See this blog post for more information: [http:\/\/randomascii.wordpress.com\/2013\/07\/08\/windows-timer-resolution-megawatts-wasted\/](http://randomascii.wordpress.com/2013/07/08/windows-timer-resolution-megawatts-wasted/)
--
--     The default value is \"1\".
--
--     If this variable is set to \"0\", the system timer resolution is not set.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_TIMER_RESOLUTION@, literal @\"SDL_TIMER_RESOLUTION\"@, defined at @SDL3\/SDL_hints.h 3566:9@
sDL_HINT_TIMER_RESOLUTION :: BG.ByteString
sDL_HINT_TIMER_RESOLUTION =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x54
    , 0x49
    , 0x4D
    , 0x45
    , 0x52
    , 0x5F
    , 0x52
    , 0x45
    , 0x53
    , 0x4F
    , 0x4C
    , 0x55
    , 0x54
    , 0x49
    , 0x4F
    , 0x4E
    ]

-- | A variable controlling whether touch events should generate synthetic mouse events.
--
--     The variable can be set to the following values:
--
--     * \"0\": Touch events will not generate mouse events.
--
--     * \"1\": Touch events will generate mouse events. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_TOUCH_MOUSE_EVENTS@, literal @\"SDL_TOUCH_MOUSE_EVENTS\"@, defined at @SDL3\/SDL_hints.h 3581:9@
sDL_HINT_TOUCH_MOUSE_EVENTS :: BG.ByteString
sDL_HINT_TOUCH_MOUSE_EVENTS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x54
    , 0x4F
    , 0x55
    , 0x43
    , 0x48
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x45
    , 0x56
    , 0x45
    , 0x4E
    , 0x54
    , 0x53
    ]

-- | A variable controlling whether trackpads should be treated as touch devices.
--
--     On macOS (and possibly other platforms in the future), SDL will report touches on a trackpad as mouse input, which is generally what users expect from this device; however, these are often actually full multitouch-capable touch devices, so it might be preferable to some apps to treat them as such.
--
--     The variable can be set to the following values:
--
--     * \"0\": Trackpad will send mouse events. (default)
--
--     * \"1\": Trackpad will send touch events.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_TRACKPAD_IS_TOUCH_ONLY@, literal @\"SDL_TRACKPAD_IS_TOUCH_ONLY\"@, defined at @SDL3\/SDL_hints.h 3602:9@
sDL_HINT_TRACKPAD_IS_TOUCH_ONLY :: BG.ByteString
sDL_HINT_TRACKPAD_IS_TOUCH_ONLY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x54
    , 0x52
    , 0x41
    , 0x43
    , 0x4B
    , 0x50
    , 0x41
    , 0x44
    , 0x5F
    , 0x49
    , 0x53
    , 0x5F
    , 0x54
    , 0x4F
    , 0x55
    , 0x43
    , 0x48
    , 0x5F
    , 0x4F
    , 0x4E
    , 0x4C
    , 0x59
    ]

-- | A variable controlling whether the Android \/ tvOS remotes should be listed as joystick devices, instead of sending keyboard events.
--
--     The variable can be set to the following values:
--
--     * \"0\": Remotes send enter\/escape\/arrow key events.
--
--     * \"1\": Remotes are available as 2 axis, 2 button joysticks. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_TV_REMOTE_AS_JOYSTICK@, literal @\"SDL_TV_REMOTE_AS_JOYSTICK\"@, defined at @SDL3\/SDL_hints.h 3617:9@
sDL_HINT_TV_REMOTE_AS_JOYSTICK :: BG.ByteString
sDL_HINT_TV_REMOTE_AS_JOYSTICK =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x54
    , 0x56
    , 0x5F
    , 0x52
    , 0x45
    , 0x4D
    , 0x4F
    , 0x54
    , 0x45
    , 0x5F
    , 0x41
    , 0x53
    , 0x5F
    , 0x4A
    , 0x4F
    , 0x59
    , 0x53
    , 0x54
    , 0x49
    , 0x43
    , 0x4B
    ]

-- | A variable controlling whether the screensaver is enabled.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable screensaver. (default)
--
--     * \"1\": Enable screensaver.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_ALLOW_SCREENSAVER@, literal @\"SDL_VIDEO_ALLOW_SCREENSAVER\"@, defined at @SDL3\/SDL_hints.h 3631:9@
sDL_HINT_VIDEO_ALLOW_SCREENSAVER :: BG.ByteString
sDL_HINT_VIDEO_ALLOW_SCREENSAVER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x41
    , 0x4C
    , 0x4C
    , 0x4F
    , 0x57
    , 0x5F
    , 0x53
    , 0x43
    , 0x52
    , 0x45
    , 0x45
    , 0x4E
    , 0x53
    , 0x41
    , 0x56
    , 0x45
    , 0x52
    ]

-- | A comma separated list containing the names of the displays that SDL should sort to the front of the display list.
--
--     When this hint is set, displays with matching name strings will be prioritized in the list of displays, as exposed by calling SDL_GetDisplays(), with the first listed becoming the primary display. The naming convention can vary depending on the environment, but it is usually a connector name (e.g. \'DP-1\', \'DP-2\', \'HDMI-A-1\', etc...).
--
--     On Wayland desktops, the connector names associated with displays can be found in the @name@ property of the info output from @wayland-info -i wl_output@. On X11 desktops, the @xrandr@ utility can be used to retrieve the connector names associated with displays.
--
--     This hint is currently supported on the following drivers:
--
--     * KMSDRM (kmsdrm)
--
--     * Wayland (wayland)
--
--     * X11 (x11)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_DISPLAY_PRIORITY@, literal @\"SDL_VIDEO_DISPLAY_PRIORITY\"@, defined at @SDL3\/SDL_hints.h 3658:9@
sDL_HINT_VIDEO_DISPLAY_PRIORITY :: BG.ByteString
sDL_HINT_VIDEO_DISPLAY_PRIORITY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x44
    , 0x49
    , 0x53
    , 0x50
    , 0x4C
    , 0x41
    , 0x59
    , 0x5F
    , 0x50
    , 0x52
    , 0x49
    , 0x4F
    , 0x52
    , 0x49
    , 0x54
    , 0x59
    ]

-- | Tell the video driver that we only want a double buffer.
--
--     By default, most lowlevel 2D APIs will use a triple buffer scheme that wastes no CPU time on waiting for vsync after issuing a flip, but introduces a frame of latency. On the other hand, using a double buffer scheme instead is recommended for cases where low latency is an important factor because we save a whole frame of latency.
--
--     We do so by waiting for vsync immediately after issuing a flip, usually just after eglSwapBuffers call in the backend\'s *_SwapWindow function.
--
--     This hint is currently supported on the following drivers:
--
--     * Raspberry Pi (raspberrypi)
--
--     * Wayland (wayland)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_DOUBLE_BUFFER@, literal @\"SDL_VIDEO_DOUBLE_BUFFER\"@, defined at @SDL3\/SDL_hints.h 3681:9@
sDL_HINT_VIDEO_DOUBLE_BUFFER :: BG.ByteString
sDL_HINT_VIDEO_DOUBLE_BUFFER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x44
    , 0x4F
    , 0x55
    , 0x42
    , 0x4C
    , 0x45
    , 0x5F
    , 0x42
    , 0x55
    , 0x46
    , 0x46
    , 0x45
    , 0x52
    ]

-- | A variable that specifies a video backend to use.
--
--     By default, SDL will try all available video backends in a reasonable order until it finds one that can work, but this hint allows the app or user to force a specific target, such as \"x11\" if, say, you are on Wayland but want to try talking to the X server instead.
--
--     This hint accepts a comma-separated list of driver names, and each will be tried in the order listed during init, until one succeeds or all of them fail.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_DRIVER@, literal @\"SDL_VIDEO_DRIVER\"@, defined at @SDL3\/SDL_hints.h 3699:9@
sDL_HINT_VIDEO_DRIVER :: BG.ByteString
sDL_HINT_VIDEO_DRIVER =
  BG.pack
    [0x53, 0x44, 0x4C, 0x5F, 0x56, 0x49, 0x44, 0x45, 0x4F, 0x5F, 0x44, 0x52, 0x49, 0x56, 0x45, 0x52]

-- | A variable controlling whether the dummy video driver saves output frames.
--
--     * \"0\": Video frames are not saved to disk. (default)
--
--     * \"1\": Video frames are saved to files in the format \"SDL_windowX-Y.bmp\", where X is the window ID, and Y is the frame number.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_DUMMY_SAVE_FRAMES@, literal @\"SDL_VIDEO_DUMMY_SAVE_FRAMES\"@, defined at @SDL3\/SDL_hints.h 3712:9@
sDL_HINT_VIDEO_DUMMY_SAVE_FRAMES :: BG.ByteString
sDL_HINT_VIDEO_DUMMY_SAVE_FRAMES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x44
    , 0x55
    , 0x4D
    , 0x4D
    , 0x59
    , 0x5F
    , 0x53
    , 0x41
    , 0x56
    , 0x45
    , 0x5F
    , 0x46
    , 0x52
    , 0x41
    , 0x4D
    , 0x45
    , 0x53
    ]

-- | If eglGetPlatformDisplay fails, fall back to calling eglGetDisplay.
--
--     The variable can be set to one of the following values:
--
--     * \"0\": Do not fall back to eglGetDisplay.
--
--     * \"1\": Fall back to eglGetDisplay if eglGetPlatformDisplay fails. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK@, literal @\"SDL_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK\"@, defined at @SDL3\/SDL_hints.h 3726:9@
sDL_HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK :: BG.ByteString
sDL_HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x45
    , 0x47
    , 0x4C
    , 0x5F
    , 0x41
    , 0x4C
    , 0x4C
    , 0x4F
    , 0x57
    , 0x5F
    , 0x47
    , 0x45
    , 0x54
    , 0x44
    , 0x49
    , 0x53
    , 0x50
    , 0x4C
    , 0x41
    , 0x59
    , 0x5F
    , 0x46
    , 0x41
    , 0x4C
    , 0x4C
    , 0x42
    , 0x41
    , 0x43
    , 0x4B
    ]

-- | A variable controlling whether the OpenGL context should be created with EGL.
--
--     The variable can be set to the following values:
--
--     * \"0\": Use platform-specific GL context creation API (GLX, WGL, CGL, etc). (default)
--
--     * \"1\": Use EGL
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_FORCE_EGL@, literal @\"SDL_VIDEO_FORCE_EGL\"@, defined at @SDL3\/SDL_hints.h 3742:9@
sDL_HINT_VIDEO_FORCE_EGL :: BG.ByteString
sDL_HINT_VIDEO_FORCE_EGL =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x46
    , 0x4F
    , 0x52
    , 0x43
    , 0x45
    , 0x5F
    , 0x45
    , 0x47
    , 0x4C
    ]

-- | A variable that specifies the policy for fullscreen Spaces on macOS.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable Spaces support (FULLSCREEN_DESKTOP won\'t use them and SDL_WINDOW_RESIZABLE windows won\'t offer the \"fullscreen\" button on their titlebars).
--
--     * \"1\": Enable Spaces support (FULLSCREEN_DESKTOP will use them and SDL_WINDOW_RESIZABLE windows will offer the \"fullscreen\" button on their titlebars). (default)
--
--     This hint should be set before creating a window.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES@, literal @\"SDL_VIDEO_MAC_FULLSCREEN_SPACES\"@, defined at @SDL3\/SDL_hints.h 3760:9@
sDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES :: BG.ByteString
sDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x4D
    , 0x41
    , 0x43
    , 0x5F
    , 0x46
    , 0x55
    , 0x4C
    , 0x4C
    , 0x53
    , 0x43
    , 0x52
    , 0x45
    , 0x45
    , 0x4E
    , 0x5F
    , 0x53
    , 0x50
    , 0x41
    , 0x43
    , 0x45
    , 0x53
    ]

-- | A variable that specifies the menu visibility when a window is fullscreen in Spaces on macOS.
--
--     The variable can be set to the following values:
--
--     * \"0\": The menu will be hidden when the window is in a fullscreen space, and not accessible by moving the mouse to the top of the screen.
--
--     * \"1\": The menu will be accessible when the window is in a fullscreen space.
--
--     * \"auto\": The menu will be hidden if fullscreen mode was toggled on programmatically via @SDL_SetWindowFullscreen()@, and accessible if fullscreen was entered via the \"fullscreen\" button on the window title bar. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY@, literal @\"SDL_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY\"@, defined at @SDL3\/SDL_hints.h 3781:9@
sDL_HINT_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY :: BG.ByteString
sDL_HINT_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x4D
    , 0x41
    , 0x43
    , 0x5F
    , 0x46
    , 0x55
    , 0x4C
    , 0x4C
    , 0x53
    , 0x43
    , 0x52
    , 0x45
    , 0x45
    , 0x4E
    , 0x5F
    , 0x4D
    , 0x45
    , 0x4E
    , 0x55
    , 0x5F
    , 0x56
    , 0x49
    , 0x53
    , 0x49
    , 0x42
    , 0x49
    , 0x4C
    , 0x49
    , 0x54
    , 0x59
    ]

-- | A variable indicating whether the metal layer drawable size should be updated for the SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event on macOS.
--
--     The variable can be set to the following values:
--
--     * \"0\": the metal layer drawable size will not be updated on the SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event.
--
--     * \"1\": the metal layer drawable size will be updated on the SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event. (default)
--
--     This hint should be set before SDL_Metal_CreateView called.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_METAL_AUTO_RESIZE_DRAWABLE@, literal @\"SDL_VIDEO_METAL_AUTO_RESIZE_DRAWABLE\"@, defined at @SDL3\/SDL_hints.h 3798:9@
sDL_HINT_VIDEO_METAL_AUTO_RESIZE_DRAWABLE :: BG.ByteString
sDL_HINT_VIDEO_METAL_AUTO_RESIZE_DRAWABLE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x4D
    , 0x45
    , 0x54
    , 0x41
    , 0x4C
    , 0x5F
    , 0x41
    , 0x55
    , 0x54
    , 0x4F
    , 0x5F
    , 0x52
    , 0x45
    , 0x53
    , 0x49
    , 0x5A
    , 0x45
    , 0x5F
    , 0x44
    , 0x52
    , 0x41
    , 0x57
    , 0x41
    , 0x42
    , 0x4C
    , 0x45
    ]

-- | A variable controlling whether SDL will attempt to automatically set the destination display to a mode most closely matching that of the previous display if an exclusive fullscreen window is moved onto it.
--
--     The variable can be set to the following values:
--
--     * \"0\": SDL will not attempt to automatically set a matching mode on the destination display. If an exclusive fullscreen window is moved to a new display, the window will become fullscreen desktop.
--
--     * \"1\": SDL will attempt to automatically set a mode on the destination display that most closely matches the mode of the display that the exclusive fullscreen window was previously on. (default)
--
--     This hint can be set anytime.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_MATCH_EXCLUSIVE_MODE_ON_MOVE@, literal @\"SDL_VIDEO_MATCH_EXCLUSIVE_MODE_ON_MOVE\"@, defined at @SDL3\/SDL_hints.h 3818:9@
sDL_HINT_VIDEO_MATCH_EXCLUSIVE_MODE_ON_MOVE :: BG.ByteString
sDL_HINT_VIDEO_MATCH_EXCLUSIVE_MODE_ON_MOVE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x4D
    , 0x41
    , 0x54
    , 0x43
    , 0x48
    , 0x5F
    , 0x45
    , 0x58
    , 0x43
    , 0x4C
    , 0x55
    , 0x53
    , 0x49
    , 0x56
    , 0x45
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x44
    , 0x45
    , 0x5F
    , 0x4F
    , 0x4E
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x56
    , 0x45
    ]

-- | A variable controlling whether fullscreen windows are minimized when they lose focus.
--
--     The variable can be set to the following values:
--
--     * \"0\": Fullscreen windows will not be minimized when they lose focus.
--
--     * \"1\": Fullscreen windows are minimized when they lose focus.
--
--     * \"auto\": Fullscreen windows are minimized when they lose focus if they use exclusive fullscreen modes, so the desktop video mode is restored. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS@, literal @\"SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS\"@, defined at @SDL3\/SDL_hints.h 3836:9@
sDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS :: BG.ByteString
sDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x4D
    , 0x49
    , 0x4E
    , 0x49
    , 0x4D
    , 0x49
    , 0x5A
    , 0x45
    , 0x5F
    , 0x4F
    , 0x4E
    , 0x5F
    , 0x46
    , 0x4F
    , 0x43
    , 0x55
    , 0x53
    , 0x5F
    , 0x4C
    , 0x4F
    , 0x53
    , 0x53
    ]

-- | A variable controlling whether the offscreen video driver saves output frames.
--
--     This only saves frames that are generated using software rendering, not accelerated OpenGL rendering.
--
--     * \"0\": Video frames are not saved to disk. (default)
--
--     * \"1\": Video frames are saved to files in the format \"SDL_windowX-Y.bmp\", where X is the window ID, and Y is the frame number.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_OFFSCREEN_SAVE_FRAMES@, literal @\"SDL_VIDEO_OFFSCREEN_SAVE_FRAMES\"@, defined at @SDL3\/SDL_hints.h 3853:9@
sDL_HINT_VIDEO_OFFSCREEN_SAVE_FRAMES :: BG.ByteString
sDL_HINT_VIDEO_OFFSCREEN_SAVE_FRAMES =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x4F
    , 0x46
    , 0x46
    , 0x53
    , 0x43
    , 0x52
    , 0x45
    , 0x45
    , 0x4E
    , 0x5F
    , 0x53
    , 0x41
    , 0x56
    , 0x45
    , 0x5F
    , 0x46
    , 0x52
    , 0x41
    , 0x4D
    , 0x45
    , 0x53
    ]

-- | A variable controlling whether all window operations will block until complete.
--
--     Window systems that run asynchronously may not have the results of window operations that resize or move the window applied immediately upon the return of the requesting function. Setting this hint will cause such operations to block after every call until the pending operation has completed. Setting this to \'1\' is the equivalent of calling SDL_SyncWindow() after every function call.
--
--     Be aware that amount of time spent blocking while waiting for window operations to complete can be quite lengthy, as animations may have to complete, which can take upwards of multiple seconds in some cases.
--
--     The variable can be set to the following values:
--
--     * \"0\": Window operations are non-blocking. (default)
--
--     * \"1\": Window operations will block until completed.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS@, literal @\"SDL_VIDEO_SYNC_WINDOW_OPERATIONS\"@, defined at @SDL3\/SDL_hints.h 3879:9@
sDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS :: BG.ByteString
sDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x53
    , 0x59
    , 0x4E
    , 0x43
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x5F
    , 0x4F
    , 0x50
    , 0x45
    , 0x52
    , 0x41
    , 0x54
    , 0x49
    , 0x4F
    , 0x4E
    , 0x53
    ]

-- | A variable controlling whether the libdecor Wayland backend is allowed to be used.
--
--     libdecor is used over xdg-shell when xdg-decoration protocol is unavailable.
--
--     The variable can be set to the following values:
--
--     * \"0\": libdecor use is disabled.
--
--     * \"1\": libdecor use is enabled. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR@, literal @\"SDL_VIDEO_WAYLAND_ALLOW_LIBDECOR\"@, defined at @SDL3\/SDL_hints.h 3897:9@
sDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR :: BG.ByteString
sDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x57
    , 0x41
    , 0x59
    , 0x4C
    , 0x41
    , 0x4E
    , 0x44
    , 0x5F
    , 0x41
    , 0x4C
    , 0x4C
    , 0x4F
    , 0x57
    , 0x5F
    , 0x4C
    , 0x49
    , 0x42
    , 0x44
    , 0x45
    , 0x43
    , 0x4F
    , 0x52
    ]

-- | A variable controlling whether video mode emulation is enabled under Wayland.
--
--     When this hint is set, a standard set of emulated CVT video modes will be exposed for use by the application. If it is disabled, the only modes exposed will be the logical desktop size and, in the case of a scaled desktop, the native display resolution.
--
--     The variable can be set to the following values:
--
--     * \"0\": Video mode emulation is disabled.
--
--     * \"1\": Video mode emulation is enabled. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_WAYLAND_MODE_EMULATION@, literal @\"SDL_VIDEO_WAYLAND_MODE_EMULATION\"@, defined at @SDL3\/SDL_hints.h 3917:9@
sDL_HINT_VIDEO_WAYLAND_MODE_EMULATION :: BG.ByteString
sDL_HINT_VIDEO_WAYLAND_MODE_EMULATION =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x57
    , 0x41
    , 0x59
    , 0x4C
    , 0x41
    , 0x4E
    , 0x44
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x44
    , 0x45
    , 0x5F
    , 0x45
    , 0x4D
    , 0x55
    , 0x4C
    , 0x41
    , 0x54
    , 0x49
    , 0x4F
    , 0x4E
    ]

-- | A variable controlling how modes with a non-native aspect ratio are displayed under Wayland.
--
--     When this hint is set, the requested scaling will be used when displaying fullscreen video modes that don\'t match the display\'s native aspect ratio. This is contingent on compositor viewport support.
--
--     The variable can be set to the following values:
--
--     * \"aspect\" - Video modes will be displayed scaled, in their proper aspect ratio, with black bars.
--
--     * \"stretch\" - Video modes will be scaled to fill the entire display. (default)
--
--     * \"none\" - Video modes will be displayed as 1:1 with no scaling.
--
--     This hint should be set before creating a window.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_WAYLAND_MODE_SCALING@, literal @\"SDL_VIDEO_WAYLAND_MODE_SCALING\"@, defined at @SDL3\/SDL_hints.h 3939:9@
sDL_HINT_VIDEO_WAYLAND_MODE_SCALING :: BG.ByteString
sDL_HINT_VIDEO_WAYLAND_MODE_SCALING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x57
    , 0x41
    , 0x59
    , 0x4C
    , 0x41
    , 0x4E
    , 0x44
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x44
    , 0x45
    , 0x5F
    , 0x53
    , 0x43
    , 0x41
    , 0x4C
    , 0x49
    , 0x4E
    , 0x47
    ]

-- | A variable controlling whether the libdecor Wayland backend is preferred over native decorations.
--
--     When this hint is set, libdecor will be used to provide window decorations, even if xdg-decoration is available. (Note that, by default, libdecor will use xdg-decoration itself if available).
--
--     The variable can be set to the following values:
--
--     * \"0\": libdecor is enabled only if server-side decorations are unavailable. (default)
--
--     * \"1\": libdecor is always enabled if available.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR@, literal @\"SDL_VIDEO_WAYLAND_PREFER_LIBDECOR\"@, defined at @SDL3\/SDL_hints.h 3959:9@
sDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR :: BG.ByteString
sDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x57
    , 0x41
    , 0x59
    , 0x4C
    , 0x41
    , 0x4E
    , 0x44
    , 0x5F
    , 0x50
    , 0x52
    , 0x45
    , 0x46
    , 0x45
    , 0x52
    , 0x5F
    , 0x4C
    , 0x49
    , 0x42
    , 0x44
    , 0x45
    , 0x43
    , 0x4F
    , 0x52
    ]

-- | A variable forcing non-DPI-aware Wayland windows to output at 1:1 scaling.
--
--     This must be set before initializing the video subsystem.
--
--     When this hint is set, Wayland windows that are not flagged as being DPI-aware will be output with scaling designed to force 1:1 pixel mapping.
--
--     This is intended to allow legacy applications to be displayed without desktop scaling being applied, and has issues with certain display configurations, as this forces the window to behave in a way that Wayland desktops were not designed to accommodate:
--
--     * Rounding errors can result with odd window sizes and\/or desktop scales, which can cause the window contents to appear slightly blurry.
--
--     * Positioning the window may be imprecise due to unit conversions and rounding.
--
--     * The window may be unusably small on scaled desktops.
--
--     * The window may jump in size when moving between displays of different scale factors.
--
--     * Displays may appear to overlap when using a multi-monitor setup with scaling enabled.
--
--     * Possible loss of cursor precision due to the logical size of the window being reduced.
--
--     New applications should be designed with proper DPI awareness handling instead of enabling this.
--
--     The variable can be set to the following values:
--
--     * \"0\": Windows will be scaled normally.
--
--     * \"1\": Windows will be forced to scale to achieve 1:1 output.
--
--     This hint should be set before creating a window.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_WAYLAND_SCALE_TO_DISPLAY@, literal @\"SDL_VIDEO_WAYLAND_SCALE_TO_DISPLAY\"@, defined at @SDL3\/SDL_hints.h 3998:9@
sDL_HINT_VIDEO_WAYLAND_SCALE_TO_DISPLAY :: BG.ByteString
sDL_HINT_VIDEO_WAYLAND_SCALE_TO_DISPLAY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x57
    , 0x41
    , 0x59
    , 0x4C
    , 0x41
    , 0x4E
    , 0x44
    , 0x5F
    , 0x53
    , 0x43
    , 0x41
    , 0x4C
    , 0x45
    , 0x5F
    , 0x54
    , 0x4F
    , 0x5F
    , 0x44
    , 0x49
    , 0x53
    , 0x50
    , 0x4C
    , 0x41
    , 0x59
    ]

-- | A variable specifying which shader compiler to preload when using the Chrome ANGLE binaries.
--
--     SDL has EGL and OpenGL ES2 support on Windows via the ANGLE project. It can use two different sets of binaries, those compiled by the user from source or those provided by the Chrome browser. In the later case, these binaries require that SDL loads a DLL providing the shader compiler.
--
--     The variable can be set to the following values:
--
--     * \"d3dcompiler_46.dll\" - best for Vista or later. (default)
--
--     * \"d3dcompiler_43.dll\" - for XP support.
--
--     * \"none\" - do not load any library, useful if you compiled ANGLE from source and included the compiler in your binaries.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_WIN_D3DCOMPILER@, literal @\"SDL_VIDEO_WIN_D3DCOMPILER\"@, defined at @SDL3\/SDL_hints.h 4020:9@
sDL_HINT_VIDEO_WIN_D3DCOMPILER :: BG.ByteString
sDL_HINT_VIDEO_WIN_D3DCOMPILER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x5F
    , 0x44
    , 0x33
    , 0x44
    , 0x43
    , 0x4F
    , 0x4D
    , 0x50
    , 0x49
    , 0x4C
    , 0x45
    , 0x52
    ]

-- | A variable controlling whether SDL should call XSelectInput() to enable input events on X11 windows wrapped by SDL windows.
--
--     The variable can be set to the following values:
--
--     * \"0\": Don\'t call XSelectInput(), assuming the native window code has done it already.
--
--     * \"1\": Call XSelectInput() to enable input events. (default)
--
--     This hint should be set before creating a window.
--
--     @since 3.2.10
--
--     [C declaration]: @macro SDL_HINT_VIDEO_X11_EXTERNAL_WINDOW_INPUT@, literal @\"SDL_VIDEO_X11_EXTERNAL_WINDOW_INPUT\"@, defined at @SDL3\/SDL_hints.h 4036:9@
sDL_HINT_VIDEO_X11_EXTERNAL_WINDOW_INPUT :: BG.ByteString
sDL_HINT_VIDEO_X11_EXTERNAL_WINDOW_INPUT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x58
    , 0x31
    , 0x31
    , 0x5F
    , 0x45
    , 0x58
    , 0x54
    , 0x45
    , 0x52
    , 0x4E
    , 0x41
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x5F
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    ]

-- | A variable controlling whether the X11 _NET_WM_BYPASS_COMPOSITOR hint should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable _NET_WM_BYPASS_COMPOSITOR.
--
--     * \"1\": Enable _NET_WM_BYPASS_COMPOSITOR. (default)
--
--     This hint should be set before creating a window.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR@, literal @\"SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR\"@, defined at @SDL3\/SDL_hints.h 4051:9@
sDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR :: BG.ByteString
sDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x58
    , 0x31
    , 0x31
    , 0x5F
    , 0x4E
    , 0x45
    , 0x54
    , 0x5F
    , 0x57
    , 0x4D
    , 0x5F
    , 0x42
    , 0x59
    , 0x50
    , 0x41
    , 0x53
    , 0x53
    , 0x5F
    , 0x43
    , 0x4F
    , 0x4D
    , 0x50
    , 0x4F
    , 0x53
    , 0x49
    , 0x54
    , 0x4F
    , 0x52
    ]

-- | A variable controlling whether the X11 _NET_WM_PING protocol should be supported.
--
--     By default SDL will use _NET_WM_PING, but for applications that know they will not always be able to respond to ping requests in a timely manner they can turn it off to avoid the window manager thinking the app is hung.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable _NET_WM_PING.
--
--     * \"1\": Enable _NET_WM_PING. (default)
--
--     This hint should be set before creating a window.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_X11_NET_WM_PING@, literal @\"SDL_VIDEO_X11_NET_WM_PING\"@, defined at @SDL3\/SDL_hints.h 4070:9@
sDL_HINT_VIDEO_X11_NET_WM_PING :: BG.ByteString
sDL_HINT_VIDEO_X11_NET_WM_PING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x58
    , 0x31
    , 0x31
    , 0x5F
    , 0x4E
    , 0x45
    , 0x54
    , 0x5F
    , 0x57
    , 0x4D
    , 0x5F
    , 0x50
    , 0x49
    , 0x4E
    , 0x47
    ]

-- | A variable controlling whether SDL uses DirectColor visuals.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable DirectColor visuals.
--
--     * \"1\": Enable DirectColor visuals. (default)
--
--     This hint should be set before initializing the video subsystem.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_X11_NODIRECTCOLOR@, literal @\"SDL_VIDEO_X11_NODIRECTCOLOR\"@, defined at @SDL3\/SDL_hints.h 4084:9@
sDL_HINT_VIDEO_X11_NODIRECTCOLOR :: BG.ByteString
sDL_HINT_VIDEO_X11_NODIRECTCOLOR =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x58
    , 0x31
    , 0x31
    , 0x5F
    , 0x4E
    , 0x4F
    , 0x44
    , 0x49
    , 0x52
    , 0x45
    , 0x43
    , 0x54
    , 0x43
    , 0x4F
    , 0x4C
    , 0x4F
    , 0x52
    ]

-- | A variable forcing the content scaling factor for X11 displays.
--
--     The variable can be set to a floating point value in the range 1.0-10.0f
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_X11_SCALING_FACTOR@, literal @\"SDL_VIDEO_X11_SCALING_FACTOR\"@, defined at @SDL3\/SDL_hints.h 4095:9@
sDL_HINT_VIDEO_X11_SCALING_FACTOR :: BG.ByteString
sDL_HINT_VIDEO_X11_SCALING_FACTOR =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x58
    , 0x31
    , 0x31
    , 0x5F
    , 0x53
    , 0x43
    , 0x41
    , 0x4C
    , 0x49
    , 0x4E
    , 0x47
    , 0x5F
    , 0x46
    , 0x41
    , 0x43
    , 0x54
    , 0x4F
    , 0x52
    ]

-- | A variable forcing the visual ID used for X11 display modes.
--
--     This hint should be set before initializing the video subsystem.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_X11_VISUALID@, literal @\"SDL_VIDEO_X11_VISUALID\"@, defined at @SDL3\/SDL_hints.h 4104:9@
sDL_HINT_VIDEO_X11_VISUALID :: BG.ByteString
sDL_HINT_VIDEO_X11_VISUALID =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x58
    , 0x31
    , 0x31
    , 0x5F
    , 0x56
    , 0x49
    , 0x53
    , 0x55
    , 0x41
    , 0x4C
    , 0x49
    , 0x44
    ]

-- | A variable forcing the visual ID chosen for new X11 windows.
--
--     This hint should be set before creating a window.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_X11_WINDOW_VISUALID@, literal @\"SDL_VIDEO_X11_WINDOW_VISUALID\"@, defined at @SDL3\/SDL_hints.h 4113:9@
sDL_HINT_VIDEO_X11_WINDOW_VISUALID :: BG.ByteString
sDL_HINT_VIDEO_X11_WINDOW_VISUALID =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x58
    , 0x31
    , 0x31
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x5F
    , 0x56
    , 0x49
    , 0x53
    , 0x55
    , 0x41
    , 0x4C
    , 0x49
    , 0x44
    ]

-- | A variable controlling whether the X11 XRandR extension should be used.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable XRandR.
--
--     * \"1\": Enable XRandR. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VIDEO_X11_XRANDR@, literal @\"SDL_VIDEO_X11_XRANDR\"@, defined at @SDL3\/SDL_hints.h 4127:9@
sDL_HINT_VIDEO_X11_XRANDR :: BG.ByteString
sDL_HINT_VIDEO_X11_XRANDR =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x44
    , 0x45
    , 0x4F
    , 0x5F
    , 0x58
    , 0x31
    , 0x31
    , 0x5F
    , 0x58
    , 0x52
    , 0x41
    , 0x4E
    , 0x44
    , 0x52
    ]

-- | A variable controlling whether touch should be enabled on the back panel of the PlayStation Vita.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable touch on the back panel.
--
--     * \"1\": Enable touch on the back panel. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VITA_ENABLE_BACK_TOUCH@, literal @\"SDL_VITA_ENABLE_BACK_TOUCH\"@, defined at @SDL3\/SDL_hints.h 4142:9@
sDL_HINT_VITA_ENABLE_BACK_TOUCH :: BG.ByteString
sDL_HINT_VITA_ENABLE_BACK_TOUCH =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x54
    , 0x41
    , 0x5F
    , 0x45
    , 0x4E
    , 0x41
    , 0x42
    , 0x4C
    , 0x45
    , 0x5F
    , 0x42
    , 0x41
    , 0x43
    , 0x4B
    , 0x5F
    , 0x54
    , 0x4F
    , 0x55
    , 0x43
    , 0x48
    ]

-- | A variable controlling whether touch should be enabled on the front panel of the PlayStation Vita.
--
--     The variable can be set to the following values:
--
--     * \"0\": Disable touch on the front panel.
--
--     * \"1\": Enable touch on the front panel. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VITA_ENABLE_FRONT_TOUCH@, literal @\"SDL_VITA_ENABLE_FRONT_TOUCH\"@, defined at @SDL3\/SDL_hints.h 4157:9@
sDL_HINT_VITA_ENABLE_FRONT_TOUCH :: BG.ByteString
sDL_HINT_VITA_ENABLE_FRONT_TOUCH =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x54
    , 0x41
    , 0x5F
    , 0x45
    , 0x4E
    , 0x41
    , 0x42
    , 0x4C
    , 0x45
    , 0x5F
    , 0x46
    , 0x52
    , 0x4F
    , 0x4E
    , 0x54
    , 0x5F
    , 0x54
    , 0x4F
    , 0x55
    , 0x43
    , 0x48
    ]

-- | A variable controlling the module path on the PlayStation Vita.
--
--     This hint defaults to \"app0:module\"
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VITA_MODULE_PATH@, literal @\"SDL_VITA_MODULE_PATH\"@, defined at @SDL3\/SDL_hints.h 4168:9@
sDL_HINT_VITA_MODULE_PATH :: BG.ByteString
sDL_HINT_VITA_MODULE_PATH =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x54
    , 0x41
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x44
    , 0x55
    , 0x4C
    , 0x45
    , 0x5F
    , 0x50
    , 0x41
    , 0x54
    , 0x48
    ]

-- | A variable controlling whether to perform PVR initialization on the PlayStation Vita.
--
--     * \"0\": Skip PVR initialization.
--
--     * \"1\": Perform the normal PVR initialization. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VITA_PVR_INIT@, literal @\"SDL_VITA_PVR_INIT\"@, defined at @SDL3\/SDL_hints.h 4181:9@
sDL_HINT_VITA_PVR_INIT :: BG.ByteString
sDL_HINT_VITA_PVR_INIT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x54
    , 0x41
    , 0x5F
    , 0x50
    , 0x56
    , 0x52
    , 0x5F
    , 0x49
    , 0x4E
    , 0x49
    , 0x54
    ]

-- | A variable overriding the resolution reported on the PlayStation Vita.
--
--     The variable can be set to the following values:
--
--     * \"544\": 544p (default)
--
--     * \"720\": 725p for PSTV
--
--     * \"1080\": 1088i for PSTV
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VITA_RESOLUTION@, literal @\"SDL_VITA_RESOLUTION\"@, defined at @SDL3\/SDL_hints.h 4196:9@
sDL_HINT_VITA_RESOLUTION :: BG.ByteString
sDL_HINT_VITA_RESOLUTION =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x54
    , 0x41
    , 0x5F
    , 0x52
    , 0x45
    , 0x53
    , 0x4F
    , 0x4C
    , 0x55
    , 0x54
    , 0x49
    , 0x4F
    , 0x4E
    ]

-- | A variable controlling whether OpenGL should be used instead of OpenGL ES on the PlayStation Vita.
--
--     The variable can be set to the following values:
--
--     * \"0\": Use OpenGL ES. (default)
--
--     * \"1\": Use OpenGL.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VITA_PVR_OPENGL@, literal @\"SDL_VITA_PVR_OPENGL\"@, defined at @SDL3\/SDL_hints.h 4211:9@
sDL_HINT_VITA_PVR_OPENGL :: BG.ByteString
sDL_HINT_VITA_PVR_OPENGL =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x54
    , 0x41
    , 0x5F
    , 0x50
    , 0x56
    , 0x52
    , 0x5F
    , 0x4F
    , 0x50
    , 0x45
    , 0x4E
    , 0x47
    , 0x4C
    ]

-- | A variable controlling which touchpad should generate synthetic mouse events.
--
--     The variable can be set to the following values:
--
--     * \"0\": Only front touchpad should generate mouse events. (default)
--
--     * \"1\": Only back touchpad should generate mouse events.
--
--     * \"2\": Both touchpads should generate mouse events.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VITA_TOUCH_MOUSE_DEVICE@, literal @\"SDL_VITA_TOUCH_MOUSE_DEVICE\"@, defined at @SDL3\/SDL_hints.h 4227:9@
sDL_HINT_VITA_TOUCH_MOUSE_DEVICE :: BG.ByteString
sDL_HINT_VITA_TOUCH_MOUSE_DEVICE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x49
    , 0x54
    , 0x41
    , 0x5F
    , 0x54
    , 0x4F
    , 0x55
    , 0x43
    , 0x48
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x44
    , 0x45
    , 0x56
    , 0x49
    , 0x43
    , 0x45
    ]

-- | A variable overriding the display index used in SDL_Vulkan_CreateSurface()
--
--     The display index starts at 0, which is the default.
--
--     This hint should be set before calling SDL_Vulkan_CreateSurface()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VULKAN_DISPLAY@, literal @\"SDL_VULKAN_DISPLAY\"@, defined at @SDL3\/SDL_hints.h 4238:9@
sDL_HINT_VULKAN_DISPLAY :: BG.ByteString
sDL_HINT_VULKAN_DISPLAY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x55
    , 0x4C
    , 0x4B
    , 0x41
    , 0x4E
    , 0x5F
    , 0x44
    , 0x49
    , 0x53
    , 0x50
    , 0x4C
    , 0x41
    , 0x59
    ]

-- | Specify the Vulkan library to load.
--
--     This hint should be set before creating a Vulkan window or calling SDL_Vulkan_LoadLibrary().
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_VULKAN_LIBRARY@, literal @\"SDL_VULKAN_LIBRARY\"@, defined at @SDL3\/SDL_hints.h 4248:9@
sDL_HINT_VULKAN_LIBRARY :: BG.ByteString
sDL_HINT_VULKAN_LIBRARY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x56
    , 0x55
    , 0x4C
    , 0x4B
    , 0x41
    , 0x4E
    , 0x5F
    , 0x4C
    , 0x49
    , 0x42
    , 0x52
    , 0x41
    , 0x52
    , 0x59
    ]

-- | A variable controlling how the fact chunk affects the loading of a WAVE file.
--
--     The fact chunk stores information about the number of samples of a WAVE file. The Standards Update from Microsoft notes that this value can be used to \'determine the length of the data in seconds\'. This is especially useful for compressed formats (for which this is a mandatory chunk) if they produce multiple sample frames per block and truncating the block is not allowed. The fact chunk can exactly specify how many sample frames there should be in this case.
--
--     Unfortunately, most application seem to ignore the fact chunk and so SDL ignores it by default as well.
--
--     The variable can be set to the following values:
--
--     * \"truncate\" - Use the number of samples to truncate the wave data if the fact chunk is present and valid.
--
--     * \"strict\" - Like \"truncate\", but raise an error if the fact chunk is invalid, not present for non-PCM formats, or if the data chunk doesn\'t have that many samples.
--
--     * \"ignorezero\" - Like \"truncate\", but ignore fact chunk if the number of samples is zero.
--
--     * \"ignore\" - Ignore fact chunk entirely. (default)
--
--     This hint should be set before calling SDL_LoadWAV() or SDL_LoadWAV_IO()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WAVE_FACT_CHUNK@, literal @\"SDL_WAVE_FACT_CHUNK\"@, defined at @SDL3\/SDL_hints.h 4280:9@
sDL_HINT_WAVE_FACT_CHUNK :: BG.ByteString
sDL_HINT_WAVE_FACT_CHUNK =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x41
    , 0x56
    , 0x45
    , 0x5F
    , 0x46
    , 0x41
    , 0x43
    , 0x54
    , 0x5F
    , 0x43
    , 0x48
    , 0x55
    , 0x4E
    , 0x4B
    ]

-- | A variable controlling the maximum number of chunks in a WAVE file.
--
--     This sets an upper bound on the number of chunks in a WAVE file to avoid wasting time on malformed or corrupt WAVE files. This defaults to \"10000\".
--
--     This hint should be set before calling SDL_LoadWAV() or SDL_LoadWAV_IO()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WAVE_CHUNK_LIMIT@, literal @\"SDL_WAVE_CHUNK_LIMIT\"@, defined at @SDL3\/SDL_hints.h 4292:9@
sDL_HINT_WAVE_CHUNK_LIMIT :: BG.ByteString
sDL_HINT_WAVE_CHUNK_LIMIT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x41
    , 0x56
    , 0x45
    , 0x5F
    , 0x43
    , 0x48
    , 0x55
    , 0x4E
    , 0x4B
    , 0x5F
    , 0x4C
    , 0x49
    , 0x4D
    , 0x49
    , 0x54
    ]

-- | A variable controlling how the size of the RIFF chunk affects the loading of a WAVE file.
--
--     The size of the RIFF chunk (which includes all the sub-chunks of the WAVE file) is not always reliable. In case the size is wrong, it\'s possible to just ignore it and step through the chunks until a fixed limit is reached.
--
--     Note that files that have trailing data unrelated to the WAVE file or corrupt files may slow down the loading process without a reliable boundary. By default, SDL stops after 10000 chunks to prevent wasting time. Use SDL_HINT_WAVE_CHUNK_LIMIT to adjust this value.
--
--     The variable can be set to the following values:
--
--     * \"force\" - Always use the RIFF chunk size as a boundary for the chunk search.
--
--     * \"ignorezero\" - Like \"force\", but a zero size searches up to 4 GiB. (default)
--
--     * \"ignore\" - Ignore the RIFF chunk size and always search up to 4 GiB.
--
--     * \"maximum\" - Search for chunks until the end of file. (not recommended)
--
--     This hint should be set before calling SDL_LoadWAV() or SDL_LoadWAV_IO()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WAVE_RIFF_CHUNK_SIZE@, literal @\"SDL_WAVE_RIFF_CHUNK_SIZE\"@, defined at @SDL3\/SDL_hints.h 4320:9@
sDL_HINT_WAVE_RIFF_CHUNK_SIZE :: BG.ByteString
sDL_HINT_WAVE_RIFF_CHUNK_SIZE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x41
    , 0x56
    , 0x45
    , 0x5F
    , 0x52
    , 0x49
    , 0x46
    , 0x46
    , 0x5F
    , 0x43
    , 0x48
    , 0x55
    , 0x4E
    , 0x4B
    , 0x5F
    , 0x53
    , 0x49
    , 0x5A
    , 0x45
    ]

-- | A variable controlling how a truncated WAVE file is handled.
--
--     A WAVE file is considered truncated if any of the chunks are incomplete or the data chunk size is not a multiple of the block size. By default, SDL decodes until the first incomplete block, as most applications seem to do.
--
--     The variable can be set to the following values:
--
--     * \"verystrict\" - Raise an error if the file is truncated.
--
--     * \"strict\" - Like \"verystrict\", but the size of the RIFF chunk is ignored.
--
--     * \"dropframe\" - Decode until the first incomplete sample frame.
--
--     * \"dropblock\" - Decode until the first incomplete block. (default)
--
--     This hint should be set before calling SDL_LoadWAV() or SDL_LoadWAV_IO()
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WAVE_TRUNCATION@, literal @\"SDL_WAVE_TRUNCATION\"@, defined at @SDL3\/SDL_hints.h 4340:9@
sDL_HINT_WAVE_TRUNCATION :: BG.ByteString
sDL_HINT_WAVE_TRUNCATION =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x41
    , 0x56
    , 0x45
    , 0x5F
    , 0x54
    , 0x52
    , 0x55
    , 0x4E
    , 0x43
    , 0x41
    , 0x54
    , 0x49
    , 0x4F
    , 0x4E
    ]

-- | A variable controlling whether the window is activated when the SDL_RaiseWindow function is called.
--
--     The variable can be set to the following values:
--
--     * \"0\": The window is not activated when the SDL_RaiseWindow function is called.
--
--     * \"1\": The window is activated when the SDL_RaiseWindow function is called. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOW_ACTIVATE_WHEN_RAISED@, literal @\"SDL_WINDOW_ACTIVATE_WHEN_RAISED\"@, defined at @SDL3\/SDL_hints.h 4357:9@
sDL_HINT_WINDOW_ACTIVATE_WHEN_RAISED :: BG.ByteString
sDL_HINT_WINDOW_ACTIVATE_WHEN_RAISED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x5F
    , 0x41
    , 0x43
    , 0x54
    , 0x49
    , 0x56
    , 0x41
    , 0x54
    , 0x45
    , 0x5F
    , 0x57
    , 0x48
    , 0x45
    , 0x4E
    , 0x5F
    , 0x52
    , 0x41
    , 0x49
    , 0x53
    , 0x45
    , 0x44
    ]

-- | A variable controlling whether the window is activated when the SDL_ShowWindow function is called.
--
--     The variable can be set to the following values:
--
--     * \"0\": The window is not activated when the SDL_ShowWindow function is called.
--
--     * \"1\": The window is activated when the SDL_ShowWindow function is called. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOW_ACTIVATE_WHEN_SHOWN@, literal @\"SDL_WINDOW_ACTIVATE_WHEN_SHOWN\"@, defined at @SDL3\/SDL_hints.h 4374:9@
sDL_HINT_WINDOW_ACTIVATE_WHEN_SHOWN :: BG.ByteString
sDL_HINT_WINDOW_ACTIVATE_WHEN_SHOWN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x5F
    , 0x41
    , 0x43
    , 0x54
    , 0x49
    , 0x56
    , 0x41
    , 0x54
    , 0x45
    , 0x5F
    , 0x57
    , 0x48
    , 0x45
    , 0x4E
    , 0x5F
    , 0x53
    , 0x48
    , 0x4F
    , 0x57
    , 0x4E
    ]

-- | If set to \"0\" then never set the top-most flag on an SDL Window even if the application requests it.
--
--     This is a debugging aid for developers and not expected to be used by end users.
--
--     The variable can be set to the following values:
--
--     * \"0\": don\'t allow topmost
--
--     * \"1\": allow topmost (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOW_ALLOW_TOPMOST@, literal @\"SDL_WINDOW_ALLOW_TOPMOST\"@, defined at @SDL3\/SDL_hints.h 4392:9@
sDL_HINT_WINDOW_ALLOW_TOPMOST :: BG.ByteString
sDL_HINT_WINDOW_ALLOW_TOPMOST =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x5F
    , 0x41
    , 0x4C
    , 0x4C
    , 0x4F
    , 0x57
    , 0x5F
    , 0x54
    , 0x4F
    , 0x50
    , 0x4D
    , 0x4F
    , 0x53
    , 0x54
    ]

-- | A variable controlling whether the window frame and title bar are interactive when the cursor is hidden.
--
--     The variable can be set to the following values:
--
--     * \"0\": The window frame is not interactive when the cursor is hidden (no move, resize, etc).
--
--     * \"1\": The window frame is interactive when the cursor is hidden. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN@, literal @\"SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN\"@, defined at @SDL3\/SDL_hints.h 4408:9@
sDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN :: BG.ByteString
sDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x5F
    , 0x46
    , 0x52
    , 0x41
    , 0x4D
    , 0x45
    , 0x5F
    , 0x55
    , 0x53
    , 0x41
    , 0x42
    , 0x4C
    , 0x45
    , 0x5F
    , 0x57
    , 0x48
    , 0x49
    , 0x4C
    , 0x45
    , 0x5F
    , 0x43
    , 0x55
    , 0x52
    , 0x53
    , 0x4F
    , 0x52
    , 0x5F
    , 0x48
    , 0x49
    , 0x44
    , 0x44
    , 0x45
    , 0x4E
    ]

-- | A variable controlling whether SDL generates window-close events for Alt+F4 on Windows.
--
--     The variable can be set to the following values:
--
--     * \"0\": SDL will only do normal key handling for Alt+F4.
--
--     * \"1\": SDL will generate a window-close event when it sees Alt+F4. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOWS_CLOSE_ON_ALT_F4@, literal @\"SDL_WINDOWS_CLOSE_ON_ALT_F4\"@, defined at @SDL3\/SDL_hints.h 4424:9@
sDL_HINT_WINDOWS_CLOSE_ON_ALT_F4 :: BG.ByteString
sDL_HINT_WINDOWS_CLOSE_ON_ALT_F4 =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x53
    , 0x5F
    , 0x43
    , 0x4C
    , 0x4F
    , 0x53
    , 0x45
    , 0x5F
    , 0x4F
    , 0x4E
    , 0x5F
    , 0x41
    , 0x4C
    , 0x54
    , 0x5F
    , 0x46
    , 0x34
    ]

-- | A variable controlling whether menus can be opened with their keyboard shortcut (Alt+mnemonic).
--
--     If the mnemonics are enabled, then menus can be opened by pressing the Alt key and the corresponding mnemonic (for example, Alt+F opens the File menu). However, in case an invalid mnemonic is pressed, Windows makes an audible beep to convey that nothing happened. This is true even if the window has no menu at all!
--
--     Because most SDL applications don\'t have menus, and some want to use the Alt key for other purposes, SDL disables mnemonics (and the beeping) by default.
--
--     Note: This also affects keyboard events: with mnemonics enabled, when a menu is opened from the keyboard, you will not receive a KEYUP event for the mnemonic key, and /might/ not receive one for Alt.
--
--     The variable can be set to the following values:
--
--     * \"0\": Alt+mnemonic does nothing, no beeping. (default)
--
--     * \"1\": Alt+mnemonic opens menus, invalid mnemonics produce a beep.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOWS_ENABLE_MENU_MNEMONICS@, literal @\"SDL_WINDOWS_ENABLE_MENU_MNEMONICS\"@, defined at @SDL3\/SDL_hints.h 4453:9@
sDL_HINT_WINDOWS_ENABLE_MENU_MNEMONICS :: BG.ByteString
sDL_HINT_WINDOWS_ENABLE_MENU_MNEMONICS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x53
    , 0x5F
    , 0x45
    , 0x4E
    , 0x41
    , 0x42
    , 0x4C
    , 0x45
    , 0x5F
    , 0x4D
    , 0x45
    , 0x4E
    , 0x55
    , 0x5F
    , 0x4D
    , 0x4E
    , 0x45
    , 0x4D
    , 0x4F
    , 0x4E
    , 0x49
    , 0x43
    , 0x53
    ]

-- | A variable controlling whether the windows message loop is processed by SDL.
--
--     The variable can be set to the following values:
--
--     * \"0\": The window message loop is not run.
--
--     * \"1\": The window message loop is processed in SDL_PumpEvents(). (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP@, literal @\"SDL_WINDOWS_ENABLE_MESSAGELOOP\"@, defined at @SDL3\/SDL_hints.h 4468:9@
sDL_HINT_WINDOWS_ENABLE_MESSAGELOOP :: BG.ByteString
sDL_HINT_WINDOWS_ENABLE_MESSAGELOOP =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x53
    , 0x5F
    , 0x45
    , 0x4E
    , 0x41
    , 0x42
    , 0x4C
    , 0x45
    , 0x5F
    , 0x4D
    , 0x45
    , 0x53
    , 0x53
    , 0x41
    , 0x47
    , 0x45
    , 0x4C
    , 0x4F
    , 0x4F
    , 0x50
    ]

-- | A variable controlling whether GameInput is used for raw keyboard and mouse on Windows.
--
--     The variable can be set to the following values:
--
--     * \"0\": GameInput is not used for raw keyboard and mouse events. (default)
--
--     * \"1\": GameInput is used for raw keyboard and mouse events, if available.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOWS_GAMEINPUT@, literal @\"SDL_WINDOWS_GAMEINPUT\"@, defined at @SDL3\/SDL_hints.h 4483:9@
sDL_HINT_WINDOWS_GAMEINPUT :: BG.ByteString
sDL_HINT_WINDOWS_GAMEINPUT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x53
    , 0x5F
    , 0x47
    , 0x41
    , 0x4D
    , 0x45
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    ]

-- | A variable controlling whether raw keyboard events are used on Windows.
--
--     The variable can be set to the following values:
--
--     * \"0\": The Windows message loop is used for keyboard events. (default)
--
--     * \"1\": Low latency raw keyboard events are used.
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOWS_RAW_KEYBOARD@, literal @\"SDL_WINDOWS_RAW_KEYBOARD\"@, defined at @SDL3\/SDL_hints.h 4497:9@
sDL_HINT_WINDOWS_RAW_KEYBOARD :: BG.ByteString
sDL_HINT_WINDOWS_RAW_KEYBOARD =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x53
    , 0x5F
    , 0x52
    , 0x41
    , 0x57
    , 0x5F
    , 0x4B
    , 0x45
    , 0x59
    , 0x42
    , 0x4F
    , 0x41
    , 0x52
    , 0x44
    ]

-- | A variable controlling whether or not the RIDEV_NOHOTKEYS flag is set when enabling Windows raw keyboard events.
--
--     This blocks any hotkeys that have been registered by applications from having any effect beyond generating raw WM_INPUT events.
--
--     This flag does not affect system-hotkeys like ALT-TAB or CTRL-ALT-DEL, but does affect the Windows Logo key since it is a userland hotkey registered by explorer.exe.
--
--     The variable can be set to the following values:
--
--     * \"0\": Hotkeys are not excluded. (default)
--
--     * \"1\": Hotkeys are excluded.
--
--     This hint can be set anytime.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_HINT_WINDOWS_RAW_KEYBOARD_EXCLUDE_HOTKEYS@, literal @\"SDL_WINDOWS_RAW_KEYBOARD_EXCLUDE_HOTKEYS\"@, defined at @SDL3\/SDL_hints.h 4519:9@
sDL_HINT_WINDOWS_RAW_KEYBOARD_EXCLUDE_HOTKEYS :: BG.ByteString
sDL_HINT_WINDOWS_RAW_KEYBOARD_EXCLUDE_HOTKEYS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x53
    , 0x5F
    , 0x52
    , 0x41
    , 0x57
    , 0x5F
    , 0x4B
    , 0x45
    , 0x59
    , 0x42
    , 0x4F
    , 0x41
    , 0x52
    , 0x44
    , 0x5F
    , 0x45
    , 0x58
    , 0x43
    , 0x4C
    , 0x55
    , 0x44
    , 0x45
    , 0x5F
    , 0x48
    , 0x4F
    , 0x54
    , 0x4B
    , 0x45
    , 0x59
    , 0x53
    ]

-- | A variable controlling whether SDL uses Kernel Semaphores on Windows.
--
--     Kernel Semaphores are inter-process and require a context switch on every interaction. On Windows 8 and newer, the WaitOnAddress API is available. Using that and atomics to implement semaphores increases performance. SDL will fall back to Kernel Objects on older OS versions or if forced to by this hint.
--
--     The variable can be set to the following values:
--
--     * \"0\": Use Atomics and WaitOnAddress API when available, otherwise fall back to Kernel Objects. (default)
--
--     * \"1\": Force the use of Kernel Objects in all cases.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL@, literal @\"SDL_WINDOWS_FORCE_SEMAPHORE_KERNEL\"@, defined at @SDL3\/SDL_hints.h 4540:9@
sDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL :: BG.ByteString
sDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x53
    , 0x5F
    , 0x46
    , 0x4F
    , 0x52
    , 0x43
    , 0x45
    , 0x5F
    , 0x53
    , 0x45
    , 0x4D
    , 0x41
    , 0x50
    , 0x48
    , 0x4F
    , 0x52
    , 0x45
    , 0x5F
    , 0x4B
    , 0x45
    , 0x52
    , 0x4E
    , 0x45
    , 0x4C
    ]

-- | A variable to specify custom icon resource id from RC file on Windows platform.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOWS_INTRESOURCE_ICON@, literal @\"SDL_WINDOWS_INTRESOURCE_ICON\"@, defined at @SDL3\/SDL_hints.h 4550:9@
sDL_HINT_WINDOWS_INTRESOURCE_ICON :: BG.ByteString
sDL_HINT_WINDOWS_INTRESOURCE_ICON =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x53
    , 0x5F
    , 0x49
    , 0x4E
    , 0x54
    , 0x52
    , 0x45
    , 0x53
    , 0x4F
    , 0x55
    , 0x52
    , 0x43
    , 0x45
    , 0x5F
    , 0x49
    , 0x43
    , 0x4F
    , 0x4E
    ]

-- | A variable to specify custom icon resource id from RC file on Windows platform.
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL@, literal @\"SDL_WINDOWS_INTRESOURCE_ICON_SMALL\"@, defined at @SDL3\/SDL_hints.h 4560:9@
sDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL :: BG.ByteString
sDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x53
    , 0x5F
    , 0x49
    , 0x4E
    , 0x54
    , 0x52
    , 0x45
    , 0x53
    , 0x4F
    , 0x55
    , 0x52
    , 0x43
    , 0x45
    , 0x5F
    , 0x49
    , 0x43
    , 0x4F
    , 0x4E
    , 0x5F
    , 0x53
    , 0x4D
    , 0x41
    , 0x4C
    , 0x4C
    ]

-- | A variable controlling whether SDL uses the D3D9Ex API introduced in Windows Vista, instead of normal D3D9.
--
--     Direct3D 9Ex contains changes to state management that can eliminate device loss errors during scenarios like Alt+Tab or UAC prompts. D3D9Ex may require some changes to your application to cope with the new behavior, so this is disabled by default.
--
--     For more information on Direct3D 9Ex, see:
--
--     * [https:\/\/docs.microsoft.com\/en-us\/windows\/win32\/direct3darticles\/graphics-apis-in-windows-vista\#direct3d-9ex](https://docs.microsoft.com/en-us/windows/win32/direct3darticles/graphics-apis-in-windows-vista#direct3d-9ex)
--
--     * [https:\/\/docs.microsoft.com\/en-us\/windows\/win32\/direct3darticles\/direct3d-9ex-improvements](https://docs.microsoft.com/en-us/windows/win32/direct3darticles/direct3d-9ex-improvements)
--
--     The variable can be set to the following values:
--
--     * \"0\": Use the original Direct3D 9 API. (default)
--
--     * \"1\": Use the Direct3D 9Ex API on Vista and later (and fall back if D3D9Ex is unavailable)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOWS_USE_D3D9EX@, literal @\"SDL_WINDOWS_USE_D3D9EX\"@, defined at @SDL3\/SDL_hints.h 4586:9@
sDL_HINT_WINDOWS_USE_D3D9EX :: BG.ByteString
sDL_HINT_WINDOWS_USE_D3D9EX =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x53
    , 0x5F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x44
    , 0x33
    , 0x44
    , 0x39
    , 0x45
    , 0x58
    ]

-- | A variable controlling whether SDL will clear the window contents when the WM_ERASEBKGND message is received.
--
--     The variable can be set to the following values:
--
--     * \"0\"\/\"never\": Never clear the window.
--
--     * \"1\"\/\"initial\": Clear the window when the first WM_ERASEBKGND event fires. (default)
--
--     * \"2\"\/\"always\": Clear the window on every WM_ERASEBKGND event.
--
--     This hint should be set before creating a window.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_WINDOWS_ERASE_BACKGROUND_MODE@, literal @\"SDL_WINDOWS_ERASE_BACKGROUND_MODE\"@, defined at @SDL3\/SDL_hints.h 4603:9@
sDL_HINT_WINDOWS_ERASE_BACKGROUND_MODE :: BG.ByteString
sDL_HINT_WINDOWS_ERASE_BACKGROUND_MODE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x53
    , 0x5F
    , 0x45
    , 0x52
    , 0x41
    , 0x53
    , 0x45
    , 0x5F
    , 0x42
    , 0x41
    , 0x43
    , 0x4B
    , 0x47
    , 0x52
    , 0x4F
    , 0x55
    , 0x4E
    , 0x44
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x44
    , 0x45
    ]

-- | A variable controlling whether X11 windows are marked as override-redirect.
--
--     If set, this /might/ increase framerate at the expense of the desktop not working as expected. Override-redirect windows aren\'t noticed by the window manager at all.
--
--     You should probably only use this for fullscreen windows, and you probably shouldn\'t even use it for that. But it\'s here if you want to try!
--
--     The variable can be set to the following values:
--
--     * \"0\": Do not mark the window as override-redirect. (default)
--
--     * \"1\": Mark the window as override-redirect.
--
--     This hint should be set before creating a window.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_X11_FORCE_OVERRIDE_REDIRECT@, literal @\"SDL_X11_FORCE_OVERRIDE_REDIRECT\"@, defined at @SDL3\/SDL_hints.h 4624:9@
sDL_HINT_X11_FORCE_OVERRIDE_REDIRECT :: BG.ByteString
sDL_HINT_X11_FORCE_OVERRIDE_REDIRECT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x58
    , 0x31
    , 0x31
    , 0x5F
    , 0x46
    , 0x4F
    , 0x52
    , 0x43
    , 0x45
    , 0x5F
    , 0x4F
    , 0x56
    , 0x45
    , 0x52
    , 0x52
    , 0x49
    , 0x44
    , 0x45
    , 0x5F
    , 0x52
    , 0x45
    , 0x44
    , 0x49
    , 0x52
    , 0x45
    , 0x43
    , 0x54
    ]

-- | A variable specifying the type of an X11 window.
--
--     During SDL_CreateWindow, SDL uses the _NET_WM_WINDOW_TYPE X11 property to report to the window manager the type of window it wants to create. This might be set to various things if SDL_WINDOW_TOOLTIP or SDL_WINDOW_POPUP_MENU, etc, were specified. For \"normal\" windows that haven\'t set a specific type, this hint can be used to specify a custom type. For example, a dock window might set this to \"_NET_WM_WINDOW_TYPE_DOCK\".
--
--     This hint should be set before creating a window.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_X11_WINDOW_TYPE@, literal @\"SDL_X11_WINDOW_TYPE\"@, defined at @SDL3\/SDL_hints.h 4641:9@
sDL_HINT_X11_WINDOW_TYPE :: BG.ByteString
sDL_HINT_X11_WINDOW_TYPE =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x58
    , 0x31
    , 0x31
    , 0x5F
    , 0x57
    , 0x49
    , 0x4E
    , 0x44
    , 0x4F
    , 0x57
    , 0x5F
    , 0x54
    , 0x59
    , 0x50
    , 0x45
    ]

-- | Specify the XCB library to load for the X11 driver.
--
--     The default is platform-specific, often \"libX11-xcb.so.1\".
--
--     This hint should be set before initializing the video subsystem.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_X11_XCB_LIBRARY@, literal @\"SDL_X11_XCB_LIBRARY\"@, defined at @SDL3\/SDL_hints.h 4652:9@
sDL_HINT_X11_XCB_LIBRARY :: BG.ByteString
sDL_HINT_X11_XCB_LIBRARY =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x58
    , 0x31
    , 0x31
    , 0x5F
    , 0x58
    , 0x43
    , 0x42
    , 0x5F
    , 0x4C
    , 0x49
    , 0x42
    , 0x52
    , 0x41
    , 0x52
    , 0x59
    ]

-- | A variable controlling whether XInput should be used for controller handling.
--
--     The variable can be set to the following values:
--
--     * \"0\": XInput is not enabled.
--
--     * \"1\": XInput is enabled. (default)
--
--     This hint should be set before SDL is initialized.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_XINPUT_ENABLED@, literal @\"SDL_XINPUT_ENABLED\"@, defined at @SDL3\/SDL_hints.h 4667:9@
sDL_HINT_XINPUT_ENABLED :: BG.ByteString
sDL_HINT_XINPUT_ENABLED =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x58
    , 0x49
    , 0x4E
    , 0x50
    , 0x55
    , 0x54
    , 0x5F
    , 0x45
    , 0x4E
    , 0x41
    , 0x42
    , 0x4C
    , 0x45
    , 0x44
    ]

-- | A variable controlling response to SDL_assert failures.
--
--     The variable can be set to the following case-sensitive values:
--
--     * \"abort\": Program terminates immediately.
--
--     * \"break\": Program triggers a debugger breakpoint.
--
--     * \"retry\": Program reruns the SDL_assert\'s test again.
--
--     * \"ignore\": Program continues on, ignoring this assertion failure this time.
--
--     * \"always_ignore\": Program continues on, ignoring this assertion failure for the rest of the run.
--
--     Note that SDL_SetAssertionHandler offers a programmatic means to deal with assertion failures through a callback, and this hint is largely intended to be used via environment variables by end users and automated tools.
--
--     This hint should be set before an assertion failure is triggered and can be changed at any time.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_ASSERT@, literal @\"SDL_ASSERT\"@, defined at @SDL3\/SDL_hints.h 4691:9@
sDL_HINT_ASSERT :: BG.ByteString
sDL_HINT_ASSERT =
  BG.pack [0x53, 0x44, 0x4C, 0x5F, 0x41, 0x53, 0x53, 0x45, 0x52, 0x54]

-- | A variable controlling whether pen events should generate synthetic mouse events.
--
--     The variable can be set to the following values:
--
--     * \"0\": Pen events will not generate mouse events.
--
--     * \"1\": Pen events will generate mouse events. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_PEN_MOUSE_EVENTS@, literal @\"SDL_PEN_MOUSE_EVENTS\"@, defined at @SDL3\/SDL_hints.h 4706:9@
sDL_HINT_PEN_MOUSE_EVENTS :: BG.ByteString
sDL_HINT_PEN_MOUSE_EVENTS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x50
    , 0x45
    , 0x4E
    , 0x5F
    , 0x4D
    , 0x4F
    , 0x55
    , 0x53
    , 0x45
    , 0x5F
    , 0x45
    , 0x56
    , 0x45
    , 0x4E
    , 0x54
    , 0x53
    ]

-- | A variable controlling whether pen events should generate synthetic touch events.
--
--     The variable can be set to the following values:
--
--     * \"0\": Pen events will not generate touch events.
--
--     * \"1\": Pen events will generate touch events. (default)
--
--     This hint can be set anytime.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HINT_PEN_TOUCH_EVENTS@, literal @\"SDL_PEN_TOUCH_EVENTS\"@, defined at @SDL3\/SDL_hints.h 4721:9@
sDL_HINT_PEN_TOUCH_EVENTS :: BG.ByteString
sDL_HINT_PEN_TOUCH_EVENTS =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x5F
    , 0x50
    , 0x45
    , 0x4E
    , 0x5F
    , 0x54
    , 0x4F
    , 0x55
    , 0x43
    , 0x48
    , 0x5F
    , 0x45
    , 0x56
    , 0x45
    , 0x4E
    , 0x54
    , 0x53
    ]

-- | An enumeration of hint priorities.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_HintPriority@, defined at @SDL3\/SDL_hints.h 4728:14@
newtype SDL_HintPriority = SDL_HintPriority
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_HintPriority where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_HintPriority where
  readRaw =
    \ptr0 ->
      pure SDL_HintPriority
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_HintPriority where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_HintPriority unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_HintPriority instance BG.Storable SDL_HintPriority

deriving via BG.CUInt instance BG.Prim SDL_HintPriority

instance CEnum.CEnum SDL_HintPriority where
  type CEnumZ SDL_HintPriority = BG.CUInt

  toCEnum = SDL_HintPriority

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_HINT_DEFAULT")
        , (1, BG.singleton "SDL_HINT_NORMAL")
        , (2, BG.singleton "SDL_HINT_OVERRIDE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_HintPriority"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_HintPriority"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_HintPriority where
  minDeclaredValue = SDL_HINT_DEFAULT

  maxDeclaredValue = SDL_HINT_OVERRIDE

instance Show SDL_HintPriority where
  showsPrec = CEnum.shows

instance Read SDL_HintPriority where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_HintPriority ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HintPriority{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_HintPriority) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_HintPriority "unwrap" where
  type CFieldType SDL_HintPriority "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_HINT_DEFAULT@, defined at @SDL3\/SDL_hints.h 4730:5@
pattern SDL_HINT_DEFAULT :: SDL_HintPriority
pattern SDL_HINT_DEFAULT = SDL_HintPriority 0

-- | [C declaration]: @SDL_HINT_NORMAL@, defined at @SDL3\/SDL_hints.h 4731:5@
pattern SDL_HINT_NORMAL :: SDL_HintPriority
pattern SDL_HINT_NORMAL = SDL_HintPriority 1

-- | [C declaration]: @SDL_HINT_OVERRIDE@, defined at @SDL3\/SDL_hints.h 4732:5@
pattern SDL_HINT_OVERRIDE :: SDL_HintPriority
pattern SDL_HINT_OVERRIDE = SDL_HintPriority 2

-- | Auxiliary type used by 'SDL_HintCallback'
--
--     [C declaration]: @SDL_HintCallback@, defined at @SDL3\/SDL_hints.h 4866:23@
newtype SDL_HintCallback_Aux = SDL_HintCallback_Aux
  { unwrap
      :: BG.Ptr BG.Void
      -> PtrConst.PtrConst BG.CChar
      -> PtrConst.PtrConst BG.CChar
      -> PtrConst.PtrConst BG.CChar
      -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_HintCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_d373a1a98e80dd1f_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toSDL_HintCallback_Aux@
hs_bindgen_d373a1a98e80dd1f
  :: SDL_HintCallback_Aux
  -> IO (BG.FunPtr SDL_HintCallback_Aux)
hs_bindgen_d373a1a98e80dd1f =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_d373a1a98e80dd1f_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_HintCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_52c5a5e7b6578189_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ())
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromSDL_HintCallback_Aux@
hs_bindgen_52c5a5e7b6578189
  :: BG.FunPtr SDL_HintCallback_Aux
  -> SDL_HintCallback_Aux
hs_bindgen_52c5a5e7b6578189 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_52c5a5e7b6578189_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_HintCallback_Aux where
  toFunPtr = hs_bindgen_d373a1a98e80dd1f

instance BG.FromFunPtr SDL_HintCallback_Aux where
  fromFunPtr = hs_bindgen_52c5a5e7b6578189

instance
  ( ty
      ~ ( BG.Ptr BG.Void
          -> PtrConst.PtrConst BG.CChar
          -> PtrConst.PtrConst BG.CChar
          -> PtrConst.PtrConst BG.CChar
          -> IO ()
        )
  )
  => BG.CompatHasField.HasField "unwrap" SDL_HintCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HintCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  ( ty
      ~ ( BG.Ptr BG.Void
          -> PtrConst.PtrConst BG.CChar
          -> PtrConst.PtrConst BG.CChar
          -> PtrConst.PtrConst BG.CChar
          -> IO ()
        )
  )
  => BG.HasField "unwrap" (BG.Ptr SDL_HintCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_HintCallback_Aux "unwrap" where
  type
    CFieldType SDL_HintCallback_Aux "unwrap" =
      BG.Ptr BG.Void
      -> PtrConst.PtrConst BG.CChar
      -> PtrConst.PtrConst BG.CChar
      -> PtrConst.PtrConst BG.CChar
      -> IO ()

  offset# = \_ -> \_ -> 0

-- | A callback used to send notifications of hint value changes.
--
--     This is called an initial time during SDL_AddHintCallback with the hint\'s current value, and then again each time the hint\'s value changes.
--
--     [@userdata@]: what was passed as @userdata@ to @SDL_AddHintCallback()@.
--
--     [@name@]: what was passed as @name@ to @SDL_AddHintCallback()@.
--
--     [@oldValue@]: the previous hint value.
--
--     [@newValue@]: the new value hint is to be set to.
--
--     [Thread safety]: This callback is fired from whatever thread is setting a new hint value. SDL holds a lock on the hint subsystem when calling this callback.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddHintCallback'
--
--     [C declaration]: @SDL_HintCallback@, defined at @SDL3\/SDL_hints.h 4866:23@
newtype SDL_HintCallback = SDL_HintCallback
  { unwrap :: BG.FunPtr SDL_HintCallback_Aux
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.FunPtr SDL_HintCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_HintCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HintCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_HintCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_HintCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_HintCallback "unwrap" where
  type
    CFieldType SDL_HintCallback "unwrap" =
      BG.FunPtr SDL_HintCallback_Aux

  offset# = \_ -> \_ -> 0

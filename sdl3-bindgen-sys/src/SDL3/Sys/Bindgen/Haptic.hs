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
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | The SDL haptic subsystem manages haptic (force feedback) devices.
--
--     The basic usage is as follows:
--
--     * Initialize the subsystem (SDL_INIT_HAPTIC).
--
--     * Open a haptic device.
--
--     * @SDL_OpenHaptic()@ to open from index.
--
--     * @SDL_OpenHapticFromJoystick()@ to open from an existing joystick.
--
--     * Create an effect ('SDL_HapticEffect').
--
--     * Upload the effect with @SDL_CreateHapticEffect()@.
--
--     * Run the effect with @SDL_RunHapticEffect()@.
--
--     * (optional) Free the effect with @SDL_DestroyHapticEffect()@.
--
--     * Close the haptic device with @SDL_CloseHaptic()@.
--
--     Simple rumble example:
--
--     @
--     SDL_Haptic *haptic = NULL;
--
--     \/\/ Open the device
--     SDL_HapticID *haptics = SDL_GetHaptics(NULL);
--     if (haptics) {
--         haptic = SDL_OpenHaptic(haptics[0]);
--         SDL_free(haptics);
--     }
--     if (haptic == NULL)
--        return;
--
--     \/\/ Initialize simple rumble
--     if (!SDL_InitHapticRumble(haptic))
--        return;
--
--     \/\/ Play effect at 50% strength for 2 seconds
--     if (!SDL_PlayHapticRumble(haptic, 0.5, 2000))
--        return;
--     SDL_Delay(2000);
--
--     \/\/ Clean up
--     SDL_CloseHaptic(haptic);
--     @
--
--     Complete example:
--
--     @
--     bool test_haptic(SDL_Joystick *joystick)
--     {
--        SDL_Haptic *haptic;
--        SDL_HapticEffect effect;
--        SDL_HapticEffectID effect_id;
--
--        \/\/ Open the device
--        haptic = SDL_OpenHapticFromJoystick(joystick);
--        if (haptic == NULL) return false; \/\/ Most likely joystick isn\'t haptic
--
--        \/\/ See if it can do sine waves
--        if ((SDL_GetHapticFeatures(haptic) & SDL_HAPTIC_SINE)==0) {
--           SDL_CloseHaptic(haptic); \/\/ No sine effect
--           return false;
--        }
--
--        \/\/ Create the effect
--        SDL_memset(&effect, 0, sizeof(SDL_HapticEffect)); \/\/ 0 is safe default
--        effect.type = SDL_HAPTIC_SINE;
--        effect.periodic.direction.type = SDL_HAPTIC_POLAR; \/\/ Polar coordinates
--        effect.periodic.direction.dir[0] = 18000; \/\/ Force comes from south
--        effect.periodic.period = 1000; \/\/ 1000 ms
--        effect.periodic.magnitude = 20000; \/\/ 20000\/32767 strength
--        effect.periodic.length = 5000; \/\/ 5 seconds long
--        effect.periodic.attack_length = 1000; \/\/ Takes 1 second to get max strength
--        effect.periodic.fade_length = 1000; \/\/ Takes 1 second to fade away
--
--        \/\/ Upload the effect
--        effect_id = SDL_CreateHapticEffect(haptic, &effect);
--
--        \/\/ Test the effect
--        SDL_RunHapticEffect(haptic, effect_id, 1);
--        SDL_Delay(5000); \/\/ Wait for the effect to finish
--
--        \/\/ We destroy the effect, although closing the device also does this
--        SDL_DestroyHapticEffect(haptic, effect_id);
--
--        \/\/ Close the device
--        SDL_CloseHaptic(haptic);
--
--        return true; \/\/ Success
--     }
--     @
--
--     Note that the SDL haptic subsystem is not thread-safe. The haptic structure used to identify an SDL haptic.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenHaptic', 'sDL_OpenHapticFromJoystick', 'sDL_CloseHaptic'
module SDL3.Sys.Bindgen.Haptic (
  SDL3.Sys.Bindgen.Haptic.SDL_Haptic,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_INFINITY,
  SDL3.Sys.Bindgen.Haptic.SDL_HapticEffectType (..),
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_CONSTANT,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_SINE,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_SQUARE,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_TRIANGLE,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_SAWTOOTHUP,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_SAWTOOTHDOWN,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_RAMP,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_SPRING,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_DAMPER,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_INERTIA,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_FRICTION,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_LEFTRIGHT,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_RESERVED1,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_RESERVED2,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_RESERVED3,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_CUSTOM,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_GAIN,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_AUTOCENTER,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_STATUS,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_PAUSE,
  SDL3.Sys.Bindgen.Haptic.SDL_HapticDirectionType (..),
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_POLAR,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_CARTESIAN,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_SPHERICAL,
  SDL3.Sys.Bindgen.Haptic.sDL_HAPTIC_STEERING_AXIS,
  SDL3.Sys.Bindgen.Haptic.SDL_HapticEffectID (..),
  SDL3.Sys.Bindgen.Haptic.SDL_HapticDirection (..),
  SDL3.Sys.Bindgen.Haptic.SDL_HapticConstant (..),
  SDL3.Sys.Bindgen.Haptic.SDL_HapticPeriodic (..),
  SDL3.Sys.Bindgen.Haptic.SDL_HapticCondition (..),
  SDL3.Sys.Bindgen.Haptic.SDL_HapticRamp (..),
  SDL3.Sys.Bindgen.Haptic.SDL_HapticLeftRight (..),
  SDL3.Sys.Bindgen.Haptic.SDL_HapticCustom (..),
  SDL3.Sys.Bindgen.Haptic.SDL_HapticEffect (..),
  SDL3.Sys.Bindgen.Haptic.SDL_HapticID (..),
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.ConstantArray qualified as CA
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import HsBindgen.Runtime.Union qualified as Union
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @struct SDL_Haptic@, defined at @SDL3\/SDL_haptic.h 150:16@
data SDL_Haptic

-- | Used to play a device an infinite number of times.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RunHapticEffect'
--
--     [C declaration]: @macro SDL_HAPTIC_INFINITY@, defined at @SDL3\/SDL_haptic.h 163:9@
sDL_HAPTIC_INFINITY :: BG.CUInt
sDL_HAPTIC_INFINITY = (4294967295 :: BG.CUInt)

-- | Type of haptic effect.
--
--     [C declaration]: @SDL_HapticEffectType@, defined at @SDL3\/SDL_haptic.h 181:16@
newtype SDL_HapticEffectType = SDL_HapticEffectType
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint16
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "unwrap" SDL_HapticEffectType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticEffectType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "unwrap" (BG.Ptr SDL_HapticEffectType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_HapticEffectType "unwrap" where
  type
    CFieldType SDL_HapticEffectType "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 0

-- | Constant effect supported.
--
--     Constant haptic effect.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticCondition'
--
--     [C declaration]: @macro SDL_HAPTIC_CONSTANT@, defined at @SDL3\/SDL_haptic.h 192:9@
sDL_HAPTIC_CONSTANT :: BG.CUInt
sDL_HAPTIC_CONSTANT =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (0 :: BG.CInt)

-- | Sine wave effect supported.
--
--     Periodic haptic effect that simulates sine waves.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticPeriodic'
--
--     [C declaration]: @macro SDL_HAPTIC_SINE@, defined at @SDL3\/SDL_haptic.h 203:9@
sDL_HAPTIC_SINE :: BG.CUInt
sDL_HAPTIC_SINE =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (1 :: BG.CInt)

-- | Square wave effect supported.
--
--     Periodic haptic effect that simulates square waves.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticPeriodic'
--
--     [C declaration]: @macro SDL_HAPTIC_SQUARE@, defined at @SDL3\/SDL_haptic.h 214:9@
sDL_HAPTIC_SQUARE :: BG.CUInt
sDL_HAPTIC_SQUARE =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (2 :: BG.CInt)

-- | Triangle wave effect supported.
--
--     Periodic haptic effect that simulates triangular waves.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticPeriodic'
--
--     [C declaration]: @macro SDL_HAPTIC_TRIANGLE@, defined at @SDL3\/SDL_haptic.h 225:9@
sDL_HAPTIC_TRIANGLE :: BG.CUInt
sDL_HAPTIC_TRIANGLE =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (3 :: BG.CInt)

-- | Sawtoothup wave effect supported.
--
--     Periodic haptic effect that simulates saw tooth up waves.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticPeriodic'
--
--     [C declaration]: @macro SDL_HAPTIC_SAWTOOTHUP@, defined at @SDL3\/SDL_haptic.h 236:9@
sDL_HAPTIC_SAWTOOTHUP :: BG.CUInt
sDL_HAPTIC_SAWTOOTHUP =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (4 :: BG.CInt)

-- | Sawtoothdown wave effect supported.
--
--     Periodic haptic effect that simulates saw tooth down waves.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticPeriodic'
--
--     [C declaration]: @macro SDL_HAPTIC_SAWTOOTHDOWN@, defined at @SDL3\/SDL_haptic.h 247:9@
sDL_HAPTIC_SAWTOOTHDOWN :: BG.CUInt
sDL_HAPTIC_SAWTOOTHDOWN =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (5 :: BG.CInt)

-- | Ramp effect supported.
--
--     Ramp haptic effect.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticRamp'
--
--     [C declaration]: @macro SDL_HAPTIC_RAMP@, defined at @SDL3\/SDL_haptic.h 258:9@
sDL_HAPTIC_RAMP :: BG.CUInt
sDL_HAPTIC_RAMP =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (6 :: BG.CInt)

-- | Spring effect supported - uses axes position.
--
--     Condition haptic effect that simulates a spring. Effect is based on the axes position.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticCondition'
--
--     [C declaration]: @macro SDL_HAPTIC_SPRING@, defined at @SDL3\/SDL_haptic.h 270:9@
sDL_HAPTIC_SPRING :: BG.CUInt
sDL_HAPTIC_SPRING =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (7 :: BG.CInt)

-- | Damper effect supported - uses axes velocity.
--
--     Condition haptic effect that simulates dampening. Effect is based on the axes velocity.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticCondition'
--
--     [C declaration]: @macro SDL_HAPTIC_DAMPER@, defined at @SDL3\/SDL_haptic.h 282:9@
sDL_HAPTIC_DAMPER :: BG.CUInt
sDL_HAPTIC_DAMPER =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (8 :: BG.CInt)

-- | Inertia effect supported - uses axes acceleration.
--
--     Condition haptic effect that simulates inertia. Effect is based on the axes acceleration.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticCondition'
--
--     [C declaration]: @macro SDL_HAPTIC_INERTIA@, defined at @SDL3\/SDL_haptic.h 294:9@
sDL_HAPTIC_INERTIA :: BG.CUInt
sDL_HAPTIC_INERTIA =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (9 :: BG.CInt)

-- | Friction effect supported - uses axes movement.
--
--     Condition haptic effect that simulates friction. Effect is based on the axes movement.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticCondition'
--
--     [C declaration]: @macro SDL_HAPTIC_FRICTION@, defined at @SDL3\/SDL_haptic.h 306:9@
sDL_HAPTIC_FRICTION :: BG.CUInt
sDL_HAPTIC_FRICTION =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (10 :: BG.CInt)

-- | Left\/Right effect supported.
--
--     Haptic effect for direct control over high\/low frequency motors.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticLeftRight'
--
--     [C declaration]: @macro SDL_HAPTIC_LEFTRIGHT@, defined at @SDL3\/SDL_haptic.h 317:9@
sDL_HAPTIC_LEFTRIGHT :: BG.CUInt
sDL_HAPTIC_LEFTRIGHT =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (11 :: BG.CInt)

-- | Reserved for future use.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HAPTIC_RESERVED1@, defined at @SDL3\/SDL_haptic.h 324:9@
sDL_HAPTIC_RESERVED1 :: BG.CUInt
sDL_HAPTIC_RESERVED1 =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (12 :: BG.CInt)

-- | Reserved for future use.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HAPTIC_RESERVED2@, defined at @SDL3\/SDL_haptic.h 331:9@
sDL_HAPTIC_RESERVED2 :: BG.CUInt
sDL_HAPTIC_RESERVED2 =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (13 :: BG.CInt)

-- | Reserved for future use.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HAPTIC_RESERVED3@, defined at @SDL3\/SDL_haptic.h 338:9@
sDL_HAPTIC_RESERVED3 :: BG.CUInt
sDL_HAPTIC_RESERVED3 =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (14 :: BG.CInt)

-- | Custom effect is supported.
--
--     User defined custom haptic effect.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_HAPTIC_CUSTOM@, defined at @SDL3\/SDL_haptic.h 347:9@
sDL_HAPTIC_CUSTOM :: BG.CUInt
sDL_HAPTIC_CUSTOM =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (15 :: BG.CInt)

-- | Device can set global gain.
--
--     Device supports setting the global gain.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetHapticGain'
--
--     [C declaration]: @macro SDL_HAPTIC_GAIN@, defined at @SDL3\/SDL_haptic.h 362:9@
sDL_HAPTIC_GAIN :: BG.CUInt
sDL_HAPTIC_GAIN =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (16 :: BG.CInt)

-- | Device can set autocenter.
--
--     Device supports setting autocenter.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetHapticAutocenter'
--
--     [C declaration]: @macro SDL_HAPTIC_AUTOCENTER@, defined at @SDL3\/SDL_haptic.h 373:9@
sDL_HAPTIC_AUTOCENTER :: BG.CUInt
sDL_HAPTIC_AUTOCENTER =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (17 :: BG.CInt)

-- | Device can be queried for effect status.
--
--     Device supports querying effect status.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetHapticEffectStatus'
--
--     [C declaration]: @macro SDL_HAPTIC_STATUS@, defined at @SDL3\/SDL_haptic.h 384:9@
sDL_HAPTIC_STATUS :: BG.CUInt
sDL_HAPTIC_STATUS =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (18 :: BG.CInt)

-- | Device can be paused.
--
--     Devices supports being paused.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PauseHaptic', 'sDL_ResumeHaptic'
--
--     [C declaration]: @macro SDL_HAPTIC_PAUSE@, defined at @SDL3\/SDL_haptic.h 396:9@
sDL_HAPTIC_PAUSE :: BG.CUInt
sDL_HAPTIC_PAUSE =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (19 :: BG.CInt)

-- | Type of coordinates used for haptic direction.
--
--     [C declaration]: @SDL_HapticDirectionType@, defined at @SDL3\/SDL_haptic.h 407:15@
newtype SDL_HapticDirectionType = SDL_HapticDirectionType
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint8
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "unwrap" SDL_HapticDirectionType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticDirectionType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "unwrap" (BG.Ptr SDL_HapticDirectionType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_HapticDirectionType "unwrap" where
  type
    CFieldType SDL_HapticDirectionType "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 0

-- | Uses polar coordinates for the direction.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticDirection'
--
--     [C declaration]: @macro SDL_HAPTIC_POLAR@, defined at @SDL3\/SDL_haptic.h 416:9@
sDL_HAPTIC_POLAR :: BG.CInt
sDL_HAPTIC_POLAR = (0 :: BG.CInt)

-- | Uses cartesian coordinates for the direction.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticDirection'
--
--     [C declaration]: @macro SDL_HAPTIC_CARTESIAN@, defined at @SDL3\/SDL_haptic.h 425:9@
sDL_HAPTIC_CARTESIAN :: BG.CInt
sDL_HAPTIC_CARTESIAN = (1 :: BG.CInt)

-- | Uses spherical coordinates for the direction.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticDirection'
--
--     [C declaration]: @macro SDL_HAPTIC_SPHERICAL@, defined at @SDL3\/SDL_haptic.h 434:9@
sDL_HAPTIC_SPHERICAL :: BG.CInt
sDL_HAPTIC_SPHERICAL = (2 :: BG.CInt)

-- | Use this value to play an effect on the steering wheel axis.
--
--     This provides better compatibility across platforms and devices as SDL will guess the correct axis.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticDirection'
--
--     [C declaration]: @macro SDL_HAPTIC_STEERING_AXIS@, defined at @SDL3\/SDL_haptic.h 446:9@
sDL_HAPTIC_STEERING_AXIS :: BG.CInt
sDL_HAPTIC_STEERING_AXIS = (3 :: BG.CInt)

-- | ID for haptic effects.
--
--     This is -1 if the ID is invalid.
--
--     [See also]: 'sDL_CreateHapticEffect'
--
--     [C declaration]: @SDL_HapticEffectID@, defined at @SDL3\/SDL_haptic.h 460:13@
newtype SDL_HapticEffectID = SDL_HapticEffectID
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_HapticEffectID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticEffectID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_HapticEffectID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_HapticEffectID "unwrap" where
  type CFieldType SDL_HapticEffectID "unwrap" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | Structure that represents a haptic direction.
--
--     This is the direction where the force comes from, instead of the direction in which the force is exerted.
--
--     Directions can be specified by:
--
--     * SDL_HAPTIC_POLAR : Specified by polar coordinates.
--
--     * SDL_HAPTIC_CARTESIAN : Specified by cartesian coordinates.
--
--     * SDL_HAPTIC_SPHERICAL : Specified by spherical coordinates.
--
--     Cardinal directions of the haptic device are relative to the positioning of the device. North is considered to be away from the user.
--
--     The following diagram represents the cardinal directions:
--
--     @
--                   .--.
--                   |__| .-------.
--                   |=.| |.-----.|
--                   |--| ||     ||
--                   |  | |\'-----\'|
--                   |__|~\')_____(\'
--                     [ COMPUTER ]
--
--
--                       North (0,-1)
--                           ^
--                           |
--                           |
--     (-1,0)  West \<----[ HAPTIC ]----> East (1,0)
--                           |
--                           |
--                           v
--                        South (0,1)
--
--
--                        [ USER ]
--                          \\|||\/
--                          (o o)
--                    ---ooO-(_)-Ooo---
--     @
--
--     If type is SDL_HAPTIC_POLAR, direction is encoded by hundredths of a degree starting north and turning clockwise. SDL_HAPTIC_POLAR only uses the first @dir@ parameter. The cardinal directions would be:
--
--     * North: 0 (0 degrees)
--
--     * East: 9000 (90 degrees)
--
--     * South: 18000 (180 degrees)
--
--     * West: 27000 (270 degrees)
--
--     If type is SDL_HAPTIC_CARTESIAN, direction is encoded by three positions (X axis, Y axis and Z axis (with 3 axes)). SDL_HAPTIC_CARTESIAN uses the first three @dir@ parameters. The cardinal directions would be:
--
--     * North: 0,-1, 0
--
--     * East: 1, 0, 0
--
--     * South: 0, 1, 0
--
--     * West: -1, 0, 0
--
--     The Z axis represents the height of the effect if supported, otherwise it\'s unused. In cartesian encoding (1, 2) would be the same as (2, 4), you can use any multiple you want, only the direction matters.
--
--     If type is SDL_HAPTIC_SPHERICAL, direction is encoded by two rotations. The first two @dir@ parameters are used. The @dir@ parameters are as follows (all values are in hundredths of degrees):
--
--     * Degrees from (1, 0) rotated towards (0, 1).
--
--     * Degrees towards (0, 0, 1) (device needs at least 3 axes).
--
--     Example of force coming from the south with all encodings (force coming from the south means the user will have to pull the stick to counteract):
--
--     @
--     SDL_HapticDirection direction;
--
--     \/\/ Cartesian directions
--     direction.type = SDL_HAPTIC_CARTESIAN; \/\/ Using cartesian direction encoding.
--     direction.dir[0] = 0; \/\/ X position
--     direction.dir[1] = 1; \/\/ Y position
--     \/\/ Assuming the device has 2 axes, we don\'t need to specify third parameter.
--
--     \/\/ Polar directions
--     direction.type = SDL_HAPTIC_POLAR; \/\/ We\'ll be using polar direction encoding.
--     direction.dir[0] = 18000; \/\/ Polar only uses first parameter
--
--     \/\/ Spherical coordinates
--     direction.type = SDL_HAPTIC_SPHERICAL; \/\/ Spherical encoding
--     direction.dir[0] = 9000; \/\/ Since we only have two axes we don\'t need more parameters.
--     @
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HAPTIC_POLAR', 'sDL_HAPTIC_CARTESIAN', 'sDL_HAPTIC_SPHERICAL', 'sDL_HAPTIC_STEERING_AXIS', 'SDL_HapticEffect', 'sDL_GetNumHapticAxes'
--
--     [C declaration]: @struct SDL_HapticDirection@, defined at @SDL3\/SDL_haptic.h 566:16@
data SDL_HapticDirection = SDL_HapticDirection
  { type' :: SDL_HapticDirectionType
  -- ^ The type of encoding.
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_haptic.h 568:29@
  , dir :: CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The encoded direction.
  --
  --          [C declaration]: @dir@, defined at @SDL3\/SDL_haptic.h 569:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_HapticDirection where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_HapticDirection where
  readRaw =
    \ptr0 ->
      pure SDL_HapticDirection
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"dir") ptr0

instance Marshal.WriteRaw SDL_HapticDirection where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_HapticDirection type'2 dir3 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"dir") ptr0 dir3

deriving via Marshal.EquivStorable SDL_HapticDirection instance BG.Storable SDL_HapticDirection

instance
  (ty ~ SDL_HapticDirectionType)
  => BG.CompatHasField.HasField "type'" SDL_HapticDirection ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticDirection{type' = y1, dir = BG.getField @"dir" x0}
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_HapticDirectionType)
  => BG.HasField "type'" (BG.Ptr SDL_HapticDirection) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_HapticDirection "type'" where
  type
    CFieldType SDL_HapticDirection "type'" =
      SDL_HapticDirectionType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "dir" SDL_HapticDirection ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticDirection{dir = y1, type' = BG.getField @"type'" x0}
      , BG.getField @"dir" x0
      )

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "dir" (BG.Ptr SDL_HapticDirection) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"dir")

instance HasCField.HasCField SDL_HapticDirection "dir" where
  type
    CFieldType SDL_HapticDirection "dir" =
      CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 4

-- | A structure containing a template for a Constant effect.
--
--     This struct is exclusively for the SDL_HAPTIC_CONSTANT effect.
--
--     A constant effect applies a constant force in the specified direction to the joystick.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HAPTIC_CONSTANT', 'SDL_HapticEffect'
--
--     [C declaration]: @struct SDL_HapticConstant@, defined at @SDL3\/SDL_haptic.h 586:16@
data SDL_HapticConstant = SDL_HapticConstant
  { type' :: SDL_HapticEffectType
  -- ^ SDL_HAPTIC_CONSTANT
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_haptic.h 589:26@
  , direction :: SDL_HapticDirection
  -- ^ Direction of the effect.
  --
  --          [C declaration]: @direction@, defined at @SDL3\/SDL_haptic.h 590:25@
  , length :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ Duration of the effect.
  --
  --          [C declaration]: @length@, defined at @SDL3\/SDL_haptic.h 593:12@
  , delay :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Delay before starting the effect.
  --
  --          [C declaration]: @delay@, defined at @SDL3\/SDL_haptic.h 594:12@
  , button :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Button that triggers the effect.
  --
  --          [C declaration]: @button@, defined at @SDL3\/SDL_haptic.h 597:12@
  , interval :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ How soon it can be triggered again after button.
  --
  --          [C declaration]: @interval@, defined at @SDL3\/SDL_haptic.h 598:12@
  , level :: SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^ Strength of the constant effect.
  --
  --          [C declaration]: @level@, defined at @SDL3\/SDL_haptic.h 601:12@
  , attack_length :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Duration of the attack.
  --
  --          [C declaration]: @attack_length@, defined at @SDL3\/SDL_haptic.h 604:12@
  , attack_level :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Level at the start of the attack.
  --
  --          [C declaration]: @attack_level@, defined at @SDL3\/SDL_haptic.h 605:12@
  , fade_length :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Duration of the fade.
  --
  --          [C declaration]: @fade_length@, defined at @SDL3\/SDL_haptic.h 606:12@
  , fade_level :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Level at the end of the fade.
  --
  --          [C declaration]: @fade_level@, defined at @SDL3\/SDL_haptic.h 607:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_HapticConstant where
  staticSizeOf = \_ -> (40 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_HapticConstant where
  readRaw =
    \ptr0 ->
      pure SDL_HapticConstant
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"direction") ptr0
        <*> HasCField.readRaw (BG.Proxy @"length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"delay") ptr0
        <*> HasCField.readRaw (BG.Proxy @"button") ptr0
        <*> HasCField.readRaw (BG.Proxy @"interval") ptr0
        <*> HasCField.readRaw (BG.Proxy @"level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"attack_length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"attack_level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"fade_length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"fade_level") ptr0

instance Marshal.WriteRaw SDL_HapticConstant where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_HapticConstant
            type'2
            direction3
            length4
            delay5
            button6
            interval7
            level8
            attack_length9
            attack_level10
            fade_length11
            fade_level12 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"direction") ptr0 direction3
                >> HasCField.writeRaw (BG.Proxy @"length") ptr0 length4
                >> HasCField.writeRaw (BG.Proxy @"delay") ptr0 delay5
                >> HasCField.writeRaw (BG.Proxy @"button") ptr0 button6
                >> HasCField.writeRaw (BG.Proxy @"interval") ptr0 interval7
                >> HasCField.writeRaw (BG.Proxy @"level") ptr0 level8
                >> HasCField.writeRaw (BG.Proxy @"attack_length") ptr0 attack_length9
                >> HasCField.writeRaw (BG.Proxy @"attack_level") ptr0 attack_level10
                >> HasCField.writeRaw (BG.Proxy @"fade_length") ptr0 fade_length11
                >> HasCField.writeRaw (BG.Proxy @"fade_level") ptr0 fade_level12

deriving via Marshal.EquivStorable SDL_HapticConstant instance BG.Storable SDL_HapticConstant

instance
  (ty ~ SDL_HapticEffectType)
  => BG.CompatHasField.HasField "type'" SDL_HapticConstant ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticConstant
            { type' = y1
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , level = BG.getField @"level" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_HapticEffectType)
  => BG.HasField "type'" (BG.Ptr SDL_HapticConstant) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_HapticConstant "type'" where
  type
    CFieldType SDL_HapticConstant "type'" =
      SDL_HapticEffectType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_HapticDirection)
  => BG.CompatHasField.HasField "direction" SDL_HapticConstant ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticConstant
            { direction = y1
            , type' = BG.getField @"type'" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , level = BG.getField @"level" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"direction" x0
      )

instance
  (ty ~ SDL_HapticDirection)
  => BG.HasField "direction" (BG.Ptr SDL_HapticConstant) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"direction")

instance HasCField.HasCField SDL_HapticConstant "direction" where
  type
    CFieldType SDL_HapticConstant "direction" =
      SDL_HapticDirection

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "length" SDL_HapticConstant ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticConstant
            { length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , level = BG.getField @"level" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "length" (BG.Ptr SDL_HapticConstant) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"length")

instance HasCField.HasCField SDL_HapticConstant "length" where
  type
    CFieldType SDL_HapticConstant "length" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "delay" SDL_HapticConstant ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticConstant
            { delay = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , level = BG.getField @"level" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"delay" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "delay" (BG.Ptr SDL_HapticConstant) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"delay")

instance HasCField.HasCField SDL_HapticConstant "delay" where
  type
    CFieldType SDL_HapticConstant "delay" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "button" SDL_HapticConstant ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticConstant
            { button = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , interval = BG.getField @"interval" x0
            , level = BG.getField @"level" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"button" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "button" (BG.Ptr SDL_HapticConstant) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"button")

instance HasCField.HasCField SDL_HapticConstant "button" where
  type
    CFieldType SDL_HapticConstant "button" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 26

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "interval" SDL_HapticConstant ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticConstant
            { interval = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , level = BG.getField @"level" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"interval" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "interval" (BG.Ptr SDL_HapticConstant) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"interval")

instance HasCField.HasCField SDL_HapticConstant "interval" where
  type
    CFieldType SDL_HapticConstant "interval" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.CompatHasField.HasField "level" SDL_HapticConstant ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticConstant
            { level = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.HasField "level" (BG.Ptr SDL_HapticConstant) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"level")

instance HasCField.HasCField SDL_HapticConstant "level" where
  type
    CFieldType SDL_HapticConstant "level" =
      SDL3.Sys.Bindgen.Stdinc.Sint16

  offset# = \_ -> \_ -> 30

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "attack_length" SDL_HapticConstant ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticConstant
            { attack_length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , level = BG.getField @"level" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"attack_length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "attack_length" (BG.Ptr SDL_HapticConstant) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"attack_length")

instance HasCField.HasCField SDL_HapticConstant "attack_length" where
  type
    CFieldType SDL_HapticConstant "attack_length" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "attack_level" SDL_HapticConstant ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticConstant
            { attack_level = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , level = BG.getField @"level" x0
            , attack_length = BG.getField @"attack_length" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"attack_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "attack_level" (BG.Ptr SDL_HapticConstant) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"attack_level")

instance HasCField.HasCField SDL_HapticConstant "attack_level" where
  type
    CFieldType SDL_HapticConstant "attack_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 34

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "fade_length" SDL_HapticConstant ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticConstant
            { fade_length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , level = BG.getField @"level" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"fade_length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "fade_length" (BG.Ptr SDL_HapticConstant) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"fade_length")

instance HasCField.HasCField SDL_HapticConstant "fade_length" where
  type
    CFieldType SDL_HapticConstant "fade_length" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 36

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "fade_level" SDL_HapticConstant ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticConstant
            { fade_level = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , level = BG.getField @"level" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            }
      , BG.getField @"fade_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "fade_level" (BG.Ptr SDL_HapticConstant) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"fade_level")

instance HasCField.HasCField SDL_HapticConstant "fade_level" where
  type
    CFieldType SDL_HapticConstant "fade_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 38

-- | A structure containing a template for a Periodic effect.
--
--     The struct handles the following effects:
--
--     * SDL_HAPTIC_SINE
--
--     * SDL_HAPTIC_SQUARE
--
--     * SDL_HAPTIC_TRIANGLE
--
--     * SDL_HAPTIC_SAWTOOTHUP
--
--     * SDL_HAPTIC_SAWTOOTHDOWN
--
--     A periodic effect consists in a wave-shaped effect that repeats itself over time. The type determines the shape of the wave and the parameters determine the dimensions of the wave.
--
--     Phase is given by hundredth of a degree meaning that giving the phase a value of 9000 will displace it 25% of its period. Here are sample values:
--
--     * 0: No phase displacement.
--
--     * 9000: Displaced 25% of its period.
--
--     * 18000: Displaced 50% of its period.
--
--     * 27000: Displaced 75% of its period.
--
--     * 36000: Displaced 100% of its period, same as 0, but 0 is preferred.
--
--     Examples:
--
--     @
--     SDL_HAPTIC_SINE
--       __      __      __      __
--      \/  \\    \/  \\    \/  \\    \/
--     \/    \\__\/    \\__\/    \\__\/
--
--     SDL_HAPTIC_SQUARE
--      __    __    __    __    __
--     |  |  |  |  |  |  |  |  |  |
--     |  |__|  |__|  |__|  |__|  |
--
--     SDL_HAPTIC_TRIANGLE
--       \/\\    \/\\    \/\\    \/\\    \/\\
--      \/  \\  \/  \\  \/  \\  \/  \\  \/
--     \/    \\\/    \\\/    \\\/    \\\/
--
--     SDL_HAPTIC_SAWTOOTHUP
--       \/|  \/|  \/|  \/|  \/|  \/|  \/|
--      \/ | \/ | \/ | \/ | \/ | \/ | \/ |
--     \/  |\/  |\/  |\/  |\/  |\/  |\/  |
--
--     SDL_HAPTIC_SAWTOOTHDOWN
--     \\  |\\  |\\  |\\  |\\  |\\  |\\  |
--      \\ | \\ | \\ | \\ | \\ | \\ | \\ |
--       \\|  \\|  \\|  \\|  \\|  \\|  \\|
--     @
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HAPTIC_SINE', 'sDL_HAPTIC_SQUARE', 'sDL_HAPTIC_TRIANGLE', 'sDL_HAPTIC_SAWTOOTHUP', 'sDL_HAPTIC_SAWTOOTHDOWN', 'SDL_HapticEffect'
--
--     [C declaration]: @struct SDL_HapticPeriodic@, defined at @SDL3\/SDL_haptic.h 672:16@
data SDL_HapticPeriodic = SDL_HapticPeriodic
  { type' :: SDL_HapticEffectType
  -- ^ SDL_HAPTIC_SINE, SDL_HAPTIC_SQUARE SDL_HAPTIC_TRIANGLE, SDL_HAPTIC_SAWTOOTHUP or SDL_HAPTIC_SAWTOOTHDOWN
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_haptic.h 675:26@
  , direction :: SDL_HapticDirection
  -- ^ Direction of the effect.
  --
  --          [C declaration]: @direction@, defined at @SDL3\/SDL_haptic.h 678:25@
  , length :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ Duration of the effect.
  --
  --          [C declaration]: @length@, defined at @SDL3\/SDL_haptic.h 681:12@
  , delay :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Delay before starting the effect.
  --
  --          [C declaration]: @delay@, defined at @SDL3\/SDL_haptic.h 682:12@
  , button :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Button that triggers the effect.
  --
  --          [C declaration]: @button@, defined at @SDL3\/SDL_haptic.h 685:12@
  , interval :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ How soon it can be triggered again after button.
  --
  --          [C declaration]: @interval@, defined at @SDL3\/SDL_haptic.h 686:12@
  , period :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Period of the wave.
  --
  --          [C declaration]: @period@, defined at @SDL3\/SDL_haptic.h 689:12@
  , magnitude :: SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^ Peak value; if negative, equivalent to 180 degrees extra phase shift.
  --
  --          [C declaration]: @magnitude@, defined at @SDL3\/SDL_haptic.h 690:12@
  , offset :: SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^ Mean value of the wave.
  --
  --          [C declaration]: @offset@, defined at @SDL3\/SDL_haptic.h 691:12@
  , phase :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Positive phase shift given by hundredth of a degree.
  --
  --          [C declaration]: @phase@, defined at @SDL3\/SDL_haptic.h 692:12@
  , attack_length :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Duration of the attack.
  --
  --          [C declaration]: @attack_length@, defined at @SDL3\/SDL_haptic.h 695:12@
  , attack_level :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Level at the start of the attack.
  --
  --          [C declaration]: @attack_level@, defined at @SDL3\/SDL_haptic.h 696:12@
  , fade_length :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Duration of the fade.
  --
  --          [C declaration]: @fade_length@, defined at @SDL3\/SDL_haptic.h 697:12@
  , fade_level :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Level at the end of the fade.
  --
  --          [C declaration]: @fade_level@, defined at @SDL3\/SDL_haptic.h 698:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_HapticPeriodic where
  staticSizeOf = \_ -> (48 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_HapticPeriodic where
  readRaw =
    \ptr0 ->
      pure SDL_HapticPeriodic
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"direction") ptr0
        <*> HasCField.readRaw (BG.Proxy @"length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"delay") ptr0
        <*> HasCField.readRaw (BG.Proxy @"button") ptr0
        <*> HasCField.readRaw (BG.Proxy @"interval") ptr0
        <*> HasCField.readRaw (BG.Proxy @"period") ptr0
        <*> HasCField.readRaw (BG.Proxy @"magnitude") ptr0
        <*> HasCField.readRaw (BG.Proxy @"offset") ptr0
        <*> HasCField.readRaw (BG.Proxy @"phase") ptr0
        <*> HasCField.readRaw (BG.Proxy @"attack_length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"attack_level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"fade_length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"fade_level") ptr0

instance Marshal.WriteRaw SDL_HapticPeriodic where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_HapticPeriodic
            type'2
            direction3
            length4
            delay5
            button6
            interval7
            period8
            magnitude9
            offset10
            phase11
            attack_length12
            attack_level13
            fade_length14
            fade_level15 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"direction") ptr0 direction3
                >> HasCField.writeRaw (BG.Proxy @"length") ptr0 length4
                >> HasCField.writeRaw (BG.Proxy @"delay") ptr0 delay5
                >> HasCField.writeRaw (BG.Proxy @"button") ptr0 button6
                >> HasCField.writeRaw (BG.Proxy @"interval") ptr0 interval7
                >> HasCField.writeRaw (BG.Proxy @"period") ptr0 period8
                >> HasCField.writeRaw (BG.Proxy @"magnitude") ptr0 magnitude9
                >> HasCField.writeRaw (BG.Proxy @"offset") ptr0 offset10
                >> HasCField.writeRaw (BG.Proxy @"phase") ptr0 phase11
                >> HasCField.writeRaw (BG.Proxy @"attack_length") ptr0 attack_length12
                >> HasCField.writeRaw (BG.Proxy @"attack_level") ptr0 attack_level13
                >> HasCField.writeRaw (BG.Proxy @"fade_length") ptr0 fade_length14
                >> HasCField.writeRaw (BG.Proxy @"fade_level") ptr0 fade_level15

deriving via Marshal.EquivStorable SDL_HapticPeriodic instance BG.Storable SDL_HapticPeriodic

instance
  (ty ~ SDL_HapticEffectType)
  => BG.CompatHasField.HasField "type'" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { type' = y1
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , magnitude = BG.getField @"magnitude" x0
            , offset = BG.getField @"offset" x0
            , phase = BG.getField @"phase" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_HapticEffectType)
  => BG.HasField "type'" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_HapticPeriodic "type'" where
  type
    CFieldType SDL_HapticPeriodic "type'" =
      SDL_HapticEffectType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_HapticDirection)
  => BG.CompatHasField.HasField "direction" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { direction = y1
            , type' = BG.getField @"type'" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , magnitude = BG.getField @"magnitude" x0
            , offset = BG.getField @"offset" x0
            , phase = BG.getField @"phase" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"direction" x0
      )

instance
  (ty ~ SDL_HapticDirection)
  => BG.HasField "direction" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"direction")

instance HasCField.HasCField SDL_HapticPeriodic "direction" where
  type
    CFieldType SDL_HapticPeriodic "direction" =
      SDL_HapticDirection

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "length" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , magnitude = BG.getField @"magnitude" x0
            , offset = BG.getField @"offset" x0
            , phase = BG.getField @"phase" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "length" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"length")

instance HasCField.HasCField SDL_HapticPeriodic "length" where
  type
    CFieldType SDL_HapticPeriodic "length" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "delay" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { delay = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , magnitude = BG.getField @"magnitude" x0
            , offset = BG.getField @"offset" x0
            , phase = BG.getField @"phase" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"delay" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "delay" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"delay")

instance HasCField.HasCField SDL_HapticPeriodic "delay" where
  type
    CFieldType SDL_HapticPeriodic "delay" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "button" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { button = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , magnitude = BG.getField @"magnitude" x0
            , offset = BG.getField @"offset" x0
            , phase = BG.getField @"phase" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"button" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "button" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"button")

instance HasCField.HasCField SDL_HapticPeriodic "button" where
  type
    CFieldType SDL_HapticPeriodic "button" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 26

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "interval" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { interval = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , period = BG.getField @"period" x0
            , magnitude = BG.getField @"magnitude" x0
            , offset = BG.getField @"offset" x0
            , phase = BG.getField @"phase" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"interval" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "interval" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"interval")

instance HasCField.HasCField SDL_HapticPeriodic "interval" where
  type
    CFieldType SDL_HapticPeriodic "interval" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "period" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { period = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , magnitude = BG.getField @"magnitude" x0
            , offset = BG.getField @"offset" x0
            , phase = BG.getField @"phase" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"period" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "period" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"period")

instance HasCField.HasCField SDL_HapticPeriodic "period" where
  type
    CFieldType SDL_HapticPeriodic "period" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 30

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.CompatHasField.HasField "magnitude" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { magnitude = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , offset = BG.getField @"offset" x0
            , phase = BG.getField @"phase" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"magnitude" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.HasField "magnitude" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"magnitude")

instance HasCField.HasCField SDL_HapticPeriodic "magnitude" where
  type
    CFieldType SDL_HapticPeriodic "magnitude" =
      SDL3.Sys.Bindgen.Stdinc.Sint16

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.CompatHasField.HasField "offset" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { offset = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , magnitude = BG.getField @"magnitude" x0
            , phase = BG.getField @"phase" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"offset" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.HasField "offset" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"offset")

instance HasCField.HasCField SDL_HapticPeriodic "offset" where
  type
    CFieldType SDL_HapticPeriodic "offset" =
      SDL3.Sys.Bindgen.Stdinc.Sint16

  offset# = \_ -> \_ -> 34

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "phase" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { phase = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , magnitude = BG.getField @"magnitude" x0
            , offset = BG.getField @"offset" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"phase" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "phase" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"phase")

instance HasCField.HasCField SDL_HapticPeriodic "phase" where
  type
    CFieldType SDL_HapticPeriodic "phase" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 36

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "attack_length" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { attack_length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , magnitude = BG.getField @"magnitude" x0
            , offset = BG.getField @"offset" x0
            , phase = BG.getField @"phase" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"attack_length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "attack_length" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"attack_length")

instance HasCField.HasCField SDL_HapticPeriodic "attack_length" where
  type
    CFieldType SDL_HapticPeriodic "attack_length" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 38

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "attack_level" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { attack_level = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , magnitude = BG.getField @"magnitude" x0
            , offset = BG.getField @"offset" x0
            , phase = BG.getField @"phase" x0
            , attack_length = BG.getField @"attack_length" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"attack_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "attack_level" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"attack_level")

instance HasCField.HasCField SDL_HapticPeriodic "attack_level" where
  type
    CFieldType SDL_HapticPeriodic "attack_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 40

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "fade_length" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { fade_length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , magnitude = BG.getField @"magnitude" x0
            , offset = BG.getField @"offset" x0
            , phase = BG.getField @"phase" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"fade_length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "fade_length" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"fade_length")

instance HasCField.HasCField SDL_HapticPeriodic "fade_length" where
  type
    CFieldType SDL_HapticPeriodic "fade_length" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 42

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "fade_level" SDL_HapticPeriodic ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticPeriodic
            { fade_level = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , magnitude = BG.getField @"magnitude" x0
            , offset = BG.getField @"offset" x0
            , phase = BG.getField @"phase" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            }
      , BG.getField @"fade_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "fade_level" (BG.Ptr SDL_HapticPeriodic) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"fade_level")

instance HasCField.HasCField SDL_HapticPeriodic "fade_level" where
  type
    CFieldType SDL_HapticPeriodic "fade_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 44

-- | A structure containing a template for a Condition effect.
--
--     The struct handles the following effects:
--
--     * SDL_HAPTIC_SPRING: Effect based on axes position.
--
--     * SDL_HAPTIC_DAMPER: Effect based on axes velocity.
--
--     * SDL_HAPTIC_INERTIA: Effect based on axes acceleration.
--
--     * SDL_HAPTIC_FRICTION: Effect based on axes movement.
--
--     Direction is handled by condition internals instead of a direction member. The condition effect specific members have three parameters. The first refers to the X axis, the second refers to the Y axis and the third refers to the Z axis. The right terms refer to the positive side of the axis and the left terms refer to the negative side of the axis. Please refer to the 'SDL_HapticDirection' diagram for which side is positive and which is negative.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticDirection', 'sDL_HAPTIC_SPRING', 'sDL_HAPTIC_DAMPER', 'sDL_HAPTIC_INERTIA', 'sDL_HAPTIC_FRICTION', 'SDL_HapticEffect'
--
--     [C declaration]: @struct SDL_HapticCondition@, defined at @SDL3\/SDL_haptic.h 728:16@
data SDL_HapticCondition = SDL_HapticCondition
  { type' :: SDL_HapticEffectType
  -- ^ SDL_HAPTIC_SPRING, SDL_HAPTIC_DAMPER, SDL_HAPTIC_INERTIA or SDL_HAPTIC_FRICTION
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_haptic.h 731:26@
  , direction :: SDL_HapticDirection
  -- ^ Direction of the effect.
  --
  --          [C declaration]: @direction@, defined at @SDL3\/SDL_haptic.h 733:25@
  , length :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ Duration of the effect.
  --
  --          [C declaration]: @length@, defined at @SDL3\/SDL_haptic.h 736:12@
  , delay :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Delay before starting the effect.
  --
  --          [C declaration]: @delay@, defined at @SDL3\/SDL_haptic.h 737:12@
  , button :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Button that triggers the effect.
  --
  --          [C declaration]: @button@, defined at @SDL3\/SDL_haptic.h 740:12@
  , interval :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ How soon it can be triggered again after button.
  --
  --          [C declaration]: @interval@, defined at @SDL3\/SDL_haptic.h 741:12@
  , right_sat :: CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Level when joystick is to the positive side; max 0xFFFF.
  --
  --          [C declaration]: @right_sat@, defined at @SDL3\/SDL_haptic.h 744:12@
  , left_sat :: CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Level when joystick is to the negative side; max 0xFFFF.
  --
  --          [C declaration]: @left_sat@, defined at @SDL3\/SDL_haptic.h 745:12@
  , right_coeff :: CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^ How fast to increase the force towards the positive side.
  --
  --          [C declaration]: @right_coeff@, defined at @SDL3\/SDL_haptic.h 746:12@
  , left_coeff :: CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^ How fast to increase the force towards the negative side.
  --
  --          [C declaration]: @left_coeff@, defined at @SDL3\/SDL_haptic.h 747:12@
  , deadband :: CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Size of the dead zone; max 0xFFFF: whole axis-range when 0-centered.
  --
  --          [C declaration]: @deadband@, defined at @SDL3\/SDL_haptic.h 748:12@
  , center :: CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^ Position of the dead zone.
  --
  --          [C declaration]: @center@, defined at @SDL3\/SDL_haptic.h 749:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_HapticCondition where
  staticSizeOf = \_ -> (68 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_HapticCondition where
  readRaw =
    \ptr0 ->
      pure SDL_HapticCondition
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"direction") ptr0
        <*> HasCField.readRaw (BG.Proxy @"length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"delay") ptr0
        <*> HasCField.readRaw (BG.Proxy @"button") ptr0
        <*> HasCField.readRaw (BG.Proxy @"interval") ptr0
        <*> HasCField.readRaw (BG.Proxy @"right_sat") ptr0
        <*> HasCField.readRaw (BG.Proxy @"left_sat") ptr0
        <*> HasCField.readRaw (BG.Proxy @"right_coeff") ptr0
        <*> HasCField.readRaw (BG.Proxy @"left_coeff") ptr0
        <*> HasCField.readRaw (BG.Proxy @"deadband") ptr0
        <*> HasCField.readRaw (BG.Proxy @"center") ptr0

instance Marshal.WriteRaw SDL_HapticCondition where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_HapticCondition
            type'2
            direction3
            length4
            delay5
            button6
            interval7
            right_sat8
            left_sat9
            right_coeff10
            left_coeff11
            deadband12
            center13 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"direction") ptr0 direction3
                >> HasCField.writeRaw (BG.Proxy @"length") ptr0 length4
                >> HasCField.writeRaw (BG.Proxy @"delay") ptr0 delay5
                >> HasCField.writeRaw (BG.Proxy @"button") ptr0 button6
                >> HasCField.writeRaw (BG.Proxy @"interval") ptr0 interval7
                >> HasCField.writeRaw (BG.Proxy @"right_sat") ptr0 right_sat8
                >> HasCField.writeRaw (BG.Proxy @"left_sat") ptr0 left_sat9
                >> HasCField.writeRaw (BG.Proxy @"right_coeff") ptr0 right_coeff10
                >> HasCField.writeRaw (BG.Proxy @"left_coeff") ptr0 left_coeff11
                >> HasCField.writeRaw (BG.Proxy @"deadband") ptr0 deadband12
                >> HasCField.writeRaw (BG.Proxy @"center") ptr0 center13

deriving via Marshal.EquivStorable SDL_HapticCondition instance BG.Storable SDL_HapticCondition

instance
  (ty ~ SDL_HapticEffectType)
  => BG.CompatHasField.HasField "type'" SDL_HapticCondition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCondition
            { type' = y1
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , right_sat = BG.getField @"right_sat" x0
            , left_sat = BG.getField @"left_sat" x0
            , right_coeff = BG.getField @"right_coeff" x0
            , left_coeff = BG.getField @"left_coeff" x0
            , deadband = BG.getField @"deadband" x0
            , center = BG.getField @"center" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_HapticEffectType)
  => BG.HasField "type'" (BG.Ptr SDL_HapticCondition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_HapticCondition "type'" where
  type
    CFieldType SDL_HapticCondition "type'" =
      SDL_HapticEffectType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_HapticDirection)
  => BG.CompatHasField.HasField "direction" SDL_HapticCondition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCondition
            { direction = y1
            , type' = BG.getField @"type'" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , right_sat = BG.getField @"right_sat" x0
            , left_sat = BG.getField @"left_sat" x0
            , right_coeff = BG.getField @"right_coeff" x0
            , left_coeff = BG.getField @"left_coeff" x0
            , deadband = BG.getField @"deadband" x0
            , center = BG.getField @"center" x0
            }
      , BG.getField @"direction" x0
      )

instance
  (ty ~ SDL_HapticDirection)
  => BG.HasField "direction" (BG.Ptr SDL_HapticCondition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"direction")

instance HasCField.HasCField SDL_HapticCondition "direction" where
  type
    CFieldType SDL_HapticCondition "direction" =
      SDL_HapticDirection

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "length" SDL_HapticCondition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCondition
            { length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , right_sat = BG.getField @"right_sat" x0
            , left_sat = BG.getField @"left_sat" x0
            , right_coeff = BG.getField @"right_coeff" x0
            , left_coeff = BG.getField @"left_coeff" x0
            , deadband = BG.getField @"deadband" x0
            , center = BG.getField @"center" x0
            }
      , BG.getField @"length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "length" (BG.Ptr SDL_HapticCondition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"length")

instance HasCField.HasCField SDL_HapticCondition "length" where
  type
    CFieldType SDL_HapticCondition "length" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "delay" SDL_HapticCondition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCondition
            { delay = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , right_sat = BG.getField @"right_sat" x0
            , left_sat = BG.getField @"left_sat" x0
            , right_coeff = BG.getField @"right_coeff" x0
            , left_coeff = BG.getField @"left_coeff" x0
            , deadband = BG.getField @"deadband" x0
            , center = BG.getField @"center" x0
            }
      , BG.getField @"delay" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "delay" (BG.Ptr SDL_HapticCondition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"delay")

instance HasCField.HasCField SDL_HapticCondition "delay" where
  type
    CFieldType SDL_HapticCondition "delay" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "button" SDL_HapticCondition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCondition
            { button = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , interval = BG.getField @"interval" x0
            , right_sat = BG.getField @"right_sat" x0
            , left_sat = BG.getField @"left_sat" x0
            , right_coeff = BG.getField @"right_coeff" x0
            , left_coeff = BG.getField @"left_coeff" x0
            , deadband = BG.getField @"deadband" x0
            , center = BG.getField @"center" x0
            }
      , BG.getField @"button" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "button" (BG.Ptr SDL_HapticCondition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"button")

instance HasCField.HasCField SDL_HapticCondition "button" where
  type
    CFieldType SDL_HapticCondition "button" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 26

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "interval" SDL_HapticCondition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCondition
            { interval = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , right_sat = BG.getField @"right_sat" x0
            , left_sat = BG.getField @"left_sat" x0
            , right_coeff = BG.getField @"right_coeff" x0
            , left_coeff = BG.getField @"left_coeff" x0
            , deadband = BG.getField @"deadband" x0
            , center = BG.getField @"center" x0
            }
      , BG.getField @"interval" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "interval" (BG.Ptr SDL_HapticCondition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"interval")

instance HasCField.HasCField SDL_HapticCondition "interval" where
  type
    CFieldType SDL_HapticCondition "interval" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 28

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "right_sat" SDL_HapticCondition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCondition
            { right_sat = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , left_sat = BG.getField @"left_sat" x0
            , right_coeff = BG.getField @"right_coeff" x0
            , left_coeff = BG.getField @"left_coeff" x0
            , deadband = BG.getField @"deadband" x0
            , center = BG.getField @"center" x0
            }
      , BG.getField @"right_sat" x0
      )

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "right_sat" (BG.Ptr SDL_HapticCondition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"right_sat")

instance HasCField.HasCField SDL_HapticCondition "right_sat" where
  type
    CFieldType SDL_HapticCondition "right_sat" =
      CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 30

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "left_sat" SDL_HapticCondition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCondition
            { left_sat = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , right_sat = BG.getField @"right_sat" x0
            , right_coeff = BG.getField @"right_coeff" x0
            , left_coeff = BG.getField @"left_coeff" x0
            , deadband = BG.getField @"deadband" x0
            , center = BG.getField @"center" x0
            }
      , BG.getField @"left_sat" x0
      )

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "left_sat" (BG.Ptr SDL_HapticCondition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"left_sat")

instance HasCField.HasCField SDL_HapticCondition "left_sat" where
  type
    CFieldType SDL_HapticCondition "left_sat" =
      CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 36

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.CompatHasField.HasField "right_coeff" SDL_HapticCondition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCondition
            { right_coeff = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , right_sat = BG.getField @"right_sat" x0
            , left_sat = BG.getField @"left_sat" x0
            , left_coeff = BG.getField @"left_coeff" x0
            , deadband = BG.getField @"deadband" x0
            , center = BG.getField @"center" x0
            }
      , BG.getField @"right_coeff" x0
      )

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.HasField "right_coeff" (BG.Ptr SDL_HapticCondition) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"right_coeff")

instance HasCField.HasCField SDL_HapticCondition "right_coeff" where
  type
    CFieldType SDL_HapticCondition "right_coeff" =
      CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint16

  offset# = \_ -> \_ -> 42

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.CompatHasField.HasField "left_coeff" SDL_HapticCondition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCondition
            { left_coeff = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , right_sat = BG.getField @"right_sat" x0
            , left_sat = BG.getField @"left_sat" x0
            , right_coeff = BG.getField @"right_coeff" x0
            , deadband = BG.getField @"deadband" x0
            , center = BG.getField @"center" x0
            }
      , BG.getField @"left_coeff" x0
      )

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.HasField "left_coeff" (BG.Ptr SDL_HapticCondition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"left_coeff")

instance HasCField.HasCField SDL_HapticCondition "left_coeff" where
  type
    CFieldType SDL_HapticCondition "left_coeff" =
      CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint16

  offset# = \_ -> \_ -> 48

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "deadband" SDL_HapticCondition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCondition
            { deadband = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , right_sat = BG.getField @"right_sat" x0
            , left_sat = BG.getField @"left_sat" x0
            , right_coeff = BG.getField @"right_coeff" x0
            , left_coeff = BG.getField @"left_coeff" x0
            , center = BG.getField @"center" x0
            }
      , BG.getField @"deadband" x0
      )

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "deadband" (BG.Ptr SDL_HapticCondition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"deadband")

instance HasCField.HasCField SDL_HapticCondition "deadband" where
  type
    CFieldType SDL_HapticCondition "deadband" =
      CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 54

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.CompatHasField.HasField "center" SDL_HapticCondition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCondition
            { center = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , right_sat = BG.getField @"right_sat" x0
            , left_sat = BG.getField @"left_sat" x0
            , right_coeff = BG.getField @"right_coeff" x0
            , left_coeff = BG.getField @"left_coeff" x0
            , deadband = BG.getField @"deadband" x0
            }
      , BG.getField @"center" x0
      )

instance
  (ty ~ CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.HasField "center" (BG.Ptr SDL_HapticCondition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"center")

instance HasCField.HasCField SDL_HapticCondition "center" where
  type
    CFieldType SDL_HapticCondition "center" =
      CA.ConstantArray 3 SDL3.Sys.Bindgen.Stdinc.Sint16

  offset# = \_ -> \_ -> 60

-- | A structure containing a template for a Ramp effect.
--
--     This struct is exclusively for the SDL_HAPTIC_RAMP effect.
--
--     The ramp effect starts at start strength and ends at end strength. It augments in linear fashion. If you use attack and fade with a ramp the effects get added to the ramp effect making the effect become quadratic instead of linear.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HAPTIC_RAMP', 'SDL_HapticEffect'
--
--     [C declaration]: @struct SDL_HapticRamp@, defined at @SDL3\/SDL_haptic.h 767:16@
data SDL_HapticRamp = SDL_HapticRamp
  { type' :: SDL_HapticEffectType
  -- ^ SDL_HAPTIC_RAMP
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_haptic.h 770:26@
  , direction :: SDL_HapticDirection
  -- ^ Direction of the effect.
  --
  --          [C declaration]: @direction@, defined at @SDL3\/SDL_haptic.h 771:25@
  , length :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ Duration of the effect.
  --
  --          [C declaration]: @length@, defined at @SDL3\/SDL_haptic.h 774:12@
  , delay :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Delay before starting the effect.
  --
  --          [C declaration]: @delay@, defined at @SDL3\/SDL_haptic.h 775:12@
  , button :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Button that triggers the effect.
  --
  --          [C declaration]: @button@, defined at @SDL3\/SDL_haptic.h 778:12@
  , interval :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ How soon it can be triggered again after button.
  --
  --          [C declaration]: @interval@, defined at @SDL3\/SDL_haptic.h 779:12@
  , start :: SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^ Beginning strength level.
  --
  --          [C declaration]: @start@, defined at @SDL3\/SDL_haptic.h 782:12@
  , end :: SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^ Ending strength level.
  --
  --          [C declaration]: @end@, defined at @SDL3\/SDL_haptic.h 783:12@
  , attack_length :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Duration of the attack.
  --
  --          [C declaration]: @attack_length@, defined at @SDL3\/SDL_haptic.h 786:12@
  , attack_level :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Level at the start of the attack.
  --
  --          [C declaration]: @attack_level@, defined at @SDL3\/SDL_haptic.h 787:12@
  , fade_length :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Duration of the fade.
  --
  --          [C declaration]: @fade_length@, defined at @SDL3\/SDL_haptic.h 788:12@
  , fade_level :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Level at the end of the fade.
  --
  --          [C declaration]: @fade_level@, defined at @SDL3\/SDL_haptic.h 789:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_HapticRamp where
  staticSizeOf = \_ -> (44 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_HapticRamp where
  readRaw =
    \ptr0 ->
      pure SDL_HapticRamp
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"direction") ptr0
        <*> HasCField.readRaw (BG.Proxy @"length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"delay") ptr0
        <*> HasCField.readRaw (BG.Proxy @"button") ptr0
        <*> HasCField.readRaw (BG.Proxy @"interval") ptr0
        <*> HasCField.readRaw (BG.Proxy @"start") ptr0
        <*> HasCField.readRaw (BG.Proxy @"end") ptr0
        <*> HasCField.readRaw (BG.Proxy @"attack_length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"attack_level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"fade_length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"fade_level") ptr0

instance Marshal.WriteRaw SDL_HapticRamp where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_HapticRamp
            type'2
            direction3
            length4
            delay5
            button6
            interval7
            start8
            end9
            attack_length10
            attack_level11
            fade_length12
            fade_level13 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"direction") ptr0 direction3
                >> HasCField.writeRaw (BG.Proxy @"length") ptr0 length4
                >> HasCField.writeRaw (BG.Proxy @"delay") ptr0 delay5
                >> HasCField.writeRaw (BG.Proxy @"button") ptr0 button6
                >> HasCField.writeRaw (BG.Proxy @"interval") ptr0 interval7
                >> HasCField.writeRaw (BG.Proxy @"start") ptr0 start8
                >> HasCField.writeRaw (BG.Proxy @"end") ptr0 end9
                >> HasCField.writeRaw (BG.Proxy @"attack_length") ptr0 attack_length10
                >> HasCField.writeRaw (BG.Proxy @"attack_level") ptr0 attack_level11
                >> HasCField.writeRaw (BG.Proxy @"fade_length") ptr0 fade_length12
                >> HasCField.writeRaw (BG.Proxy @"fade_level") ptr0 fade_level13

deriving via Marshal.EquivStorable SDL_HapticRamp instance BG.Storable SDL_HapticRamp

instance
  (ty ~ SDL_HapticEffectType)
  => BG.CompatHasField.HasField "type'" SDL_HapticRamp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticRamp
            { type' = y1
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , start = BG.getField @"start" x0
            , end = BG.getField @"end" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_HapticEffectType)
  => BG.HasField "type'" (BG.Ptr SDL_HapticRamp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_HapticRamp "type'" where
  type
    CFieldType SDL_HapticRamp "type'" =
      SDL_HapticEffectType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_HapticDirection)
  => BG.CompatHasField.HasField "direction" SDL_HapticRamp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticRamp
            { direction = y1
            , type' = BG.getField @"type'" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , start = BG.getField @"start" x0
            , end = BG.getField @"end" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"direction" x0
      )

instance
  (ty ~ SDL_HapticDirection)
  => BG.HasField "direction" (BG.Ptr SDL_HapticRamp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"direction")

instance HasCField.HasCField SDL_HapticRamp "direction" where
  type
    CFieldType SDL_HapticRamp "direction" =
      SDL_HapticDirection

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "length" SDL_HapticRamp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticRamp
            { length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , start = BG.getField @"start" x0
            , end = BG.getField @"end" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "length" (BG.Ptr SDL_HapticRamp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"length")

instance HasCField.HasCField SDL_HapticRamp "length" where
  type
    CFieldType SDL_HapticRamp "length" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "delay" SDL_HapticRamp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticRamp
            { delay = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , start = BG.getField @"start" x0
            , end = BG.getField @"end" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"delay" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "delay" (BG.Ptr SDL_HapticRamp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"delay")

instance HasCField.HasCField SDL_HapticRamp "delay" where
  type
    CFieldType SDL_HapticRamp "delay" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "button" SDL_HapticRamp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticRamp
            { button = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , interval = BG.getField @"interval" x0
            , start = BG.getField @"start" x0
            , end = BG.getField @"end" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"button" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "button" (BG.Ptr SDL_HapticRamp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"button")

instance HasCField.HasCField SDL_HapticRamp "button" where
  type
    CFieldType SDL_HapticRamp "button" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 26

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "interval" SDL_HapticRamp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticRamp
            { interval = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , start = BG.getField @"start" x0
            , end = BG.getField @"end" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"interval" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "interval" (BG.Ptr SDL_HapticRamp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"interval")

instance HasCField.HasCField SDL_HapticRamp "interval" where
  type
    CFieldType SDL_HapticRamp "interval" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.CompatHasField.HasField "start" SDL_HapticRamp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticRamp
            { start = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , end = BG.getField @"end" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"start" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.HasField "start" (BG.Ptr SDL_HapticRamp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"start")

instance HasCField.HasCField SDL_HapticRamp "start" where
  type
    CFieldType SDL_HapticRamp "start" =
      SDL3.Sys.Bindgen.Stdinc.Sint16

  offset# = \_ -> \_ -> 30

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.CompatHasField.HasField "end" SDL_HapticRamp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticRamp
            { end = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , start = BG.getField @"start" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"end" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint16)
  => BG.HasField "end" (BG.Ptr SDL_HapticRamp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"end")

instance HasCField.HasCField SDL_HapticRamp "end" where
  type
    CFieldType SDL_HapticRamp "end" =
      SDL3.Sys.Bindgen.Stdinc.Sint16

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "attack_length" SDL_HapticRamp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticRamp
            { attack_length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , start = BG.getField @"start" x0
            , end = BG.getField @"end" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"attack_length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "attack_length" (BG.Ptr SDL_HapticRamp) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"attack_length")

instance HasCField.HasCField SDL_HapticRamp "attack_length" where
  type
    CFieldType SDL_HapticRamp "attack_length" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 34

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "attack_level" SDL_HapticRamp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticRamp
            { attack_level = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , start = BG.getField @"start" x0
            , end = BG.getField @"end" x0
            , attack_length = BG.getField @"attack_length" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"attack_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "attack_level" (BG.Ptr SDL_HapticRamp) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"attack_level")

instance HasCField.HasCField SDL_HapticRamp "attack_level" where
  type
    CFieldType SDL_HapticRamp "attack_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 36

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "fade_length" SDL_HapticRamp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticRamp
            { fade_length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , start = BG.getField @"start" x0
            , end = BG.getField @"end" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"fade_length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "fade_length" (BG.Ptr SDL_HapticRamp) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"fade_length")

instance HasCField.HasCField SDL_HapticRamp "fade_length" where
  type
    CFieldType SDL_HapticRamp "fade_length" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 38

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "fade_level" SDL_HapticRamp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticRamp
            { fade_level = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , start = BG.getField @"start" x0
            , end = BG.getField @"end" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            }
      , BG.getField @"fade_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "fade_level" (BG.Ptr SDL_HapticRamp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"fade_level")

instance HasCField.HasCField SDL_HapticRamp "fade_level" where
  type
    CFieldType SDL_HapticRamp "fade_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 40

-- | A structure containing a template for a Left\/Right effect.
--
--     This struct is exclusively for the SDL_HAPTIC_LEFTRIGHT effect.
--
--     The Left\/Right effect is used to explicitly control the large and small motors, commonly found in modern game controllers. The small (right) motor is high frequency, and the large (left) motor is low frequency.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HAPTIC_LEFTRIGHT', 'SDL_HapticEffect'
--
--     [C declaration]: @struct SDL_HapticLeftRight@, defined at @SDL3\/SDL_haptic.h 806:16@
data SDL_HapticLeftRight = SDL_HapticLeftRight
  { type' :: SDL_HapticEffectType
  -- ^ SDL_HAPTIC_LEFTRIGHT
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_haptic.h 809:26@
  , length :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ Duration of the effect in milliseconds.
  --
  --          [C declaration]: @length@, defined at @SDL3\/SDL_haptic.h 812:12@
  , large_magnitude :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Control of the large controller motor.
  --
  --          [C declaration]: @large_magnitude@, defined at @SDL3\/SDL_haptic.h 815:12@
  , small_magnitude :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Control of the small controller motor.
  --
  --          [C declaration]: @small_magnitude@, defined at @SDL3\/SDL_haptic.h 816:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_HapticLeftRight where
  staticSizeOf = \_ -> (12 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_HapticLeftRight where
  readRaw =
    \ptr0 ->
      pure SDL_HapticLeftRight
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"large_magnitude") ptr0
        <*> HasCField.readRaw (BG.Proxy @"small_magnitude") ptr0

instance Marshal.WriteRaw SDL_HapticLeftRight where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_HapticLeftRight type'2 length3 large_magnitude4 small_magnitude5 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"length") ptr0 length3
              >> HasCField.writeRaw (BG.Proxy @"large_magnitude") ptr0 large_magnitude4
              >> HasCField.writeRaw (BG.Proxy @"small_magnitude") ptr0 small_magnitude5

deriving via Marshal.EquivStorable SDL_HapticLeftRight instance BG.Storable SDL_HapticLeftRight

instance
  (ty ~ SDL_HapticEffectType)
  => BG.CompatHasField.HasField "type'" SDL_HapticLeftRight ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticLeftRight
            { type' = y1
            , length = BG.getField @"length" x0
            , large_magnitude = BG.getField @"large_magnitude" x0
            , small_magnitude = BG.getField @"small_magnitude" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_HapticEffectType)
  => BG.HasField "type'" (BG.Ptr SDL_HapticLeftRight) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_HapticLeftRight "type'" where
  type
    CFieldType SDL_HapticLeftRight "type'" =
      SDL_HapticEffectType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "length" SDL_HapticLeftRight ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticLeftRight
            { length = y1
            , type' = BG.getField @"type'" x0
            , large_magnitude = BG.getField @"large_magnitude" x0
            , small_magnitude = BG.getField @"small_magnitude" x0
            }
      , BG.getField @"length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "length" (BG.Ptr SDL_HapticLeftRight) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"length")

instance HasCField.HasCField SDL_HapticLeftRight "length" where
  type
    CFieldType SDL_HapticLeftRight "length" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "large_magnitude" SDL_HapticLeftRight ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticLeftRight
            { large_magnitude = y1
            , type' = BG.getField @"type'" x0
            , length = BG.getField @"length" x0
            , small_magnitude = BG.getField @"small_magnitude" x0
            }
      , BG.getField @"large_magnitude" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "large_magnitude" (BG.Ptr SDL_HapticLeftRight) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"large_magnitude")

instance HasCField.HasCField SDL_HapticLeftRight "large_magnitude" where
  type
    CFieldType SDL_HapticLeftRight "large_magnitude" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "small_magnitude" SDL_HapticLeftRight ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticLeftRight
            { small_magnitude = y1
            , type' = BG.getField @"type'" x0
            , length = BG.getField @"length" x0
            , large_magnitude = BG.getField @"large_magnitude" x0
            }
      , BG.getField @"small_magnitude" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "small_magnitude" (BG.Ptr SDL_HapticLeftRight) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"small_magnitude")

instance HasCField.HasCField SDL_HapticLeftRight "small_magnitude" where
  type
    CFieldType SDL_HapticLeftRight "small_magnitude" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 10

-- | A structure containing a template for the SDL_HAPTIC_CUSTOM effect.
--
--     This struct is exclusively for the SDL_HAPTIC_CUSTOM effect.
--
--     A custom force feedback effect is much like a periodic effect, where the application can define its exact shape. You will have to allocate the data yourself. Data should consist of channels * samples Uint16 samples.
--
--     If channels is one, the effect is rotated using the defined direction. Otherwise it uses the samples in data for the different axes.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HAPTIC_CUSTOM', 'SDL_HapticEffect'
--
--     [C declaration]: @struct SDL_HapticCustom@, defined at @SDL3\/SDL_haptic.h 836:16@
data SDL_HapticCustom = SDL_HapticCustom
  { type' :: SDL_HapticEffectType
  -- ^ SDL_HAPTIC_CUSTOM
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_haptic.h 839:26@
  , direction :: SDL_HapticDirection
  -- ^ Direction of the effect.
  --
  --          [C declaration]: @direction@, defined at @SDL3\/SDL_haptic.h 840:25@
  , length :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ Duration of the effect.
  --
  --          [C declaration]: @length@, defined at @SDL3\/SDL_haptic.h 843:12@
  , delay :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Delay before starting the effect.
  --
  --          [C declaration]: @delay@, defined at @SDL3\/SDL_haptic.h 844:12@
  , button :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Button that triggers the effect.
  --
  --          [C declaration]: @button@, defined at @SDL3\/SDL_haptic.h 847:12@
  , interval :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ How soon it can be triggered again after button.
  --
  --          [C declaration]: @interval@, defined at @SDL3\/SDL_haptic.h 848:12@
  , channels :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ Axes to use, minimum of one.
  --
  --          [C declaration]: @channels@, defined at @SDL3\/SDL_haptic.h 851:11@
  , period :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Sample periods.
  --
  --          [C declaration]: @period@, defined at @SDL3\/SDL_haptic.h 852:12@
  , samples :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Amount of samples.
  --
  --          [C declaration]: @samples@, defined at @SDL3\/SDL_haptic.h 853:12@
  , data' :: BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Should contain channels*samples items.
  --
  --          [C declaration]: @data@, defined at @SDL3\/SDL_haptic.h 854:13@
  , attack_length :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Duration of the attack.
  --
  --          [C declaration]: @attack_length@, defined at @SDL3\/SDL_haptic.h 857:12@
  , attack_level :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Level at the start of the attack.
  --
  --          [C declaration]: @attack_level@, defined at @SDL3\/SDL_haptic.h 858:12@
  , fade_length :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Duration of the fade.
  --
  --          [C declaration]: @fade_length@, defined at @SDL3\/SDL_haptic.h 859:12@
  , fade_level :: SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^ Level at the end of the fade.
  --
  --          [C declaration]: @fade_level@, defined at @SDL3\/SDL_haptic.h 860:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_HapticCustom where
  staticSizeOf = \_ -> (56 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_HapticCustom where
  readRaw =
    \ptr0 ->
      pure SDL_HapticCustom
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"direction") ptr0
        <*> HasCField.readRaw (BG.Proxy @"length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"delay") ptr0
        <*> HasCField.readRaw (BG.Proxy @"button") ptr0
        <*> HasCField.readRaw (BG.Proxy @"interval") ptr0
        <*> HasCField.readRaw (BG.Proxy @"channels") ptr0
        <*> HasCField.readRaw (BG.Proxy @"period") ptr0
        <*> HasCField.readRaw (BG.Proxy @"samples") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"attack_length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"attack_level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"fade_length") ptr0
        <*> HasCField.readRaw (BG.Proxy @"fade_level") ptr0

instance Marshal.WriteRaw SDL_HapticCustom where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_HapticCustom
            type'2
            direction3
            length4
            delay5
            button6
            interval7
            channels8
            period9
            samples10
            data'11
            attack_length12
            attack_level13
            fade_length14
            fade_level15 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"direction") ptr0 direction3
                >> HasCField.writeRaw (BG.Proxy @"length") ptr0 length4
                >> HasCField.writeRaw (BG.Proxy @"delay") ptr0 delay5
                >> HasCField.writeRaw (BG.Proxy @"button") ptr0 button6
                >> HasCField.writeRaw (BG.Proxy @"interval") ptr0 interval7
                >> HasCField.writeRaw (BG.Proxy @"channels") ptr0 channels8
                >> HasCField.writeRaw (BG.Proxy @"period") ptr0 period9
                >> HasCField.writeRaw (BG.Proxy @"samples") ptr0 samples10
                >> HasCField.writeRaw (BG.Proxy @"data'") ptr0 data'11
                >> HasCField.writeRaw (BG.Proxy @"attack_length") ptr0 attack_length12
                >> HasCField.writeRaw (BG.Proxy @"attack_level") ptr0 attack_level13
                >> HasCField.writeRaw (BG.Proxy @"fade_length") ptr0 fade_length14
                >> HasCField.writeRaw (BG.Proxy @"fade_level") ptr0 fade_level15

deriving via Marshal.EquivStorable SDL_HapticCustom instance BG.Storable SDL_HapticCustom

instance
  (ty ~ SDL_HapticEffectType)
  => BG.CompatHasField.HasField "type'" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { type' = y1
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , channels = BG.getField @"channels" x0
            , period = BG.getField @"period" x0
            , samples = BG.getField @"samples" x0
            , data' = BG.getField @"data'" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_HapticEffectType)
  => BG.HasField "type'" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_HapticCustom "type'" where
  type
    CFieldType SDL_HapticCustom "type'" =
      SDL_HapticEffectType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_HapticDirection)
  => BG.CompatHasField.HasField "direction" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { direction = y1
            , type' = BG.getField @"type'" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , channels = BG.getField @"channels" x0
            , period = BG.getField @"period" x0
            , samples = BG.getField @"samples" x0
            , data' = BG.getField @"data'" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"direction" x0
      )

instance
  (ty ~ SDL_HapticDirection)
  => BG.HasField "direction" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"direction")

instance HasCField.HasCField SDL_HapticCustom "direction" where
  type
    CFieldType SDL_HapticCustom "direction" =
      SDL_HapticDirection

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "length" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , channels = BG.getField @"channels" x0
            , period = BG.getField @"period" x0
            , samples = BG.getField @"samples" x0
            , data' = BG.getField @"data'" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "length" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"length")

instance HasCField.HasCField SDL_HapticCustom "length" where
  type
    CFieldType SDL_HapticCustom "length" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "delay" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { delay = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , channels = BG.getField @"channels" x0
            , period = BG.getField @"period" x0
            , samples = BG.getField @"samples" x0
            , data' = BG.getField @"data'" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"delay" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "delay" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"delay")

instance HasCField.HasCField SDL_HapticCustom "delay" where
  type
    CFieldType SDL_HapticCustom "delay" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "button" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { button = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , interval = BG.getField @"interval" x0
            , channels = BG.getField @"channels" x0
            , period = BG.getField @"period" x0
            , samples = BG.getField @"samples" x0
            , data' = BG.getField @"data'" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"button" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "button" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"button")

instance HasCField.HasCField SDL_HapticCustom "button" where
  type
    CFieldType SDL_HapticCustom "button" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 26

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "interval" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { interval = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , channels = BG.getField @"channels" x0
            , period = BG.getField @"period" x0
            , samples = BG.getField @"samples" x0
            , data' = BG.getField @"data'" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"interval" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "interval" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"interval")

instance HasCField.HasCField SDL_HapticCustom "interval" where
  type
    CFieldType SDL_HapticCustom "interval" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "channels" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { channels = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , period = BG.getField @"period" x0
            , samples = BG.getField @"samples" x0
            , data' = BG.getField @"data'" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"channels" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "channels" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"channels")

instance HasCField.HasCField SDL_HapticCustom "channels" where
  type
    CFieldType SDL_HapticCustom "channels" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 30

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "period" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { period = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , channels = BG.getField @"channels" x0
            , samples = BG.getField @"samples" x0
            , data' = BG.getField @"data'" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"period" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "period" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"period")

instance HasCField.HasCField SDL_HapticCustom "period" where
  type
    CFieldType SDL_HapticCustom "period" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "samples" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { samples = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , channels = BG.getField @"channels" x0
            , period = BG.getField @"period" x0
            , data' = BG.getField @"data'" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"samples" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "samples" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"samples")

instance HasCField.HasCField SDL_HapticCustom "samples" where
  type
    CFieldType SDL_HapticCustom "samples" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 34

instance
  (ty ~ BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "data'" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { data' = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , channels = BG.getField @"channels" x0
            , period = BG.getField @"period" x0
            , samples = BG.getField @"samples" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"data'" x0
      )

instance
  (ty ~ BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "data'" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data'")

instance HasCField.HasCField SDL_HapticCustom "data'" where
  type
    CFieldType SDL_HapticCustom "data'" =
      BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 40

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "attack_length" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { attack_length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , channels = BG.getField @"channels" x0
            , period = BG.getField @"period" x0
            , samples = BG.getField @"samples" x0
            , data' = BG.getField @"data'" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"attack_length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "attack_length" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"attack_length")

instance HasCField.HasCField SDL_HapticCustom "attack_length" where
  type
    CFieldType SDL_HapticCustom "attack_length" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 48

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "attack_level" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { attack_level = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , channels = BG.getField @"channels" x0
            , period = BG.getField @"period" x0
            , samples = BG.getField @"samples" x0
            , data' = BG.getField @"data'" x0
            , attack_length = BG.getField @"attack_length" x0
            , fade_length = BG.getField @"fade_length" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"attack_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "attack_level" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"attack_level")

instance HasCField.HasCField SDL_HapticCustom "attack_level" where
  type
    CFieldType SDL_HapticCustom "attack_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 50

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "fade_length" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { fade_length = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , channels = BG.getField @"channels" x0
            , period = BG.getField @"period" x0
            , samples = BG.getField @"samples" x0
            , data' = BG.getField @"data'" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_level = BG.getField @"fade_level" x0
            }
      , BG.getField @"fade_length" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "fade_length" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"fade_length")

instance HasCField.HasCField SDL_HapticCustom "fade_length" where
  type
    CFieldType SDL_HapticCustom "fade_length" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 52

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.CompatHasField.HasField "fade_level" SDL_HapticCustom ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticCustom
            { fade_level = y1
            , type' = BG.getField @"type'" x0
            , direction = BG.getField @"direction" x0
            , length = BG.getField @"length" x0
            , delay = BG.getField @"delay" x0
            , button = BG.getField @"button" x0
            , interval = BG.getField @"interval" x0
            , channels = BG.getField @"channels" x0
            , period = BG.getField @"period" x0
            , samples = BG.getField @"samples" x0
            , data' = BG.getField @"data'" x0
            , attack_length = BG.getField @"attack_length" x0
            , attack_level = BG.getField @"attack_level" x0
            , fade_length = BG.getField @"fade_length" x0
            }
      , BG.getField @"fade_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint16)
  => BG.HasField "fade_level" (BG.Ptr SDL_HapticCustom) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"fade_level")

instance HasCField.HasCField SDL_HapticCustom "fade_level" where
  type
    CFieldType SDL_HapticCustom "fade_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint16

  offset# = \_ -> \_ -> 54

-- | The generic template for any haptic effect.
--
--     All values max at 32767 (0x7FFF). Signed values also can be negative. Time values unless specified otherwise are in milliseconds.
--
--     You can also pass SDL_HAPTIC_INFINITY to length instead of a 0-32767 value. Neither delay, interval, attack_length nor fade_length support SDL_HAPTIC_INFINITY. Fade will also not be used since effect never ends.
--
--     Additionally, the SDL_HAPTIC_RAMP effect does not support a duration of SDL_HAPTIC_INFINITY.
--
--     Button triggers may not be supported on all devices, it is advised to not use them if possible. Buttons start at index 1 instead of index 0 like the joystick.
--
--     If both attack_length and fade_level are 0, the envelope is not used, otherwise both values are used.
--
--     Common parts:
--
--     @
--     \/\/ Replay - All effects have this
--     Uint32 length;        \/\/ Duration of effect (ms).
--     Uint16 delay;         \/\/ Delay before starting effect.
--
--     \/\/ Trigger - All effects have this
--     Uint16 button;        \/\/ Button that triggers effect.
--     Uint16 interval;      \/\/ How soon before effect can be triggered again.
--
--     \/\/ Envelope - All effects except condition effects have this
--     Uint16 attack_length; \/\/ Duration of the attack (ms).
--     Uint16 attack_level;  \/\/ Level at the start of the attack.
--     Uint16 fade_length;   \/\/ Duration of the fade out (ms).
--     Uint16 fade_level;    \/\/ Level at the end of the fade.
--     @
--
--     Here we have an example of a constant effect evolution in time:
--
--     @
--     Strength
--     ^
--     |
--     |    effect level -->  _________________
--     |                     \/                 \\
--     |                    \/                   \\
--     |                   \/                     \\
--     |                  \/                       \\
--     | attack_level --> |                        \\
--     |                  |                        |  \<---  fade_level
--     |
--     +--------------------------------------------------> Time
--                        [--]                 [---]
--                        attack_length        fade_length
--
--     [------------------][-----------------------]
--     delay               length
--     @
--
--     Note either the attack_level or the fade_level may be above the actual effect level.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HapticConstant', 'SDL_HapticPeriodic', 'SDL_HapticCondition', 'SDL_HapticRamp', 'SDL_HapticLeftRight', 'SDL_HapticCustom'
--
--     [C declaration]: @union SDL_HapticEffect@, defined at @SDL3\/SDL_haptic.h 935:15@
newtype SDL_HapticEffect = SDL_HapticEffect
  { unwrap :: BG.ByteArray
  }
  deriving stock (BG.Generic)

deriving via BG.SizedByteArray 72 8 instance Marshal.StaticSize SDL_HapticEffect

deriving via BG.SizedByteArray 72 8 instance Marshal.ReadRaw SDL_HapticEffect

deriving via BG.SizedByteArray 72 8 instance Marshal.WriteRaw SDL_HapticEffect

deriving via Marshal.EquivStorable SDL_HapticEffect instance BG.Storable SDL_HapticEffect

deriving via BG.SizedByteArray 72 8 instance Union.IsUnion SDL_HapticEffect

-- | Effect type.
--
--     [C declaration]: @type@, defined at @SDL3\/SDL_haptic.h 938:26@
instance
  (ty ~ SDL_HapticEffectType)
  => BG.HasField "type'" SDL_HapticEffect ty
  where
  getField = BG.getUnionPayload

-- | Effect type.
--
--     [C declaration]: @type@, defined at @SDL3\/SDL_haptic.h 938:26@
instance
  (ty ~ SDL_HapticEffectType)
  => BG.CompatHasField.HasField "type'" SDL_HapticEffect ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"type'" x0)

instance
  (ty ~ SDL_HapticEffectType)
  => BG.HasField "type'" (BG.Ptr SDL_HapticEffect) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_HapticEffect "type'" where
  type
    CFieldType SDL_HapticEffect "type'" =
      SDL_HapticEffectType

  offset# = \_ -> \_ -> 0

-- | Constant effect.
--
--     [C declaration]: @constant@, defined at @SDL3\/SDL_haptic.h 939:24@
instance
  (ty ~ SDL_HapticConstant)
  => BG.HasField "constant" SDL_HapticEffect ty
  where
  getField = BG.getUnionPayload

-- | Constant effect.
--
--     [C declaration]: @constant@, defined at @SDL3\/SDL_haptic.h 939:24@
instance
  (ty ~ SDL_HapticConstant)
  => BG.CompatHasField.HasField "constant" SDL_HapticEffect ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"constant" x0)

instance
  (ty ~ SDL_HapticConstant)
  => BG.HasField "constant" (BG.Ptr SDL_HapticEffect) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"constant")

instance HasCField.HasCField SDL_HapticEffect "constant" where
  type
    CFieldType SDL_HapticEffect "constant" =
      SDL_HapticConstant

  offset# = \_ -> \_ -> 0

-- | Periodic effect.
--
--     [C declaration]: @periodic@, defined at @SDL3\/SDL_haptic.h 940:24@
instance
  (ty ~ SDL_HapticPeriodic)
  => BG.HasField "periodic" SDL_HapticEffect ty
  where
  getField = BG.getUnionPayload

-- | Periodic effect.
--
--     [C declaration]: @periodic@, defined at @SDL3\/SDL_haptic.h 940:24@
instance
  (ty ~ SDL_HapticPeriodic)
  => BG.CompatHasField.HasField "periodic" SDL_HapticEffect ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"periodic" x0)

instance
  (ty ~ SDL_HapticPeriodic)
  => BG.HasField "periodic" (BG.Ptr SDL_HapticEffect) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"periodic")

instance HasCField.HasCField SDL_HapticEffect "periodic" where
  type
    CFieldType SDL_HapticEffect "periodic" =
      SDL_HapticPeriodic

  offset# = \_ -> \_ -> 0

-- | Condition effect.
--
--     [C declaration]: @condition@, defined at @SDL3\/SDL_haptic.h 941:25@
instance
  (ty ~ SDL_HapticCondition)
  => BG.HasField "condition" SDL_HapticEffect ty
  where
  getField = BG.getUnionPayload

-- | Condition effect.
--
--     [C declaration]: @condition@, defined at @SDL3\/SDL_haptic.h 941:25@
instance
  (ty ~ SDL_HapticCondition)
  => BG.CompatHasField.HasField "condition" SDL_HapticEffect ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"condition" x0)

instance
  (ty ~ SDL_HapticCondition)
  => BG.HasField "condition" (BG.Ptr SDL_HapticEffect) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"condition")

instance HasCField.HasCField SDL_HapticEffect "condition" where
  type
    CFieldType SDL_HapticEffect "condition" =
      SDL_HapticCondition

  offset# = \_ -> \_ -> 0

-- | Ramp effect.
--
--     [C declaration]: @ramp@, defined at @SDL3\/SDL_haptic.h 942:20@
instance (ty ~ SDL_HapticRamp) => BG.HasField "ramp" SDL_HapticEffect ty where
  getField = BG.getUnionPayload

-- | Ramp effect.
--
--     [C declaration]: @ramp@, defined at @SDL3\/SDL_haptic.h 942:20@
instance
  (ty ~ SDL_HapticRamp)
  => BG.CompatHasField.HasField "ramp" SDL_HapticEffect ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"ramp" x0)

instance
  (ty ~ SDL_HapticRamp)
  => BG.HasField "ramp" (BG.Ptr SDL_HapticEffect) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"ramp")

instance HasCField.HasCField SDL_HapticEffect "ramp" where
  type
    CFieldType SDL_HapticEffect "ramp" =
      SDL_HapticRamp

  offset# = \_ -> \_ -> 0

-- | Left\/Right effect.
--
--     [C declaration]: @leftright@, defined at @SDL3\/SDL_haptic.h 943:25@
instance
  (ty ~ SDL_HapticLeftRight)
  => BG.HasField "leftright" SDL_HapticEffect ty
  where
  getField = BG.getUnionPayload

-- | Left\/Right effect.
--
--     [C declaration]: @leftright@, defined at @SDL3\/SDL_haptic.h 943:25@
instance
  (ty ~ SDL_HapticLeftRight)
  => BG.CompatHasField.HasField "leftright" SDL_HapticEffect ty
  where
  hasField =
    \x0 ->
      (BG.setUnionPayload, BG.getField @"leftright" x0)

instance
  (ty ~ SDL_HapticLeftRight)
  => BG.HasField "leftright" (BG.Ptr SDL_HapticEffect) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"leftright")

instance HasCField.HasCField SDL_HapticEffect "leftright" where
  type
    CFieldType SDL_HapticEffect "leftright" =
      SDL_HapticLeftRight

  offset# = \_ -> \_ -> 0

-- | Custom effect.
--
--     [C declaration]: @custom@, defined at @SDL3\/SDL_haptic.h 944:22@
instance
  (ty ~ SDL_HapticCustom)
  => BG.HasField "custom" SDL_HapticEffect ty
  where
  getField = BG.getUnionPayload

-- | Custom effect.
--
--     [C declaration]: @custom@, defined at @SDL3\/SDL_haptic.h 944:22@
instance
  (ty ~ SDL_HapticCustom)
  => BG.CompatHasField.HasField "custom" SDL_HapticEffect ty
  where
  hasField =
    \x0 -> (BG.setUnionPayload, BG.getField @"custom" x0)

instance
  (ty ~ SDL_HapticCustom)
  => BG.HasField "custom" (BG.Ptr SDL_HapticEffect) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"custom")

instance HasCField.HasCField SDL_HapticEffect "custom" where
  type
    CFieldType SDL_HapticEffect "custom" =
      SDL_HapticCustom

  offset# = \_ -> \_ -> 0

-- | This is a unique ID for a haptic device for the time it is connected to the system, and is never reused for the lifetime of the application.
--
--     If the haptic device is disconnected and reconnected, it will get a new ID.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_HapticID@, defined at @SDL3\/SDL_haptic.h 957:16@
newtype SDL_HapticID = SDL_HapticID
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_HapticID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HapticID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_HapticID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_HapticID "unwrap" where
  type
    CFieldType SDL_HapticID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

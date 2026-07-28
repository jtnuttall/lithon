{-# LANGUAGE OverloadedStrings #-}

-- | The value vocabulary shared by enum materialization and the resolved IR:
-- materialized enum numbers, their encoding provenance, and typed API
-- constants. A leaf module so both the materialization pass and the resolved
-- enum types can speak it without a cycle.
module Lithon.Codegen.Vulkan.Resolved.Enums.Value (
  EnumNumber (..),
  ValueEncoding (..),
  ConstantValue (..),
) where

import Data.Aeson (ToJSON)
import Data.Scientific (FPFormat (Fixed), Scientific, formatScientific)
import Data.Text qualified as T
import Lithon.Prelude
import Numeric (showHex)

import Lithon.Codegen.Vulkan.Registry.Micro.Literal (ValueLiteral)
import Lithon.Codegen.Vulkan.Registry.Types.Common (Raw)

-- | A materialized enum value.
data EnumNumber
  = -- | @KindEnum@ values (32-bit signed in C; negative 'VkResult' codes).
    NumSigned !Int64
  | -- | @KindBitmask@ values (bit patterns, up to 64 bits).
    NumBits !Word64
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display EnumNumber where
  displayBuilder = \case
    NumSigned n -> displayBuilder n
    NumBits n -> "0x" <> displayBuilder (T.pack (showHex n ""))

-- | How a value was obtained — kept for auditability (offset arithmetic is
-- reconstructable from provenance).
data ValueEncoding
  = FromLiteral !(Raw ValueLiteral)
  | FromBitpos !Int
  | FromOffset {extNumber :: !Int, offset :: !Int, negative :: !Bool}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | A materialized API constant (@\<enums type=\"constants\"\>@ values and
-- extension-local SPEC_VERSION\/EXTENSION_NAME definitions).
data ConstantValue
  = -- | Typed @uint32_t@ (including materialized @(~0U)@\/@(~1U)@\/…).
    ConstU32 !Word32
  | -- | Typed @uint64_t@ (@VK_WHOLE_SIZE = (~0ULL)@).
    ConstU64 !Word64
  | -- | Typed @float@ (@VK_LOD_CLAMP_NONE@); 'Scientific' avoids
    -- representation drift in goldens.
    ConstFloat !Scientific
  | -- | Untyped integer literal (extension SPEC_VERSIONs).
    ConstInt !Integer
  | -- | Quoted string (extension name macros).
    ConstString !Text
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display ConstantValue where
  displayBuilder = \case
    ConstU32 n -> displayBuilder n
    ConstU64 n -> displayBuilder n
    ConstFloat s -> displayBuilder (formatScientific Fixed Nothing s)
    ConstInt n -> displayBuilder n
    ConstString s -> displayBuilder (T.show @Text s)

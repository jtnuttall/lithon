{-# LANGUAGE StrictData #-}

-- | IR for the formats, sync, SPIR-V, and video-codec sections — direct
-- transliterations of their registry.rnc content models.
module Lithon.Codegen.Vulkan.Registry.Types.Misc (
  -- * Formats
  Format (..),
  Component (..),
  BitsSpec (..),
  NumericFormat (..),
  Chroma (..),
  Plane (..),

  -- * Sync
  SyncSection (..),
  SyncStage (..),
  SyncAccess (..),
  SyncSupport (..),
  SyncEquivalent (..),
  SyncPipeline (..),
  SyncPipelineStage (..),

  -- * SPIR-V
  SpirvExtension (..),
  SpirvCapability (..),
  Enable (..),

  -- * Video codecs
  VideoCodec (..),
  VideoProfiles (..),
  VideoProfileMember (..),
  VideoProfileValue (..),
  VideoFormat (..),
  VideoRequireCapabilities (..),
) where

import Data.Aeson (ToJSON)
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (DependsExpr)
import Lithon.Codegen.Vulkan.Registry.Types.Common (Raw)
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

data Format = Format
  { name :: Text
  , compatibilityClass :: Text
  -- ^ The @class=@ attribute (format compatibility classes).
  , blockSize :: Int
  , texelsPerBlock :: Int
  , blockExtent :: Maybe (Raw (Int, Int, Int))
  , packed :: Maybe Int
  , compressed :: Maybe Text
  , chroma :: Maybe Chroma
  , components :: Vector Component
  , planes :: Vector Plane
  , spirvImageFormats :: Vector Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data Component = Component
  { name :: Text
  , bits :: BitsSpec
  , numericFormat :: NumericFormat
  , planeIndex :: Maybe Int
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data BitsSpec = BitsInt Int | BitsCompressed
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | The observed (closed) component numeric-format vocabulary.
data NumericFormat
  = NFUnorm
  | NFSnorm
  | NFUscaled
  | NFSscaled
  | NFUint
  | NFSint
  | NFUfloat
  | NFSfloat
  | NFSrgb
  | NFSfixed5
  | NFBool
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data Chroma = Chroma420 | Chroma422 | Chroma444
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data Plane = Plane
  { index :: Int
  , widthDivisor :: Int
  , heightDivisor :: Int
  , compatible :: Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data SyncSection = SyncSection
  { comment :: Maybe Text
  , stages :: Vector SyncStage
  , accesses :: Vector SyncAccess
  , pipelines :: Vector SyncPipeline
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data SyncStage = SyncStage
  { name :: Text
  , alias :: Maybe Text
  , support :: Maybe SyncSupport
  , equivalent :: Maybe SyncEquivalent
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data SyncAccess = SyncAccess
  { name :: Text
  , alias :: Maybe Text
  , comment :: Maybe Text
  -- ^ A @\<comment\>@ child element (unlike most comments, not an attribute).
  , support :: Maybe SyncSupport
  , equivalent :: Maybe SyncEquivalent
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Which queues (stages) support a sync stage (access).
data SyncSupport = SyncSupport
  { queues :: [Text]
  , stages :: [Text]
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | @stage=@ \/ @access=@ lists this stage\/access expands to.
data SyncEquivalent = SyncEquivalent
  { stages :: [Text]
  , accesses :: [Text]
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data SyncPipeline = SyncPipeline
  { name :: Text
  , depends :: Maybe (Raw DependsExpr)
  , stages :: Vector SyncPipelineStage
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data SyncPipelineStage = SyncPipelineStage
  { order :: Maybe Text
  , before :: Maybe Text
  , after :: Maybe Text
  , stage :: Text
  -- ^ Element text: the stage name.
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data SpirvExtension = SpirvExtension
  { name :: Text
  , enables :: Vector Enable
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data SpirvCapability = SpirvCapability
  { name :: Text
  , enables :: Vector Enable
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | The four @\<enable\>@ shapes (version \/ extension \/ struct feature \/
-- property check); @requires=@ stays raw text per the RNC.
data Enable
  = EnableVersion Text
  | EnableExtension ExtensionName
  | EnableFeature
      { struct :: Text
      , feature :: Text
      , requires :: Maybe Text
      , alias :: Maybe Text
      }
  | EnableProperty
      { property :: Text
      , member :: Text
      , value :: Text
      , requires :: Maybe Text
      }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data VideoCodec = VideoCodec
  { name :: Text
  , extend :: Maybe Text
  , value :: Maybe Text
  , profiles :: Vector VideoProfiles
  , capabilities :: Vector Text
  -- ^ @\<videocapabilities struct=…\/\>@ references.
  , formats :: Vector VideoFormat
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data VideoProfiles = VideoProfiles
  { struct :: Text
  , members :: Vector VideoProfileMember
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data VideoProfileMember = VideoProfileMember
  { name :: Text
  , values :: Vector VideoProfileValue
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data VideoProfileValue = VideoProfileValue
  { name :: Text
  , value :: Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data VideoFormat = VideoFormat
  { name :: Maybe Text
  , usage :: Maybe Text
  , extend :: Maybe Text
  , requireCapabilities :: Vector VideoRequireCapabilities
  , properties :: Vector Text
  -- ^ @\<videoformatproperties struct=…\/\>@ references.
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data VideoRequireCapabilities = VideoRequireCapabilities
  { struct :: Text
  , member :: Text
  , value :: Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

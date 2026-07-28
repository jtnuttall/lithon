{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | The lithon curation profile: a declarative, checked-in description of
-- the curated API surface — baseline\/optional core versions, platforms,
-- the extension allowlist (with rationale), hard bans, and policy knobs.
--
-- JSON via autodocodec: one codec definition yields the decoder, the
-- encoder, and field documentation. Extension entries accept either a bare
-- string or an object with a @rationale@.
module Lithon.Codegen.Vulkan.Curate.Profile (
  ProfileDecodeError (..),
  Profile (..),
  RegistryPin (..),
  ProfileCore (..),
  ProfileExtension (..),
  ProfilePolicy (..),
  DependencyPolicy (..),
  LegacyCoreMode (..),
  LegacyCorePolicy (..),
  decodeProfile,
  encodeProfile,
) where

import Autodocodec (
  HasCodec (codec),
  JSONCodec,
  bimapCodec,
  dimapCodec,
  disjointEitherCodec,
  object,
  optionalFieldOrNull,
  optionalFieldOrNullWith,
  optionalFieldWithDefault,
  requiredField,
  requiredFieldWith,
  stringConstCodec,
  (.=),
 )
import Autodocodec.Aeson (eitherDecodeJSONViaCodec, encodeJSONViaCodec)
import Data.ByteString.Lazy qualified as LBS
import Data.Text qualified as T
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Micro.Literal (parseVersion)
import Lithon.Codegen.Vulkan.Resolved.Avail (CoreVersion (..))

newtype ProfileDecodeError = ProfileJsonInvalid Text
  deriving stock (Show)

instance Display ProfileDecodeError where
  displayBuilder = \case
    ProfileJsonInvalid msg -> from msg

data Profile = Profile
  { name :: Text
  , description :: Maybe Text
  , registry :: RegistryPin
  , core :: ProfileCore
  , platforms :: [PlatformName]
  , extensions :: [ProfileExtension]
  , exclude :: [ExtensionName]
  , policy :: ProfilePolicy
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

decodeProfile :: LBS.ByteString -> Either ProfileDecodeError Profile
decodeProfile = first (ProfileJsonInvalid . toText) . eitherDecodeJSONViaCodec

encodeProfile :: Profile -> LBS.ByteString
encodeProfile = encodeJSONViaCodec

instance HasCodec Profile where
  codec = object "Profile" do
    name <- requiredField "name" "profile identity, echoed in reports" .= (.name)
    description <- optionalFieldOrNull "description" "human summary" .= (.description)
    registry <-
      optionalFieldWithDefault
        "registry"
        RegistryPin{headerVersion = Nothing}
        "registry pin (drift warning)"
        .= (.registry)
    core <- requiredField "core" "baseline and optional core versions" .= (.core)
    platforms <-
      optionalFieldWithDefault "platforms" [] "registry platform names in scope" .= (.platforms)
    extensions <- optionalFieldWithDefault "extensions" [] "curated extension list" .= (.extensions)
    exclude <-
      optionalFieldWithDefault "exclude" [] "hard bans; a required ban is an error" .= (.exclude)
    policy <- optionalFieldWithDefault "policy" defaultPolicy "curation policy knobs" .= (.policy)
    pure Profile{..}

newtype RegistryPin = RegistryPin
  { headerVersion :: Maybe Int
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

instance HasCodec RegistryPin where
  codec = object "RegistryPin" do
    headerVersion <-
      optionalFieldOrNull "headerVersion" "expected VK_HEADER_VERSION" .= (.headerVersion)
    pure RegistryPin{..}

data ProfileCore = ProfileCore
  { baseline :: CoreVersion
  , maxCore :: CoreVersion
  -- ^ Versions in @(baseline, maxCore]@ are optional runtime capabilities.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

instance HasCodec ProfileCore where
  codec = object "ProfileCore" do
    baseline <- requiredFieldWith "baseline" coreVersionCodec "minimum core version" .= (.baseline)
    mMaxCore <-
      optionalFieldOrNullWith "max" coreVersionCodec "highest optional core version"
        .= (\c -> Just c.maxCore)

    pure
      ProfileCore
        { maxCore = fromMaybe baseline mMaxCore
        , ..
        }

data ProfileExtension = ProfileExtension
  { name :: ExtensionName
  , rationale :: Maybe Text
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

instance HasCodec ProfileExtension where
  codec = dimapCodec fromEither toEither (disjointEitherCodec codec extensionObject)
   where
    fromEither = \case
      Left name -> ProfileExtension{name, rationale = Nothing}
      Right pe -> pe
    toEither pe = case pe.rationale of
      Nothing -> Left pe.name
      Just _ -> Right pe
    extensionObject = object "ProfileExtension" do
      name <- requiredField "name" "registry extension name" .= (.name)
      rationale <- optionalFieldOrNull "rationale" "why this is in the curated set" .= (.rationale)
      pure ProfileExtension{..}

data DependencyPolicy = DepsAuto | DepsStrict
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

instance HasCodec DependencyPolicy where
  codec = stringConstCodec ((DepsAuto, "auto") :| [(DepsStrict, "strict")])

data LegacyCoreMode = LegacyAnnotate | LegacyExclude
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

instance HasCodec LegacyCoreMode where
  codec = stringConstCodec ((LegacyAnnotate, "annotate") :| [(LegacyExclude, "exclude")])

data LegacyCorePolicy = LegacyCorePolicy
  { mode :: LegacyCoreMode
  , categories :: [Text]
  -- ^ @\<deprecate explanationlink=\>@ categories to exclude; empty = all.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

instance HasCodec LegacyCorePolicy where
  codec = object "LegacyCorePolicy" do
    mode <- requiredField "mode" "annotate or exclude" .= (.mode)
    categories <-
      optionalFieldWithDefault "categories" [] "deprecate categories; empty = all" .= (.categories)
    pure LegacyCorePolicy{..}

data ProfilePolicy = ProfilePolicy
  { dependencies :: DependencyPolicy
  , includePromotedToOptionalCores :: Bool
  -- ^ Auto-select the extension spellings of everything promoted to an
  -- optional core version, so baseline devices reach those features.
  , allowProvisional :: [ExtensionName]
  , denySpecialUse :: [Text]
  , allowDeprecated :: Bool
  , legacyCore :: LegacyCorePolicy
  , warnOnRegistryDrift :: Bool
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

defaultPolicy :: ProfilePolicy
defaultPolicy =
  ProfilePolicy
    { dependencies = DepsAuto
    , includePromotedToOptionalCores = True
    , allowProvisional = []
    , denySpecialUse = []
    , allowDeprecated = True
    , legacyCore = LegacyCorePolicy{mode = LegacyAnnotate, categories = []}
    , warnOnRegistryDrift = True
    }

instance HasCodec ProfilePolicy where
  codec = object "ProfilePolicy" do
    dependencies <-
      optionalFieldWithDefault "dependencies" DepsAuto "auto-include vs strict" .= (.dependencies)
    includePromotedToOptionalCores <-
      optionalFieldWithDefault
        "includePromotedToOptionalCores"
        True
        "auto-select spellings promoted to optional cores"
        .= (.includePromotedToOptionalCores)
    allowProvisional <-
      optionalFieldWithDefault "allowProvisional" [] "provisional allowlist" .= (.allowProvisional)
    denySpecialUse <-
      optionalFieldWithDefault "denySpecialUse" [] "rejected specialuse tokens" .= (.denySpecialUse)
    allowDeprecated <-
      optionalFieldWithDefault "allowDeprecated" True "deprecated exts warn, not error"
        .= (.allowDeprecated)
    legacyCore <-
      optionalFieldWithDefault
        "legacyCore"
        LegacyCorePolicy{mode = LegacyAnnotate, categories = []}
        "deprecated-core handling"
        .= (.legacyCore)
    warnOnRegistryDrift <-
      optionalFieldWithDefault "warnOnRegistryDrift" True "headerVersion drift warning"
        .= (.warnOnRegistryDrift)
    pure ProfilePolicy{..}

coreVersionCodec :: JSONCodec CoreVersion
coreVersionCodec = bimapCodec parse display codec
 where
  parse t = case parseVersion t of
    Right (major, minor) -> Right CoreVersion{major, minor}
    Left err -> Left (T.unpack err)

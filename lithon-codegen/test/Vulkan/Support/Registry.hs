-- | One shared parse of the pinned registry for all test groups that need
-- the IR (goldens, invariants), plus synthetic-fixture helpers. Parse
-- diagnostics have their own dedicated test; here a failure just aborts
-- loudly.
module Vulkan.Support.Registry (
  pinnedRegistry,
  syntheticSpecialized,
) where

import Data.ByteString qualified as BS
import Data.Vector qualified as V
import System.IO.Unsafe (unsafePerformIO)

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry (ParseSuccess (..), Registry (..), parseRegistry)
import Lithon.Codegen.Vulkan.Registry.Specialize (Specialized (..))
import Lithon.Codegen.Vulkan.Registry.Types.Features (Feature)
import Lithon.Codegen.Vulkan.Xml.Load (loadXmlBytes)
import Vulkan.Support.Paths (registryXmlPath)

-- | Parsed once, shared across the suite (the diagnostics-focused test
-- parses independently and reports errors properly).
pinnedRegistry :: Registry
pinnedRegistry = unsafePerformIO do
  path <- registryXmlPath
  bytes <- BS.readFile path
  root <- either (fail . show) pure (loadXmlBytes bytes)
  case parseRegistry root of
    Left _ -> fail "pinned registry failed to parse (see pinnedRegistryParses test)"
    Right ok -> pure ok.registry
{-# NOINLINE pinnedRegistry #-}

-- | A features-only registry, minted as specialized for synthetic
-- error-path tests. The 'Specialized' constructor is deliberately absent
-- from the Registry umbrella; tests reach into the defining module for it.
syntheticSpecialized :: Vector Feature -> Specialized Registry
syntheticSpecialized features =
  Specialized
    Registry
      { comments = V.empty
      , platforms = V.empty
      , tags = V.empty
      , types = V.empty
      , typesComments = V.empty
      , enums = V.empty
      , commands = V.empty
      , features
      , extensions = V.empty
      , formats = V.empty
      , spirvExtensions = V.empty
      , spirvCapabilities = V.empty
      , sync = V.empty
      , videoCodecs = V.empty
      }

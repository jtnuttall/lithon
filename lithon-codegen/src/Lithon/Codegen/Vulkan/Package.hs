{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

-- | Assembling the @lithon-vk@ package itself: the vulkan 'PackageSpec' —
-- statics embedded from @data\/vulkan\/static\/@ plus the generated module
-- set — over the shared packaging backend. The code generator owns
-- everything in the package; nothing in it is ever edited by hand.
module Lithon.Codegen.Vulkan.Package (
  vulkanPackageSpec,
) where

import Data.FileEmbed (embedFileRelative)
import Data.Text.Encoding qualified as T
import Lithon.Prelude

import Lithon.Codegen.Backend.Package (PackageSpec (..), RootFiles (..))
import Lithon.Codegen.Backend.Package qualified as Package
import Lithon.Codegen.Vulkan.Generate.Render (RenderedModule (..))

packageYaml :: Text
packageYaml = T.decodeUtf8 $(embedFileRelative "data/vulkan/static/package.yaml")

readme :: Text
readme = T.decodeUtf8 $(embedFileRelative "data/vulkan/static/README.md")

changelog :: Text
changelog = T.decodeUtf8 $(embedFileRelative "data/vulkan/static/CHANGELOG.md")

-- | The lithon-vk package spec: embedded statics plus the rendered module
-- set. Pure and total — assembly errors surface in the shared backend.
vulkanPackageSpec :: [RenderedModule] -> PackageSpec
vulkanPackageSpec rendered =
  PackageSpec
    { root =
        RootFiles
          { packageYaml
          , readme
          , changelog
          , license = Package.lithonLicense
          }
    , extraLicenses = []
    , srcDir = "src"
    , modules = [(m.meta, m.contents) | m <- rendered]
    , extraFiles = []
    , extraTrees = []
    }

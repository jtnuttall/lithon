-- | Locating the pinned Vulkan registry from wherever the test binary runs.
module Vulkan.Support.Paths (
  registryXmlPath,
) where

import System.Directory (doesFileExist)

import Lithon.Codegen.Prelude

-- | Path to the pinned @vk.xml@. Probes relative to the working directory,
-- which is the package directory under @cabal test@ and the repo root when
-- run from there.
registryXmlPath :: IO FilePath
registryXmlPath = probe candidates
 where
  candidates =
    [ "Vulkan-Docs/xml/vk.xml"
    , "lithon-codegen/Vulkan-Docs/xml/vk.xml"
    , "../lithon-codegen/Vulkan-Docs/xml/vk.xml"
    ]
  probe [] =
    fail
      "vk.xml not found; expected the Vulkan-Docs submodule at \
      \lithon-codegen/Vulkan-Docs (is the submodule initialized?)"
  probe (c : cs) = do
    exists <- doesFileExist c
    if exists then pure c else probe cs

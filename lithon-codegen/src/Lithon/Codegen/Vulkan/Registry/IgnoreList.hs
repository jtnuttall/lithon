-- | The registry parser's documented list of consciously-unmodeled corners.
--
-- Strictness contract: everything in @registry.rnc@ is modeled, so this list
-- is EMPTY. It exists as the escape hatch for future registry drift: when a
-- Vulkan-Docs bump introduces schema we choose not to model, the entry goes
-- here — with a comment saying why — instead of silently loosening the
-- parser. Every entry must name its element, the ignored item, and the
-- rationale.
module Lithon.Codegen.Vulkan.Registry.IgnoreList (
  registryIgnoreList,
) where

import Lithon.Codegen.Vulkan.Xml.Decode (IgnoreList, emptyIgnoreList)

registryIgnoreList :: IgnoreList
registryIgnoreList = emptyIgnoreList

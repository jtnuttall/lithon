-- | The resolved IR: entity vocabulary, per-entity constructors, and the
-- final assembly — everything downstream of the resolve passes consumes.
module Lithon.Codegen.Vulkan.Resolved (
  module Lithon.Codegen.Vulkan.Resolved.Avail,
  module Lithon.Codegen.Vulkan.Resolved.Commands,
  module Lithon.Codegen.Vulkan.Resolved.Core,
  module Lithon.Codegen.Vulkan.Resolved.Enums,
  module Lithon.Codegen.Vulkan.Resolved.Registry,
  module Lithon.Codegen.Vulkan.Resolved.Summary,
) where

import Lithon.Codegen.Vulkan.Resolved.Avail
import Lithon.Codegen.Vulkan.Resolved.Commands
import Lithon.Codegen.Vulkan.Resolved.Core
import Lithon.Codegen.Vulkan.Resolved.Enums
import Lithon.Codegen.Vulkan.Resolved.Registry
import Lithon.Codegen.Vulkan.Resolved.Summary

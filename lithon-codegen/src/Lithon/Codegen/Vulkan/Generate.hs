{-# LANGUAGE StrictData #-}

-- | Phase 3: generate the @lithon@ package from a curated registry.
--
-- The pass chain mirrors "Lithon.Codegen.Vulkan.Resolve": each pass reads its
-- inputs from the anonymous typed product by type and appends its result.
-- Value-layer scope today (enums, flags, handles, constants, version,
-- result vocabulary, umbrella); struct\/command passes join the chain at
-- their milestones.
--
-- 'generate' is pure: it returns the full file set. Formatting (fourmolu),
-- disk sync, manifest bookkeeping, and hpack live in "Lithon.Codegen.Backend.Emit".
module Lithon.Codegen.Vulkan.Generate (
  GenOutput (..),
  GenerateError (..),
  generate,
) where

import Data.Aeson qualified as A
import Data.Generics.SOP.Builder.Typed qualified as TB
import Data.Map.Strict qualified as Map
import Lithon.Prelude

import Lithon.Codegen.Backend.Hs (moduleFilePath)
import Lithon.Codegen.Vulkan.Curate (Curated (..))
import Lithon.Codegen.Vulkan.Generate.Cmds (
  CmdsError,
  CommandPlans,
  GenReport (..),
  genReport,
  planCommands,
  renderCommands,
 )
import Lithon.Codegen.Vulkan.Generate.Docs (DocsError, synthesizeDocs)
import Lithon.Codegen.Vulkan.Generate.Layout (LayoutError, computeLayouts)
import Lithon.Codegen.Vulkan.Generate.Lower (LowerError, lowerStructs)
import Lithon.Codegen.Vulkan.Generate.Marshal (MarshalError, planStructs)
import Lithon.Codegen.Vulkan.Generate.Modules (ModuleError, assignModules)
import Lithon.Codegen.Vulkan.Generate.Names (NameError, buildNames)
import Lithon.Codegen.Vulkan.Generate.Render (RenderError, RenderedModule (..), renderValueLayer)

-- | The generated file set: repo-relative paths under the target package
-- directory -> full source text, plus the reviewable planning report.
data GenOutput = GenOutput
  { files :: Map FilePath Text
  , report :: GenReport
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

data GenerateError
  = GName NameError
  | GModule ModuleError
  | GLower LowerError
  | GLayout LayoutError
  | GMarshal MarshalError
  | GCmds CmdsError
  | GDocs DocsError
  | GRender RenderError
  deriving stock (Eq, Generic, Show)
  deriving anyclass (A.ToJSON, HasDatatypeInfo, NFData, SOPGeneric)
  deriving (Display) via (GDisplayNoDelim GenerateError)

-- | Run the generate chain over a curated registry.
generate :: Curated -> Either (Errors GenerateError) GenOutput
generate curated = do
  cxt <-
    TB.buildNP
      $ TB.inject_ (I curated.registry)
      >>> TB.injectIA (\c -> buildNames c <??> GName)
      >>> TB.injectIA (\c -> lowerStructs c <??> GLower)
      >>> TB.injectIA (\c -> assignModules c <??> GModule)
      >>> TB.injectIA (\c -> computeLayouts c <??> GLayout)
      >>> TB.injectIA (\c -> planStructs c <??> GMarshal)
      >>> TB.injectIA (\c -> synthesizeDocs c <??> GDocs)
      >>> TB.injectIA (\c -> planCommands c <??> GCmds)
      >>> TB.injectIA (\c -> renderCommands c <??> GCmds)
      >>> TB.injectIA (\c -> renderValueLayer c <??> GRender)
  let rendered = getTyped @[RenderedModule] cxt
  pure
    GenOutput
      { files =
          Map.fromList
            [(moduleFilePath m.path, m.contents) | m <- rendered]
      , report = genReport (getTyped @CommandPlans cxt)
      }

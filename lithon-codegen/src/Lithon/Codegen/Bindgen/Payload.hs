{-# LANGUAGE StrictData #-}

-- | What one header yields for the later stages: alias-layer facts, ABI
-- layout facts, which wrappers were gated. 'distillPayload' is the
-- target's finalizer in the driver's fold; the curated layer, the ABI
-- assertion TU, and the registry checks read its result.
module Lithon.Codegen.Bindgen.Payload (
  BindgenPayload (..),
  distillPayload,
) where

import Lithon.HsBindgen qualified as HB
import Lithon.Prelude

import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen.Abi (AbiDecl, distillAbi)
import Lithon.Codegen.Bindgen.Alias (FamilyDecls, distillFamily)
import Lithon.Codegen.Bindgen.Driver (HeaderUnit (..))
import Lithon.Codegen.Bindgen.Target (BindgenTarget (..))
import Lithon.Codegen.Bindgen.Versions (VersionsRegistry, abiOverrides)
import Lithon.Codegen.Bindgen.Versions.Guards (GatedDecl, gatedDecls)

-- | The per-header payload distilled from each fold step.
data BindgenPayload = BindgenPayload
  { facts :: FamilyDecls
  -- ^ The alias-layer distillate (function census + translated decls).
  , abi :: [AbiDecl]
  -- ^ The layout distillate feeding the ABI assertion TU.
  , gated :: [GatedDecl]
  -- ^ The functions whose wrappers the version gates guard, header
  -- declaration order.
  }

-- | Distill one header's payload from its artefacts. 'Left' only when the
-- ABI distiller finds evidence of its own bug ('distillAbi').
distillPayload
  :: BindgenTarget
  -> VersionsRegistry
  -> HeaderUnit
  -> HB.HeaderArtefacts
  -> [HB.NameableModule HB.RenderedHsModule]
  -> Either Text BindgenPayload
distillPayload target registry unit arts _rendered = do
  abi <- distillAbi target.versioning unit.headerName (abiOverrides registry) arts.cDecls
  -- A base (types) module exists iff hs-bindgen produced the CType
  -- category — the alias layer's sys modules re-export it only then.
  let hasBaseModule = any ((== Just HB.CType) . (.category)) arts.family
  pure
    BindgenPayload
      { facts =
          distillFamily
            (Module.hsName unit.moduleName)
            unit.headerName
            hasBaseModule
            arts.headerComment
            arts.hsDecls
            arts.cDecls
      , abi
      , gated = gatedDecls target registry arts.cDecls
      }

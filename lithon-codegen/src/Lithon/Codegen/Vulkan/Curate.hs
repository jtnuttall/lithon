{-# LANGUAGE StrictData #-}
{-# LANGUAGE UndecidableInstances #-}

-- | The curation umbrella: profile -> closure -> prune -> report, each pass
-- reading the accumulated context through its @HasType@ constraints.
module Lithon.Codegen.Vulkan.Curate (
  Curated (..),
  curate,
) where

import Data.Generics.SOP.Builder.Typed qualified as TB
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Curate.Closure (Closure, CurateError, computeClosure)
import Lithon.Codegen.Vulkan.Curate.Profile (Profile)
import Lithon.Codegen.Vulkan.Curate.Prune (Pruned (..), pruneRegistry)
import Lithon.Codegen.Vulkan.Curate.Report (CurationReport, buildReport)
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry)

data Curated = Curated
  { registry :: ResolvedRegistry
  , closure :: Closure
  , report :: CurationReport
  }
  deriving stock (Generic)
  deriving anyclass (NFData)

curate :: Profile -> ResolvedRegistry -> Either (Errors CurateError) Curated
curate profile resolved =
  TB.buildWith fromTyped
    $ TB.inject_ (profile, resolved)
    >>> TB.injectIA computeClosure
    >>> TB.injectI pruneRegistry
    >>> TB.injectI buildReport

fromTyped :: (HasType Pruned a, HasType Closure a, HasType CurationReport a) => a -> Curated
fromTyped a =
  Curated
    { registry = a ^. typed @Pruned . #registry
    , closure = getTyped a
    , report = getTyped a
    }

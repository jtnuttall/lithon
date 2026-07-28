{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

-- | Specialize the lossless IR to a single API variant.
--
-- Phase 1 parses everything and tags each node with its api-set; this pass
-- produces the view later phases actually consume: nodes not applying to
-- the target api are dropped (SC-only types, api-split members, disabled
-- extensions), and the result must be name-unique per namespace — the
-- api-collision pairs (e.g. VK_HEADER_VERSION) collapse to the surviving
-- variant, and anything still colliding is an error, not a silent pick.
--
-- (Field updates here go through generic-lens: @changes@\/@items@\/@params@
-- exist on several record types, which GHC ≥9.10 no longer disambiguates in
-- record-update syntax.)
module Lithon.Codegen.Vulkan.Registry.Specialize (
  Specialize (..),
  Specialized (..),
) where

import GHC.Records qualified as GHC
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Registry.Types.Common (Api)

newtype Specialized a = Specialized a
  deriving stock (Eq, Show)
  deriving newtype (NFData)

type role Specialized nominal

instance (GHC.HasField x r a) => GHC.HasField x (Specialized r) a where
  getField (Specialized r) = GHC.getField @x r

instance {-# OVERLAPPING #-} (HasField' x s a) => HasField' x (Specialized s) a where
  -- An eta-reduced @field' = field' \@x@ selects THIS instance for the
  -- wrapped type and loops; the delegation to @s@ must unwrap explicitly.
  field' f (Specialized s) = Specialized <$> field' @x f s

class (HasType Api cxt) => Specialize cxt err a | err -> a, a -> err where
  specialize :: cxt -> a -> Validation err (Specialized a)

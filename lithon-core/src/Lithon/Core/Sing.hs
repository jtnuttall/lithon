-- | Core singletons machinery, re-exported so lithon code never imports
-- @Data.Singletons@ directly.
--
-- Generated enums will eventually carry singletons emitted by
-- lithon-codegen; until then, 'genSingletons' covers hand-written enums.
-- Only the core vocabulary is exposed — promoted-base machinery
-- (@singletons-base@) is deliberately out.
module Lithon.Core.Sing (
  -- * Core
  Sing,
  SingI (..),
  SingKind (..),
  SomeSing (..),
  withSomeSing,
  withSing,
  demote,

  -- * Deriving (interim, until codegen emits instances)
  genSingletons,
) where

import Data.Singletons
import Data.Singletons.TH (genSingletons)

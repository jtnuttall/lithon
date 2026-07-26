-- | Lifetime vocabulary for Haskell callbacks passed to Vulkan.
--
-- The concrete @foreign import ccall \"wrapper\"@ makers are generated per
-- function-pointer type (they need the concrete signature); this module owns
-- the lifetime discipline around them.
--
-- A wrapped Haskell closure ('FunPtr') stays alive until explicitly freed
-- with 'Foreign.Ptr.freeHaskellFunPtr' — and must not be freed while Vulkan
-- can still call it (e.g. a debug-utils messenger callback must outlive the
-- messenger object). 'withCallback' brackets the common
-- create-use-destroy-free shape.
module Lithon.Core.Funptr (
  withCallback,
) where

import Control.Exception (bracket)
import Control.Monad.IO.Unlift (MonadUnliftIO, withRunInIO)
import Foreign.Ptr (FunPtr, freeHaskellFunPtr)

-- | Bracket a wrapped Haskell callback: make it, use it, free it. The
-- callback must not be reachable by Vulkan after the continuation returns —
-- destroy any object registered with it inside the continuation.
withCallback :: (MonadUnliftIO m) => IO (FunPtr f) -> (FunPtr f -> m a) -> m a
withCallback mk use = withRunInIO \run -> bracket mk freeHaskellFunPtr (run . use)

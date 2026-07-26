{-# LANGUAGE ImplicitParams #-}

module Lithon.Effect.Util (mapDynError) where

import Effectful
import Effectful.Error.Dynamic qualified as EDyn

import Lithon.Prelude

mapDynError
  :: forall e' e es a
   . (EDyn.Error e :> es, Show e) => (e' -> e) -> Eff es (Either (CallStack, e') a) -> Eff es a
mapDynError f = (>>= either rethrow pure)
 where
  rethrow (cs, e) =
    let ?callStack = cs
     in withFrozenCallStack $ EDyn.throwError (f e)

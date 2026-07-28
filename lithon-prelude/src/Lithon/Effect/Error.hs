{-# LANGUAGE ImplicitParams #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Lithon.Effect.Error (
  module Effectful.Error.Dynamic,
  runRethrow,
  runErrorFrom,
  runErrorDisplay,
  mapError,
) where

import Effectful
import Effectful.Error.Dynamic

import Lithon.Prelude

runRethrow
  :: forall e' e es a. (Error e :> es, Show e) => (e' -> e) -> Eff (Error e' : es) a -> Eff es a
runRethrow f = runErrorWith \cs e ->
  let ?callStack = cs
   in withFrozenCallStack $ throwError (f e)

runErrorFrom
  :: forall e' e es a. (Error e :> es, Show e, From e' e) => Eff (Error e' : es) a -> Eff es a
runErrorFrom = runRethrow from

runErrorDisplay :: forall e es a. (Error Text :> es, Display e) => Eff (Error e : es) a -> Eff es a
runErrorDisplay = runRethrow display

mapError
  :: forall e' e es a
   . (Error e :> es, Show e) => (e' -> e) -> Eff es (Either (CallStack, e') a) -> Eff es a
mapError f = (>>= either rethrow pure)
 where
  rethrow (cs, e) =
    let ?callStack = cs
     in withFrozenCallStack $ throwError (f e)

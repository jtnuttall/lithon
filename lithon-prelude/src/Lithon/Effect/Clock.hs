{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -Wno-redundant-constraints #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

-- |
-- Small monotonic clock effect for tracking performance of certain codegen
-- and build operations. Nothing fancy.
module Lithon.Effect.Clock (
  Clock,
  Timespan,
  renderTimespan,
  runClock,
  timedWith,
  timedWithWHNF,
  timedWithNF,
  timedWithStrat,
) where

import Control.Exception (evaluate)
import Effectful (Dispatch (..), DispatchOf, Eff, Effect, IOE, (:>))
import Effectful.Dispatch.Static (SideEffects (..), StaticRep, evalStaticRep, unsafeEff_)
import GHC.Clock qualified
import Text.Printf (printf)

import Lithon.Prelude

data Clock :: Effect
type instance DispatchOf Clock = Static WithSideEffects
data instance StaticRep Clock = Clock

data Timespan = Timespan
  { start :: Double
  , end :: Double
  }
  deriving stock (Show)

renderTimespan :: (IsString a) => Timespan -> a
renderTimespan t
  | secs < 0.001 = fromString $ printf "%.0fus" (secs * 10_000)
  | secs < 1 = fromString $ printf "%.0fms" (secs * 1_000)
  | otherwise = fromString $ printf "%.2f" secs
 where
  secs = t.end - t.start

runClock :: (IOE :> es) => Eff (Clock : es) a -> Eff es a
runClock = evalStaticRep Clock

monotime :: (Clock :> es) => Eff es Double
monotime = unsafeEff_ GHC.Clock.getMonotonicTime

timedWith :: (Clock :> es) => (a -> Timespan -> Eff es r) -> Eff es a -> Eff es r
timedWith = timedWithStrat (const $ pure ())

timedWithWHNF :: (Clock :> es) => (a -> Timespan -> Eff es r) -> Eff es a -> Eff es r
timedWithWHNF = timedWithStrat (unsafeEff_ . evaluate . (`seq` ()))

timedWithNF :: (NFData a, Clock :> es) => (a -> Timespan -> Eff es r) -> Eff es a -> Eff es r
timedWithNF = timedWithStrat (unsafeEff_ . evaluate . rnf)

timedWithStrat
  :: (Clock :> es) => (a -> Eff es ()) -> (a -> Timespan -> Eff es r) -> Eff es a -> Eff es r
timedWithStrat eval f act = do
  start <- monotime
  a <- act
  eval a
  end <- monotime
  f a Timespan{..}

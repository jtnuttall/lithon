{-# LANGUAGE CPP #-}

-- |
-- [rapidhash](https://github.com/Nicoshev/rapidhash) is a very fast, high-quality,
-- non-cryptographic and platform-independent hash.
--
-- This library provides rapidhash v3.
--
-- In microbenchmarks it outperforms xxhash3 (and
-- 'Data.Hashable.hashWithSalt', which is currently based on xxhash3) at
-- all but the smallest inputs; below ~16 bytes, constant factors dominate
-- and xxhash3-based hashers can edge it out (see the README benchmarks).
--
-- This module can be imported unqualified.
--
-- 'Data.Aeson.ToJSON'\/'Data.Aeson.FromJSON' and
-- 'Data.Aeson.ToJSONKey'\/'Data.Aeson.FromJSONKey' are provided behind the
-- @aeson@ Cabal flag.
--
-- === __Security and HashDoS__
--
-- This is not a cryptographically secure hash. Use something else if
-- you need cryptographic security.
--
-- rapidhash's C implementation supports a @RAPIDHASH_PROTECTED@ preprocessor
-- define that trades performance for more collision resistance. It is off by
-- default.
--
-- See the [upstream documentation](https://github.com/Nicoshev/rapidhash) for more
-- configuration flags and technical details.
module Data.Hash.RapidHash (
  -- |
  -- To use rapidhash, you'll generally just use the 'rapidhash' helper function.
  -- A seed override can be provided by using 'rapidhashWithSeed' if desired.
  rapidhash,
  RapidHashable (..),
  RapidSeed (..),

  -- * Hashes

  -- ** rapidhash

  --

  -- |
  -- The general-purpose rapidhash algorithm.
  --
  -- 'RapidHash' is a newtype that provides some affordances for ergonomic, efficient use.
  RapidHash (..),

  -- *** Serialization
  rapidHashTextBuilder,
  showRapidHashText,
  showRapidHashBS,

  -- *** Parsing
  parseRapidHashText,
  parseRapidHashBS,

  -- *** File hashing

  --

  -- |
  -- These are simply useful helpers for hashing a file, assuming you don't need
  -- to do anything else with the contents. Beware large files. These helpers
  -- use strict 'Data.ByteString.ByteString' and will pause the capability and
  -- garbage collector.
  rapidhashFileWithSeed,
  rapidhashFile,

  -- *** DerivingVia
  HashViaRapidHash (..),

  -- ** rapidhashMicro

  --

  -- |
  -- A variant of rapidhash tuned for small keys, aimed at workloads where cache
  -- misses dominate. Upstream reports it faster than rapidhash for inputs up to
  -- 512 bytes, and 15-20% slower above 1kb.
  --
  -- Digests are identical to 'rapidhash' for inputs of 80 bytes or fewer and
  -- diverge from 81 bytes on, so the two are not interchangeable in storage.
  -- Hence the separate type and tag.
  rapidhashMicro,
  RapidHashMicro (..),

  -- *** Serialization
  rapidhashMicroTextBuilder,
  showRapidHashMicroBS,
  showRapidHashMicroText,

  -- *** Parsing
  parseRapidHashMicroText,
  parseRapidHashMicroBS,

  -- *** DerivingVia
  HashViaRapidHashMicro (..),

  -- * Re-exports
  Prim,
  Storable,
) where

import Data.Primitive.Types (Prim)
import Foreign.Storable (Storable)
import Prelude ()

import Data.Hash.RapidHash.Class (
  HashViaRapidHash (..),
  HashViaRapidHashMicro (..),
  RapidHashable (..),
  rapidhash,
  rapidhashFile,
  rapidhashFileWithSeed,
  rapidhashMicro,
 )
import Data.Hash.RapidHash.Types (
  RapidHash (..),
  RapidHashMicro (..),
  RapidSeed (..),
  parseRapidHashBS,
  parseRapidHashMicroBS,
  parseRapidHashMicroText,
  parseRapidHashText,
  rapidHashTextBuilder,
  rapidhashMicroTextBuilder,
  showRapidHashBS,
  showRapidHashMicroBS,
  showRapidHashMicroText,
  showRapidHashText,
 )

#ifdef WANT_AESON
-- Orphans only
import Data.Hash.RapidHash.Aeson ()
#endif

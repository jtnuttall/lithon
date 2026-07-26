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

  --

  -- | 'RapidHash' is a newtype that provides some affordances for ergonomic, efficient use.
  RapidHash (..),

  -- * Serialization
  rapidHashTextBuilder,
  showRapidHashText,
  showRapidHashBS,

  -- * Parsing
  parseRapidHashText,
  parseRapidHashBS,

  -- * File hashing

  --

  -- |
  -- These are simply useful helpers for hashing a file, assuming you don't need
  -- to do anything else with the contents. They use strict 'Data.ByteString.ByteString'
  -- under the hood, so beware very large files: besides residency, the hash
  -- itself is a single @unsafe@ FFI call, which blocks garbage collection
  -- across all capabilities for its duration (rapidhash processes tens of
  -- GB/s, so this matters only for very large inputs).
  rapidhashFileWithSeed,
  rapidhashFile,

  -- * DerivingVia

  --

  -- | Helpers for deriving 'Data.Hashable.Hashable' and other useful classes.
  HashViaRapidHash (..),

  -- * Re-exports
  Prim,
  Storable,
) where

import Data.Primitive.Types (Prim)
import Foreign.Storable (Storable)
import Prelude ()

import Data.Hash.RapidHash.Class (
  HashViaRapidHash (..),
  RapidHashable (..),
  rapidhash,
  rapidhashFile,
  rapidhashFileWithSeed,
 )
import Data.Hash.RapidHash.Types (
  RapidHash (..),
  RapidSeed (..),
  parseRapidHashBS,
  parseRapidHashText,
  rapidHashTextBuilder,
  showRapidHashBS,
  showRapidHashText,
 )

#ifdef WANT_AESON
-- Orphans only
import Data.Hash.RapidHash.Aeson ()
#endif

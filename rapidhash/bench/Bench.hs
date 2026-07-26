{-# LANGUAGE OverloadedStrings #-}

-- |
-- Comparative benchmarks for rapidhash.
--
-- Methodology notes:
--
--   * The ByteString group is the canonical comparison: every hasher
--     consumes exactly the same bytes. The Text group only includes hashers
--     with native Text support.
--   * @hashable@ is a familiar throughput baseline, but it is not a stable
--     digest intended for persistence. It is here to compare relative speed only.
--     At present, its ByteString/Text paths are calls to the C implementation of xxhash3.
--   * @murmur-hash@ is a pure-Haskell implementation (MurmurHash2, 64-bit).
--
-- Run:
--
-- > cabal bench rapidhash-bench --benchmark-options='--csv bench.csv --stdev 2'
module Main (main) where

import Data.ByteString (ByteString)
import Data.ByteString qualified as BS
import Data.Digest.Murmur64 (asWord64, hash64)
import Data.Digest.XXHash.FFI (XXH3 (XXH3))
import Data.Hashable (hash)
import Data.Text (Text)
import Data.Text qualified as T
import Test.Tasty.Bench (Benchmark, bench, bgroup, defaultMain, env, whnf)

import Data.Hash.RapidHash (rapidhash)

sizes :: [Int]
sizes = [8, 64, 1024, 64 * 1024, 1024 * 1024]

sizeLabel :: Int -> String
sizeLabel n
  | n < 1024 = show n <> "B"
  | n < 1024 * 1024 = show (n `div` 1024) <> "KiB"
  | otherwise = show (n `div` (1024 * 1024)) <> "MiB"

mkBS :: Int -> ByteString
mkBS n = BS.pack [fromIntegral (i * 167 + 13) | i <- [0 .. n - 1]]

mkText :: Int -> Text
mkText n = T.pack (take n (cycle ['a' .. 'z']))

byteStringBench :: Int -> Benchmark
byteStringBench n = env (pure (mkBS n)) \bs ->
  bgroup
    (sizeLabel n)
    [ bench "rapidhash" $ whnf rapidhash bs
    , bench "xxh3 (xxhash-ffi)" $ whnf (hash . XXH3) bs
    , bench "hashable" $ whnf hash bs
    , bench "murmur2 (murmur-hash)" $ whnf (asWord64 . hash64) bs
    ]

textBench :: Int -> Benchmark
textBench n = env (pure (mkText n)) \t ->
  bgroup
    (sizeLabel n)
    [ bench "rapidhash" $ whnf rapidhash t
    , bench "xxh3 (xxhash-ffi)" $ whnf (hash . XXH3) t
    , bench "hashable" $ whnf hash t
    ]

main :: IO ()
main =
  defaultMain
    [ bgroup "ByteString" (map byteStringBench sizes)
    , bgroup "Text" (map textBench sizes)
    ]

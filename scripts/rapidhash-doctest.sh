#!/usr/bin/env bash
# Run rapidhash's doctest suite (doctest-parallel).
#
# rapidhash has its own cabal.project so the doctest session resolves against
# the package's Hackage closure instead of the monorepo's, and so an accurate
# .ghc.environment file is written next to the package.
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/../rapidhash"

cabal build all

if [ -n "${IN_NIX_SHELL:-}" ]; then
  store_db=$(ls -d "$(cabal path --store-dir)/ghc-$(ghc --numeric-version)"*/package.db | head -n1)
  bin=$(cabal list-bin rapidhash:rapidhash-doctest)
  GHC_PACKAGE_PATH="${store_db}:" "$bin" "$@"
else
  cabal run rapidhash:rapidhash-doctest -- "$@"
fi

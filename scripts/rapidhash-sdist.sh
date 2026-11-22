#!/usr/bin/env bash
# Release gate for rapidhash and rapidhash-aeson: build, test, doctest,
# haddock and `cabal check` each from its sdist, the way Hackage consumers
# get them (`just rapidhash-sdist`).
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

sdist="${RUNNER_TEMP:-$(mktemp -d)}/sdist"
mkdir -p "$sdist"

echo "== rapidhash: sdist sanity =="
(cd rapidhash && cabal sdist --ignore-project -o "$sdist")
tar -tzf "$sdist"/rapidhash-*.tar.gz | grep -E 'cbits/rapidhash(_ext)?\.h$'
tar -tzf "$sdist"/rapidhash-*.tar.gz | grep -F 'test/pin/rapidhash-v3-pin.txt'

echo "== rapidhash: build, test, doctest, haddock, check from the sdist =="
(
  cd "$sdist"
  tar -xzf rapidhash-*.tar.gz
  cd rapidhash-*/
  cabal update
  cabal build --enable-tests --write-ghc-environment-files=always
  cabal test rapidhash-test --enable-tests --write-ghc-environment-files=always --test-show-details=direct
  cabal run rapidhash:rapidhash-doctest --enable-tests --write-ghc-environment-files=always
  cabal haddock
  cabal check
)

echo "== rapidhash-aeson: build, test, haddock, check from its sdist against the rapidhash sdist =="
(cd rapidhash-aeson && cabal sdist --ignore-project -o "$sdist")
(
  cd "$sdist"
  tar -xzf rapidhash-aeson-*.tar.gz
  printf 'packages: %s %s\n' rapidhash-[0-9]*/ rapidhash-aeson-*/ >cabal.project
  cabal build rapidhash-aeson --enable-tests --write-ghc-environment-files=always
  cabal test rapidhash-aeson --enable-tests --test-show-details=direct
  cabal haddock rapidhash-aeson
  (cd rapidhash-aeson-*/ && cabal check)
)

echo "== rapidhash sdists green =="

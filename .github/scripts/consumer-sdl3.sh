#!/usr/bin/env bash

set -uxeo pipefail

CHECK_ABI="${CHECK_ABI:-false}"

if [ "$RUNNER_OS" = "Windows" ]; then
  # Patch the SDL setup action's pkgconfig path.
  CLEAN_PKG_CONFIG_PATH=$(cygpath -u "${PKG_CONFIG_PATH:-}")

  export PKG_CONFIG_PATH="/c/msys64/ucrt64/lib/pkgconfig:${CLEAN_PKG_CONFIG_PATH}"
  export PATH="/c/msys64/ucrt64/bin:$PATH"
elif [ "$RUNNER_OS" = "Linux" ]; then
  export PKG_CONFIG_PATH="$HOME/sdl3/lib/pkgconfig:${PKG_CONFIG_PATH:-}"
fi

pkg-config --modversion sdl3

mkdir -p "$RUNNER_TEMP/sdist"
(cd sdl3-bindgen-sys && cabal sdist --ignore-project -o "$RUNNER_TEMP/sdist")
cd "$RUNNER_TEMP/sdist"
tar -xzf sdl3-bindgen-sys-*.tar.gz
cd sdl3-bindgen-sys-*/

cabal update

if [ "$CHECK_ABI" = "true" ]; then
  cabal build --constraint="sdl3-bindgen-sys +abi-assertions-exact"
else
  cabal build
fi

if [ "$RUNNER_OS" != "Windows" ]; then cabal haddock; fi
if [ "$RUNNER_OS" = "Linux" ]; then cabal check; fi

#!/usr/bin/env bash

set -uxeo pipefail

STRICT_CHECK_ABI="${STRICT_CHECK_ABI:-false}"

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

report_build_failure() {
  if [ "$STRICT_CHECK_ABI" = "true" ]; then
    cat <<'EOF'
The build failed with the strict ABI check enabled. If this failed on a static 
assert, this means that the latest stable version of SDL3 contains ABI changes 
incompatible with the library's ABI verification method.

This may happen from time to time, and will not break compilation for downstream
users. The library is designed to support guaranteed-backwards-compatible changes
without alterations. It's worth checking the specific ABI failure to make sure this
property holds.

Fixing this is a standard operation for the library.
EOF
  else
    cat <<'EOF'
The build failed with the default ABI check enabled. If this failed on a static 
assert, this means that the latest stable version of SDL3 contains ABI changes 
incompatible with the library's /lenient/ ABI verification method.

This almost certainly indicates that the library's ABI check is too naive or strict
and needs to be updated.

**This will break compilation for any downstream user of the library.**
EOF
  fi
}

if [ "$STRICT_CHECK_ABI" = "true" ]; then
  cabal build --constraint="sdl3-bindgen-sys +abi-assertions-exact"
else
  cabal build
fi || report_build_failure

if [ "$RUNNER_OS" != "Windows" ]; then cabal haddock; fi
if [ "$RUNNER_OS" = "Linux" ]; then cabal check; fi

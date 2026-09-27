#!/usr/bin/env bash
# Build a *-bindgen-sys package the way a consumer does: from its sdist,
# against whatever the named pkg-config package resolves to, then haddock
# and cabal check.
#
# Usage: consumer-bindgen-sys.sh <package> <pkg-config-name>
#   e.g. consumer-bindgen-sys.sh sdl3-bindgen-sys sdl3

set -uxeo pipefail

if [ "$#" -ne 2 ]; then
  echo "usage: $0 <package> <pkg-config-name>" >&2
  exit 2
fi
package="$1"
pkg="$2"

case "$pkg" in
  sdl3) library=SDL3 ;;
  mpv) library=libmpv ;;
  *) library="$pkg" ;;
esac

STRICT_CHECK_ABI="${STRICT_CHECK_ABI:-false}"

if [ "$RUNNER_OS" = "Windows" ]; then
  # setup-sdl exports a Windows-style PKG_CONFIG_PATH; nothing does for mpv.
  CLEAN_PKG_CONFIG_PATH=""
  if [ -n "${PKG_CONFIG_PATH:-}" ]; then
    CLEAN_PKG_CONFIG_PATH=":$(cygpath -u "$PKG_CONFIG_PATH")"
  fi
  export PKG_CONFIG_PATH="/c/msys64/ucrt64/lib/pkgconfig${CLEAN_PKG_CONFIG_PATH}"
  export PATH="/c/msys64/ucrt64/bin:$PATH"
  if [ "$pkg" != sdl3 ]; then
    # Some .pc files in the MSYS2 prefix carry POSIX paths that pkgconf's
    # prefix relocation leaves alone (-I/ucrt64/include), and Cabal 3.18
    # rejects a drive-less include dir when it registers the package
    # ("makeRelativePathEx: absolute path /ucrt64/include"). Cabal sets
    # PKG_CONFIG_ALLOW_SYSTEM_CFLAGS, so filtering them as system paths does
    # nothing; rooting them at the MSYS2 install does. pkgconf prefixes the
    # sysroot to every -I/-L outside it, so sdl3 (setup-sdl's .pc lives
    # elsewhere and already carries Windows paths) must not get it.
    export PKG_CONFIG_SYSROOT_DIR=C:/msys64
  fi
elif [ "$RUNNER_OS" = "Linux" ] && [ "$pkg" = "sdl3" ]; then
  # The SDL setup action installs under $HOME/sdl3.
  export PKG_CONFIG_PATH="$HOME/sdl3/lib/pkgconfig:${PKG_CONFIG_PATH:-}"
fi

pkg-config --modversion "$pkg"
# What cabal will see: it runs pkg-config with system paths kept. The
# register step rejects drive-less -I paths on Windows.
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
  pkg-config --cflags --libs "$pkg"

mkdir -p "$RUNNER_TEMP/sdist"
(cd "$package" && cabal sdist --ignore-project -o "$RUNNER_TEMP/sdist")
cd "$RUNNER_TEMP/sdist"
tar -xzf "$package"-*.tar.gz
cd "$package"-*/

cabal update

report_build_failure() {
  if [ "$STRICT_CHECK_ABI" = "true" ]; then
    cat <<EOF
The build failed with the strict ABI check enabled. If this failed on a static 
assert, this means that the latest stable version of $library contains ABI changes 
incompatible with the library's ABI verification method.

This may happen from time to time, and will not break compilation for downstream
users. The library is designed to support guaranteed-backwards-compatible changes
without alterations. It's worth checking the specific ABI failure to make sure this
property holds.

Fixing this is a standard operation for the library.
EOF
  else
    cat <<EOF
The build failed with the default ABI check enabled. If this failed on a static 
assert, this means that this version of $library contains ABI changes 
incompatible with the library's /lenient/ ABI verification method.

This almost certainly indicates that the library's ABI check is too naive or strict
and needs to be updated.

**This will break compilation for any downstream user of the library.**
EOF
  fi
}

if [ "$STRICT_CHECK_ABI" = "true" ]; then
  cabal build --constraint="$package +abi-assertions-exact"
else
  cabal build
fi || { report_build_failure; exit 1; }

if [ "$RUNNER_OS" != "Windows" ]; then cabal haddock; fi
if [ "$RUNNER_OS" = "Linux" ]; then cabal check; fi

#!/usr/bin/env bash
# Runs checks for each major lithon package. Designed to be runnable
# locally and in CI.
set -euo pipefail
cd "$(dirname "$0")/.."

: "${LLVM_PATH:?LLVM_PATH must be set (the nix devshell exports it)}"
: "${BINDGEN_EXTRA_CLANG_ARGS:?BINDGEN_EXTRA_CLANG_ARGS must be set (the nix devshell hook exports it)}"

# Guarantee a Vulkan ICD even off-NixOS (CI runners have no
# /run/opengl-driver); additive, so local real GPUs stay visible.
if [[ -n "${LITHON_LAVAPIPE_ICD:-}" ]]; then
  export VK_ADD_DRIVER_FILES="${LITHON_LAVAPIPE_ICD}${VK_ADD_DRIVER_FILES:+:${VK_ADD_DRIVER_FILES}}"
fi

PROFILE=lithon-codegen/data/vulkan/profiles/lithon-core.json

echo "== build =="
cabal build all

echo "== generated tree freshness (vulkan) =="
cabal run lithon-codegen -- vulkan generate --profile "$PROFILE" --check

echo "== generated tree freshness (sdl3: specs + sdl3-bindgen-sys) =="
cabal run lithon-codegen -- sdl3 generate --check

echo "== rendered-doc regressions (sdl3-bindgen-sys) =="
for pat in '@@' '[__@@__]' '__Returns:__' '__Thread safety:__' '__See:__' '__C declaration:__' '__defined at:__' '__exported by:__'; do
  if hits=$(grep -rF -l -- "$pat" sdl3-bindgen-sys/src); then
    echo "doc regression: pattern '$pat' present in:"
    echo "$hits" | head -5
    exit 1
  fi
done

echo "== tests =="
# rapidhash:rapidhash-test only: the doctest suite runs via its dedicated
# script below, which also rebuilds the standalone rapidhash/dist-newstyle
# that doctest-parallel's walk-up discovery would otherwise load stale.
cabal test lithon-codegen lithon-core lithon-examples rapidhash:rapidhash-test

echo "== rapidhash pin (C reference vs committed vectors) =="
./scripts/rapidhash-pin.sh

echo "== rapidhash doctests =="
./scripts/rapidhash-doctest.sh

echo "== haddock =="
cabal haddock lithon-vk
cabal haddock sdl3-bindgen-sys
cabal haddock rapidhash

echo "== triangle-offscreen (lavapipe) =="
out=$(cd "$(mktemp -d)" && cabal --project-dir="$OLDPWD" run -v0 lithon-examples:triangle-offscreen 2>&1) || {
  echo "$out"
  echo "triangle failed"
  exit 1
}
echo "$out"
if grep -qi "validation error" <<<"$out"; then
  echo "validation layer reported errors"
  exit 1
fi

echo "== triangle-sdl headless (lavapipe) =="
out=$(SDL_VIDEODRIVER=offscreen cabal run -v0 lithon-examples:triangle-sdl -- --frames 60 2>&1) || {
  echo "$out"
  echo "triangle-sdl failed"
  exit 1
}
echo "$out"
if grep -qi "validation error" <<<"$out"; then
  echo "validation layer reported errors"
  exit 1
fi

echo "== sdl3-raw triangle headless (generated sys bindings, probe-asserted) =="
SDL_VIDEODRIVER=offscreen cabal run -v0 lithon-examples:sdl3-raw -- --frames 60

echo "== shmup headless (apecs over the generated sys bindings, probe-asserted) =="
SDL_VIDEODRIVER=offscreen cabal run -v0 lithon-examples:shmup -- --frames 60

echo "== all gates green =="

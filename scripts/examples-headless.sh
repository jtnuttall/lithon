#!/usr/bin/env bash
# Run every example headlessly under lavapipe / SDL's offscreen driver and
# fail on validation-layer errors (`just examples`). The nix checks run the
# same programs hermetically; this is the cabal-side loop.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

# Guarantee a Vulkan ICD even off-NixOS; additive, so real GPUs stay visible.
if [[ -n ${LITHON_LAVAPIPE_ICD:-} ]]; then
  export VK_ADD_DRIVER_FILES="${LITHON_LAVAPIPE_ICD}${VK_ADD_DRIVER_FILES:+:${VK_ADD_DRIVER_FILES}}"
fi
export SDL_VIDEODRIVER=offscreen

# run <label> <cabal run args...>: echo the output, fail on a non-zero exit
# or on a validation-layer report.
run() {
  local label=$1
  shift
  echo "== $label =="
  local log
  log=$(cabal run -v0 "$@" 2>&1) || {
    echo "$log"
    echo "$label failed"
    exit 1
  }
  echo "$log"
  if grep -qi "validation error" <<<"$log"; then
    echo "validation layer reported errors"
    exit 1
  fi
}

run "triangle-offscreen (lavapipe)" lithon-examples:triangle-offscreen
run "triangle-sdl headless (lavapipe)" lithon-examples:triangle-sdl -- --frames 60
run "sdl3-raw triangle headless (generated sys bindings)" lithon-examples:sdl3-raw -- --frames 60
run "shmup headless (apecs over the generated sys bindings)" lithon-examples:shmup -- --frames 60
run "mpv-headless (generated libmpv bindings, lavfi test source)" lithon-examples:mpv-headless

echo "== all examples green =="

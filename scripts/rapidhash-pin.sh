#!/usr/bin/env bash
# Verify (or with --regen, regenerate) rapidhash's committed known-answer
# vectors against a C reference program compiled from the vendored upstream
# header. This runs the C-side pinning program.
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."
golden=rapidhash/test/pin/rapidhash-v3-pin.txt

out=$(mktemp -d)
trap 'rm -rf "$out"' EXIT

: "${CC:=cc}"
"$CC" -O2 -Irapidhash/cbits -o "$out/pin" rapidhash/test/pin/pin.c
"$out/pin" >"$out/pin.txt"

if [ "${1:-}" = "--regen" ]; then
  cp "$out/pin.txt" "$golden"
  echo "regenerated $golden ($(wc -l <"$golden") vectors)"
else
  diff -u "$golden" "$out/pin.txt"
  echo "OK: C reference output matches $golden ($(wc -l <"$golden") vectors)"
fi

# Recipes are bash everywhere (CI's Windows runners carry Git Bash).
set shell := ["bash", "-euo", "pipefail", "-c"]
set windows-shell := ["bash", "-euo", "pipefail", "-c"]

# Empty where nix is absent (the cabal-only CI jobs); only the nix recipes use it.
system := `nix eval --raw --impure --expr builtins.currentSystem 2>/dev/null || true`
ifd := "--option allow-import-from-derivation true"
profile := "lithon-codegen/data/vulkan/profiles/lithon-core.json"

default:
    @just --list

# == nix ==

# Run all flake checks; extra flags pass through (e.g. just check --skip-cached)
check *args:
    nix-fast-build --flake '.#checks.{{system}}' {{ifd}} {{args}}

# Run a single check
check-one name:
    nix-fast-build --flake '.#checks.{{system}}.{{name}}' {{ifd}}

# == cabal-side loops (the nix checks run these hermetically) ==

# Test suites (rapidhash's doctest suite runs via `just doctest`)
test:
    cabal test lithon-codegen lithon-core lithon-examples rapidhash:rapidhash-test rapidhash-aeson

# rapidhash doctests (doctest-parallel; can't run under haskell.nix)
doctest:
    ./scripts/rapidhash-doctest.sh

# Haddock the published packages
haddock:
    cabal haddock lithon-vk
    cabal haddock sdl3-bindgen-sys
    cabal haddock mpv-bindgen-sys
    cabal haddock rapidhash
    cabal haddock rapidhash-aeson

# Run every example headlessly (lavapipe / SDL offscreen), failing on validation errors
examples:
    ./scripts/examples-headless.sh

# Check external links in hand-written sources (config: lychee.toml; set GITHUB_TOKEN to dodge GitHub's rate limit)
links:
    lychee '**/*.md' '**/*.cabal' '**/package.yaml' '**/*.hs' '**/*.nix' '.github/**/*.yml'

# == hpack ==

# Regenerate every package's .cabal from its package.yaml
hpack:
    for f in */package.yaml; do (cd "$(dirname "$f")" && hpack); done

# Fail if any committed .cabal differs from hpack's output
hpack-check:
    for f in */package.yaml; do \
      dir=$(dirname "$f"); \
      cabal_file=$(ls "$dir"/*.cabal); \
      (cd "$dir" && hpack - | diff -u "$(basename "$cabal_file")" -) \
        || { echo "$cabal_file is stale; run 'just hpack'"; exit 1; }; \
    done

# == rapidhash ==

# Verify (or --regen) the committed vectors against the C reference
rapidhash-pin *args:
    ./scripts/rapidhash-pin.sh {{args}}

# Build, test, doctest, haddock and `cabal check` rapidhash and rapidhash-aeson from their sdists
rapidhash-sdist:
    ./scripts/rapidhash-sdist.sh

# == *-bindgen-sys ==

# Build a *-bindgen-sys package from its sdist as a consumer would; strict=true also compiles with -f strict
sdist-consumer package pkgconfig strict="false":
    ./scripts/consumer-bindgen-sys.sh {{package}} {{pkgconfig}} {{strict}}

# == codegen ==

build-codegen:
    cabal build lithon-codegen

# Regenerate every binding
[parallel]
codegen: codegen-vulkan codegen-mpv codegen-sdl3

codegen-vulkan: build-codegen
    cabal run lithon-codegen -- vulkan generate --profile {{profile}}

codegen-mpv: build-codegen
    cabal run lithon-codegen -- mpv generate --yes

codegen-sdl3: build-codegen
    cabal run lithon-codegen -- sdl3 generate --yes

# Fail if any generated tree is stale
[parallel]
codegen-check: codegen-check-vulkan codegen-check-mpv codegen-check-sdl3

codegen-check-vulkan: build-codegen
    cabal run lithon-codegen -- vulkan generate --profile {{profile}} --check

codegen-check-mpv: build-codegen
    cabal run lithon-codegen -- mpv generate --check

codegen-check-sdl3: build-codegen
    cabal run lithon-codegen -- sdl3 generate --check

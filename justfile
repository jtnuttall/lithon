system := `nix eval --raw --impure --expr builtins.currentSystem`
ifd := "--option allow-import-from-derivation true"

default:
    @just --list

# Run all flake checks; extra flags pass through (e.g. just check --skip-cached)
check *args:
    nix-fast-build --flake '.#checks.{{system}}' {{ifd}} {{args}}

# Run a single check
check-one name:
    nix-fast-build --flake '.#checks.{{system}}.{{name}}' {{ifd}}

doctest:
    ./scripts/rapidhash-doctest.sh

# Check external links in hand-written sources (config: lychee.toml).
# Set GITHUB_TOKEN to avoid GitHub's anonymous rate limit.
links:
    lychee '**/*.md' '**/*.cabal' '**/package.yaml' '**/*.hs' '**/*.nix' '.github/**/*.yml'

build-codegen:
    cabal build lithon-codegen

[parallel]
codegen: codegen-vulkan codegen-mpv codegen-sdl3

codegen-vulkan: build-codegen
    cabal run lithon-codegen -- vulkan generate --profile lithon-codegen/data/vulkan/profiles/lithon-core.json

codegen-mpv: build-codegen
    cabal run lithon-codegen -- mpv generate --yes

codegen-sdl3: build-codegen
    cabal run lithon-codegen -- sdl3 generate --yes

set shell := ["bash", "-euo", "pipefail", "-c"]
set windows-shell := ["bash", "-euo", "pipefail", "-c"]

system := `nix eval --raw --impure --expr builtins.currentSystem 2>/dev/null || true`
ifd := "--option allow-import-from-derivation true"
profile := "lithon-codegen/data/vulkan/profiles/lithon-core.json"

default:
    @just --list

# == formatting, linting, independent testing ==

fmt *args:
    nix fmt {{args}}

# doctest-parallel doesn't work trivially and reliably under haskell.nix
doctest:
    ./scripts/rapidhash-doctest.sh

haddock *targets="all":
    cabal haddock {{targets}}

links:
    lychee '**/*.md' '**/*.cabal' '**/package.yaml' '**/*.hs' '**/*.nix' '.github/**/*.yml'

# == nix checks ==

# Runs all checks, including formatting checks
check *args:
    nix-fast-build --flake '.#checks.{{system}}' {{ifd}} {{args}}

check-one name:
    nix-fast-build --flake '.#checks.{{system}}.{{name}}' {{ifd}}

# == Explicit tests via cabal ==

test *targets="all":
    cabal test {{targets}}

examples:
    ./scripts/examples-headless.sh

# == hpack ==

hpack:
    for f in */package.yaml; do \
      (cd "$(dirname "$f")" && hpack) \
    done

hpack-check:
    for f in */package.yaml; do \
      dir=$(dirname "$f"); \
      cabal_file=$(ls "$dir"/*.cabal); \
      (cd "$dir" && hpack - | diff -u "$(basename "$cabal_file")" -) \
        || { echo "$cabal_file is stale; run 'just hpack'"; exit 1; }; \
    done

# == rapidhash ==

rapidhash-pin *args:
    ./scripts/rapidhash-pin.sh {{args}}

rapidhash-sdist:
    ./scripts/rapidhash-sdist.sh

# == bindgen packages ==

# Build a bindgen package from its sdist as a consumer would
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

default:
    @just --list

check:
    nix flake check '.?submodules=1' --allow-import-from-derivation

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

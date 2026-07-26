{
  description = "Lithon - family of rendering packages for Haskell";

  inputs = {
    haskellNix.url = "github:input-output-hk/haskell.nix";
    nixpkgs.follows = "haskellNix/nixpkgs-unstable";
    hackage = {
      url = "github:input-output-hk/hackage.nix";
      flake = false;
    };
    haskellNix.inputs.hackage.follows = "hackage";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    haskellNix,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          inherit (haskellNix) config;
          overlays = [
            haskellNix.overlay
            (final: prev: {
              haskell-nix =
                prev.haskell-nix
                // {
                  extraPkgconfigMappings =
                    (prev.haskell-nix.extraPkgconfigMappings or {})
                    // {
                      "sdl3" = ["sdl3"];
                    };
                };
            })
          ];
        };

        project = with pkgs; let
          # hs-bindgen supports LLVM/Clang 16 through 22
          llvmPkgs = llvmPackages_22;
          hsBindgenHook = callPackage ./nix/hs-bindgen/hs-bindgen-hook.nix {
            llvmPackages = llvmPkgs;
          };
          # libclang-bindings' configure honors LLVM_PATH (checked before
          # llvm-config) and expects $LLVM_PATH/{lib,include}. nixpkgs splits
          # libclang.so (lib output) from the clang-c headers (dev output),
          # and llvm-config only reports LLVM's own dirs, so join the two
          # outputs into the expected layout.
          libclangPrefix = symlinkJoin {
            name = "libclang-prefix";
            paths = [
              (lib.getLib llvmPkgs.libclang)
              (lib.getDev llvmPkgs.libclang)
            ];
          };
          sdl3Hook = ''
            BINDGEN_EXTRA_CLANG_ARGS="-isystem ${sdl3}/include ''${BINDGEN_EXTRA_CLANG_ARGS:-}"
            export BINDGEN_EXTRA_CLANG_ARGS
            C_INCLUDE_PATH="${sdl3}/include''${C_INCLUDE_PATH:+:''${C_INCLUDE_PATH}}"
            export C_INCLUDE_PATH
            # Note the brackets around [ sdl3 ] here!
            LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [sdl3]}''${LD_LIBRARY_PATH:+:''${LD_LIBRARY_PATH}}"
            export LD_LIBRARY_PATH
          '';
        in
          pkgs.haskell-nix.cabalProject' {
            src = ./.;
            compiler-nix-name = "ghc912";
            supportHpack = true;
            modules = [
              {
                packages = {
                  lithon-codegen = {
                    components.library = {
                      build-tools = [hsBindgenHook];
                    };
                    preBuild = ''
                      ${sdl3Hook}
                    '';
                  };
                  sdl3-bindgen-sys = {
                    preBuild = ''
                      ${sdl3Hook}
                    '';
                    # Emit Hackage-format haddock via the .doc derivation, whose
                    # --read-interface wiring to dependency docs actually works
                    # (unlike `cabal haddock` off the docless dependency .conf).
                    # Built + uploaded via `packages."sdl3-bindgen-sys-docs"`.
                    components.library.setupHaddockFlags = [
                      "--hyperlinked-source"
                      "--quickjump"
                    ];
                  };
                  rapidhash = {
                    components.library.setupHaddockFlags = [
                      "--hyperlinked-source"
                      "--quickjump"
                    ];
                  };
                  text-builder-linear = {
                    doHaddock = true;
                    doHyperlinkSource = true;
                  };
                };
              }
            ];

            shell = rec {
              withHoogle = true;
              tools = {
                cabal = "latest";
                fourmolu = "latest";
                haskell-language-server = "latest";
                hlint = "latest";
                hpack = "latest";
                hoogle = "latest";
              };
              nativeBuildInputs = [
                pkg-config
                bear
                haskellPackages.cabal-fmt
                zlib
                hsBindgenHook
                # vendored hs-bindgen (lithon-hs-bindgen/vendor/): clang for
                # builtin-include discovery at generation time, llvm-config as
                # configure fallback, doxygen for doc-comment extraction.
                # NB: upstream pins doxygen 1.15.0 because its XML output
                # varies across versions — revisit once generated output is
                # goldened (nix/hs-bindgen-dev.nix in the submodule).
                llvmPkgs.clang
                llvmPkgs.llvm
                doxygen
              ];
              buildInputs = [
                # clang / C/C++ stuff
                bear

                # vulkan dependencies
                glslang
                spirv-tools
                vulkan-headers
                vulkan-loader
                vulkan-tools
                vulkan-tools-lunarg
                vulkan-validation-layers
                mesa # lavapipe ICD for offscreen triangle

                # SDL3 bindings
                sdl3

                # windowed demo (triangle-sdl, cabal flag `sdl`)
                SDL2

                # windowing dependencies
                libx11
                libxcursor
                libxi
                libxkbcommon
                libxrandr
                wayland

                # workflow dependencies
                ast-grep
                git
                gawk
                fd
                tree-sitter
                shellcheck
                bat
                coreutils
                jq
                diffutils
                dyff
                xq
                # pyparsing: Vulkan-Docs' genvk.py generates the exactly-pinned
                # vulkan_core.h for lithon-codegen's ABI static-assert gate
                (python314.withPackages (ps: [ps.pyparsing]))
                dasel
                xmlstarlet
                ripgrep
                dprint
                copybara
              ];

              shellHook = ''
                ${sdl3Hook}
                export LLVM_PATH="${libclangPrefix}"
                export LD_LIBRARY_PATH="${lib.getLib llvmPkgs.libclang}/lib:${lib.makeLibraryPath buildInputs}''${LD_LIBRARY_PATH:+:''${LD_LIBRARY_PATH}}"
                export VK_LAYER_PATH="${vulkan-validation-layers}/share/vulkan/explicit_layer.d"
                # Advertised for check.sh: a lavapipe ICD that exists even
                # off-NixOS (CI runners lack /run/opengl-driver discovery).
                export LITHON_LAVAPIPE_ICD="${mesa}/share/vulkan/icd.d/lvp_icd.x86_64.json"
              '';
            };
          };

        flake = project.flake {};
      in
        flake
        // {
          packages.default = flake.packages."lithon-codegen:exe:lithon-codegen";
          packages.tests = flake.packages."lithon-codegen:test:lithon-codegen-test";
          # Hackage-format haddock bundles (correctly cross-linked; see the
          # setupHaddockFlags above). Build with `nix build .#rapidhash-docs`,
          # then tar the html at its doc root and `cabal upload -d`.
          packages."rapidhash-docs" = project.hsPkgs.rapidhash.components.library.doc;
          packages."sdl3-bindgen-sys-docs" = project.hsPkgs.sdl3-bindgen-sys.components.library.doc;
        }
    );

  nixConfig = {
    extra-substituters = [
      "https://cache.iog.io"
    ];
    extra-trusted-public-keys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    ];
  };
}

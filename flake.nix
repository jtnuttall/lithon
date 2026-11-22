{
  description = "Lithon - family of rendering packages for Haskell";

  inputs = {
    haskellNix.url = "github:ican-group/haskell.nix";
    nixpkgs.follows = "haskellNix/nixpkgs-unstable";

    treefmt-nix.url = "github:numtide/treefmt-nix/a0a97e31a897a3537eea5c49df4f8adaa83b3b37";
    treefmt-nix.inputs.nixpkgs.follows = "haskellNix/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    haskellNix,
    flake-utils,
    treefmt-nix,
    ...
  }:
    flake-utils.lib.eachSystem
    (builtins.filter (system: system != "x86_64-darwin") flake-utils.lib.defaultSystems)
    (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          inherit (haskellNix) config;
          overlays = [
            haskellNix.overlay
            (_final: prev: {
              haskell-nix =
                prev.haskell-nix
                // {
                  extraPkgconfigMappings =
                    (prev.haskell-nix.extraPkgconfigMappings or {})
                    // {
                      "sdl3" = ["sdl3"];
                      "mpv" = ["libmpv"];
                    };
                };
            })
            # libmpv follows haskellNix's nixpkgs; pin it like sdl3 if needed.
            (_final: prev: {
              libmpv = prev.mpv-unwrapped.overrideAttrs (old: {
                # mpv.pc's Version is the client API version, not mpv's, and
                # haskell.nix's plan reads it from pc-version (else .version).
                passthru =
                  (old.passthru or {})
                  // {
                    pc-version =
                      {"0.41.0" = "2.5.0";}.${old.version}
                      or (throw "flake.nix: record the client API version of mpv ${old.version} (the Version field of mpv.pc in the mpv-unwrapped dev output, or DOCS/client-api-changes.rst)");
                  };
              });
            })
          ];
        };

        ghcVersion = "ghc912";

        treefmtEval = treefmt-nix.lib.evalModule pkgs {
          imports = [./nix/treefmt.nix];
          _module.args.fourmolu = pkgs.haskell-nix.tool ghcVersion "fourmolu" "latest";
        };
        treefmtWrapper = treefmtEval.config.build.wrapper;

        project = with pkgs; let
          llvmPkgs = llvmPackages_22;
          hsBindgenHook = callPackage ./nix/hs-bindgen/hs-bindgen-hook.nix {
            llvmPackages = llvmPkgs;
          };
          # libclang-bindings' configure honors LLVM_PATH  and expects
          # $LLVM_PATH/{lib,include}.
          libclangPrefix = symlinkJoin {
            name = "libclang-prefix";
            paths = [
              (lib.getLib llvmPkgs.libclang)
              (lib.getDev llvmPkgs.libclang)
            ];
          };
          libHook = libs: ''
            BINDGEN_EXTRA_CLANG_ARGS="${lib.concatMapStringsSep " " (p: "-isystem ${lib.getDev p}/include") libs} ''${BINDGEN_EXTRA_CLANG_ARGS:-}"
            export BINDGEN_EXTRA_CLANG_ARGS
            C_INCLUDE_PATH="${lib.concatMapStringsSep ":" (p: "${lib.getDev p}/include") libs}''${C_INCLUDE_PATH:+:''${C_INCLUDE_PATH}}"
            export C_INCLUDE_PATH
            LD_LIBRARY_PATH="${lib.makeLibraryPath libs}''${LD_LIBRARY_PATH:+:''${LD_LIBRARY_PATH}}"
            export LD_LIBRARY_PATH
          '';
        in
          pkgs.haskell-nix.cabalProject' {
            src = ./.;
            compiler-nix-name = ghcVersion;
            supportHpack = true;
            modules = [
              {
                packages = {
                  lithon-codegen = {
                    components.library = {
                      build-tools = [hsBindgenHook];
                    };
                    preBuild = ''
                      ${libHook [sdl3 libmpv]}
                    '';
                  };
                  sdl3-bindgen-sys = {
                    preBuild = ''
                      ${libHook [sdl3]}
                    '';
                  };
                  mpv-bindgen-sys = {
                    preBuild = ''
                      ${libHook [libmpv]}
                    '';
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
                llvmPkgs.clang
                llvmPkgs.llvm
                doxygen
              ];
              buildInputs = [
                # general gfx
                mesa # lavapipe ICD for offscreen triangle

                # vulkan
                glslang
                spirv-tools
                vulkan-headers
                vulkan-loader
                vulkan-tools
                vulkan-tools-lunarg
                vulkan-validation-layers

                # SDL
                sdl3
                SDL2 # windowed demo (triangle-sdl, cabal flag `sdl`)

                # libmpv bindings (mpv-bindgen-sys, the mpv-headless example)
                libmpv

                # windowing dependencies
                libx11
                libxcursor
                libxi
                libxkbcommon
                libxrandr
                wayland

                # clang / C/C++
                bear

                # Linting, formatting, quality, and scripting
                lychee
                treefmtWrapper

                # workflow dependencies
                ast-grep
                git
                gawk
                fd
                tree-sitter
                bat
                coreutils
                jq
                diffutils
                dyff
                xq
                # pyparsing for Vulkan-Docs' genvk.py
                (python314.withPackages (ps: [ps.pyparsing]))
                dasel
                xmlstarlet
                ripgrep
              ];

              shellHook = ''
                ${libHook [sdl3 libmpv]}
                export LLVM_PATH="${libclangPrefix}"
                export LD_LIBRARY_PATH="${lib.getLib llvmPkgs.libclang}/lib:${lib.makeLibraryPath buildInputs}''${LD_LIBRARY_PATH:+:''${LD_LIBRARY_PATH}}"
                export VK_LAYER_PATH="${vulkan-validation-layers}/share/vulkan/explicit_layer.d"
                # Advertised for check.sh: a lavapipe ICD that exists even
                # off-NixOS (CI runners lack /run/opengl-driver discovery).
                export LITHON_LAVAPIPE_ICD="${mesa}/share/vulkan/icd.d/lvp_icd.x86_64.json"
              '';
            };
          };

        flake = removeAttrs (project.flake {}) ["hydraJobs"];
      in
        flake
        // {
          packages = {
            default = flake.packages."lithon-codegen:exe:lithon-codegen";
            tests = flake.packages."lithon-codegen:test:lithon-codegen-test";
            "rapidhash-docs" = project.hsPkgs.rapidhash.components.library.doc;
            "rapidhash-aeson-docs" = project.hsPkgs.rapidhash-aeson.components.library.doc;
            "sdl3-bindgen-sys-docs" = project.hsPkgs.sdl3-bindgen-sys.components.library.doc;
            "mpv-bindgen-sys-docs" = project.hsPkgs.mpv-bindgen-sys.components.library.doc;
          };

          formatter = treefmtWrapper;

          devShells =
            flake.devShells
            // {
              ci = project.shellFor {
                withHoogle = pkgs.lib.mkForce false;
                tools = pkgs.lib.mkForce {
                  cabal = "latest";
                  hpack = "latest";
                  fourmolu = "latest";
                };

                buildInputs = with pkgs; [
                  mesa # lavapipe ICD for offscreen triangle
                ];
              };
            };
        }
        // {
          checks =
            if system == "x86_64-linux"
            then {
              formatting = treefmtEval.config.build.check self;
            }
            else {};
        }
    );
}

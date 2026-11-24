{
  description = "Lithon - family of rendering packages for Haskell";

  inputs = {
    self.submodules = true;

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

        src = ./.;

        released = import ./nix/released.nix {inherit (pkgs) lib;};
        ghcVersion = released.primary;
        llvmPackages = pkgs.llvmPackages_22;

        lithonEnv = import ./nix/env.nix {
          inherit pkgs;
          inherit llvmPackages;
          inherit hsTools;
        };

        hsToolsSpec = {
          cabal = "latest";
          fourmolu = "latest";
          haskell-language-server = "latest";
          hlint = "latest";
          hpack = "latest";
          hoogle = "latest";
        };

        # Shared with releasedProject below.
        releasedPackagesModule = {
          packages = {
            sdl3-bindgen-sys.preBuild = ''
              ${lithonEnv.libHook [pkgs.sdl3]}
            '';
            mpv-bindgen-sys.preBuild = ''
              ${lithonEnv.libHook [pkgs.libmpv]}
            '';
            # doctest-parallel can't resolve `-package ghc` under haskell.nix; run via `just doctest`.
            rapidhash.components.tests.rapidhash-doctest.doCheck = false;
          };
        };

        project = with pkgs;
          haskell-nix.cabalProject' {
            inherit src;
            compiler-nix-name = ghcVersion;
            supportHpack = true;
            modules = [
              releasedPackagesModule
              {
                projectPackages.preCheck = lithonEnv.checkHook;

                packages = {
                  libclang-bindings = {
                    preConfigure = ''
                      export LLVM_PATH="${lithonEnv.libclangPrefix}"
                    '';
                  };
                  lithon-codegen = {
                    # The tests manipulate the data-dir but don't set data-files, for a few reasons. This
                    # means we need to carve out an intentional exemption.
                    components.tests.lithon-codegen-test.extraSrcFiles = [
                      "data/**"
                      "../sdl3-bindgen-sys/**"
                      "../mpv-bindgen-sys/**"
                    ];
                    components = {
                      library = {
                        build-tools = [lithonEnv.hsBindgenHook];
                      };
                      tests.lithon-codegen-test.preCheck = ''
                        ${lithonEnv.checkHook}
                        export lithon_codegen_datadir="$PWD/data"
                      '';
                    };
                    preBuild = ''
                      ${lithonEnv.libHook [sdl3 libmpv]}
                    '';
                  };
                };
              }
            ];

            shell = rec {
              withHoogle = true;
              tools = hsToolsSpec;
              nativeBuildInputs =
                lithonEnv.commonNativeBuildInputs
                ++ [
                  just
                  nix-fast-build
                ];
              buildInputs = [
                # Linting, formatting, quality, and scripting
                lychee
                nushell
                treefmtWrapper

                # workflow dependencies
                ast-grep
                bat
                coreutils
                dasel
                diffutils
                dyff
                fd
                git
                gawk
                jq
                lithonEnv.pythonWithPyparsing
                ripgrep
                tree-sitter
                xmlstarlet
                xq
              ];

              shellHook = lithonEnv.shellHook buildInputs;
            };
          };

        hsTools = project.tools hsToolsSpec;

        # The released packages on their own (cabal.project.released), per supported GHC and
        # with the strict flag. The sdist/no-nix proof stays with the cabal CI jobs.
        releasedProject = pkgs.haskell-nix.cabalProject' {
          inherit src;
          name = "lithon-released";
          cabalProjectFileName = "cabal.project.released";
          compiler-nix-name = ghcVersion;
          modules = [releasedPackagesModule];
        };
        releasedFlake = releasedProject.flake {inherit (released) variants;};

        treefmtEval = treefmt-nix.lib.evalModule pkgs {
          imports = [./nix/treefmt.nix];
          _module.args.hsTools = hsTools;
        };

        treefmtWrapper = treefmtEval.config.build.wrapper;

        extraChecks =
          {
            formatting = treefmtEval.config.build.check self;
          }
          // import ./nix/checks.nix {
            inherit pkgs;
            inherit src;
            inherit project;
            inherit lithonEnv;
            inherit hsTools;
          };

        flake = removeAttrs (project.flake {}) ["hydraJobs"];
      in
        flake
        // {
          formatter = treefmtWrapper;

          inherit (flake) devShells;

          packages = {
            default = flake.packages."lithon-codegen:exe:lithon-codegen";
            tests = flake.packages."lithon-codegen:test:lithon-codegen-test";
            "rapidhash-docs" = project.hsPkgs.rapidhash.components.library.doc;
            "rapidhash-aeson-docs" = project.hsPkgs.rapidhash-aeson.components.library.doc;
            "sdl3-bindgen-sys-docs" = project.hsPkgs.sdl3-bindgen-sys.components.library.doc;
            "mpv-bindgen-sys-docs" = project.hsPkgs.mpv-bindgen-sys.components.library.doc;
          };

          checks = flake.checks // extraChecks // released.variantChecks releasedFlake;
        }
    );
}

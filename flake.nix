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

        src = ./.;

        ghcVersion = "ghc912";
        llvmPackages = pkgs.llvmPackages_22;

        lithonEnv = import ./nix/env.nix {
          inherit pkgs;
          inherit llvmPackages;
        };

        treefmtEval = treefmt-nix.lib.evalModule pkgs {
          imports = [./nix/treefmt.nix];
          _module.args.fourmolu = pkgs.haskell-nix.tool ghcVersion "fourmolu" "latest";
        };
        treefmtWrapper = treefmtEval.config.build.wrapper;

        project = with pkgs;
          pkgs.haskell-nix.cabalProject' {
            inherit src;
            compiler-nix-name = ghcVersion;
            supportHpack = true;
            modules = [
              {
                projectPackages.preCheck = lithonEnv.checkHook;

                packages = {
                  libclang-bindings = {
                    preConfigure = ''
                      export LLVM_PATH="${lithonEnv.libclangPrefix}"
                    '';
                  };
                  # doctest-parallel can't resolve `-package ghc` under haskell.nix; run via `just doctest`.
                  rapidhash.components.tests.rapidhash-doctest.doCheck = false;
                  lithon-codegen = {
                    components.library = {
                      build-tools = [lithonEnv.hsBindgenHook];
                    };
                    preBuild = ''
                      ${lithonEnv.libHook [sdl3 libmpv]}
                    '';
                  };
                  sdl3-bindgen-sys = {
                    preBuild = ''
                      ${lithonEnv.libHook [sdl3]}
                    '';
                  };
                  mpv-bindgen-sys = {
                    preBuild = ''
                      ${lithonEnv.libHook [libmpv]}
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
              nativeBuildInputs =
                lithonEnv.commonNativeBuildInputs
                ++ [
                  just
                  nix-fast-build
                ];
              buildInputs = [
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
                lithonEnv.pythonWithPyparsing
                dasel
                xmlstarlet
                ripgrep
              ];

              shellHook = lithonEnv.shellHook buildInputs;
            };
          };

        checks =
          {
            formatting = treefmtEval.config.build.check self;
          }
          // import ./nix/checks.nix {
            inherit pkgs;
            inherit src;
            inherit project;
            inherit lithonEnv;
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
        }
        // checks
    );
}

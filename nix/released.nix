{lib}: rec {
  ghcs = ["ghc984" "ghc9103" "ghc9124" "ghc9141"];
  primary = "ghc9124";

  # All variants that aren't primary (the GHC we test on main)
  variants = assert lib.elem primary ghcs;
    lib.genAttrs (lib.remove primary ghcs) (ghc: {compiler-nix-name = lib.mkForce ghc;})
    // {
      # The experimental `strict` flag, without -O2.
      strict.modules = [
        {
          packages = lib.genAttrs ["sdl3-bindgen-sys" "mpv-bindgen-sys"] (_: {
            flags = {
              strict = true;
              optimize = false;
            };
          });
        }
      ];
    };

  # All checks for non-primary GHCs
  variantChecks = flake: let
    ofVariant = name: _: lib.any (v: lib.hasPrefix "${v}:" name) (builtins.attrNames variants);
  in
    lib.filterAttrs ofVariant (flake.packages // flake.checks);
}

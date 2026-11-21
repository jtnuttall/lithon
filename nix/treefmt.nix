{pkgs, ...}: {
  projectRootFile = "flake.nix";

  settings.excludes = [
    "lithon-codegen/data/Vulkan-Docs/"
    "lithon-hs-bindgen/vendor/"
    "**/*-lock.json"
    "**/{test,test-data}/*.{json,yaml}"
  ];

  programs = {
    alejandra.enable = true;
    clang-format.enable = true;
    clang-tidy.enable = true;
    deadnix.enable = true;
    fourmolu = {
      enable = true;
      package = pkgs.fourmolu;
    };
    oxfmt.enable = true;
    shellcheck.enable = true;
    shfmt = {
      enable = true;
      indent_size = 2;
      simplify = true;
    };
  };
}

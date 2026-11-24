{hsTools, ...}: {
  projectRootFile = "flake.nix";

  settings.excludes = [
    "**/Vulkan-Docs/**"
    "lithon-hs-bindgen/vendor/**"
    "**/*-lock.json"
    "**/{test,test-data}/*.{json,yaml}"
    # generated output; codegen is responsible for formatting.
    "lithon-vk/**"
    "mpv-bindgen-sys/**"
    "sdl3-bindgen-sys/**"
  ];

  programs = {
    alejandra.enable = true;
    clang-format.enable = true;
    deadnix.enable = true;
    hlint = {
      enable = true;
      package = hsTools.hlint;
    };
    fourmolu = {
      enable = true;
      package = hsTools.fourmolu;
    };
    just.enable = true;
    oxfmt.enable = true;
    shellcheck.enable = true;
    shfmt = {
      enable = true;
      indent_size = 2;
      simplify = true;
    };
    statix.enable = true;
    typos = {
      enable = true;
      # Suggestions are not always correct
      autoFix = false;
    };
  };

  settings.programs.fourmolu = {
    ghcOpts = [];
  };
}

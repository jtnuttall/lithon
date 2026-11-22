{
  pkgs,
  llvmPackages,
  hsTools,
}: rec {
  inherit llvmPackages;

  hsBindgenHook = pkgs.callPackage ./hs-bindgen/hs-bindgen-hook.nix {
    inherit llvmPackages;
  };

  libclangPrefix = pkgs.symlinkJoin {
    name = "libclang-prefix";
    paths = [
      (pkgs.lib.getLib llvmPackages.libclang)
      (pkgs.lib.getDev llvmPackages.libclang)
    ];
  };

  libHook = libs: ''
    BINDGEN_EXTRA_CLANG_ARGS="${pkgs.lib.concatMapStringsSep " " (p: "-isystem ${pkgs.lib.getDev p}/include") libs} ''${BINDGEN_EXTRA_CLANG_ARGS:-}"
    export BINDGEN_EXTRA_CLANG_ARGS
    C_INCLUDE_PATH="${pkgs.lib.concatMapStringsSep ":" (p: "${pkgs.lib.getDev p}/include") libs}''${C_INCLUDE_PATH:+:''${C_INCLUDE_PATH}}"
    export C_INCLUDE_PATH
    LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath libs}''${LD_LIBRARY_PATH:+:''${LD_LIBRARY_PATH}}"
    export LD_LIBRARY_PATH
  '';

  # Vulkan / Lavapipe paths for checks/shells
  vkLayerPath = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
  lavapipeIcd = "${pkgs.mesa}/share/vulkan/icd.d/lvp_icd.${pkgs.stdenv.hostPlatform.uname.processor}.json";

  commonBuildInputs = with pkgs; [
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
  ];

  commonNativeBuildInputs = with pkgs; [
    bear
    doxygen
    haskellPackages.cabal-fmt
    hsBindgenHook
    hsTools.fourmolu
    llvmPackages.clang
    llvmPackages.llvm
    oxfmt
    pkg-config
    zlib
  ];

  # Vulkan-Docs' genvk.py (the shell, and the ABI gate in lithon-codegen's tests)
  pythonWithPyparsing = pkgs.python314.withPackages (ps: [ps.pyparsing]);

  shellHook = buildInputs: ''
    ${libHook (with pkgs; [sdl3 libmpv])}
    export LLVM_PATH="${libclangPrefix}"
    export LD_LIBRARY_PATH="${pkgs.lib.getLib llvmPackages.libclang}/lib:${pkgs.lib.makeLibraryPath (commonBuildInputs ++ buildInputs)}''${LD_LIBRARY_PATH:+:''${LD_LIBRARY_PATH}}"
    export VK_LAYER_PATH="${vkLayerPath}"
    export LITHON_LAVAPIPE_ICD="${lavapipeIcd}"
  '';

  checkHook = ''
    ${shellHook []}
    export PATH="${pkgs.lib.makeBinPath (commonNativeBuildInputs ++ [pythonWithPyparsing])}''${PATH:+:''${PATH}}"
    export PKG_CONFIG_PATH="${pkgs.lib.makeSearchPathOutput "dev" "lib/pkgconfig" commonBuildInputs}:${pkgs.lib.makeSearchPathOutput "dev" "share/pkgconfig" commonBuildInputs}''${PKG_CONFIG_PATH:+:''${PKG_CONFIG_PATH}}"
    export SDL_VIDEODRIVER=offscreen
    export VK_ADD_DRIVER_FILES="${lavapipeIcd}''${VK_ADD_DRIVER_FILES:+:''${VK_ADD_DRIVER_FILES}}"
  '';
}

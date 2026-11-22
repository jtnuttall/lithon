{
  pkgs,
  project,
  src,
  lithonEnv,
}: let
  # Helper to grab executables from the project.
  getExe = pkg: exe: project.hsPkgs.${pkg}.components.exes.${exe};

  # Environment for headless graphics checks
  mkGfxEnv = overrides:
    {
      SDL_VIDEODRIVER = "offscreen";
      VK_LAYER_PATH = lithonEnv.vkLayerPath;
      VK_ADD_DRIVER_FILES = lithonEnv.lavapipeIcd;
    }
    // overrides;
in {
  # == Codegen freshness ==
  check-codegen-vulkan =
    pkgs.runCommand "check-codegen-vulkan" {
      nativeBuildInputs = [pkgs.git];
      codegenExe = getExe "lithon-codegen" "lithon-codegen";
    } ''
      cp -r ${src} source
      chmod -R +w source
      cd source

      $codegenExe/bin/lithon-codegen -- vulkan generate --profile lithon-codegen/data/vulkan/profiles/lithon-core.json --check
      touch $out
    '';

  check-hpack =
    pkgs.runCommand "check-hpack" {
      nativeBuildInputs = [pkgs.hpack pkgs.diffutils];
    } ''
      for cabal_file in ${src}/*/*.cabal; do
        dir="$(dirname "$cabal_file")"
        cd "$dir"

        echo "Verifying that hpack's output matches $cabal_file..."
        diff_out="$(hpack - | diff -u "$base_cabal" -)" || {
          echo "$diff_out"
          echo "$cabal_file: Expected hpack output differs from actual cabal file."
          echo "Did you forget to run 'hpack' in $dir?"
          exit 1
        }
      done

      touch $out
    '';

  # == SDL3 checks ==
  check-triangle-offscreen =
    pkgs.runCommand "check-triangle-offscreen" (mkGfxEnv {
      nativeBuildInputs = [pkgs.gnugrep];
      triangleExe = getExe "lithon-examples" "triangle-offscreen";
    }) ''
      out=$($triangleExe/bin/triangle-offscreen 2>&1) || {
        echo "$out"
        echo "triangle failed"
        exit 1
      }
      echo "$out"
      if echo "$out" | grep -qi "validation error"; then
        echo "validation layer reported errors"
        exit 1
      fi
      touch $out
    '';

  check-sdl3-raw = pkgs.runCommand "check-sdl3-raw" (mkGfxEnv
    {
      rawExe = getExe "lithon-examples" "sdl3-raw";
    }) ''
    $rawExe/bin/sdl3-raw --frames 60
    touch $out
  '';
}

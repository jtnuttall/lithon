{
  pkgs,
  project,
  src,
  lithonEnv,
}: let
  # Helper to grab executables from the project.
  getExe = pkg: exe: project.hsPkgs.${pkg}.components.exes.${exe};

  integrationCheck = name: {
    pkg,
    exe,
    extraEnv ? {},
  }: testScript: let
    exePath = getExe pkg exe;
    env =
      {
        EXECUTABLE_OUTPUT_PATH = exePath;
        EXECUTABLE = exePath + "/bin/" + exe;
      }
      // extraEnv;
  in
    pkgs.runCommand name env ''
      ${lithonEnv.checkHook}

      ${testScript}

      touch $out
    '';
in {
  # == Codegen freshness ==
  check-codegen-vulkan =
    integrationCheck "check-codegen-vulkan" {
      pkg = "lithon-codegen";
      exe = "lithon-codegen";
      extraEnv = {
        nativeBuildInputs = [pkgs.git];
      };
    } ''
      cp -r ${src} source
      chmod -R +w source
      cd source

      $EXECUTABLE -- vulkan generate --profile lithon-codegen/data/vulkan/profiles/lithon-core.json --check
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
        diff_out="$(hpack - | diff -u "$cabal_file" -)" || {
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
    integrationCheck "check-triangle-offscreen" {
      pkg = "lithon-examples";
      exe = "triangle-offscreen";
      extraEnv = {
        nativeBuildInputs = [pkgs.gnugrep];
      };
    } ''
      out=$($EXECUTABLE 2>&1) || {
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

  check-sdl3-raw =
    integrationCheck "check-sdl3-raw" {
      pkg = "lithon-examples";
      exe = "sdl3-raw";
    } ''
      $EXECUTABLE --frames 60
      touch $out
    '';
}

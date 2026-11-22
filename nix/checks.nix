{
  pkgs,
  project,
  src,
  lithonEnv,
  hsTools,
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
      # The sandbox's HOME is unwritable; mesa wants a shader cache under it.
      export HOME="$(mktemp -d)"

      ${testScript}

      touch $out
    '';

  codegenFreshness = target: args:
    integrationCheck "check-codegen-${target}" {
      pkg = "lithon-codegen";
      exe = "lithon-codegen";
      extraEnv = {
        nativeBuildInputs = [pkgs.git];
      };
    } ''
      cp -r ${src} source
      chmod -R +w source
      cd source

      $EXECUTABLE -- ${target} generate ${args} --check
    '';

  # Run an example headlessly and fail if the validation layers complain.
  # (checkHook exports SDL_VIDEODRIVER=offscreen and the lavapipe ICD.)
  headlessExample = exe: args:
    integrationCheck "check-${exe}" {
      pkg = "lithon-examples";
      inherit exe;
      extraEnv = {
        nativeBuildInputs = [pkgs.gnugrep];
      };
    } ''
      # Not `out`: that would shadow the derivation's $out.
      log=$($EXECUTABLE ${args} 2>&1) || {
        echo "$log"
        echo "${exe} failed"
        exit 1
      }
      echo "$log"
      if echo "$log" | grep -qi "validation error"; then
        echo "validation layer reported errors"
        exit 1
      fi
    '';

  haddock = pkg: project.hsPkgs.${pkg}.components.library.doc;
in {
  # == Codegen freshness ==
  check-codegen-vulkan = codegenFreshness "vulkan" "--profile lithon-codegen/data/vulkan/profiles/lithon-core.json";
  check-codegen-sdl3 = codegenFreshness "sdl3" "";
  check-codegen-mpv = codegenFreshness "mpv" "";

  check-hpack =
    pkgs.runCommand "check-hpack" {
      nativeBuildInputs = [hsTools.hpack pkgs.diffutils];
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

  # == rapidhash ==
  check-rapidhash-pin =
    # runCommandCC: plain runCommand is stdenvNoCC, so $CC would be unset.
    pkgs.runCommandCC "check-rapidhash-pin" {
      nativeBuildInputs = [pkgs.diffutils];
    } ''
      $CC -O2 -I${src}/rapidhash/cbits -o pin ${src}/rapidhash/test/pin/pin.c
      ./pin >pin.txt
      diff -u ${src}/rapidhash/test/pin/rapidhash-v3-pin.txt pin.txt
      echo "OK: C reference output matches the committed vectors ($(wc -l <pin.txt))"

      touch $out
    '';

  # == haddock ==
  check-haddock-lithon-vk = haddock "lithon-vk";
  check-haddock-sdl3-bindgen-sys = haddock "sdl3-bindgen-sys";
  check-haddock-mpv-bindgen-sys = haddock "mpv-bindgen-sys";
  check-haddock-rapidhash = haddock "rapidhash";
  check-haddock-rapidhash-aeson = haddock "rapidhash-aeson";

  # == headless examples (lavapipe / SDL offscreen) ==
  check-triangle-offscreen = headlessExample "triangle-offscreen" "";
  check-triangle-sdl = headlessExample "triangle-sdl" "--frames 60";
  check-sdl3-raw = headlessExample "sdl3-raw" "--frames 60";
  check-shmup = headlessExample "shmup" "--frames 60";
  check-mpv-headless = headlessExample "mpv-headless" "";
}

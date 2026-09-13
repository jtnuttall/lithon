# lithon-examples

End-to-end demos for the lithon packages. They double as smoke and compile
tests via `scripts/check.sh` (the nix CI gate is temporarily disabled
pending a build-cache strategy), and as templates you can copy from freely.

Not published; build from the repository devshell (`nix develop` — see the
[repo README](../README.md)).

## The executables

| Executable           | What it shows                                                               |
| -------------------- | --------------------------------------------------------------------------- |
| `triangle-offscreen` | `lithon-vk` triangle rendered offscreen, written to PNG, pixel-asserted     |
| `triangle-sdl`       | The same triangle presented in an SDL2 window via `VK_KHR_swapchain`        |
| `sdl3-raw`           | A minimal `sdl3-bindgen-sys` triangle: window, event loop, `renderGeometry` |
| `shmup`              | The apecs Shmup example, playable, running on and rendering through SDL3    |

```sh
cabal run sdl3-raw
cabal run shmup               # --frames N bounds the loop
cabal run triangle-offscreen
cabal run triangle-sdl        # needs SDL2; disable with -f -sdl elsewhere
```

On Windows without Nix, the SDL3 examples build natively from Git Bash
against MSYS2 UCRT64 (install `mingw-w64-ucrt-x86_64-sdl3` and
`mingw-w64-ucrt-x86_64-pkgconf` as in the
[sdl3-bindgen-sys README](../sdl3-bindgen-sys/README.md#windows-set-up)):

```sh
export PKG_CONFIG_PATH="/c/msys64/ucrt64/lib/pkgconfig"
export PATH="/c/msys64/ucrt64/bin:$PATH"
cabal run --with-compiler=/c/ghcup/ghc/9.12.2/bin/ghc.exe \
  --extra-lib-dirs="/c/msys64/ucrt64/lib" \
  --extra-include-dirs="/c/msys64/ucrt64/include" \
  --constraint="lithon-examples -sdl" lithon-examples:exe:shmup
```

`-sdl` leaves out `triangle-sdl`, the one executable that needs SDL2.

`sdl3-raw` and `shmup` run headless under `SDL_VIDEODRIVER=offscreen`,
which is how `scripts/check.sh` probe-asserts their pixels; `triangle-sdl`
does the same on lavapipe via `VK_EXT_headless_surface`.

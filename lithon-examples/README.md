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

`sdl3-raw` and `shmup` run headless under `SDL_VIDEODRIVER=offscreen`,
which is how `scripts/check.sh` probe-asserts their pixels; `triangle-sdl`
does the same on lavapipe via `VK_EXT_headless_surface`.

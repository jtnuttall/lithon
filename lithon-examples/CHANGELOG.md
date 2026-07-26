# Changelog — lithon-examples

## Unreleased

- `triangle-offscreen`: dynamic-rendering triangle rendered offscreen,
  copied to host memory, written as PNG, probe-asserted (the phase-3
  end-to-end gate; runs on lavapipe with validation layers).
- `triangle-sdl` (flag `sdl`, on by default): windowed swapchain triangle
  over SDL2 — present-capable device selection, out-of-date/suboptimal
  swapchain recreation, per-frame sync against per-image present
  semaphores, dynamic viewport/scissor. `--frames N` bounds the loop;
  `SDL_VIDEODRIVER=offscreen` drives it headlessly on lavapipe via
  `VK_EXT_headless_surface`.
- `sdl3-raw`: vertex-colored triangle through `SDL_RenderGeometry`, driven
  raw through the generated sys layer — the `sdl3-bindgen-sys` usability
  gate (windowed normally; headless + pixel-probed via
  `SDL_VIDEODRIVER=offscreen`).
- `shmup`: the apecs Shmup example ported flat from gloss to the generated
  sys layer — apecs world and systems verbatim, the gloss play loop
  replaced by an explicit fixed-1/60-step SDL loop. Playable by default;
  bounded + unpaced with `--frames N` or under CI (headless,
  probe-asserted).
- Shader blobs moved to `Lithon.Examples.Triangle.Shaders`; `embedFile`
  paths are anchored with `makeRelativeToProject` so HLS's multi-repl
  (project-root cwd) loads the package.
- Hedgehog poke/peek roundtrips through real generated instances.

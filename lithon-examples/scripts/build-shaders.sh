#!/usr/bin/env bash
# Rebuild the committed SPIR-V beside the GLSL sources.
set -euo pipefail
cd "$(dirname "$0")/../shaders"
glslangValidator -V triangle.vert -o triangle.vert.spv
glslangValidator -V triangle.frag -o triangle.frag.spv
echo "shaders rebuilt"

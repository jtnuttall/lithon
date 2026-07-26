#version 450

// Hardcoded fullish-screen triangle; no vertex buffers — positions and
// colors come from gl_VertexIndex so the demo exercises the pipeline
// without the vertex-input machinery (covered by tests instead).
layout(location = 0) out vec3 fragColor;

vec2 positions[3] = vec2[](
    vec2(0.0, -0.75),
    vec2(0.75, 0.75),
    vec2(-0.75, 0.75)
);

vec3 colors[3] = vec3[](
    vec3(1.0, 0.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 0.0, 1.0)
);

void main() {
    gl_Position = vec4(positions[gl_VertexIndex], 0.0, 1.0);
    fragColor = colors[gl_VertexIndex];
}

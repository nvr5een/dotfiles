//!HOOK MAIN
//!BIND HOOKED
//!DESC Film grain / analog noise

float rand(vec2 co) {
    return fract(sin(dot(co, vec2(12.9898,78.233))) * 43758.5453);
}

vec4 hook() {
    vec4 c = HOOKED_tex(HOOKED_pos);
    float n = rand(gl_FragCoord.xy + vec2(HOOKED_time, HOOKED_time)) - 0.5;
    return c + vec4(vec3(n * 0.03), 0.0); // adjust strength
}

//!HOOK MAIN
//!BIND HOOKED
//!DESC Scanlines locked to video resolution

vec4 hook() {
    vec2 uv = HOOKED_pos * HOOKED_size;  // video pixel coords
    vec4 c = HOOKED_tex(HOOKED_pos);
    if (mod(floor(uv.y), 2.0) == 0.0) {
        c.rgb *= 0.5;  // adjust strength
    }
    return c;
}

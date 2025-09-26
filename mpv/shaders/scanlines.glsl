//!HOOK MAIN
//!BIND HOOKED
//!DESC Simple scanlines (darken every other line)

vec4 hook() {
    vec4 c = HOOKED_tex(HOOKED_pos);
    if (mod(gl_FragCoord.y, 2.0) < 1.0) c.rgb *= 0.50; // adjust 0.50 for strength
    return c;
}

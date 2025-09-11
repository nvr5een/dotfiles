//!HOOK CHROMA
//!BIND HOOKED
//!DESC Subtle horizontal chroma bleed

vec4 hook() {
    // sample horizontal neighbors in chroma plane
    vec2 tex = HOOKED_pos;
    float px = 1.0 / HOOKED_size.x;   // pixel width
    // weights (tiny Gaussian-ish)
    float w0 = 0.40;
    float w1 = 0.25;
    float w2 = 0.10;
    vec3 c =
          w0 * HOOKED_tex(tex).rgb +
          w1 * (HOOKED_tex(tex + vec2(+px,0)).rgb + HOOKED_tex(tex + vec2(-px,0)).rgb) +
          w2 * (HOOKED_tex(tex + vec2(+2.0*px,0)).rgb + HOOKED_tex(tex + vec2(-2.0*px,0)).rgb);
    return vec4(c, 1.0);
}

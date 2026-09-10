//!HOOK CHROMA
//!BIND HOOKED
//!DESC Normalized horizontal chroma bleed

vec4 hook() {
    // The old kernel summed to 1.10, causing progressive highlight clipping.
    // This retains its shape while normalizing the total weight to 1.0.
    vec4 c = HOOKED_texOff(vec2(0.0)) * 0.40;
    c += HOOKED_texOff(vec2( 1.0, 0.0)) * 0.25;
    c += HOOKED_texOff(vec2(-1.0, 0.0)) * 0.25;
    c += HOOKED_texOff(vec2( 2.0, 0.0)) * 0.05;
    c += HOOKED_texOff(vec2(-2.0, 0.0)) * 0.05;
    return c;
}


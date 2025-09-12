//!HOOK MAIN
//!BIND HOOKED
//!DESC Warm CRT tint

vec4 hook() {
    vec4 c = HOOKED_tex(HOOKED_pos);
    c.r *= 1.05;
    c.g *= 1.02;
    c.b *= 0.95;
    return clamp(c, 0.0, 1.0);
}

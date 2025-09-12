//!HOOK MAIN
//!BIND HOOKED
//!DESC Aperture grille mask

vec4 hook() {
    vec2 uv = HOOKED_pos * HOOKED_size;
    vec4 c = HOOKED_tex(HOOKED_pos);

    // vertical stripes every 3 pixels (R,G,B phosphors)
    int stripe = int(mod(uv.x, 3.0));
    if (stripe == 0) c.r *= 1.2;
    if (stripe == 1) c.g *= 1.2;
    if (stripe == 2) c.b *= 1.2;

    return clamp(c, 0.0, 1.0);
}

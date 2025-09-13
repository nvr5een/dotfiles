//!HOOK MAIN
//!BIND HOOKED
//!DESC Aperture grille + scanlines (video-aligned)

#define MASK_SCALE     1.00   // horizontal density of RGB columns (1.0 ≈ 1 triad per output pixel)
#define MASK_STRENGTH  0.45   // 0..1, how strong the RGB mask modulation is
#define SCAN_STRENGTH  0.35   // 0..1, darkness of every other line
#define SCAN_PHASE     0.0    // 0 or 1 to flip which line darkens

// --- Brightness controls ---
#define BRIGHTNESS_GAIN 1.15   // multiply RGB (1.0 = none, >1.0 brighter) start at 1.15
#define BRIGHTNESS_LIFT 0.02   // add constant to RGB (shadows), 0.0–0.1 typical
#define GAMMA_OUT       0.95   // <1.0 brightens mids, >1.0 darkens

vec4 hook() {
    // final output pixel coordinates (so the mask stays stable regardless of video size)
    vec2 out_px = HOOKED_pos * HOOKED_size;

    // Base color
    vec4 c = HOOKED_tex(HOOKED_pos);

    // -------- Vertical RGB aperture-grille mask --------
    // Triad index: ... R G B | R G B | ...
    float x = floor(out_px.x * MASK_SCALE);
    int triad = int(mod(x, 3.0));

    // Start with a dim baseline and "open" one subpixel per column
    vec3 mask = vec3(1.0 - MASK_STRENGTH);
    if (triad == 0) mask.r = 1.0;
    if (triad == 1) mask.g = 1.0;
    if (triad == 2) mask.b = 1.0;

    c.rgb *= mask;

    // -------- Horizontal scanlines locked to video pixels --------
    // Use VIDEO pixel grid so line spacing doesn't drift with scaling.
    float vy = floor(HOOKED_pos.y * HOOKED_size.y) + SCAN_PHASE;
    if (mod(vy, 2.0) < 1.0) {
        c.rgb *= (1.0 - SCAN_STRENGTH);
    }

    // Mild gamma lift to compensate for mask/scan attenuation (optional)
    c.rgb = pow(c.rgb, vec3(0.95));

    return c;
}

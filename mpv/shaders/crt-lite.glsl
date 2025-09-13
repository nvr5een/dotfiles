//!HOOK MAIN
//!BIND HOOKED
//!DESC CRT-Lite (video-locked scanlines + pixel-locked aperture mask)

// -------------------- TUNABLES --------------------
// Scanlines (video space) — keep these modest for a "lite" look
#define SCAN_STRENGTH   0.30   // 0..1 darkness of the dark lines
#define SCAN_PHASE      0.0    // 0 or 1: flip which line is dark

// Aperture-grille mask (output space) — 1.00 = one RGB triad per pixel column
#define MASK_SCALE_HINT 1.00   // will be rounded to nearest integer to stay pixel-aligned
#define MASK_STRENGTH   0.35   // 0..1 depth of troughs between columns
#define MASK_SOFT       0.25   // 0..1 softness of column edges (0 = hard)

// Optional tiny brightness compensation (keep very subtle for "lite")
#define GAIN            1.05   // overall gain (1.00 = none)
#define GAMMA_OUT       0.98   // <1 brightens mids slightly (1.00 = none)
// --------------------------------------------------

float luma(vec3 c){ return dot(c, vec3(0.2627, 0.6780, 0.0593)); }

vec4 hook() {
    vec2 uv = HOOKED_pos;

    // --------- Aperture mask in OUTPUT pixel space (no drift) ---------
    vec2 out_px = uv * HOOKED_size;

    // Snap mask scale to an integer so columns are pixel-locked
    float mscale = max(1.0, round(MASK_SCALE_HINT));
    float tri = mod(floor(out_px.x * mscale), 3.0);

    float edge = clamp(MASK_SOFT, 0.0, 1.0);
    // soft triad weighting: boost one subpixel per column, gently attenuate others
    float r = 1.0 - MASK_STRENGTH + MASK_STRENGTH * smoothstep(1.0-edge, 1.0+edge, 1.0 - abs(tri-0.0));
    float g = 1.0 - MASK_STRENGTH + MASK_STRENGTH * smoothstep(1.0-edge, 1.0+edge, 1.0 - abs(tri-1.0));
    float b = 1.0 - MASK_STRENGTH + MASK_STRENGTH * smoothstep(1.0-edge, 1.0+edge, 1.0 - abs(tri-2.0));
    vec3 mask = clamp(vec3(r,g,b), 0.0, 1.0);

    // Base sample
    vec3 rgb = HOOKED_tex(uv).rgb;
    rgb *= mask;

    // --------- Scanlines in VIDEO pixel space (always even) ----------
    float vy = floor(uv.y * HOOKED_size.y) + SCAN_PHASE;
    if (mod(vy, 2.0) < 1.0) {
        rgb *= (1.0 - SCAN_STRENGTH);
    }

    // Light global compensation
    rgb *= GAIN;
    rgb = pow(clamp(rgb, 0.0, 1.0), vec3(GAMMA_OUT));

    return vec4(clamp(rgb, 0.0, 1.0), 1.0);
}

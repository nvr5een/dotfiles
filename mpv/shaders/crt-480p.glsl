//!HOOK MAIN
//!BIND HOOKED
//!DESC Lightweight 480p-scaled scanlines

// -------------------- TUNABLES --------------------
#define SCAN_STRENGTH   0.33   // 0..1 darkness of dark lines
#define SCAN_PHASE      0.0    // 0 or 1: flip which row darkens
#define REF_LINES     480.0    // treat scanlines as if video has this many rows
#define MAX_MULT        3.0    // cap multiplier for very low-res sources
// --------------------------------------------------

vec4 hook() {
    vec2 uv = HOOKED_pos;
    vec3 rgb = HOOKED_tex(uv).rgb;

    // --- Adaptive scanline frequency ---
    float L = HOOKED_size.y;                  // source video lines
    float mult = clamp(REF_LINES / L, 1.0, MAX_MULT);
    float vy = floor(uv.y * L * mult) + SCAN_PHASE;

    if (mod(vy, 2.0) < 1.0) {
        rgb *= (1.0 - SCAN_STRENGTH);
    }

    return vec4(rgb, 1.0);
}

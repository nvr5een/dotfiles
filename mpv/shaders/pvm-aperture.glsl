//!HOOK MAIN
//!BIND HOOKED
//!DESC Sony PVM-style (auto pixel-locked mask + video-locked scanlines + brightness)

// -------------------- TUNABLES --------------------
// Mask density hint: 1.0 ≈ 1 RGB triad per 3 output pixels (classic aperture).
// We will round to the nearest integer internally so it always pixel-aligns.
#define MASK_SCALE_HINT   1.00   // try 1.00 first; 0.75=looser, 1.25=denser (will be rounded)

// Mask look
#define MASK_STRENGTH     0.40   // 0..1 depth of troughs between columns
#define MASK_SOFT         0.35   // 0..1 edge softening of columns

// Scanlines (video-space; never drift)
#define SCAN_STRENGTH     0.33   // 0..1 darkening of every other line
#define SCAN_MIN          0.15   // minimum darkening for very bright pixels
#define SCAN_PHASE        0.0    // 0 or 1 to flip which row is dark

// Subtle beam "breath" (bright lines darken less)
#define BEAM_BREATH       0.12   // 0..0.25

// Micro-bloom (keep low for PVM)
#define BLOOM_STRENGTH    0.10   // 0..0.3
#define BLOOM_RADIUS      1.25   // in output pixels

// Deconvergence (tiny misregistration; set 0 to disable)
#define DECONV_X_R        0.00
#define DECONV_X_B        0.00
#define DECONV_Y_R        0.00
#define DECONV_Y_B        0.00

// -------- Brightness controls --------
// Simple overall gain, lift, and gamma-out compensate for mask/scan loss.
#define BRIGHTNESS_GAIN   1.40   // multiply RGB (1.00 = none)  start at 1.10
#define BRIGHTNESS_LIFT   0.00   // add to RGB after gain (0..0.1 typical)
#define GAMMA_OUT         0.96   // <1.0 brightens mids; 1.0 = none
// --------------------------------------------------

float luma(vec3 c){ return dot(c, vec3(0.2627, 0.6780, 0.0593)); }

vec3 micro_bloom(vec2 uv, vec3 base) {
    if (BLOOM_STRENGTH <= 0.0) return base;
    vec2 px = BLOOM_RADIUS / HOOKED_size;
    vec3 acc = base * 0.40;
    acc += HOOKED_tex(uv + vec2(+px.x, 0)).rgb * 0.10;
    acc += HOOKED_tex(uv + vec2(-px.x, 0)).rgb * 0.10;
    acc += HOOKED_tex(uv + vec2(0, +px.y)).rgb * 0.10;
    acc += HOOKED_tex(uv + vec2(0, -px.y)).rgb * 0.10;
    acc += HOOKED_tex(uv + vec2(+px.x, +px.y)).rgb * 0.05;
    acc += HOOKED_tex(uv + vec2(-px.x, +px.y)).rgb * 0.05;
    acc += HOOKED_tex(uv + vec2(+px.x, -px.y)).rgb * 0.05;
    acc += HOOKED_tex(uv + vec2(-px.x, -px.y)).rgb * 0.05;
    return mix(base, acc, BLOOM_STRENGTH);
}

vec4 hook() {
    vec2 uv = HOOKED_pos;

    // -------- Output pixel coords (for mask) --------
    vec2 out_px = uv * HOOKED_size;

    // AUTO pixel-lock the mask: round density to nearest integer so it aligns with the panel.
    // Effective triad density in "columns per pixel":
    float mscale = max(1.0, round(MASK_SCALE_HINT));
    float tri = mod(floor(out_px.x * mscale), 3.0);

    // Soft aperture grille
    float edge = clamp(MASK_SOFT, 0.0, 1.0);
    float r = 1.0 - MASK_STRENGTH + MASK_STRENGTH * smoothstep(1.0-edge, 1.0+edge, 1.0 - abs(tri-0.0));
    float g = 1.0 - MASK_STRENGTH + MASK_STRENGTH * smoothstep(1.0-edge, 1.0+edge, 1.0 - abs(tri-1.0));
    float b = 1.0 - MASK_STRENGTH + MASK_STRENGTH * smoothstep(1.0-edge, 1.0+edge, 1.0 - abs(tri-2.0));
    vec3 mask = clamp(vec3(r,g,b), 0.0, 1.0);

    // Base sample with tiny deconvergence (output-px units)
    vec2 dR = vec2(DECONV_X_R, DECONV_Y_R) / HOOKED_size;
    vec2 dB = vec2(DECONV_X_B, DECONV_Y_B) / HOOKED_size;
    vec3 rgb;
    rgb.r = HOOKED_tex(uv + dR).r;
    rgb.g = HOOKED_tex(uv).g;
    rgb.b = HOOKED_tex(uv + dB).b;

    // Apply mask
    rgb *= mask;

    // -------- Scanlines in VIDEO space (never drift) --------
    float vy = floor(uv.y * HOOKED_size.y) + SCAN_PHASE;
    float Y  = luma(rgb);
    float breath = mix(SCAN_STRENGTH, SCAN_MIN, clamp(Y, 0.0, 1.0));
    float lineDark = (mod(vy, 2.0) < 1.0) ? breath * (1.0 + BEAM_BREATH) : 0.0;
    rgb *= (1.0 - clamp(lineDark, 0.0, 1.0));

    // Micro-bloom
    rgb = micro_bloom(uv, rgb);

    // -------- Brightness pipeline --------
    rgb *= BRIGHTNESS_GAIN;
    rgb += BRIGHTNESS_LIFT;
    rgb = pow(clamp(rgb, 0.0, 1.0), vec3(GAMMA_OUT));

    return vec4(clamp(rgb, 0.0, 1.0), 1.0);
}

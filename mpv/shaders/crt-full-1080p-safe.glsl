//!HOOK MAIN
//!BIND HOOKED
//!DESC CRT Full 1080p: source-space bloom and warm phosphor response

vec4 hook() {
    vec3 base = HOOKED_tex(HOOKED_pos).rgb;
    vec3 blur = base * 0.52;
    blur += HOOKED_texOff(vec2( 1.0, 0.0)).rgb * 0.12;
    blur += HOOKED_texOff(vec2(-1.0, 0.0)).rgb * 0.12;
    blur += HOOKED_texOff(vec2(0.0,  1.0)).rgb * 0.12;
    blur += HOOKED_texOff(vec2(0.0, -1.0)).rgb * 0.12;
    float peak = max(max(base.r, base.g), base.b);
    float glow = smoothstep(0.60, 1.0, peak);
    vec3 rgb = base + mix(base, blur, 0.53) * glow * 0.24;
    rgb *= vec3(1.040, 1.014, 0.960);
    return vec4(clamp(rgb, 0.0, 1.0), 1.0);
}

//!HOOK OUTPUT
//!BIND HOOKED
//!DESC CRT Full 1080p: fine 720-line texture and display-locked grille

#define PI 3.14159265358979323846
#define CRT_ROWS 720.0
#define SCAN_STRENGTH 0.30
#define MASK_AMOUNT 0.085

float scan_factor() {
    float phase = HOOKED_pos.y * CRT_ROWS - 0.5;
    float dark_band = 0.5 + 0.5 * cos(PI * phase);
    float rows_per_pixel = CRT_ROWS / HOOKED_size.y;
    float alias_guard = 1.0 - smoothstep(1.0, 1.5, rows_per_pixel);
    return 1.0 - SCAN_STRENGTH * dark_band * alias_guard;
}

vec4 hook() {
    vec3 rgb = HOOKED_tex(HOOKED_pos).rgb * scan_factor();
    float column = mod(floor(HOOKED_pos.x * HOOKED_size.x), 3.0);
    vec3 mask = vec3(1.0 - MASK_AMOUNT);
    if (column < 0.5) mask.r = 1.0 + 2.0 * MASK_AMOUNT;
    else if (column < 1.5) mask.g = 1.0 + 2.0 * MASK_AMOUNT;
    else mask.b = 1.0 + 2.0 * MASK_AMOUNT;
    return vec4(clamp(rgb * mask, 0.0, 1.0), 1.0);
}

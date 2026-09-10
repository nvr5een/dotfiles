//!HOOK OUTPUT
//!BIND HOOKED
//!DESC CRT Lite 480p: gentle 480-line texture and display-locked grille

#define PI 3.14159265358979323846
#define CRT_ROWS 480.0
#define SCAN_STRENGTH 0.22
#define MASK_AMOUNT 0.065

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
    rgb *= mask;
    rgb = pow(clamp(rgb * 1.035 + 0.008, 0.0, 1.0), vec3(0.98));
    rgb *= vec3(1.025, 1.010, 0.975);
    return vec4(clamp(rgb, 0.0, 1.0), 1.0);
}

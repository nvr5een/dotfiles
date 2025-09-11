//!HOOK MAIN
//!BIND HOOKED
//!DESC Subtle highlight bloom / phosphor glow

vec4 hook() {
    vec2 tex = HOOKED_pos;
    vec2 px = 1.0 / HOOKED_size.xy;

    // downweight center, sample 8 neighbors
    vec3 base = HOOKED_tex(tex).rgb;
    vec3 acc = base * 0.40;
    acc += HOOKED_tex(tex + vec2(+px.x, 0)).rgb * 0.08;
    acc += HOOKED_tex(tex + vec2(-px.x, 0)).rgb * 0.08;
    acc += HOOKED_tex(tex + vec2(0, +px.y)).rgb * 0.08;
    acc += HOOKED_tex(tex + vec2(0, -px.y)).rgb * 0.08;
    acc += HOOKED_tex(tex + vec2(+px.x, +px.y)).rgb * 0.06;
    acc += HOOKED_tex(tex + vec2(-px.x, +px.y)).rgb * 0.06;
    acc += HOOKED_tex(tex + vec2(+px.x, -px.y)).rgb * 0.06;
    acc += HOOKED_tex(tex + vec2(-px.x, -px.y)).rgb * 0.06;

    // isolate highlights and mix back
    float glowAmt = smoothstep(0.6, 1.0, max(max(base.r, base.g), base.b));
    vec3 glow = mix(base, acc, 0.5) * glowAmt * 0.35; // strength
    return vec4(clamp(base + glow, 0.0, 1.0), 1.0);
}

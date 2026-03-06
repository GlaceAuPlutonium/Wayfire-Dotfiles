#version 330 core
out vec4 FragColor;

uniform vec2 iResolution;
uniform float iTime;

/* ---------- utils ---------- */

float ease(float t) {
    return t * t * (3.0 - 2.0 * t);
}

float rect(vec2 p, vec2 s) {
    vec2 d = abs(p) - s;
    return max(d.x, d.y);
}

float drawRect(vec2 uv, vec2 pos, vec2 size) {
    float r = rect(uv - pos, size);
    return smoothstep(0.01, -0.01, r);
}

/* ---------- main ---------- */

void main() {
    vec2 uv = gl_FragCoord.xy / iResolution.xy;
    uv = uv * 2.0 - 1.0;
    uv.x *= iResolution.x / iResolution.y;

    vec3 bg = vec3(0.06, 0.06, 0.08);
    vec3 col = bg;

    float t = iTime;

    /* GLOBAL FADE IN */
    float fade = ease(clamp(t / 0.6, 0.0, 1.0));

    /* MAIN PANEL */
    float panelT = ease(clamp((t - 0.4) / 1.0, 0.0, 1.0));
    vec2 panelPos = vec2(0.0, mix(-0.35, 0.0, panelT));
    float panel = drawRect(uv, panelPos, vec2(0.45, 0.18));

    vec3 panelCol = vec3(0.12, 0.13, 0.16);

    col = mix(col, panelCol, panel * panelT * fade);

    /* INPUT BAR */
    float inputT = ease(clamp((t - 1.1) / 0.8, 0.0, 1.0));
    vec2 inputPos = panelPos + vec2(0.0, 0.02);
    float input = drawRect(uv, inputPos, vec2(0.36, 0.035));

    vec3 inputCol = vec3(0.18, 0.19, 0.23);
    col = mix(col, inputCol, input * inputT * fade);

    /* BUTTON */
    float btnT = ease(clamp((t - 1.5) / 0.8, 0.0, 1.0));
    vec2 btnPos = panelPos + vec2(0.0, -0.09);
    float btn = drawRect(uv, btnPos, vec2(0.18, 0.04));

    vec3 btnCol = vec3(0.30, 0.45, 0.85);
    col = mix(col, btnCol, btn * btnT * fade);

    FragColor = vec4(col, 1.0);
}

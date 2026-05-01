window-open {
        duration-ms 320
        curve "linear"
        custom-shader r"
            float hash(vec2 p) {
                return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
            }

            float noise(vec2 p) {
                vec2 i = floor(p);
                vec2 f = fract(p);
                f = f * f * (3.0 - 2.0 * f);
                float a = hash(i);
                float b = hash(i + vec2(1.0, 0.0));
                float c = hash(i + vec2(0.0, 1.0));
                float d = hash(i + vec2(1.0, 1.0));
                return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
            }

            float fbm(vec2 p) {
                float v = 0.0;
                float amp = 0.5;
                for (int i = 0; i < 4; i++) {
                    v += amp * noise(p);
                    p *= 2.0;
                    amp *= 0.5;
                }
                return v;
            }

            float warpedFbm(vec2 p, float t) {
                vec2 q = vec2(fbm(p),
                              fbm(p + vec2(5.2, 1.3)));
                vec2 pq = p + 6.0 * q;
                vec2 r = vec2(fbm(pq + vec2(1.7, 9.2) + 0.25 * t),
                              fbm(pq + vec2(8.3, 2.8) + 0.22 * t));
                return fbm(p + 5.0 * r);
            }

            vec4 open_color(vec3 coords_geo, vec3 size_geo) {
                float p    = niri_clamped_progress;
                vec2  uv   = coords_geo.xy;
                float seed = niri_random_seed * 100.0;
                float t    = p * 12.0 + seed;

                float fluid = warpedFbm(uv * 2.0 + seed, t);

                vec2  center  = uv - 0.5;
                float dist    = length(center * vec2(1.0, 0.7));
                float appear  = (1.0 - dist * 1.2) + (1.0 - fluid) * 0.7;
                float reveal  = smoothstep(appear + 0.5, appear - 0.5, (1.0 - p) * 1.8);

                if (reveal < 0.004) return vec4(0.0);

                float distort_strength = (1.0 - p) * (1.0 - p) * 0.35;

                vec2  uv2  = uv * 2.0;
                float t02  = t * 0.2;
                vec2  wq   = vec2(fbm(uv2 + vec2(0.0, t02)),
                                  fbm(uv2 + vec2(5.2, t02)));

                vec2 warped_uv  = uv + (wq - 0.5) * distort_strength;
                vec3 tex_coords = niri_geo_to_tex * vec3(warped_uv, 1.0);
                vec4 color      = texture2D(niri_tex, tex_coords.st);

                return color * reveal;
            }
        "
    }

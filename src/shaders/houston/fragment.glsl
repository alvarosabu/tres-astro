varying vec2 vUv;
varying vec3 vGeneratedTexCoord;

struct ColorStop {
    float position;
    vec3 color;
};

vec3 ColorRamp(ColorStop[3] colors, float factor) {
    int index = 0;
    for(int i = 0; i < colors.length(); i++) {
        ColorStop currentColor = colors[i];
        ColorStop nextColor = colors[i + 1];

        bool isInBetween = factor >= currentColor.position && factor <= nextColor.position;
        index = int(mix(float(index), float(i), float(isInBetween)));
    }

    ColorStop currentColor = colors[index];
    ColorStop nextColor = colors[index + 1];

    float range = nextColor.position - currentColor.position;
    float lerpFactor = (factor - currentColor.position) / range;
    return mix(currentColor.color, nextColor.color, lerpFactor);
}

void main() {
    ColorStop[3] colors = ColorStop[](
        ColorStop(0.018, vec3(0.18, 0.1725, 0.9922)),
        ColorStop(0.335, vec3(0.535, 0.2667, 0.9843)),
        ColorStop(0.902, vec3(0.4784, 0.7294, 1.0))
    );
    /* gl_FragColor = vec4(ColorRamp(colors, vUv.x + vUv.y), 1.0); */
    // Using the sum of the x, y, and z components of vGeneratedTexCoord
    gl_FragColor = vec4(ColorRamp(colors, vGeneratedTexCoord.x ), 1.0);
}

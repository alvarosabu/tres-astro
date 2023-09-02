varying vec2 vUv;
varying vec3 vGeneratedTexCoord;
uniform vec3 bboxMin;
uniform vec3 bboxMax;

void main() {
    vGeneratedTexCoord = (position - bboxMin) / (bboxMax - bboxMin);
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
    vUv = uv;
}

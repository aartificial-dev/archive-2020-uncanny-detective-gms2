//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
	vec4 normCol = vec4(106.0 / 255.0, 106.0 / 255.0, 254.0 / 255.0, 1.0);
	vec4 tex = texture2D( gm_BaseTexture, v_vTexcoord );
  gl_FragColor = v_vColour * vec4(normCol.rgb, tex.a);
}

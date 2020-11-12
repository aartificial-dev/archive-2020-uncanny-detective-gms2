//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
	float stage = 14.0;//7.0
	vec4 tex = texture2D( gm_BaseTexture, v_vTexcoord );
	float texVal = (tex.r + tex.g + tex.b) / 3.0;
	float band = floor(texVal * stage) / stage;
	
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ) * band;
}

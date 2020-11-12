//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float iTime;

const float range = 0.05;
const float noiseQuality = 250.0;
const float noiseIntensity = 0.0018; // overall noise
const float offsetIntensity = 0.003; // line noise
const float colorOffsetIntensity = 0.4;
const float desaturationFactor = 0.6;

float rand(vec2 co) {
	return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

float verticalBar(float pos, float uvY, float offset) {
  float edge0 = (pos - range);
  float edge1 = (pos + range);

  float x = smoothstep(edge0, pos, uvY) * offset;
  x -= smoothstep(pos, edge1, uvY) * offset;
  return x;
}

void main() {
  //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec2 uv = v_vTexcoord;
    
  for (float i = 0.0; i < 0.71; i += 0.1313) {
    float d = mod(iTime * i, 1.7);
    float o = sin(1.0 - tan(iTime * 0.24 * i));
    o *= offsetIntensity;
    uv.x += verticalBar(d, uv.y, o);
  }
    
  float uvY = uv.y;
  uvY *= noiseQuality;
  uvY = float(int(uvY)) * (1.0 / noiseQuality);
  float noise = rand(vec2(iTime * 0.00001, uvY));
  uv.x += noise * noiseIntensity;

  vec2 offsetR = vec2(0.006 * sin(iTime), 0.0) * colorOffsetIntensity;
  vec2 offsetG = vec2(0.0073 * (cos(iTime * 0.97)), 0.0) * colorOffsetIntensity;
    
  float r = texture2D( gm_BaseTexture, uv + offsetR).r;
  float g = texture2D( gm_BaseTexture, uv + offsetG).g;
  float b = texture2D( gm_BaseTexture, uv).b;
	vec4 mainTex = texture2D( gm_BaseTexture, uv );

  vec4 tex = vec4(r, g, b, 1.0);
  vec3 gray = vec3( dot( tex.rgb , vec3( 0.2126 , 0.7152 , 0.0722 ) ) );
  gl_FragColor = vec4( mix( tex.rgb , gray , desaturationFactor ) , mainTex.a );
  //fragColor = tex * vec4(0.3, 0.3, 0.3, 1.0);
}

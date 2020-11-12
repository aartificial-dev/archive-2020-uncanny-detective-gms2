const float fPI = 3.14159265359;
const float c_fTreshold = 0.75;
const int c_iMaxLights = 100;
const int c_iMaxShadows = 100;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// light variables
uniform vec2 u_vLightPos[c_iMaxLights]; // x, y
uniform vec3 u_vLightCol[c_iMaxLights]; // r, g, b
uniform float u_fLightFal[c_iMaxLights]; // falloff
uniform float u_fLightLum[c_iMaxLights]; // luminosity
uniform vec2 u_vLightAng[c_iMaxLights];  // angle, direction

// box coords
uniform vec4 u_vPolyX[c_iMaxShadows];
uniform vec4 u_vPolyY[c_iMaxShadows];

// consts
uniform int u_iBoxNum;
uniform int u_iLightNum;
uniform vec3 u_vResolution;
uniform int u_iNormal;
uniform vec3 u_vAmb;

// samplers
uniform sampler2D u_sNormal;
uniform sampler2D u_sIllum;


float dirDiff (float ang1, float ang2) {
	float _diff = mod(ang2 - ang1, fPI * 2.0);
	if (_diff < 0.0) {
	  _diff += fPI * 2.0;
	}
	if (_diff > fPI) {
	  return -((fPI * 2.0) - _diff);
	}else{
	  return _diff;
	}
} 

bool doLinesIntersect (float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, bool seg) {
  float ua = 0.0;
  float ux = x2 - x1;
  float uy = y2 - y1;
  float vx = x4 - x3;
  float vy = y4 - y3;
  float wx = x1 - x3;
  float wy = y1 - y3;
  float ud = vy * ux - vx * uy;
  if (ud != 0.0) {
	  ua = (vx * wy - vy * wx) / ud;
	  if (seg) {
	    float ub = (ux * wy - uy * wx) / ud;
	    if (ua < 0.0 || ua > 1.0 || ub < 0.0 || ub > 1.0) ua = 0.0;
	  }
  }
  return (ua > 0.0);
}

float tSign (vec2 p1, vec2 p2, vec2 p3) {
    return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y);
}

bool pointInTriangle (vec2 pt, vec2 v1, vec2 v2, vec2 v3) {
    float d1 = tSign(pt, v1, v2);
    float d2 = tSign(pt, v2, v3);
    float d3 = tSign(pt, v3, v1);

    bool has_neg = (d1 < 0.0) || (d2 < 0.0) || (d3 < 0.0);
    bool has_pos = (d1 > 0.0) || (d2 > 0.0) || (d3 > 0.0);

    return !(has_neg && has_pos);
}

void main() {
	vec4 illum = texture2D(u_sIllum, v_vTexcoord);
	float illimLevel = (illum.r + illum.g + illum.b) / 3.0;
	if (illimLevel > c_fTreshold) {
		gl_FragColor = vec4(v_vColour.rgb * illimLevel, v_vColour.a);
		return;
	}
	
	vec4 col = vec4(u_vAmb.rgb, 1.0);
	vec3 normal = texture2D( u_sNormal, v_vTexcoord ).rgb;
	normal.g = 1.0 - normal.g;
  normal = normalize(normal * 2.0 - 1.0);  
	
	//vec3 colSum = vec3(0.0);
	
	for (int i = 0; i < u_iLightNum; i ++) {
		vec4 lightCol = vec4(u_vLightCol[i], 1.0);
		vec2 lightPos = u_vLightPos[i];
		vec2 lightAng = u_vLightAng[i];
		float lightFal = u_fLightFal[i];
		float dist = distance(vec2(lightPos.x * u_vResolution.z, lightPos.y), vec2(v_vTexcoord.x * u_vResolution.z, v_vTexcoord.y)); // lightPos
		float usin = sin(-min(dist, lightFal) * (fPI / ( 2.0 * lightFal)));
		float fall = clamp((usin + 1.0) * u_fLightLum[i], 0.0, 1.0);
		//float fall = clamp((lightFal / dist) - lightFal, 0.0, min(1.0, u_fLightLum[i]));
		//float fall = clamp(1.0 - (dist / lightFal), 0.0, min(1.0, u_fLightLum[i]));
		//fall = smoothstep(0.0, 1.0, fall);
		if (fall == 0.0) {
			continue;
		}
		vec3 LightDir = vec3(lightPos.xy - (gl_FragCoord.xy / u_vResolution.xy), 1.0);
		vec3 N = normal; 
		vec3 L = normalize(LightDir);
		float normDot = 1.0;
		if (u_iNormal == 1) {
			normDot = max(dot(N, L), 0.0);
		}
		vec4 newCol = mix(col, lightCol * normDot, fall);
		
		
		
		bool doMix = true;
		for (int j = 0; j < u_iBoxNum; j ++) {
			vec4 polyx = u_vPolyX[j];
			vec4 polyy = u_vPolyY[j];
			
			bool _inCorner1 = pointInTriangle(lightPos, vec2(polyx.x, polyy.x), vec2(polyx.y, polyy.y), vec2(polyx.z, polyy.z));
			bool _inCorner2 = pointInTriangle(lightPos, vec2(polyx.z, polyy.z), vec2(polyx.w, polyy.w), vec2(polyx.x, polyy.x));
			if (_inCorner1 || _inCorner2) {
				doMix = false;
				break;
			}
			
			float x1 = lightPos.x;// * u_fResolution;
			float y1 = lightPos.y;
			float x2 = v_vTexcoord.x;// * u_fResolution;
			float y2 = v_vTexcoord.y;
			if (doLinesIntersect(x1, y1, x2, y2, polyx.x, polyy.x, polyx.y, polyy.y, true)) {	doMix = false; break;	}
			if (doLinesIntersect(x1, y1, x2, y2, polyx.y, polyy.y, polyx.z, polyy.z, true)) {	doMix = false; break;	}
			if (doLinesIntersect(x1, y1, x2, y2, polyx.z, polyy.z, polyx.w, polyy.w, true)) {	doMix = false; break;	}
			if (doLinesIntersect(x1, y1, x2, y2, polyx.w, polyy.w, polyx.x, polyy.x, true)) {	doMix = false; break;	}
			
			
			//bool _top = doLinesIntersect(x1, y1, x2, y2, polyx.x, polyy.x, polyx.y, polyy.y, true);
			//bool _right = doLinesIntersect(x1, y1, x2, y2, polyx.y, polyy.y, polyx.z, polyy.z, true);
			//bool _bottom = doLinesIntersect(x1, y1, x2, y2, polyx.z, polyy.z, polyx.w, polyy.w, true);
			//bool _left = doLinesIntersect(x1, y1, x2, y2, polyx.w, polyy.w, polyx.x, polyy.x, true);
			//if (_top || _right || _bottom || _left) {
			//	doMix = false;
			//	break;
			//}
		}
		float pointAng = atan(v_vTexcoord.y -lightPos.y, (v_vTexcoord.x - lightPos.x)* u_vResolution.z);
		float differ = abs(dirDiff(lightAng.y, -pointAng));
		if (differ > lightAng.x && doMix) {
			if (differ <= lightAng.x + 0.2) {
				col.rgb = mix(col, newCol, (0.2 - (differ - lightAng.x)) * 5.0).rgb;
			}
			continue;
		}
		if (doMix) {
			col.rgb = newCol.rgb;
		}
	}
	
  gl_FragColor = v_vColour * vec4(col.rgb, 1.0);//* vec4(colSum, diffuse.a);//vec4(col.rgb, v_vColour.a) * diffuse; // v_vColour * 
}
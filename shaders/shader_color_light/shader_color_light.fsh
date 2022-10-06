uniform sampler2D uTexture;
uniform vec2 uTexScale;

uniform vec4 uMixColor;
uniform float uBrightness;
uniform vec4 uHighlightColor;

uniform vec3 uCameraDirection;
uniform vec4 uAmbientColor;
uniform vec4 uLightColor;

varying vec3 vPosition;
varying vec3 vNormal;
varying vec4 vColor;
varying vec2 vTexCoord;

void main()
{
	vec2 tex = fract(vTexCoord) * uTexScale;
	vec4 baseColor = vColor * texture2D(uTexture, tex); // Get base
	
	baseColor.rgb = mix(baseColor.rgb, uMixColor.rgb, uMixColor.a); // Mix
	baseColor.rgb = mix(baseColor.rgb, uHighlightColor.rgb, uHighlightColor.a); // Highlight
	
	// Lighting
	float dif;
	vec3 light;
	
	// Light 1 (Right)
	dif = clamp(max(0.0, dot(normalize(vNormal), cross(uCameraDirection, vec3(0.0, 0.0, 1.0)))), 0.0, 1.0);	
	light += (dif * uLightColor.rgb * .125);
	
	// Light 2 (Left)
	dif = clamp(max(0.0, dot(normalize(vNormal), cross(uCameraDirection, vec3(0.0, 0.0, -1.0)))), 0.0, 1.0);	
	light += (dif * uLightColor.rgb * .35);
	
	// Light 3 (From camera)
	dif = clamp(max(0.0, dot(normalize(vNormal), uCameraDirection)), 0.0, 1.0);	
	light += (dif * dif * uLightColor.rgb);
	
	// Light 4 (Top)
	dif = clamp(max(0.0, dot(normalize(vNormal), vec3(0.0, 0.0, 1.0))), 0.0, 1.0);	
	light += (dif * uLightColor.rgb * .8);
	
	// Light 5 (Bottom)
	dif = clamp(max(0.0, dot(normalize(vNormal), vec3(0.0, 0.0, -1.0))), 0.0, 1.0);	
	light += (dif * uLightColor.rgb * .4);
	
	light = mix((light + uAmbientColor.rgb), vec3(1.0), vec3(uBrightness));
	light = clamp(light, vec3(0.0), vec3(1.0));
	
	gl_FragColor = vec4(baseColor.rgb * light, baseColor.a);
	
	if (gl_FragColor.a == 0.0)
		discard;
}

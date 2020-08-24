uniform sampler2D uTexture;
uniform vec2 uTexScale;

uniform vec4 uMixColor;
uniform float uBrightness;
uniform vec4 uHighlightColor;

uniform vec3 uCameraPosition;
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
	
	// Diffuse factor
	float dif = max(0.0, dot(normalize(vNormal), normalize(uCameraPosition)));	
	dif = clamp(dif, 0.0, 1.0);
	
	vec3 light = mix(((dif * uLightColor.rgb) + uAmbientColor.rgb), vec3(1.0), uBrightness);
	light = clamp(light, 0.0, 1.0);
	
	gl_FragColor = vec4(baseColor.rgb * light, baseColor.a);
	
	if (gl_FragColor.a == 0.0)
		discard;
}

uniform sampler2D uTexture;
uniform vec2 uTexScale;

uniform vec4 uMixColor;
uniform vec4 uHighlightColor;

uniform vec3 uCameraPosition;

varying vec3 vPosition;
varying float vDepth;
varying vec4 vColor;
varying vec2 vTexCoord;

void main()
{
	vec2 tex = fract(vTexCoord) * uTexScale;
	vec4 baseColor = vColor * texture2D(uTexture, tex); // Get base
	
	baseColor.rgb = mix(baseColor.rgb, uMixColor.rgb, uMixColor.a); // Mix
	baseColor.rgb = mix(baseColor.rgb, uHighlightColor.rgb, uHighlightColor.a); // Highlight
	
	gl_FragColor = baseColor;
	
	if (gl_FragColor.a == 0.0)
		discard;
}

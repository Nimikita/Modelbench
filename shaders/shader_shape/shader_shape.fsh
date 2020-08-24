uniform sampler2D uTexture;
uniform vec2 uTexScale;

uniform vec4 uShape;

varying vec3 vPosition;
varying float vDepth;
varying vec4 vColor;
varying vec2 vTexCoord;

void main()
{
	vec2 tex = fract(vTexCoord) * uTexScale;
	vec4 baseColor = vColor * texture2D(uTexture, tex); // Get base
	
	// Discard if less than 1% opacity
	if (floor(baseColor.a * 255.0) / 250.0 < .005)
		discard;
	
	gl_FragColor = vec4(uShape.rgb, 1.0);
}

uniform sampler2D uTexture;
uniform vec2 uTexScale;

uniform vec4 uShape;

varying vec3 vPosition;
varying float vDepth;
varying vec4 vColor;
varying vec2 vTexCoord;

void main()
{
	vec2 tex = vTexCoord;
	if (uTexScale.x < 1.0 || uTexScale.y < 1.0)
		tex = mod(tex * uTexScale, uTexScale); // GM sprite bug workaround
	vec4 baseColor = vColor * texture2D(uTexture, tex); // Get base
	
	// Discard if less than 75% opacity
	if (baseColor.a < .745)
		discard;
	
	gl_FragColor = vec4(uShape.rgb, 1.0);
}

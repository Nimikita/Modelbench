uniform sampler2D uTexture;
uniform vec2 uTexScale;

//uniform vec4 uShape;

varying vec3 vPosition;
varying vec3 vNormal;
varying float vDepth;
varying vec4 vColor;
varying vec2 vTexCoord;

void main()
{
	vec2 tex = vTexCoord;
	if (uTexScale.x < 1.0 || uTexScale.y < 1.0)
		tex = mod(tex * uTexScale, uTexScale); // GM sprite bug workaround
	vec4 baseColor = vColor * texture2D(uTexture, tex); // Get base
	
	if (baseColor.a < .98)
		discard;
	
	gl_FragColor = vec4((vNormal + 1.0) / 2.0, 1.0);
}

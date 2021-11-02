uniform sampler2D uTexture;
uniform vec2 uTexScale;

varying vec2 vTexCoord;

void main()
{
	vec2 tex = fract(vTexCoord) * uTexScale;
	vec4 baseColor = texture2D(uTexture, tex);
	if (baseColor.a == 0.0)
		discard;
		
	gl_FragColor = vec4(0.0, 0.0, 0.0, baseColor.a);
}


uniform vec2 uTexSize;
uniform vec4 uColor;
uniform float uSize;

varying vec2 vTexCoord;

bool isHighlight(vec2 off)
{
	vec2 pos = vec2(vTexCoord.x + off.x * (1.0 / uTexSize.x),
					vTexCoord.y + off.y * (1.0 / uTexSize.y));
	return (texture2D(gm_BaseTexture, pos).a > 0.0);
}

bool checkHighlight(float size)
{
	return (isHighlight(vec2(size, size)) || isHighlight(vec2(-size, size)) || isHighlight(vec2(size, -size)) || isHighlight(vec2(-size, -size)));
}

void main()
{
	float size = uSize;
	if (texture2D(gm_BaseTexture, vTexCoord).a > 0.0)
		discard;
	else
	{
		if (checkHighlight(size))
			gl_FragColor = uColor;
		else
			discard;
	}
}

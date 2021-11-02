uniform vec2 uTexSize;
uniform sampler2D uShapeBuffer;
uniform sampler2D uNormalBuffer;
uniform float uStrength;

varying vec2 vTexCoord;

// Get normal Value
vec3 unpackNormal(vec4 c)
{
	return c.rgb * 2.0 - 1.0;
}

bool isHighlight(vec2 off, vec4 shape, vec3 normal)
{
	vec2 posdouble = vec2(vTexCoord.x + (off.x * 2.0) * (1.0 / uTexSize.x),
					vTexCoord.y + (off.y * 2.0) * (1.0 / uTexSize.y));
	
	if (texture2D(uShapeBuffer, posdouble).a < 1.0)
		return true;
	else
	{
		vec2 pos = vec2(vTexCoord.x + off.x * (1.0 / uTexSize.x),
					vTexCoord.y + off.y * (1.0 / uTexSize.y));
		
		float dotcomparison = max(0.0, dot(normal, normalize(unpackNormal(texture2D(uNormalBuffer, pos)))));
		
		return ((shape.rgb != texture2D(uShapeBuffer, pos).rgb) || dotcomparison < .98);
	}
}

void main()
{
	float size = 1.0;
	vec4 shape = texture2D(uShapeBuffer, vTexCoord);
	
	if (shape.a < 1.0)
		gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
	else
	{
		vec3 normal = normalize(unpackNormal(texture2D(uNormalBuffer, vTexCoord)));

		if (isHighlight(vec2(size, size), shape, normal)
			 || isHighlight(vec2(-size, size), shape, normal)
			 || isHighlight(vec2(size, -size), shape, normal)
			 || isHighlight(vec2(-size, -size), shape, normal))
			 gl_FragColor = vec4(uStrength, uStrength, uStrength, 1.0);
		else
			gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
	}
}

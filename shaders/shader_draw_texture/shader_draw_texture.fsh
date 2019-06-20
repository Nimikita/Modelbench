uniform sampler2D uTexture;
uniform vec2 uTexScale;

varying vec2 vTexCoord;
varying vec4 vColor;

void main()
{
	vec2 tex = vTexCoord;
	
	if (uTexScale.x < 1.0 || uTexScale.y < 1.0)
		tex = mod(tex * uTexScale, uTexScale); // GM sprite bug workaround
	
	vec4 color;
	color = texture2D(uTexture, tex);
	color *= vColor;
	
	gl_FragColor = color;
}
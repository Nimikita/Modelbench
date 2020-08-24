uniform sampler2D uTexture;
uniform vec2 uTexScale;

varying vec2 vTexCoord;
varying vec4 vColor;

void main()
{
	vec2 tex = fract(vTexCoord) * uTexScale;
	
	vec4 color;
	color = texture2D(uTexture, tex);
	color *= vColor;
	
	gl_FragColor = color;
}
varying vec2 vTexCoord;
varying vec3 vWorldNormal;
varying vec3 vPosition;
varying vec4 vColor;

uniform vec3 uCameraPosition;

uniform vec4 uColorLight;
uniform vec4 uColorDark;
uniform vec3 uLightPosition;

uniform int uIsGround;

void main()
{
	vec4 final_color = vec4(uColorDark.rgb, 1.0);
	
	float fadesize = 1.0;
	float lightsize = 4250.0;
	
	if (uIsGround > 0)
		final_color.rgb += vec3(0.4) * pow(1.0 - clamp((distance(vPosition, vec3(0.0)) - 512.0 * (1.0 - fadesize)) / (512.0 * fadesize), 0.0, 1.0), 3.0);
	
	// Attenuation factor
	float att = 1.0 - clamp((distance(vPosition, uLightPosition) - lightsize * (1.0 - fadesize)) / (lightsize * fadesize), 0.0, 1.0);
	final_color.rgb += .1 * uColorLight.rgb * att;
	
	att = pow(att, 3.0);
	
	final_color.rgb = mix(final_color.rgb, uColorLight.rgb, att * 1.5); 
	
	//final_color.rgb += uColorLight.rgb * 1.0;//smoothstep(clamp(1.0 - (distance(vPosition, uLightPosition)/5000.0), 0.0, 1.0), 0.0, 1.0);
	
    gl_FragColor = final_color;
}
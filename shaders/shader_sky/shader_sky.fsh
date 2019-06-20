varying vec2 vTexCoord;
varying vec3 vWorldNormal;
varying vec3 vPosition;
varying vec4 vColor;

uniform vec3 uCameraPosition;

uniform vec4 uColorLight;
uniform vec4 uColorDark;
uniform float uHorizonPow;
uniform float uContrast;

void main()
{
	vec3 toCam = normalize(vPosition - uCameraPosition);
	vec4 final_color = vec4(uColorDark.rgb, 1.0);
	
	vec3 lightColor = uColorLight.rgb;
	float middle = (1.0 - abs(dot(vWorldNormal, vec3(0.0, 0.0, -1.0))));
	middle = clamp((middle + 0.25), 0.0, 1.0);
	
	final_color.rgb = mix(final_color.rgb, lightColor, middle);
	
	if (dot(vWorldNormal, vec3(0.0, 0.0, -1.0)) < 0.0)
		final_color.rgb = lightColor;
	
	middle = (1.0 - abs(dot(vWorldNormal, vec3(0.0, 0.0, -1.0))));
	middle = pow(middle, uHorizonPow) * 0.35;
	
	final_color.rgb += vec3(middle);
	
	final_color.rgb = (final_color.rgb - vec3(0.5)) * vec3(uContrast) + vec3(0.5);
	
    gl_FragColor = final_color;
	
	if (final_color.a == 0.0)
		discard;
}
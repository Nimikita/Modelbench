uniform vec3 uCameraPosition;
uniform int uFade;
uniform vec4 uFadeColor;
uniform float uFadeStart;
uniform float uFadeEnd;
uniform vec4 uBlendColor;

varying vec3 vPosition;

void main()
{
	float fade = 0.0;
	
	if (uFade > 0)
	{
		float dis = distance(vPosition.xyz, uCameraPosition.xyz);
		fade = clamp((dis - uFadeStart) / (uFadeEnd - uFadeStart), 0.0, 1.0);
	
		float angle = 1.0 - dot(vec3(0.0, 0.0, 1.0), normalize(uCameraPosition - vPosition));
		float angleFade = clamp((angle - 0.9) / (1.0 - 0.9), 0.0, 1.0);
	
		fade = clamp(fade + angleFade, 0.0, 1.0);
	
		if (fade > .999)
			discard;
	}
	
	gl_FragColor = vec4(mix(uBlendColor.rgb, uFadeColor.rgb, vec3(fade)), 1.0);
}

varying vec2 vTexCoord;
varying vec3 vWorldNormal;
varying vec3 vPosition;
varying vec4 vColor;

uniform vec3 uCameraPosition;

uniform vec4 uColorTop;
uniform vec4 uColorBottom;
uniform float uHorizonPow;
uniform float uContrast;

#define Scale vec3(.8)
#define K 19.19
vec3 hash(vec3 a)
{
    a = fract(a * Scale);
    a += dot(a, a.yxz + K);
    return fract((a.xxy + a.yxx) * a.zyx);
}

void main()
{
	vec3 normal = vWorldNormal + (hash(vPosition) * 0.01);
	float middle = (1.0 - abs(dot(normal, vec3(0.0, 0.0, -1.0))));
	middle = clamp((middle + 0.25), 0.0, 1.0);
	
	if (dot(normal, vec3(0.0, 0.0, -1.0)) < 0.0)
		middle = 1.0;
	else
		middle = (1.0 - abs(dot(normal, vec3(0.0, 0.0, -1.0))));
	
	middle = pow(middle, uHorizonPow);
	
	vec4 final_color = vec4(mix(uColorTop.rgb, uColorBottom.rgb, middle), 1.0);
	final_color.rgb = (final_color.rgb - vec3(0.5)) * vec3(uContrast) + vec3(0.5);
	
    gl_FragColor = final_color;
	
	if (final_color.a == 0.0)
		discard;
}
/// shader_sky
/// Used when drawing a texture

attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;
attribute vec3 in_Normal;
attribute vec3 in_Wave;
attribute vec3 in_Tangent;

varying vec2 vTexCoord;
varying vec4 vColor;
varying vec3 vPosition;
varying vec3 vNormal;
varying vec3 vWorldNormal;

varying vec2 vN;

varying float vWind;

void main() {
	vNormal = in_Normal;
	vPosition = (gm_Matrices[MATRIX_WORLD] * vec4(in_Position, 1.0)).xyz;
	
	vWorldNormal = normalize((gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0.0)).xyz);
	
	vColor = in_Colour;
    vTexCoord = in_TextureCoord;
	
	//vDepth = (distance(vPosition, campos) - 0.1) / (32000.0 - 0.1);
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
}


/// new_shader(name, script)
/// @arg name
/// @arg shader

function new_shader(argument0)
{
	with (new_obj(obj_shader))
	{
		name = argument0
		shader = asset_get_index(name)
		script = asset_get_index(name + "_set")
		uniform_map = ds_map_create()
		sampler_map = ds_map_create()
		
		// Set common uniforms
		
		new_shader_sampler("uTexture")
		new_shader_uniform("uTexScale")
		new_shader_uniform("uBlendColor")
		
		// Wind
		new_shader_uniform("uTime")
		new_shader_uniform("uWindEnable")
		new_shader_uniform("uWindTerrain")
		new_shader_uniform("uWindSpeed")
		new_shader_uniform("uWindStrength")
		
		new_shader_uniform("uCameraPosition")
		
		shader_map[?shader] = id
		return id
	}
}

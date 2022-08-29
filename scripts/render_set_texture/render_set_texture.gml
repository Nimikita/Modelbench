/// render_set_texture(texture)
/// @arg texture
/// @desc Sets the texture of the currently selected shader.

function render_set_texture(tex)
{
	var sampler, texid, scalex, scaley;
	sampler = render_shader_obj.sampler_map[?"uTexture"]
	scalex = 1
	scaley = 1
	texid = null
	
	if (is_undefined(sampler) || sampler < 0)
		return 0
	
	// Set filter
	gpu_set_texfilter_ext(sampler, shader_texture_filter_linear)
	gpu_set_tex_mip_enable((shader_texture_filter_mipmap ? mip_on : mip_off))
	gpu_set_tex_mip_filter_ext(sampler, tf_linear)
	
	// Surface
	if (shader_texture_surface)
	{
		if (surface_exists(tex))
		{
			texid = surface_get_texture(tex)
			texture_set_stage(sampler, texid)
		}
		else
			texture_set_stage(sampler, 0)
	}
	
	// Sprite texture
	else
	{
		if (sprite_exists(tex))
		{
			texid = sprite_get_texture(tex, 0)
			texture_set_stage(sampler, texid)
		}
		else
			texture_set_stage(sampler, 0)
	}
	
	// Set texture UV scale
	if (texid != null)
	{
		var uvs = texture_get_uvs(texid);
		scalex = uvs[2]
		scaley = uvs[3]
	}
	
	render_set_uniform_vec2("uTexScale", scalex, scaley)
	gpu_set_texrepeat_ext(sampler, true)
}

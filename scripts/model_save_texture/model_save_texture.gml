/// model_save_texture()

var filename, texsize, scale;

// Inherit texture
if (object_index != app && value[e_value.TEXTURE_OBJ] = null)
	return 0

// Define texture
if (instance_exists(res))
{
	filename = res.filename
	texsize = vec2_div(vec2(sprite_get_width(res.sprite), sprite_get_height(res.sprite)), res.scale)
	scale = res.scale
	
	json_save_var("texture", filename)
	json_save_var_point2D("texture_size", texsize)
	
	if (scale != 1)
		json_save_var("texture_scale", scale)
}

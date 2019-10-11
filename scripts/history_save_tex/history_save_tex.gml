/// history_save_tex(texture)
/// @arg texture
/// @desc Saves a texture in memory

var tex, save;
tex = argument0
save = new(obj_history_save)
save.hobj = id

with (tex)
	tex_copy(save)

with (save)
{
	save_id = tex.save_id
	usage_el_texture_amount = 0
}


with (obj_model_element)
{
	if (value[e_value.TEXTURE_OBJ] = tex)
	{
		save.usage_el_texture_save_id[save.usage_el_texture_amount] = save_id
		save.usage_el_texture_amount++
	}
}

return save
/// history_save_tex(texture)
/// @arg texture
/// @desc Saves a texture in memory

function history_save_tex(tex)
{
	var save;
	save = new_obj(obj_history_save)
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
}

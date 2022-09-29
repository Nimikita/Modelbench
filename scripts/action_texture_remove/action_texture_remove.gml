/// action_texture_remove()

function action_texture_remove()
{
	var tex, hobj;
	tex = list_item_value
	hobj = null
	
	if (history_undo)
	{
		with (history_data)
			history_restore_tex(save_tex)
	}
	else if (!history_redo)
	{
		hobj = history_set(action_texture_remove)
		with (hobj)
			save_tex = history_save_tex(tex)
	}
	
	if (!history_undo)
	{
		if (history_redo)
			tex = save_id_find(history_data.save_tex.save_id)
		
		with (tex)
			instance_destroy()
		
		// Update affected elements
		with (obj_model_element)
		{
			if (value[e_value.TEXTURE_OBJ] = tex)
				value[e_value.TEXTURE_OBJ] = null
		}
	}
	
	el_update_part()
	textures_list.update = true
	res_edit = null
}

/// action_texture_scale(value, add)
/// @arg value
/// @arg add

var tex;

if (history_undo)
{
	with (history_data) 
	{
		tex = save_id_find(save_var_save_id[0])
		tex.scale = save_var_old_value[0]
	}
}
else if (history_redo)
{
	with (history_data) 
	{
		tex = save_id_find(save_var_save_id[0])
		tex.scale = save_var_new_value[0]
	}
}
else
{
	var hobj = history_save_var_start(action_texture_scale, true);
	tex = res_edit
	
	with (hobj)
		history_save_var(tex, tex.scale, tex.scale * argument1 + argument0)
	
	
	tex.scale = tex.scale * argument1 + argument0
}

with (obj_model_element)
{
	if (element_type = TYPE_SHAPE && res = tex)
		update_vbuffer = true
}

with (app)
	el_update_part()

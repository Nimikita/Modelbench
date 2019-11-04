/// action_texture_set_main([texture])
/// @arg [texture]

var tex;

if (argument_count > 0)
	tex = argument[0]
else
	tex = context_menu_value

if (history_undo)
{
	with (history_data) 
		other.res = save_id_find(save_var_old_value[0])
}
else if (history_redo)
{
	with (history_data) 
		other.res = save_id_find(save_var_new_value[0])
}
else
{
	var hobj = history_save_var_start(action_texture_set_main, true);
	
	with (hobj)
		history_save_var(other.id, save_id_get(other.res), save_id_get(tex))
	
	res = tex
}

with (app)
	el_update_part()

with (obj_model_element)
{
	if (element_type = TYPE_SHAPE && res = tex)
		update_vbuffer = true
}

textures_list.update = true


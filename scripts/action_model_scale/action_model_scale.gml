/// action_model_scale(value, add)
/// @arg value
/// @arg add

function action_model_scale(value, add)
{
	if (history_undo)
	{
		with (history_data) 
			other.root_scale = save_var_old_value[0]
	}
	else if (history_redo)
	{
		with (history_data) 
			other.root_scale = save_var_new_value[0]
	}
	else
	{
		var hobj = history_save_var_start(action_model_scale, true);
		
		with (hobj)
			history_save_var(other.id, other.root_scale, other.root_scale * add + value)
		
		root_scale = root_scale * add + value
	}
	
	with (app)
		el_update_part()
	
	with (obj_model_element)
	{
		if (element_type = TYPE_SHAPE)
			update_vbuffer = true
	}
}

/// action_el_depth(value, add)
/// @arg value
/// @arg add

if (history_undo)
{
	with (history_data)
	{
		for (var t = 0; t < save_var_amount; t++)
		{
			with (save_id_find(save_var_save_id[t]))
			{
				depth = other.save_var_old_value[t]
				part_update_depth()
			}
		}
	}
}
else if (history_redo)
{
	with (history_data)
	{
		for (var t = 0; t < save_var_amount; t++)
		{
			with (save_id_find(save_var_save_id[t]))
			{
				depth = other.save_var_new_value[t]
				part_update_depth()
			}
		}
	}
}
else
{
	var hobj = history_save_var_start(action_el_depth, true);
	
	with (obj_model_element)
		if (element_type = TYPE_PART && selected)
			action_el_depth_tree(id, argument0, argument1, hobj)
}

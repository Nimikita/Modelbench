/// action_el_name(name)
/// @arg name

if (history_undo)
{
	with (history_data) 
	{
		for (var e = 0; e < save_var_amount; e++)
		{
			with (save_id_find(save_var_save_id[e]))
				name = other.save_var_old_value[e]
		}
	}
}
else if (history_redo)
{
	with (history_data)
	{
		for (var e = 0; e < save_var_amount; e++)
		{
			with (save_id_find(save_var_save_id[e]))
				name = other.save_var_new_value[e]
		}
	}
}
else
{
	var hobj = history_save_var_start(action_el_name, true);
	
	with (obj_model_element)
	{
		if (!selected)
			continue
			
		with (hobj)
			history_save_var(other.id, other.name, argument0)
			
		name = argument0
	}
}

app_update_name_warning()
action_update_search()

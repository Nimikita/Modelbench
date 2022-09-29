/// action_el_name(name)
/// @arg name

function action_el_name(newname)
{
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
		
		with (el_edit)
		{
			with (hobj)
				history_save_var(other.id, other.name, newname)
			
			name = newname
		}
		
		for (var i = 0; i < ds_list_size(el_edit_list); i++)
		{
			if (el_edit_list[|i] = el_edit)
				continue
			
			with (el_edit_list[|i])
			{
				with (hobj)
					history_save_var(other.id, other.name, newname)
				
				name = newname
			}
		}
	}
	
	action_update_search()
}

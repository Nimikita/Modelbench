/// action_el_rename(name)
/// @arg name
/// @desc Only used for list renaming, only update search list if undo/redo.

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
	var hobj = history_save_var_start(action_el_rename, true);
	
	var namesuffix;
	
	for (var i = 0; i < ds_list_size(el_edit_list); i++)
	{
		if (i = 0)
			namesuffix = argument0
		else
			namesuffix = argument0 + " (" + string(i + 1) + ")"
		
		with (el_edit_list[|i])
		{
			with (hobj)
				history_save_var(other.id, other.name, namesuffix)
		
			name = namesuffix
		}
	}
}

app_update_name_warning()

if (history_redo || history_undo)
	action_update_search()

/// action_el_rename_single(name)
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
	var hobj = history_save_var_start(action_el_rename_single, true);
	
	with (app.assets.elements.name_edit_element)
	{
		with (hobj)
			history_save_var(app.assets.elements.name_edit_element, other.name, argument0)
		
		name = argument0
	}
}

app_update_name_warning()

if (history_redo || history_undo)
	action_update_search()

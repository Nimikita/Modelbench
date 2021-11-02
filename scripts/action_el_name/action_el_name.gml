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
	var namesuffix;
	
	with (el_edit)
	{
		with (hobj)
			history_save_var(other.id, other.name, argument0)
		
		name = argument0
	}
	
	for (var i = 0; i < ds_list_size(el_edit_list); i++)
	{
		if (el_edit_list[|i] = el_edit)
			continue
		
		if (argument0 != "")
			namesuffix = argument0 + " (" + string(i + 1) + ")"
		else
			namesuffix = argument0
		
		with (el_edit_list[|i])
		{
			with (hobj)
				history_save_var(other.id, other.name, namesuffix)
		
			name = namesuffix
		}
	}
}

app_update_name_warning()
action_update_search()

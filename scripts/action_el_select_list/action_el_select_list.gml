/// action_el_select_list(list)
/// @arg list

if (history_undo)
{
	with (history_data)
		history_restore_el_select()
}
else if (history_redo)
{
	with (history_data)
		history_restore_el_select_new()
}
else
{
		var list, hobj;
		list = argument0
		hobj = history_set(action_el_select_list)
		
		with (hobj)
			history_save_el_select()
		
		for (var e = 0; e < ds_list_size(list); e++)
		{
			with (list[|e])
				el_select()
		}
		
		with (hobj)
			history_save_el_select_new()
}

app_update_el_edit()

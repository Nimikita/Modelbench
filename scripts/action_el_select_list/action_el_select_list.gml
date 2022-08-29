/// action_el_select_list(list, [deselect])
/// @arg list
/// @arg [deselect]

function action_el_select_list()
{
	if (history_undo)
	{
		with (history_data)
			history_restore_el_select()
	}
	else if (history_redo)
	{
		with (history_data)
			history_restore_el_select_new_obj()
	}
	else
	{
		var list, hobj;
		list = argument[0]
		hobj = history_set(action_el_select_list)
		
		with (hobj)
			history_save_el_select()
		
		if (argument_count > 1 && argument[1])
			el_deselect_all()
		
		for (var e = 0; e < ds_list_size(list); e++)
		{
			with (list[|e])
				el_select()
		}
		
		with (hobj)
			history_save_el_select_new_obj()
	}
	
	app_update_el_edit()
}

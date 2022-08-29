/// action_el_deselect_all()

function action_el_deselect_all()
{
	if (history_undo)
	{
		with (history_data)
			history_restore_el_select()
	}
	else
	{
		if (!history_redo)
			with (history_set(action_el_deselect_all))
				history_save_el_select()
		
		el_deselect_all()
	}
	
	app_update_el_edit()
}

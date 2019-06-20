/// action_tl_select_single(tl)
/// @arg timeline
/// @desc Deselects all but the given timeline. A type can also be supplied.

if (history_undo)
{
	with (history_data)
		history_restore_el_select()
	
	app_update_el_edit()
}
else
{
	var element = null;
	
	if (history_redo)
		element = history_data.element_save_id
	else
	{
		element = argument[0]
		
		if (!element)
			return 0
				
		if (el_edit_amount = 1 && el_edit = element)
			return 1
			
		with (history_set(action_el_select_single))
		{
			element_save_id = element
			history_save_el_select()
		}
	}
	
	with (element)
		el_select_single()
	
	app_update_el_edit_select() // Don't show tabs if they're hidden
	return 1
}

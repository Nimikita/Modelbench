/// action_el_remove()
/// @desc Removes all selected elements

if (history_undo)
{
	with (history_data)
	{
		for (var t = 0; t < el_save_amount; t++)
			history_restore_el(el_save_obj[t])
		history_restore_el_select()
	}
}
else
{
	if (el_edit = null)
		return 0
	
	if (!history_redo)
	{
		with (history_set(action_el_remove))
		{
			el_save_amount = 0
			history_save_el_tree(app)
			history_save_el_select()
		}
	}
	
	with (obj_model_element)
		if (selected)
			instance_destroy()
	
	el_deselect_all()
}

el_update_lock_tree(false)
el_update_hidden_tree(false)
app_update_el_edit()
app_update_name_warning()

el_update_part()
action_update_search()

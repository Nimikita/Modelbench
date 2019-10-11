/// action_el_remove_single()
/// @desc Removes selected element by context menu

if (history_undo)
{
	with (history_data)
	{
		for (var s = 0; s < el_save_amount; s++)
			history_restore_el(el_save_obj[s])
		history_restore_el_select()
	}
}
else
{
	
	if (!history_redo)
	{
		with (history_set(action_el_remove_single))
		{
			el_save_amount = 0
			history_save_el_tree_single(app)
			history_save_el_select()
		}
		
		with (context_menu_value)
			instance_destroy()
	}
	else
	{
		for (var s = 0; s < history_data.el_save_amount; s++)
		{
			with (save_id_find(history_data.el_save_obj[s].save_id))
				instance_destroy()
		}
	}
	
	el_deselect_all()
}

el_update_lock_tree(false)
el_update_hidden_tree(false)
app_update_el_edit()
app_update_name_warning()

el_update_part()

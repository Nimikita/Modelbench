/// action_texture_select()

if (history_undo)
{
	with (history_data) 
		res_edit = save_id_find(save_var_old_value)
}
else if (history_redo)
{
	with (history_data) 
		res_edit = save_id_find(save_var_new_value)
}
else
{
	var hobj = history_save_var_start(action_texture_select, true);
	
	with (hobj)
	{
		save_var_old_value = save_id_get(res_edit)
		save_var_new_value = test(res_edit = listitem_value, null, save_id_get(listitem_value))
	}
	
	res_edit = test(res_edit = listitem_value, null, listitem_value)
}


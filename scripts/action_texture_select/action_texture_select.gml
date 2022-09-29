/// action_texture_select()

function action_texture_select()
{
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
			save_var_new_value = (res_edit = list_item_script_value ? null : save_id_get(list_item_script_value))
		}
		
		res_edit = (res_edit = list_item_script_value ? null : list_item_script_value)
	}
	
	textures_list.update = true
}

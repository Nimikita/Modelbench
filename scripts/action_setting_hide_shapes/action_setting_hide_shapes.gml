/// action_setting_hide_shapes(hide)
/// @arg hide

function action_setting_hide_shapes(hide)
{
	if (history_undo)
	{
		with (history_data) 
			other.setting_hide_shapes = save_var_old_value[0]
	}
	else if (history_redo)
	{
		with (history_data) 
			other.setting_hide_shapes = save_var_new_value[0]
	}
	else
	{
		var hobj = history_save_var_start(action_setting_hide_shapes, true);
		
		with (hobj)
			history_save_var(other.id, other.setting_hide_shapes, hide)
		
		setting_hide_shapes = hide
	}
	
	action_update_search()
}

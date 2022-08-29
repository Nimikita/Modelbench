/// action_toolbar_program_mode(mode)
/// @arg mode

function action_toolbar_program_mode(mode)
{
	if (history_undo)
	{
		with (history_data) 
			app.program_mode = save_var_old_value[0]
	}
	else if (history_redo)
	{
		with (history_data) 
			app.program_mode = save_var_new_value[0]
	}
	else
	{
		var hobj = history_save_var_start(action_toolbar_program_mode, true);
		
		with (hobj)
			history_save_var(app, app.program_mode, mode)
		
		app.program_mode = mode
	}
	
	app_update_program_mode()
}

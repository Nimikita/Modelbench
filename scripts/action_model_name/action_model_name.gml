/// action_model_name(name)
/// @arg name

if (history_undo)
{
	with (history_data) 
		other.model_name = save_var_old_value[0]
}
else if (history_redo)
{
	with (history_data) 
		other.model_name = save_var_new_value[0]
}
else
{
	var hobj = history_save_var_start(action_model_name, true);
	
	with (hobj)
		history_save_var(other.id, other.model_name, argument0)
	
	model_name = argument0
}

assets.model_properties.tbx_model_name.text = model_name
app_update_name_warning()

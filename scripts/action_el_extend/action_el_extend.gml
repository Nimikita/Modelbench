/// action_el_extend(element)
/// @arg element

if (history_undo)
{
	with (history_data)
	{
		var element = save_id_find(save_var_save_id[0]);
		element.extend = save_var_old_value[0]
	}
}
else if (history_redo)
{
	with (history_data) 
	{
		var element = save_id_find(save_var_save_id[0]);
		element.extend = save_var_new_value[0]
	}
}
else
{
	var element, hobj;
	element = argument[0]
	hobj = history_save_var_start(action_el_extend, true);
	
	with (hobj)
		history_save_var(element, element.extend, !element.extend)
	
	element.extend = !element.extend
}

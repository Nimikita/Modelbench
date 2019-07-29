/// tl_value_set_start(script, combine)
/// @arg script
/// @arg combine

var script, combine;
script = argument0
combine = argument1

// Used only in here
with (obj_model_element)
	edit = selected

// Register history
history_pop()
if (combine && history_amount > 0 &&
	history[0].par_script = script &&
	history[0].save_axis_edit = axis_edit)
	history_data = history[0]
else
{
	history_push()
	
	history_data = new_history(el_value_set)
	history_data.par_script = script
	
	history_data.par_set_amount = 0
	history_data.el_set_amount = 0
	
	with (obj_model_element)
	{
		if (edit)
		{
			history_data.element_save_id[history_data.el_set_amount] = save_id_get(id)
			history_data.el_set_amount++
		}
	}
	
	history[0] = history_data

	log("Action", script_get_name(script))
}

history_data.par_set_n = 0

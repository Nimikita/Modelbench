/// history_set_var(script, oldvalue, newvalue, combine)
/// @arg script
/// @arg oldvalue
/// @arg newvalue
/// @arg combine
/// @desc Registering history for changing a single variable.

function history_set_var(script, oldval, newval, combine)
{
	var hobj;
	
	history_pop()
	
	if (combine && history_amount > 0 &&
		history[0].script = script &&
		history[0].save_axis_edit = axis_edit) // Add to existing
		hobj = history[0]
	else
	{
		history_push()
		
		log("Action Set variable", script_get_name(script), oldval, newval, combine)
		
		hobj = new_history(script)
		history[0] = hobj
	}
	
	return hobj
}

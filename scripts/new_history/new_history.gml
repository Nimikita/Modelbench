/// new_history(script)
/// @arg script

with (new(obj_history))
{
	script = argument0
	par_script = null
	save_el_edit = el_edit
	save_res_edit = res_edit
	save_axis_edit = axis_edit
	
	return id
}


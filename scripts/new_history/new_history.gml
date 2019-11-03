/// new_history(script)
/// @arg script

with (new(obj_history))
{
	script = argument0
	par_script = null
	save_el_edit = save_id_get(el_edit)
	save_res_edit = save_id_get(res_edit)
	save_axis_edit = axis_edit
	save_save_id_seed = save_id_seed
	
	return id
}


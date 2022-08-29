/// action_el_uv(uv, size, add)
/// @arg uv
/// @arg size
/// @arg add

function action_el_uv_size(uv, size, add)
{
	el_value_set_start(action_el_uv_size, true)
	el_value_set(e_value.UV_X, uv[@ X], add)
	el_value_set(e_value.UV_Y, uv[@ Y], add)
	el_value_set(e_value.WIDTH, size[@ X], add)
	el_value_set(e_value.LENGTH, size[@ Y], add)
	el_value_set(e_value.HEIGHT, size[@ Z], add)
	
	if (setting_adjust_pivot_resize)
	{
		el_value_set(e_value.OFFSET_X, -(size[@ X]/2), add)
		el_value_set(e_value.OFFSET_Y, -(size[@ Y]/2), add)
		el_value_set(e_value.OFFSET_Z, 0, false)
	}
	
	el_value_set_done()
}

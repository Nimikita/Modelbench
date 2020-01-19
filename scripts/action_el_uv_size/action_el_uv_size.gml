/// action_el_uv(uv, size, add)
/// @arg uv
/// @arg size
/// @arg add

el_value_set_start(action_el_uv_size, true)
el_value_set(e_value.UV_X, argument0[@ X], argument2)
el_value_set(e_value.UV_Y, argument0[@ Y], argument2)
el_value_set(e_value.WIDTH, argument1[@ X], argument2)
el_value_set(e_value.LENGTH, argument1[@ Y], argument2)
el_value_set(e_value.HEIGHT, argument1[@ Z], argument2)

if (setting_adjust_pivot_resize)
{
	el_value_set(e_value.OFFSET_X, -(argument1[@ X]/2), argument2)
	el_value_set(e_value.OFFSET_Y, -(argument1[@ Y]/2), argument2)
	el_value_set(e_value.OFFSET_Z, 0, false)
}

el_value_set_done()

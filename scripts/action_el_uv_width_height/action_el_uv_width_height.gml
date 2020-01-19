/// action_el_uv_width_height(width, height, add)
/// @arg width
/// @arg height
/// @arg add

el_value_set_start(action_el_uv_width_height, true)
el_value_set(e_value.WIDTH, argument0, argument2)
el_value_set(e_value.HEIGHT, argument1, argument2)

if (setting_adjust_pivot_resize)
{
	el_value_set(e_value.OFFSET_X, -(argument0/2), argument2)
	el_value_set(e_value.OFFSET_Z, -(argument1/2), argument2)
}

el_value_set_done()

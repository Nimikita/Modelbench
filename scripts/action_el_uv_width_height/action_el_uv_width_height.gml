/// action_el_uv_width_height(width, height, add)
/// @arg width
/// @arg height
/// @arg add
function action_el_uv_width_height(width, height, add) {

	el_value_set_start(action_el_uv_width_height, true)
	el_value_set(e_value.WIDTH, width, add)
	el_value_set(e_value.HEIGHT, height, add)

	if (setting_adjust_pivot_resize)
	{
		el_value_set(e_value.OFFSET_X, -(width/2), add)
		el_value_set(e_value.OFFSET_Z, -(height/2), add)
	}

	el_value_set_done()



}

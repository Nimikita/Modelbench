/// action_el_pos_xyz(point)
/// @arg point

function action_el_pos_xyz(point)
{
	el_value_set_start(action_el_pos_xyz, true)
	el_value_set(e_value.POS_X, point[@ X], false)
	el_value_set(e_value.POS_Y, point[@ Y], false)
	el_value_set(e_value.POS_Z, point[@ Z], false)
	el_value_set_done()
}

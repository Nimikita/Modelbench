/// action_el_offset_xyz(offset)
/// @arg offset

function action_el_offset_xyz(offset)
{
	el_value_set_start(action_el_offset_xyz, true)
	el_value_set(e_value.OFFSET_X, offset[@ X], false)
	el_value_set(e_value.OFFSET_Y, offset[@ Y], false)
	el_value_set(e_value.OFFSET_Z, offset[@ Z], false)
	el_value_set_done()
}

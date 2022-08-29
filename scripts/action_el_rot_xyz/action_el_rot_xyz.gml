/// action_el_rot_xyz(rotation)
/// @arg rotation

function action_el_rot_xyz(rot)
{
	el_value_set_start(action_el_rot_xyz, true)
	el_value_set(e_value.ROT_X, rot[@ X], false)
	el_value_set(e_value.ROT_Y, rot[@ Y], false)
	el_value_set(e_value.ROT_Z, rot[@ Z], false)
	el_value_set_done()
}

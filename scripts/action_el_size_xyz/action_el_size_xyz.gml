/// action_el_size_xyz(size)
/// @arg size

function action_el_size_xyz(size)
{
	el_value_set_start(action_el_size_xyz, true)
	el_value_set(e_value.WIDTH, size[@ X], false)
	el_value_set(e_value.LENGTH, size[@ Y], false)
	el_value_set(e_value.HEIGHT, size[@ Z], false)
	el_value_set_done()
}

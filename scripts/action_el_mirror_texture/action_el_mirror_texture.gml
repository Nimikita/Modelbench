/// action_el_mirror_texture(mirror)
/// @arg mirror

function action_el_mirror_texture(mirror)
{
	el_value_set_start(action_el_mirror_texture, false)
	el_value_set(e_value.TEX_MIRROR, mirror, false)
	el_value_set_done()
}

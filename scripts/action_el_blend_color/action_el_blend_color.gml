/// action_el_blend_color(color)
/// @arg color

function action_el_blend_color(color)
{
	el_value_set_start(action_el_blend_color, true)
	el_value_set(e_value.BLEND_COLOR, color, false)
	el_value_set_done()
}

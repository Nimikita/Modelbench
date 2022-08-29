/// action_el_inherit_color(inherit)
/// @arg inherit

function action_el_inherit_color(inherit)
{
	el_value_set_start(action_el_inherit_color, false)
	el_value_set(e_value.INHERIT_COLOR, inherit, false)
	el_value_set_done()
}

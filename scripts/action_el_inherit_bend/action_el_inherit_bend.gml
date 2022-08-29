/// action_el_inherit_bend(inherit)
/// @arg inherit

function action_el_inherit_bend(inherit)
{
	el_value_set_start(action_el_inherit_bend, false)
	el_value_set(e_value.INHERIT_BEND, inherit, false)
	el_value_set_done()
}

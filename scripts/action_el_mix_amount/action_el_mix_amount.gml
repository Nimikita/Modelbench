/// action_el_mix_amount(value, add)
/// @arg value
/// @arg add

function action_el_mix_amount(value, add)
{
	el_value_set_start(action_el_mix_amount, true)
	el_value_set(e_value.MIX_AMOUNT, value / 100, add)
	el_value_set_done()
}

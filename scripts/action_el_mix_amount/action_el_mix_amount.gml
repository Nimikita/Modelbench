/// action_el_mix_amount(value, add)
/// @arg value
/// @arg add

el_value_set_start(action_el_mix_amount, true)
el_value_set(e_value.MIX_AMOUNT, argument0 / 100, argument1)
el_value_set_done()

/// action_el_uv_xy(x, y, add)
/// @arg x
/// @arg y
/// @arg add

el_value_set_start(action_el_uv_xy, true)
el_value_set(e_value.UV_X, argument0, argument2)
el_value_set(e_value.UV_Y, argument1, argument2)
el_value_set_done()

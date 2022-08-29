/// action_el_uv_xy(x, y, add)
/// @arg x
/// @arg y
/// @arg add

function action_el_uv_xy(uvx, uvy, add)
{
	el_value_set_start(action_el_uv_xy, true)
	el_value_set(e_value.UV_X, uvx, add)
	el_value_set(e_value.UV_Y, uvy, add)
	el_value_set_done()
}

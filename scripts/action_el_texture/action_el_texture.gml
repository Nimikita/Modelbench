/// action_el_texture(texture)
/// @arg texture

function action_el_texture(texture)
{
	el_value_set_start(action_el_texture, false)
	el_value_set(e_value.TEXTURE_OBJ, texture, false)
	el_value_set_done()
}

/// render_set_uniform_vec2(name, x, y)
/// @arg name
/// @arg x
/// @arg y
/// @desc Sets a 2-float uniform (if it exists) of the currently selected shader.

function render_set_uniform_vec2(name, xx, yy)
{
	var uniform;
	uniform = render_shader_obj.uniform_map[?name]
	
	if (!is_undefined(uniform) && uniform > -1)
		shader_set_uniform_f(uniform, xx, yy)
}

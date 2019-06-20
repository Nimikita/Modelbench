/// render_world(mode)
/// @arg mode

// Choose shader
render_mode = argument0
render_shader_obj = shader_map[?render_mode_shader_map[?render_mode]]
with (render_shader_obj)
	shader_use()

// Enable mip-mapping
shader_texture_filter_mipmap = true

// Render negative depth
var i;
for (i = 0; i < ds_list_size(render_list); i++)
{
	var part = render_list[|i];
	if (part.depth >= 0)
		break
	with (part)
		render_world_part()
}

// Neutral depth (0)
if (render_mode != e_render_mode.HIGH_LIGHT_SUN_DEPTH &&
	render_mode != e_render_mode.SHAPE)
	render_world_ground()

// Positive depth
for (; i < ds_list_size(render_list); i++)
{
	with (render_list[|i])
		render_world_part()
}

with (render_shader_obj)
	shader_clear()

if (gpu_get_tex_filter())
	gpu_set_tex_filter(false)
/// render_world_start_light(from, to, near, far, fov, color)
/// @arg from
/// @arg to
/// @arg near
/// @arg far
/// @arg fov
/// @arg color
/// @desc Render the scene from the light's point of view.

function render_world_start_light()
{
	render_light_from = argument[0]
	render_light_to = argument[1]
	render_light_near = argument[2]
	render_light_far = argument[3]
	render_light_fov = argument[4]
	render_light_color = argument[5]
	
	gpu_set_ztestenable(true)
	gpu_set_zwriteenable(true)
	render_set_projection(render_light_from, render_light_to, vec3(0, 0, 1), render_light_fov, 1, 1, render_light_far)
	
	render_proj_from = render_light_from
	proj_matrix = matrix_get(matrix_projection)
	view_proj_matrix = matrix_multiply(matrix_get(matrix_view), matrix_get(matrix_projection))
	
	proj_depth_near = render_light_near
	proj_depth_far = render_light_far
	
	render_light_matrix = view_proj_matrix
}

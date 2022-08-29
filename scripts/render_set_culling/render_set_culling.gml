/// render_set_culling(enable)
/// @arg enable

function render_set_culling(cull)
{
	gpu_set_cullmode(cull ? cull_counterclockwise : cull_noculling)
}

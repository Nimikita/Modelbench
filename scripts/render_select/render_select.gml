/// render_select(selectsurface)
/// @arg selectsurface

function render_select(surf)
{
	// Draw selection on separate surface
	var hlsurf = surface_require(surf, render_width, render_height);
	
	surface_set_target(hlsurf)
	{
		draw_clear_alpha(c_black, 0)
		
		render_world_start()
		render_world(e_render_mode.SELECT)
		render_world_done()
	}
	surface_reset_target()
	
	// Draw border
	if (surface_exists(render_target))
	{
		surface_set_target(render_target)
		{
			gpu_set_texrepeat(false)
			render_shader_obj = shader_map[?shader_border]
			with (render_shader_obj)
				shader_set(shader)
			
			shader_border_set(c_white, 2)
			
			draw_surface_exists(hlsurf, 0, 0)
			with (render_shader_obj)
				shader_clear()
			
			gpu_set_texrepeat(true)
		}
		surface_reset_target()
	}
	
	return hlsurf
}

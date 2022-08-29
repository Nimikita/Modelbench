/// render_low()
/// @desc Renders the scene in low quality.

function render_low()
{
	render_target = surface_require(render_target, render_width, render_height)
	var surf = render_target;
	
	surface_set_target(surf)
	{
		draw_clear_alpha(c_black, 0)
		
		// Background/Sky
		render_world_start()
		render_world_background()
		render_world_done()
		
		// World
		render_world_start()
		render_world(e_render_mode.COLOR)
		render_world_done()
		
		// Alpha fix
		render_set_projection_ortho(0, 0, render_width, render_height, 0)
		gpu_set_blendmode_ext(bm_src_color, bm_one)
		draw_box(0, 0, render_width, render_height, false, c_black, 1)
		gpu_set_blendmode(bm_normal)
	}
	surface_reset_target()
}

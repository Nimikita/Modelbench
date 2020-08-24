/// render_world_part()
/// @desc Renders a model part

if (hidden || tree_hidden || shape_list = null)
	return 0

var rendermatrix;

for (var s = 0; s < ds_list_size(shape_list); s++)
{
	var shape = shape_list[|s];
	
	with (shape)
	{
		if (hidden || tree_hidden || shape_vbuffer = null)
			continue
		
		// Click mode
		if (render_mode = e_render_mode.CLICK)
		{
			if (selected || locked || tree_locked) // Already selected when clicking?
				continue
		}

		// Outlined?
		else if (render_mode = e_render_mode.SELECT && !parent_is_selected && !selected && !parent.parent_is_selected)
			continue
		
		rendermatrix = matrix_multiply(matrix, other.matrix_parent)
		
		// Shape bounce
		if (item_bounce)
		{
			var d, t, offz;
			d = 60 * 3
			t = current_step mod d * 2
			if (t < d)
				offz = ease("easeinoutquad", t / d) * 2 - 1
			else
				offz = 1 - ease("easeinoutquad", (t - d) / d) * 2
			rendermatrix = matrix_multiply(rendermatrix, matrix_build(0, 0, offz, 0, 0, 0, 1, 1, 1))
		}
		
		// Face camera
		if (face_camera)
		{
			var rotx, rotz, rotmat;
			
			matrix_remove_rotation(rendermatrix)
			rotx = -point_zdirection(rendermatrix[MAT_X], rendermatrix[MAT_Y], rendermatrix[MAT_Z], proj_from[X], proj_from[Y], proj_from[Z])
			rotz = 90 + point_direction(rendermatrix[MAT_X], rendermatrix[MAT_Y], proj_from[X], proj_from[Y])
			rotmat = matrix_build(0, 0, 0, rotx, 0, rotz, 1, 1, 1)
			rendermatrix = matrix_multiply(rotmat, rendermatrix)
		}
		
		// Set texture
		var tex;
		if (res != null && (app.setting_render_mode = e_viewport_render.TEXTURED || app.program_mode = e_mode.PREVIEW))
			tex = res.sprite
		else
			tex = spr_empty
		
		if (texture_prev != tex)
		{
			render_set_texture(tex)
			texture_prev = tex
		}
		
		if (color_blend_prev != color_blend || color_alpha_prev != color_alpha)
		{
			render_set_uniform_color("uBlendColor", color_blend, color_alpha)
			color_blend_prev = color_blend
			color_alpha_prev = color_alpha
		}
		
		if (color_mix_prev != color_mix || color_mix_percent_prev != color_mix_percent)
		{
			render_set_uniform_color("uMixColor", color_mix, color_mix_percent)
			color_mix_prev = color_mix
			color_mix_percent_prev = color_mix_percent
		}
		
		if (color_brightness_prev != color_brightness)
		{
			render_set_uniform("uBrightness", color_brightness)
			color_brightness_prev = color_brightness
		}
		
		var highlight = app.setting_overlays * app.setting_overlays_highlights * parent_hover * .5;
		if (highlight_prev != highlight)
		{
			render_set_uniform_color("uHighlightColor", c_accent, highlight)
			highlight_prev = highlight
		}
		
		if ((render_mode = e_render_mode.CLICK) && app.setting_hide_shapes)
			render_set_uniform_color("uShape", id.parent, 1)
		else
			render_set_uniform_color("uShape", id, 1)
		
		vbuffer_render_matrix(shape_vbuffer, rendermatrix)
	}
}
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
		if (res != null)
			render_set_texture(res.sprite)
		else
			render_set_texture(spr_empty)
		
		render_set_uniform_color("uBlendColor", color_blend, color_alpha)
		render_set_uniform_color("uMixColor", color_mix, color_mix_percent)
		render_set_uniform("uBrightness", color_brightness)
		
		if ((render_mode = e_render_mode.CLICK) && app.setting_hide_shapes)
			render_set_uniform_color("uShape", id.parent, 1)
		else
			render_set_uniform_color("uShape", id, 1)
		
		vbuffer_render_matrix(shape_vbuffer, rendermatrix)
	}
}
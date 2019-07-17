/// view_update_surface(view, camera)
/// @arg view
/// @arg camera

var view, cam;
view = argument0
cam = argument1

render_start(view.surface, cam, content_width, content_height)

//render_low()
render_high()

if (setting_outline_opacity > 0)
{
	// Shape outline
	var shapesurf, normalssurf;
	render_surface[0] = surface_require(render_surface[0], render_width, render_height)
	shapesurf = render_surface[0]
	surface_set_target(shapesurf)
	{
		draw_clear_alpha(c_black, 0)
		render_world_start()
		render_world(e_render_mode.SHAPE)
		render_world_done()
	}
	surface_reset_target()

	render_surface[1] = surface_require(render_surface[1], render_width, render_height)
	normalssurf = render_surface[1]

	surface_set_target(normalssurf)
	{
		draw_clear_alpha(c_white, 0)
		render_world_start()
		render_world(e_render_mode.NORMALS)
		render_world_done()
	}
	surface_reset_target()

	surface_set_target(render_target)
	{
		gpu_set_blendmode_ext(bm_zero, bm_src_color)
	
		gpu_set_texrepeat(false)
		render_shader_obj = shader_map[?shader_shape_outline]
		with (render_shader_obj)
		{
			shader_set(shader_shape_outline)
			shader_shape_outline_set(shapesurf, normalssurf)
		}
		draw_blank(0, 0, render_width, render_height) // Blank quad
		with (render_shader_obj)
			shader_clear()
		
		gpu_set_texrepeat(true)
	
		gpu_set_blendmode(bm_normal)
	}
	surface_reset_target()
}

// Controls

if (el_edit_amount > 0)
{
	// Selection
	view.surface_select = render_select(view.surface_select);

	if (surface_exists(render_target))
	{
		surface_set_target(render_target)
		{
			if (el_edit != null)
			{
				if (!el_edit.hidden && !el_edit.tree_hidden)
				{
					// Position
					if (tool_selected = e_tool.MOVE)
						view_control_move(view)
					
					// Bend
					//if (el_edit.element_type = TYPE_PART && el_edit.value[e_value.BEND])
					//	view_control_bend(view)
					
					// Tool icon
					var mat;
					if (el_edit.element_type = TYPE_PART)
						mat = array_copy_1d(el_edit.matrix_edit)
					else
						mat = array_copy_1d(el_edit.matrix_parent)
	
					matrix_remove_scale(mat)
					
					var origin = point3D_project(matrix_position(mat), view_proj_matrix, render_width, render_height);
					if (!point3D_project_error)
					{
						if (tool_selected = e_tool.MOVE)
						{
							draw_circle_ext(origin[X], origin[Y], 14, false, c_white, 1)
							draw_image(spr_icons, e_icon.toolset_position, origin[X] + 1, origin[Y] + 1, 1, 1, c_neutral50, a_neutral50)
						}
						else
							draw_circle_ext(origin[X], origin[Y], 8, false, c_origin, 1)
					}
						
					view.control_mouseon_last = view.control_mouseon
					view.control_mouseon = null
				}
			}
		}
		surface_reset_target()
	}
}

view.surface = render_done()
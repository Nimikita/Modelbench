/// view_update_surface(view, camera)
/// @arg view
/// @arg camera

var view, cam;
view = argument0
cam = argument1

render_start(view.surface, cam, content_width, content_height)

render_high()
view_shape_outline()

// Controls
if (el_edit_amount > 0 && program_mode = e_mode.MODELING)
{
	// Selection
	view.surface_select = render_select(view.surface_select);
	
	if (surface_exists(render_overlay) && ((surface_get_width(render_overlay) != content_width*2) || (surface_get_height(render_overlay) != content_height*2)))
		surface_free(render_overlay)
	
	if (!surface_exists(render_overlay))
	{
		surface_depth_disable(true)
		render_overlay = surface_create(content_width * 2, content_height * 2)
		surface_depth_disable(false)
	}
	
	// Draw overlay
	if (surface_exists(render_overlay))
	{
		surface_set_target(render_overlay)
		{
			draw_clear_alpha(c_black, 0)
			
			draw_surface_ext(render_target, 0, 0, 2, 2, 0, c_white, 1)
			
			if (el_edit != null && el_edit.parent != null)
			{
				if (!el_edit.hidden && !el_edit.tree_hidden)
				{
					view_control_ratio = max(1, (500 / content_height) * 1.25)
					
					// Bend
					if (tool_selected = e_tool.BEND && el_edit.element_type = TYPE_PART && el_edit.value[e_value.BEND])
						view_control_bend(view)
					
					// Rotate
					if (tool_selected = e_tool.ROTATE || tool_selected = e_tool.TRANSFORM)
						view_control_rotate(view)
					
					// Scale
					if (tool_selected = e_tool.SCALE || tool_selected = e_tool.TRANSFORM)
						view_control_scale(view)
					
					// Position
					if (tool_selected = e_tool.MOVE || tool_selected = e_tool.TRANSFORM)
						view_control_move(view)
						
					// Pivot
					if (tool_selected = e_tool.PIVOT && el_edit.element_type = TYPE_SHAPE)
						view_control_pivot(view)
					
					var origin3d, origin2d;
					
					// Parent position
					if (el_edit.parent.object_index = obj_model_element)
					{
						origin3d = matrix_position(el_edit.parent.matrix)
						origin2d = point3D_project(origin3d, view_proj_matrix, render_width, render_height);
						
						origin2d[X] = round(origin2d[X])
						origin2d[Y] = round(origin2d[Y])
						
						origin2d = vec2_mul(origin2d, 2)
						
						if (!point3D_project_error)
						{
							draw_circle_ext(origin2d[X], origin2d[Y], 28, false, hex_to_color("FF00FF"), 1)
							draw_image(spr_icons, icons.PART, origin2d[X], origin2d[Y], 2, 2, c_white, 1)
						}
					}
					
					// Tool icon
					if (window_busy != "rendercontrolscalexyz")
					{
						var mat;
						
						if (tool_selected = e_tool.BEND && el_edit.element_type = TYPE_PART && el_edit.value[e_value.BEND])
						{
							origin3d = matrix_position(matrix_multiply(matrix_create(model_part_get_offset_pos(el_edit), vec3(0), vec3(1)), el_edit.matrix_parent))
						}
						else
						if (tool_selected != e_tool.PIVOT || (tool_selected = e_tool.PIVOT && el_edit.element_type = TYPE_PART))
						{
							if (el_edit.element_type = TYPE_PART)
								mat = array_copy_1d(el_edit.matrix_edit)
							else
								mat = array_copy_1d(el_edit.matrix_parent)
	
							matrix_remove_scale(mat)
							origin3d = matrix_position(mat)
						}
						else
						{
							mat = matrix_create(el_edit.from, vec3(0), vec3(1))
							mat = matrix_multiply(mat, matrix_create(vec3(0), el_edit.rotation, vec3(1)))
							mat = matrix_multiply(mat, matrix_multiply(el_edit.matrix, el_edit.parent.matrix_parent))
							origin3d = matrix_position(mat)
						}
						
						origin2d = point3D_project(origin3d, view_proj_matrix, render_width, render_height)
					}
					else
						origin2d = view_control_scale_coords
					
					origin2d[X] = round(origin2d[X])
					origin2d[Y] = round(origin2d[Y])
					
					origin2d = vec2_mul(origin2d, 2)
					
					if (!point3D_project_error)
					{
						if (tool_selected > e_tool.SELECT)
							draw_circle_ext(origin2d[X], origin2d[Y], 28, false, c_background, 1)
						
						var icon = null;
						if (tool_selected = e_tool.PIVOT)
							icon = icons.CENTER
						else if (tool_selected = e_tool.MOVE)
							icon = icons.TOOLSET_POSITION
						else if (tool_selected = e_tool.ROTATE)
							icon = icons.TOOLSET_ROTATE
						else if (tool_selected = e_tool.SCALE)
							icon = icons.TOOLSET_SCALE
						else if (tool_selected = e_tool.TRANSFORM)
							icon = icons.TRANSFORM
						else if (tool_selected = e_tool.BEND)
							icon = icons.BEND
						
						if (icon != null)
							draw_image(spr_icons, icon, origin2d[X], origin2d[Y], 2, 2, c_text_secondary, a_text_secondary)
						else
							draw_circle_ext(origin2d[X], origin2d[Y], 16, false, hex_to_color("00FFFF"), 1)
					}
					
					// XYZ scale control tooltip
					if (window_busy = "rendercontrolscalexyz")
					{
						var scalearr;
						if (setting_z_is_up)
							scalearr = vec3(el_edit.value[e_value.SCA_X], el_edit.value[e_value.SCA_Y], el_edit.value[e_value.SCA_Z])
						else
							scalearr = vec3(el_edit.value[e_value.SCA_X], el_edit.value[e_value.SCA_Z], el_edit.value[e_value.SCA_Y])
						
						tip_set(text_get("tooltipscalexyz", scalearr[X], scalearr[Y], scalearr[Z]), mouse_click_x, mouse_click_y, 0, 0, false)
					}
					
					// Single value control tooltip
					if (window_busy = "rendercontrol")
					{
						var tooltipstr;
						tooltipstr = "tooltip"
						
						if (view_control_edit >= e_value.OFFSET_X && view_control_edit <= e_value.OFFSET_Z)
							tooltipstr += "pivot"
						else if (view_control_edit >= e_value.POS_X && view_control_edit <= e_value.POS_Z)
							tooltipstr += "position"
						else if (view_control_edit >= e_value.ROT_X && view_control_edit <= e_value.ROT_Z)
							tooltipstr += "rotation"
						else if (view_control_edit >= e_value.SCA_X && view_control_edit <= e_value.SCA_Z)
							tooltipstr += "scale"
						else if ((view_control_edit >= e_value.BEND_ANGLE_X && view_control_edit <= e_value.BEND_ANGLE_Z) || view_control_edit = e_value.BEND_OFFSET)
							tooltipstr += "bend"
						
						// Value-specific controls
						if (view_control_edit = e_value.BEND_OFFSET)
						{
							tooltipstr += "offset"
						}
						else // Axes controls
						{
							if ((view_control_edit mod 3) = 0)
								tooltipstr += "x"
							else if ((view_control_edit mod 3) = 1)
								tooltipstr += (setting_z_is_up ? "y" : "z")
							else if ((view_control_edit mod 3) = 2)
								tooltipstr += (setting_z_is_up ? "z" : "y")
						}
						
						tip_force_right = true
						tip_set(text_get(tooltipstr, el_edit.value[view_control_edit]), mouse_click_x, mouse_click_y, 0, 0, false)
						tip_force_right = false
					}
					
					if (view.control_mouseon != null)
						mouse_cursor = cr_drag
					
					view.control_mouseon_last = view.control_mouseon
					view.control_mouseon = null
					
					if (window_busy = "rendercontrol")
						app_mouse_wrap(content_x, content_y, content_width, content_height)
				}
			}
			
			// Alpha fix
			gpu_set_blendmode_ext(bm_src_color, bm_one)
			draw_box(0, 0, render_width * 2, render_height * 2, false, c_black, 1)
			gpu_set_blendmode(bm_normal)
		}
		surface_reset_target()
	}
	
	if (surface_exists(render_target))
	{
		surface_set_target(render_target)
		{
			draw_clear_alpha(c_black, 0)
			
			// Draw overlay back on target
			gpu_set_tex_filter(true)
			draw_surface_ext(render_overlay, 0, 0, .5, .5, 0, c_white, 1)
			gpu_set_tex_filter(false)
		}
		surface_reset_target()
	}
}

view.surface = render_done()

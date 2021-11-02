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
	if (setting_overlays && setting_overlays_outlines)
		view.surface_select = render_select(view.surface_select);
	
	if (surface_exists(render_overlay) && ((surface_get_width(render_overlay) != content_width * 2) || (surface_get_height(render_overlay) != content_height * 2)))
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
			
			if (el_edit != null && el_edit.parent != null && (setting_overlays && setting_overlays_gizmos))
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
					
					// Resize
					if (tool_selected = e_tool.RESIZE && el_edit.element_type = TYPE_SHAPE)
						view_control_resize(view)
					
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
							draw_image(spr_circle_28, 0, origin2d[X], origin2d[Y], 2, 2, hex_to_color("FF00FF"), 1)
							draw_image(spr_icons, icons.PART, origin2d[X], origin2d[Y], 2, 2, c_white, 1)
						}
					}
					
					// Tool icon
					if (view_control_edit != e_control.SCA_XYZ)
					{
						var mat;
						
						// Bend tool
						if (tool_selected = e_tool.BEND && el_edit.element_type = TYPE_PART && el_edit.value[e_value.BEND])
						{
							origin3d = matrix_position(matrix_multiply(matrix_create(model_part_get_offset_pos(el_edit), vec3(0), vec3(1)), el_edit.matrix_parent))
						}
						else if (tool_selected = e_tool.PIVOT && el_edit.element_type = TYPE_SHAPE) // Pivot tool
						{
							mat = matrix_create(el_edit.from, vec3(0), vec3(1))
							mat = matrix_multiply(mat, matrix_create(vec3(0), el_edit.rotation, vec3(1)))
							mat = matrix_multiply(mat, matrix_multiply(el_edit.matrix, el_edit.parent.matrix_parent))
							origin3d = matrix_position(mat)
						}
						else if (tool_selected = e_tool.RESIZE && el_edit.element_type = TYPE_SHAPE) // Resize tool
						{
							if (view_control_matrix = null)
							{
								mat = matrix_create(vec3_add(el_edit.from, vec3_mul(point3D_sub(el_edit.to, el_edit.from), .5)), vec3(0), vec3(1))
								mat = matrix_multiply(mat, matrix_create(vec3(0), el_edit.rotation, vec3(1)))
								mat = matrix_multiply(mat, matrix_multiply(el_edit.matrix, el_edit.parent.matrix_parent))
							}
							else
								mat = view_control_matrix
							
							origin3d = matrix_position(mat)
						}
						else // Any other tool
						{
							if (el_edit.element_type = TYPE_PART)
								mat = array_copy_1d(el_edit.matrix_edit)
							else
								mat = array_copy_1d(el_edit.matrix_parent)
	
							matrix_remove_scale(mat)
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
						var icon = null;
						
						switch (tool_selected)
						{
							case e_tool.PIVOT: icon = icons.PIVOT; break;
							case e_tool.MOVE: icon = icons.TOOLSET_POSITION; break;
							case e_tool.ROTATE: icon = icons.TOOLSET_ROTATE; break;
							case e_tool.SCALE: icon = icons.TOOLSET_SCALE; break;
							case e_tool.TRANSFORM: icon = icons.TRANSFORM; break;
							case e_tool.BEND: icon = icons.BEND; break;
							case e_tool.RESIZE: icon = icons.TOOLSET_RESIZE; break;
						}
						
						if (icon != null)
						{
							// Highlight icon
							if (view.control_mouseon = e_control.POS_PAN || view.control_mouseon = e_control.PIVOT_PAN || view.control_mouseon = e_control.BEND_OFFSET)
								draw_image(spr_circle_32, 0, origin2d[X], origin2d[Y], 2, 2, c_hover, a_hover)
							
							draw_image(spr_dropshadow_14, 0, origin2d[X], origin2d[Y], 2, 2, c_white, 1)
							draw_image(spr_circle_28, 0, origin2d[X], origin2d[Y], 2, 2, c_background, 1)
							draw_image(spr_icons, icon, origin2d[X], origin2d[Y], 2, 2, c_text_secondary, a_text_secondary)
						}
						else
							draw_image(spr_circle_16, 0, origin2d[X], origin2d[Y], 2, 2, c_axiscyan, 1)
					}
					
					if (window_busy = "rendercontrol")
					{
						// XYZ scale control tooltip
						if (view_control_edit = e_control.SCA_XYZ)
						{
							var zup = setting_z_is_up;
							var scalearr = point3D(el_edit.value[e_value.SCA_X], el_edit.value[e_value.SCA_Y + zup], el_edit.value[e_value.SCA_Z - zup]);
						
							tip_set(text_get("tooltipxyz", scalearr[X], scalearr[Y], scalearr[Z]), mouse_click_x, mouse_click_y, 0, 0, false)
						}
					
						// Single value control tooltip
						if (view_control_edit != e_control.SCA_XYZ)
						{
							var tipstr, value, zup;
							tipstr = ""
							value = point3D(0, 0, 0)
							zup = !setting_z_is_up
							
							if (view_control_edit >= e_control.PIVOT_X && view_control_edit <= e_control.PIVOT_PAN) // Pivot
								value = point3D(el_edit.value[e_value.OFFSET_X], el_edit.value[e_value.OFFSET_Y + zup], el_edit.value[e_value.OFFSET_Z - zup])
							else if (view_control_edit >= e_control.POS_X && view_control_edit <= e_control.POS_PAN) // Position
								value = point3D(el_edit.value[e_value.POS_X], el_edit.value[e_value.POS_Y + zup], el_edit.value[e_value.POS_Z - zup])
							else if (view_control_edit >= e_control.SCA_X && view_control_edit <= e_control.SCA_Z) // Scale
								value = point3D(el_edit.value[e_value.SCA_X], el_edit.value[e_value.SCA_Y + zup], el_edit.value[e_value.SCA_Z - zup])
							else if (view_control_edit >= e_control.RESIZE_XP && view_control_edit <= e_control.RESIZE_ZN) // Size
							{
								value = point3D(el_edit.value[e_value.WIDTH], el_edit.value[e_value.LENGTH], el_edit.value[e_value.HEIGHT])
								tipstr = text_get("tooltipresize", value[X], value[Y], value[Z])
							}
							else if (view_control_edit >= e_control.ROT_X && view_control_edit <= e_control.ROT_Z) // Rotation
							{
								value = point3D(el_edit.value[e_value.ROT_X], el_edit.value[e_value.ROT_Y + zup], el_edit.value[e_value.ROT_Z - zup])
								tipstr = text_get("tooltipanglexyz", value[X], value[Y], value[Z])
							}
							else if ((view_control_edit >= e_control.BEND_X && view_control_edit <= e_control.BEND_SIZE)) // Bend angle/size/offset
							{
								if (view_control_edit = e_control.BEND_OFFSET)
								{
									value = el_edit.value[e_value.BEND_OFFSET]
									tipstr = text_get("tooltipoffset", value)
								}
								else if (view_control_edit = e_control.BEND_SIZE)
								{
									value = el_edit.value[e_value.BEND_SIZE]
									tipstr = text_get("tooltipsize", value)
								}
								else
								{
									value = point3D(el_edit.value[e_value.BEND_ANGLE_X], el_edit.value[e_value.BEND_ANGLE_Y + zup], el_edit.value[e_value.BEND_ANGLE_Z - zup])
									tipstr = text_get("tooltipanglexyz", value[X], value[Y], value[Z])
								}
							}
							else
								tipstr = text_get("tooltipxyz", value[X], value[Y], value[Z])
							
							tip_force_right = true
							tip_set(tipstr, mouse_click_x, mouse_click_y, 0, 0, false)
							tip_force_right = false
						}
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

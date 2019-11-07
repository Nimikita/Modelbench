/// view_update_surface(view, camera)
/// @arg view
/// @arg camera

var view, cam;
view = argument0
cam = argument1

render_start(view.surface, cam, content_width, content_height)

if (program_mode = e_mode.MODELING)
	render_low()
else
	render_high()

view_shape_outline()

// Controls
if (el_edit_amount > 0 && program_mode = e_mode.MODELING)
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
					if (tool_selected = e_tool.MOVE || tool_selected = e_tool.TRANSFORM)
						view_control_move(view)
					
					// Rotate
					if (tool_selected = e_tool.ROTATE || tool_selected = e_tool.TRANSFORM)
						view_control_rotate(view)
					
					// Scale
					if (tool_selected = e_tool.SCALE || tool_selected = e_tool.TRANSFORM)
						view_control_scale(view)
					
					// Bend
					//if (el_edit.element_type = TYPE_PART && el_edit.value[e_value.BEND])
					//	view_control_bend(view)
					
					// Tool icon
					var origin;
					
					if (window_busy != "rendercontrolscalexyz")
					{
						var mat;
						if (el_edit.element_type = TYPE_PART)
							mat = array_copy_1d(el_edit.matrix_edit)
						else
							mat = array_copy_1d(el_edit.matrix_parent)
	
						matrix_remove_scale(mat)
					
						origin = point3D_project(matrix_position(mat), view_proj_matrix, render_width, render_height)
					}
					else
						origin = view_control_scale_coords
					
					if (!point3D_project_error)
					{
						if (tool_selected >= e_tool.MOVE)
							draw_circle_ext(origin[X], origin[Y], 14, false, c_background, 1)
						
						var icon = null;
						if (tool_selected = e_tool.MOVE)
							icon = e_icon.toolset_position
						else if (tool_selected = e_tool.ROTATE)
							icon = e_icon.toolset_rotate
						else if (tool_selected = e_tool.SCALE)
							icon = e_icon.toolset_scale
						else if (tool_selected = e_tool.TRANSFORM)
							icon = e_icon.transform
						
						if (icon != null)
							draw_image(spr_icons, icon, origin[X] + 1, origin[Y] + 1, 1, 1, c_text_secondary, a_text_secondary)
						else
							draw_circle_ext(origin[X], origin[Y], 8, false, c_origin, 1)
					}
					
					// Tooltip
					if (window_busy = "rendercontrolscalexyz")
					{
						var scalearr;
						if (setting_z_is_up)
							scalearr = vec3(el_edit.value[e_value.SCA_X], el_edit.value[e_value.SCA_Y], el_edit.value[e_value.SCA_Z])
						else
							scalearr = vec3(el_edit.value[e_value.SCA_X], el_edit.value[e_value.SCA_Z], el_edit.value[e_value.SCA_Y])
						
						tip_set(text_get("tooltipscalexyz", scalearr[X], scalearr[Y], scalearr[Z]), mouse_click_x, mouse_click_y, 0, 0, false)
					}
					else if (window_busy = "rendercontrol")
					{
						var tooltipstring = "tooltip";
						if (view_control_edit >= e_value.POS_X && view_control_edit <= e_value.POS_Z)
							tooltipstring += "position"
						else if (view_control_edit >= e_value.ROT_X && view_control_edit <= e_value.ROT_Z)
							tooltipstring += "rotation"
						else if (view_control_edit >= e_value.SCA_X && view_control_edit <= e_value.SCA_Z)
							tooltipstring += "scale"
					
						if ((view_control_edit mod 3) = 0)
							tooltipstring += "x"
						else if ((view_control_edit mod 3) = 1)
							tooltipstring += "y"
						else if ((view_control_edit mod 3) = 2)
							tooltipstring += "z"
						
						var addstring;
						if (view_control_value_add > 0)
							addstring = "+" + string(view_control_value_add)
						else
							addstring = string(view_control_value_add)
						
						tip_force_right = true
						tip_set(text_get(tooltipstring, el_edit.value[view_control_edit], addstring), mouse_click_x, mouse_click_y, 0, 0, false)
						tip_force_right = false
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
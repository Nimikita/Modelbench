/// view_toolbar_draw(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height

function view_toolbar_draw(barx, bary, barw, barh)
{
	dx = barx
	dy = bary
	dw = barw
	dh = barh
	dy_start = dy
	dx_start = dx
	
	if (program_mode != e_mode.MODELING)
		return 0
	
	content_mouseon = app_mouse_box(dx, dy, dw, dh) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon
	
	if (dh > dw)
		tip_force_right = true
	
	var busy, buttonsize;
	busy = window_busy
	buttonsize = 28 + 4
	
	window_busy = ""
	
	if (app_mouse_box(dx - 80, dy - 80, dw + 160, dh + 160) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon && menu_panel_ani = 0)
		toolset_alpha_goal = 1
	else
		toolset_alpha_goal = .25
	
	window_busy = busy
	
	draw_set_alpha(toolset_alpha)
	
	// Background
	draw_box(dx, dy, dw, dh, false, c_level_middle, 1)
	draw_dropshadow(dx, dy, dw, dh, c_black, 1)
	draw_outline(dx, dy, dw, dh, 1, c_border, a_border)
	
	dy += 4
	dx += 4
	
	// Add part
	if (draw_button_icon("toolsetaddpart", dx, dy, 28, 28, false, icons.PART_ADD, null, false, "toolsetaddpart"))
		action_element_create(e_element.PART)
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	// Add block
	if (draw_button_icon("toolsetaddblock", dx, dy, 28, 28, false, icons.CUBE_ADD, null, false, "toolsetaddblock"))
		action_element_create(e_element.BLOCK)
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	// Add plane
	if (draw_button_icon("toolsetaddplane", dx, dy, 28, 28, false, icons.PLANE_ADD, null, false, "toolsetaddplane"))
		action_element_create(e_element.PLANE)
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	// Add plane (3d)
	if (draw_button_icon("toolsetaddplane3d", dx, dy, 28, 28, false, icons.PLANE_3D_ADD, null, false, "toolsetaddplane3d"))
		action_element_create(e_element.PLANE_3D)
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	if (dw > dh)
		draw_box(dx, dy, 1, 28, false, c_border, a_border)
	else
		draw_box(dx, dy, 28, 1, false, c_border, a_border)
	
	if (dw > dh)
		dx += 4
	else
		dy += 4
	
	// Select-only tool
	tip_set_shortcut(setting_key_tool_select)
	if (draw_button_icon("toolsettoolselect", dx, dy, 28, 28, tool_selected = e_tool.SELECT, icons.SELECT, null, false, "toolsettoolselect"))
		tool_selected = e_tool.SELECT
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	// Position tool
	tip_set_shortcut(setting_key_tool_move)
	if (draw_button_icon("toolsettoolmove", dx, dy, 28, 28, tool_selected = e_tool.MOVE, icons.MOVE, null, false, "toolsettoolmove"))
		tool_selected = e_tool.MOVE
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	// Pivot tool
	tip_set_shortcut(setting_key_tool_pivot)
	if (draw_button_icon("toolsettoolpivot", dx, dy, 28, 28, tool_selected = e_tool.PIVOT, icons.PIVOT, null, false, "toolsettoolpivot"))
		tool_selected = e_tool.PIVOT
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	// Rotate tool
	tip_set_shortcut(setting_key_tool_rotate)
	if (draw_button_icon("toolsettoolrotate", dx, dy, 28, 28, tool_selected = e_tool.ROTATE, icons.ROTATE, null, false, "toolsettoolrotate"))
		tool_selected = e_tool.ROTATE
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	// Resize tool
	tip_set_shortcut(setting_key_tool_resize)
	if (draw_button_icon("toolsettoolresize", dx, dy, 28, 28, tool_selected = e_tool.RESIZE, icons.BOUNDARY_BOX, null, false, "toolsettoolresize"))
		tool_selected = e_tool.RESIZE
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	// Scale tool
	tip_set_shortcut(setting_key_tool_scale)
	if (draw_button_icon("toolsettoolscale", dx, dy, 28, 28, tool_selected = e_tool.SCALE, icons.SCALE, null, false, "toolsettoolscale"))
		tool_selected = e_tool.SCALE
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	// Bend tool
	tip_set_shortcut(setting_key_tool_bend)
	if (draw_button_icon("toolsettoolbend", dx, dy, 28, 28, tool_selected = e_tool.BEND, icons.BEND, null, false, "toolsettoolbend"))
		tool_selected = e_tool.BEND
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	// Transform tool(Position, rotate, scale)
	tip_set_shortcut(setting_key_tool_transform)
	if (draw_button_icon("toolsettooltransform", dx, dy, 28, 28, tool_selected = e_tool.TRANSFORM, icons.TRANSFORM, null, false, "toolsettooltransform"))
		tool_selected = e_tool.TRANSFORM
	
	draw_set_alpha(1)
	tip_set_shortcut(-1)
	tip_force_right = false
}

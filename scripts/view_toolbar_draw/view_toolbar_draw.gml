/// view_toolbar_draw(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height

var xx, yy, width, height;
xx = argument0
yy = argument1
width = argument2
height = argument3

content_x = xx
content_y = yy
content_width = width
content_height = height
content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height) && !popup_mouseon
tip_force_right = true

// Background
draw_box(xx, yy, width, height, false, c_background, 1)
draw_dropshadow(xx, yy, width, height, c_black, 1)

yy += 4
xx += 4

// Add part
if (draw_button_icon("toolsetaddpart", xx, yy, 28, 28, false, e_icon.part_add))
	action_element_create(e_element.PART)
yy += 28 + 4

// Add block
draw_button_icon("toolsetaddblock", xx, yy, 28, 28, false, e_icon.block_add, null, true)
yy += 28 + 4

// Add plane
draw_button_icon("toolsetaddplane", xx, yy, 28, 28, false, e_icon.plane_add, null, true)
yy += 28 + 4

// Add plane (3d)
draw_button_icon("toolsetaddplane3d", xx, yy, 28, 28, false, e_icon.plane3d_add, null, true)
yy += 28 + 4

draw_box(xx, yy, 28, 1, false, c_neutral10, a_neutral10)
yy += 4

// Select-only tool
tip_set_shortcut(setting_key_tool_select, setting_key_tool_select_control)
if (draw_button_icon("toolsettoolselect", xx, yy, 28, 28, tool_selected = e_tool.SELECT, e_icon.cursor, null, false, "toolsettoolselect"))
	tool_selected = e_tool.SELECT
yy += 28 + 4

// Position tool
tip_set_shortcut(setting_key_tool_move, setting_key_tool_move_control)
if (draw_button_icon("toolsettoolmove", xx, yy, 28, 28, tool_selected = e_tool.MOVE, e_icon.toolset_position, null, false, "toolsettoolmove"))
	tool_selected = e_tool.MOVE
yy += 28 + 4

// Rotate tool
tip_set_shortcut(setting_key_tool_rotate, setting_key_tool_rotate_control)
if (draw_button_icon("toolsettoolrotate", xx, yy, 28, 28, tool_selected = e_tool.ROTATE, e_icon.toolset_rotate, null, false, "toolsettoolrotate"))
	tool_selected = e_tool.ROTATE
yy += 28 + 4

// Scale tool
tip_set_shortcut(setting_key_tool_scale, setting_key_tool_scale_control)
if (draw_button_icon("toolsettoolscale", xx, yy, 28, 28, tool_selected = e_tool.SCALE, e_icon.toolset_scale, null, false, "toolsettoolscale"))
	tool_selected = e_tool.SCALE
yy += 28 + 4

// Transform tool(Position, rotate, scale)
tip_set_shortcut(setting_key_tool_transform, setting_key_tool_transform_control)
if (draw_button_icon("toolsettooltransform", xx, yy, 28, 28, tool_selected = e_tool.TRANSFORM, e_icon.transform, null, false, "toolsettooltransform"))
	tool_selected = e_tool.TRANSFORM
yy += 28 + 4

tip_set_shortcut(-1, false)
tip_force_right = false

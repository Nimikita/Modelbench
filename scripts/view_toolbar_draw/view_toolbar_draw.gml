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
content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon
tip_force_right = true

var busy = window_busy;
window_busy = ""

if (app_mouse_box(content_x - 80, content_y - 80, content_width + 160, content_height + 160) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon)
	toolset_alpha_goal = 1
else
	toolset_alpha_goal = .25

window_busy = busy

draw_set_alpha(toolset_alpha)

// Background
draw_box(xx, yy, width, height, false, c_background, 1)
draw_dropshadow(xx, yy, width, height, c_black, 1)

yy += 4
xx += 4

// Add part
if (draw_button_icon("toolsetaddpart", xx, yy, 28, 28, false, e_icon.part_add, null, false, "toolsetaddpart"))
	action_element_create(e_element.PART)
yy += 28 + 4

// Add block
if (draw_button_icon("toolsetaddblock", xx, yy, 28, 28, false, e_icon.block_add, null, false, "toolsetaddblock"))
	action_element_create(e_element.BLOCK)
yy += 28 + 4

// Add plane
if (draw_button_icon("toolsetaddplane", xx, yy, 28, 28, false, e_icon.plane_add, null, false, "toolsetaddplane"))
	action_element_create(e_element.PLANE)
yy += 28 + 4

// Add plane (3d)
if (draw_button_icon("toolsetaddplane3d", xx, yy, 28, 28, false, e_icon.plane3d_add, null, false, "toolsetaddplane3d"))
	action_element_create(e_element.PLANE_3D)
yy += 28 + 4

draw_box(xx, yy, 28, 1, false, c_overlay, a_overlay)
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

draw_set_alpha(1)
tip_set_shortcut(-1, false)
tip_force_right = false

// Debug info
if (debug_info)
{
	var shapes, parts, blocks, planes, planes3d;
	shapes = 0
	parts = 0
	blocks = 0
	planes = 0
	planes3d = 0
	
	with (obj_model_element)
	{
		if (element_type = TYPE_SHAPE)
		{
			shapes++
			
			if (type = "plane")
			{
				if (value[e_value.EXTRUDE])
					planes3d++
				else
					planes++
			}	
			else if (type = "block")
				blocks++
		}
		else
			parts++
	}
	
	var labely = 0;
	draw_label("FPS: " + string(fps), content_x + content_width + 8, content_y + 8 + labely, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)
	labely += 16
	draw_label("FPS real: " + string(fps_real), content_x + content_width + 8, content_y + 8 + labely, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)
	labely += 16
	draw_label("Step event: " + string(step_event_time) + "ms", content_x + content_width + 8, content_y + 8 + labely, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)
	labely += 16
	draw_label("Draw event: " + string(draw_event_time) + "ms", content_x + content_width + 8, content_y + 8 + labely, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)
	labely += 32

	draw_label("Parts: " + string(parts), content_x + content_width + 8, content_y + 8 + labely, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)
	labely += 16
	draw_label("Shapes: " + string(shapes), content_x + content_width + 8, content_y + 8 + labely, fa_left, fa_top, c_text_main, a_text_main, font_emphasis)
	labely += 16
	draw_label("3D planes: " + string(planes3d), content_x + content_width + 16, content_y + 8 + labely, fa_left, fa_top, c_text_secondary, a_text_secondary, font_emphasis)
	labely += 16
	draw_label("Planes: " + string(planes), content_x + content_width + 16, content_y + 8 + labely, fa_left, fa_top, c_text_secondary, a_text_secondary, font_emphasis)
	labely += 16
	draw_label("Blocks: " + string(blocks), content_x + content_width + 16, content_y + 8 + labely, fa_left, fa_top, c_text_secondary, a_text_secondary, font_emphasis)
	labely += 16
}

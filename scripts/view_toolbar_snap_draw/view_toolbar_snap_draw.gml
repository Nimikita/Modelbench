/// view_toolbar_snap_draw(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height

dx = argument0
dy = argument1
dw = argument2
dh = argument3

if (program_mode != e_mode.MODELING)
	return 0

content_mouseon = app_mouse_box(dx, dy, dw, dh) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon

var busy = window_busy;
window_busy = ""

if (setting_snap || (app_mouse_box(dx - 80, dy - 80, dw + 160, dh + 160) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon))
	toolset_snap_alpha_goal = 1
else
	toolset_snap_alpha_goal = .25

window_busy = busy

draw_set_alpha(toolset_snap_alpha)

// Background
draw_box(dx, dy, dw, dh, false, c_background, 1)
draw_dropshadow(dx, dy, dw, dh, c_black, 1)

dy += 4
dx += 4

// Snap
tip_set_shortcut(setting_key_snap, setting_key_snap_control)
draw_button_icon("toolsetsnap", dx, dy, 28, 28, setting_snap, icons.MAGNET, action_setting_snap, false, setting_snap ? "tooltipsnapdisable" : "tooltipsnapenable")
tip_set_shortcut(-1, false)

dx += 28 + 4 + 10

draw_label(text_get("toolsetsnapsize"), dx, dy + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_emphasis)

dx += string_width_font(text_get("toolsetsnapsize"), font_emphasis) + 8

textfield_group_add("toolsetsnapsizeposition", setting_snap_size_position, 1, action_setting_snap_size_position, null, tbx_snap_size_position, icons.TOOLSET_POSITION)
textfield_group_add("toolsetsnapsizerotation", setting_snap_size_rotation, 1, action_setting_snap_size_rotation, null, tbx_snap_size_rotation, icons.TOOLSET_ROTATE)
textfield_group_add("toolsetsnapsizescale", setting_snap_size_scale, 1, action_setting_snap_size_scale, null, tbx_snap_size_scale, icons.TOOLSET_SCALE)
textfield_group_add("toolsetsnapsizeuv", setting_snap_size_uv, 1, action_setting_snap_size_uv, null, tbx_snap_size_uv, icons.UV_EDITOR)

draw_textfield_group("toolsetsnapsize", dx, dy, 288, .01, 0.001, no_limit, 0.001)

draw_set_alpha(1)


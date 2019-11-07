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

if (app_mouse_box(dx - 80, dy - 80, dw + 160, dh + 160) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon)
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
draw_button_icon("toolsetsnap", dx, dy, 28, 28, setting_snap, e_icon.magnet, action_setting_snap, false, test(setting_snap, "tooltipsnapdisable", "tooltipsnapenable"))
tip_set_shortcut(-1, false)

dx += 28 + 4 + 6

draw_textfield_num("toolsetsnapsize", dx, dy, 64, setting_snap_size, .1, 0.0001, no_limit, 1, 0.0001, tbx_snap_size, action_setting_snap_size, !setting_snap)

draw_set_alpha(1)


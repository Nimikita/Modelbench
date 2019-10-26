/// view_toolbar_snap_draw(x, y, width, height)
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

var busy = window_busy;
window_busy = ""

if (app_mouse_box(content_x - 80, content_y - 80, content_width + 160, content_height + 160) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon)
	toolset_snap_alpha_goal = 1
else
	toolset_snap_alpha_goal = .25

window_busy = busy

draw_set_alpha(toolset_snap_alpha)

// Background
draw_box(xx, yy, width, height, false, c_background, 1)
draw_dropshadow(xx, yy, width, height, c_black, 1)

yy += 4
xx += 4

// Snap
tip_set_shortcut(setting_key_snap, setting_key_snap_control)
draw_button_icon("toolsetsnap", xx, yy, 28, 28, setting_snap, e_icon.magnet, action_setting_snap, false, test(setting_snap, "tooltipsnapdisable", "tooltipsnapenable"))
tip_set_shortcut(-1, false)

xx += 28 + 4 + 6

draw_textfield_num("toolsetsnapsize", xx, yy, 64, setting_snap_size, .1, 0.0001, no_limit, 1, 0.0001, tbx_snap_size, action_setting_snap_size, !setting_snap)

draw_set_alpha(1)


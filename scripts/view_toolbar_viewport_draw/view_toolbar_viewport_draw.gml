/// view_toolbar_modeling_draw(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height

content_x = argument0
content_y = argument1
content_width = argument2
content_height = argument3

dx = content_x
dy = content_y
dw = content_width
dh = content_height

content_mouseon = app_mouse_box(dx, dy, dw, dh) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon

var busy = window_busy;
window_busy = ""

if (app_mouse_box(dx - 80, dy - 80, dw + 160, dh + 160) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon && menu_panel_ani = 0)
	toolbar_viewport_alpha_goal = 1
else
	toolbar_viewport_alpha_goal = .25

window_busy = busy

draw_set_alpha(toolbar_viewport_alpha)

// Background
draw_box(dx, dy, dw, dh, false, c_background, 1)
draw_dropshadow(dx, dy, dw, dh, c_black, 1)
draw_outline(dx, dy, dw, dh, 1, c_border, a_border)

// Center contents
dx = round(dx + content_width/2 - toolbar_viewport_width/2)

toolbar_viewport_width = dx

// Padding
dy += 4
dx += 4

var disable = program_mode != e_mode.MODELING;

// Snap
tip_set_shortcut(setting_key_snap)
draw_button_icon("toolsetsnap", dx, dy, 28, 28, setting_snap, icons.MAGNET, action_setting_snap, disable, setting_snap ? "tooltipsnapdisable" : "tooltipsnapenable")
tip_set_shortcut(-1)

dx += 28

draw_settings_button("snapsettings", dx, dy, 16, 28, false, settings_menu_snap, disable)
dx += 16 + 4

// Divider
draw_box(dx, dy, 1, 28, false, c_border, a_border)
dx += 4

// Overlays
draw_button_icon("toolsetoverlays", dx, dy, 28, 28, setting_overlays, icons.OVERLAYS, action_setting_overlays, disable, setting_overlays ? "tooltipoverlaysdisable" : "tooltipoverlaysenable")
dx += 28

draw_settings_button("overlaysettings", dx, dy, 16, 28, false, settings_menu_overlays, disable)
dx += 16 + 4

// Wind
draw_button_icon("toolsetwind", dx, dy, 28, 28, setting_wind, icons.WIND, action_setting_wind, false, setting_wind ? "tooltipwinddisable" : "tooltipwindenable")
dx += 28

draw_settings_button("windsettings", dx, dy, 16, 28, false, settings_menu_wind)
dx += 16 + 4

// Blocky bending
draw_button_icon("toolsetblockybending", dx, dy, 28, 28, setting_blocky_bending, icons.BLOCKY_BENDING, action_setting_blocky_bending, false, setting_blocky_bending ? "tooltipblockybendingdisable" : "tooltipblockybendingenable")
dx += 28 + 4

// Divider
draw_box(dx, dy, 1, 28, false, c_border, a_border)
dx += 4

// Flat rendering
if (draw_button_icon("toolsetflat", dx, dy, 28, 28, setting_render_mode = e_viewport_render.FLAT, icons.FLAT, null, disable, "tooltipflatmode"))
	action_setting_render(e_viewport_render.FLAT)
dx += 28 + 4

// Shaded rendering
if (draw_button_icon("toolsetshaded", dx, dy, 28, 28, setting_render_mode = e_viewport_render.SHADED, icons.SHADED, null, disable, "tooltipshadedmode"))
	action_setting_render(e_viewport_render.SHADED)
dx += 28 + 4

// Textured rendering
if (draw_button_icon("toolsettextured", dx, dy, 28, 28, setting_render_mode = e_viewport_render.TEXTURED, icons.TEXTURED, null, disable, "tooltiptexturedmode"))
	action_setting_render(e_viewport_render.TEXTURED)
dx += 28

draw_settings_button("shading", dx, dy, 16, 28, false, settings_menu_shading, disable || setting_render_mode = e_viewport_render.FLAT)
dx += 16 + 4

// Divider
draw_box(dx, dy, 1, 28, false, c_border, a_border)
dx += 4

// Walk navigation toggle
tip_set_shortcut(setting_key_walk_navigation)
if (draw_button_icon("toolwalknav", dx, dy, 28, 28, window_busy = "viewmovecameratoggle", icons.WALK, null, false, "tooltipwalknav"))
{
	window_focus = string(content_view)
	window_busy = "viewmovecameratoggle"
	view_click_x = display_mouse_get_x()
	view_click_y = display_mouse_get_y()
}
tip_set_shortcut(-1)

dx += 28 + 4

toolbar_viewport_width = dx - toolbar_viewport_width
draw_set_alpha(1)

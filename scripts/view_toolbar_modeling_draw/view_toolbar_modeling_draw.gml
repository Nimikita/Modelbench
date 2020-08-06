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

// Background
draw_box(dx, dy, dw, dh, false, c_background, 1)
draw_gradient(dx, dy + dh, dw, shadow_size, c_black, shadow_alpha, shadow_alpha, 0, 0)

// Center contents
dx = round(dx + content_width/2 - toolbar_modeling_width/2)

toolbar_modeling_width = dx

// Padding
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

draw_textfield_group("toolsetsnapsize", dx, dy, 288, .01, snap_min, no_limit, snap_min)

dx += 288 + 8

// Snap mode
draw_label(text_get("toolsetsnapmode"), dx, dy + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_emphasis)

dx += string_width_font(text_get("toolsetsnapmode"), font_emphasis) + 8

var text;
if (setting_snap_mode = e_snap_mode.ABSOLUTE)
	text = "toolsetsnapmodeabsolute"
else
	text = "toolsetsnapmodelocal"

draw_button_menu("toolsetsnapmode", e_menu.LIST, dx, dy, 128, 28, setting_snap_mode, text_get(text), action_setting_snap_mode, false, null)

dx += 128 + 8

toolbar_modeling_width = dx - toolbar_modeling_width

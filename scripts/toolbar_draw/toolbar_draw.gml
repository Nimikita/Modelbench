/// toolbar_draw()

var boxx, boxy, boxw, boxh;
boxx = 0
boxy = 0
boxw = window_width
boxh = 36
content_direction = e_scroll.HORIZONTAL

content_x = boxx
content_y = boxy
content_width = boxw
content_height = boxh
content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height)

dx = boxx + 4
dy = boxy

draw_box(content_x, content_y, content_width, content_height, false, c_background, 1)
draw_gradient(content_x, content_y + content_height, content_width, shadow_size, c_black, shadow_alpha, shadow_alpha, 0, 0)

draw_menu_button(dx, dy, boxh, boxh)
dx += boxh + 4
dy += 4

draw_button_icon("toolbarundo", dx, dy, 28, 28, false, e_icon.undo, action_toolbar_undo, history_pos = history_amount, "tooltipundo")
dx += 28 + 4
draw_button_icon("toolbarredo", dx, dy, 28, 28, false, e_icon.redo, action_toolbar_redo, history_pos = 0, "tooltipredo")

// Program mode buttons
draw_set_font(font_button)
var w;
w = string_width(text_get("toolbarmodeling")) + 32 + string_width(text_get("toolbarpreview")) + 32
dx = round(boxx + (boxw/2) - w / 2)

// Modeling
draw_toolbar_button("toolbarmodeling", dx, boxy, e_mode.MODELING, program_mode, null)

// Preview
draw_toolbar_button("toolbarpreview", dx, boxy, e_mode.PREVIEW, program_mode, null)

draw_box(toolbar_line_x, content_y + content_height - 2, toolbar_line_width, 2, false, c_accent, 1)
toolbar_line_x += (toolbar_line_x_goal - toolbar_line_x) / max(1, 3 / delta)
toolbar_line_width += (toolbar_line_width_goal - toolbar_line_width) / max(1, 3 / delta)

dx = boxw - (28 + 4)
draw_button_icon("toolbaruveditor", dx, dy, 28, 28, false, e_icon.uveditor, null, true)

/// window_draw_testscreen()
/// @desc Draws various components on the window

content_x = 0
content_y = 0
content_width = 300//window_width
content_height = window_height
content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height)

dx = content_x + 8
dy = content_y + 8
dw = content_width - 16
dh = content_height - 16

// Draw background
draw_clear(c_overlay)
draw_box(content_x, content_y, content_width, content_height, false, c_white, 1)

// Set up values
if (current_step < 10)
{
	switchvalue = false
	switchvaluetwo = false
}

// Switches
tab_control_switch()
if (draw_switch("testscreenswitchone", dx, dy, switchvalue, null))
	switchvalue = !switchvalue
tab_next()

tab_control_switch()
if (draw_switch("testscreenswitchtwo", dx, dy, switchvaluetwo, null))
	switchvaluetwo = !switchvaluetwo
tab_next()
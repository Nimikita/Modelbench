/// draw_radiobutton(name, x, y, active, value, script)
/// @arg name
/// @arg x
/// @arg y
/// @arg active
/// @arg value
/// @arg script

var name, xx, yy, active, value, script;
var w, h, caption, mouseon, pressed;
name = text_get(argument[0])
xx = argument[1]
yy = argument[2]
active = argument[3]
value = argument[4]
script = argument[5]

caption = text_get(name)

w = dw//(side = "left" ? string_width_font(caption, font_emphasis) + size + 10 : dw)
h = 28

// Mouse
var mouseon, mouseclick;
mouseon = app_mouse_box(xx, yy, w, h) && content_mouseon && (window_busy = "")
mouseclick = mouseon && mouse_left

pressed = false

if (mouseon)
{
    if (mouse_left || mouse_left_released)
        pressed = true
	
    mouse_cursor = cr_handpoint
}

// Set micro animation before drawing
microani_set(argument[0], script, mouseon, mouseclick, active)

var buttonx, buttony;
buttonx = (xx + dw - 10)
buttony = (yy + (28/2))

// Draw button
var buttoncolor = merge_color(c_text_secondary, c_accent, mcroani_arr[e_mcroani.PRESS]);
buttoncolor = merge_color(buttoncolor, c_accent, mcroani_arr[e_mcroani.ACTIVE])

var buttonalpha = lerp(a_text_secondary, 1, mcroani_arr[e_mcroani.PRESS]);
buttonalpha = lerp(buttonalpha, 1, mcroani_arr[e_mcroani.ACTIVE])

draw_image(spr_radiobutton, 0, buttonx, buttony, 1, 1, buttoncolor, buttonalpha * (1 - mcroani_arr[e_mcroani.ACTIVE]) * (1 - mcroani_arr[e_mcroani.HOVER]))
draw_image(spr_radiobutton, 1, buttonx, buttony, 1, 1, buttoncolor, buttonalpha * (1 - mcroani_arr[e_mcroani.ACTIVE]) * (mcroani_arr[e_mcroani.HOVER]))

draw_image(spr_radiobutton, 3, buttonx, buttony, 1, 1, buttoncolor, buttonalpha * mcroani_arr[e_mcroani.ACTIVE])
draw_image(spr_radiobutton, 2, buttonx, buttony, 1, 1, buttoncolor, buttonalpha * mcroani_arr[e_mcroani.ACTIVE] * (1 - mcroani_arr[e_mcroani.RADIO_HOVER]))

// Draw hover outline
draw_image(spr_radiobutton_hover, 0, buttonx, buttony, 1, 1, c_accent_hover, a_accent_hover * mcroani_arr[e_mcroani.HOVER])

// Label
draw_label(name, xx, yy + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_emphasis)

microani_update(mouseon, mouseclick, active)
radiobutton_group_update(mouseon && !active)

// Press
if (pressed && mouse_left_released)
{
	if (script != null)
		script_execute(script, value)
	
	return true
}
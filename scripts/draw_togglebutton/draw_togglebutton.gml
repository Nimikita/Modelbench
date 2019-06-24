/// draw_togglebutton(name, x, y)
/// @arg name
/// @arg x
/// @arg y
/// @desc Displays togglebutton options

var name, xx, yy;
var h, w, buttonx, buttoncount, buttonsize, mouseon, script, scriptvalue, axis;
name = argument[0]
xx = argument[1]
yy = argument[2]

h = 28
w = dw
buttonx = xx
buttoncount = array_length_1d(togglebutton_name)
buttonsize = round(w/buttoncount)
mouseon = false
script = null
scriptvalue = null
axis = X

draw_label(text_get(name), xx, yy + 16, fa_left, fa_bottom, c_neutral50, a_neutral50, font_label)
yy += 24

draw_outline(xx, yy, w, h, 1, c_neutral20, a_neutral20)

for (var i = 0; i < buttoncount; i++)
{	
	mouseon = false
	
	if (app_mouse_box(buttonx, yy, buttonsize, h) && content_mouseon)
		mouseon = true
	
	if (mouseon)
		mouse_cursor = cr_handpoint
	
	microani_set(name + togglebutton_name[i], null, mouseon, mouseon && mouse_left, togglebutton_active[i])
	
	// Draw base button
	var backgroundcolor, backgroundalpha;
	backgroundcolor = merge_color(c_neutral10, c_neutral20, mcroani_arr[e_mcroani.PRESS])
	backgroundalpha = lerp(0, a_neutral10, min(1.0, mcroani_arr[e_mcroani.HOVER] + mcroani_arr[e_mcroani.ACTIVE]))
	backgroundalpha = lerp(backgroundalpha, a_neutral20, mcroani_arr[e_mcroani.PRESS])
	draw_box(buttonx, yy, buttonsize, h, false, backgroundcolor, backgroundalpha)
	
	var labelcolor, labelalpha;
	labelcolor = merge_color(c_neutral50, c_accent, mcroani_arr[e_mcroani.ACTIVE])
	labelalpha = lerp(a_neutral50, 1, mcroani_arr[e_mcroani.ACTIVE])
	
	var icon = togglebutton_icon[i];
	
	var totalwidth, startx;
	totalwidth = string_width_font(text_get(togglebutton_name[@ i]), font_button) + test(icon = null, 0, 24 + 8)
	startx = snap(buttonx + (buttonsize/2) - (totalwidth/2), 2)
	
	// Icon
	if (icon != null)
	{
		draw_image(spr_icons, icon, startx + 10, yy + (h/2), 1, 1, labelcolor, labelalpha)
		startx += 20 + 8
	}
	
	// Text
	draw_label(text_get(togglebutton_name[@ i]), startx, yy + (h/2), fa_left, fa_middle, labelcolor, labelalpha, font_button)
	
	if (i > 0)
		draw_box(buttonx, yy + 4, 1, h - 8, false, c_neutral20, a_neutral20)
	
	microani_update(mouseon, mouseon && mouse_left, togglebutton_active[i])
	
	// Execute script with value
	if (mouseon && mouse_left_released)
	{
		if (togglebutton_script[i] != null)
		{
			script = togglebutton_script[i]
			scriptvalue = togglebutton_value[i]
			axis = togglebutton_axis[i]
		}
	}
	
	buttonx += buttonsize
}
buttonx = xx

// Repeat drawing for hover
for (var i = 0; i < buttoncount; i++)
{
	mouseon = false
	
	if (app_mouse_box(buttonx, yy, buttonsize, h) && content_mouseon)
		mouseon = true
	
	if (mouseon)
		mouse_cursor = cr_handpoint
	
	microani_set(name + togglebutton_name[i], null, mouseon, mouseon && mouse_left, togglebutton_active[i])
	
	draw_box_hover(buttonx, yy, buttonsize, h, mcroani_arr[e_mcroani.HOVER])
	buttonx += buttonsize
}

// Execute script
if (script != null)
{
	axis_edit = axis
	
	if (scriptvalue != null)
		script_execute(script, scriptvalue)
	else
		script_execute(script)
	
	axis_edit = X
}

// Clear togglebutton options
togglebutton_reset()
	
/// draw_togglebutton(name, x, y, namelist, iconlist, setlist, scriptlist, comparevalue, [multitoggle])
/// @arg name
/// @arg x
/// @arg y
/// @arg namelist
/// @arg iconlist
/// @arg valuelist
/// @arg scriptlist
/// @arg comparevalue
/// @arg [multitoggle]
/// @desc Draws a toggle button, by default it acts similar to a series of radio buttons, 'multitoggle' allows for multiple true/false values

var name, xx, yy, namelist, iconlist, valuelist, scriptlist, comparevalue, multitoggle;
var h, w, buttonx, buttoncount, buttonsize, mouseon, script, scriptvalue;
name = argument[0]
xx = argument[1]
yy = argument[2]
namelist = argument[3]
iconlist = argument[4]
valuelist = argument[5]
scriptlist = argument[6]
comparevalue = argument[7]
multitoggle = false

if (argument_count > 8)
	multitoggle = argument[8]

h = 28
w = dw
buttonx = xx
buttoncount = array_length_1d(namelist)
buttonsize = round(w/buttoncount)
mouseon = false
script = null
scriptvalue = null

draw_label(text_get(name), xx, yy + 8, fa_left, fa_bottom, c_neutral60, a_neutral60, font_label)
yy += 16

draw_outline(xx, yy, w, h, 1, c_neutral20, a_neutral20)

for (var i = 0; i < buttoncount; i++)
{	
	mouseon = false
	
	if (app_mouse_box(buttonx, yy, buttonsize, h) && content_mouseon)
		mouseon = true
	
	if (mouseon)
		mouse_cursor = cr_handpoint
	
	if (multitoggle)
		microani_set(name + namelist[i], null, mouseon, mouseon && mouse_left, valuelist[i] = true)
	else
		microani_set(name + namelist[i], null, mouseon, mouseon && mouse_left, valuelist[i] = comparevalue)
	
	// Draw base button
	var backgroundcolor, backgroundalpha;
	backgroundcolor = merge_color(c_neutral10, c_neutral20, mcroani_arr[e_mcroani.PRESS])
	backgroundalpha = lerp(0, a_neutral10, min(1.0, mcroani_arr[e_mcroani.HOVER] + mcroani_arr[e_mcroani.ACTIVE]))
	backgroundalpha = lerp(backgroundalpha, a_neutral20, mcroani_arr[e_mcroani.PRESS])
	draw_box(buttonx, yy, buttonsize, h, false, backgroundcolor, backgroundalpha)
	
	var labelcolor, labelalpha;
	labelcolor = merge_color(c_neutral60, c_accent, mcroani_arr[e_mcroani.ACTIVE])
	labelalpha = lerp(a_neutral60, 1, mcroani_arr[e_mcroani.ACTIVE])
	
	var icon = null;
	if (iconlist != null)
		icon = iconlist[i]
	
	var totalwidth, startx;
	totalwidth = string_width_font(text_get(namelist[@ i]), font_button) + test(icon = null, 0, 24 + 8)
	startx = snap(buttonx + (buttonsize/2) - (totalwidth/2), 2)
	
	// Icon
	if (icon != null)
	{
		draw_image(spr_icons, icon, startx + 10, yy + (h/2), 1, 1, labelcolor, labelalpha)
		startx += 20 + 8
	}
	
	// Text
	draw_label(text_get(namelist[@ i]), startx, yy + (h/2), fa_left, fa_middle, labelcolor, labelalpha, font_button)
	
	if (i > 0)
		draw_box(buttonx, yy + 4, 1, h - 8, false, c_neutral20, a_neutral20)
	
	if (multitoggle || valuelist = null)
		microani_update(mouseon, mouseon && mouse_left, valuelist[i] = true)
	else
		microani_update(mouseon, mouseon && mouse_left, valuelist[i] = comparevalue)
	
	// Execute script with value
	if (mouseon && mouse_left_released)
	{
		if (scriptlist != null && scriptlist[i] != null)
		{
			script = scriptlist[i]
			
			if (valuelist != null)
				scriptvalue = valuelist[@ i]
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
	
	if (multitoggle)
		microani_set(name + namelist[i], null, mouseon, mouseon && mouse_left, valuelist[i] = true)
	else
		microani_set(name + namelist[i], null, mouseon, mouseon && mouse_left, valuelist[i] = comparevalue)
	
	draw_box_hover(buttonx, yy, buttonsize, h, mcroani_arr[e_mcroani.HOVER])
	buttonx += buttonsize
}

if (script != null)
{
	if (scriptvalue != null)
		script_execute(script, scriptvalue)
	else
		script_execute(script)
}
	
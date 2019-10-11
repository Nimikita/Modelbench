/// draw_textfield_group(name, x, y, width, multiplier, min, max)
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg multiplier
/// @arg min
/// @arg max

var name, xx, yy, wid, mul, minval, maxval;
var fieldx, fieldwid, fieldupdate, hei;
name = argument[0]
xx = argument[1]
yy = argument[2]
wid = argument[3]
mul = argument[4]
minval = argument[5]
maxval = argument[6]

fieldx = xx
fieldwid = ((wid - 4) - (2 * (textfield_amount - 1)))/textfield_amount
fieldupdate = null
hei = 28

if (context_menu_copy_category)
	context_menu_area(xx, yy, wid, hei, "contextmenucategory")

// Draw field backgrounds
draw_outline(xx + 1, yy + 1, wid - 2, hei - 2, 1, c_border, a_border)
for (var i = 0; i < textfield_amount; i++)
{
	if (i > 0)
		draw_box(fieldx, yy + 1, 1, hei - 2, false, c_border, a_border)
	fieldx += (fieldwid + 2)
}
fieldx = xx + 2

// Draw fields
var mouseon, boxwid, update, labelcolor, labelalpha;
for (var i = 0; i < textfield_amount; i++)
{
	axis_edit = textfield_axis[i]
	mouseon = app_mouse_box(fieldx, yy + 2, fieldwid, hei - 4) && content_mouseon
	boxwid = fieldwid
	
	// Adjust draw width to cover dividers
	if (i <= textfield_amount - 1)
		boxwid -= 1
	
	microani_set(string(textfield_textbox[i]) + textfield_name[i], textfield_script[i], mouseon || window_focus = string(textfield_textbox[i]), false, (mouseon && mouse_left) || (window_focus = string(textfield_textbox[i])))
	
	// Field label
	var labelcolor, labelalpha;
	labelcolor = merge_color(c_text_secondary, c_accent, mcroani_arr[e_mcroani.ACTIVE])
	labelcolor = merge_color(labelcolor, c_text_tertiary, mcroani_arr[e_mcroani.DISABLED])

	labelalpha = lerp(a_text_secondary, 1, mcroani_arr[e_mcroani.ACTIVE])
	labelalpha = lerp(labelalpha, a_text_tertiary, mcroani_arr[e_mcroani.DISABLED])
	
	draw_label(text_get(textfield_name[i]), fieldx + 8, yy + (hei/2), fa_left, fa_middle, labelcolor, labelalpha, font_emphasis)
	
	draw_outline(fieldx - 1, yy + 1, boxwid + 2, hei - 2, 1, c_accent, mcroani_arr[e_mcroani.ACTIVE])
	
	draw_box_hover(fieldx - 2, yy, boxwid + 4, hei, max(mcroani_arr[e_mcroani.HOVER], mcroani_arr[e_mcroani.ACTIVE]) * (1 - mcroani_arr[e_mcroani.DISABLED]))
	
	microani_update(mouseon || window_focus = string(textfield_textbox[i]), false, window_focus = string(textfield_textbox[i]), false)
	
	// Textbox
	draw_set_font(font_value)
	var update = textbox_draw(textfield_textbox[i], fieldx + boxwid - string_width(textfield_textbox[i].text) - 9, yy + (hei/2) - 8, string_width(textfield_textbox[i].text), 18);
	
	// Textbox press
	if (app_mouse_box(fieldx + 28, yy, boxwid - 28, hei) && content_mouseon && window_focus != string(textfield_textbox[i]))
	{
		if (mouse_left_pressed)
		{
			window_focus = string(textfield_textbox[i])
			window_busy = ""
		}
	}
	
	// Drag
	if (app_mouse_box(fieldx + 2, yy, 24, 24) && content_mouseon && window_focus != string(textfield_textbox[i]))
	{
		mouse_cursor = cr_size_we
	
		if (mouse_left_pressed)
			window_busy = textfield_name[i] + "press"
	
		// Reset to 0
		if (context_menu_copy_category = null && mouse_right_pressed && textfield_default[i] != no_limit)
		{
			window_focus = textfield_name[i]
			
			if (textfield_script[i] != null)
				script_execute(textfield_script[i], clamp(snap(textfield_default[i], 1), minval, maxval), 0) // TODO: Put proper snapping here
			else
			{
				textfield_textbox[i].text = string(textfield_default[i])
				fieldupdate = textfield_textbox[i]
			}
		}
	}
	
	// Mouse pressed
	if (window_busy = textfield_name[i] + "press")
	{
		mouse_cursor = cr_size_we
	
		if (mouse_dx != 0)
		{
			dragger_drag_value = textfield_value[i]
			window_busy = textfield_name[i] + "drag" // Start dragging
		}
	}
	
	// Is dragging
	if (window_busy = textfield_name[i] + "drag")
	{ 
		mouse_cursor = cr_size_we
		dragger_drag_value += mouse_dx * mul

		var d = clamp(snap(dragger_drag_value, 1), minval, maxval) - textfield_value[i];
		
		if (d <> 0 && textfield_script[i] != null)
			script_execute(textfield_script[i], d, true)
		else
		{
			textfield_textbox[i].text = string(textfield_value[i] + d)
			fieldupdate = textfield_textbox[i]
		}
		
		if (!mouse_left)
		{
			window_busy = ""
			app_mouse_clear()
		}
	}
	
	// Textbox input update
	if (update)
	{
		if (textfield_script[i] != null)
			script_execute(textfield_script[i], clamp(snap(string_get_real(textfield_textbox[i].text, 0), 1), minval, maxval), false)
		else
			fieldupdate = textfield_textbox[i]
	}
	else
	{
		// Idle update
		if (window_busy != textfield_name[i] + "press" && window_focus != string(textfield_textbox[i]) && !fieldupdate)
			textfield_textbox[i].text = string_decimals(textfield_value[i])
	}
	
	fieldx += (fieldwid + 2)
}

textfield_group_reset()

return fieldupdate
/// draw_textfield_triple(names, x, y, width, textboxes, scripts)
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg textboxes
/// @arg script

var names, xx, yy, wid, textboxes, scripts;
var fieldx, fieldwid, fieldhei, fieldupdate;
names = argument[0]
xx = argument[1]
yy = argument[2]
wid = argument[3]
textboxes = argument[4]
scripts = argument[5]

fieldx = xx
fieldwid = (wid + 8)/3
fieldhei = 28
fieldupdate = false

// Draw field backgrounds
for (var i = 0; i < 3; i++)
{
	draw_box(fieldx, yy, fieldwid, fieldhei, false, c_background, 1)
	draw_outline(fieldx + 2, yy + 2, fieldwid - 4, fieldhei - 4, 2, c_neutral50, a_neutral50)
	fieldx += (fieldwid - 2)
}
fieldx = xx

// Draw reset of field
for (var i = 0; i < 3; i++)
{
	var mouseon = app_mouse_box(fieldx, yy, fieldwid, fieldhei);
	var update = textbox_draw(textboxes[i], fieldx + fieldwid - string_width_font(textboxes[i].text, font_value) - 9, yy + (fieldhei/2) - 8, string_width_font(textboxes[i].text, font_value), 18);
	fieldupdate = (update || fieldupdate)
	
	microani_set(string(textboxes[i]) + names[i], scripts[i], mouseon || window_focus = string(textboxes[i]), false, (mouseon && mouse_left) || (window_focus = string(textboxes[i])))
	
	// Field label
	var labelcolor, labelalpha;
	labelcolor = merge_color(c_neutral50, c_accent, mcroani_arr[e_mcroani.ACTIVE])
	labelcolor = merge_color(labelcolor, c_neutral30, mcroani_arr[e_mcroani.DISABLED])

	labelalpha = lerp(a_neutral50, 1, mcroani_arr[e_mcroani.ACTIVE])
	labelalpha = lerp(labelalpha, a_neutral30, mcroani_arr[e_mcroani.DISABLED])

	draw_label(text_get(names[i]), fieldx + 8, yy + (fieldhei/2), fa_left, fa_middle, labelcolor, labelalpha, font_emphasis)
	
	draw_outline(fieldx + 2, yy + 2, fieldwid - 4, fieldhei - 4, 2, c_accent, mcroani_arr[e_mcroani.ACTIVE]) 
	
	draw_box_hover(fieldx, yy, fieldwid, fieldhei, max(mcroani_arr[e_mcroani.HOVER], mcroani_arr[e_mcroani.ACTIVE]) * (1 - mcroani_arr[e_mcroani.DISABLED]))
	
	microani_update(mouseon || window_focus = string(textboxes[i]), false, window_focus = string(textboxes[i]), false)
	
	// Textbox press
	if (app_mouse_box(fieldx + 8, yy, fieldwid - 16, fieldhei) && content_mouseon && window_focus != string(textboxes[i]))
	{
		if (mouse_left_pressed)
		{
			window_focus = string(textboxes[i])
			window_busy = ""
		}
	}
	
	fieldx += (fieldwid - 2)
	
	if (update && scripts[i] != null)
		script_execute(scripts[i], string_get_real(textboxes[i].text, 0))
}

return fieldupdate
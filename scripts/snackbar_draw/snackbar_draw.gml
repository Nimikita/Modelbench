/// snackbar_draw(snackbar)
/// @arg snackbar
/// @desc Draws a snackbar notification

var sb, color;
sb = argument0

if (sb.variant = e_snackbar.DEFAULT)
	color = c_accent
else if (sb.variant = e_snackbar.ERROR)
	color = c_error
else if (sb.variant = e_snackbar.WARNING)
	color = c_warning
else if (sb.variant = e_snackbar.SUCCESS)
	color = c_success
else
	color = sb.color

content_x = window_width/2 - 560/2
content_y = sb.snackbar_y
content_width = 560
content_height = sb.snackbar_height
content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height)

if (content_mouseon)
	snackbar_mouseon = true

dx = content_x
dy = content_y
dw = content_width
dh = content_height

// Snackbar background
draw_box(dx, dy, dw, dh, false, c_background, 1)
draw_outline(dx, dy, dw, dh, 1, color, 1)
draw_dropshadow(dx, dy, dw, dh, c_black, 1)

// Dismiss bar
if (sb.dismiss_time != no_limit)
	draw_box(dx, dy + dh - 2, dw * (1 - ((current_time - sb.time_created) / (sb.dismiss_time * 1000))), 2, false, color, 1)

// Top line(In all snackbars)
dy += 22
dx += 44
draw_image(spr_icons, sb.icon, content_x + 22, dy, 1, 1, color, 1)

var label = sb.label;

if (sb.tip != null)
	label = text_get(label, string(sb.tip + 1))
else
	label = (text_exists(sb.label) ? text_get(sb.label) : sb.label)

draw_label(label, dx, dy, fa_left, fa_center, c_text_main, 1, font_label)

if (draw_button_icon("snackbarclose" + string(sb), content_x + content_width - 8 - 28, content_y + 8, 28, 28, false, icons.CLOSE, null, null))
	sb.remove = true

// Action 1
if (sb.description = "" && (sb.snackbar_action1 && !sb.snackbar_action2))
{
	var name1 = sb.snackbar_action1_name;
	var actionx = content_x + content_width - 8 - 28 - 4 - (string_width_font(text_exists(name1) ? text_get(name1) : name1, font_button) + 28);
	if (draw_button_borderless(sb.snackbar_action1_name, actionx, content_y + 8, null, string(sb), null))
	{
		snackbar_script = sb.snackbar_action1
		snackbar_script_value = sb.snackbar_action1_value
	}
}

dy += 22

// Description line
if (sb.description != "")
{
	draw_label(text_exists(sb.description) ? text_get(sb.description) : sb.description, dx, dy - 8, fa_left, fa_top, c_text_main, 1, font_value, -1, content_width - 44 - 36)
	dy += 22
}

// Action lines
if (sb.description != "" || (sb.snackbar_action1 && sb.snackbar_action2))
{
	dx = content_x + 28
	dy = content_y + content_height - 40
	
	// Action 1
	if (sb.snackbar_action1)
	{
		if (draw_button_borderless(sb.snackbar_action1_name, dx, dy, null, string(sb), null))
		{
			snackbar_script = sb.snackbar_action1
			snackbar_script_value = sb.snackbar_action1_value
		}
	}
	
	dx += string_width_font(text_get(sb.snackbar_action1_name), font_button) + 28 + 4
	
	// Action 2
	if (sb.snackbar_action2)
	{
		if (draw_button_borderless(sb.snackbar_action2_name, dx, dy, null, string(sb), null))
		{
			snackbar_script = sb.snackbar_action2
			snackbar_script_value = sb.snackbar_action2_value
		}
	}
}

if (sb.dismiss_time != no_limit && ((current_time - sb.time_created) > (sb.dismiss_time * 1000)))
	sb.remove = true

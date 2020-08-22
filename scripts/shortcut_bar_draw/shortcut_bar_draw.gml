/// shortcut_bar_draw()

content_x = 0
content_y = window_height - (28 * shortcut_bar_lines)
content_width = window_width
content_height = (28 * shortcut_bar_lines)

draw_box(content_x, content_y, content_width, content_height, false, c_background, 1)
draw_box(content_x, content_y - 1, content_width, 1, false, c_border, a_border)

dx = content_x + 12
dy = content_y
dw = content_width
dh = 28

// Try to prevent constant flickering with multiple lines
var busy, mouseon;
busy = window_busy
window_busy = ""
mouseon = app_mouse_box(content_x, content_y, content_width, content_height);
window_busy = busy

if (shortcut_bar_width != shortcut_bar_width_prev && !mouseon)
{
	ds_list_clear(shortcut_bar_width_list)
	shortcut_bar_lines = 1
}

// Draw shortcuts
var width = 0;
var lines = 1;
for (var i = 0; i < ds_list_size(shortcut_bar_list); i++)
{
	if (!ds_list_empty(shortcut_bar_width_list))
	{
		if (shortcut_bar_width = shortcut_bar_width_prev && i < ds_list_size(shortcut_bar_width_list))
		{
			if (dx + shortcut_bar_width_list[|i] > window_width)
			{
				lines++
				dx = content_x + 12
				dy += 28
			}
		}
	}
	
	dx_start = dx
	shortcut_draw(shortcut_bar_list[|i])
	ds_list_set(shortcut_bar_width_list, i, dx - dx_start)
	width += (dx - dx_start)
}

shortcut_bar_lines = max(lines, shortcut_bar_lines)
shortcut_bar_width_prev = shortcut_bar_width
shortcut_bar_width = width
ds_list_clear(shortcut_bar_list)

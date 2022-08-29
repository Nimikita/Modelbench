/// app_mouse_box(x, y, width, height, busy)
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg busy

function app_mouse_box_busy(boxx, boxy, boxw, boxh, busy)
{
	return (mouse_x >= boxx &&
			mouse_y >= boxy &&
			mouse_x < boxx + boxw &&
			mouse_y < boxy + boxh && window_busy = busy && popup_ani_type = "")
}

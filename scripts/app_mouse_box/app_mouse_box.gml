/// app_mouse_box(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height

function app_mouse_box(boxx, boxy, boxw, boxh)
{
	return (mouse_x >= boxx &&
			mouse_y >= boxy &&
			mouse_x < boxx + boxw &&
			mouse_y < boxy + boxh && window_busy = "" && popup_ani_type = "")
}

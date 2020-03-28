/// app_mouse_wrap(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @desc Wraps mouse position in a box

var xx, yy, width, height, setx, sety;
xx = argument0
yy = argument1
width = argument2
height = argument3
setx = mouse_x
sety = mouse_y

if (mouse_x < xx || display_mouse_get_x() < 2)
	setx = xx + width

if (mouse_y < yy || display_mouse_get_y() < 2)
	sety = yy + height

if (mouse_x > xx + width || display_mouse_get_y() > display_get_width() - 2)
	setx = xx

if (mouse_y > yy + height || display_mouse_get_y() > display_get_height() - 2)
	sety = yy

if (setx != mouse_x || sety != mouse_y)
{
	window_mouse_set(setx, sety)

	mouse_current_x = setx
	mouse_current_y = sety
}
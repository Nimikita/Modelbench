/// window_draw_snackbar()
/// @desc Draws all snackbars

var sb;

snackbar_mouseon = false

for (var i = 0; i < snackbar_amount; i++)
{
	sb = snackbar_list[|i]
	
	draw_set_alpha(sb.remove_alpha)
	snackbar_draw(sb)
	draw_set_alpha(1)
}

/// window_draw_snackbar()
/// @desc Draws all snackbars

snackbar_mouseon = false

for (var i = 0; i < snackbar_amount; i++)
	snackbar_draw(snackbar_list[|i])

/// color_multiply(color1, color2)
/// @arg color1
/// @arg color2

function color_multiply(col1, col2)
{
	return make_color_rgb((color_get_red(col1) / 255) * (color_get_red(col2) / 255) * 255, 
						  (color_get_green(col1) / 255) * (color_get_green(col2) / 255) * 255, 
						  (color_get_blue(col1) / 255) * (color_get_blue(col2) / 255) * 255)
}

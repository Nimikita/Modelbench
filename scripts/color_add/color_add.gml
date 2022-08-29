/// color_add(color1, color2)
/// @arg color1
/// @arg color2

function color_add(col1, col2)
{
	return make_color_rgb(min(255, color_get_red(col1) + color_get_red(col2)), 
						  min(255, color_get_green(col1) + color_get_green(col2)), 
						  min(255, color_get_blue(col1) + color_get_blue(col2)))
}

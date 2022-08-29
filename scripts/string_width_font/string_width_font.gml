/// string_width_font(string, font)
/// @arg string
/// @arg font

function string_width_font(str, font)
{
	var prevfont, width;
	prevfont = draw_get_font()
	width = 0
	
	if (font != prevfont)
	{
		draw_set_font(font)
		width = string_width(str)
		draw_set_font(prevfont)
	}
	else
		width = string_width(str)
	
	return width
}

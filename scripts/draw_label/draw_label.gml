/// draw_label(string, x, y, [halign, valign, [color, alpha, [font, [seperation, width]]]])
/// @arg string
/// @arg x
/// @arg y
/// @arg [halign
/// @arg valign[
/// @arg color
/// @arg alpha[
/// @arg font[
/// @arg seperation[
/// @arg width]]]]

var str, xx, yy, halign, valign, color, alpha, font, seperation, width;
var oldcolor, oldalpha;
str = string_hash_to_newline(argument[0])
xx = argument[1]
yy = argument[2]

if (xx + string_width(str) < 0 || 
	xx > window_width || 
	yy + string_height(str) < 0 || 
	yy > window_height)
	return 0

seperation = -1
width = 99999999

if (argument_count > 3)
{
    halign = argument[3]
    valign = argument[4]
    draw_set_halign(halign)
    draw_set_valign(valign)
}

if (argument_count > 5)
{
    color = argument[5]
    alpha = argument[6]
    if (color != null)
	{
        oldcolor = draw_get_color()
		
		if (color != oldcolor)
			draw_set_color(color)
    }
    if (alpha < 1)
	{
        oldalpha = draw_get_alpha()
		
		if (alpha != oldalpha)
			draw_set_alpha(oldalpha * alpha)
    }
}

if (argument_count > 7)
{
    font = argument[7]
    draw_set_font(font)
	
	if (string_height(str) mod 2 && valign = fa_center)
		yy -= frac(string_height(str) / 2)
	
	if (string_width(str) mod 2 && halign = fa_middle)
		xx -= frac(string_width(str) / 2)	
}

if (argument_count > 8)
{
    seperation = argument[8]
    width = argument[9]
}
	
if (argument_count > 3)
{
	if (halign = fa_middle)
	{
		xx = round(xx - (string_width(str) / 2))
		draw_set_halign(fa_left)
	}
	
	if (valign = fa_center)
	{
		yy = round(yy - (string_height(str) / 2))
		draw_set_valign(fa_top)
	}
}

draw_text_ext(xx, yy, str, seperation, width)

if (argument_count > 3)
{
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
}

if (argument_count > 5)
{
    if (color != null)
		if (color != oldcolor)
			draw_set_color(oldcolor)
		
	if (alpha < 1)
		if (alpha != oldalpha)
			draw_set_alpha(oldalpha)
}

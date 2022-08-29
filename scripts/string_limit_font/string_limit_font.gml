/// string_limit_font(string, width, font)
/// @arg string
/// @arg width
/// @arg font
function string_limit_font(str, wid, font)
{
	var nstr, pos;
	
	if (string_width_font("...", font) > wid)
		return ""
	
	if (string_width_font(str, font) <= wid) 
		return str
	
	nstr = ""
	pos = 1
	while (pos <= string_length(str))
	{
		var char = string_char_at(str, pos)
		if (char = "\n")
			char = " "
		
		if (string_width_font(nstr + char + "...", font) >= wid)
			break
		
		nstr += char
		pos++
	}
	
	return nstr + "..."
}

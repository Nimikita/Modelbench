/// string_limit_font(string, width, font)
/// @arg string
/// @arg width
/// @arg font

var str, wid, nstr, pos;
str = argument0
wid = argument1

if (string_width_font("...", argument2) > wid)
	return ""

if (string_width_font(str, argument2) <= wid) 
	return str

nstr = ""
pos = 1
while (pos <= string_length(str))
{
	var char = string_char_at(str, pos)
	if (char = "\n")
		char = " "
		
	if (string_width_font(nstr + char + "...", argument2) >= wid)
		break
	
	nstr += char
	pos++
}

return nstr + "..."

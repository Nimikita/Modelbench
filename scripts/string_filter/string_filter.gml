/// string_filter(str, chars)
/// @arg str
/// @arg chars

var str, chars, newstr, removechar;
str = argument0
chars = argument1
newstr = ""

for (var i = 0; i < string_length(str); i++)
{
	var char = string_char_at(str, i + 1);
	removechar = false
	
	for (var j = 0; j < string_length(chars); j++)
	{
		if (string_char_at(chars, j + 1) = char)
		{
			removechar = true
			break
		}
	}
	
	if (!removechar)
		newstr += char
}

return newstr
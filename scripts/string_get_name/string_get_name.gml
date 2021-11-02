/// string_get_name(str)
/// @arg str
/// @desc Filters " (#)" from the end of a string

var str, strfilter, pos, deletepos;
str = argument0
strfilter = string_filter(str, "1234567890")
pos = string_pos(" ()", strfilter)
deletepos = 0

if (pos = 0 || pos < (string_length(strfilter) - 3))
	return str

for (var i = string_length(str); i > 0; i--)
{
	if (string_char_at(str, i) = " ")
	{
		deletepos = i
		break
	}
}

return string_copy(str, 1, deletepos - 1)
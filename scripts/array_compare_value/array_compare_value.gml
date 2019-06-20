/// array_compare_value(array, value)
/// @arg array
/// @arg value

var arr, value;
arr = argument0
value = argument1

for (var i = 0; i < array_length_1d(arr); i++)
{
	if (arr[i] != value)
		return false
}

return true
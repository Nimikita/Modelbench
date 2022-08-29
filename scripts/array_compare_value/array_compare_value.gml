/// array_compare_value(array, value)
/// @arg array
/// @arg value

function array_compare_value(arr, value)
{
	for (var i = 0; i < array_length(arr); i++)
	{
		if (arr[i] != value)
			return false
	}
	
	return true
}

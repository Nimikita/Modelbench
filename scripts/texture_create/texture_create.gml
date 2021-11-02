/// texture_create(filename, [xorgin, yorgin])
/// @arg filename
/// @arg [xorgin
/// @arg yorgin]

var fname, origin_x, origin_y;
fname = argument[0]

if (argument_count > 1)
{
	origin_x = argument[1]
	origin_y = argument[2]
}
else
{
	origin_x = 0
	origin_y = 0
}

if (!file_exists_lib(fname))
	return texture_create_missing()

return sprite_add_lib(fname, 1, false, false, origin_x, origin_y)
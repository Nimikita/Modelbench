/// vec3(x, y, z)
/// @arg x
/// @arg y
/// @arg z

function vec3(xx, yy = undefined, zz = undefined)
{
	if (yy = undefined)
		return [xx, xx, xx]
	else
		return [xx, yy, zz]
}
/// el_value_clamp(valueid, value, [object])
/// @arg valueid
/// @arg value
/// @arg [object]

var vid, val, object;
vid = argument[0]
val = argument[1]
object = null

if (argument_count > 2)
	object = argument[2]

// Clamp based on object values
if (object != null)
{
	// Invert min/max angle limits
	var minx, maxx, miny, maxy, minz, maxz;
	minx = test(object.value[e_value.BEND_INVERT_X], -object.value[e_value.BEND_X_MAX], object.value[e_value.BEND_X_MIN])
	maxx = test(object.value[e_value.BEND_INVERT_X], -object.value[e_value.BEND_X_MIN], object.value[e_value.BEND_X_MAX])
	miny = test(object.value[e_value.BEND_INVERT_Y], -object.value[e_value.BEND_Y_MAX], object.value[e_value.BEND_Y_MIN])
	maxy = test(object.value[e_value.BEND_INVERT_Y], -object.value[e_value.BEND_Y_MIN], object.value[e_value.BEND_Y_MAX])
	minz = test(object.value[e_value.BEND_INVERT_Z], -object.value[e_value.BEND_Z_MAX], object.value[e_value.BEND_Z_MIN])
	maxz = test(object.value[e_value.BEND_INVERT_Z], -object.value[e_value.BEND_Z_MIN], object.value[e_value.BEND_Z_MAX])
	
	switch (vid)
	{
		case e_value.BEND_ANGLE_X: return clamp(val, minx, maxx)
		case e_value.BEND_ANGLE_Y: return clamp(val, miny, maxy)
		case e_value.BEND_ANGLE_Z: return clamp(val, minz, maxz)
		
		case e_value.BEND_X_MIN: return clamp(val, -no_limit, object.value[e_value.BEND_X_MAX])
		case e_value.BEND_X_MAX: return clamp(val, object.value[e_value.BEND_X_MIN], no_limit)
		
		case e_value.BEND_Y_MIN: return clamp(val, -no_limit, object.value[e_value.BEND_Y_MAX])
		case e_value.BEND_Y_MAX: return clamp(val, object.value[e_value.BEND_Y_MIN], no_limit)
		
		case e_value.BEND_Z_MIN: return clamp(val, -no_limit, object.value[e_value.BEND_Z_MAX])
		case e_value.BEND_Z_MAX: return clamp(val, object.value[e_value.BEND_Z_MIN], no_limit)
	}
}

return val
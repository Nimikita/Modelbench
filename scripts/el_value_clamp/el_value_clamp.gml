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

switch (vid)
{
	case e_value.POS_X:
	case e_value.POS_Y:
	case e_value.POS_Z:
	case e_value.OFFSET_X:
	case e_value.OFFSET_Y:
	case e_value.OFFSET_Z:
	case e_value.WIDTH:
	case e_value.LENGTH:
	case e_value.HEIGHT: return clamp(val, -world_size, world_size)
	
	case e_value.SCA_X:
	case e_value.SCA_Y:
	case e_value.SCA_Z: return clamp(val, 0.001, world_size)
	
	case e_value.BEND_SIZE: return clamp(val, 0, no_limit)
	
	case e_value.MIX_AMOUNT:
	case e_value.OPACITY:
	case e_value.BRIGHTNESS: return clamp(val, 0, 1)
	
	case e_value.BLEND_COLOR:
	case e_value.MIX_COLOR: return clamp(val, c_black, c_white)
}

return clamp(val, -no_limit, no_limit)
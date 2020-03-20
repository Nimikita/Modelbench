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
	switch (vid)
	{
		case e_value.BEND_ANGLE_X: return clamp(val, object.value[e_value.BEND_X_MIN], object.value[e_value.BEND_X_MAX])
		case e_value.BEND_ANGLE_Y: return clamp(val, object.value[e_value.BEND_Y_MIN], object.value[e_value.BEND_Y_MAX])
		case e_value.BEND_ANGLE_Z: return clamp(val, object.value[e_value.BEND_Z_MIN], object.value[e_value.BEND_Z_MAX])
		
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
	case e_value.SCA_Z: return clamp(val, snap_min, world_size)
	
	case e_value.BEND_SIZE: return clamp(val, 0, no_limit)
	
	case e_value.MIX_AMOUNT:
	case e_value.OPACITY:
	case e_value.BRIGHTNESS: return clamp(val, 0, 1)
	
	case e_value.BLEND_COLOR:
	case e_value.MIX_COLOR: return clamp(val, c_black, c_white)
}

return clamp(val, -no_limit, no_limit)
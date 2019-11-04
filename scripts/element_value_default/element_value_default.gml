/// element_value_default(valueid)
/// @arg valueid

switch (argument0)
{
	case e_value.SCA_X:
	case e_value.SCA_Y:
	case e_value.SCA_Z: return 1
	
	// Color
	case e_value.INHERIT_COLOR: return true
	case e_value.OPACITY: return 1
	case e_value.BLEND_COLOR: return c_white
	case e_value.MIX_COLOR: return c_black
	
	// Bend
	/*
	case e_value.BEND_OFFSET:
	case e_value.BEND_AXIS_X:
	case e_value.BEND_AXIS_Y:
	case e_value.BEND_AXIS_Z:*/
	
	case e_value.BEND:
	case e_value.BEND_SHAPE:
	case e_value.BEND_LOCK: return true
	case e_value.BEND_X_MIN:
	case e_value.BEND_Y_MIN:
	case e_value.BEND_Z_MIN: return -180
	case e_value.BEND_X_MAX:
	case e_value.BEND_Y_MAX:
	case e_value.BEND_Z_MAX: return 180
	case e_value.BEND_PART: return e_part.UPPER
	case e_value.BEND_SIZE: return 4
	
	// Shape UV
	case e_value.UV_X:
	case e_value.UV_Y: return 16
	case e_value.OFFSET_X: 
	case e_value.OFFSET_Y: return -8
	case e_value.WIDTH:
	case e_value.HEIGHT:
	case e_value.LENGTH: return 16
	
	
	// Wind
	case e_value.WIND_AXIS: return e_vertex_wave.NONE
	
	// Misc
	case e_value.TEXTURE_OBJ: return null
}

return 0
/// el_value_update_vbuffer(vid)
/// @arg vid
/// @desc Checks if shape vbuffers should be updated based on a value

switch (argument0)
{
	case e_value.POS_X:
	case e_value.POS_Y:
	case e_value.POS_Z:
	
	case e_value.ROT_X:
	case e_value.ROT_Y:
	case e_value.ROT_Z:
	
	case e_value.SCA_X:
	case e_value.SCA_Y:
	case e_value.SCA_Z:
	
	case e_value.BEND_SHAPE:
	case e_value.BEND_LOCK:
	case e_value.BEND_OFFSET:
	case e_value.BEND_SIZE_CUSTOM:
	case e_value.BEND_SIZE:
	case e_value.BEND_PART:
	case e_value.BEND_AXIS_X:
	case e_value.BEND_AXIS_Y:
	case e_value.BEND_AXIS_Z:
	case e_value.BEND_X_MIN:
	case e_value.BEND_Y_MIN:
	case e_value.BEND_Z_MIN:
	case e_value.BEND_X_MAX:
	case e_value.BEND_Y_MAX:
	case e_value.BEND_Z_MAX:
	case e_value.BEND_INVERT_X:
	case e_value.BEND_INVERT_Y:
	case e_value.BEND_INVERT_Z:
	case e_value.BEND_ANGLE_X:
	case e_value.BEND_ANGLE_Y:
	case e_value.BEND_ANGLE_Z:
	case e_value.INHERIT_BEND:
	
	case e_value.OFFSET_X:
	case e_value.OFFSET_Y:
	case e_value.OFFSET_Z:
	case e_value.WIDTH:
	case e_value.LENGTH:
	case e_value.HEIGHT:
	
	case e_value.UV_X:
	case e_value.UV_Y:
	
	case e_value.INFLATE:
	case e_value.TEX_MIRROR:
	case e_value.INVERT:
	case e_value.FACE_CAMERA:
	case e_value.HOVER:
	case e_value.EXTRUDE:
	case e_value.HIDE_FRONT:
	case e_value.HIDE_BACK:
	
	case e_value.WIND_AXIS:
	case e_value.WIND_ZMIN_ENABLE:
	case e_value.WIND_ZMIN:
	case e_value.WIND_ZMAX_ENABLE:
	case e_value.WIND_ZMAX:
	
	case e_value.TEXTURE_OBJ: return true
}

return false
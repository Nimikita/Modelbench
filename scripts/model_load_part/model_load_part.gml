/// model_load_part(map, root)
/// @arg map
/// @arg root
/// @desc Adds a part from the given map (JSON object) and returns its instance.

function model_load_part(map, root)
{
	// Mine-imator checks for visiblity, name, unique name, and position, Modelbench doesn't
	with (new_obj(obj_model_element))
	{
		element_type = TYPE_PART
		parent = other.id
		
		// Name
		if (is_string(map[?"mb_name"]))
			name = value_get_string(map[?"mb_name"], "")
		else
			name = value_get_string(map[?"name"], "")
		
		// Texture (optional)
		if (is_string(map[?"texture"]))
		{
			texture_name = map[?"texture"]
			
			// Texture size
			texture_size = value_get_point2D(map[?"texture_size"], point2D(16, 16))
			texture_size = vec2(max(texture_size[X], texture_size[Y])) // Make square
			res = model_load_texture(texture_name)
			res.scale = value_get_real(map[?"texture_scale"], 1)
			
			value[e_value.TEXTURE_OBJ] = res
		}
		else
		{
			// Inherit
			texture_name = ""
			texture_size = other.texture_size
			res = other.res
			value[e_value.TEXTURE_OBJ] = null
		}
		
		// Visibility
		hidden = !value_get_real(map[?"visible"], true)
		
		// Locked
		locked = value_get_real(map[?"locked"], false)
		
		// Render depth
		value[e_value.DEPTH] = value_get_real(map[?"depth"], 0)
		part_update_depth()
		
		// Color (optional)
		value[e_value.INHERIT_COLOR] = value_get_real(map[?"color_inherit"], true)
		value[e_value.BLEND_COLOR] = value_get_color(map[?"color_blend"], c_white)
		value[e_value.OPACITY] = value_get_real(map[?"color_alpha"], 1)
		value[e_value.BRIGHTNESS] = value_get_real(map[?"color_brightness"], 0)
		value[e_value.MIX_COLOR] = value_get_color(map[?"color_mix"], c_black)
		value[e_value.MIX_AMOUNT] = value_get_real(map[?"color_mix_percent"], 0)
		
		// Position
		position_noscale = value_get_point3D(map[?"position"])
		value[e_value.POS_X] = position_noscale[X]
		value[e_value.POS_Y] = position_noscale[Y]
		value[e_value.POS_Z] = position_noscale[Z]
		
		position = point3D_mul(position_noscale, other.scale)
		
		// Tab states for Mine-imator frame editor panel
		value[e_value.OPEN_POSITION_TAB] = value_get_real(map[?"show_position"], false)
		
		// Rotation (optional)
		rotation = value_get_point3D(map[?"rotation"], vec3(0))
		value[e_value.ROT_X] = rotation[X]
		value[e_value.ROT_Y] = rotation[Y]
		value[e_value.ROT_Z] = rotation[Z]
		
		// Scale (optional)
		scale = value_get_point3D(map[?"scale"], vec3(1))
		value[e_value.SCA_X] = scale[X]
		value[e_value.SCA_Y] = scale[Y]
		value[e_value.SCA_Z] = scale[Z]
		
		scale = vec3_mul(scale, other.scale)
		
		// Locked to bent half
		value[e_value.BEND_LOCK] = value_get_real(map[?"lock_bend"], true)
		
		// Bend (optional)
		if (!is_undefined(map[?"bend"]))
		{
			var bendmap = map[?"bend"];
			value[e_value.BEND] = true
			
			// Offset
			if (!is_real(bendmap[?"offset"]))
			{
				log("Missing parameter \"offset\"")
				return null
			}
			value[e_value.BEND_OFFSET] = bendmap[?"offset"]
			
			// End offset
			end_offset = value_get_real(bendmap[?"end_offset"], null)
			
			if (end_offset != null)
				value[e_value.BEND_END_OFFSET] = end_offset
			else
				value[e_value.BEND_END_OFFSET] = 0
			
			// Size
			bend_size = value_get_real(bendmap[?"size"], null)
			
			if (bend_size != null)
			{
				value[e_value.BEND_SIZE_CUSTOM] = true
				value[e_value.BEND_SIZE] = bend_size
			}
			else
			{
				value[e_value.BEND_SIZE_CUSTOM] = false
				value[e_value.BEND_SIZE] = 4
			}
			
			// Inherit bend angle(s)
			value[e_value.INHERIT_BEND] = value_get_real(bendmap[?"inherit_bend"], false)
			
			// Directional part
			if (!is_string(bendmap[?"part"]))
			{
				log("Missing parameter \"part\"")
				return null
			}
			
			switch (bendmap[?"part"])
			{
				case "right":	value[e_value.BEND_PART] = e_part.RIGHT;	break
				case "left":	value[e_value.BEND_PART] = e_part.LEFT;		break
				case "front":	value[e_value.BEND_PART] = e_part.FRONT;	break
				case "back":	value[e_value.BEND_PART] = e_part.BACK;		break
				case "upper":	value[e_value.BEND_PART] = e_part.UPPER;	break
				case "lower":	value[e_value.BEND_PART] = e_part.LOWER;	break
				default:
					log("Invalid parameter \"part\"")
					return null
			}
			
			// Bend axis
			bend_axis = array(false, false, false)
			var axis = array();
			if (is_string(bendmap[?"axis"])) // Single
			{
				switch (bendmap[?"axis"])
				{
					case "x":	bend_axis[X] = true; array_add(axis, X);	break
					case "z":	bend_axis[Y] = true; array_add(axis, Y);	break
					case "y":	bend_axis[Z] = true; array_add(axis, Z);	break
					default:
						log("Invalid parameter \"axis\"")
						return null
				}
			}
			else if (ds_list_valid(bendmap[?"axis"])) // Multi
			{
				for (var i = 0; i < ds_list_size(bendmap[?"axis"]); i++)
				{
					switch (ds_list_find_value(bendmap[?"axis"], i))
					{
						case "x":	bend_axis[X] = true; array_add(axis, X);	break
						case "z":	bend_axis[Y] = true; array_add(axis, Y);	break
						case "y":	bend_axis[Z] = true; array_add(axis, Z);	break
						default:
							log("Invalid parameter \"axis\"")
							return null
					}
				}
			}
			else
			{
				log("Missing parameter \"axis\"")
				return null
			}
			value[e_value.BEND_AXIS_X] = bend_axis[X]
			value[e_value.BEND_AXIS_Y] = bend_axis[Y]
			value[e_value.BEND_AXIS_Z] = bend_axis[Z]
			
			// Bend range(Minimum)
			bend_direction_min = vec3(-180)
			if (is_real(bendmap[?"direction_min"]) && array_length(axis) = 1) // Single
			{
				bend_direction_min[axis[0]] = bendmap[?"direction_min"]
			}
			else if (ds_list_valid(bendmap[?"direction_min"])) // Multi
			{
				for (var i = 0; i < ds_list_size(bendmap[?"direction_min"]); i++)
					bend_direction_min[axis[i]] = ds_list_find_value(bendmap[?"direction_min"], i)
			}
			
			// Bend range(Maximum)
			bend_direction_max = vec3(180)
			if (is_real(bendmap[?"direction_max"]) && array_length(axis) = 1) // Single
			{
				bend_direction_max[axis[0]] = bendmap[?"direction_max"]
			}
			else if (ds_list_valid(bendmap[?"direction_max"])) // Multi
			{
				for (var i = 0; i < ds_list_size(bendmap[?"direction_max"]); i++)
					bend_direction_max[axis[i]] = ds_list_find_value(bendmap[?"direction_max"], i)
			}
			
			// Bend direction(Legacy)
			bend_direction = array(0, 0, 0)
			bend_direction_legacy = false
			if (is_string(bendmap[?"direction"])) // Single
			{
				switch (bendmap[?"direction"])
				{
					case "forward":		bend_direction[axis[0]] = e_bend.FORWARD;	break
					case "backward":	bend_direction[axis[0]] = e_bend.BACKWARD;	break
					case "both":		bend_direction[axis[0]] = e_bend.BOTH;		break
					default:
						log("Invalid parameter \"direction\"")
						return null
				}
				bend_direction_legacy = true
			}
			else if (ds_list_valid(bendmap[?"direction"])) // Multi
			{
				for (var i = 0; i < ds_list_size(bendmap[?"direction"]); i++)
				{
					switch (ds_list_find_value(bendmap[?"direction"], i))
					{
						case "forward":		bend_direction[axis[i]] = e_bend.FORWARD;	break
						case "backward":	bend_direction[axis[i]] = e_bend.BACKWARD;	break
						case "both":		bend_direction[axis[i]] = e_bend.BOTH;		break
						default:
							log("Invalid parameter \"direction\"")
							return null
					}
					bend_direction_legacy = true
				}
			}
			
			// Invert bend angle
			bend_invert = vec3(false)
			if ((is_real(bendmap[?"invert"]) || is_bool(bendmap[?"invert"])) && array_length(axis) = 1) // Single
			{
				bend_invert[axis[0]] = bendmap[?"invert"]
			}
			else if (ds_list_valid(bendmap[?"invert"])) // Multi
			{
				for (var i = 0; i < ds_list_size(bendmap[?"invert"]); i++)
					bend_invert[axis[i]] = ds_list_find_value(bendmap[?"invert"], i)
			}		
			value[e_value.BEND_INVERT_X] = bend_invert[X]
			value[e_value.BEND_INVERT_Y] = bend_invert[Y]
			value[e_value.BEND_INVERT_Z] = bend_invert[Z]
			
			// Convert legacy direction to limits
			if (bend_direction_legacy)
			{
				for (var i = X; i <= Z; i++)
				{
					if (bend_direction[i] = e_bend.BOTH)
					{
						value[e_value.BEND_X_MIN + i] = -180
						value[e_value.BEND_X_MAX + i] = 180
					}
					else if (bend_direction[i] = e_bend.FORWARD)
					{
						value[e_value.BEND_X_MIN + i] = 0
						value[e_value.BEND_X_MAX + i] = 180
						value[e_value.BEND_INVERT_X + i] = !value[e_value.BEND_INVERT_X + i] // FORWARD previously inverted angle
					}
					else
					{
						value[e_value.BEND_X_MIN + i] = 0
						value[e_value.BEND_X_MAX + i] = 180
					}
					
					bend_direction_min[i] = value[e_value.BEND_X_MIN + i]
					bend_direction_max[i] = value[e_value.BEND_X_MAX + i]
				}
			}
			else
			{
				// Copy into values
				for (var i = 0; i < 3; i++)
				{
					value[e_value.BEND_X_MIN + i] = bend_direction_min[i]
					value[e_value.BEND_X_MAX + i] = bend_direction_max[i]
				}
			}
			
			// Bend angle
			bend_default_angle = vec3(0)
			if (is_real(bendmap[?"angle"]) && array_length(axis) = 1) // Single
			{
				bend_default_angle[axis[0]] = bendmap[?"angle"]
			}
			else if (ds_list_valid(bendmap[?"angle"])) // Multi
			{
				for (var i = 0; i < ds_list_size(bendmap[?"angle"]); i++)
					bend_default_angle[axis[i]] = ds_list_find_value(bendmap[?"angle"], i)
			}
			value[e_value.BEND_ANGLE_X] = bend_default_angle[X]
			value[e_value.BEND_ANGLE_Y] = bend_default_angle[Y]
			value[e_value.BEND_ANGLE_Z] = bend_default_angle[Z]
		}
		else
		{
			value[e_value.BEND] = false
			value[e_value.BEND_OFFSET] = 0
			value[e_value.BEND_END_OFFSET] = 0
			
			value[e_value.BEND_SIZE_CUSTOM] = false
			value[e_value.BEND_SIZE] = 4
			value[e_value.INHERIT_BEND] = false
			
			value[e_value.BEND_PART] = e_part.RIGHT
			
			value[e_value.BEND_AXIS_X] = false
			value[e_value.BEND_AXIS_Y] = false
			value[e_value.BEND_AXIS_Z] = false
			
			value[e_value.BEND_INVERT_X] = false
			value[e_value.BEND_INVERT_Y] = false
			value[e_value.BEND_INVERT_Z] = false
			
			value[e_value.BEND_ANGLE_X] = 0
			value[e_value.BEND_ANGLE_Y] = 0
			value[e_value.BEND_ANGLE_Z] = 0
		}
		
		// Add shapes (optional)
		var shapelist = map[?"shapes"]
		shape_list = ds_list_create()
		if (ds_list_valid(shapelist))
		{
			for (var p = 0; p < ds_list_size(shapelist); p++)
			{
				var shape = model_load_shape(shapelist[|p]);
				if (shape = null) // Something went wrong
					return null
				if (shape > 0)
					ds_list_add(shape_list, shape)
			}
		}
		
		// Recursively add parts (optional)
		var partlist = map[?"parts"]
		part_list = ds_list_create()
		if (ds_list_valid(partlist))
		{
			for (var p = 0; p < ds_list_size(partlist); p++)
			{
				var part = model_load_part(partlist[|p], root)
				if (part = null) // Something went wrong
					return null
				if (part > 0)
					ds_list_add(part_list, part)
			}
		}
		
		return id
	}
}

/// model_load_part(map, root)
/// @arg map
/// @arg root
/// @desc Adds a part from the given map (JSON object) and returns its instance.

var map, root;
map = argument0
root = argument1

// Mine-imator checks for visiblity, name, unique name, and position, Modelbench doesn't

with (new(obj_model_element))
{
	element_type = TYPE_PART
	parent = other.id
	
	// Name
	name = map[?"name"]
	
	// Texture (optional)
	if (is_string(map[?"texture"]))
	{
		texture_name = map[?"texture"]
		texture_inherit = id
		
		// Texture size
		texture_size = value_get_point2D(map[?"texture_size"], point2D(16, 16))
		texture_size = vec2(max(texture_size[X], texture_size[Y])) // Make square
		
		res = model_load_texture(texture_name)
		
		value[e_value.INHERIT_TEXTURE] = false
	}
	else
	{
		// Inherit
		texture_name = ""
		texture_inherit = other.texture_inherit
		texture_size = texture_inherit.texture_size
		res = other.res
		
		value[e_value.INHERIT_TEXTURE] = true
	}
	
	// Render depth
	depth = value_get_real(map[?"depth"], 0)
	part_update_depth()
	
	// Color (optional)
	value[e_value.INHERIT_COLOR] = value_get_real(map[?"color_inherit"], true)
	value[e_value.BLEND_COLOR] = value_get_color(map[?"color_blend"], c_white)
	value[e_value.OPACITY] = value_get_real(map[?"color_alpha"], 1)
	value[e_value.BRIGHTNESS] = value_get_real(map[?"color_brightness"], 0)
	value[e_value.MIX_COLOR] = value_get_color(map[?"color_mix"], c_black)
	value[e_value.MIX_PERCENT] = value_get_real(map[?"color_mix_percent"], 0)
	
	// Position
	position_noscale = value_get_point3D(map[?"position"])
	value[e_value.POS_X] = position_noscale[X]
	value[e_value.POS_Y] = position_noscale[Y]
	value[e_value.POS_Z] = position_noscale[Z]
	
	if (other.object_index = app)
		position = point3D_mul(position_noscale, other.root_scale)
	else
		position = point3D_mul(position_noscale, other.scale)
	
	// Position tab state for Mine-imator frame editor panel
	value[e_value.SHOW_POSITION_TAB] = value_get_real(map[?"show_position"], false)
	
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
	
	if (other.object_index = app)
		scale = vec3_mul(scale, other.root_scale)
	else
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
			value[e_value.BEND_SIZE] = 0
		}
		
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
		
		// Bend direction
		bend_direction = array(0, 0, 0)
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
			}
		}
		else
		{
			log("Missing parameter \"direction\"")
			return null
		}
		value[e_value.BEND_DIR_X] = bend_direction[X]
		value[e_value.BEND_DIR_Y] = bend_direction[Y]
		value[e_value.BEND_DIR_Z] = bend_direction[Z]
		
		// Invert bend angle
		bend_invert = vec3(false)
		if (is_real(bendmap[?"invert"]) && array_length_1d(axis) = 1) // Single
		{
			bend_invert = vec3(bendmap[?"invert"])
		}
		else if (ds_list_valid(bendmap[?"invert"])) // Multi
		{
			for (var i = 0; i < ds_list_size(bendmap[?"invert"]); i++)
				bend_invert[axis[i]] = ds_list_find_value(bendmap[?"invert"], i)
		}		
		
		value[e_value.BEND_INVERT_X] = bend_invert[X]
		value[e_value.BEND_INVERT_Y] = bend_invert[Y]
		value[e_value.BEND_INVERT_Z] = bend_invert[Z]
		
		// Bend angle
		bend_default_angle = vec3(0)
		if (is_real(bendmap[?"angle"]) && array_length_1d(axis) = 1) // Single
		{
			bend_default_angle = vec3(bendmap[?"angle"])
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
		
		value[e_value.BEND_SIZE_CUSTOM] = false
		value[e_value.BEND_SIZE] = 0

		value[e_value.BEND_PART] = e_part.RIGHT
		
		value[e_value.BEND_AXIS_X] = false
		value[e_value.BEND_AXIS_Y] = false
		value[e_value.BEND_AXIS_Z] = false
		
		value[e_value.BEND_DIR_X] = e_bend.BOTH
		value[e_value.BEND_DIR_Y] = e_bend.BOTH
		value[e_value.BEND_DIR_Z] = e_bend.BOTH
		
		value[e_value.BEND_INVERT_X] = false
		value[e_value.BEND_INVERT_Y] = false
		value[e_value.BEND_INVERT_Z] = false
		
		value[e_value.BEND_ANGLE_X] = 0
		value[e_value.BEND_ANGLE_Y] = 0
		value[e_value.BEND_ANGLE_Z] = 0
	}
	
	// Add shapes (optional)
	var shapelist = map[?"shapes"]
	if (ds_list_valid(shapelist))
	{
		shape_list = ds_list_create()
		for (var p = 0; p < ds_list_size(shapelist); p++)
		{
			var shape = model_load_shape(shapelist[|p]);
			if (shape = null) // Something went wrong
				return null
			if (shape > 0)
				ds_list_add(shape_list, shape)
		}
	}
	else
		shape_list = null
	
	// Recursively add parts (optional)
	var partlist = map[?"parts"]
	if (ds_list_valid(partlist))
	{
		part_list = ds_list_create()
		for (var p = 0; p < ds_list_size(partlist); p++)
		{
			var part = model_load_part(partlist[|p], root)
			if (part = null) // Something went wrong
				return null
			if (part > 0)
				ds_list_add(part_list, part)
		}
	}
	else
		part_list = null
	
	return id
}
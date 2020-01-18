/// model_load_shape(map)
/// @arg map
/// @desc Adds a shape from the given map (JSON object)

var map = argument0;

// Mine-imator checks for visibility, Modelbench doesn't

// Check required fields
if (!is_string(map[?"type"]))
{
	log("Missing parameter \"type\"")
	return null
}

if (!ds_list_valid(map[?"from"]))
{
	log("Missing array \"from\"")
	return null
}

if (!ds_list_valid(map[?"to"]))
{
	log("Missing array \"to\"")
	return null
}

if (!ds_list_valid(map[?"uv"]))
{
	log("Missing array \"uv\"")
	return null
}

with (new(obj_model_element))
{
	element_type = TYPE_SHAPE
	
	// Set parent/part
	parent = other.id
	
	// Type
	type = map[?"type"]
	
	// Description (optional)
	name = value_get_string(map[?"description"], "")
	
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
		value[e_value.TEXTURE_OBJ] = null
		res = other.res
	}
	
	// Visibility
	hidden = !value_get_real(map[?"visible"], true)
	
	// Locked
	locked = value_get_real(map[?"locked"], false)
	
	// Color (optional)
	value[e_value.INHERIT_COLOR] = value_get_real(map[?"color_inherit"], true)
	value[e_value.BLEND_COLOR] = value_get_color(map[?"color_blend"], c_white)
	value[e_value.OPACITY] = value_get_real(map[?"color_alpha"], 1)
	value[e_value.BRIGHTNESS] = value_get_real(map[?"color_brightness"], 0)
	value[e_value.MIX_COLOR] = value_get_color(map[?"color_mix"], c_black)
	value[e_value.MIX_AMOUNT] = value_get_real(map[?"color_mix_percent"], 0)
	
	// Mirror (optional)
	value[e_value.TEX_MIRROR] = value_get_real(map[?"texture_mirror"], false)
	
	// Invert (optional)
	value[e_value.INVERT] = value_get_real(map[?"invert"], false)
	
	// Hide front/back plane faces
	value[e_value.HIDE_FRONT] = value_get_real(map[?"hide_front"], false)
	value[e_value.HIDE_BACK] = value_get_real(map[?"hide_back"], false)
	
	// Hide backface (old name)
	if (is_real(map[?"hide_backface"]))
		value[e_value.HIDE_BACK] = map[?"hide_backface"]
	
	// Face camera (optional, overrides rotation when rendering)
	value[e_value.FACE_CAMERA] = value_get_real(map[?"face_camera"], false)
	
	// Item bounce (optional)
	value[e_value.HOVER] = value_get_real(map[?"item_bounce"], false)
	
	// From/To
	from_noscale = value_get_point3D(map[?"from"])
	to_noscale = value_get_point3D(map[?"to"])
	if (type = "plane")
		to_noscale[Y] = from_noscale[Y]
	
	value[e_value.FROM_X] = from_noscale[X]
	value[e_value.FROM_Y] = from_noscale[Y]
	value[e_value.FROM_Z] = from_noscale[Z]
	
	value[e_value.TO_X] = to_noscale[X]
	value[e_value.TO_Y] = to_noscale[Y]
	value[e_value.TO_Z] = to_noscale[Z]
	
	// Inflate (optional)
	value[e_value.INFLATE] = value_get_real(map[?"inflate"], 0)
	inflate = vec3(value[e_value.INFLATE])
	
	// Position (optional)
	position_noscale = value_get_point3D(map[?"position"], point3D(0, 0, 0))
	value[e_value.POS_X] = position_noscale[X]
	value[e_value.POS_Y] = position_noscale[Y]
	value[e_value.POS_Z] = position_noscale[Z]
	
	position = point3D_mul(position_noscale, other.scale)
	
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
	
	value[e_value.OFFSET_X] = from_noscale[X]
	value[e_value.OFFSET_Y] = from_noscale[Y]
	value[e_value.OFFSET_Z] = from_noscale[Z]
	value[e_value.WIDTH] = to_noscale[X] - from_noscale[X]
	value[e_value.LENGTH] = to_noscale[Y] - from_noscale[Y]
	value[e_value.HEIGHT] = to_noscale[Z] - from_noscale[Z]
	
	scale = vec3_mul(scale, other.scale)
	from = point3D_mul(point3D_sub(from_noscale, inflate), scale)
	to = point3D_mul(point3D_add(to_noscale, inflate), scale)
	
	// 3D plane (optional)
	value[e_value.EXTRUDE] = value_get_real(map[?"3d"], false)
	
	// Bending
	value[e_value.BEND_SHAPE] = value_get_real(map[?"bend"], true)
	
	// Create matrix
	matrix = matrix_create(position, vec3(0), vec3(1))
	
	// UV
	uv = value_get_point2D(map[?"uv"])
	value[e_value.UV_X] = uv[X]
	value[e_value.UV_Y] = uv[Y]
	
	// Wind
	value[e_value.WIND_AXIS] = e_vertex_wave.NONE
	value[e_value.WIND_ZMIN_ENABLE] = false
	value[e_value.WIND_ZMAX_ENABLE] = false
	value[e_value.WIND_ZMIN] = 0
	value[e_value.WIND_ZMAX] = 0
	
	var windmap = map[?"wind"];
	if (ds_map_valid(windmap))
	{	
		if (is_string(windmap[?"axis"]))
		{
			if (windmap[?"axis"] = "y")
				value[e_value.WIND_AXIS] = e_vertex_wave.Z_ONLY
			else
				value[e_value.WIND_AXIS] = e_vertex_wave.ALL
		}
		
		if (is_real(windmap[?"ymin"]))
		{
			value[e_value.WIND_ZMIN_ENABLE] = true
			value[e_value.WIND_ZMIN] = windmap[?"ymin"]
		}
		
		if (is_real(windmap[?"ymax"]))
		{
			value[e_value.WIND_ZMAX_ENABLE] = true
			value[e_value.WIND_ZMAX] = windmap[?"ymax"]
		}
	}
	
	// Generate default mesh
	if (type = "block")
		shape_vbuffer = null//model_shape_generate_block(vec3(0))
	else if (type = "plane")
		shape_vbuffer = null//model_shape_generate_plane(vec3(0))
	else
	{
		shape_vbuffer = null
		log("Invalid shape type", type)
		return null
	}
	
	update_vbuffer = true
	
	return id
}
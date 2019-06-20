/// el_update_part()
/// @desc Updates part generation values based on edit values

// Position(No scale)
position_noscale = point3D(value[e_value.POS_X], value[e_value.POS_Y], value[e_value.POS_Z])

// Position
if (other.object_index = app)
	position = point3D_mul(position_noscale, other.root_scale)
else
	position = point3D_mul(position_noscale, other.scale)

// Rotation
rotation = point3D(value[e_value.ROT_X], value[e_value.ROT_Y], value[e_value.ROT_Z])

// Scale
scale = point3D(value[e_value.SCA_X], value[e_value.SCA_Y], value[e_value.SCA_Z])

if (other.object_index = app)
	scale = vec3_mul(scale, other.root_scale)
else
	scale = vec3_mul(scale, other.scale)

// Colors
color_inherit = value[e_value.INHERIT_COLOR]
color_blend = value[e_value.BLEND_COLOR]
color_alpha = value[e_value.OPACITY]
color_brightness = value[e_value.BRIGHTNESS]
color_mix = value[e_value.MIX_COLOR]
color_mix_percent = value[e_value.MIX_PERCENT]

if (other.object_index != app && color_inherit)
{
	color_blend = color_multiply(color_blend, other.color_blend)
	color_alpha *= other.color_alpha
	color_brightness = clamp(color_brightness + other.color_brightness, 0, 1)
	color_mix = color_add(color_mix, other.color_mix)
	color_mix_percent = clamp(color_mix_percent + other.color_mix_percent, 0, 1)
}

// Lock bend
lock_bend = value[e_value.BEND_LOCK]
if (other.object_index = obj_model_element && other.element_type = TYPE_PART && other.value[e_value.BEND])
{	
	if (lock_bend)
	{
		switch (other.value[e_value.BEND_PART])
		{
			case e_part.LEFT:
			case e_part.RIGHT:
					position[X] -= other.bend_offset
				break
					
			case e_part.BACK:
			case e_part.FRONT:
					position[Y] -= other.bend_offset
				break
					
			case e_part.LOWER:
			case e_part.UPPER:
					position[Z] -= other.bend_offset
				break
		}
	}
}

// Bend
bend_offset = value[e_value.BEND_OFFSET]

if (value[e_value.BEND_SIZE_CUSTOM])
	bend_size = value[e_value.BEND_SIZE]
else
	bend_size = null

bend_part = value[e_value.BEND_PART]

switch (bend_part)
{
	case e_part.RIGHT:	bend_offset *= scale[X];	if (bend_size != null) bend_size *= scale[X]; break;
	case e_part.LEFT:	bend_offset *= scale[X];	if (bend_size != null) bend_size *= scale[X]; break;
	case e_part.FRONT:	bend_offset *= scale[Y];	if (bend_size != null) bend_size *= scale[Y]; break;
	case e_part.BACK:	bend_offset *= scale[Y];	if (bend_size != null) bend_size *= scale[Y]; break;
	case e_part.UPPER:	bend_offset *= scale[Z];	if (bend_size != null) bend_size *= scale[Z]; break;
	case e_part.LOWER:	bend_offset *= scale[Z];	if (bend_size != null) bend_size *= scale[Z]; break;
}

bend_axis = point3D(value[e_value.BEND_AXIS_X], value[e_value.BEND_AXIS_Y], value[e_value.BEND_AXIS_Z])
bend_direction = point3D(value[e_value.BEND_DIR_X], value[e_value.BEND_DIR_Y], value[e_value.BEND_DIR_Z])
bend_invert = point3D(value[e_value.BEND_INVERT_X], value[e_value.BEND_INVERT_Y], value[e_value.BEND_INVERT_Z])
bend_default_angle = point3D(value[e_value.BEND_ANGLE_X], value[e_value.BEND_ANGLE_Y], value[e_value.BEND_ANGLE_Z])

// Calcualte matrix
if (other.object_index != app && element_type = TYPE_PART)
{
	matrix_parent = array_copy_1d(other.matrix)
		
	// Parent is a body part and we're locked to bended half
	if (lock_bend)
		matrix_parent = matrix_multiply(model_part_get_bend_matrix(other.id, other.bend_default_angle, point3D(0, 0, 0)), matrix_parent)
}
else
	matrix_parent = MAT_IDENTITY

matrix_parent = matrix_multiply(matrix_create(position, rotation, vec3(1)), matrix_parent)
matrix = array_copy_1d(matrix_parent)

if (shape_list != null)
{
	for (var i = 0; i < ds_list_size(shape_list); i++)
	{
		with (shape_list[|i])
			el_update_shape()
	}
}

if (part_list != null)
{
	for (var i = 0; i < ds_list_size(part_list); i++)
	{
		with (part_list[|i])
			el_update_part()
	}
}
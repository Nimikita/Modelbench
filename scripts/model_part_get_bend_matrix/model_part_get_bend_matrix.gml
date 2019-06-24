/// model_part_get_bend_matrix(part, bend, position, [scale])
/// @arg part
/// @arg bend
/// @arg position
/// @arg scale
/// @desc Returns the transformation matrix for bending. The scale factor is used to combat Z-fighting.

var part, bend, pos, rot, sca;
part = argument[0]
bend = argument[1]
pos = argument[2]

if (argument_count > 3)
	sca = argument[3]
else
	sca = vec3(1)

if (part.bend_part = null && part.value[e_value.BEND])
	return MAT_IDENTITY

// Limit angle
for (var i = X; i <= Z; i++)
{
	if (element_type != TYPE_SHAPE)
	{
		// Invert
		bend[X + i] *= test(part.bend_invert[i], -1, 1)
		bend[X + i] = clamp(bend[X + i], part.bend_direction_min[i], part.bend_direction_max[i])
	}
	
	// Reset if not defined
	if (!part.bend_axis[i])
		bend[i] = 0
}

// Get position
switch (part.bend_part)
{
	case e_part.RIGHT: case e_part.LEFT:
		pos[X] = part.bend_offset
		if (element_type = TYPE_SHAPE)
			pos[X] -= position[X]
		break
		
	case e_part.FRONT: case e_part.BACK:
		pos[Y] = part.bend_offset
		if (element_type = TYPE_SHAPE)
			pos[Y] -= position[Y]
		break
		
	case e_part.UPPER: case e_part.LOWER:
		pos[Z] = part.bend_offset
		if (element_type = TYPE_SHAPE)
			pos[Z] -= position[Z]
		break
}

// Create matrix
var mat = matrix_build(pos[X], pos[Y], pos[Z], bend[X], bend[Y], bend[Z], sca[X], sca[Y], sca[Z]);

if (element_type = TYPE_SHAPE)
	mat = matrix_multiply(matrix_build(-pos[X], -pos[Y], -pos[Z], rotation[X], rotation[Y], rotation[Z], 1, 1, 1), mat)

return mat
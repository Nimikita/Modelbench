/// model_save_bend()

if (!value[e_value.BEND] || (!value[e_value.BEND_AXIS_X] && !value[e_value.BEND_AXIS_Y] && !value[e_value.BEND_AXIS_Z]))
	return 0

var part, dirmin, dirmax, axis, axisenablearray, axisarray, axismin, axismax, invertarray, anglearray;
axis = null
axisenablearray = array(false, false, false)
axisarray = array()
axismin = array()
axismax = array()
invertarray = array()
anglearray = array()

json_save_object_start("bend")

json_save_var("offset", value[e_value.BEND_OFFSET])

if (value[e_value.BEND_SIZE_CUSTOM])
	json_save_var("size", value[e_value.BEND_SIZE])

switch (value[e_value.BEND_PART])
{
	case e_part.RIGHT:	part = "right";	break;
	case e_part.LEFT:	part = "left";	break;
	case e_part.FRONT:	part = "front";	break;
	case e_part.BACK:	part = "back";	break;
	case e_part.UPPER:	part = "upper";	break;
	case e_part.LOWER:	part = "lower";	break;
}

json_save_var("part", part)

// the FUN part
for (var i = X; i <= Z; i++)
{
	if (value[e_value.BEND_AXIS_X + i])
		axis = array_add(axis, i)
	
	axisenablearray[i] = value[e_value.BEND_AXIS_X + i]
}

var axisedit = X;
var axisstring = array("x", "y", "z");
if (array_length_1d(axis) > 1)
{
	for (var i = 0; i < array_length_1d(axis); i++)
	{
		axisedit = i
		
		// Don't flip "y" and "z" positions for axis array
		if (!(axisenablearray[Y] && axisenablearray[Z]))
		{
			if (axisedit = Y)
				axisedit = Z
			else if (axisedit = Z)
				axisedit = Y
		}
		
		axisarray = array_add(axisarray, axisstring[axisedit])
		
		// Only flip values Y and Z are enabled.
		if (axisenablearray[Y] && axisenablearray[Z])
		{
			if (axisedit = Y)
				axisedit = Z
			else if (axisedit = Z)
				axisedit = Y
		}
		
		axismin = array_add(axismin, value[e_value.BEND_X_MIN + axisedit])
		axismax = array_add(axismax, value[e_value.BEND_X_MAX + axisedit])
		invertarray = array_add(invertarray, value[e_value.BEND_INVERT_X + axisedit])
		anglearray = array_add(anglearray, value[e_value.BEND_ANGLE_X + axisedit])
	}
	
	json_save_var("axis", axisarray)
	
	if (!array_compare_value(axismin, -180))
		json_save_var("direction_min", axismin)
	
	if (!array_compare_value(axismax, 180))
		json_save_var("direction_max", axismax)
	
	if (!array_compare_value(invertarray, false))
		json_save_array_bool("invert", invertarray)
	
	if (!array_compare_value(anglearray, 0))
		json_save_var("angle", anglearray)
}
else
{
	// Bend axis
	if (axis[0] = Y)
		json_save_var("axis", "y")
	else if (axis[0] = Z)
		json_save_var("axis", "z")
	else
		json_save_var("axis", "x")
	
	// Bend direction
	var dirmin = value[e_value.BEND_X_MIN + axis[0]];
	if (dirmin != -180)
		json_save_var("direction_min", dirmin)
	
	var dirmax = value[e_value.BEND_X_MAX + axis[0]];
	if (dirmax != 180)
		json_save_var("direction_max", dirmax)
	
	// Invert
	if (value[e_value.BEND_INVERT_X + axis[0]] = true)
		json_save_var_bool("invert", value[e_value.BEND_INVERT_X + axis[0]])
	
	// Angle
	if (value[e_value.BEND_ANGLE_X + axis[0]] != 0)
		json_save_var("angle", value[e_value.BEND_ANGLE_X + axis[0]])
}

json_save_object_done()
/// model_save_bend()

function model_save_bend()
{
	if (!value[e_value.BEND] || (!value[e_value.BEND_AXIS_X] && !value[e_value.BEND_AXIS_Y] && !value[e_value.BEND_AXIS_Z]))
		return 0
	
	var part;
	
	json_save_object_start("bend")
	
	json_save_var("offset", value[e_value.BEND_OFFSET])
	
	if (value[e_value.BEND_END_OFFSET] != 0)
		json_save_var("end_offset", value[e_value.BEND_END_OFFSET])
	
	if (value[e_value.BEND_SIZE_CUSTOM])
		json_save_var("size", value[e_value.BEND_SIZE])
	
	if (value[e_value.INHERIT_BEND])
		json_save_var("inherit_bend", value[e_value.INHERIT_BEND])
	
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
	
	var axisstring, bendindex, bendaxis, bendinvert, bendmin, bendmax, benddefault, bendflip;
	axisstring = ["x", "z", "y"]
	bendindex = []
	bendaxis = []
	bendinvert = []
	bendmin = []
	bendmax = []
	benddefault = []
	bendflip = (value[e_value.BEND_AXIS_Y] && value[e_value.BEND_AXIS_Z])
	
	// Get values
	for (var i = X; i <= Z; i++)
	{
		var axis = ((i != X && bendflip) ? (i = Y ? Z : Y) : i);
		
		if (value[e_value.BEND_AXIS_X + axis])
		{
			bendindex = array_add(bendindex, axisstring[axis])
			bendaxis = array_add(bendaxis, value[e_value.BEND_AXIS_X + axis])
			bendinvert = array_add(bendinvert, value[e_value.BEND_INVERT_X + axis])
			bendmin = array_add(bendmin, value[e_value.BEND_X_MIN + axis])
			bendmax = array_add(bendmax, value[e_value.BEND_X_MAX + axis])
			benddefault = array_add(benddefault, value[e_value.BEND_ANGLE_X + axis])
		}
	}
	
	// Multi-axis?
	if (array_length(bendindex) > 1)
	{
		json_save_var("axis", bendindex)
		
		if (!array_compare_value(bendmin, -180))
			json_save_var("direction_min", bendmin)
		
		if (!array_compare_value(bendmax, 180))
			json_save_var("direction_max", bendmax)
		
		if (!array_compare_value(bendinvert, false))
			json_save_array_bool("invert", bendinvert)
		
		if (!array_compare_value(benddefault, 0))
			json_save_var("angle", benddefault)
	}
	else // Single axis
	{
		json_save_var("axis", bendindex[0])
		
		// Bend direction
		if (bendmin[0] != -180)
			json_save_var("direction_min", bendmin[0])
		
		if (bendmax[0] != 180)
			json_save_var("direction_max", bendmax[0])
		
		// Invert
		if (bendinvert[0] = true)
			json_save_var_bool("invert", bendinvert[0])
		
		// Angle
		if (benddefault[0] != 0)
			json_save_var("angle", benddefault[0])
	}
	
	json_save_object_done()
}

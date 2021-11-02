/// el_duplicate()
/// @desc Duplicates the given timeline and children. Returns the new one.

copy = new(obj_model_element)
el_copy(copy)

// Change name # based on pre-existing part names
if (element_type = TYPE_PART)
{
	var namefilter, namecount;
	namefilter = string_get_name(name)
	namecount = 0

	with (obj_model_element)
	{
		if (element_type = TYPE_SHAPE)
			continue
		
		if (string_get_name(name) = namefilter)
			namecount++
	}
	
	if (namecount > 0)
		copy.name = namefilter + " (" + string(namecount) + ")"
	else
		copy.name = namefilter
}

with (copy)
{
	root_copy = null
	copy = null
	
	// Copy values
	for (var v = 0; v < e_value.amount; v++)
		value[v] = other.value[v]
	
	if (other.element_type = TYPE_PART)
	{
		part_list = ds_list_create()
		shape_list = ds_list_create()
		
		// Copy shapes
		for (var s = 0; s < ds_list_size(other.shape_list); s++)
		{
			with (other.shape_list[|s])
				ds_list_add(other.shape_list, el_duplicate())
			shape_list[|s].parent = id
		}
	
		// Copy tree structure
		for (var p = 0; p < ds_list_size(other.part_list); p++)
		{
			with (other.part_list[|p])
				ds_list_add(other.part_list, el_duplicate())
			part_list[|p].parent = id
		}
		
		part_update_depth()
	}
	else
		update_vbuffer = true
	
	return id
}
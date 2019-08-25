/// el_duplicate()
/// @desc Duplicates the given timeline and children. Returns the new one.

copy = new(obj_model_element)
el_copy(copy)

with (copy)
{
	root_copy = null
	copy = null
	
	// Copy values
	for (var v = 0; v < e_value.amount; v++)
		value[v] = el_value_find_save_id(v, null, other.value[v])
	
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
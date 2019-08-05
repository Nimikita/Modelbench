/// app_update_name_warning()
/// @desc Updates warning status for parts if their name is found in another part or is empty

warning_empty_part_names = false
warning_same_part_names = false
 
with (obj_model_element)
{
	name_duplicate = false
	name_empty = false
	
	if (element_type = TYPE_SHAPE)
		continue
	
	with (obj_model_element)
	{
		if (element_type = TYPE_SHAPE || id = other)
			continue
			
		if (name = other.name && name != "")
		{
			name_duplicate = true
			other.name_duplicate = true
			app.warning_same_part_names = true
		}
	}
	
	if (name = "")
	{
		app.warning_empty_part_names = true
		name_empty = true
	}
}

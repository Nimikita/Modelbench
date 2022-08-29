/// new_element(type)
/// @arg type

function new_element(argument0)
{
	with (new_obj(obj_model_element))
	{
		if (argument0 > TYPE_PART)
		{
			element_type = TYPE_SHAPE
			update_vbuffer = true
		
			if (argument0 = e_element.PLANE_3D)
				type = "plane"
			else
				type = el_type_name_list[|argument0]
		}
		else
		{
			element_type = TYPE_PART
			part_list = ds_list_create()
			shape_list = ds_list_create()
			el_set_parent_root()
			part_update_depth()
		}
		
		return id
	}
}

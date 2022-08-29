/// element_event_destroy()

function element_event_destroy()
{
	// Remove from render list
	if (element_type = TYPE_PART)
		ds_list_delete_value(render_list, id)
	
	// Remove from parent(If it still exists)
	if (instance_exists(parent))
	{
		if (element_type = TYPE_PART)
			ds_list_delete_value(parent.part_list, id)
		else
			ds_list_delete_value(parent.shape_list, id)
	}
	
	// Clear part and shape lists
	if (shape_list != null)
	{
		while (ds_list_size(shape_list) > 0)
			with (shape_list[|0])
				instance_destroy()
		
		ds_list_destroy(shape_list)
	}
	
	if (part_list != null)
	{
		while (ds_list_size(part_list) > 0)
			with (part_list[|0])
				instance_destroy()
		
		ds_list_destroy(part_list)
	}
	
	// Destroy vbuffer
	if (shape_vbuffer != null)
		vbuffer_destroy(shape_vbuffer)
}

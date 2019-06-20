/// element_event_destroy()

// Remove from render list
if (element_type = TYPE_PART)
	ds_list_delete_value(render_list, id)

// Clear part and shape lists
if (shape_list != null)
{
	for (var s = 0; s < ds_list_size(shape_list); s++)
		with (shape_list[|s])
			instance_destroy()
	
	ds_list_destroy(shape_list)
}

if (part_list != null)
{
	for (var p = 0; p < ds_list_size(part_list); p++)
		with (part_list[|p])
			instance_destroy()
	
	ds_list_destroy(part_list)
}

// Destroy vbuffer
if (shape_vbuffer != null)
	vbuffer_destroy(shape_vbuffer)
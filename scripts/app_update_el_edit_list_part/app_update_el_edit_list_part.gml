/// app_update_el_edit_list_part()

// Add self
if (selected)
	ds_list_add(el_edit_list, id)

// Add shapes
for (var i = 0; i < ds_list_size(shape_list); i++)
{
	with (shape_list[|i])
		if (selected)
			ds_list_add(el_edit_list, id)
}

// Add part shapes to results
if (part_list != null)
{
	for (var i = 0; i < ds_list_size(part_list); i++)
	{
		with (part_list[|i])
			app_update_el_edit_list_part()
	}
}

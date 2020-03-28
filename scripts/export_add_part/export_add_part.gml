/// export_add_part()

ds_list_add(app.export_elements, id)

if (app.export_selection_only)
{
	if (!((selected || parent_is_selected) && app.export_selection_only))
	{
		// Add children to list
		for (var i = 0; i < ds_list_size(part_list); i++)
		{
			with (part_list[|i])
				export_add_part()
		}
	}
}
else
{
	// Add shapes to list
	for (var i = 0; i < ds_list_size(shape_list); i++)
		ds_list_add(app.export_elements, shape_list[|i])
}

// Add children to list
for (var i = 0; i < ds_list_size(part_list); i++)
{
	with (part_list[|i])
		export_add_part()
}

/// action_update_search_part(search)
/// @arg search

var search = argument0;

// Add self to results
if (object_index != app)
{
	var elementname = name = "" ? text_get("assetsnewpart") : name;
	
	if (string_contains(string_upper(elementname), search))
		ds_list_add(app.assets.elements.element_search_list, id)
}

// Add part shapes to results
if (!app.setting_hide_shapes && shape_list != null)
{
	for (var i = 0; i < ds_list_size(shape_list); i++)
	{
		with (shape_list[|i])
		{
			var elementname = name = "" ? text_get("assetsnewshape") : name;
	
			if (string_contains(string_upper(elementname), search))
				ds_list_add(app.assets.elements.element_search_list, id)
		}
	}
}

// Add part shapes to results
if (part_list != null)
{
	for (var i = 0; i < ds_list_size(part_list); i++)
	{
		with (part_list[|i])
			action_update_search_part(search)
	}
}

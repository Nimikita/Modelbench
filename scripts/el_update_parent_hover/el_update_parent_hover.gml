/// el_update_parent_hover()
/// @desc Updates parent_hover variable for self and children.

function el_update_parent_hover()
{
	parent_hover = false
	
	if (object_index != app)
		parent_hover = parent.parent_hover || (id = app.assets.elements.element_hover)
	
	if (shape_list != null)
	{
		for (var s = 0; s < ds_list_size(shape_list); s++)
			with (shape_list[|s])
				el_update_parent_hover()
	}
	
	if (part_list != null)
	{
		for (var p = 0; p < ds_list_size(part_list); p++)
			with (part_list[|p])
				el_update_parent_hover()
	}
}

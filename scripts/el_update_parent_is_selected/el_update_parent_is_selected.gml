/// el_update_parent_is_selected()
/// @desc Updates parent_is_selected variable for self and children.

parent_is_selected = false

if (parent.object_index != app)
	parent_is_selected = (parent.selected || parent.parent_is_selected)

if (shape_list != null)
{
	for (var s = 0; s < ds_list_size(shape_list); s++)
		with (shape_list[|s])
			el_update_parent_is_selected()
}

if (part_list != null)
{
	for (var p = 0; p < ds_list_size(part_list); p++)
		with (part_list[|p])
			el_update_parent_is_selected()
}

/// el_set_parent(parent, [index])
/// @desc Sets the parent
/// @arg parent
/// @arg [index]

function el_set_parent()
{
	if (parent != null)
		ds_list_delete_value(element_get_list(parent, id), id)
	
	parent = argument[0]
	var index;
	if (argument_count > 1 && argument[1] >= 0)
		index = argument[1]
	else
		index = ds_list_size(element_get_list(parent, id))
	
	ds_list_insert(element_get_list(parent, id), index, id)
}

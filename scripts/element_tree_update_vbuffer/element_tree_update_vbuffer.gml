/// element_tree_update_vbuffer(element)
/// @arg element

function element_tree_update_vbuffer(el)
{
	if (el.element_type = TYPE_SHAPE)
	{
		el.update_vbuffer = true
		return 0
	}
	
	if (el.shape_list != null)
		for (var i = 0; i < ds_list_size(el.shape_list); i++)
			el.shape_list[|i].update_vbuffer = true
	
	if (el.part_list != null)
		for (var i = 0; i < ds_list_size(el.part_list); i++)
			element_tree_update_vbuffer(el.part_list[|i])
}

/// element_get_list(parent, child)
/// @arg parent
/// @arg child

function element_get_list(parent, child)
{
	if (child.element_type = TYPE_PART)
		return parent.part_list
	else
		return parent.shape_list
}

/// element_get_list(parent, child)
/// @arg parent
/// @arg child

var parent, child;
parent = argument0
child = argument1

if (child.element_type = TYPE_PART)
	return parent.part_list
else
	return parent.shape_list

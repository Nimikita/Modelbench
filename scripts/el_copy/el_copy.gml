/// el_copy(to)
/// @arg to
/// @desc Copies all the variables into the given object.

var to = argument0;

to.type = type
to.element_type = element_type
to.name = name
to.locked = locked
to.tree_locked = tree_locked
to.hidden = hidden
to.tree_hidden = tree_hidden
to.depth = depth
to.extend = extend

to.parent = parent
if (object_index = obj_model_element)
	to.parent_tree_index = ds_list_find_index(element_get_list(parent, id), id)
else // History object (copy)
	to.parent_tree_index = parent_tree_index


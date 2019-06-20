/// el_update_lock_tree(lock, [root])
/// @arg lock
/// @arg [root]

var lock, root;
lock = argument[0]
root = app

if (argument_count > 1)
	root = argument[1]

if (root.object_index != app)
{
	root.tree_locked = lock
	lock = lock || root.locked
}

if (root.part_list != null)
{
	for (var i = 0; i < ds_list_size(root.part_list); i++)
		el_update_lock_tree(lock, root.part_list[|i])
}

if (root.shape_list != null)
{
	for (var i = 0; i < ds_list_size(root.shape_list); i++)
		root.shape_list[|i].tree_locked = lock
}

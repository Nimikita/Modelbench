/// el_update_hidden_tree(hidden, [root])
/// @arg hidden
/// @arg [root]

function el_update_hidden_tree()
{
	var hidden, root;
	hidden = argument[0]
	root = app
	
	if (argument_count > 1)
		root = argument[1]
	
	if (root.object_index != app)
	{
		root.tree_hidden = hidden
		hidden = hidden || root.hidden
	}
	
	if (root.part_list != null)
	{
		for (var i = 0; i < ds_list_size(root.part_list); i++)
			el_update_hidden_tree(hidden, root.part_list[|i])
	}
	
	if (root.shape_list != null)
	{
		for (var i = 0; i < ds_list_size(root.shape_list); i++)
			root.shape_list[|i].tree_hidden = hidden
	}
}

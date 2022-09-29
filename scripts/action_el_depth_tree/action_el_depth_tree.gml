/// action_el_depth_tree(element, newvalue, add, hobj)
/// @arg element
/// @arg newvalue
/// @arg add
/// @arg hobj

function action_el_depth_tree(el, nval, add, hobj)
{
	with (hobj)
		history_save_var(el, el.value[e_value.DEPTH], el.value[e_value.DEPTH] * add + nval)
	
	el.value[e_value.DEPTH] = el.value[e_value.DEPTH] * add + nval
	with (el)
		part_update_depth()
	
	if (el.part_list != null)
	{
		for (var i = 0; i < ds_list_size(el.part_list); i++)
			if (!el.part_list[|i].selected)
				action_el_depth_tree(el.part_list[|i], nval, add, hobj)
	}
}

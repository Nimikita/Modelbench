/// list_new()

function list_new()
{
	var list = new_obj(obj_list);
	list.item = ds_list_create()
	list.width = 0 // Update using list_update_width
	list.update = false
	list.get_name = false
	list.toggled = false
	list.show_ticks = true
	
	return list
}
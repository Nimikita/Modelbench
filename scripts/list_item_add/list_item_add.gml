/// list_item_add(name, value, [caption, [thumbnail, left_icon, right_icon, script, [divider, [interact]]]])
/// @arg name
/// @arg value
/// @arg [caption
/// @arg [thumbnail
/// @arg left_icon
/// @arg right_icon
/// @arg script
/// @arg [divider
/// @arg [interact]]]]

function list_item_add()
{
	var item, name, value, caption, thumbnail, lefticon, righticon, script, divider, interact;
	name = argument[0]
	value = argument[1]
	
	if (argument_count > 2)
		caption = argument[2]
	else
		caption = ""
	
	thumbnail = null
	lefticon = null
	righticon = null
	script = null
	divider = false
	interact = true
	
	if (argument_count > 3)
	{
		thumbnail = argument[3]
		lefticon = argument[4]
		righticon = argument[5]
		script = argument[6]
	}
	
	if (argument_count > 7)
		divider = argument[7]
	
	if (argument_count > 8)
		interact = argument[8]
	
	item = new_obj(obj_list_item)
	item.name = name
	item.value = value
	item.caption = caption
	item.thumbnail = thumbnail
	item.thumbnail_backdrop = true
	item.thumbnail_blend = c_white
	item.thumbnail_alpha = 1
	
	item.icon_left = lefticon
	item.actions_left = null
	
	item.icon_right = righticon
	item.actions_right = null
	item.script = script
	item.hover = false
	item.divider = divider
	item.disabled = false
	
	item.hovertime = 0
	item.context_menu_name = ""
	item.context_menu_active = false
	item.context_menu_script = null
	item.context_menu_width = 0
	item.context_menu_height = 0
	
	item.draw_x = 0
	item.draw_y = 0
	
	item.interact = interact
	item.indent = 0
	item.toggled = false
	
	if (list_edit != null)
	{
		ds_list_add(list_edit.item, item)
		item.list = list_edit
	}
	else
		item.list = null
	
	list_item_last = item
	
	return item
}

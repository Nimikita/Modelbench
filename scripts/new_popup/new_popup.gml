/// new_popup(name, script, width, height, block, [custom, [revert, [close]]])
/// @arg name
/// @arg script
/// @arg width
/// @arg height
/// @arg block
/// @arg [custom
/// @arg [revert
/// @arg [close]]]

function new_popup()
{
	var popup = new_obj(obj_popup);
	
	popup.name = argument[0]
	popup.script = argument[1]
	popup.width = argument[2]
	popup.height = argument[3]
	popup.block = argument[4]
	popup.caption = text_get(popup.name + "caption")
	popup.offset_x = 0
	popup.offset_y = 0
	
	if (argument_count > 5)
		popup.custom = argument[5]
	else
		popup.custom = false
	
	if (argument_count > 6)
		popup.revert = argument[6]
	else
		popup.revert = false
	
	if (argument_count > 7)
		popup.close_button = argument[7]
	else
		popup.close_button = !popup.custom
	
	if (argument_count > 8)
		popup.closescript = argument[8]
	else
		popup.closescript = null
	
	popup.custom_height = -4
	popup.custom_height_goal = 0
	
	return popup
}

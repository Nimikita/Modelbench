/// new_popup(name, script, width, height, block)
/// @arg name
/// @arg script
/// @arg width
/// @arg height
/// @arg block

function new_popup(name, script, width, height, block)
{
	var popup = new_obj(obj_popup);
	
	popup.name = name
	popup.script = script
	popup.width = width
	popup.height = height
	popup.block = block
	popup.caption = text_get(popup.name + "caption")
	popup.offset_x = 0
	popup.offset_y = 0
	
	return popup
}

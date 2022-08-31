/// draw_scenery_item(x, y, width, height, index)
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg index

function draw_scenery_item(xx, yy, width, height, index)
{
	var mouseon, mouseclick;
	width = floor(width)
	height = floor(height)
	
	if (index > ds_list_size(scenery_list))
		return 0
	
	if (xx + width < content_x || xx > content_x + content_width || yy + height < content_y || yy > content_y + content_height)
		return 0
	
	mouseon = app_mouse_box(xx, yy, width, height) && content_mouseon
	mouseclick = mouseon && mouse_left
	
	if (mouseon)
		mouse_cursor = cr_handpoint
	
	scenery = scenery_list[|index]
	
	microani_set("scenerylistitem" + string(index), null, mouseon, mouseclick, scenery = setting_preview_scenery, 0.5)
	
	draw_box(xx, yy, width, height, false, scenery.background_top, 1)
	draw_gradient(xx, yy, width, height, scenery.background_bottom, 0, 0, 1, 1)
	
	draw_outline(xx, yy, width, height, 2, c_accent, microani_arr[e_microani.ACTIVE], true)
	
	// Use scenery name is available
	var name = "tooltipscenery" + scenery.name;
	if (text_exists(name))
		name = text_get(name)
	else
		name = string_format_snakecase(scenery.name)
	
	tip_set(name, xx, yy, width, height)
	
	// Hover/press animation
	var buttoncolor, buttonalpha;
	buttoncolor = merge_color(c_white, c_black, microani_arr[e_microani.PRESS])
	buttonalpha = lerp(0, .17, microani_arr[e_microani.HOVER] * (1 - microani_arr[e_microani.PRESS]))
	buttonalpha = lerp(buttonalpha, .20, microani_arr[e_microani.PRESS])
	
	draw_box(xx, yy, width, height, false, buttoncolor, buttonalpha)
	draw_box_hover(xx, yy, width, height, microani_arr[e_microani.HOVER])
	
	if (mouseon && mouse_left_released)
		action_preview_scenery(scenery)
	
	microani_update(mouseon, mouseclick, scenery = setting_preview_scenery)
}

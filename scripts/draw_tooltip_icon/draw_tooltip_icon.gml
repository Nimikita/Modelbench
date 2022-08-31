/// draw_tooltip_icon(name, x, y, icon, text)
/// @arg name
/// @arg x
/// @arg y
/// @arg icon
/// @arg text

function draw_tooltip_icon(name, xx, yy, icon, text)
{
	var mouseon;
	mouseon = app_mouse_box(xx - 10, yy - 10, 20, 20) && content_mouseon
	microani_set(name + "tooltip", null, mouseon, false, false)
	
	draw_image(spr_icons, icon, xx, yy, 1, 1, merge_color(c_text_tertiary, c_text_secondary, microani_arr[e_microani.HOVER]), lerp(a_text_tertiary, a_text_secondary, microani_arr[e_microani.HOVER]))
	tip_set(text, xx - 10, yy - 10, 20, 20)
	
	microani_update(mouseon, false, false)
}

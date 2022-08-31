/// draw_panel_buttton(name, x, y, width, height, value, icon, [arrow, [script, [disabled]]])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg value
/// @arg icon
/// @arg [arrow
/// @arg [script
/// @arg [disabled]]]

function draw_panel_buttton()
{
	var name, xx, yy, wid, hei, value, icon, arrow, script, disabled;
	var mouseon;
	name = argument[0]
	xx = argument[1]
	yy = argument[2]
	wid = argument[3]
	hei = argument[4]
	value = argument[5]
	icon = argument[6]
	arrow = false
	script = null
	disabled = false
	
	if (argument_count > 7)
		arrow = argument[7]
	
	if (argument_count > 8)
		script = argument[8]
	
	if (argument_count > 9)
		disabled = argument[9]
	
	mouseon = app_mouse_box(xx, yy, wid, hei) && content_mouseon && !disabled
	
	if (mouseon)
		mouse_cursor = cr_handpoint
	
	microani_set(name, script, mouseon, mouseon && mouse_left, value || (mouseon && mouse_left) || (mouseon && mouse_left_released))
	
	var labelcolor, labelalpha, iconcolor, iconalpha;
	labelcolor = merge_color(c_text_main, c_accent, microani_arr[e_microani.ACTIVE])
	labelcolor = merge_color(labelcolor, c_accent, microani_arr[e_microani.PRESS])
	labelcolor = merge_color(labelcolor, c_text_tertiary, microani_arr[e_microani.DISABLED])
	
	labelalpha = lerp(a_text_main, 1, microani_arr[e_microani.ACTIVE])
	labelalpha = lerp(labelalpha, 1, microani_arr[e_microani.PRESS])
	labelalpha = lerp(labelalpha, a_text_tertiary, microani_arr[e_microani.DISABLED])
	
	iconcolor = merge_color(c_text_tertiary, c_accent, microani_arr[e_microani.ACTIVE])
	iconcolor = merge_color(iconcolor, c_accent, microani_arr[e_microani.PRESS])
	iconcolor = merge_color(iconcolor, c_text_tertiary, microani_arr[e_microani.DISABLED])
	
	iconalpha = lerp(a_text_tertiary, 1, microani_arr[e_microani.ACTIVE])
	iconalpha = lerp(iconalpha, 1, microani_arr[e_microani.PRESS])
	iconalpha = lerp(iconalpha, a_text_tertiary, microani_arr[e_microani.DISABLED])
	
	draw_box(xx, yy, wid, hei, false, c_overlay, a_overlay * clamp(microani_arr[e_microani.ACTIVE] + microani_arr[e_microani.HOVER], 0, 1))
	draw_box(xx, yy, wid, hei, false, c_accent_overlay, a_accent_overlay * microani_arr[e_microani.PRESS])
	
	draw_label(text_get(name), xx + 44, yy + hei/2, fa_left, fa_center, labelcolor, labelalpha, font_value)
	draw_image(spr_icons, icon, xx + 22, yy + hei/2, 1, 1, iconcolor, iconalpha)
	
	if (arrow)
		draw_image(spr_icons, icons.CHEVRON_RIGHT, xx + wid - 22, yy + hei/2, 1, 1, iconcolor, iconalpha)
	
	microani_update(mouseon, mouseon && mouse_left, value || (mouseon && mouse_left_released), disabled)
	
	if (mouseon && mouse_left_released)
	{
		if (script != null)
			script_execute(script)
		
		return true
	}
}

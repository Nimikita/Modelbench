/// draw_checkbox(name, x, y, active, script)
/// @arg name
/// @arg x
/// @arg y
/// @arg active
/// @arg script

function draw_checkbox(name, xx, yy, active, script)
{
	var w, h, caption, mouseon, pressed;
	name = text_get(name)
	caption = text_get(name)
	
	w = dw
	h = 28
	
	if (xx + w < content_x || xx > content_x + content_width || yy + h < content_y || yy > content_y + content_height)
		return 0
	
	// Mouse
	var mouseon, mouseclick;
	mouseon = app_mouse_box(xx, yy, w, h) && content_mouseon && (window_busy = "")
	mouseclick = mouseon && mouse_left
	pressed = false
	
	if (mouseon)
	{
	    if (mouse_left || mouse_left_released)
	        pressed = true
			
	    mouse_cursor = cr_handpoint
	}
	
	// Set micro animation before drawing
	microani_set(argument[0], script, mouseon, mouseclick, active)
	
	var checkboxx, checkboxy;
	checkboxx = (xx + dw - 18) + 9
	checkboxy = yy + (h/2)
	
	var checkboxcolor = merge_color(c_text_secondary, c_accent, microani_arr[e_microani.PRESS]);
	checkboxcolor = merge_color(checkboxcolor, c_accent, microani_arr[e_microani.ACTIVE])
	checkboxcolor = merge_color(checkboxcolor, c_accent_hover, microani_arr[e_microani.ACTIVE] * microani_arr[e_microani.HOVER])
	checkboxcolor = merge_color(checkboxcolor, c_accent_pressed, microani_arr[e_microani.ACTIVE] * microani_arr[e_microani.PRESS])
	
	var checkboxalpha = lerp(a_text_secondary, 1, microani_arr[e_microani.PRESS]);
	checkboxalpha = lerp(checkboxalpha, 1, microani_arr[e_microani.ACTIVE])
	checkboxalpha = lerp(checkboxalpha, a_accent_hover, microani_arr[e_microani.ACTIVE] * microani_arr[e_microani.HOVER])
	checkboxalpha = lerp(checkboxalpha, a_accent_pressed, microani_arr[e_microani.ACTIVE] * microani_arr[e_microani.PRESS])
	
	// Draw checkbox
	draw_image(spr_checkbox, 0, checkboxx, checkboxy, 1, 1, checkboxcolor, checkboxalpha * (1.0 - microani_arr[e_microani.HOVER]))
	draw_image(spr_checkbox, 1, checkboxx, checkboxy, 1, 1, checkboxcolor, checkboxalpha * microani_arr[e_microani.HOVER] * (1.0 - microani_arr[e_microani.ACTIVE]))
	draw_image(spr_checkbox, 2, checkboxx, checkboxy, 1, 1, checkboxcolor, checkboxalpha * microani_arr[e_microani.ACTIVE])
	
	// Draw hover outline
	draw_box_hover(checkboxx - 9, checkboxy - 9, 18, 18, microani_arr[e_microani.HOVER])
	
	// Label
	draw_label(name, xx, yy + (h/2), fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
	
	microani_update(mouseon, mouseclick, active)
	
	// Press
	if (pressed && mouse_left_released)
	{
		if (script != null)
			script_execute(script, !active)
		
		return true
	}
}

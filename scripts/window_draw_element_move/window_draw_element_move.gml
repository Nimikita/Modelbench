/// window_draw_element_move()

function window_draw_element_move()
{
	if (window_busy != "elementmove" || element_move_obj = null)
		return 0
	
	var width = 4 + 20 + 4 + 8 + element_move_width + 8;
	
	dx = mouse_x
	dy = mouse_y
	
	content_x = 0
	content_y = 0
	content_width = window_width
	content_height = window_height
	
	draw_box(dx, dy, width, element_move_obj.elements * 28, false, c_accent_overlay, a_accent_overlay)
	draw_outline(dx, dy, width, element_move_obj.elements * 28, 2, c_accent, 1)
	
	for (var e = 0; e < element_move_obj.elements; e++)
	{
		var element = element_move_obj.elements_list[|e];
		
		var icon;
		if (element.element_type = TYPE_PART)
			icon = icons.PART
		else
		{
			if (element.type = "block")
				icon = icons.CUBE
			else if (element.type = "plane")
			{
				if (element.value[e_value.EXTRUDE])
					icon = (setting_theme.dark ? icons.PLANE_3D__DARK : icons.PLANE_3D)
				else
					icon = icons.PLANE
			}
		}
		
		draw_image(spr_icons, icon, dx + 14, dy + 14, 1, 1, c_text_tertiary, a_text_tertiary)
		draw_label(element_name_get(element), dx + 36, dy + 14, fa_left, fa_middle, c_text_main, a_text_main, font_value)
		dy += 28
	}
}

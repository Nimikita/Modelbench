/// shortcut_draw(shortcut)
/// @arg shortcut
/// @desc Draws shortcut at current dx/dy position and advances

function shortcut_draw(shortcut)
{
	var mouse, yy, padding, imgpadding;
	yy = dy + (dh / 2)
	padding = 10
	imgpadding = 4
	
	// Keyboard shortcut ("0")
	if (shortcut[0] != null)
	{
		var keyboardarray = text_control_name(shortcut[0], true);
		for (var i = 0; i < array_length(keyboardarray); i++)
		{
			var stringsize = string_width_font(keyboardarray[i], font_label);
			
			draw_box(dx, yy - 8, stringsize + 12, 16, false, c_text_tertiary, a_text_tertiary)
			draw_box(dx + 2, yy - 6, stringsize + 8, 12, false, c_level_middle, 1)
			
			draw_label(keyboardarray[i], dx + 6, yy, fa_left, fa_middle, c_text_tertiary, a_text_tertiary, font_label)
			
			dx += (stringsize + 12) + (i < (array_length(keyboardarray) - 1) ? imgpadding : 0)
		}
		
		dx += (shortcut[1] = null ? padding : imgpadding)
	}
	
	// Mouse icon ("1")
	if (shortcut[1] != null)
	{
		switch (shortcut[1])
		{
			case e_mouse.LEFT_CLICK: mouse = icons.CLICK_LEFT; break;
			case e_mouse.LEFT_DRAG: mouse = icons.DRAG_LEFT; break;
			case e_mouse.RIGHT_CLICK: mouse = icons.CLICK_RIGHT; break;
			case e_mouse.RIGHT_DRAG: mouse = icons.DRAG_RIGHT; break;
			case e_mouse.MIDDLE_CLICK: mouse = icons.CLICK_MIDDLE; break;
			case e_mouse.MIDDLE_DRAG: mouse = icons.DRAG_MIDDLE; break;
			case e_mouse.SCROLL: mouse = icons.SCROLL; break;
			default: mouse = icons.HELP;
		}
		
		draw_image(spr_icons, mouse, dx + 10, yy, 1, 1, c_text_tertiary, a_text_tertiary)
		dx += 20 + padding
	}
	
	// Label ("2")
	draw_label(shortcut[2], dx, yy, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_value)
	dx += string_width_font(shortcut[2], font_value) + 36
}

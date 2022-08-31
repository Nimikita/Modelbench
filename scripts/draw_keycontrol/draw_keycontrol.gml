/// draw_keycontrol(name, x, y, width, shortcut, default, keyonly, script, [keyonly])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg shortcut
/// @arg default
/// @arg script 
/// @arg [keyonly]

function draw_keycontrol(name, xx, yy, wid, shortcut, def, script, keyonly = false)
{
	var hei, text, mouseon, shortcutnew;
	hei = 28
	shortcutnew = shortcut
	
	if (xx + wid < content_x || xx > content_x + content_width || yy + hei < content_y || yy > content_y + content_height)
		return 0
	
	text = text_get(name) + ":"
	mouseon = app_mouse_box(dx, yy, dw, hei) && content_mouseon
	
	context_menu_area(dx, yy, dw, hei, "contextmenukeycontrol", def, e_value_type.NONE, script, null)
	
	// Check key
	if (window_busy = name)
	{
		// Update shortcut passed on key presses
		if (keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(vk_escape) && !keyboard_check_pressed(vk_enter))
		{
			var key, shift, control;
			key = keyboard_lastkey
			shift = (keyboard_check_pressed(vk_shift) || key = 16 || key = 13)
			control = keyboard_check_pressed(vk_control)
			
			keyboard_clear(keyboard_lastkey)
			
			// Shift detect(Left shift ID is 16, right is 13)
			if (shift)
				shortcutnew = new_shortcut(shortcut[e_shortcut.KEY], shortcut[e_shortcut.CONTROL], !shortcut[e_shortcut.SHIFT])
			else if (control) // Control detect
				shortcutnew = new_shortcut(shortcut[e_shortcut.KEY], !shortcut[e_shortcut.CONTROL], shortcut[e_shortcut.SHIFT])
			else // Key detect
				shortcutnew = new_shortcut(key, shortcut[e_shortcut.CONTROL], shortcut[e_shortcut.SHIFT])
			
			if (keyonly)
			{
				if (shift)
					shortcutnew = new_shortcut(vk_lshift, false, false)
				else
					shortcutnew = new_shortcut(shortcutnew[e_shortcut.KEY], false, false)
			}
		}
		
		// Exit record toggle
		if (mouse_left_pressed || keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_enter))
		{
			if (shortcut[e_shortcut.KEY] = "")
			{
				// Nothing to be saved, use default
				if (!shortcut[e_shortcut.SHIFT])
					shortcutnew = def
				else
					shortcutnew = new_shortcut(vk_shift, false, true)
			}
			
			window_busy = ""
		}
		
		/*
		if (ctrl != null)
			ctrl = keyboard_check(vk_control)
	
		if (mouse_left_pressed || keyboard_check_pressed(vk_escape))
		{
			window_busy = ""
			app_mouse_clear()
		}
		else if (keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(vk_control))
		{
			// GM bug shift workaround
			var key = keyboard_lastkey;
		
			if (key = 16) // Left shift
				key = vk_lshift
		
			if (key = 13) // Right shift
				key = vk_rshift
		
			keyboard_clear(keyboard_lastkey)
		
			if (ctrl != null)
				script_execute(script, key, ctrl)
			else
				script_execute(script, key)
		
			window_busy = ""
		}
		*/
	}
	
	microani_set(name, script, mouseon || window_busy = name, mouseon && mouse_left, false)
	microani_update(mouseon || window_busy = name, mouseon && mouse_left, false)
	
	var hover = microani_arr[e_microani.HOVER];
	
	// Edit button
	var editx, edity;
	edity = yy + 2
	editx = xx + dw - 24 + icon_button_offset
	
	draw_set_alpha(hover)
	if (draw_button_icon(name + "editbutton", editx, edity, 24, 24, window_busy = name, icons.PENCIL, null, false, "tooltipeditshortcut"))
	{
		window_busy = name
		shortcutnew = new_shortcut("", false, false)
	}
	
	draw_set_alpha(1)
	
	// Label
	draw_label(text, xx, yy + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
	
	// Update
	if (!array_equals(shortcut, shortcutnew))
		script_execute(script, shortcutnew)
	
	// Value
	draw_label(text_control_name(shortcut), xx + wid - ((24 + 8) * hover), yy + 14, fa_right, fa_middle, c_text_main, a_text_main, font_value)
}

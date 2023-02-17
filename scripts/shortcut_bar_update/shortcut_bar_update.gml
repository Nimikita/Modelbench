/// shortcut_bar_update()

function shortcut_bar_update()
{
	if (shortcut_bar_state != shortcut_bar_state_prev)
	{
		ds_list_clear(shortcut_bar_list)
		
		if (shortcut_bar_state = "uveditorxy")
			shortcut_bar_add(null, e_mouse.DRAG_LEFT, "uveditoredituvs")
		
		if (shortcut_bar_state = "uveditorwh")
			shortcut_bar_add(null, e_mouse.DRAG_LEFT, "uveditoreditwidthheight")
		
		if (shortcut_bar_state = "uveditorlength")
			shortcut_bar_add(null, e_mouse.DRAG_LEFT, "uveditoreditlength")
		
		if (shortcut_bar_state = "uveditor")
			shortcut_bar_add(null, e_mouse.DRAG_LEFT, "panview")
		
		if (string_contains(shortcut_bar_state, "uveditor"))
		{
			if (el_edit != null && el_edit.element_type = TYPE_SHAPE)
			shortcut_bar_add(keybind_new(null, true, false), e_mouse.DRAG_LEFT, "uveditorboxuvs")
			
			shortcut_bar_add(null, e_mouse.SCROLL, "zoom")
			shortcut_bar_add(null, e_mouse.CLICK_RIGHT, "contextmenuuveditor")
		}
		
		if (shortcut_bar_state = "rendercontrol")
		{
			shortcut_bar_add(null, e_mouse.DRAG_LEFT, "transform")
			shortcut_bar_add(keybind_new(null, false, true), e_mouse.DRAG_RIGHT, "reset")
		}
		
		if (shortcut_bar_state = "rendercontrolhover")
		{
			shortcut_bar_add(keybind_new(null, false, true), e_mouse.DRAG_LEFT, "transformslower")
			shortcut_bar_add(keybind_new(null, true, false), e_mouse.DRAG_LEFT, "snap")
			
			if (view_control_edit >= e_control.RESIZE_XP && view_control_edit <= e_control.RESIZE_ZN)
				shortcut_bar_add(keybind_new(vk_alt, false, false), e_mouse.DRAG_LEFT, "resizeaxis")
		}
		
		if (shortcut_bar_state = "viewport")
		{
			shortcut_bar_add(null, e_mouse.CLICK_LEFT, "select")
			
			if (program_mode = e_mode.MODELING)
			{
				shortcut_bar_add(null, e_mouse.CLICK_LEFT, "select")
				shortcut_bar_add(keybind_new(null, true, false), e_mouse.CLICK_LEFT, "selectshape")
			}
			
			if (!setting_viewport_controls_middle)
			{
				shortcut_bar_add(null, e_mouse.DRAG_LEFT, "orbit")
				shortcut_bar_add(keybind_new(null, false, true, false), e_mouse.DRAG_LEFT, "pan")
			}
			else
			{
				shortcut_bar_add(null, e_mouse.DRAG_MIDDLE, "orbit")
				shortcut_bar_add(keybind_new(null, false, true, false), e_mouse.DRAG_MIDDLE, "pan")
			}
			
			
			shortcut_bar_add(null, e_mouse.SCROLL, "zoom")
			shortcut_bar_add(null, e_mouse.DRAG_RIGHT, "walk")
		}
		
		if (shortcut_bar_state = "cameramove")
		{
			shortcut_bar_add(keybinds[e_keybind.CAM_FORWARD].keybind, null, "forward")
			shortcut_bar_add(keybinds[e_keybind.CAM_LEFT].keybind, null, "left")
			shortcut_bar_add(keybinds[e_keybind.CAM_BACK].keybind, null, "back")
			shortcut_bar_add(keybinds[e_keybind.CAM_RIGHT].keybind, null, "right")
			shortcut_bar_add(keybinds[e_keybind.CAM_ASCEND].keybind, null, "ascend")
			shortcut_bar_add(keybinds[e_keybind.CAM_DESCEND].keybind, null, "descend")
			shortcut_bar_add(keybinds[e_keybind.CAM_FAST].keybind, null, "faster")
			shortcut_bar_add(keybinds[e_keybind.CAM_SLOW].keybind, null, "slower")
			shortcut_bar_add(keybinds[e_keybind.CAM_RESET].keybind, null, "reset")
		}
		
		if (shortcut_bar_state = "camerapan")
		{
			shortcut_bar_add(keybinds[e_keybind.CAM_FORWARD].keybind, null, "forward")
			shortcut_bar_add(keybinds[e_keybind.CAM_LEFT].keybind, null, "left")
			shortcut_bar_add(keybinds[e_keybind.CAM_BACK].keybind, null, "back")
			shortcut_bar_add(keybinds[e_keybind.CAM_RIGHT].keybind, null, "right")
		}
		
		if (string_contains(shortcut_bar_state, "contextmenutexture"))
		{
			if (shortcut_bar_state = "contextmenutexturedeselect")
				shortcut_bar_add(null, e_mouse.CLICK_RIGHT, "deselect")
			else
				shortcut_bar_add(null, e_mouse.CLICK_RIGHT, "select")
			
			shortcut_bar_add(null, e_mouse.CLICK_RIGHT, "contextmenutexture")
		}
		
		if (shortcut_bar_state = "uveditorresize")
			shortcut_bar_add(null, e_mouse.DRAG_LEFT, "resizearea")
		
		if (string_contains(shortcut_bar_state, "preview"))
		{
			shortcut_bar_add(null, e_mouse.DRAG_LEFT, "panview")
			
			if (shortcut_bar_state = "previewzoom")
				shortcut_bar_add(null, e_mouse.SCROLL, "zoom")
		}
		
		if (string_contains(shortcut_bar_state, "elementhover"))
		{
			if (shortcut_bar_state = "elementhoverselected")
			{
				shortcut_bar_add(keybind_new(null, true, false), e_mouse.CLICK_RIGHT, "deselect")
				shortcut_bar_add(null, e_mouse.DRAG_LEFT, "moveselection")
			}
			else
			{
				shortcut_bar_add(null, e_mouse.CLICK_LEFT, "select")
				shortcut_bar_add(keybind_new(null, false, true), e_mouse.CLICK_LEFT, "selectadd")
				shortcut_bar_add(null, e_mouse.DRAG_LEFT, "groupselect")
			}
			
			
			shortcut_bar_add(null, e_mouse.CLICK_RIGHT, "contextmenuelement")
		}
		
	}
	
	shortcut_bar_state_prev = shortcut_bar_state
	shortcut_bar_state = ""
}

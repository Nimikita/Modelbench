/// tab_assets_elements()

function tab_assets_elements()
{
	// Element search
	tab_control(24)
	draw_textfield("assetssearchelements", dx, dy, dw, 24, tab.elements.tbx_search, action_search, text_get("assetssearchelementscaption"), "none")
	tab_next()
	
	tab_control_switch()
	draw_switch("assetshideshapes", dx, dy, setting_hide_shapes, action_setting_hide_shapes)
	tab_next()
	
	// Check selection release
	if (!mouse_left && window_busy = "elementselection")
	{
		window_busy = "elementselectiondone"
		element_select_list = ds_list_create()
	}
	
	element_move_parent = null
	element_move_index = null
	
	// Show search results
	if (tab.elements.search_string != "")
	{
		for (var i = 0; i < ds_list_size(tab.elements.element_search_list); i++)
			draw_element_item(tab.elements.element_search_list[|i], dy, 0, true)
	}
	else // Draw hierarchy
	{
		for (var i = 0; i < ds_list_size(part_list); i++)
			draw_element_item(part_list[|i], dy, 0)
	}
	
	dy += 8
	
	// Update box selection
	if (window_busy = "elementselectionstart")
		window_busy = "elementselection"
	
	if (window_busy = "elementselection")
	{
		if (mouse_x < element_select_start_x)
		{
			element_select_x = mouse_x
			element_select_width = element_select_start_x - mouse_x
		}
		else
		{
			element_select_x = element_select_start_x
			element_select_width = mouse_x - element_select_start_x
		}
		
		if (mouse_y < (element_select_start_y - tab.scroll.value))
		{
			element_select_y = mouse_y
			element_select_height = (element_select_start_y - tab.scroll.value) - mouse_y
		}
		else
		{
			element_select_y = (element_select_start_y - tab.scroll.value)
			element_select_height = mouse_y - (element_select_start_y - tab.scroll.value)
		}
		
		draw_box(element_select_x, element_select_y, element_select_width, element_select_height, false, c_accent_overlay, a_accent_overlay)
		draw_outline(element_select_x, element_select_y, element_select_width, element_select_height, 2, c_accent, 1)
	}
	
	// Select box
	if (window_busy = "elementselectiondone")
	{
		action_el_select_list(element_select_list)
		ds_list_destroy(element_select_list)
		
		element_select_list = null
		window_busy = ""
	}
	
	// Update element moving
	if (window_busy = "elementmovestart")
	{
		window_busy = "elementmove"
		action_el_move_start()
	}
	
	// Update element moving
	if (window_busy = "elementmove" && !mouse_left)
	{
		window_busy = ""
		
		if (element_move_parent = null)
			action_el_move_restore()
		else
			action_el_move()
		
		with (element_move_obj)
		{
			ds_list_destroy(elements_list)
			ds_list_destroy(save_id_list)
			ds_list_destroy(index_list)
			instance_destroy()
		}
	}
	
	// Move scrollbar
	if (window_busy = "elementselection" || window_busy = "elementmove")
	{
		if (tab.scroll.needed)
		{
			if (mouse_y - content_y < 48)
				tab.scroll.value_goal -= 8
			
			if (mouse_y - content_y < 8)
				tab.scroll.value_goal -= 16
			
			if (content_y + content_height - mouse_y < 48)
				tab.scroll.value_goal += 8
			
			if (content_y + content_height - mouse_y < 8)
				tab.scroll.value_goal += 16
		}
	}
	
	if (tab.elements.element_hover != null)
	{
		if (tab.elements.element_hover.selected)
		{
			shortcut_bar_add(new_shortcut("", true, false), e_mouse.LEFT_CLICK, "deselect")
			shortcut_bar_add(null, e_mouse.LEFT_DRAG, "moveselection")
		}
		else
		{
			shortcut_bar_add(null, e_mouse.LEFT_CLICK, "select")
			shortcut_bar_add(new_shortcut("", false, true), e_mouse.LEFT_CLICK, "selectadd")
			shortcut_bar_add(null, e_mouse.LEFT_DRAG, "groupselect")
		}
		
		shortcut_bar_add(null, e_mouse.RIGHT_CLICK, "contextmenuelement")
	}
}

/// draw_recent(x, y, width, height, [mode])
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg [mode]

var xx, yy, wid, hei, mode, recenty;
var mouseon;
xx = argument[0]
yy = argument[1]
wid = argument[2]
hei = argument[3]
mode = recent_display_mode

if (argument_count > 4)
	mode = argument[4]

recenty = yy

if (mode = "simple")
{
	for (var i = 0; i < recent_list_amount; i++)
	{
		var hover = app_mouse_box(xx, recenty, wid, 44) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon;
		var mouseon = hover;
		var item = recent_list[|i];
		
		// Icons
		var iconx = xx + wid - 8;
		iconx -= 28
		
		// Remove
		if (hover)
		{
			if (draw_button_icon("recentdelete", iconx, recenty + 8, 28, 28, false, icons.DELETE, null, false, "tooltipremove"))
				action_recent_remove(item)
			mouseon = mouseon && !app_mouse_box(iconx, recenty + 8, 28, 28)
		}
		iconx -= 28
		
		// Name
		draw_label(string_limit_font(filename_name(item.filename), (iconx - xx) - 12, font_value), xx + 12, recenty + 22, fa_left, fa_middle, c_text_main, a_text_main, font_value)
		
		// Seperator
		draw_box(xx + 4, recenty + 43, wid - 8, 1, false, c_overlay, a_overlay)
		
		// Animation
		microani_set("recent" + string(item), null, mouseon, mouseon && mouse_left, false)
		
		draw_box(xx, recenty, wid, 44, false, c_overlay, a_overlay * mcroani_arr[e_mcroani.HOVER])
		draw_box_hover(xx, recenty, wid, 44, mcroani_arr[e_mcroani.HOVER])
		
		draw_box(xx, recenty, wid, 44, false, c_accent_overlay, a_accent_overlay * mcroani_arr[e_mcroani.PRESS])
		
		microani_update(mouseon, mouseon && mouse_left, false)
		
		// Load model
		if (mouseon)
		{
			mouse_cursor = cr_handpoint
			
			if (mouse_left_released)
			{
				model_load(item.filename)
				return 0
			}
		}
		
		recenty += 44
		
		if (recenty + 44 > yy + hei)
			break
	}
}

if (mode = "list")
{
	// Set scrollbar
	var liststart = 0;
	recent_scrollbar.snap_value = 44
	
	if ((recent_list_amount * 44) > hei - 28)
	{
		window_scroll_focus = string(recent_scrollbar)
		
		scrollbar_draw(recent_scrollbar, e_scroll.VERTICAL, xx + wid - 9, yy + 28, hei - 28, recent_list_amount * 44)
		liststart = snap(recent_scrollbar.value / 44, 1)
		wid -= 12
	}
	
	if (hei < 28)
		return 0
	
	var namewidth, timewidth, namex, timex;
	namewidth = (wid - (12 * 3)) / 2
	timewidth = (wid - (12 * 3)) / 2
	namex = xx + 12
	timex = xx + 12 + namewidth + 12
	
	// File name
	draw_label(text_get("recentfilename"), namex, recenty + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_emphasis)
	
	var filenamesort = (recent_sort_mode = e_recent_sort.filename_ascend || recent_sort_mode = e_recent_sort.filename_descend);
	if (app_mouse_box(namex, recenty, namewidth, 28) || filenamesort)
	{
		if (draw_button_icon("recentfilenamesort", namex + string_width_font(text_get("recentfilename"), font_emphasis) + 12, recenty, 28, 28, filenamesort, icons.SORT_DOWN + (recent_sort_mode = e_recent_sort.filename_ascend)))
			action_recent_sort_filename()
	}
	
	// Last opened
	draw_label(text_get("recentlastopened"), timex, recenty + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_emphasis)
	
	var datesort = (recent_sort_mode = e_recent_sort.date_ascend || recent_sort_mode = e_recent_sort.date_descend);
	if (app_mouse_box(timex, recenty, timewidth, 28) || datesort)
	{
		if (draw_button_icon("recentrecentsort", timex + string_width_font(text_get("recentlastopened"), font_emphasis) + 12, recenty, 28, 28, datesort, icons.SORT_DOWN + (recent_sort_mode = e_recent_sort.date_ascend)))
			action_recent_sort_date()
	}
	
	recenty += 28
	
	// Draw list
	for (var i = liststart; i < recent_list_amount; i++)
	{
		var hover = app_mouse_box(xx, recenty, wid, 44) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon;
		mouseon = hover
		
		var item = recent_list_display[|i];
		
		// Name
		draw_label(string_limit_font(filename_name(item.filename), namewidth, font_value), xx + 12, recenty + 22, fa_left, fa_middle, c_text_main, a_text_main, font_value)
		
		// Last opened
		draw_label(string_limit_font(recent_time_string(item.last_opened), timewidth, font_value), timex, recenty + 22, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_value)
		
		// Icons
		var iconx = xx + wid - 8;
		iconx -= 28
		
		// Remove
		if (hover)
		{
			if (draw_button_icon("recentdelete", iconx, recenty + 8, 28, 28, false, icons.DELETE, null, false, "tooltipremove"))
				action_recent_remove(item)
			mouseon = mouseon && !app_mouse_box(iconx, recenty + 8, 28, 28)
		}
		iconx -= 28
		
		// Oh yeah. Pin it
		if (hover || item.pinned)
		{
			if (draw_button_icon("recentpin" + item.filename, iconx, recenty + 8, 28, 28, item.pinned, icons.PIN, null, false, "tooltippin"))
				action_recent_pin(item)
			mouseon = mouseon && !app_mouse_box(iconx, recenty + 8, 28, 28)
		}
		
		// Seperator
		draw_box(xx + 4, recenty + 43, wid - 8, 1, false, c_overlay, a_overlay)
		
		// Animation
		microani_set("recent" + string(item), null, mouseon, mouseon && mouse_left, false)
		
		draw_box(xx, recenty, wid, 44, false, c_overlay, a_overlay * mcroani_arr[e_mcroani.HOVER])
		draw_box_hover(xx, recenty, wid, 44, mcroani_arr[e_mcroani.HOVER])
		
		draw_box(xx, recenty, wid, 44, false, c_accent_overlay, a_accent_overlay * mcroani_arr[e_mcroani.PRESS])
		
		microani_update(mouseon, mouseon && mouse_left, false)
		
		// Load model
		if (mouseon)
		{
			mouse_cursor = cr_handpoint
			
			if (mouse_left_released)
			{
				model_load(item.filename)
				return 0
			}
		}
		
		recenty += 44
		
		if (recenty + 44 > yy + hei)
			break
	}
}

// Update list if anything has changed
if (recent_list_update)
{
	recent_update()
	recent_list_update = false
}
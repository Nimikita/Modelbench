/// draw_recent(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height

var xx, yy, wid, hei, recenty;
xx = argument0
yy = argument1
wid = argument2
hei = argument3
recenty = yy

// No recent models to display
if (recent_list_amount = 0)
{
	var midx, midy;
	midx = snap(xx + (wid*.5), 2)
	midy = snap(yy + (hei*.5), 2)
	
	if (current_step < 5)
	{
		recent_splash_x = midx
		recent_splash_y = midy
		recent_splash_goal_x = recent_splash_x
		recent_splash_goal_y = recent_splash_y
	}
	else
	{
		recent_splash_goal_x = midx - ((mouse_x - midx) / 50)
		recent_splash_goal_y = midy - ((mouse_y - midy) / 50)
		recent_splash_x += (recent_splash_goal_x - recent_splash_x) / max(1, 5 / delta)
		recent_splash_y += (recent_splash_goal_y - recent_splash_y) / max(1, 5 / delta)
	}
	
	gpu_set_tex_filter(true)
	draw_image(spr_splash, 1, recent_splash_x, recent_splash_y, 0.5, 0.5)
	gpu_set_tex_filter(false)
	
	//draw_label(text_get("recentnone"), midx, midy - 4, fa_center, fa_bottom, c_accent, 1, font_heading)
	//draw_label(text_get("recentnonesub", text_get("startupnewmodel")), midx, midy + 4, fa_center, fa_top, a_neutral50, a_neutral50, font_subheading)
	return 0
}

if (recent_display_mode = "list")
{
	if (hei < 28)
		return 0
	
	var namewidth, timewidth, namex, timex;
	namewidth = (wid - (12 * 3)) / 2
	timewidth = (wid - (12 * 3)) / 2
	namex = xx + 12
	timex = xx + 12 + namewidth + 12
	
	// File name
	draw_label(text_get("recentfilename"), namex, recenty + 14, fa_left, fa_middle, c_neutral50, a_neutral50, font_emphasis)
	
	var filenamesort = (recent_sort_mode = e_recent_sort.filename_ascend || recent_sort_mode = e_recent_sort.filename_descend);
	if (app_mouse_box(namex, recenty, namewidth, 28) || filenamesort)
	{
		if (draw_button_icon("recentfilenamesort", namex + string_width_font(text_get("recentfilename"), font_emphasis) + 12, recenty, 28, 28, filenamesort, e_icon.sort_down + (recent_sort_mode = e_recent_sort.filename_ascend)))
			action_recent_sort_filename()
	}
	
	// Last opened
	draw_label(text_get("recentlastopened"), timex, recenty + 14, fa_left, fa_middle, c_neutral50, a_neutral50, font_emphasis)
	
	var datesort = (recent_sort_mode = e_recent_sort.date_ascend || recent_sort_mode = e_recent_sort.date_descend);
	if (app_mouse_box(timex, recenty, timewidth, 28) || datesort)
	{
		if (draw_button_icon("recentrecentsort", timex + string_width_font(text_get("recentlastopened"), font_emphasis) + 12, recenty, 28, 28, datesort, e_icon.sort_down + (recent_sort_mode = e_recent_sort.date_ascend)))
			action_recent_sort_date()
	}
	
	recenty += 28
	
	// Draw list
	for (var i = 0; i < recent_list_amount; i++)
	{
		var hover = app_mouse_box(xx, recenty, wid, 44);
		
		if (hover)
			draw_box(xx, recenty, wid, 44, false, c_accent10, a_accent10)
		
		var item = recent_list_display[|i];
		
		// Name
		draw_label(string_limit_font(item.name, namewidth, font_value), xx + 12, recenty + 22, fa_left, fa_middle, c_neutral60, a_neutral60, font_value)
		
		// Last opened
		draw_label(string_limit_font(recent_time_string(item.last_opened), timewidth, font_value), timex, recenty + 22, fa_left, fa_middle, c_neutral50, a_neutral50, font_value)
		
		// Icons
		var iconx = xx + wid - 8;
		iconx -= 28
			
		// Remove
		if (hover)
		{
			if (draw_button_icon("recentdelete", iconx, recenty + 8, 28, 28, false, e_icon.delete))
				action_recent_remove(item)
		}
		iconx -= 28
			
		// Oh yeah. Pin it
		if (hover || item.pinned)
		{
			if (draw_button_icon("recentpin" + item.name, iconx, recenty + 8, 28, 28, item.pinned, e_icon.pin))
				action_recent_pin(item)
		}
		
		draw_box(xx + 4, recenty + 43, wid - 8, 1, false, c_neutral10, a_neutral10)
		recenty += 44
		
		if (yy - recenty > hei)
			break
	}
}

// Update list if anything has changed
if (recent_list_update)
{
	recent_update()
	recent_list_update = false
}
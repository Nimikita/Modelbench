/// panel_draw_content()

var minw, minh, maxh, dividew;
minw = 288
minh = 160
maxh = 0

dx = content_x + 12
dy = content_y + 14
dw = content_width - 24
dh = content_height
tab = content_tab
dividew = content_width

if (content_direction = e_scroll.VERTICAL)
{
	if (tab.scroll.needed)
		tab.scrollbar_margin_goal = 1
	else
		tab.scrollbar_margin_goal = 0
	
	dividew -= (tab.scrollbar_margin * 12)
	dw -= (tab.scrollbar_margin * 12)
	dy -= tab.scroll.value
}
else
{
	dh -= 30 * tab.scroll.needed
	dx -= tab.scroll.value
	
	// Minimum height
	if (dh < minh)
	{
		if (tab.panel != panel_map[?"bottom"])
			dy -= minh - dh
		dh = minh
	}
}

if (tab.scroll.needed && content_mouseon)
	window_scroll_focus = string(tab.scroll)

dx_start = dx
dy_start = dy
dw_start = dw
dh_start = dh

if (!tab.script)
{
	var columns, cat, catamount, c;
	catamount = 0
	for (c = 0; c < tab.category_amount; c++)
	{
		if (tab.category[c].enabled)
		{
			cat[catamount] = tab.category[c]
			catamount++
		}
	}
	columns = 1//clamp(floor(dw / minw), 1, catamount)
	dw = ceil((dw - 8*(columns - 1)) / columns)
	c = 0
	
	dy = dy_start
	dh = dh_start
	
	// Content at top of categories
	if (tab.header_script)
	{
		script_execute(tab.header_script)
		maxh = max(dy - dy_start, maxh)
	}
	
	for (var col = 0; col < columns; col++)
	{
		// Number of categories in this column
		var cats = max(1, round(catamount / columns)) 
		if (col = columns - 1)
			cats = catamount - c
		
		repeat (cats)
		{
			// Hide button
			tab_control(24)
			draw_label(text_get(cat[c].name), dx, dy + 13, fa_left, fa_center, c_text_tertiary, a_text_tertiary, font_subheading)
			if (draw_button_icon(cat[c].name + "close", dx + dw - 24 + icon_button_offset, dy, 24, 24, cat[c].show, null, null, null, "", spr_arrow_ani))
				cat[c].show = !cat[c].show
			tab_next()
			
			// Set copy name
			context_menu_copy_category = cat[c]
			
			// Draw contents
			if (cat[c].show && cat[c].script)
				script_execute(cat[c].script)
			
			if (c < catamount - 1)
			{
				dy += 20
				draw_divide(content_x, dy - 13, dividew - 1)
			}
			
			// Reset copy name
			context_menu_copy_category = null
			
			maxh = max(dy - dy_start, maxh)
			c++
		}
	}
	
}
else
{
	script_execute(tab.script)
	maxh = dy - dy_start
}

// Scrollbar
if (content_direction = e_scroll.VERTICAL)
	scrollbar_draw(tab.scroll, e_scroll.VERTICAL, content_x + (content_width - (9 + (3 * tab.scrollbar_margin))) + 3, content_y, content_height, maxh + 15, c_accent, c_accent_hover, c_black)
else
	scrollbar_draw(tab.scroll, e_scroll.HORIZONTAL, content_x, content_y + content_height - 35, content_width, dx + dw - content_x + tab.scroll.value + 15)

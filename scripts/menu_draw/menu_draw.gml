/// menu_draw()
/// @desc Draws the dropdown menu.

// Animation
if (menu_ani_type = "hide") //Hide
{
	menu_ani -= 0.08 * delta
	if (menu_ani <= 0)
	{
		menu_ani = 0
		menu_name = ""
		menu_clear()
		return 0
	}
}
else if (menu_ani_type = "show") //Show
{
	menu_ani += 0.08 * delta
	if (menu_ani >= 1)
	{
		menu_ani = 1
		menu_ani_type = ""
	}
}

if (menu_name = "")
	return 0

var itemsx, itemsy;
itemsx = 1
itemsy = menu_amount

var yy, h;
h = ease(test((menu_ani_type = "show"), "easeoutexpo", "easeinexpo"), menu_ani) * min(itemsy, menu_show_amount) * menu_item_h
yy = test(menu_flip, (menu_y - h), (menu_y + menu_button_h))

if (h > 2)
	draw_outline(menu_x, test(menu_flip, yy, yy + 4), menu_w, h - 4, 2, c_neutral50, a_neutral50)
draw_box(menu_x, yy, menu_w, h, false, c_background, 1)
draw_line_ext(menu_x, test(menu_flip, yy + h, yy), menu_x + menu_w, test(menu_flip, yy + h, yy), c_neutral10, a_neutral10)

content_x = menu_x
content_y = yy
content_width = menu_w
content_height = h

if (window_busy = "menu")
	window_busy = ""

// Scrollbar
content_mouseon = app_mouse_box(menu_x, yy, menu_w, h)
if (menu_ani_type = "")
{
	menu_scroll.snap_value = menu_item_h
	scrollbar_draw(menu_scroll, e_scroll.VERTICAL, menu_x + menu_w - 9, yy - 3, h + 6, (itemsy * menu_item_h))
}
else
	menu_scroll.needed = false

var mouseitem = null;
draw_set_font(font_value)
switch (menu_type)
{
	case e_menu.LIST: // Normal list with images and caption
	{
		var dy = yy;
		for (var m = round(menu_scroll.value / menu_item_h); m < menu_amount; m++)
		{
			var item, imgsize, dx, highlight, text;
			
			if (dy + menu_item_h > yy + h)
				break
			
			item = menu_item[m]
			imgsize = menu_item_h - 4
			dx = 8//menu_item_h / 2
			
			if (app_mouse_box(menu_x, dy, menu_w - 12 * menu_scroll.needed, menu_item_h))
			{
				mouseitem = item
				mouse_cursor = cr_handpoint
				draw_box(menu_x, dy, menu_w - 12 * menu_scroll.needed, menu_item_h, false, c_neutral10, a_neutral10)
			}
			
			// Highlight box
			highlight = (menu_value = item.value || (mouseitem = item && (mouse_left || mouse_left_released)))
			if (highlight)
				draw_box(menu_x, dy, menu_w - 12 * menu_scroll.needed, menu_item_h, false, c_accent10, a_accent10)
			
			// Sprite
			if (item.tex)
				draw_texture(item.tex, menu_x + 4, dy + 2, imgsize / texture_width(item.tex), imgsize / texture_height(item.tex))
			
			// Caption
			dx += test((item.icon || item.tex), (imgsize - 4), 0)
			text = string_limit(item.text, menu_w - 12 * menu_scroll.needed - 8-dx)
			draw_label(text, menu_x + dx, dy + menu_item_h / 2, fa_left, fa_middle, c_neutral60, a_neutral60)
			dy += menu_item_h
		}
		break
	}
	
}

// Check click
if (!app_mouse_box(menu_x + menu_w - 12, yy, 12 * menu_scroll.needed, h) && mouse_left_released)
{
	menu_ani = 1
	menu_ani_type = "hide"
	window_busy = ""
	if (mouseitem)
	{
		menu_ani = 2
		menu_value = mouseitem.value
		
		if (mouseitem.script != null)
			script_execute(mouseitem.script, null)
		else
			script_execute(menu_script, menu_value)
		
		app_mouse_clear()
	}
}

if (window_busy = "" && menu_ani_type != "hide")
	window_busy = "menu"

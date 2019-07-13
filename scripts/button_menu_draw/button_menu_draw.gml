/// button_menu_draw()

// Animation
if (button_menu_ani_type = "hide") //Hide
{
	button_menu_ani -= 0.08 * delta
	if (button_menu_ani <= 0)
	{
		button_menu_ani = 0
		button_menu_name = ""
		button_menu_clear()
		return 0
	}
}
else if (button_menu_ani_type = "show") //Show
{
	button_menu_ani += 0.08 * delta
	if (button_menu_ani >= 1)
	{
		button_menu_ani = 1
		button_menu_ani_type = ""
	}
}

if (button_menu_name = "")
	return 0

var buttonmenuease = ease(test((button_menu_ani_type = "show"), "easeoutexpo", "easeinexpo"), button_menu_ani);

content_x = button_menu_x - button_menu_w/2
content_y = button_menu_y + (16 * buttonmenuease)
content_width = button_menu_w
content_height = 32 * button_menu_amount

if (window_busy = "buttonmenu")
	window_busy = ""

draw_set_alpha(buttonmenuease)

draw_dropshadow(content_x, content_y, content_width, content_height, c_black, buttonmenuease)
draw_outline(content_x, content_y, content_width, content_height, 1, c_neutral20, a_neutral20 * buttonmenuease)

draw_box(content_x, content_y, content_width, content_height, false, c_background, 1)

var itemx, itemy, mouseitem, item, itemmouseon;
itemx = content_x
itemy = content_y
mouseitem = null

draw_set_font(font_value)
for (var i = 0; i < button_menu_amount; i++)
{
	var item = button_menu_item[i];
	itemmouseon = app_mouse_box(itemx, itemy, content_width, 32)
	
	if (itemmouseon)
	{
		mouseitem = item
		mouse_cursor = cr_handpoint
		
		if (!mouse_left)
			draw_box(itemx, itemy, content_width, 32, false, c_neutral10, a_neutral10)
		else
			draw_box(itemx, itemy, content_width, 32, false, c_accent10, a_accent10)
	}
	
	draw_image(spr_icons, item.icon, itemx + 16, itemy + 16, 1, 1, c_neutral50, a_neutral50)
	draw_label(item.text, itemx + 32, itemy + 16, fa_left, fa_middle, c_neutral60, a_neutral60)
	
	itemy += 32
}

draw_image(spr_tooltip_arrow, 0, button_menu_x, content_y, 1, 1, c_background, buttonmenuease)

// Highlight arrow with top item
if (mouseitem = button_menu_item[0])
{
	if (mouse_left)
		draw_image(spr_tooltip_arrow, 0, button_menu_x, content_y, 1, 1, c_accent10, a_accent10 * buttonmenuease)
	else
		draw_image(spr_tooltip_arrow, 0, button_menu_x, content_y, 1, 1, c_neutral10, a_neutral10 * buttonmenuease)
}
	
draw_image(spr_tooltip_arrow, 1, button_menu_x, content_y, 1, 1, c_neutral20, a_neutral20 * buttonmenuease)

draw_set_alpha(1)

// Check click
if (mouse_left_released)
{
	button_menu_ani = 1
	button_menu_ani_type = "hide"
	window_busy = ""
	if (mouseitem)
	{
		button_menu_ani = 2
		
		if (mouseitem.script != null)
			script_execute(mouseitem.script, null)
		
		app_mouse_clear()
	}
}

if (window_busy = "" && button_menu_ani_type != "hide")
	window_busy = "buttonmenu"
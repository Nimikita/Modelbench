/// button_menu_draw()

// Animation
if (button_menu_ani_type = "hide") //Hide
{
	button_menu_ani -= 0.08 * delta
	if (button_menu_ani <= 0)
	{
		button_menu_ani = 0
		button_menu_name = ""
		list_destroy(button_menu_list)
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

var buttonmenuease = ease(((button_menu_ani_type = "show") ? "easeoutexpo" : "easeinexpo"), button_menu_ani);

content_x = button_menu_x - ceil(button_menu_w/2)
content_y = button_menu_y + (16 * buttonmenuease)
content_width = button_menu_w
content_height = 28 * button_menu_amount
content_mouseon = app_mouse_box_busy(content_x, content_y, content_width, content_height, "buttonmenu")

if (window_busy = "buttonmenu")
	window_busy = ""

draw_set_alpha(buttonmenuease)

draw_dropshadow(content_x, content_y, content_width, content_height, c_black, buttonmenuease)
draw_outline(content_x, content_y, content_width, content_height, 1, c_border, a_border * buttonmenuease)

draw_box(content_x, content_y, content_width, content_height, false, c_background, 1)

var itemx, itemy;
itemx = content_x
itemy = content_y

for (var i = 0; i < button_menu_amount; i++)
{
	draw_list_item(button_menu_list.item[|i], itemx, itemy, content_width, 28, false, 4)
	itemy += 28
}

draw_image(spr_tooltip_arrow, 0, button_menu_x, content_y, 1, 1, c_background, buttonmenuease)

// Highlight arrow with top item
if (button_menu_amount > 0 && button_menu_list.item[|0].hover)
{
	if (mouse_left)
		draw_image(spr_tooltip_arrow, 0, button_menu_x, content_y, 1, 1, c_accent_overlay, a_accent_overlay * buttonmenuease)
	else
		draw_image(spr_tooltip_arrow, 0, button_menu_x, content_y, 1, 1, c_overlay, a_overlay * buttonmenuease)
}

draw_image(spr_tooltip_arrow, 1, button_menu_x, content_y, 1, 1, c_border, a_border * buttonmenuease)

draw_set_alpha(1)

// Check click
if (mouse_left_released)
{
	button_menu_ani = 1
	button_menu_ani_type = "hide"
	window_busy = ""
}

if (window_busy = "" && button_menu_ani_type != "hide")
	window_busy = "buttonmenu"

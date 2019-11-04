/// menu_panel_draw()

// Extention animation
if (menu_panel_ext_ani_type = "hide" || menu_panel_ext = null) //Hide
{
	menu_panel_ext_ani -= 0.08 * delta
	if (menu_panel_ext_ani <= 0)
	{
		menu_panel_ext_ani = 0
		menu_panel_ext = null
		menu_panel_ext_ani_type = ""
	}
}
else if (menu_panel_ext_ani_type = "show") //Show
{
	menu_panel_ext_ani += 0.08 * delta
	if (menu_panel_ext_ani >= 1)
	{
		menu_panel_ext_ani = 1
		menu_panel_ext_ani_type = ""
	}
}

// Animation
if (menu_panel_ani_type = "hide") //Hide
{
	menu_panel_ani -= 0.08 * delta
	menu_panel_ext_ani_type = "hide"
	if (menu_panel_ani <= 0)
	{
		menu_panel_ani = 0
		menu_panel_ani_type = ""
		
		menu_panel_ext = null
		menu_panel_ext_ani_type = ""
		menu_panel_ext_ani = 0
		return 0
	}
}
else if (menu_panel_ani_type = "show") //Show
{
	menu_panel_ani += 0.08 * delta
	if (menu_panel_ani >= 1)
	{
		menu_panel_ani = 1
		menu_panel_ani_type = ""
	}
}

if (menu_panel_ani = 0)
	return 0

var panelease, panelextease, panelx, panely, panelw, panelh, panelextwid;
panelease = ease(test(menu_panel_ani_type = "show", "easeoutcirc", "easeincirc"), menu_panel_ani)
panelextease = ease(test(menu_panel_ext_ani_type = "show", "easeoutcirc", "easeincirc"), menu_panel_ext_ani)
panelextwid = 300//test(menu_panel_ext = recent_models, 440, 300)
panely = 36
panelh = window_height - 36
panelw = 300 + (panelextwid * panelextease)
panelx = -panelw + (panelw * panelease)


// Draw window block
draw_box(0, panely, window_width, panelh, false, c_background, panelease * 0.35)
draw_box(panelx, panely, panelw, panelh, false, c_background, 1)

// Menu extention
if (panelextease > 0)
{
	content_x = panelx + (300 - panelextwid) + (panelextwid * panelextease)
	content_y = panely
	content_width = panelextwid
	content_height = panelh
	content_mouseon = app_mouse_box(panelx + 300, panely, panelextwid * panelextease, panelh) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon
	content_direction = e_scroll.VERTICAL
	
	dx = content_x
	dy = content_y
	dw = content_width
	dh = content_height
	
	draw_gradient(panelx + panelw, panely, shadow_size, panelh, c_black, shadow_alpha, 0, 0, shadow_alpha)
	
	if (menu_panel_ext != null)
	{
		content_tab = menu_panel_ext
		panel_draw_content()
	}
	
	// Cover it up
	draw_box(panelx, panely, 300, panelh, false, c_background, 1)
	
	// Menu border
	draw_box(panelx + 300, panely, 1, panelh, false, c_border, a_border)
}

// Draw menu
content_x = panelx
content_y = panely
content_width = 300
content_height = panelh
content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon

dx = content_x
dy = content_y + 8
dw = content_width
dh = content_height - 16

tab_menu()

// Close if mouse clicked outside of area
if (app_mouse_box(panelx + panelw, panely, window_width - panelw, panelh) && mouse_left_pressed && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon)
{
	menu_panel_ani_type = "hide"
	menu_open = false
}

draw_gradient(panelx + panelw, panely, shadow_size, panelh, c_black, shadow_alpha, 0, 0, shadow_alpha)

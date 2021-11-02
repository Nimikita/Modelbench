/// view_draw(view)
/// @arg view

var view;
var boxx, boxy, boxw, boxh;

view = argument0

// Calculate box
boxx = view_area_x
boxy = view_area_y
boxw = view_area_width
boxh = view_area_height

boxx = floor(boxx)
boxy = floor(boxy)
boxw = floor(boxw)
boxh = floor(boxh)

if (boxw < 1 || boxh < 1)
	return 0

content_x = boxx
content_y = boxy
content_width = boxw
content_height = boxh
content_mouseon = (view.mouseon && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon)
content_view = view

draw_gradient(content_x, content_y + content_height, content_width, shadow_size, c_black, shadow_alpha, shadow_alpha, 0, 0)
draw_box(boxx, boxy, boxw, boxh, false, c_background, 1)

if (view.width != content_width || view.height != content_height)
{
	view.width = content_width
	view.height = content_height
}

if (content_width > 0 && content_height > 0)
{
	// Match aspect ratio
	if (view.aspect_ratio)
	{
		var wid, hei, scale;
		
		wid = content_width // TODO: Replace content sizes with custom options
		hei = content_height
			
		draw_box(content_x, content_y, content_width, content_height, false, c_black, 1) // Background
		
		if (wid / hei < content_width / content_height)
		{
			scale = content_height / hei
			content_x += (content_width - scale * wid) / 2
			content_width = wid * scale
		}
		else
		{
			scale = content_width / wid
			content_y += (content_height - scale * hei) / 2
			content_height = hei * scale
		}
	}
	
	// Content
	content_x = floor(content_x)
	content_y = floor(content_y)
	content_width = ceil(content_width)
	content_height = ceil(content_height)
	content_mouseon = (app_mouse_box(content_x, content_y, content_width, content_height) && view.mouseon && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon)
	
	// Preview transparency
	if (program_mode = e_mode.PREVIEW)
	{
		draw_box(boxx, boxy, boxw, boxh, false, c_background, 1)
		
		for (var i = 0; i < ceil(boxw/192); i++)
			for (var j = 0; j < ceil(boxh/192); j++)
				draw_image(spr_uv_editor_pattern, 0, boxx + (i * 192), boxy + (j * 192), 1, 1, c_text_main, .05)
	}
	
	view_update(view, null)
	draw_surface_size(view.surface, content_x, content_y, content_width, content_height)
	
	if (mouse_left && window_busy = "viewgroupselect")
	{
		var minx, maxx, miny, maxy;
		minx = min(mouse_x, mouse_click_x)
		maxx = max(mouse_x, mouse_click_x)
		miny = min(mouse_y, mouse_click_y)
		maxy = max(mouse_y, mouse_click_y)
		
		draw_box(minx, miny, maxx - minx, maxy - miny, false, c_accent_overlay, a_accent_overlay)
		draw_outline(minx, miny, maxx - minx, maxy - miny, 2, c_accent, 1)
	}
}

// Preview overlay bars
if (program_mode = e_mode.PREVIEW && setting_preview_guides && (content_width > content_height))
{
	var barsize;
	barsize = abs(content_width - content_height)/2
	
	draw_box(content_x, content_y, barsize, content_height, false, c_black, .5)
	draw_box(content_x + content_width - barsize, content_y, barsize, content_height, false, c_black, .5)
}

// Mouse on
view.mouseon = app_mouse_box(boxx, boxy, boxw, boxh)

// Toolset toolbar
var toolbarx, toolbary, toolbarwid, toolbarhei;
toolbarx = boxx + 16
toolbary = boxy + 16
toolbarwid = 36
toolbarhei = 4 + (e_element.amount * (28 + 4)) + 1 + 4 + (e_tool.amount * (28 + 4))

if (toolbary + toolbarhei + 16 >= content_height)
{
	toolbarwid = toolbarhei
	toolbarhei = 36
}

if (app_mouse_box(toolbarx, toolbary, toolbarwid, toolbarhei))
	view.mouseon = false

view_toolbar_draw(toolbarx, toolbary, toolbarwid, toolbarhei)

// Viewport toolbar
toolbarx = floor(boxx + (boxw/2) - (toolbar_viewport_width/2))
toolbary = boxy + 16
toolbarwid = toolbar_viewport_width
toolbarhei = 36

if (toolbary + toolbarhei + 16 >= content_height)
{
	toolbarwid = toolbarhei
	toolbarhei = 36
}

if (app_mouse_box(toolbarx, toolbary, toolbarwid, toolbarhei))
	view.mouseon = false

view_toolbar_viewport_draw(toolbarx, toolbary, toolbarwid, toolbarhei)

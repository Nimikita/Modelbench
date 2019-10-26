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

draw_box(boxx, boxy, boxw, boxh, false, c_background, 1)

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
	
	view_update(view, null)
	draw_surface_size(view.surface, content_x, content_y, content_width, content_height)
}

// Mouse on
view.mouseon = app_mouse_box(boxx, boxy, boxw, boxh)

// Viewport toolbar
var toolbarx, toolbary, toolbarwid, toolbarhei;
toolbarx = boxx + 16
toolbary = boxy + 16
toolbarwid = 36
toolbarhei = 4 + (4 * (28 + 4)) + 1 + 4 + (5 * (28 + 4))

if (app_mouse_box(toolbarx, toolbary, toolbarwid, toolbarhei))
	view.mouseon = false

view_toolbar_draw(toolbarx, toolbary, toolbarwid, toolbarhei)

// Snap toolbar
toolbarwid = 4 + 28 + 4 + 6 + string_width_font(text_get("toolsetsnapsize"), font_emphasis) + 10 + 64 + 4
toolbarhei = 36
toolbarx = boxx + boxw/2 - toolbarwid/2
toolbary = boxy + 16

if (app_mouse_box(toolbarx, toolbary, toolbarwid, toolbarhei))
	view.mouseon = false

view_toolbar_snap_draw(toolbarx, toolbary, toolbarwid, toolbarhei)

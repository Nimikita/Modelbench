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
content_mouseon = (view.mouseon && !popup_mouseon && !snackbar_mouseon)

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
	content_mouseon = (app_mouse_box(content_x, content_y, content_width, content_height) && view.mouseon && !popup_mouseon && !snackbar_mouseon)
	
	view_update(view, null)
	draw_surface_size(view.surface, content_x, content_y, content_width, content_height)
	
	var shapes = 0;
	var parts = 0;
	var blocks = 0;
	var planes = 0;
	var planes3d = 0;
	
	with (obj_model_element)
	{
		if (element_type = TYPE_SHAPE)
		{
			shapes++
			
			if (type = "block")
				blocks++
			else if (type = "plane")
			{
				if (value[e_value.EXTRUDE])
					planes3d++
				else
					planes++
			}
		}
		else
			parts++
	}
	
	var labely = 0;
	draw_label("Parts: " + string(parts), content_x + 8, content_y + content_height - 8 - labely, fa_left, fa_bottom, c_text_main, a_text_main, font_emphasis)
	labely += 16
	draw_label("3D planes: " + string(planes3d), content_x + 16, content_y + content_height - 8 - labely, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
	labely += 16
	draw_label("Planes: " + string(planes), content_x + 16, content_y + content_height - 8 - labely, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
	labely += 16
	draw_label("Blocks: " + string(blocks), content_x + 16, content_y + content_height - 8 - labely, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
	labely += 16
	draw_label("Shapes: " + string(shapes), content_x + 8, content_y + content_height - 8 - labely, fa_left, fa_bottom, c_text_main, a_text_main, font_emphasis)
	
	
	//draw_label("Render FPS: " + string(fps), content_x + 8, content_y + 8, fa_left, fa_top, c_text_main, a_text_main, font_heading)
}

// Mouse on
view.mouseon = app_mouse_box(boxx, boxy, boxw, boxh)

// Viewport toolbar
var toolbarx, toolbary, toolbarwid, toolbarhei;
toolbarx = boxx + 16
toolbary = boxy + 16
toolbarwid = 36
toolbarhei = 4 + (4 * (28 + 4)) + 1 + 4 + (5 * (28 + 4));

if (app_mouse_box(toolbarx, toolbary, toolbarwid, toolbarhei))
	view.mouseon = false

view_toolbar_draw(toolbarx, toolbary, toolbarwid, toolbarhei)

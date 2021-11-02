/// preview_draw(preview, x, y, width, height)
/// @arg preview
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @desc Draws a preview window.

var preview, xx, yy, width, height;
var mouseon;
preview = argument0
xx = argument1
yy = argument2
width = argument3
height = argument4

if (xx + width < content_x || xx > content_x + content_width || yy + height < content_y || yy > content_y + content_height)
	return 0

mouseon = app_mouse_box(xx, yy, width, height) && content_mouseon

// Background
draw_box(xx, yy, width, height, false, c_background_secondary, 1)

if (!instance_exists(preview.select))
{
	preview.texture = null
	return 0
}

// Add shortcuts
if (mouseon || window_busy = "previewrotate" || window_busy = "previewmove")
{
	shortcut_bar_add(null, e_mouse.LEFT_DRAG, "panview")
	
	if (window_scroll_focus_prev = string(preview))
		shortcut_bar_add(null, e_mouse.SCROLL, "zoom")
}

// Dragging controls
if (mouseon && content_mouseon)
{
	mouse_cursor = cr_size_all
	if (mouse_left_pressed)
	{
		window_busy = "previewmove"
		window_focus = string(preview)
		preview.clickxyangle = preview.xyangle
		preview.clickzangle = preview.zangle
		preview.clickxoff = preview.xoff
		preview.clickyoff = preview.yoff
	}
}

if (window_focus = string(preview))
{
	if (window_busy = "previewrotate")
	{
		mouse_cursor = cr_size_all
		preview.xyangle = preview.clickxyangle + (mouse_click_x - mouse_x) * 0.75
		preview.zangle = preview.clickzangle - (mouse_click_y - mouse_y)
		preview.zangle = clamp(preview.zangle, -89.9, 89.9)
		preview.update = true
		if (!mouse_left)
		{
			window_busy = ""
			app_mouse_clear()
		}
	}
	if (window_busy = "previewmove")
	{
		mouse_cursor = cr_size_all
		preview.xoff = preview.clickxoff + (mouse_click_x - mouse_x) / preview.zoom
		preview.yoff = preview.clickyoff + (mouse_click_y - mouse_y) / preview.zoom
		preview.goalxoff = preview.xoff
		preview.goalyoff = preview.yoff
		preview.update = true
		if (!mouse_left)
		{
			window_busy = ""
			app_mouse_clear()
		}
	}
}

// Zoom
var zd, m;
m = (1 - 0.25 * mouse_wheel * (window_scroll_focus_prev = string(preview)))
if (m != 1)
{
	preview.goalzoom = clamp(preview.goalzoom * m, 0.1, 100)
	preview.goalxoff = preview.xoff + (mouse_x - (xx + width / 2)) / preview.zoom - (mouse_x - (xx + width / 2)) / preview.goalzoom
	preview.goalyoff = preview.yoff + (mouse_y - (yy + height / 2)) / preview.zoom - (mouse_y - (yy + height / 2)) / preview.goalzoom
}
zd = (preview.goalzoom - preview.zoom) / max(1, 5 / delta)
if (zd != 0)
{
	preview.update = true
	preview.zoom += zd
	preview.xoff += (preview.goalxoff - preview.xoff) / max(1, 5 / delta)
	preview.yoff += (preview.goalyoff - preview.yoff) / max(1, 5 / delta)
}

if (!(mouse_x >= xx &&
	mouse_y >= yy &&
	mouse_x < xx + width &&
	mouse_y < yy + height) && content_mouseon &&
	(window_busy != "previewmove") && (window_busy != "previewrotate") &&
	(window_focus = string(preview)))
	window_focus = ""

if (mouseon && window_focus = string(preview))
	window_scroll_focus = string(preview)

// Render
with (preview)
{
	if (surface_get_width(surface) < 0 || last_select != select || (surface_get_width(surface) != width || surface_get_height(surface) != height))
		update = true

	surface = surface_require(surface, width, height)

	if (update) 
	{
		surface_set_target(surface)
		{
			draw_clear_alpha(c_black, 0)
			gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha)
		
			var tex = null;
			
			tex = select.sprite
			
			if (tex != null)
			{
				var padding, tw, th, dx, dy;
				padding = 16
				tw = texture_width(tex)
				th = texture_height(tex)
				if (reset_view)
				{
					preview_reset_view()
						
					zoom = (min(width, height) - padding * 2) / max(tw, th)
					goalzoom = zoom
					reset_view = false
				}
				dx = width / 2 - (tw / 2 + xoff) * zoom
				dy = height / 2 - (th / 2 + yoff) * zoom
				draw_texture(tex, dx, dy, zoom, zoom)
			}
			
			texture = tex
			gpu_set_blendmode(bm_normal)
		}
		surface_reset_target()
	
		update = false
	}

	draw_surface_exists(surface, xx, yy)
}

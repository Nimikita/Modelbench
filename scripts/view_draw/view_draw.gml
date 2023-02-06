/// view_draw(view)
/// @arg view

function view_draw(view)
{
	var boxx, boxy, boxw, boxh;
	var captionx, captiony, captionw, captionh;
	var padding, dx, dy;
	
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
	content_mouseon = (view.mouseon && !popup_mouseon && !toast_mouseon && !context_menu_mouseon)
	content_view = view
	
	draw_box(boxx, boxy, boxw, boxh, false, c_level_middle, 1)
	
	// Caption
	padding = 4
	captionx = boxx + 12
	captiony = boxy + padding
	captionw = boxw
	captionh = (program_mode = e_mode.MODELING ? 32 : 0)
	
	// Buttons
	var disable = program_mode != e_mode.MODELING;
	dw = 24
	dh = 24
	dx = boxx + boxw
	dy = boxy + padding
	
	// Textured rendering
	dx -= 16 + 4
	draw_settings_button("shading", dx, dy, 16, dh, false, settings_menu_shading, disable || setting_render_mode = e_viewport_render.FLAT)
	
	dx -= dw
	if (draw_button_icon("toolsettextured", dx, dy, dw, dh, setting_render_mode = e_viewport_render.TEXTURED, icons.SPHERE_TEXTURE, null, disable, "tooltiptexturedmode"))
		action_setting_render(e_viewport_render.TEXTURED)
	
	// Shaded rendering
	dx -= dw + 4
	if (draw_button_icon("toolsetshaded", dx, dy, dw, dh, setting_render_mode = e_viewport_render.SHADED, setting_theme.dark ? icons.SPHERE__DARK : icons.SPHERE, null, disable, "tooltipshadedmode"))
		action_setting_render(e_viewport_render.SHADED)
	
	// Flat rendering
	dx -= dw + 4
	if (draw_button_icon("toolsetflat", dx, dy, dw, dh, setting_render_mode = e_viewport_render.FLAT, icons.SPHERE_FLAT, null, disable, "tooltipflatmode"))
		action_setting_render(e_viewport_render.FLAT)
	
	// Divider
	dx -= 4
	draw_box(dx, dy, 1, dw, false, c_border, a_border)
	
	// Blocky bending
	dx -= dw + 4
	draw_button_icon("toolsetblockybending", dx, dy, dw, dh, setting_blocky_bending, icons.BEND_SHARP, action_setting_blocky_bending, false, setting_blocky_bending ? "tooltipblockybendingdisable" : "tooltipblockybendingenable")
	
	// Wind
	dx -= 16 + 4
	draw_settings_button("windsettings", dx, dy, 16, dh, false, settings_menu_wind)
	
	dx -= dw
	draw_button_icon("toolsetwind", dx, dy, dw, dh, setting_wind, icons.WIND, action_setting_wind, false, setting_wind ? "tooltipwinddisable" : "tooltipwindenable")
	
	// Overlays
	dx -= 16 + 4
	draw_settings_button("overlaysettings", dx, dy, 16, dh, false, settings_menu_overlays, disable)
	
	dx -= dw
	draw_button_icon("toolsetoverlays", dx, dy, dw, dh, setting_overlays, icons.OVERLAYS, action_setting_overlays, disable, setting_overlays ? "tooltipoverlaysdisable" : "tooltipoverlaysenable")
	
	// Divider
	dx -= 4
	draw_box(dx, dy, 1, dw, false, c_border, a_border)
	
	// Snap
	dx -= 16 + 4
	draw_settings_button("snapsettings", dx, dy, 16, dh, false, settings_menu_snap, disable)
	
	dx -= dw
	tip_set_shortcut(setting_key_snap)
	draw_button_icon("toolsetsnap", dx, dy, dw, dh, setting_snap, icons.MAGNET, action_setting_snap, disable, setting_snap ? "tooltipsnapdisable" : "tooltipsnapenable")
	tip_set_shortcut(-1)
	
	content_y = boxy + captionh
	content_height = boxh - captionh
	
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
		content_mouseon = (app_mouse_box(content_x, content_y, content_width, content_height) && view.mouseon && !popup_mouseon && !toast_mouseon && !context_menu_mouseon)
		
		// Preview transparency
		if (program_mode = e_mode.PREVIEW)
		{
			draw_box(boxx, boxy, boxw, boxh, false, c_level_middle, 1)
			
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
	
	// Floating toolbars
	var toolbarx, toolbary, toolbarwid, toolbarhei;
	toolbarx = boxx + 16
	toolbary = boxy + captionh + 16
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
	
	// Navigation
	toolbarx = boxx + boxw - (16 + 36)
	toolbarhei = 4 + (28 * 3) + (8) + 4
	
	if (app_mouse_box(toolbarx, toolbary, toolbarwid, toolbarhei))
		view.mouseon = false
	
	view_toolbar_nav_draw(toolbarx, toolbary, toolbarwid, toolbarhei)
	
	// Viewport toolbar
	if (program_mode = e_mode.MODELING)
	{
		draw_gradient(boxx, boxy + captionh, boxw, shadow_size, c_black, shadow_alpha, shadow_alpha, 0, 0)
		draw_box(boxx, boxy + captionh - 1, boxw, 1, false, c_border, a_border)
	}
}

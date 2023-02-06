/// toolbar_draw()

function toolbar_draw()
{
	content_x = 0
	content_y = 0
	content_width = window_width
	content_height = toolbar_size
	content_mouseon = (app_mouse_box(content_x, content_y, content_width, content_height) && !popup_mouseon && !toast_mouseon && !context_menu_mouseon)
	
	dx = content_x + 10
	dy = content_y
	
	// Background
	draw_box(content_x, content_y, content_width, content_height, false, c_level_top, 1)
	draw_divide(content_x, content_y + content_height, content_width)
	draw_gradient(content_x, content_y + content_height, content_width, shadow_size, c_black, shadow_alpha, shadow_alpha, 0, 0)
	
	var capwid, padding;
	padding = 0
	
	draw_set_font(font_value)
	
	capwid = string_width(text_get("toolbarfile")) + 16
	toolbar_draw_button("toolbarfile", dx, dy, capwid)
	dx += capwid + padding
	
	capwid = string_width(text_get("toolbaredit")) + 16
	toolbar_draw_button("toolbaredit", dx, dy, capwid)
	dx += capwid + padding
	
	capwid = string_width(text_get("toolbarview")) + 16
	toolbar_draw_button("toolbarview", dx, dy, capwid)
	dx += capwid + padding
	
	capwid = string_width(text_get("toolbarhelp")) + 16
	toolbar_draw_button("toolbarhelp", dx, dy, capwid)
	dx += capwid + padding
	
	
	var boxx, boxy, boxw, boxh;
	boxx = 0
	boxy = 0
	boxw = window_width
	boxh = toolbar_size
	content_direction = e_scroll.HORIZONTAL
	
	content_x = boxx
	content_y = boxy
	content_width = boxw
	content_height = boxh
	content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height)
	
	/*
	dx = boxx + 4
	dy = boxy
	
	draw_box(content_x, content_y, content_width, content_height, false, c_level_middle, 1)
	draw_gradient(content_x, content_y + content_height, content_width, shadow_size, c_black, shadow_alpha, shadow_alpha, 0, 0)
	
	draw_menu_button(dx, dy, boxh, boxh)
	dx += boxh + 4
	//dy += 4
	
	draw_button_icon("toolbarundo", dx, dy, 28, 28, false, icons.UNDO, action_toolbar_undo, history_pos = history_amount, "tooltipundo")
	dx += 28 + 4
	draw_button_icon("toolbarredo", dx, dy, 28, 28, false, icons.REDO, action_toolbar_redo, history_pos = 0, "tooltipredo")
	*/
	
	// Program mode buttons
	draw_set_font(font_button)
	var w;
	w = string_width(text_get("toolbarmodeling")) + 32 + string_width(text_get("toolbarpreview")) + 32
	dx = round(boxx + (boxw/2) - w / 2)
	
	// Modeling
	draw_toolbar_button("toolbarmodeling", dx, boxy, e_mode.MODELING, program_mode, null)
	
	// Preview
	draw_toolbar_button("toolbarpreview", dx, boxy, e_mode.PREVIEW, program_mode, null)
	
	// Tab underline
	draw_box(toolbar_line_x, content_y + content_height - 2, toolbar_line_width, 2, false, c_accent, 1)
	
	dx = boxw - (28 + 4)
	
	// Modeling buttons
	/*
	if (program_mode = e_mode.MODELING)
	{
		// Toggle UV editor
		tip_set_shortcut(setting_key_uv_editor)
		draw_button_icon("toolbaruveditor", dx, dy, 28, 28, setting_show_uv_editor, icons.TEXTURE, action_toolbar_show_uv_editor, false, (setting_show_uv_editor ? "tooltipuveditorhide" : "tooltipuveditorshow"))
		tip_set_shortcut(-1)
	}
	*/
	
	if (program_mode = e_mode.PREVIEW)
		draw_button_icon("toolbarguides", dx, dy, 28, 28, setting_preview_guides, icons.LETTERBOX, action_toolbar_preview_guides, false, (setting_preview_guides ? "tooltipguideshide" : "tooltipguidesshow"))
}

/// draw_element_item(element, y, [increment])
/// @arg element
/// @arg y
/// @arg [increment]
/// @desc Draws an element item

var element, yy, increment;
var itemx, itemy, itemw, itemh, itemhover, expandhover, lockhover, visiblehover, itemvisible, xx, linex, minw;
element = argument[0]
yy = argument[1]
increment = 0

if (argument_count > 2)
	increment = argument[2]

itemx = dx + (24 * increment)
itemy = yy
itemw = dw - (24 * increment)
itemh = 28
itemhover = app_mouse_box(dx, itemy, dw, itemh)
expandhover = false
lockhover = false
itemvisible = (itemy < window_height) && (itemy + itemh > 0)

//microani_set(string(element) + "listitem", null, itemhover, false, false, 0.25)
//microani_update(itemhover, false, false)

//	current_mcroani.hover_ani = 1
if (itemhover && itemvisible)
{
	mouse_cursor = cr_handpoint
	draw_box(dx, itemy, dw, itemh, false, c_neutral10, a_neutral10)
}

if (element.selected)
	draw_box(dx, itemy, dw, itemh, false, c_accent10, a_accent10)

xx = itemx + itemw - 24
minw = 20 + 4 + 20 + 8 + string_width_font("...", font_value) + (8 + 20 + 4 + 20)

#region Right side icons

// Visible
if (itemvisible)
{
	if (itemhover || element.hidden)
	{
		if (draw_button_icon("assetselementhidden" + string(element), xx, itemy + 4, 20, 20, element.hidden, e_icon.show + element.hidden, null, null, test(element.hidden, "tooltipshow", "tooltiphide")))
		{
			element.hidden = !element.hidden
			el_update_hidden_tree(false)
		}
		visiblehover = app_mouse_box(xx, itemy + 4, 20, 20)
	}
	else if (element.tree_hidden)
		draw_image(spr_icons, e_icon.dot, xx + 10, itemy + 14, 1, 1, c_neutral50, a_neutral50)
}


xx -= 24

// Locked
if (itemvisible)
{
	if (itemhover || element.locked)
	{
		if (draw_button_icon("assetselementlock" + string(element), xx, itemy + 4, 20, 20, element.locked, e_icon.unlock - element.locked, null, null, test(element.locked, "tooltipunlock", "tooltiplock")))
		{
			element.locked = !element.locked
			el_update_lock_tree(false)
		}
		lockhover = app_mouse_box(xx, itemy + 4, 20, 20)
	}
	else if (element.tree_locked)
		draw_image(spr_icons, e_icon.dot, xx + 10, itemy + 14, 1, 1, c_neutral50, a_neutral50)
}

#endregion

xx = min(dx + dw - minw, itemx + 4)

#region Left side icons

// Expand/collapse children/shape list(s)
var showbutton;
showbutton = element.element_type = TYPE_PART
showbutton = showbutton && ((element.part_list != null && ds_list_size(element.part_list) > 0) || (!setting_hide_shapes && (element.shape_list != null && ds_list_size(element.shape_list) > 0)))
if (itemvisible && showbutton)
{
	if (draw_button_icon("assetspartshowchildren" + string(element), xx, itemy + 4, 20, 20, element.extend, null, null, null, test(element.extend, "tooltipcollapse", "tooltipexpand"), spr_arrow_small_ani))
		element.extend = !element.extend
}
expandhover = app_mouse_box(xx, itemy + 4, 20, 20)

xx += 24

// Element icon
if (itemvisible)
{
	var icon;
	if (element.element_type = TYPE_PART)
		icon = e_icon.part
	else
	{
		if (element.type = "block")
			icon = e_icon.block
		else if (element.type = "plane")
		{
			if (element.value[e_value.EXTRUDE])
				icon = e_icon.plane3d
			else
				icon = e_icon.plane
		}
	}

	draw_image(spr_icons, icon, xx + 10, itemy + (itemh/2), 1, 1, c_neutral30, a_neutral30)
}

#endregion

linex = xx + 10
xx += 28

// Element name
if (itemvisible)
{
	var labelname, labelshort, labelcolor, labelalpha;
	labelname = element.name
	
	if (labelname = "")
	{
		if (element.element_type = TYPE_PART)
			labelname = text_get("assetsnewpart")
		else
			labelname = text_get("assetsnewshape")
	}
	
	if (element.name = "" || element.hidden || element.tree_hidden)
	{
		labelcolor = c_neutral40
		labelalpha = a_neutral40
	}
	else
	{
		labelcolor = c_neutral60
		labelalpha = a_neutral60
	}
	
	labelshort = string_limit_font(labelname, itemw - (xx - itemx) - 52, font_value)
	draw_label(labelshort, xx, itemy + (itemh/2), fa_left, fa_middle, labelcolor, labelalpha, font_value)
	
	// Preview name tooltip
	if (string_width(labelname) > itemw - (xx - itemx) - 52)
		tip_set(labelname, xx, itemy, string_width_font(labelshort, font_value), 28)
}

// Advance vertical drawing
dy += 28

if (itemhover && !expandhover && !lockhover && !visiblehover)
{
	draw_box_hover(dx, itemy, dw, itemh, 1)
	
	if (mouse_left_pressed)
		action_el_select(element)
}	

// Is this a part and should we draw children?
if (element.element_type = TYPE_PART && element.extend)
{
	// Draw shapes
	if (element.shape_list != null && !setting_hide_shapes)
	{
		if (itemvisible)
			draw_box(linex, itemy + itemh, 1, (28 * ds_list_size(element.shape_list)) - 13, false, c_neutral20, a_neutral20)
		
		for(var i = 0; i < ds_list_size(element.shape_list); i++)
		{
			if (itemvisible)
				draw_box(linex + 1, dy + (itemh/2), 9, 1, false, c_neutral20, a_neutral20)
			
			draw_element_item(element.shape_list[|i], dy, increment + 1)
		}
	}
	
	// Draw children parts
	if (element.part_list != null)
	{
		for(var i = 0; i < ds_list_size(element.part_list); i++)
			draw_element_item(element.part_list[|i], dy, increment + 1)
	}
}

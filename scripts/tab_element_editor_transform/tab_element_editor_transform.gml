/// tab_element_editor_transform()

function tab_element_editor_transform()
{
	dy -= 8
	
	var taby, shape;
	shape = (el_edit.element_type = TYPE_SHAPE)
	
	// Position
	taby = dy
	microani_set("tabposition", null, false, false, false)
	tab_element_editor_position()
	microani_set("tabposition", null, false, false, false)
	microani_update(app_mouse_box(dx, taby, dw, dy - taby) && content_mouseon, false, false)
	
	// Offset
	if (shape)
	{
		taby = dy
		microani_set("taboffset", null, false, false, false)
		tab_element_editor_offset()
		microani_set("taboffset", null, false, false, false)
		microani_update(app_mouse_box(dx, taby, dw, dy - taby) && content_mouseon, false, false)
	}
	
	// Rotation
	taby = dy
	microani_set("tabrotation", null, false, false, false)
	tab_element_editor_rotation()
	microani_set("tabrotation", null, false, false, false)
	microani_update(app_mouse_box(dx, taby, dw, dy - taby) && content_mouseon, false, false)
	
	// Size
	if (shape)
	{
		taby = dy
		microani_set("tabsize", null, false, false, false)
		tab_element_editor_size()
		microani_set("tabsize", null, false, false, false)
		microani_update(app_mouse_box(dx, taby, dw, dy - taby) && content_mouseon, false, false)
	}
	
	// Scale
	taby = dy
	microani_set("tabscale", null, false, false, false)
	tab_element_editor_scale()
	microani_set("tabscale", null, false, false, false)
	microani_update(app_mouse_box(dx, taby, dw, dy - taby) && content_mouseon, false, false)
	
	// Lock to bent half
	if (el_edit.element_type = TYPE_PART)
	{
		// Lock to bent half
		tab_control_switch()
		draw_switch("elementeditorbendlock", dx, dy, el_edit.value[e_value.BEND_LOCK], action_el_bend_lock, "")
		tab_next()
	}
}

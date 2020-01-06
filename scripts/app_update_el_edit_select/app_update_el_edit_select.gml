/// app_update_el_edit_select()

with (app.element_editor)
{
	pivot_offset.enabled = false
	size.enabled = false
	bend.enabled = false
	appearance.enabled = false
	wind.enabled = false
	mineimator.enabled = false
}

with (obj_model_element)
{
	if (!selected)
		continue
	
	if (element_type = TYPE_PART)
	{
		app.element_editor.bend.enabled = true
		app.element_editor.mineimator.enabled = true
	}
	else
	{
		app.element_editor.pivot_offset.enabled = true
		app.element_editor.pivot_offset.enabled = true
		app.element_editor.size.enabled = true
		app.element_editor.appearance.enabled = true
		app.element_editor.wind.enabled = true
	}
}

with (app.element_editor.size)
{
	if (el_edit != null && el_edit.element_type = TYPE_SHAPE)
	{
		if (el_edit.type = "block")
		{
			// All dimensions are visible for cubes
			tbx_width.next_tbx = tbx_length
			tbx_length.next_tbx = tbx_height
			tbx_height.next_tbx = tbx_width
		}
		else
		{
			// Length is hidden for planes
			tbx_width.next_tbx = tbx_height
			tbx_height.next_tbx = tbx_width
		}
	}
}

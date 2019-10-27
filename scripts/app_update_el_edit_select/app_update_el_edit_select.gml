/// app_update_el_edit_select()

with (app.element_editor)
{
	//position.enabled = false
	pivot_offset.enabled = false
	//rotation.enabled = false
	size.enabled = false
	//scale.enabled = false
	bend.enabled = false
	//material.enabled = false
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

view_control_update_rotate()

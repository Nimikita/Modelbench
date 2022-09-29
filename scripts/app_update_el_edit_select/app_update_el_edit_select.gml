/// app_update_el_edit_select()

function app_update_el_edit_select()
{
	with (app.element_editor)
	{
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
			app.element_editor.mineimator.enabled = (app.setting_feature_set = e_features.MIMODEL)
		}
		else
		{
			app.element_editor.appearance.enabled = true
			app.element_editor.wind.enabled = (app.setting_feature_set = e_features.MIMODEL)
		}
	}
	
	with (app.element_editor.transform)
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
}

/// app_update_previews()

function app_update_previews()
{
	tex_preview.select = res_edit
	
	with (obj_preview)
	{
		if (last_select != select)
		{
			preview_reset_view()
			reset_view = true
			update = true
		}
		last_select = select
	}
}

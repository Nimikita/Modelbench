/// tab_preview_background()

function tab_preview_background()
{
	// Scenery
	var sceneryrows, sceneryboxx, sceneryboxy, sceneryboxw;
	sceneryrows = ceil(ds_list_size(scenery_list)/5)
	sceneryboxx = dx
	sceneryboxy = dy + 22
	sceneryboxw = (dw - (7*4)) / 5
	
	tab_control((48 * sceneryrows) + (7 * sceneryrows) + 22)
	draw_label(text_get("previewscenery"), dx, sceneryboxy - 7, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_label)
	
	for (var i = 0; i < ds_list_size(scenery_list); i++)
	{
		draw_scenery_item(sceneryboxx, sceneryboxy, sceneryboxw, 48, i)
		
		sceneryboxx += sceneryboxw + 7
		
		if (mod_fix(i, 5) = 4)
		{
			sceneryboxx = dx
			sceneryboxy += 7 + 48
		}
	}
	tab_next()
	
	// Light rotation
	tab_control_meter()
	draw_meter("previewlightrotation", dx, dy, dw, setting_preview_light_rotation, 48, 0, 360, 225, 1, tab.background.tbx_light_rotation, action_preview_light_rotation)
	tab_next()
	
	// Light range
	tab_control_meter()
	draw_meter("previewlightrange", dx, dy, dw, setting_preview_light_range, 48, 100, 500, 200, 10, tab.background.tbx_light_range, action_preview_light_range)
	tab_next()
}

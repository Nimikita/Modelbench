/// view_click(view, camera)
/// @arg view
/// @arg camera

function view_click(view, cam)
{
	var surf;
	
	if (program_mode != e_mode.MODELING)
		return 0
	
	surf = surface_create(content_width, content_height)
	
	render_camera = cam
	render_ratio = content_width / content_height
	
	surface_set_target(surf)
	{
		draw_clear(c_black)
		render_world_start()
		render_world(e_render_mode.CLICK)
		render_world_done()
	}
	surface_reset_target()
	
	// Single click
	if (window_busy != "viewgroupselect")
	{
		var el = surface_getpixel(surf, mouse_x - content_x, mouse_y - content_y);
		if (el > 0)
		{
			// Find element to select
			if (!el_edit && !keyboard_check(vk_control))
				while (el.parent.object_index != app && !el.parent.tree_locked)
					el = el.parent
			
			// Select
			action_el_select(el)
			
			// Jump in list
			if (true)
				assets.elements.show = true
		}
		else
			if (!keyboard_check(vk_shift))
				action_el_deselect_all()
	}
	else // Group select
	{
		var selectlist = ds_list_create();
		
		var minx, maxx, miny, maxy, sample;
		minx = min(mouse_x, mouse_click_x) - content_x
		maxx = max(mouse_x, mouse_click_x) - content_x
		miny = min(mouse_y, mouse_click_y) - content_y
		maxy = max(mouse_y, mouse_click_y) - content_y
		sample = 0
		
		mouse_cursor = cr_hourglass
		window_set_cursor(mouse_cursor)
		
		for (var i = minx; i < maxx; i++)
		{
			for (var j = miny; j < maxy; j++)
			{
				sample++
				
				if ((sample mod 50) != 0 && i > minx && i < maxx && j > miny && j < maxy)
					continue
				
				var el = surface_getpixel(surf, i, j);
				if (el > 0)
				{
					if (!el_edit && !keyboard_check(vk_control))
						while (el.parent.object_index != app && !el.parent.tree_locked)
							el = el.parent
					
					if (ds_list_find_index(selectlist, el) = -1)
						ds_list_add(selectlist, el)
				}
			}
		}
		
		if (!ds_list_empty(selectlist))
		{
			action_el_select_list(selectlist)
			assets.elements.show = true
		}
		
		ds_list_destroy(selectlist)
	}
	
	surface_free(surf)
}

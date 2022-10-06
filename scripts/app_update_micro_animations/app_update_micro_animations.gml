/// app_update_micro_animations()

function app_update_micro_animations()
{
	var constantspeed, inease, outease;
	constantspeed = 0.095
	inease = "easeoutcirc"
	outease = "easeoutcirc"
	
	// Program mode underline
	if (setting_reduced_motion)
	{
		toolbar_line_x = toolbar_line_x_goal
		toolbar_line_width = toolbar_line_width_goal
	}
	else
	{
		toolbar_line_x += (toolbar_line_x_goal - toolbar_line_x) / max(1, 3 / delta)
		toolbar_line_width += (toolbar_line_width_goal - toolbar_line_width) / max(1, 3 / delta)
	}
	
	// Scrollbars
	with (obj_scrollbar)
	{
		if (app.setting_reduced_motion || !value_ease)
			value = value_goal
		else
			value += floor((value_goal - value) / max(1, 4 / delta))
		
		mousenear.update(constantspeed)
	}
	
	// Viewport toolbars
	if (setting_reduced_motion)
	{
		toolbar_tools_alpha = toolbar_tools_alpha_goal
		toolbar_nav_alpha = toolbar_nav_alpha_goal
	}
	else
	{
		toolbar_tools_alpha += (toolbar_tools_alpha_goal - toolbar_tools_alpha) / max(1, 4 / delta)
		toolbar_nav_alpha += (toolbar_nav_alpha_goal - toolbar_nav_alpha) / max(1, 4 / delta)
	}
	
	// Component animations
	for (var i = 0; i < ds_list_size(microani_list); i++)
	{
		var ani = microani_list[|i];
		
		// Delete after 3 seconds
		if (ani.steps_hidden > 60 * 3)
		{
			ds_list_add(microani_delete_list, ani)
			continue
		}
		
		ani.steps_alive++
		ani.steps_hidden++
		
		ani.update(constantspeed * 1.5)
	}
	
	for (var i = 0; i < ds_list_size(microani_delete_list); i++)
	{
		var ani = microani_delete_list[|i];
		
		ds_list_delete_value(microani_list, ani)
		ds_map_delete(microanis, ani.key)
		
		delete ani
	}
	ds_list_clear(microani_delete_list)
}

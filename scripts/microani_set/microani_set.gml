/// microani_set(name, script, hover, click, active, [speed])
/// @arg name
/// @arg script
/// @arg hover
/// @arg click
/// @arg active
/// @arg [speed]
/// @desc Sets the global micro animation

function microani_set()
{
	var name, script, hover, click, active, spd;
	name = argument[0]
	script = argument[1]
	hover = argument[2]
	click = argument[3]
	active = argument[4]
	spd = 1
	
	if (argument_count > 5)
		spd = argument[5]
	
	if (true)
	{
		var animation;
		
		// Create micro animation object if it doesn't already exist
		if (!ds_map_exists(microanis, name + string(script)))
		{
			animation = new_animation(name + string(script), active)
			animation.spd = spd
		}
		else
			animation = ds_map_find_value(microanis, name + string(script))
		
		current_mcroani = animation
		current_mcroani.steps_hidden = 0
		
		mcroani_arr[e_mcroani.HOVER_LINEAR] = current_mcroani.hover_ani
		mcroani_arr[e_mcroani.PRESS_LINEAR] = current_mcroani.holding_ani
		mcroani_arr[e_mcroani.ACTIVE_LINEAR] = current_mcroani.value_ani
		mcroani_arr[e_mcroani.DISABLED_LINEAR] = current_mcroani.disabled_ani
		
		mcroani_arr[e_mcroani.HOVER] = current_mcroani.hover_ani_ease
		mcroani_arr[e_mcroani.PRESS] = current_mcroani.holding_ani_ease
		mcroani_arr[e_mcroani.ACTIVE] = current_mcroani.value_ani_ease
		mcroani_arr[e_mcroani.DISABLED] = current_mcroani.disabled_ani_ease
	}
	else
	{
		mcroani_arr[e_mcroani.HOVER] = hover
		mcroani_arr[e_mcroani.PRESS] = click
		mcroani_arr[e_mcroani.ACTIVE] = active
		
		mcroani_arr[e_mcroani.HOVER_LINEAR] = hover
		mcroani_arr[e_mcroani.PRESS_LINEAR] = click
		mcroani_arr[e_mcroani.ACTIVE_LINEAR] = active
	}
}

/// app_update_animations()

/* Drop-down menu animation
if (menu_ani_type = "hide") //Hide
{
	menu_ani -= 0.1 * delta
	if (menu_ani <= 0)
	{
		menu_ani = 0
		menu_name = ""
		menu_clear()
	}
}
else if (menu_ani_type = "show") //Show
{
	menu_ani += 0.1 * delta
	if (menu_ani >= 1)
	{
		menu_ani = 1
		menu_ani_type = ""
	}
}
*/

/* Content menu animation
if (context_menu_ani_type = "hide") //Hide
{
	context_menu_ani -= 0.1 * delta
	if (context_menu_ani <= 0)
	{
		context_menu_ani = 0
		context_menu_name = ""
		context_menu_clear()
		context_menu_active = false
	}
}
else if (context_menu_ani_type = "show") //Show
{
	context_menu_ani += 0.065 * delta
	if (context_menu_ani >= 1)
	{
		context_menu_ani = 1
		context_menu_ani_type = ""
	}
}
*/

var constantspeed, inease, outease;
constantspeed = 0.095
inease = "easeincirc"
outease = "easeoutcirc"

// Component animations
with (obj_micro_animation)
{
	if (!hover)
	{
		hover_ani -= (constantspeed * spd) * delta
		hover_ease = inease
	}
	else
	{
		hover_ani += (constantspeed * spd) * delta
		hover_ease = outease
	}
	
	if (!value && keep_toggle)
	{
		value_ani -= (constantspeed * spd) * delta
		value_ease = inease
	}
	else
	{
		value_ani += (constantspeed * spd) * delta
		value_ease = outease
	}
	
	if (!holding)
	{
		holding_ani -= (constantspeed * spd) * delta
		holding_ease = inease
	}
	else
	{
		holding_ani += (constantspeed * spd) * delta
		holding_ease = outease
	}
	
	if (!disabled)
	{
		disabled_ani -= (constantspeed * spd) * delta
		disabled_ease = inease
	}
	else
	{
		disabled_ani += (constantspeed * spd) * delta
		disabled_ease = outease
	}
	
	hover_ani = clamp(hover_ani, 0, 1)
	value_ani = clamp(value_ani, 0, 1)
	holding_ani = clamp(holding_ani, 0, 1)
	disabled_ani = clamp(disabled_ani, 0, 1)
	
	hover_ani_ease = ease(hover_ease, hover_ani)
	value_ani_ease = ease(value_ease, value_ani)
	holding_ani_ease = ease(holding_ease, holding_ani)
	disabled_ani_ease = ease(disabled_ease, disabled_ani)
}

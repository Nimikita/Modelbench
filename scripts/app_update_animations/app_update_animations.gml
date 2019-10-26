/// app_update_animations()

var constantspeed, inease, outease;
constantspeed = 0.095
inease = "easeoutcirc"
outease = "easeoutcirc"

toolset_alpha += (toolset_alpha_goal - toolset_alpha) / max(1, 4 / delta)
toolset_snap_alpha += (toolset_snap_alpha_goal - toolset_snap_alpha) / max(1, 4 / delta)

// Component animations
with (obj_micro_animation)
{	
	#region Hover
	if (hover != hover_prev || steps_alive = 0)
	{
		hover_base = hover_ani
		hover_prev = hover
		
		if (!hover)
		{
			hover_offset = -hover_base
			hover_offset_ani = 0.0
		}
		else
		{
			hover_offset = 1.0 - hover_base
			hover_offset_ani = 0.0
		}
	}
	
	hover_offset_ani += (constantspeed * spd) * delta
	hover_offset_ani_ease = ease(test(hover, outease, inease), hover_offset_ani)
	hover_offset_ani = clamp(hover_offset_ani, 0, 1)
	
	hover_ani = hover_base + (hover_offset * hover_offset_ani)
	hover_ani = clamp(hover_ani, 0, 1)
	
	hover_ani_ease = hover_base + (hover_offset * hover_offset_ani_ease)
	hover_ani_ease = clamp(hover_ani_ease, 0, 1)
	
	#endregion
	
	#region Value
	if (value != value_prev || steps_alive = 0)
	{
		value_base = value_ani
		value_prev = value
		
		if (!value)
		{
			value_offset = -value_base
			value_offset_ani = 0.0
		}
		else
		{
			value_offset = 1.0 - value_base
			value_offset_ani = 0.0
		}
	}
	
	value_offset_ani += (constantspeed * spd) * delta
	value_offset_ani_ease = ease(test(value, outease, inease), value_offset_ani)
	value_offset_ani = clamp(value_offset_ani, 0, 1)
	
	value_ani = value_base + (value_offset * value_offset_ani)
	value_ani = clamp(value_ani, 0, 1)
	
	value_ani_ease = value_base + (value_offset * value_offset_ani_ease)
	value_ani_ease = clamp(value_ani_ease, 0, 1)
	
	#endregion
	
	#region Holding
	if (holding != holding_prev || steps_alive = 0)
	{
		holding_base = holding_ani
		holding_prev = holding
		
		if (!holding)
		{
			holding_offset = -holding_base
			holding_offset_ani = 0.0
		}
		else
		{
			holding_offset = 1.0 - holding_base
			holding_offset_ani = 0.0
		}
	}
	
	holding_offset_ani += (constantspeed * spd) * delta
	holding_offset_ani_ease = ease(test(holding, outease, inease), holding_offset_ani)
	holding_offset_ani = clamp(holding_offset_ani, 0, 1)
	
	holding_ani = holding_base + (holding_offset * holding_offset_ani)
	holding_ani = clamp(holding_ani, 0, 1)
	
	holding_ani_ease = holding_base + (holding_offset * holding_offset_ani_ease)
	holding_ani_ease = clamp(holding_ani_ease, 0, 1)holding_ease = outease
	
	#endregion
	
	#region Disabled
	if (disabled != disabled_prev || steps_alive = 0)
	{
		disabled_base = disabled_ani
		disabled_prev = disabled
		
		if (!disabled)
		{
			disabled_offset = -disabled_base
			disabled_offset_ani = 0.0
		}
		else
		{
			disabled_offset = 1.0 - disabled_base
			disabled_offset_ani = 0.0
		}
	}
	
	disabled_offset_ani += (constantspeed * spd) * delta
	disabled_offset_ani_ease = ease(test(disabled, outease, inease), disabled_offset_ani)
	disabled_offset_ani = clamp(disabled_offset_ani, 0, 1)
	
	disabled_ani = disabled_base + (disabled_offset * disabled_offset_ani)
	disabled_ani = clamp(disabled_ani, 0, 1)
	
	disabled_ani_ease = disabled_base + (disabled_offset * disabled_offset_ani_ease)
	disabled_ani_ease = clamp(disabled_ani_ease, 0, 1)
	
	#endregion
	
	steps_alive++
}

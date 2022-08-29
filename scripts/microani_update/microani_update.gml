/// microani_update(hover, click, active, [disabled])
/// @arg hover
/// @arg click
/// @arg active
/// @arg [disabled]
/// @desc Updates the current micro animation

function microani_update()
{
	if (current_mcroani != null)
	{
		current_mcroani.hover = argument[0]
		current_mcroani.holding = argument[1]
		current_mcroani.value = argument[2]
		
		if (argument_count > 3)
			current_mcroani.disabled = argument[3]
	}
}

/// action_setting_blocky_bending(value)
/// @arg value

setting_blocky_bending = argument0

// Update shapes
with (obj_model_element)
{
	if (element_type = TYPE_SHAPE)
	{
		if (parent.value[e_value.BEND] && bend_shape && bend_size = null && !array_compare_value(bend_default_angle, 0))
			shape_update_vbuffer()
	}
}

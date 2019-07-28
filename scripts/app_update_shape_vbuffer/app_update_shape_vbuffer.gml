/// app_update_shape_vbuffer()
/// @desc Updates shape vertex buffers if needed

//if (setting_slow_generation && (floor(current_step) mod 2 != 0))
//	return 0

with (obj_model_element)
{
	if (element_type = TYPE_SHAPE && update_vbuffer)
	{
		shape_update_vbuffer()
		update_vbuffer = false
		
		if (app.setting_slow_generation)
			break
	}
}

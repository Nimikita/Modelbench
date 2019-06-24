/// app_update_shape_vbuffer()
/// @desc Updates shape vertex buffers if needed

with (obj_model_element)
{
	if (element_type = TYPE_SHAPE && update_vbuffer)
	{
		shape_update_vbuffer()
		update_vbuffer = false
	}
}

/// el_value_get_save_id(valueid, value)
/// @arg valueid
/// @arg value

function el_value_get_save_id(vid, val)
{
	if (vid = e_value.TEXTURE_OBJ && val = 0)
		return "none"
	
	if (vid = e_value.TEXTURE_OBJ)
		return save_id_get(val)
	
	return val
}

/// el_value_find_save_id(valueid, oldvalue, newvalue)
/// @arg valueid
/// @arg oldvalue
/// @arg newvalue

function el_value_find_save_id(vid, oldval, newval)
{
	if (vid = e_value.TEXTURE_OBJ && newval = "none")
		newval = 0
	else if (vid = e_value.TEXTURE_OBJ)
	{
		//log(string(newval))
		newval = save_id_find(newval)
		//log(string(newval))
	}
	
	return newval
}

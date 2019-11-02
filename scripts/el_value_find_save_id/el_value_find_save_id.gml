/// el_value_find_save_id(valueid, oldvalue, newvalue)
/// @arg valueid
/// @arg oldvalue
/// @arg newvalue

var vid, oldval, newval;
vid = argument0
oldval = argument1
newval = argument2

if (vid = e_value.TEXTURE_OBJ && newval = "none")
	newval = 0
else if (vid = e_value.TEXTURE_OBJ)
{
	//log(string(newval))
	newval = save_id_find(newval)
	//log(string(newval))
}

return newval

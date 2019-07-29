/// save_id_find(saveid)
/// @arg saveid
/// @desc Finds the instance with the given save ID.

var saveid = argument0;

if (!is_string(saveid) || saveid = "")
	return null

with (app)
	if (save_id = saveid)
		return app
	
with (obj_model_element)
	if (save_id = saveid)
		return id

return null

/// save_id_find(saveid)
/// @arg saveid
/// @desc Finds the instance with the given save ID.

function save_id_find(saveid)
{
	if (!is_string(saveid) || saveid = "")
		return null
	
	with (app)
		if (save_id = saveid)
			return app
	
	with (obj_model_element)
		if (save_id = saveid)
			return id
	
	with (obj_texture)
		if (save_id = saveid)
			return id
	
	return null
}

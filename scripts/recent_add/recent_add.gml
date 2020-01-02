/// recent_add()
/// @desc Adds the opened model to the top of the recent list.

recent_add_wait = false

if (model_temporary)
	return false

// Find model in list
var obj = null;
for (var i = 0; i < ds_list_size(recent_list); i++)
{
	with (recent_list[|i])
	{
		if (filename != app.model_file)
			break
			
		obj = id
		ds_list_delete_value(app.recent_list, id)
	}
	
	if (obj != null)
		break
}

// Model not added, create new object
if (obj = null)
	obj = new(obj_recent)

// Store data
with (obj)
{
	filename = app.model_file
	last_opened = date_current_datetime()
	pinned = false
	ds_list_insert(app.recent_list, 0, id)
}

recent_update()
recent_save()
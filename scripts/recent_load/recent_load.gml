/// recent_load()

if (!file_exists_lib(recent_file))
	return 0

var recentmap = json_load(recent_file);

if (recentmap = undefined)
	return 0

with (obj_recent)
	instance_destroy()

ds_list_clear(recent_list)

var recentlist = recentmap[?"list"];

for (var i = 0; i < ds_list_size(recentlist); i++)
{
	var modelmap = recentlist[|i];
	
	if (ds_map_valid(modelmap))
	{
		var recentobj = new(obj_recent);
		recentobj.name = value_get_string(modelmap[?"model_name"], "")
		recentobj.last_opened = value_get_real(modelmap[?"last_opened"], -1)
		recentobj.pinned = value_get_real(modelmap[?"pinned"], false)
		recentobj.remove = false
		
		ds_list_add(recent_list, recentobj)
	}
}

recent_list_amount = ds_list_size(recent_list)
recent_update()

/// preview_scenery_load()

with (obj_scenery)
	instance_destroy()

ds_list_clear(scenery_list)

var scenerymap = json_load(scenery_file);

if (ds_map_valid(scenerymap))
{
	var scenerylist = scenerymap[?"scenery"];
	
	// Load list of sceneries
	if (ds_list_valid(scenerylist))
	{
		var scene, sobj;
		
		for (var i = 0; i < ds_list_size(scenerylist); i++)
		{
			scene = scenerylist[|i]
			sobj = new(obj_scenery)
			
			sobj.name = value_get_string(scene[?"name"], "???")
			sobj.background_top = value_get_color(scene[?"backgroundtop"], c_white)
			sobj.background_bottom = value_get_color(scene[?"backgroundbottom"], c_white)
			sobj.ambient_color = value_get_color(scene[?"ambientcolor"], c_white)
			
			sobj.light_color[0] = value_get_color(scene[?"lightcolor"], c_white)
			sobj.light_color[1] = value_get_color(scene[?"lightcolor2"], c_black)
			sobj.light_color[2] = value_get_color(scene[?"lightcolor3"], c_black)
			
			var cubemap = scene[?"cubemap"];
			
			if (ds_map_valid(cubemap))
			{
				sobj.cubemap_fn = value_get_string(cubemap[?"texture"], "")
				sobj.cubemap_sprite = texture_create(textures_directory + sobj.cubemap_fn)
				sobj.cubemap_repeat = value_get_real(cubemap[?"texture_repeat"], 1)
				sobj.cubemap_mapped = value_get_real(cubemap[?"texture_mapped"], false)
			}
			else
			{
				sobj.cubemap_fn = ""
				sobj.cubemap_sprite = null
				sobj.cubemap_repeat = 1
				sobj.cubemap_mapped = false
			}
			
			ds_list_add(scenery_list, sobj)
		}
	}
	
	ds_map_destroy(scenerymap)
}
else
{
	log("There was an issue loading the scenery file", scenery_file)
}

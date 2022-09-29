/// app_startup_collapse()

function app_startup_collapse()
{
	globalvar collapse_map, collapse_ani, collapse_groups;
	collapse_ani = 1
	collapse_groups = 0
	
	collapse_map = ds_map_create()
	
	collapse_register("backup")
	collapse_register("file")
	collapse_register("edit")
	collapse_register("tools")
	collapse_register("camera")
	
	collapse_register("bend_x")
	collapse_register("bend_y")
	collapse_register("bend_z")
}

/// model_save_wind()

if (value[e_value.WIND_AXIS] = e_vertex_wave.NONE)
	return 0

var axis, miny, maxy;
axis = "all";
miny = null
maxy = null

json_save_object_start("wind")

if (value[e_value.WIND_AXIS] = e_vertex_wave.Z_ONLY)
	axis = "y"

json_save_var("axis", axis)

if (value[e_value.WIND_ZMIN_ENABLE])
	json_save_var("ymin", value[e_value.WIND_ZMIN])
	
if (value[e_value.WIND_ZMAX_ENABLE])
	json_save_var("ymax", value[e_value.WIND_ZMAX])

json_save_object_done()
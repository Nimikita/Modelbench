/// model_save_start(filename)
/// @arg filename

json_save_start(argument0)
json_save_object_start()
json_save_var("name", model_name)
model_save_texture()

if (player_skin)
	json_save_var_bool("player_skin", true)

if (!vec3_equals(root_scale, vec3(1)))
	json_save_var_point3D("scale", root_scale)

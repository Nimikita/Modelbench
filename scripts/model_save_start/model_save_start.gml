/// model_save_start(filename)
/// @arg filename

function model_save_start(fn) 
{
	json_save_start(fn)
	json_save_object_start()
	
	// Name can't be empty
	if (model_name = "")
	{
		json_save_var("name", json_string_encode(" "))
		json_save_var("name_mb", json_string_encode(""))
	}
	else
		json_save_var("name", json_string_encode(model_name))
	
	model_save_texture()
	
	if (player_skin)
		json_save_var_bool("player_skin", true)
	
	if (root_scale != 1)
		json_save_var_point3D("scale", vec3(root_scale))
}

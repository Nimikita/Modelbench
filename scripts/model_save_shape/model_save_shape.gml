/// model_save_shape()

function model_save_shape()
{
	json_save_var("type", type)
	
	if (name != "")
		json_save_var("description", json_string_encode(name))
	
	model_save_texture()
	
	model_save_colors()
	
	json_save_var_point3D("from", point3D(value[e_value.FROM_X], value[e_value.FROM_Y], value[e_value.FROM_Z]))
	json_save_var_point3D("to", point3D(value[e_value.TO_X], value[e_value.TO_Y], value[e_value.TO_Z]))
	json_save_var_point2D("uv", point2D(value[e_value.UV_X], value[e_value.UV_Y]))
	
	if (value[e_value.INFLATE] != 0)
		json_save_var("inflate", value[e_value.INFLATE])
	
	var pos, rot, sca;
	pos = point3D(value[e_value.POS_X], value[e_value.POS_Y], value[e_value.POS_Z])
	rot = point3D(value[e_value.ROT_X], value[e_value.ROT_Y], value[e_value.ROT_Z])
	sca = point3D(value[e_value.SCA_X], value[e_value.SCA_Y], value[e_value.SCA_Z])
	
	if (!array_compare_value(pos, 0))
		json_save_var_point3D("position", pos)
	
	if (!array_compare_value(rot, 0))
		json_save_var_point3D("rotation", rot)
	
	if (!array_compare_value(sca, 1))
		json_save_var_point3D("scale", sca)
	
	if (value[e_value.TEX_MIRROR])
		json_save_var_bool("texture_mirror", true)
	
	if (value[e_value.INVERT])
		json_save_var_bool("invert", true)
	
	if (value[e_value.FACE_CAMERA])
		json_save_var_bool("face_camera", true)
	
	if (value[e_value.HOVER])
		json_save_var_bool("item_bounce", true)
	
	if (!value[e_value.BEND_SHAPE])
		json_save_var_bool("bend", false)
	
	if (type = "plane")
	{
		if (value[e_value.HIDE_FRONT])
			json_save_var_bool("hide_front", true)
		
		if (value[e_value.HIDE_BACK])
			json_save_var_bool("hide_back", true)
		
		if (value[e_value.EXTRUDE])
			json_save_var_bool("3d", true)
	}
	
	if (locked)
		json_save_var_bool("locked", true)
	
	if (hidden)
		json_save_var_bool("visible", false)
	
	model_save_wind()
}

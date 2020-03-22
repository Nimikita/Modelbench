/// export_save_mtl()

var str = "";

str += "# Modelbench MTL file" + "\n"

with (obj_texture)
{
	if (!export_save_tex)
		continue
	
	str += "newmtl " + filename_change_ext(filename, "") + "\n"
	str += "map_Kd " + filename + "\n"
	str += "-blendu off" + "\n"
	str += "-blendv off" + "\n"
	
	str += "\n"
	
	sprite_save(sprite, 0, filename_dir(app.export_mtl_fn) + "\\" + filename)
	
	export_save_tex = false
}

var file = file_text_open_write(export_mtl_fn)
file_text_write_string(file, str)
file_text_close(file)

log(".obj export: Exported MTL", export_mtl_fn)

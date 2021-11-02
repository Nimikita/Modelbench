/// export_save_mtl()

var str, fnfilter;
str = ""

str += "# Modelbench MTL file" + "\n"

with (obj_texture)
{
	if (!export_save_tex)
		continue
	
	fnfilter = string_replace_all(filename, " ", "_")
	str += "newmtl " + filename_change_ext(fnfilter, "") + "\n"
	str += "map_Kd " + fnfilter + "\n"
	
	str += "\n"
	
	sprite_save_lib(sprite, 0, filename_dir(app.export_mtl_fn) + "\\" + fnfilter)
	
	export_save_tex = false
}

var file = file_text_open_write(export_mtl_fn)
file_text_write_string(file, str)
file_text_close(file)

log(".obj export: Exported MTL", export_mtl_fn)

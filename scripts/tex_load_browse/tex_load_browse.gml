/// tex_load_browse()
/// @desc Browses for an external texture to load.

var fn = file_dialog_open_image();

if (!file_exists_lib(fn))
	return ""

return fn

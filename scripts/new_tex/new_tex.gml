/// new_tex(filename)
/// @arg filename
/// @desc Adds a new texture or replaces an existing one. Returns the new texture instance.

var fn, tex, newfn, replaced;
fn = argument0
tex = null
replaced = false
newfn = model_folder + "\\" + filename_name(fn)

// Check replace
with (obj_texture)
{
	if (filename = filename_name(fn))
	{
		tex = id
		break
	}
}

var copied = false;
if (tex != null)
{
	if (question(text_get("questionreplace")))
		replaced = true
	else
	{
		tex = null
		newfn = filename_get_unique(newfn)
		copied = true
		file_copy(fn, newfn)
	}
}

// Add new
if (tex = null)
{
	tex = new(obj_texture)
	tex.copied = copied
}

tex.filename = filename_name(newfn)
tex.replaced = replaced
if (copied)
	load_folder = model_folder
else
	load_folder = filename_dir(fn)
save_folder = model_folder

log("Added texture")
log("filename", tex.filename)

return tex
/// file_dnd_set_enabled(enable)
/// @arg enable

function file_dnd_set_enabled(fn)
{
	return external_call(lib_file_dnd_set_enabled, fn)
}

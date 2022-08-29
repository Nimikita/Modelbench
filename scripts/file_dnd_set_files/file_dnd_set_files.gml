/// file_dnd_set_files(extensions, allow_files, allow_multi)
/// @arg extensions
/// @arg allow_files
/// @arg allow_multi
/// @desc 'extensions' follow "*.png;*.jpg;*.jpeg;*.gif" syntax for input

function file_dnd_set_files(exts, allow_files, allow_multi)
{
	return external_call(lib_file_dnd_set_files, exts, allow_files, allow_multi)
}

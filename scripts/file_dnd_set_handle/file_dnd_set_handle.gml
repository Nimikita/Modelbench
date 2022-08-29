/// file_dnd_set_handle(window_handle)
/// @arg window_handle

function file_dnd_set_handle(handle)
{
	return external_call(lib_file_dnd_set_handle, handle)
}
